From: Adam Duskett <aduskett@gmail.com>
Date: Tue, 23 May 2017 09:07:14 -0400
Subject: [Buildroot] [PATCH 01/01] mtd: bump to version 2.0.0
Message-ID: <20170523130714.25586-1-aduskett@codeblue.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

MTD Tools was bumped to version 2.0 after over a decade of being at 1.5.2.
This revision includes:
  - Moving from a handwritten makefile to autotools.
  - Restructuring and cleaning up the source tree.
  - Fixing the problems that the patches in the package/mtd directory fixed.

Changes:
  - Move from generic-package to autotools-package in mtd.mk.
  - Remove no longer necessary patches.
  - Update binary locations in mtd.mk
  - Update library/header locations in mtd.mk
  - Remove MTD_ADD_MISSING_LINTL definition from mtd.mk, as it's no longer
    needed.

Tested with toolchains compiled with MUSL, uclib, and glibc.

Signed-off-by: Adam Duskett <aduskett@codeblue.com>
---
 ...binize-Always-return-error-code-at-least-.patch | 64 ----------------------
 ...y-use-execinfo.h-when-INTEGCK_DEBUG-is-en.patch | 62 ---------------------
 ...tegrity-don-t-include-header-bits-stdio_l.patch | 45 ---------------
 package/mtd/mtd.hash                               |  4 +-
 package/mtd/mtd.mk                                 | 33 +++--------
 5 files changed, 10 insertions(+), 198 deletions(-)
 delete mode 100644 package/mtd/0001-mtd-utils-ubinize-Always-return-error-code-at-least-.patch
 delete mode 100644 package/mtd/0002-integck-only-use-execinfo.h-when-INTEGCK_DEBUG-is-en.patch
 delete mode 100644 package/mtd/0003-fs-tests-integrity-don-t-include-header-bits-stdio_l.patch

