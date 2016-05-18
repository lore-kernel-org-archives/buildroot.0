From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 18 May 2016 16:08:23 -0300
Subject: [Buildroot] [PATCH] e2fsprogs: bump to version 1.43
Message-ID: <1463598503-13738-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add new fuse2fs option and disable it for host-e2fsprogs to avoid
carrying over unused/unnecessary distro/host dependencies.

Move E2FSPROGS_DEPENDENCIES to the top to avoid nasty mistakes (like
resetting a previous conditional addition).

License file renamed from COPYING to NOTICE.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/e2fsprogs/Config.in      |  9 +++++++++
 package/e2fsprogs/e2fsprogs.hash |  4 ++--
 package/e2fsprogs/e2fsprogs.mk   | 17 ++++++++++++-----
 3 files changed, 23 insertions(+), 7 deletions(-)

diff --git a/package/e2fsprogs/Config.in b/package/e2fsprogs/Config.in
index e540337..cf43dbc 100644
--- a/package/e2fsprogs/Config.in
+++ b/package/e2fsprogs/Config.in
@@ -62,6 +62,15 @@ config BR2_PACKAGE_E2FSPROGS_FSCK
 	bool "fsck"
 	default y
 
+config BR2_PACKAGE_E2FSPROGS_FUSE2FS
+	bool "fuse2fs"
+	depends on !BR2_STATIC_LIBS # libfuse
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libfuse
+	select BR2_PACKAGE_LIBFUSE
+
+comment "fuse2fs needs a toolchain w/ threads, dynamic library"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
+
 config BR2_PACKAGE_E2FSPROGS_LOGSAVE
 	bool "logsave"
 	default y
diff --git a/package/e2fsprogs/e2fsprogs.hash b/package/e2fsprogs/e2fsprogs.hash
index 1585037..3cc90fd 100644
--- a/package/e2fsprogs/e2fsprogs.hash
+++ b/package/e2fsprogs/e2fsprogs.hash
@@ -1,2 +1,2 @@
-# From https://www.kernel.org/pub/linux/kernel/people/tytso/e2fsprogs/v1.42.13/sha256sums.asc
-sha256 e16474b5a3a30f9197160c4b91bd48d5a463583049c0fcc405b6f0f7075aa0c7 e2fsprogs-1.42.13.tar.xz
+# From https://www.kernel.org/pub/linux/kernel/people/tytso/e2fsprogs/v1.43/sha256sums.asc
+sha256	d027eec0282e169eb55229beefca258c425c9d96f65292e2c004012d5353cd38	e2fsprogs-1.43.tar.xz
diff --git a/package/e2fsprogs/e2fsprogs.mk b/package/e2fsprogs/e2fsprogs.mk
index 3de4cd4..c1cbf71 100644
--- a/package/e2fsprogs/e2fsprogs.mk
+++ b/package/e2fsprogs/e2fsprogs.mk
@@ -4,17 +4,19 @@
 #
 ################################################################################
 
-E2FSPROGS_VERSION = 1.42.13
+E2FSPROGS_VERSION = 1.43
 E2FSPROGS_SOURCE = e2fsprogs-$(E2FSPROGS_VERSION).tar.xz
 E2FSPROGS_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/people/tytso/e2fsprogs/v$(E2FSPROGS_VERSION)
 E2FSPROGS_LICENSE = GPLv2, libuuid BSD-3c, libss and libet MIT-like with advertising clause
-E2FSPROGS_LICENSE_FILES = COPYING lib/uuid/COPYING lib/ss/mit-sipb-copyright.h lib/et/internal.h
+E2FSPROGS_LICENSE_FILES = NOTICE lib/uuid/COPYING lib/ss/mit-sipb-copyright.h lib/et/internal.h
 E2FSPROGS_INSTALL_STAGING = YES
 E2FSPROGS_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) install-libs
+E2FSPROGS_DEPENDENCIES = host-pkgconf util-linux
 
 # e4defrag doesn't build on older systems like RHEL5.x, and we don't
 # need it on the host anyway.
-HOST_E2FSPROGS_CONF_OPTS += --disable-defrag
+# Disable fuse2fs as well to avoid carrying over deps, and it's unused
+HOST_E2FSPROGS_CONF_OPTS += --disable-defrag --disable-fuse2fs
 
 E2FSPROGS_CONF_OPTS = \
 	$(if $(BR2_STATIC_LIBS),,--enable-elf-shlibs) \
@@ -30,6 +32,13 @@ E2FSPROGS_CONF_OPTS = \
 	--disable-testio-debug \
 	--disable-rpath
 
+ifeq ($(BR2_PACKAGE_E2FSPROGS_FUSE2FS),y)
+E2FSPROGS_CONF_OPTS += --enable-fuse2fs
+E2FSPROGS_DEPENDENCIES += libfuse
+else
+E2FSPROGS_CONF_OPTS += --disable-fuse2fs
+endif
+
 ifeq ($(BR2_nios2),y)
 E2FSPROGS_CONF_ENV += ac_cv_func_fallocate=no
 endif
@@ -40,8 +49,6 @@ ifeq ($(BR2_NEEDS_GETTEXT_IF_LOCALE),y)
 E2FSPROGS_CONF_ENV += LIBS=-lintl
 endif
 
-E2FSPROGS_DEPENDENCIES = host-pkgconf util-linux
-
 E2FSPROGS_MAKE_OPTS = \
 	LDCONFIG=true
 
-- 
2.7.3
