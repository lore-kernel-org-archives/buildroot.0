From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 4 Jun 2014 08:51:06 +0200
Subject: [Buildroot] [git commit] e2fsprogs: bump to version 1.42.10
Message-ID: <20140604065405.CD8469CE96@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d770abad335a85884cfc2ec7574a331c29522810
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop --disable-tls since it's not needed.

Add --disable-rpath to avoid unnecessary pollution.

e4defrag now needs an (e)glibc or musl toolchain because of
sync_file_range()
See e2fsprogs commit 58229aaf85d435469e901c974f31ead6d9124166

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/e2fsprogs/Config.in                        |    4 +++
 ..._CFLAGS-add-includes-when-cross-compiling.patch |   29 ++++++++++++++++++++
 package/e2fsprogs/e2fsprogs.mk                     |    8 +++--
 3 files changed, 38 insertions(+), 3 deletions(-)

diff --git a/package/e2fsprogs/Config.in b/package/e2fsprogs/Config.in
index eb7bedb..05fa4e3 100644
--- a/package/e2fsprogs/Config.in
+++ b/package/e2fsprogs/Config.in
@@ -51,6 +51,10 @@ config BR2_PACKAGE_E2FSPROGS_E2UNDO
 config BR2_PACKAGE_E2FSPROGS_E4DEFRAG
 	bool "e4defrag"
 	depends on !BR2_avr32 && !BR2_nios2 # fallocate not implemented
+	depends on !BR2_TOOLCHAIN_USES_UCLIBC # sync_file_range not impl
+
+comment "e4defrag needs an (e)glibc or musl toolchain"
+	depends on BR2_TOOLCHAIN_USES_UCLIBC
 
 config BR2_PACKAGE_E2FSPROGS_FILEFRAG
 	bool "filefrag"
diff --git a/package/e2fsprogs/e2fsprogs-0002-BUILD_CFLAGS-add-includes-when-cross-compiling.patch b/package/e2fsprogs/e2fsprogs-0002-BUILD_CFLAGS-add-includes-when-cross-compiling.patch
new file mode 100644
index 0000000..2aa86aa
--- /dev/null
+++ b/package/e2fsprogs/e2fsprogs-0002-BUILD_CFLAGS-add-includes-when-cross-compiling.patch
@@ -0,0 +1,29 @@
+From 2d9bfcc82b986f9da203270fd4059041bb7f1983 Mon Sep 17 00:00:00 2001
+From: Gustavo Zacarias <gustavo@zacarias.com.ar>
+Date: Tue, 3 Jun 2014 18:51:07 -0300
+Subject: [PATCH] e2fsprogs: Add INCLUDES to BUILD_CFLAGS when cross-compiling
+
+We need $INCLUDES in BUILD_CFLAGS otherwise cross-compilation is broken
+now that util/subst.c uses config.h (from commit 2873927d15).
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+---
+ configure.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.in b/configure.in
+index 448a292..8bac870 100644
+--- a/configure.in
++++ b/configure.in
+@@ -1382,7 +1382,7 @@ if test $cross_compiling = no; then
+    BUILD_CFLAGS="$CFLAGS $CPPFLAGS $INCLUDES -DHAVE_CONFIG_H"
+    BUILD_LDFLAGS="$LDFLAGS"
+ else
+-   BUILD_CFLAGS=
++   BUILD_CFLAGS="$INCLUDES -DHAVE_CONFIG_H"
+    BUILD_LDFLAGS=
+ fi
+ AC_SUBST(BUILD_CFLAGS)
+--
+1.8.5.5
+
diff --git a/package/e2fsprogs/e2fsprogs.mk b/package/e2fsprogs/e2fsprogs.mk
index 76e2d4e..fa0191f 100644
--- a/package/e2fsprogs/e2fsprogs.mk
+++ b/package/e2fsprogs/e2fsprogs.mk
@@ -4,15 +4,16 @@
 #
 ################################################################################
 
-E2FSPROGS_VERSION = 1.42.9
+E2FSPROGS_VERSION = 1.42.10
 E2FSPROGS_SITE = http://downloads.sourceforge.net/project/e2fsprogs/e2fsprogs/v$(E2FSPROGS_VERSION)
 E2FSPROGS_LICENSE = GPLv2, libuuid BSD-3c, libss and libet MIT-like with advertising clause
 E2FSPROGS_LICENSE_FILES = COPYING lib/uuid/COPYING lib/ss/mit-sipb-copyright.h lib/et/internal.h
+# For e2fsprogs-0002-BUILD_CFLAGS-add-includes-when-cross-compiling.patch
+E2FSPROGS_AUTORECONF = YES
 E2FSPROGS_INSTALL_STAGING = YES
 E2FSPROGS_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) install-libs
 
 E2FSPROGS_CONF_OPT = \
-	--disable-tls \
 	$(if $(BR2_PREFER_STATIC_LIB),,--enable-elf-shlibs) \
 	$(if $(BR2_PACKAGE_E2FSPROGS_DEBUGFS),,--disable-debugfs) \
 	$(if $(BR2_PACKAGE_E2FSPROGS_E2IMAGE),,--disable-imager) \
@@ -23,7 +24,8 @@ E2FSPROGS_CONF_OPT = \
 	--disable-libuuid \
 	--enable-fsck \
 	--disable-e2initrd-helper \
-	--disable-testio-debug
+	--disable-testio-debug \
+	--disable-rpath
 
 ifeq ($(BR2_nios2),y)
 E2FSPROGS_CONF_ENV += ac_cv_func_fallocate=no
