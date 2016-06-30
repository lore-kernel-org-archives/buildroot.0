From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 30 Jun 2016 12:13:38 +0200
Subject: [Buildroot] [git commit] makedevs: add capability support
Message-ID: <20160630102354.D80BF820FE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=688059ebb23227fb13aad319df6e78686ea6e14a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add the support of capability to makedevs as extended attribute.
Now, it's possible to add a  line "|xattr <capability>" after a
file description to also add a capability to this file. It's
possible to add severals capabilities with severals lines.

[Peter: extend doc, reword Config.in, extend error message,
	use HOST_MAKEDEVS_CFLAGS/LDFLAGS for all flags]
Signed-off-by: Philippe Reynes <philippe.reynes@sagemcom.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/manual/makedev-syntax.txt | 30 ++++++++++++++++++
 package/makedevs/makedevs.c    | 72 ++++++++++++++++++++++++++++++++++++++++--
 package/makedevs/makedevs.mk   | 13 ++++++--
 system/Config.in               |  5 +++
 4 files changed, 116 insertions(+), 4 deletions(-)

diff --git a/docs/manual/makedev-syntax.txt b/docs/manual/makedev-syntax.txt
index e4dffc9..d6efb31 100644
--- a/docs/manual/makedev-syntax.txt
+++ b/docs/manual/makedev-syntax.txt
@@ -71,3 +71,33 @@ and then for device files corresponding to the partitions of
 /dev/hda b 640 root root 3 1 1 1 15
 ----
 
+Extended attributes are supported if
++BR2_ROOTFS_DEVICE_TABLE_SUPPORTS_EXTENDED_ATTRIBUTES+ is enabled.
+This is done by adding a line starting with +|xattr+ after
+the line describing the file. Right now, only capability
+is supported as extended attribute.
+
+|=====================
+| \|xattr | capability
+|=====================
+
+- +|xattr+ is a "flag" that indicate an extended attribute
+- +capability+ is a capability to add to the previous file
+
+If you want to add the capability cap_sys_admin to the binary foo,
+you will write :
+
+----
+/usr/bin/foo f 755 root root - - - - -
+|xattr cap_sys_admin+eip
+----
+
+You can add several capabilities to a file by using several +|xattr+ lines.
+If you want to add the capability cap_sys_admin and cap_net_admin to the
+binary foo, you will write :
+
+----
+/usr/bin/foo f 755 root root - - - - -
+|xattr cap_sys_admin+eip
+|xattr cap_net_admin+eip
+----
diff --git a/package/makedevs/makedevs.c b/package/makedevs/makedevs.c
index e5ef164..cacb144 100644
--- a/package/makedevs/makedevs.c
+++ b/package/makedevs/makedevs.c
@@ -35,6 +35,9 @@
 #include <sys/sysmacros.h>     /* major() and minor() */
 #endif
 #include <ftw.h>
+#ifdef EXTENDED_ATTRIBUTES
+#include <sys/capability.h>
+#endif /* EXTENDED_ATTRIBUTES */
 
 const char *bb_applet_name;
 uid_t recursive_uid;
@@ -349,6 +352,49 @@ char *concat_path_file(const char *path, const char *filename)
 	return outbuf;
 }
 
