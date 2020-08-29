From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 29 Aug 2020 16:20:09 +0200
Subject: [Buildroot] [git commit branch/next] package/libblockdev: new
 package
Message-ID: <20200829142036.E9D3484C52@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0c52826291d1884db0f8f35130216065fbc7b574
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

libblockdev is a C library supporting GObject introspection for
manipulation of block devices. It has a plugin-based architecture
where each technology (like LVM, Btrfs, MD RAID, Swap,...) is
implemented in a separate plugin, possibly with multiple
implementations.

gobject-introspection is not a strict dependency and may be disabled
via a configure flag.

This is the base package with everything disabled, the subsequent
patches in this series will add more options necessary to bump udisks
to the latest.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                         |  1 +
 package/Config.in                                  |  1 +
 ...ovide-replacement-function-for-strerror_l.patch | 69 ++++++++++++++++++++++
 package/libblockdev/Config.in                      | 22 +++++++
 package/libblockdev/libblockdev.hash               |  3 +
 package/libblockdev/libblockdev.mk                 | 41 +++++++++++++
 6 files changed, 137 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index f817adfc50..7ca757895d 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -44,6 +44,7 @@ F:	package/imx-usb-loader/
 F:	package/janus-gateway/
 F:	package/json-for-modern-cpp/
 F:	package/libabseil-cpp/
+F:	package/libblockdev/
 F:	package/libcpprestsdk/
 F:	package/libcutl/
 F:	package/libodb/
diff --git a/package/Config.in b/package/Config.in
index 8b3b1dec6a..62a7b7df98 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1498,6 +1498,7 @@ menu "Hardware handling"
 	source "package/let-me-create/Config.in"
 	source "package/libaio/Config.in"
 	source "package/libatasmart/Config.in"
+	source "package/libblockdev/Config.in"
 	source "package/libcec/Config.in"
 	source "package/libfreefare/Config.in"
 	source "package/libftdi/Config.in"
