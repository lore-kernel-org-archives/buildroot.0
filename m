From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 20 Feb 2015 09:10:19 -0300
Subject: [Buildroot] [PATCH] util-linux: bump to version 2.26
Message-ID: <1424434219-9898-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/util-linux/0001-sscanf-no-ms-as.patch   |  52 ++------
 package/util-linux/0004-fix-CVE-2014-9114.patch | 168 ------------------------
 package/util-linux/Config.in                    |   5 +
 package/util-linux/util-linux.hash              |   4 +-
 package/util-linux/util-linux.mk                |  12 +-
 5 files changed, 24 insertions(+), 217 deletions(-)
 delete mode 100644 package/util-linux/0004-fix-CVE-2014-9114.patch

diff --git a/package/util-linux/0001-sscanf-no-ms-as.patch b/package/util-linux/0001-sscanf-no-ms-as.patch
index be2b0eb..81b2be5 100644
--- a/package/util-linux/0001-sscanf-no-ms-as.patch
+++ b/package/util-linux/0001-sscanf-no-ms-as.patch
@@ -3,58 +3,24 @@ Fix libmount build under uClibc
 See https://bugs.gentoo.org/show_bug.cgi?id=406303
 http://sources.gentoo.org/cgi-bin/viewvc.cgi/gentoo-x86/sys-apps/util-linux/files/util-linux-2.21.1-no-printf-alloc.patch?revision=1.2
 
-[Gustavo: Ported to util-linux-2.25.1]
+[Gustavo: Ported to util-linux-2.26]
 
 Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 
-diff -Nura util-linux-2.25.1.orig/configure.ac util-linux-2.25.1/configure.ac
---- util-linux-2.25.1.orig/configure.ac	2014-09-05 10:44:45.302080174 -0300
-+++ util-linux-2.25.1/configure.ac	2014-09-05 10:45:07.183832640 -0300
-@@ -791,7 +791,6 @@
+diff -Nura util-linux-2.26.orig/configure.ac util-linux-2.26/configure.ac
+--- util-linux-2.26.orig/configure.ac	2015-02-19 09:11:13.146192401 -0300
++++ util-linux-2.26/configure.ac	2015-02-20 08:13:32.740006582 -0300
+@@ -840,7 +840,6 @@
+ )
  UL_BUILD_INIT([libmount])
- UL_REQUIRES_LINUX([libmount])
  UL_REQUIRES_BUILD([libmount], [libblkid])
 -UL_REQUIRES_HAVE([libmount], [scanf_alloc_modifier], [scanf string alloc modifier])
  AM_CONDITIONAL([BUILD_LIBMOUNT], [test "x$build_libmount" = xyes])
  AM_CONDITIONAL([BUILD_LIBMOUNT_TESTS], [test "x$build_libmount" = xyes -a "x$enable_static" = xyes])
  
