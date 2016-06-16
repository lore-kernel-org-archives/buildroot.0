From: Philippe Reynes <philippe.reynes@sagemcom.com>
Date: Thu, 16 Jun 2016 12:59:07 +0200
Subject: [Buildroot] [PATCH v2] makedevs: add capability support
Message-ID: <3d2f3fc0-cfff-4862-9507-1fd3630254cc@EXDRUEARSGC002.eq1sgc.local>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add the support of capability to makedevs as extended attribute.
Now, it's possible to add a  line "|xattr <capability>" after a
file description to also add a capability to this file. It's
possible to add severals capabilities with severals lines.

Signed-off-by: Philippe Reynes <philippe.reynes@sagemcom.com>
---
Changelog:
v2:
- add an option to enable (or not) xattr support in makedevs
- update makedevs code to handle |xattr on the first line
- add documentation about xattr support in makedevs

 docs/manual/makedev-syntax.txt |   28 ++++++++++++++
 package/makedevs/makedevs.c    |   80 +++++++++++++++++++++++++++++++++++++++-
 package/makedevs/makedevs.mk   |   10 ++++-
 system/Config.in               |    5 +++
 4 files changed, 119 insertions(+), 4 deletions(-)

diff --git a/docs/manual/makedev-syntax.txt b/docs/manual/makedev-syntax.txt
index e4dffc9..dd7bfdb 100644
--- a/docs/manual/makedev-syntax.txt
+++ b/docs/manual/makedev-syntax.txt
@@ -71,3 +71,31 @@ and then for device files corresponding to the partitions of
 /dev/hda b 640 root root 3 1 1 1 15
 ----
 
+The tool makedevs supports extended attributes for a file.
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
+If you want to add the capability cap_sys_admin to the binary foo, you will write :
+
+----
+/usr/bin/foo f 755 root root - - - - -
+|xattr cap_sys_admin+eip
+----
+
+You can add severals capabilities to a file by using severals +|xattr+ lines.
+If you want to add the capability cap_sys_admin and cap_net_admin to the binary foo,
+you will write :
+
+----
+/usr/bin/foo f 755 root root - - - - -
+|xattr cap_sys_admin+eip
+|xattr cap_net_admin+eip
+----
diff --git a/package/makedevs/makedevs.c b/package/makedevs/makedevs.c
index e5ef164..e2d084f 100644
--- a/package/makedevs/makedevs.c
+++ b/package/makedevs/makedevs.c
@@ -35,6 +35,7 @@
 #include <sys/sysmacros.h>     /* major() and minor() */
 #endif
 #include <ftw.h>
+#include <sys/capability.h>
 
 const char *bb_applet_name;
 uid_t recursive_uid;
@@ -349,6 +350,57 @@ char *concat_path_file(const char *path, const char *filename)
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
+	if (cap == NULL) {
+		bb_perror_msg("cap_from_text failed for %s", xattr);
+		return -1;
+	}
+
+	cap_file = cap_get_file(fpath);
+	if (cap_file == NULL) {
+		/* if no capability was set before, we initialize cap_file */
+		if (errno == ENODATA) {
+			cap_file = cap_init();
+		} else {
+			bb_perror_msg("cap_get_file failed on %s", fpath);
+			return -1;
+		}
+	}
+
+	if ((cap_file_text = cap_to_text(cap_file, &length)) == NULL) {
+		bb_perror_msg("cap_to_name failed on %s", fpath);
+		return -1;
+	}
+
+	bb_xasprintf(&cap_new_text, "%s %s", cap_file_text, xattr);
+
+	if ((cap_new = cap_from_text(cap_new_text)) == NULL) {
+		bb_perror_msg("cap_from_text failed on %s", cap_new_text);
+		return -1;
+	}
+
+	if (cap_set_file(fpath, cap_new) == -1) {
+		bb_perror_msg("cap_set_file failed for %s (xattr = %s)", fpath, xattr);
+		return -1;
+	}
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
@@ -413,6 +465,7 @@ int main(int argc, char **argv)
 	int opt;
 	FILE *table = stdin;
 	char *rootdir = NULL;
+	char *full_name = NULL;
 	char *line = NULL;
 	int linenum = 0;
 	int ret = EXIT_SUCCESS;
@@ -454,15 +507,32 @@ int main(int argc, char **argv)
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
 
