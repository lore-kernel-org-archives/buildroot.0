From: aduskett at gmail.com <aduskett@gmail.com>
Date: Sat, 25 Jul 2020 16:06:07 -0700
Subject: [Buildroot] [PATCH v3 02/13] package/libblockdev: new package
In-Reply-To: <20200725230618.3640682-1-aduskett@gmail.com>
References: <20200725230618.3640682-1-aduskett@gmail.com>
Message-ID: <20200725230618.3640682-3-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

libblockdev is a C library supporting GObject introspection for manipulation
of block devices. It has a plugin-based architecture where each technology
(like LVM, Btrfs, MD RAID, Swap,...) is implemented in a separate plugin,
possibly with multiple implementations.

Gobject-introspection is not a strict dependency and may be disabled via a
configure flag.

This is the base package with everything disabled, the subsequent patches in
this series will add more options necessary to bump udisk to the latest.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
Changes V1 -> v2:
  - Rework dependencies. (Thomas)

 DEVELOPERS                           |  1 +
 package/Config.in                    |  1 +
 package/libblockdev/Config.in        | 22 ++++++++++++++++
 package/libblockdev/libblockdev.hash |  3 +++
 package/libblockdev/libblockdev.mk   | 39 ++++++++++++++++++++++++++++
 5 files changed, 66 insertions(+)
 create mode 100644 package/libblockdev/Config.in
 create mode 100644 package/libblockdev/libblockdev.hash
 create mode 100644 package/libblockdev/libblockdev.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 9105626083..ff475a3234 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -43,6 +43,7 @@ F:	package/gstreamer1/gst1-vaapi/
 F:	package/imx-usb-loader/
 F:	package/janus-gateway/
 F:	package/json-for-modern-cpp/
+F:	package/libblockdev/
 F:	package/libabseil-cpp/
 F:	package/libcpprestsdk/
 F:	package/libcutl/
diff --git a/package/Config.in b/package/Config.in
index 178b4da98a..1a41759064 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1493,6 +1493,7 @@ menu "Hardware handling"
 	source "package/let-me-create/Config.in"
 	source "package/libaio/Config.in"
 	source "package/libatasmart/Config.in"
+	source "package/libblockdev/Config.in"
 	source "package/libcec/Config.in"
 	source "package/libfreefare/Config.in"
 	source "package/libftdi/Config.in"
diff --git a/package/libblockdev/Config.in b/package/libblockdev/Config.in
new file mode 100644
index 0000000000..4fd80f1f5c
--- /dev/null
+++ b/package/libblockdev/Config.in
@@ -0,0 +1,22 @@
+config BR2_PACKAGE_LIBBLOCKDEV
+	bool "libblockdev"
+	depends on !BR2_STATIC_LIBS # kmod
+	depends on BR2_USE_WCHAR # libglib2 -> gettext
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
+	depends on BR2_USE_MMU # fork() # libglib2
+	depends on BR2_PACKAGE_HAS_UDEV
+	select BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_KMOD
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
+	depends on !BR2_PACKAGE_HAS_UDEV
+	depends on BR2_STATIC_LIBS || !BR2_USE_WCHAR || BR2_TOOLCHAIN_HAS_THREADS
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
index 0000000000..3040a2a690
--- /dev/null
+++ b/package/libblockdev/libblockdev.mk
@@ -0,0 +1,39 @@
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
+	--without-parted \
+	--without-python2 \
+	--without-python3 \
+	--without-s390 \
+	--without-swap \
+	--without-tools \
+	--without-vdo
+
+$(eval $(autotools-package))
-- 
2.26.2
