From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon,  8 Jun 2020 19:18:24 +0200
Subject: [Buildroot] [PATCH 1/1] package/util-linux: bump to version 2.35.2
Message-ID: <20200608171824.106106-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Drop fourth and sixth patches (already in version)
- Update indentation in hash file (two spaces)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...0004-include-cleanup-pidfd-inckudes.patch} |   0
 ...-types.h-before-checking-SYS_pidfd_s.patch |  62 --------
 ...t-sector-size-ignore-unknown-headers.patch | 138 ------------------
 package/util-linux/util-linux.hash            |  14 +-
 package/util-linux/util-linux.mk              |   2 +-
 5 files changed, 8 insertions(+), 208 deletions(-)
 rename package/util-linux/{0005-include-cleanup-pidfd-inckudes.patch => 0004-include-cleanup-pidfd-inckudes.patch} (100%)
 delete mode 100644 package/util-linux/0004-kill-include-sys-types.h-before-checking-SYS_pidfd_s.patch
 delete mode 100644 package/util-linux/0006-libfdisk-script-accept-sector-size-ignore-unknown-headers.patch

diff --git a/package/util-linux/0005-include-cleanup-pidfd-inckudes.patch b/package/util-linux/0004-include-cleanup-pidfd-inckudes.patch
similarity index 100%
rename from package/util-linux/0005-include-cleanup-pidfd-inckudes.patch
rename to package/util-linux/0004-include-cleanup-pidfd-inckudes.patch
diff --git a/package/util-linux/0004-kill-include-sys-types.h-before-checking-SYS_pidfd_s.patch b/package/util-linux/0004-kill-include-sys-types.h-before-checking-SYS_pidfd_s.patch
deleted file mode 100644
index 183b725a32..0000000000
--- a/package/util-linux/0004-kill-include-sys-types.h-before-checking-SYS_pidfd_s.patch
+++ /dev/null
@@ -1,62 +0,0 @@
-From 3cfde0370d3a8949df0c5bcf447cec6692910ed2 Mon Sep 17 00:00:00 2001
-From: Sami Kerola <kerolasa@iki.fi>
-Date: Sat, 15 Feb 2020 21:12:50 +0000
-Subject: [PATCH] kill: include sys/types.h before checking
- SYS_pidfd_send_signal
-
-Including sys/types.h must happen before SYS_pidfd_send_signal is checked,
-because that header defines variable in normal conditions.  When sys/types.h
-does not have SYS_pidfd_send_signal then fallback is defined in config.h
-that is included by default, and has therefore worked fine before and after
-this change.
-
-Signed-off-by: Sami Kerola <kerolasa@iki.fi>
-Signed-off-by: Carlos Santos <unixmania@gmail.com>
----
- include/pidfd-utils.h | 18 ++++++++++--------
- 1 file changed, 10 insertions(+), 8 deletions(-)
-
-diff --git a/include/pidfd-utils.h b/include/pidfd-utils.h
-index 593346576..0baedd2c9 100644
---- a/include/pidfd-utils.h
-+++ b/include/pidfd-utils.h
-@@ -1,26 +1,28 @@
- #ifndef UTIL_LINUX_PIDFD_UTILS
- #define UTIL_LINUX_PIDFD_UTILS
- 
--#if defined(__linux__) && defined(SYS_pidfd_send_signal)
--# include <sys/types.h>
-+#if defined(__linux__)
- # include <sys/syscall.h>
-+# if defined(SYS_pidfd_send_signal)
-+#  include <sys/types.h>
- 
--# ifndef HAVE_PIDFD_OPEN
-+#  ifndef HAVE_PIDFD_OPEN
- static inline int pidfd_send_signal(int pidfd, int sig, siginfo_t *info,
- 				    unsigned int flags)
- {
- 	return syscall(SYS_pidfd_send_signal, pidfd, sig, info, flags);
- }
--# endif
-+#  endif
- 
--# ifndef HAVE_PIDFD_SEND_SIGNAL
-+#  ifndef HAVE_PIDFD_SEND_SIGNAL
- static inline int pidfd_open(pid_t pid, unsigned int flags)
- {
- 	return syscall(SYS_pidfd_open, pid, flags);
- }
--# endif
-+#  endif
- 
--# define UL_HAVE_PIDFD 1
-+#  define UL_HAVE_PIDFD 1
- 
--#endif /* __linux__ && SYS_pidfd_send_signal */
-+# endif	/* SYS_pidfd_send_signal */
-+#endif /* __linux__ */
- #endif /* UTIL_LINUX_PIDFD_UTILS */
--- 
-2.18.2
-
diff --git a/package/util-linux/0006-libfdisk-script-accept-sector-size-ignore-unknown-headers.patch b/package/util-linux/0006-libfdisk-script-accept-sector-size-ignore-unknown-headers.patch
deleted file mode 100644
index d592a9dc18..0000000000
--- a/package/util-linux/0006-libfdisk-script-accept-sector-size-ignore-unknown-headers.patch
+++ /dev/null
@@ -1,138 +0,0 @@
-From d8c68b52cc939a16f04ec976648a37f5f5de718c Mon Sep 17 00:00:00 2001
-From: Karel Zak <kzak@redhat.com>
-Date: Tue, 4 Feb 2020 15:11:19 +0100
-Subject: libfdisk: (script) accept sector-size, ignore unknown headers
-
-- add sector-size between supported headers (already in --dump output)
-
-- report unknown headers by -ENOTSUP
-
-- ignore ENOTSUP in sfdisk (but print warning) and in fdisk_script_read_file()
-
-Addresses: https://github.com/karelzak/util-linux/issues/949
-Signed-off-by: Karel Zak <kzak@redhat.com>
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Retrieved from:
-https://git.kernel.org/pub/scm/utils/util-linux/util-linux.git/commit/?id=d8c68b52cc939a16f04ec976648a37f5f5de718c]
----
- disk-utils/sfdisk.c   |  6 +++++-
- libfdisk/src/script.c | 49 ++++++++++++++++++++++++++-----------------------
- 2 files changed, 31 insertions(+), 24 deletions(-)
-
-diff --git a/disk-utils/sfdisk.c b/disk-utils/sfdisk.c
-index 0db797b2d..e08862aa8 100644
---- a/disk-utils/sfdisk.c
-+++ b/disk-utils/sfdisk.c
-@@ -1823,7 +1823,11 @@ static int command_fdisk(struct sfdisk *sf, int argc, char **argv)
- 		}
- 
- 		rc = fdisk_script_read_line(dp, stdin, buf, sizeof(buf));
--		if (rc < 0) {
-+		if (rc == -ENOTSUP) {
-+			buf[sizeof(buf) - 1] = '\0';
-+			fdisk_warnx(sf->cxt, _("Unknown script header '%s' -- ignore."), buf);
-+			continue;
-+		} else if (rc < 0) {
- 			DBG(PARSE, ul_debug("script parsing failed, trying sfdisk specific commands"));
- 			buf[sizeof(buf) - 1] = '\0';
- 			rc = loop_control_commands(sf, dp, buf);
-diff --git a/libfdisk/src/script.c b/libfdisk/src/script.c
-index a21771b6a..d3e67fa9c 100644
---- a/libfdisk/src/script.c
-+++ b/libfdisk/src/script.c
-@@ -805,8 +805,12 @@ static inline int is_header_line(const char *s)
- /* parses "<name>: value", note modifies @s*/
- static int parse_line_header(struct fdisk_script *dp, char *s)
- {
--	int rc = -EINVAL;
-+	size_t i;
- 	char *name, *value;
-+	static const char *supported[] = {
-+		"label", "unit", "label-id", "device", "grain",
-+		"first-lba", "last-lba", "table-length", "sector-size"
-+	};
- 
- 	DBG(SCRIPT, ul_debugobj(dp, "   parse header '%s'", s));
- 
-@@ -816,7 +820,7 @@ static int parse_line_header(struct fdisk_script *dp, char *s)
- 	name = s;
- 	value = strchr(s, ':');
- 	if (!value)
--		goto done;
-+		return -EINVAL;
- 	*value = '\0';
- 	value++;
- 
-@@ -825,32 +829,30 @@ static int parse_line_header(struct fdisk_script *dp, char *s)
- 	ltrim_whitespace((unsigned char *) value);
- 	rtrim_whitespace((unsigned char *) value);
- 
-+	if (!*name || !*value)
-+		return -EINVAL;
-+
-+	/* check header name */
-+	for (i = 0; i < ARRAY_SIZE(supported); i++) {
-+		if (strcmp(name, supported[i]) == 0)
-+			break;
-+	}
-+	if (i == ARRAY_SIZE(supported))
-+		return -ENOTSUP;
-+
-+	/* header specific actions */
- 	if (strcmp(name, "label") == 0) {
- 		if (dp->cxt && !fdisk_get_label(dp->cxt, value))
--			goto done;			/* unknown label name */
-+			return -EINVAL;			/* unknown label name */
- 		dp->force_label = 1;
-+
- 	} else if (strcmp(name, "unit") == 0) {
- 		if (strcmp(value, "sectors") != 0)
--			goto done;			/* only "sectors" supported */
--	} else if (strcmp(name, "label-id") == 0
--		   || strcmp(name, "device") == 0
--		   || strcmp(name, "grain") == 0
--		   || strcmp(name, "first-lba") == 0
--		   || strcmp(name, "last-lba") == 0
--		   || strcmp(name, "table-length") == 0) {
--		;					/* whatever is possible */
--	} else
--		goto done;				/* unknown header */
-+			return -EINVAL;			/* only "sectors" supported */
- 
--	if (*name && *value)
--		rc = fdisk_script_set_header(dp, name, value);
--done:
--	if (rc)
--		DBG(SCRIPT, ul_debugobj(dp, "header parse error: "
--				"[rc=%d, name='%s', value='%s']",
--				rc, name, value));
--	return rc;
-+	}
- 
-+	return fdisk_script_set_header(dp, name, value);
- }
- 
- /* returns zero terminated string with next token and @str is updated */
-@@ -1363,7 +1365,8 @@ int fdisk_script_set_fgets(struct fdisk_script *dp,
-  *
-  * Reads next line into dump.
-  *
-- * Returns: 0 on success, <0 on error, 1 when nothing to read.
-+ * Returns: 0 on success, <0 on error, 1 when nothing to read. For unknown headers
-+ *          returns -ENOTSUP, it's usually safe to ignore this error.
-  */
- int fdisk_script_read_line(struct fdisk_script *dp, FILE *f, char *buf, size_t bufsz)
- {
-@@ -1428,7 +1431,7 @@ int fdisk_script_read_file(struct fdisk_script *dp, FILE *f)
- 
- 	while (!feof(f)) {
- 		rc = fdisk_script_read_line(dp, f, buf, sizeof(buf));
--		if (rc)
-+		if (rc && rc != -ENOTSUP)
- 			break;
- 	}
- 
--- 
-cgit 1.2-0.3.lf.el7
-
diff --git a/package/util-linux/util-linux.hash b/package/util-linux/util-linux.hash
index f9a3d1e867..7f87dc9a17 100644
--- a/package/util-linux/util-linux.hash
+++ b/package/util-linux/util-linux.hash
@@ -1,9 +1,9 @@
 # From https://www.kernel.org/pub/linux/utils/util-linux/v2.35/sha256sums.asc
-sha256 d9de3edd287366cd908e77677514b9387b22bc7b88f45b83e1922c3597f1d7f9  util-linux-2.35.1.tar.xz
+sha256  21b7431e82f6bcd9441a01beeec3d57ed33ee948f8a5b41da577073c372eb58a  util-linux-2.35.2.tar.xz
 # License files, locally calculated
-sha256 869660b5269f4f40a8a679da7f403ea3a6e71d46087aab5e14871b09bcb55955  README.licensing
-sha256 9b718a9460fed5952466421235bc79eb49d4e9eacc920d7a9dd6285ab8fd6c6d  Documentation/licenses/COPYING.BSD-3-Clause
-sha256 ba7640f00d93e72e92b94b9d71f25ec53bac2f1682f5c4adcccb0018359f60f8  Documentation/licenses/COPYING.BSD-4-Clause-UC
-sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  Documentation/licenses/COPYING.GPL-2.0-or-later
-sha256 e53348ce276358e9997014071c5294b36a18c4b34f32f00ee57b9acce0aafd63  Documentation/licenses/COPYING.ISC
-sha256 dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  Documentation/licenses/COPYING.LGPL-2.1-or-later
+sha256  869660b5269f4f40a8a679da7f403ea3a6e71d46087aab5e14871b09bcb55955  README.licensing
+sha256  9b718a9460fed5952466421235bc79eb49d4e9eacc920d7a9dd6285ab8fd6c6d  Documentation/licenses/COPYING.BSD-3-Clause
+sha256  ba7640f00d93e72e92b94b9d71f25ec53bac2f1682f5c4adcccb0018359f60f8  Documentation/licenses/COPYING.BSD-4-Clause-UC
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  Documentation/licenses/COPYING.GPL-2.0-or-later
+sha256  e53348ce276358e9997014071c5294b36a18c4b34f32f00ee57b9acce0aafd63  Documentation/licenses/COPYING.ISC
+sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  Documentation/licenses/COPYING.LGPL-2.1-or-later
diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index b6ccaaa78d..6c8f295eed 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 UTIL_LINUX_VERSION_MAJOR = 2.35
-UTIL_LINUX_VERSION_MINOR = 1
+UTIL_LINUX_VERSION_MINOR = 2
 UTIL_LINUX_VERSION = $(UTIL_LINUX_VERSION_MAJOR).$(UTIL_LINUX_VERSION_MINOR)
 UTIL_LINUX_SOURCE = util-linux-$(UTIL_LINUX_VERSION).tar.xz
 UTIL_LINUX_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/util-linux/v$(UTIL_LINUX_VERSION_MAJOR)
-- 
2.26.2