+		if (1 == sscanf(line, "|xattr %254s", xattr))
+		{
+#ifdef EXTENDED_ATTRIBUTES
+			if (!full_name) {
+				bb_error_msg("line %d should be after a file\n", linenum);
+				ret = EXIT_FAILURE;
+			} else {
+				if (bb_set_xattr(full_name, xattr) < 0)
+					ret = EXIT_FAILURE;
+			}
+#else
+			bb_error_msg("line %d not supported: '%s'\n", linenum, line);
+			ret = EXIT_FAILURE;
+#endif /* EXTENDED_ATTRIBUTES */
+			continue;
+		}
+
 		if ((2 > sscanf(line, "%4095s %c %o %40s %40s %u %u %u %u %u", name,
 						&type, &mode, user, group, &major,
 						&minor, &start, &increment, &count)) ||
@@ -487,6 +557,13 @@ int main(int argc, char **argv)
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
@@ -585,7 +662,6 @@ int main(int argc, char **argv)
 		}
 loop:
 		free(line);
-		free(full_name);
 	}
 	fclose(table);
 
diff --git a/package/makedevs/makedevs.mk b/package/makedevs/makedevs.mk
index fa8e753..b2efda9 100644
--- a/package/makedevs/makedevs.mk
+++ b/package/makedevs/makedevs.mk
@@ -11,6 +11,12 @@ HOST_MAKEDEVS_SOURCE =
 MAKEDEVS_VERSION = buildroot-$(BR2_VERSION)
 MAKEDEVS_LICENSE = GPLv2
 
+ifeq ($(BR2_ROOTFS_DEVICE_TABLE_SUPPORTS_EXTENDED_ATTRIBUTES),y)
+HOST_MAKEDEVS_DEPENDENCIES += host-libcap
+HOST_MAKEDEVS_CFLAGS = -DEXTENDED_ATTRIBUTES
+HOST_MAKEDEVS_LDFLAGS = -lcap
+endif
+
 define MAKEDEVS_BUILD_CMDS
 	$(TARGET_CC) $(TARGET_CFLAGS) $(TARGET_LDFLAGS) \
 		package/makedevs/makedevs.c -o $(@D)/makedevs
@@ -21,8 +27,8 @@ define MAKEDEVS_INSTALL_TARGET_CMDS
 endef
 
 define HOST_MAKEDEVS_BUILD_CMDS
-	$(HOSTCC) $(HOST_CFLAGS) $(HOST_LDFLAGS) \
-		package/makedevs/makedevs.c -o $(@D)/makedevs
+	$(HOSTCC) $(HOST_CFLAGS) $(HOST_LDFLAGS) $(HOST_MAKEDEVS_CFLAGS) \
+		package/makedevs/makedevs.c -o $(@D)/makedevs $(HOST_MAKEDEVS_LDFLAGS)
 endef
 
 define HOST_MAKEDEVS_INSTALL_CMDS
diff --git a/system/Config.in b/system/Config.in
index 9441467..a0ccc77 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -162,6 +162,11 @@ config BR2_ROOTFS_STATIC_DEVICE_TABLE
 	  See package/makedevs/README for details on the usage and
 	  syntax of these files.
 
+config BR2_ROOTFS_DEVICE_TABLE_SUPPORTS_EXTENDED_ATTRIBUTES
+	bool "device table supports extended attributes"
+	help
+	  Add the support of extended attributes to device table
+
 choice
 	prompt "Root FS skeleton"
 
-- 
1.7.9.5


#
" Ce courriel et les documents qui lui sont joints peuvent contenir des
informations confidentielles ou ayant un caract?? priv??S'ils ne vous sont
pas destin?? nous vous signalons qu'il est strictement interdit de les
divulguer, de les reproduire ou d'en utiliser de quelque mani?? que ce
soit le contenu. Si ce message vous a ?? transmis par erreur, merci d'en
informer l'exp??teur et de supprimer imm??atement de votre syst??
informatique ce courriel ainsi que tous les documents qui y sont attach??"


                               ******

" This e-mail and any attached documents may contain confidential or
proprietary information. If you are not the intended recipient, you are
notified that any dissemination, copying of this e-mail and any attachments
thereto or use of their contents by any means whatsoever is strictly
prohibited. If you have received this e-mail in error, please advise the
sender immediately and delete this e-mail and all attached documents
from your computer system."
#