+#ifdef EXTENDED_ATTRIBUTES
+int bb_set_xattr(const char *fpath, const char *xattr)
+{
+	cap_t cap, cap_file, cap_new;
+	char *cap_file_text, *cap_new_text;
+	ssize_t length;
+
+	cap = cap_from_text(xattr);
+	if (cap == NULL)
+		bb_perror_msg_and_die("cap_from_text failed for %s", xattr);
+
+	cap_file = cap_get_file(fpath);
+	if (cap_file == NULL) {
+		/* if no capability was set before, we initialize cap_file */
+		if (errno != ENODATA)
+			bb_perror_msg_and_die("cap_get_file failed on %s", fpath);
+
+		cap_file = cap_init();
+		if (!cap_file)
+			bb_perror_msg_and_die("cap_init failed");
+	}
+
+	if ((cap_file_text = cap_to_text(cap_file, &length)) == NULL)
+		bb_perror_msg_and_die("cap_to_name failed on %s", fpath);
+
+	bb_xasprintf(&cap_new_text, "%s %s", cap_file_text, xattr);
+
+	if ((cap_new = cap_from_text(cap_new_text)) == NULL)
+		bb_perror_msg_and_die("cap_from_text failed on %s", cap_new_text);
+
+	if (cap_set_file(fpath, cap_new) == -1)
+		bb_perror_msg_and_die("cap_set_file failed for %s (xattr = %s)", fpath, xattr);
+
+	cap_free(cap);
+	cap_free(cap_file);
+	cap_free(cap_file_text);
+	cap_free(cap_new);
+	cap_free(cap_new_text);
+
+	return 0;
+}
+#endif /* EXTENDED_ATTRIBUTES */
+
 void bb_show_usage(void)
 {
 	fprintf(stderr, "%s: [-d device_table] rootdir\n\n", bb_applet_name);
@@ -413,6 +459,7 @@ int main(int argc, char **argv)
 	int opt;
 	FILE *table = stdin;
 	char *rootdir = NULL;
+	char *full_name = NULL;
 	char *line = NULL;
 	int linenum = 0;
 	int ret = EXIT_SUCCESS;
@@ -454,15 +501,30 @@ int main(int argc, char **argv)
 		unsigned int count = 0;
 		unsigned int increment = 0;
 		unsigned int start = 0;
+		char xattr[255];
 		char name[4096];
 		char user[41];
 		char group[41];
-		char *full_name;
 		uid_t uid;
 		gid_t gid;
 
 		linenum++;
 
+		if (1 == sscanf(line, "|xattr %254s", xattr)) {
+#ifdef EXTENDED_ATTRIBUTES
+			if (!full_name)
+				bb_error_msg_and_die("line %d should be after a file\n", linenum);
+
+			if (bb_set_xattr(full_name, xattr) < 0)
+				bb_error_msg_and_die("can't set cap %s on file %s\n", xattr, full_name);
+#else
+			bb_error_msg_and_die("line %d not supported: '%s'\nDid you forget to enable "
+					     "BR2_ROOTFS_DEVICE_TABLE_SUPPORTS_EXTENDED_ATTRIBUTES?\n",
+					     linenum, line);
+#endif /* EXTENDED_ATTRIBUTES */
+			continue;
+		}
+
 		if ((2 > sscanf(line, "%4095s %c %o %40s %40s %u %u %u %u %u", name,
 						&type, &mode, user, group, &major,
 						&minor, &start, &increment, &count)) ||
@@ -487,6 +549,13 @@ int main(int argc, char **argv)
 		} else {
 			uid = getuid();
 		}
+
+		/*
+		 * free previous full name
+		 * we don't de-allocate full_name at the end of the parsing,
+		 * because we may need it if the next line is an xattr.
+		 */
+		free(full_name);
 		full_name = concat_path_file(rootdir, name);
 
 		if (type == 'd') {
@@ -585,7 +654,6 @@ int main(int argc, char **argv)
 		}
 loop:
 		free(line);
-		free(full_name);
 	}
 	fclose(table);
 
diff --git a/package/makedevs/makedevs.mk b/package/makedevs/makedevs.mk
index fa8e753..130f5bc 100644
--- a/package/makedevs/makedevs.mk
+++ b/package/makedevs/makedevs.mk
@@ -11,6 +11,15 @@ HOST_MAKEDEVS_SOURCE =
 MAKEDEVS_VERSION = buildroot-$(BR2_VERSION)
 MAKEDEVS_LICENSE = GPLv2
 
+HOST_MAKEDEVS_CFLAGS = $(HOST_CFLAGS)
+HOST_MAKEDEVS_LDFLAGS = $(HOST_LDFLAGS)
+
+ifeq ($(BR2_ROOTFS_DEVICE_TABLE_SUPPORTS_EXTENDED_ATTRIBUTES),y)
+HOST_MAKEDEVS_DEPENDENCIES += host-libcap
+HOST_MAKEDEVS_CFLAGS += -DEXTENDED_ATTRIBUTES
+HOST_MAKEDEVS_LDFLAGS += -lcap
+endif
+
 define MAKEDEVS_BUILD_CMDS
 	$(TARGET_CC) $(TARGET_CFLAGS) $(TARGET_LDFLAGS) \
 		package/makedevs/makedevs.c -o $(@D)/makedevs
@@ -21,8 +30,8 @@ define MAKEDEVS_INSTALL_TARGET_CMDS
 endef
 
 define HOST_MAKEDEVS_BUILD_CMDS
-	$(HOSTCC) $(HOST_CFLAGS) $(HOST_LDFLAGS) \
-		package/makedevs/makedevs.c -o $(@D)/makedevs
+	$(HOSTCC) $(HOST_MAKEDEVS_CFLAGS) package/makedevs/makedevs.c \
+		-o $(@D)/makedevs $(HOST_MAKEDEVS_LDFLAGS)
 endef
 
 define HOST_MAKEDEVS_INSTALL_CMDS
diff --git a/system/Config.in b/system/Config.in
index 3018b0a..15d5b55 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -162,6 +162,11 @@ config BR2_ROOTFS_STATIC_DEVICE_TABLE
 	  See package/makedevs/README for details on the usage and
 	  syntax of these files.
 
+config BR2_ROOTFS_DEVICE_TABLE_SUPPORTS_EXTENDED_ATTRIBUTES
+	bool "support extended attributes in device tables"
+	help
+	  Support extended attributes handling in device tables
+
 choice
 	prompt "Root FS skeleton"
 