-diff -Nura util-linux-2.25.1.orig/lib/colors.c util-linux-2.25.1/lib/colors.c
---- util-linux-2.25.1.orig/lib/colors.c	2014-09-05 10:44:45.301080140 -0300
-+++ util-linux-2.25.1/lib/colors.c	2014-09-05 13:12:00.175205476 -0300
-@@ -16,6 +16,10 @@
- #include "pathnames.h"
- #include "strutils.h"
- 
-+#ifndef HAVE_SCANF_MS_MODIFIER
-+# define UL_SCNsA "%s"
-+#endif
-+
- /*
-  * terminal-colors.d file types
-  */
-@@ -577,9 +581,19 @@
- 		if (*p == '\0' || *p == '#')
- 			continue;
- 
-+#ifndef HAVE_SCANF_MS_MODIFIER
-+		size_t len = strlen(p) + 1;
-+		cn = malloc(len);
-+		seq = malloc(len);
-+#endif
-+
- 		rc = sscanf(p,  UL_SCNsA" "	/* name */
- 				UL_SCNsA,	/* color */
-+#ifdef HAVE_SCANF_MS_MODIFIER
- 				&cn, &seq);
-+#else
-+				cn, seq);
-+#endif
- 		if (rc == 2 && cn && seq)
- 			rc = colors_add_scheme(cc, cn, seq);	/* set rc=0 on success */
- 		if (rc) {
-diff -Nura util-linux-2.25.1.orig/libmount/src/tab_parse.c util-linux-2.25.1/libmount/src/tab_parse.c
---- util-linux-2.25.1.orig/libmount/src/tab_parse.c	2014-09-05 10:44:45.276079280 -0300
-+++ util-linux-2.25.1/libmount/src/tab_parse.c	2014-09-05 10:51:22.500738967 -0300
+diff -Nura util-linux-2.26.orig/libmount/src/tab_parse.c util-linux-2.26/libmount/src/tab_parse.c
+--- util-linux-2.26.orig/libmount/src/tab_parse.c	2015-02-16 09:57:34.070017496 -0300
++++ util-linux-2.26/libmount/src/tab_parse.c	2015-02-20 08:13:32.741006617 -0300
 @@ -22,6 +22,10 @@
  #include "pathnames.h"
  #include "strutils.h"
diff --git a/package/util-linux/0004-fix-CVE-2014-9114.patch b/package/util-linux/0004-fix-CVE-2014-9114.patch
deleted file mode 100644
index 95cb1c5..0000000
--- a/package/util-linux/0004-fix-CVE-2014-9114.patch
+++ /dev/null
@@ -1,168 +0,0 @@
-From 89e90ae7b2826110ea28c1c0eb8e7c56c3907bdc Mon Sep 17 00:00:00 2001
-From: Karel Zak <kzak@redhat.com>
-Date: Thu, 27 Nov 2014 13:39:35 +0100
-Subject: [PATCH] libblkid: care about unsafe chars in cache
-
-The high-level libblkid API uses /run/blkid/blkid.tab cache to
-store probing results. The cache format is
-
-   <device NAME="value" ...>devname</device>
-
-and unfortunately the cache code does not escape quotation marks:
-
-   # mkfs.ext4 -L 'AAA"BBB'
-
-   # cat /run/blkid/blkid.tab
-   ...
-   <device ... LABEL="AAA"BBB" ...>/dev/sdb1</device>
-
-such string is later incorrectly parsed and blkid(8) returns
-nonsenses. And for use-cases like
-
-   # eval $(blkid -o export /dev/sdb1)
-
-it's also insecure.
-
-Note that mount, udevd and blkid -p are based on low-level libblkid
-API, it bypass the cache and directly read data from the devices.
-
-The current udevd upstream does not depend on blkid(8) output at all,
-it's directly linked with the library and all unsafe chars are encoded by
-\x<hex> notation.
-
-   # mkfs.ext4 -L 'X"`/tmp/foo` "' /dev/sdb1
-   # udevadm info --export-db | grep LABEL
-   ...
-   E: ID_FS_LABEL=X__/tmp/foo___
-   E: ID_FS_LABEL_ENC=X\x22\x60\x2ftmp\x2ffoo\x60\x20\x22
-
-Signed-off-by: Karel Zak <kzak@redhat.com>
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
----
- libblkid/src/read.c | 21 ++++++++++++++++++---
- libblkid/src/save.c | 22 +++++++++++++++++++++-
- misc-utils/blkid.8  |  5 ++++-
- misc-utils/blkid.c  |  4 ++--
- 4 files changed, 45 insertions(+), 7 deletions(-)
-
-diff --git a/libblkid/src/read.c b/libblkid/src/read.c
-index 0e91c9c..81ab0df 100644
---- a/libblkid/src/read.c
-+++ b/libblkid/src/read.c
-@@ -252,15 +252,30 @@ static int parse_token(char **name, char **value, char **cp)
- 	*value = skip_over_blank(*value + 1);
- 
- 	if (**value == '"') {
--		end = strchr(*value + 1, '"');
--		if (!end) {
-+		char *p = end = *value + 1;
-+
-+		/* convert 'foo\"bar'  to 'foo"bar' */
-+		while (*p) {
-+			if (*p == '\\') {
-+				p++;
-+				*end = *p;
-+			} else {
-+				*end = *p;
-+				if (*p == '"')
-+					break;
-+			}
-+			p++;
-+			end++;
-+		}
-+
-+		if (*end != '"') {
- 			DBG(READ, ul_debug("unbalanced quotes at: %s", *value));
- 			*cp = *value;
- 			return -BLKID_ERR_CACHE;
- 		}
- 		(*value)++;
- 		*end = '\0';
--		end++;
-+		end = ++p;
- 	} else {
- 		end = skip_over_word(*value);
- 		if (*end) {
-diff --git a/libblkid/src/save.c b/libblkid/src/save.c
-index 8216f09..5e8bbee 100644
---- a/libblkid/src/save.c
-+++ b/libblkid/src/save.c
-@@ -26,6 +26,21 @@
- 
- #include "blkidP.h"
- 
-+
-+static void save_quoted(const char *data, FILE *file)
-+{
-+	const char *p;
-+
-+	fputc('"', file);
-+	for (p = data; p && *p; p++) {
-+		if ((unsigned char) *p == 0x22 ||		/* " */
-+		    (unsigned char) *p == 0x5c)			/* \ */
-+			fputc('\\', file);
-+
-+		fputc(*p, file);
-+	}
-+	fputc('"', file);
-+}
- static int save_dev(blkid_dev dev, FILE *file)
- {
- 	struct list_head *p;
-@@ -43,9 +58,14 @@ static int save_dev(blkid_dev dev, FILE *file)
- 
- 	if (dev->bid_pri)
- 		fprintf(file, " PRI=\"%d\"", dev->bid_pri);
-+
- 	list_for_each(p, &dev->bid_tags) {
- 		blkid_tag tag = list_entry(p, struct blkid_struct_tag, bit_tags);
--		fprintf(file, " %s=\"%s\"", tag->bit_name,tag->bit_val);
-+
-+		fputc(' ', file);			/* space between tags */
-+		fputs(tag->bit_name, file);		/* tag NAME */
-+		fputc('=', file);			/* separator between NAME and VALUE */
-+		save_quoted(tag->bit_val, file);	/* tag "VALUE" */
- 	}
- 	fprintf(file, ">%s</device>\n", dev->bid_name);
- 
-diff --git a/misc-utils/blkid.8 b/misc-utils/blkid.8
-index 156a14b..c95b833 100644
---- a/misc-utils/blkid.8
-+++ b/misc-utils/blkid.8
-@@ -200,7 +200,10 @@ partitions.  This output format is \fBDEPRECATED\fR.
- .TP
- .B export
- print key=value pairs for easy import into the environment; this output format
--is automatically enabled when I/O Limits (\fB-i\fR option) are requested
-+is automatically enabled when I/O Limits (\fB-i\fR option) are requested.
-+
-+The non-printing characters are encoded by ^ and M- notation and all
-+potentially unsafe characters are escaped.
- .RE
- .TP
- .BI \-O " offset"
-diff --git a/misc-utils/blkid.c b/misc-utils/blkid.c
-index a6ca660..1bd8646 100644
---- a/misc-utils/blkid.c
-+++ b/misc-utils/blkid.c
-@@ -306,7 +306,7 @@ static void print_value(int output, int num, const char *devname,
- 			printf("DEVNAME=%s\n", devname);
- 		fputs(name, stdout);
- 		fputs("=", stdout);
--		safe_print(value, valsz, NULL);
-+		safe_print(value, valsz, " \\\"'$`<>");
- 		fputs("\n", stdout);
- 
- 	} else {
-@@ -315,7 +315,7 @@ static void print_value(int output, int num, const char *devname,
- 		fputs(" ", stdout);
- 		fputs(name, stdout);
- 		fputs("=\"", stdout);
--		safe_print(value, valsz, "\"");
-+		safe_print(value, valsz, "\"\\");
- 		fputs("\"", stdout);
- 	}
- }
--- 
-2.0.4
-
diff --git a/package/util-linux/Config.in b/package/util-linux/Config.in
index 1b475d4..960a21c 100644
--- a/package/util-linux/Config.in
+++ b/package/util-linux/Config.in
@@ -271,6 +271,11 @@ config BR2_PACKAGE_UTIL_LINUX_WRITE
 	help
 	  Send a message to another user
 
+config BR2_PACKAGE_UTIL_LINUX_ZRAMCTL
+	bool "zramctl"
+	help
+	  Set up and control zram devices
+
 endif
 
 endif
diff --git a/package/util-linux/util-linux.hash b/package/util-linux/util-linux.hash
index b5fc18e..d28d681 100644
--- a/package/util-linux/util-linux.hash
+++ b/package/util-linux/util-linux.hash
@@ -1,2 +1,2 @@
-# From https://www.kernel.org/pub/linux/utils/util-linux/v2.25/sha256sums.asc
-sha256	e0457f715b73f4a349e1acb08cb410bf0edc9a74a3f75c357070f31f70e33cd6	util-linux-2.25.2.tar.xz
+# From https://www.kernel.org/pub/linux/utils/util-linux/v2.26/sha256sums.asc
+sha256	a23c6f39dea0ed215ccd589509ffc7bb6f706f6e1a04760f493fb0fd7e93c489	util-linux-2.26.tar.xz
diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index 0b99618..cb4b480 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-UTIL_LINUX_VERSION = $(UTIL_LINUX_VERSION_MAJOR).2
-UTIL_LINUX_VERSION_MAJOR = 2.25
+UTIL_LINUX_VERSION = $(UTIL_LINUX_VERSION_MAJOR)
+UTIL_LINUX_VERSION_MAJOR = 2.26
 UTIL_LINUX_SOURCE = util-linux-$(UTIL_LINUX_VERSION).tar.xz
 UTIL_LINUX_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/util-linux/v$(UTIL_LINUX_VERSION_MAJOR)
 
@@ -17,7 +17,10 @@ UTIL_LINUX_LICENSE_FILES = README.licensing Documentation/licenses/COPYING.GPLv2
 UTIL_LINUX_AUTORECONF = YES
 UTIL_LINUX_INSTALL_STAGING = YES
 UTIL_LINUX_DEPENDENCIES = host-pkgconf
-UTIL_LINUX_CONF_ENV = scanf_cv_type_modifier=no
+# uClibc needs NTP_LEGACY for sys/timex.h -> ntp_gettime() support
+# (used in logger.c), and the common default is N.
+UTIL_LINUX_CONF_ENV = scanf_cv_type_modifier=no \
+	$(if $(BR2_TOOLCHAIN_USES_UCLIBC),ac_cv_header_sys_timex_h=no)
 UTIL_LINUX_CONF_OPTS += \
 	--disable-rpath \
 	--disable-makeinstall-chown \
@@ -107,7 +110,8 @@ UTIL_LINUX_CONF_OPTS += \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_VIPW),--enable-vipw,--disable-vipw) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_WALL),--enable-wall,--disable-wall) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_WDCTL),--enable-wdctl,--disable-wdctl) \
-	$(if $(BR2_PACKAGE_UTIL_LINUX_WRITE),--enable-write,--disable-write)
+	$(if $(BR2_PACKAGE_UTIL_LINUX_WRITE),--enable-write,--disable-write) \
+	$(if $(BR2_PACKAGE_UTIL_LINUX_ZRAMCTL),--enable-zramctl,--disable-zramctl)
 
 # In the host version of util-linux, we so far only require libuuid,
 # and none of the util-linux utilities, so we disable all of them, unless
-- 
2.0.5