diff --git a/package/libblockdev/0001-Provide-replacement-function-for-strerror_l.patch b/package/libblockdev/0001-Provide-replacement-function-for-strerror_l.patch
new file mode 100644
index 0000000000..018e4c4489
--- /dev/null
+++ b/package/libblockdev/0001-Provide-replacement-function-for-strerror_l.patch
@@ -0,0 +1,69 @@
+From ccf93148aa3587dd98a02e253cdc42a7af14df1e Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Date: Sat, 29 Aug 2020 16:04:15 +0200
+Subject: [PATCH] Provide replacement function for strerror_l()
+
+strerror_l() is not implemented in some C libraries, such as uClibc,
+so let's provide a simple replacement function that falls back on
+strerror().
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ configure.ac         | 2 ++
+ src/plugins/crypto.c | 7 +++++++
+ src/utils/module.c   | 8 ++++++++
+ 3 files changed, 17 insertions(+)
+
+diff --git a/configure.ac b/configure.ac
+index c2d22c2..36aeb51 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -137,6 +137,8 @@ AC_CHECK_HEADERS([dlfcn.h string.h unistd.h sys/fcntl.h sys/ioctl.h linux/random
+                  [LIBBLOCKDEV_SOFT_FAILURE([Header file $ac_header not found.])],
+                  [])
+ 
++AC_CHECK_FUNCS([strerror_l])
++
+ AC_ARG_WITH([bcache],
+     AS_HELP_STRING([--with-bcache], [support bcache @<:@default=yes@:>@]),
+     [],
+diff --git a/src/plugins/crypto.c b/src/plugins/crypto.c
+index f4a2e8f..c1bd7b5 100644
+--- a/src/plugins/crypto.c
++++ b/src/plugins/crypto.c
+@@ -52,6 +52,13 @@
+ 
+ #define UNUSED __attribute__((unused))
+ 
++#if !defined(HAVE_STRERROR_L)
++static char *strerror_l(int errnum, locale_t locale UNUSED)
++{
++	return strerror(errnum);
++}
++#endif
++
+ /**
+  * SECTION: crypto
+  * @short_description: plugin for operations with encrypted devices
+diff --git a/src/utils/module.c b/src/utils/module.c
+index 9750e24..086bec0 100644
+--- a/src/utils/module.c
++++ b/src/utils/module.c
+@@ -27,6 +27,14 @@
+ 
+ #include "module.h"
+ 
++#define UNUSED __attribute__((unused))
++
++#if !defined(HAVE_STRERROR_L)
++static char *strerror_l(int errnum, locale_t locale UNUSED)
++{
++	return strerror(errnum);
++}
++#endif
+ 
+ /**
+  * bd_utils_module_error_quark: (skip)
+-- 
+2.26.2
+
diff --git a/package/libblockdev/Config.in b/package/libblockdev/Config.in
new file mode 100644
index 0000000000..4e85b82ce2
--- /dev/null
+++ b/package/libblockdev/Config.in
@@ -0,0 +1,22 @@
+config BR2_PACKAGE_LIBBLOCKDEV
+	bool "libblockdev"
+	depends on !BR2_STATIC_LIBS # kmod
+	depends on BR2_USE_WCHAR # libglib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
+	depends on BR2_USE_MMU # libglib2
+	depends on BR2_PACKAGE_HAS_UDEV
+	select BR2_PACKAGE_KMOD
+	select BR2_PACKAGE_LIBGLIB2
+	help
+	  libblockdev is a C library supporting GObject introspection
+	  for manipulation of block devices. It has a plugin-based
+	  architecture where each technology (like LVM, Btrfs, MD RAID,
+	  Swap,...) is implemented in a separate plugin, possibly with
+	  multiple implementations.
+
+	  https://github.com/storaged-project/libblockdev/
+
+comment "libblockdev needs udev /dev management and a toolchain w/ wchar, threads, dynamic library"
+	depends on BR2_USE_MMU
+	depends on !BR2_PACKAGE_HAS_UDEV || BR2_STATIC_LIBS || \
+		!BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libblockdev/libblockdev.hash b/package/libblockdev/libblockdev.hash
new file mode 100644
index 0000000000..1c4b1ec7bf
--- /dev/null
+++ b/package/libblockdev/libblockdev.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  dc207c70dbef52c818a8abbcb6b8e298a6b63c0b78a5e1f2773b5f7b89300773  libblockdev-2.24.tar.gz
+sha256  97bdc721d875501b6243a456333fdfdb1ab64d31c4da2554de845caf4674b946  LICENSE
diff --git a/package/libblockdev/libblockdev.mk b/package/libblockdev/libblockdev.mk
new file mode 100644
index 0000000000..221a698386
--- /dev/null
+++ b/package/libblockdev/libblockdev.mk
@@ -0,0 +1,41 @@
+################################################################################
+#
+# libblockdev
+#
+################################################################################
+
+LIBBLOCKDEV_VERSION = 2.24
+LIBBLOCKDEV_SITE = https://github.com/storaged-project/libblockdev/releases/download/$(LIBBLOCKDEV_VERSION)-1
+LIBBLOCKDEV_LICENSE = LGPL-2.1
+LIBBLOCKDEV_LICENSE_FILES = LICENSE
+LIBBLOCKDEV_INSTALL_STAGING = YES
+LIBBLOCKDEV_DEPENDENCIES = host-pkgconf libglib2 kmod udev
+# 0001-Provide-replacement-function-for-strerror_l.patch
+LIBBLOCKDEV_AUTORECONF = YES
+
+LIBBLOCKDEV_CONF_OPTS = \
+	--disable-introspection \
+	--with-loop \
+	--without-bcache \
+	--without-btrfs \
+	--without-crypto \
+	--without-dm \
+	--without-dmraid \
+	--without-escrow \
+	--without-fs \
+	--without-kbd \
+	--without-loop \
+	--without-lvm \
+	--without-lvm_dbus \
+	--without-mdraid \
+	--without-mpath \
+	--without-nvdimm \
+	--without-part \
+	--without-python2 \
+	--without-python3 \
+	--without-s390 \
+	--without-swap \
+	--without-tools \
+	--without-vdo
+
+$(eval $(autotools-package))
