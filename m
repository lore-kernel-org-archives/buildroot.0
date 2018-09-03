From: Yair Ben Avraham <yairba@tkos.co.il>
Date: Mon,  3 Sep 2018 09:58:13 +0300
Subject: [Buildroot] [PATCH v2 1/1] encfs: new package
Message-ID: <1535957893-20219-1-git-send-email-yairba@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

EncFS: an Encrypted Filesystem for FUSE.

Signed-off-by: Yair Ben Avraham <yairba@tkos.co.il>
---
 package/Config.in        |  1 +
 package/encfs/Config.in  | 20 ++++++++++++++++++++
 package/encfs/encfs.hash |  9 +++++++++
 package/encfs/encfs.mk   | 24 ++++++++++++++++++++++++
 4 files changed, 54 insertions(+)
 create mode 100644 package/encfs/Config.in
 create mode 100644 package/encfs/encfs.hash
 create mode 100644 package/encfs/encfs.mk

diff --git a/package/Config.in b/package/Config.in
index f5a1749..768d182 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -181,6 +181,7 @@ menu "Filesystem and flash utilities"
 	source "package/e2fsprogs/Config.in"
 	source "package/e2tools/Config.in"
 	source "package/ecryptfs-utils/Config.in"
+	source "package/encfs/Config.in"
 	source "package/exfat/Config.in"
 	source "package/exfat-utils/Config.in"
 	source "package/f2fs-tools/Config.in"
diff --git a/package/encfs/Config.in b/package/encfs/Config.in
new file mode 100644
index 0000000..45fc794
--- /dev/null
+++ b/package/encfs/Config.in
@@ -0,0 +1,20 @@
+config BR2_PACKAGE_ENCFS
+	bool "encfs"
+	depends on BR2_USE_WCHAR
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_MMU
+	depends on !BR2_STATIC_LIBS
+	depends on BR2_INSTALL_LIBSTDCPP
+	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_LIBFUSE
+	select BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
+	help
+	  EncFS provides an encrypted filesystem in user-space. It runs in
+	  userspace, using the FUSE library for the filesystem interface.
+
+	  https://github.com/vgough/encfs
+
+comment "encfs needs a toolchain w/ wchar, threads, dynamic library, C++"
+	depends on BR2_USE_MMU
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS || !BR2_INSTALL_LIBSTDCPP
diff --git a/package/encfs/encfs.hash b/package/encfs/encfs.hash
new file mode 100644
index 0000000..2375a0b
--- /dev/null
+++ b/package/encfs/encfs.hash
@@ -0,0 +1,9 @@
+# Locally calculated after checking pgp signature
+# https://github.com/vgough/encfs/releases/download/v1.9.5/encfs-1.9.5.tar.gz.asc
+# with primary key fingerprint: FFF3 E014 44FE D7C3 16A3  545A 895F 5BC1 23A0 2740
+sha256	4709f05395ccbad6c0a5b40a4619d60aafe3473b1a79bafb3aa700b1f756fd63	encfs-1.9.5.tar.gz
+
+# Hash for license files:
+sha256	fdba14f0ecddd3e6d31a76177045d99df90070e6377967fdbfbc616166e0dcce	COPYING
+sha256	8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903	COPYING.GPL
+sha256	da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768	COPYING.LGPL
diff --git a/package/encfs/encfs.mk b/package/encfs/encfs.mk
new file mode 100644
index 0000000..fafe6f9
--- /dev/null
+++ b/package/encfs/encfs.mk
@@ -0,0 +1,24 @@
+################################################################################
+#
+# encfs
+#
+################################################################################
+
+ENCFS_VERSION = 1.9.5
+ENCFS_SOURCE = encfs-$(ENCFS_VERSION).tar.gz
+ENCFS_SITE = https://github.com/vgough/encfs/releases/download/v$(ENCFS_VERSION)
+ENCFS_LICENSE = LGPL (libencfs), GPL, MIT (easylogging++)
+ENCFS_LICENSE_FILES = COPYING COPYING.GPL COPYING.LGPL
+ENCFS_DEPENDENCIES = \
+	libfuse openssl libglib2 $(if $(BR2_PACKAGE_LIBICONV),libiconv)
+
+# The CMAKE_RUNTIME_OUTPUT_DIRECTORY variable is needed to avoid the error
+# message during linking the CXX executables:
+# arm-buildroot-linux-uclibcgnueabihf/bin/ld: cannot open output file encfs: Is a directory
+ENCFS_CONF_OPTS += \
+        -DCMAKE_USE_INTERNAL_TINYXML=OFF \
+        -DFUSE_INCLUDE_DIR=$(STAGING_DIR)/libfuse* \
+        -DBUILD_UNIT_TESTS=0 \
+        -DCMAKE_RUNTIME_OUTPUT_DIRECTORY=$(BUILD_DIR)/usr/bin
+
+$(eval $(cmake-package))
-- 
Yair Ben-Avraham
Tk Open Systems Ltd.
+972.52.343.2297
yairba at tkos.co.il
