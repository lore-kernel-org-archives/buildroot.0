From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 16 Jul 2016 11:49:40 +0200
Subject: [Buildroot] [git commit] mtd: add option to install mtd integrity
	test
Message-ID: <20160716095002.39F9D7FBF2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=77f23c4d66e6cad62ce8a77f6d1b5fd2d109471f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The mtd tests have proven very useful in testing both flash stability
and JFFS2 changes. Adding an option to install the integrity test.

Signed-off-by: Yugendra Sai Babu Nadupuru <yugendra.sai.babu.nadupuru@rockwellcollins.com>
Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
[Thomas: rename Config.in option, misc improvements in .mk file, add
patch to fix build with uClibc/musl.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...y-use-execinfo.h-when-INTEGCK_DEBUG-is-en.patch | 62 ++++++++++++++++++++++
 package/mtd/Config.in                              |  5 ++
 package/mtd/mtd.mk                                 | 12 +++++
 3 files changed, 79 insertions(+)

diff --git a/package/mtd/0002-integck-only-use-execinfo.h-when-INTEGCK_DEBUG-is-en.patch b/package/mtd/0002-integck-only-use-execinfo.h-when-INTEGCK_DEBUG-is-en.patch
new file mode 100644
index 0000000..0f74a7b
--- /dev/null
+++ b/package/mtd/0002-integck-only-use-execinfo.h-when-INTEGCK_DEBUG-is-en.patch
@@ -0,0 +1,62 @@
+From 30f0cd91b21dbc5d593d61ae44875ad0cb53cb4d Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Sat, 16 Jul 2016 11:27:06 +0200
+Subject: [PATCH] integck: only use execinfo.h when INTEGCK_DEBUG is enabled
+
+Guard the usage of execinfo.h by INTEGCK_DEBUG so that by defaut,
+integck builds properly on systems without <execinfo.h> (uClibc and
+musl based systems). As stated in the code, the backtrace()
+functionality of <execinfo.h> will anyway only work properly when
+INTEGCK_DEBUG is defined (it makes all functions non-static, which is
+needed for backtrace to provide some useful information).
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ tests/fs-tests/integrity/integck.c | 9 ++++++++-
+ 1 file changed, 8 insertions(+), 1 deletion(-)
+
+diff --git a/tests/fs-tests/integrity/integck.c b/tests/fs-tests/integrity/integck.c
+index 8badd1f..6ef817e 100644
+--- a/tests/fs-tests/integrity/integck.c
++++ b/tests/fs-tests/integrity/integck.c
+@@ -31,7 +31,9 @@
+ #include <getopt.h>
+ #include <assert.h>
+ #include <mntent.h>
++#ifdef INTEGCK_DEBUG
+ #include <execinfo.h>
++#endif
+ #include <bits/stdio_lim.h>
+ #include <sys/mman.h>
+ #include <sys/vfs.h>
+@@ -248,14 +250,18 @@ static char *random_name_buf;
+ static void check_failed(const char *cond, const char *func, const char *file,
+ 			 int line)
+ {
+-	int error = errno, count;
++	int error = errno;
++#ifdef INTEGCK_DEBUG
++	int count;
+ 	void *addresses[128];
++#endif
+ 
+ 	fflush(stdout);
+ 	fflush(stderr);
+ 	errmsg("condition '%s' failed in %s() at %s:%d",
+ 	       cond, func, file, line);
+ 	normsg("error %d (%s)", error, strerror(error));
++#ifdef INTEGCK_DEBUG
+ 	/*
+ 	 * Note, to make this work well you need:
+ 	 * 1. Make all functions non-static - add "#define static'
+@@ -264,6 +270,7 @@ static void check_failed(const char *cond, const char *func, const char *file,
+ 	 */
+ 	count = backtrace(addresses, 128);
+ 	backtrace_symbols_fd(addresses, count, fileno(stdout));
++#endif
+ 	exit(EXIT_FAILURE);
+ }
+ 
+-- 
+2.7.4
+
diff --git a/package/mtd/Config.in b/package/mtd/Config.in
index 6e4346f..eef8129 100644
--- a/package/mtd/Config.in
+++ b/package/mtd/Config.in
@@ -159,4 +159,9 @@ config BR2_PACKAGE_MTD_UBIBLOCK
 	bool "ubiblock"
 	default y
 
+config BR2_PACKAGE_MTD_INTEGCK
+	bool "integck"
+	help
+	  Install the integck test program.
+
 endif
diff --git a/package/mtd/mtd.mk b/package/mtd/mtd.mk
index bf90212..acf24d5 100644
--- a/package/mtd/mtd.mk
+++ b/package/mtd/mtd.mk
@@ -97,11 +97,22 @@ MTD_TARGETS_UBI_$(BR2_PACKAGE_MTD_UBIBLOCK)	+= ubiblock
 MTD_TARGETS_y += $(addprefix ubi-utils/,$(MTD_TARGETS_UBI_y))
 MTD_TARGETS_$(BR2_PACKAGE_MTD_MKFSUBIFS) += mkfs.ubifs/mkfs.ubifs
 
+ifeq ($(BR2_PACKAGE_MTD_INTEGCK),y)
+define MTD_BUILD_INTEGCK
+	$(TARGET_CONFIGURE_OPTS) $(MAKE1) CROSS=$(TARGET_CROSS) \
+		BUILDDIR=$(@D) $(MTD_MAKE_OPTS) -C $(@D)/tests/fs-tests all
+endef
+define MTD_INSTALL_INTEGCK
+	$(INSTALL) -D -m 755 $(@D)/tests/fs-tests/integrity/integck $(TARGET_DIR)/usr/sbin/integck
+endef
+endif
+
 define MTD_BUILD_CMDS
 	$(TARGET_CONFIGURE_OPTS) $(MAKE1) CROSS=$(TARGET_CROSS) \
 		BUILDDIR=$(@D) $(MTD_MAKE_OPTS) -C $(@D) \
 		$(addprefix $(@D)/,$(MTD_TARGETS_y)) \
 		$(addprefix $(@D)/,$(MTD_STAGING_y))
+	$(MTD_BUILD_INTEGCK)
 endef
 
 define MTD_INSTALL_STAGING_CMDS
@@ -116,6 +127,7 @@ define MTD_INSTALL_TARGET_CMDS
 	for f in $(MTD_TARGETS_y) ; do \
 		$(INSTALL) -D -m 0755 $(@D)/$$f $(TARGET_DIR)/usr/sbin/$${f##*/} ; \
 	done
+	$(MTD_INSTALL_INTEGCK)
 endef
 
 $(eval $(generic-package))