diff --git a/package/mtd/0001-mtd-utils-ubinize-Always-return-error-code-at-least-.patch b/package/mtd/0001-mtd-utils-ubinize-Always-return-error-code-at-least-.patch
deleted file mode 100644
index 077ca0c..0000000
--- a/package/mtd/0001-mtd-utils-ubinize-Always-return-error-code-at-least-.patch
+++ /dev/null
@@ -1,64 +0,0 @@
-From 5f50207231414bfdbac8f0f974a2824f24177d6e Mon Sep 17 00:00:00 2001
-From: Enrico Jorns <ejo@pengutronix.de>
-Date: Fri, 11 Sep 2015 15:28:13 +0200
-Subject: [PATCH] mtd-utils: ubinize: Always return error code (at least -1) in
- case of an error
-
-ubinize should not fail silenty, this can be very annoying when using
-it from other tools that rely on the exit code for determining the
-success of their operation.
-
-Signed-off-by: Enrico Jorns <ejo@pengutronix.de>
-Signed-off-by: Brian Norris <computersforpeace@gmail.com>
-Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
----
- ubi-utils/ubinize.c | 5 +++++
- 1 file changed, 5 insertions(+)
-
-diff --git a/ubi-utils/ubinize.c b/ubi-utils/ubinize.c
-index 34f465a..60bbd9a 100644
---- a/ubi-utils/ubinize.c
-+++ b/ubi-utils/ubinize.c
-@@ -519,6 +519,7 @@ int main(int argc, char * const argv[])
- 	 */
- 	seek = ui.peb_size * 2;
- 	if (lseek(args.out_fd, seek, SEEK_SET) != seek) {
-+		err = -1;
- 		sys_errmsg("cannot seek file \"%s\"", args.f_out);
- 		goto out_free;
- 	}
-@@ -530,6 +531,7 @@ int main(int argc, char * const argv[])
- 		int fd, j;
- 
- 		if (!sname) {
-+			err = -1;
- 			errmsg("ini-file parsing error (iniparser_getsecname)");
- 			goto out_free;
- 		}
-@@ -550,6 +552,7 @@ int main(int argc, char * const argv[])
- 		 */
- 		for (j = 0; j < i; j++) {
- 			if (vi[i].id == vi[j].id) {
-+				err = -1;
- 				errmsg("volume IDs must be unique, but ID %d "
- 				       "in section \"%s\" is not",
- 				       vi[i].id, sname);
-@@ -557,6 +560,7 @@ int main(int argc, char * const argv[])
- 			}
- 
- 			if (!strcmp(vi[i].name, vi[j].name)) {
-+				err = -1;
- 				errmsg("volume name must be unique, but name "
- 				       "\"%s\" in section \"%s\" is not",
- 				       vi[i].name, sname);
-@@ -580,6 +584,7 @@ int main(int argc, char * const argv[])
- 		if (img) {
- 			fd = open(img, O_RDONLY);
- 			if (fd == -1) {
-+				err = fd;
- 				sys_errmsg("cannot open \"%s\"", img);
- 				goto out_free;
- 			}
--- 
-1.9.1
-
diff --git a/package/mtd/0002-integck-only-use-execinfo.h-when-INTEGCK_DEBUG-is-en.patch b/package/mtd/0002-integck-only-use-execinfo.h-when-INTEGCK_DEBUG-is-en.patch
deleted file mode 100644
index 0f74a7b..0000000
--- a/package/mtd/0002-integck-only-use-execinfo.h-when-INTEGCK_DEBUG-is-en.patch
+++ /dev/null
@@ -1,62 +0,0 @@
-From 30f0cd91b21dbc5d593d61ae44875ad0cb53cb4d Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Sat, 16 Jul 2016 11:27:06 +0200
-Subject: [PATCH] integck: only use execinfo.h when INTEGCK_DEBUG is enabled
-
-Guard the usage of execinfo.h by INTEGCK_DEBUG so that by defaut,
-integck builds properly on systems without <execinfo.h> (uClibc and
-musl based systems). As stated in the code, the backtrace()
-functionality of <execinfo.h> will anyway only work properly when
-INTEGCK_DEBUG is defined (it makes all functions non-static, which is
-needed for backtrace to provide some useful information).
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- tests/fs-tests/integrity/integck.c | 9 ++++++++-
- 1 file changed, 8 insertions(+), 1 deletion(-)
-
-diff --git a/tests/fs-tests/integrity/integck.c b/tests/fs-tests/integrity/integck.c
-index 8badd1f..6ef817e 100644
---- a/tests/fs-tests/integrity/integck.c
-+++ b/tests/fs-tests/integrity/integck.c
-@@ -31,7 +31,9 @@
- #include <getopt.h>
- #include <assert.h>
- #include <mntent.h>
-+#ifdef INTEGCK_DEBUG
- #include <execinfo.h>
-+#endif
- #include <bits/stdio_lim.h>
- #include <sys/mman.h>
- #include <sys/vfs.h>
-@@ -248,14 +250,18 @@ static char *random_name_buf;
- static void check_failed(const char *cond, const char *func, const char *file,
- 			 int line)
- {
--	int error = errno, count;
-+	int error = errno;
-+#ifdef INTEGCK_DEBUG
-+	int count;
- 	void *addresses[128];
-+#endif
- 
- 	fflush(stdout);
- 	fflush(stderr);
- 	errmsg("condition '%s' failed in %s() at %s:%d",
- 	       cond, func, file, line);
- 	normsg("error %d (%s)", error, strerror(error));
-+#ifdef INTEGCK_DEBUG
- 	/*
- 	 * Note, to make this work well you need:
- 	 * 1. Make all functions non-static - add "#define static'
-@@ -264,6 +270,7 @@ static void check_failed(const char *cond, const char *func, const char *file,
- 	 */
- 	count = backtrace(addresses, 128);
- 	backtrace_symbols_fd(addresses, count, fileno(stdout));
-+#endif
- 	exit(EXIT_FAILURE);
- }
- 
--- 
-2.7.4
-
diff --git a/package/mtd/0003-fs-tests-integrity-don-t-include-header-bits-stdio_l.patch b/package/mtd/0003-fs-tests-integrity-don-t-include-header-bits-stdio_l.patch
deleted file mode 100644
index 5c0a552..0000000
--- a/package/mtd/0003-fs-tests-integrity-don-t-include-header-bits-stdio_l.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From 600ab10e3b452cdffc6c82770b0bb2ff5c23ad70 Mon Sep 17 00:00:00 2001
-From: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
-Date: Fri, 12 Aug 2016 22:59:35 +0530
-Subject: [PATCH 1/1] fs-tests: integrity: don't include header
- <bits/stdio_lim.h>
-
-With musl C library, we get following build error
-
-integck.c:37:28: fatal error: bits/stdio_lim.h: No such file or directory
- #include <bits/stdio_lim.h>
-                            ^
-compilation terminated.
-make[2]: *** [integck] Error 1
-
-Header <bits/stdio_lim.h> is not available in musl C library. However
-<stdio.h> has all definition that <bits/stdio_lim.h> supposed to be
-providing. Moreover <bits/stdio_lim.h> shouldn't be included directly
-instead we should be using <stdio.h>.
-
-Since we already include <stdio.h> and in case of uClibc or glibc
-<bits/stdio_lim.h> gets included internally, we can safely remove it.
-
-This build issue is found by Buildroot autobuilder
-http://autobuild.buildroot.net/results/175/1754861457af520480cc34d7d2d0edff2868ff66/
-
-Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
----
- tests/fs-tests/integrity/integck.c | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/tests/fs-tests/integrity/integck.c b/tests/fs-tests/integrity/integck.c
-index 6ef817e..0bb9711 100644
---- a/tests/fs-tests/integrity/integck.c
-+++ b/tests/fs-tests/integrity/integck.c
-@@ -34,7 +34,6 @@
- #ifdef INTEGCK_DEBUG
- #include <execinfo.h>
- #endif
--#include <bits/stdio_lim.h>
- #include <sys/mman.h>
- #include <sys/vfs.h>
- #include <sys/mount.h>
--- 
-2.6.2
-
diff --git a/package/mtd/mtd.hash b/package/mtd/mtd.hash
index a99e04e..6a234d2 100644
--- a/package/mtd/mtd.hash
+++ b/package/mtd/mtd.hash
@@ -1,3 +1,3 @@
 # Locally calculated after checking pgp signature
-# ftp://ftp.infradead.org/pub/mtd-utils/mtd-utils-1.5.2.tar.bz2.asc
-sha256	5db57389280a3abaec5dd23af2590988b70f213fa3929c12a2642c8f9a86f400	mtd-utils-1.5.2.tar.bz2
+# ftp://ftp.infradead.org/pub/mtd-utils/mtd-utils-2.0.0.tar.bz2.asc
+sha256	20a377aa86af4c102e930b0d0bb9859e3a10aeb16445f6a1273989b206a717c8	mtd-utils-2.0.0.tar.bz2
diff --git a/package/mtd/mtd.mk b/package/mtd/mtd.mk
index d6f0be2..817e67e 100644
--- a/package/mtd/mtd.mk
+++ b/package/mtd/mtd.mk
@@ -4,12 +4,11 @@
 #
 ################################################################################
 
-MTD_VERSION = 1.5.2
+MTD_VERSION = 2.0.0
 MTD_SOURCE = mtd-utils-$(MTD_VERSION).tar.bz2
 MTD_SITE = ftp://ftp.infradead.org/pub/mtd-utils
 MTD_LICENSE = GPL-2.0
 MTD_LICENSE_FILES = COPYING
-
 MTD_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_MTD_MKFSJFFS2),y)
@@ -18,11 +17,6 @@ endif
 
 ifeq ($(BR2_PACKAGE_MTD_MKFSUBIFS),y)
 MTD_DEPENDENCIES += util-linux zlib lzo host-pkgconf
-define MTD_ADD_MISSING_LINTL
-	$(SED) "/^LDLIBS_mkfs\.ubifs/ s%$$% `$(PKG_CONFIG_HOST_BINARY) --libs uuid`%" \
-		$(@D)/Makefile
-endef
-MTD_POST_PATCH_HOOKS += MTD_ADD_MISSING_LINTL
 endif
 
 ifeq ($(BR2_PACKAGE_BUSYBOX),y)
@@ -52,7 +46,7 @@ endef
 MKFS_JFFS2 = $(HOST_DIR)/usr/sbin/mkfs.jffs2
 SUMTOOL = $(HOST_DIR)/usr/sbin/sumtool
 
-MTD_STAGING_y = lib/libmtd.a ubi-utils/libubi.a
+MTD_STAGING_y = lib/libmtd.a lib/libubi.a
 MTD_TARGETS_$(BR2_PACKAGE_MTD_DOCFDISK)		+= docfdisk
 MTD_TARGETS_$(BR2_PACKAGE_MTD_DOC_LOADBIOS)	+= doc_loadbios
 MTD_TARGETS_$(BR2_PACKAGE_MTD_FLASHCP)		+= flashcp
@@ -94,32 +88,21 @@ MTD_TARGETS_UBI_$(BR2_PACKAGE_MTD_UBIRSVOL)	+= ubirsvol
 MTD_TARGETS_UBI_$(BR2_PACKAGE_MTD_UBIUPDATEVOL)	+= ubiupdatevol
 MTD_TARGETS_UBI_$(BR2_PACKAGE_MTD_UBIBLOCK)	+= ubiblock
 
-MTD_TARGETS_y += $(addprefix ubi-utils/,$(MTD_TARGETS_UBI_y))
-MTD_TARGETS_$(BR2_PACKAGE_MTD_MKFSUBIFS) += mkfs.ubifs/mkfs.ubifs
-
 ifeq ($(BR2_PACKAGE_MTD_INTEGCK),y)
 define MTD_BUILD_INTEGCK
 	$(TARGET_CONFIGURE_OPTS) $(MAKE1) CROSS=$(TARGET_CROSS) \
 		BUILDDIR=$(@D) $(MTD_MAKE_OPTS) -C $(@D)/tests/fs-tests all
 endef
 define MTD_INSTALL_INTEGCK
-	$(INSTALL) -D -m 755 $(@D)/tests/fs-tests/integrity/integck $(TARGET_DIR)/usr/sbin/integck
+	$(INSTALL) -D -m 755 $(@D)/integck $(TARGET_DIR)/usr/sbin/integck
 endef
 endif
 
-define MTD_BUILD_CMDS
-	$(TARGET_CONFIGURE_OPTS) $(MAKE1) CROSS=$(TARGET_CROSS) \
-		BUILDDIR=$(@D) $(MTD_MAKE_OPTS) -C $(@D) \
-		$(addprefix $(@D)/,$(MTD_TARGETS_y)) \
-		$(addprefix $(@D)/,$(MTD_STAGING_y))
-	$(MTD_BUILD_INTEGCK)
-endef
-
 define MTD_INSTALL_STAGING_CMDS
-	$(INSTALL) -D -m 0755 $(@D)/lib/libmtd.a $(STAGING_DIR)/usr/lib/libmtd.a
-	$(INSTALL) -D -m 0755 $(@D)/ubi-utils/libubi.a $(STAGING_DIR)/usr/lib/libubi.a
+	$(INSTALL) -D -m 0755 $(@D)/libmtd.a $(STAGING_DIR)/usr/lib/libmtd.a
+	$(INSTALL) -D -m 0755 $(@D)/libubi.a $(STAGING_DIR)/usr/lib/libubi.a
 	$(INSTALL) -D -m 0644 $(@D)/include/libmtd.h $(STAGING_DIR)/usr/include/mtd/libmtd.h
-	$(INSTALL) -D -m 0644 $(@D)/ubi-utils/include/libubi.h $(STAGING_DIR)/usr/include/mtd/libubi.h
+	$(INSTALL) -D -m 0644 $(@D)/include/libubi.h $(STAGING_DIR)/usr/include/mtd/libubi.h
 	$(INSTALL) -D -m 0644 $(@D)/include/mtd/ubi-media.h $(STAGING_DIR)/usr/include/mtd/ubi-media.h
 endef
 
@@ -130,5 +113,5 @@ define MTD_INSTALL_TARGET_CMDS
 	$(MTD_INSTALL_INTEGCK)
 endef
 
-$(eval $(generic-package))
-$(eval $(host-generic-package))
+$(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
2.9.4
