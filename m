From: Yair Ben Avraham <yairba@tkos.co.il>
Date: Wed, 29 Aug 2018 07:32:31 +0300
Subject: [Buildroot] [PATCH 1/1] encfs: new package
Message-ID: <1535517151-26179-1-git-send-email-yairba@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

EncFS: an Encrypted Filesystem for FUSE.
Signed-off-by: Yair Ben Avraham <yairba@tkos.co.il>
---
 package/Config.in                                  |  1 +
 ...Remove-make-j2-unittests-test-integration.patch | 33 +++++++++++++++++++++
 package/encfs/Config.in                            | 24 +++++++++++++++
 package/encfs/encfs.hash                           |  7 +++++
 package/encfs/encfs.mk                             | 34 ++++++++++++++++++++++
 5 files changed, 99 insertions(+)
 create mode 100644 package/encfs/0001-Remove-make-j2-unittests-test-integration.patch
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
diff --git a/package/encfs/0001-Remove-make-j2-unittests-test-integration.patch b/package/encfs/0001-Remove-make-j2-unittests-test-integration.patch
new file mode 100644
index 0000000..c6730d8
--- /dev/null
+++ b/package/encfs/0001-Remove-make-j2-unittests-test-integration.patch
@@ -0,0 +1,33 @@
+From b0b6cb0bfd61fd947d3d6e69708688b753849102 Mon Sep 17 00:00:00 2001
+From: Yair Ben Avraham <yairba@tkos.co.il>
+Date: Tue, 28 Aug 2018 21:30:56 +0300
+Subject: [PATCH 1/1] Remove make {-j2, unittests, test, integration}
+
+Signed-off-by: Yair Ben Avraham <yairba@tkos.co.il>
+---
+ build.sh | 11 +----------
+ 1 file changed, 1 insertion(+), 10 deletions(-)
+
+diff --git a/build.sh b/build.sh
+index b10107c..74925a3 100755
+--- a/build.sh
++++ b/build.sh
+@@ -22,14 +22,5 @@ fi
+
+ cd build
+ ${CMAKE} .. ${CFG}
+-make -j2
+-make unittests
+-make test
+-if [[ "$INTEGRATION" == "true" ]]; then
+-  make integration
+-fi
+-
+ cd ..
+-
+-echo
+-echo 'Everything looks good, you can install via "make install -C build".'
++make
+--
+2.7.4
+
diff --git a/package/encfs/Config.in b/package/encfs/Config.in
new file mode 100644
index 0000000..a56ef48
--- /dev/null
+++ b/package/encfs/Config.in
@@ -0,0 +1,24 @@
+config BR2_PACKAGE_ENCFS
+	bool "encfs"
+	depends on BR2_USE_WCHAR
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_MMU
+	depends on !BR2_STATIC_LIBS
+	depends on BR2_PACKAGE_HOST_CMAKE
+	depends on BR2_TOOLCHAIN_BUILDROOT_CXX
+	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_LIBFUSE
+	select BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
+	help
+	  EncFS is an Encrypted Filesystem for FUSE. EncFS provides an encrypted
+	  filesystem in user-space. It runs in userspace, using the FUSE library
+	  for the filesystem interface.
+
+	  https://github.com/vgough/encfs
+
+comment "encfs needs a toolchain w/ wchar, threads, dynamic library"
+	depends on BR2_USE_MMU
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
+	depends on BR2_PACKAGE_HOST_CMAKE
+	depends on BR2_TOOLCHAIN_BUILDROOT_CXX
diff --git a/package/encfs/encfs.hash b/package/encfs/encfs.hash
new file mode 100644
index 0000000..73aa4c3
--- /dev/null
+++ b/package/encfs/encfs.hash
@@ -0,0 +1,7 @@
+# Locally calculated after checking pgp signature
+sha256	3cc9d8fb3592319d7c50ae968e7e2a7c4b4463e1e5421c6c6d5ef9a1ac27a2a2	encfs-1.9.5.zip
+
+# Hash for license files:
+sha256	fdba14f0ecddd3e6d31a76177045d99df90070e6377967fdbfbc616166e0dcce	COPYING
+sha256	8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903	COPYING.GPL
+sha256	da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768	COPYING.LGPL
diff --git a/package/encfs/encfs.mk b/package/encfs/encfs.mk
new file mode 100644
index 0000000..8147188
--- /dev/null
+++ b/package/encfs/encfs.mk
@@ -0,0 +1,34 @@
+################################################################################
+#
+# encfs
+#
+################################################################################
+
+ENCFS_VERSION = 1.9.5
+ENCFS_SOURCE = encfs-$(ENCFS_VERSION).zip
+ENCFS_SITE = $(call github,vgough,encfs,v$(ENCFS_VERSION))
+ENCFS_LICENSE = LGPL (libencfs), GPL, MIT (easylogging++), Zlib (tinyxml2)
+ENCFS_LICENSE_FILES = COPYING COPYING.GPL COPYING.LGPL
+ENCFS_DEPENDENCIES = \
+	libfuse openssl
+
+define ENCFS_EXTRACT_CMDS
+        $(UNZIP) -d $(BUILD_DIR) $(ENCFS_DL_DIR)/$(ENCFS_SOURCE)
+endef
+
+define ENCFS_BUILD_CMDS
+        (cd $(@D) && $(TARGET_MAKE_ENV) ./build.sh)
+endef
+
+define ENCFS_INSTALL_CMDS
+        (cd $(@D) && make install)
+endef
+
+ENCFS_CONF_OPTS += \
+        -DFUSE_INCLUDE_DIR=$(BUILD_DIR)/libfuse* \
+        -DCMAKE_CROSSCOMPILING=1 \
+        -DRUNTIME_OUTPUT_DIRECTORY=$(BUILD_DIR) \
+        -DCMAKE_RUNTIME_OUTPUT_DIRECTORY=$(BUILD_DIR)/usr/bin \
+        -DBUILD_UNIT_TESTS=0
+
+$(eval $(cmake-package))
-- 
Yair Ben-Avraham
Tk Open Systems Ltd.
+972.52.343.2297
yairba at tkos.co.il
