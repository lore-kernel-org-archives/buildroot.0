From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 7 Jan 2013 21:33:20 +0100
Subject: [Buildroot] [git commit] elfutils: new package
Message-ID: <20130107212530.54C8B9A691@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=75bd7d13b2a772786df2b77be9af91ddda450174
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch adds a a package for elfutils. For now, the package is
glibc specific, as adding uClibc support for this package is quite
tedious, and will therefore be done through followup patches.

Heavily based from work done by Stefan Fr??berg, but with many further
modifications by Thomas Petazzoni.

Signed-off-by: Stefan Fr??berg <stefan.froberg@petroprogram.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in            |    1 +
 package/elfutils/Config.in   |   15 ++++++++++++
 package/elfutils/elfutils.mk |   49 ++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 65 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 11e6f3a..d9255ab 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -516,6 +516,7 @@ source "package/apr/Config.in"
 source "package/apr-util/Config.in"
 source "package/libcofi/Config.in"
 source "package/classpath/Config.in"
+source "package/elfutils/Config.in"
 source "package/fftw/Config.in"
 source "package/libargtable2/Config.in"
 source "package/argp-standalone/Config.in"
diff --git a/package/elfutils/Config.in b/package/elfutils/Config.in
new file mode 100644
index 0000000..836ce4c
--- /dev/null
+++ b/package/elfutils/Config.in
@@ -0,0 +1,15 @@
+comment "elfutils requires a glibc toolchain"
+	depends on !(BR2_TOOLCHAIN_EXTERNAL_GLIBC || \
+		     BR2_TOOLCHAIN_CTNG_glibc     || \
+		     BR2_TOOLCHAIN_CTNG_eglibc)
+
+config BR2_PACKAGE_ELFUTILS
+	bool "elfutils"
+	depends on BR2_TOOLCHAIN_EXTERNAL_GLIBC || \
+		   BR2_TOOLCHAIN_CTNG_glibc     || \
+		   BR2_TOOLCHAIN_CTNG_eglibc
+	help
+	  Libraries/utilities to handle ELF objects (drop in
+	  replacement for libelf).
+
+	  https://fedorahosted.org/elfutils
diff --git a/package/elfutils/elfutils.mk b/package/elfutils/elfutils.mk
new file mode 100644
index 0000000..2750060
--- /dev/null
+++ b/package/elfutils/elfutils.mk
@@ -0,0 +1,49 @@
+#############################################################
+#
+# elfutils
+#
+#############################################################
+ELFUTILS_VERSION = 0.155
+ELFUTILS_SOURCE = elfutils-$(ELFUTILS_VERSION).tar.bz2
+ELFUTILS_SITE = https://fedorahosted.org/releases/e/l/elfutils/$(ELFUTILS_VERSION)
+ELFUTILS_LICENSE = GPLv3 GPLv2 LGPLv3
+ELFUTILS_LICENSE_FILES = COPYING COPYING-GPLV2 COPYING-LGPLV3
+
+# The tarball does not have a generated configure script
+ELFUTILS_AUTORECONF = YES
+ELFUTILS_CONF_OPT += --disable-werror
+ELFUTILS_PATCH = \
+	elfutils-portability.patch \
+	elfutils-robustify.patch
+
+ELFUTILS_INSTALL_STAGING = YES
+
+ifeq ($(BR2_LARGEFILE),y)
+# elfutils gets confused when lfs mode is forced, so don't
+ELFUTILS_CONF_ENV += \
+        CFLAGS="$(filter-out -D_FILE_OFFSET_BITS=64,$(TARGET_CFLAGS))" \
+        CPPFLAGS="$(filter-out -D_FILE_OFFSET_BITS=64,$(TARGET_CPPFLAGS))"
+endif
+
+ifeq ($(BR2_PACKAGE_ZLIB),y)
+ ELFUTILS_DEPENDENCIES += zlib
+ ELFUTILS_CONF_OPT += --with-zlib
+else
+ ELFUTILS_CONF_OPT += --without-zlib
+endif
+
+ifeq ($(BR2_PACKAGE_BZIP2),y)
+ ELFUTILS_DEPENDENCIES += bzip2
+ ELFUTILS_CONF_OPT += --with-bzlib
+else
+ ELFUTILS_CONF_OPT += --without-bzlib
+endif
+
+ifeq ($(BR2_PACKAGE_XZ),y)
+ ELFUTILS_DEPENDENCIES += xz
+ ELFUTILS_CONF_OPT += --with-lzma
+else
+ ELFUTILS_CONF_OPT += --without-lzma
+endif
+
+$(eval $(autotools-package))
