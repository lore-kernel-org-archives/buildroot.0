From: Naoki Matsumoto <n-matsumoto@melcoinc.co.jp>
Date: Wed, 28 Jun 2017 16:42:42 +0900
Subject: [Buildroot] [FYI 2/2] WIP:qt5: Bump up to 5.9
In-Reply-To: <104a0453-7ac4-f6d9-3e66-2671b313d757@melcoinc.co.jp>
References: <104a0453-7ac4-f6d9-3e66-2671b313d757@melcoinc.co.jp>
Message-ID: <1cc8737a-4ecd-5aa7-2a2e-628cea1e6652@melcoinc.co.jp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Qt5.9 is LTS.
Dependences: pcre2

Signed-off-by: Naoki Matsumoto <n-matsumoto@melcoinc.co.jp>
---
 package/qt5/Config.in            | 11 +++++++++++
 package/qt5/qt5.mk               |  6 ++++++
 package/qt5/qt5base/qt5base.hash |  3 +++
 package/qt5/qt5base/qt5base.mk   |  7 +++++++
 4 files changed, 27 insertions(+)

diff --git a/package/qt5/Config.in b/package/qt5/Config.in
index 04dccea..a6fc307 100644
--- a/package/qt5/Config.in
+++ b/package/qt5/Config.in
@@ -50,6 +50,17 @@ comment "Latest Qt version needs host/toolchain w/ gcc >= 4.8"
 	depends on !BR2_ARM_CPU_ARMV4
 	depends on !BR2_arc && !BR2_nios2 && !BR2_xtensa
 
+config BR2_PACKAGE_QT5_VERSION_5_9
+        bool "LTS (5.9)"
+        depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
+        depends on BR2_HOST_GCC_AT_LEAST_4_8 # C++11
+        depends on !BR2_ARM_CPU_ARMV4 # needs ARMv5+
+        # no built-in double-conversion support
+        depends on !BR2_arc && !BR2_nios2 && !BR2_xtensa
+        help
+          This option builds Qt 5.9, which is licensed under
+          (L)GPL-3.0+.
+
 config BR2_PACKAGE_QT5_VERSION_5_6
 	bool "LTS (5.6)"
 	help
diff --git a/package/qt5/qt5.mk b/package/qt5/qt5.mk
index 5c7af39..11d0e95 100644
--- a/package/qt5/qt5.mk
+++ b/package/qt5/qt5.mk
@@ -5,10 +5,16 @@
 ################################################################################
 
 ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
+#TODO:Delete version
 QT5_VERSION_MAJOR = 5.8
 QT5_VERSION = $(QT5_VERSION_MAJOR).0
 QT5_SITE = http://download.qt.io/official_releases/qt/$(QT5_VERSION_MAJOR)/$(QT5_VERSION)/submodules
 QT5_SNAPSHOTS_SITE = http://download.qt.io/snapshots/qt/$(QT5_VERSION_MAJOR)/$(QT5_VERSION)/latest_src/submodules
+else ifeq ($(BR2_PACKAGE_QT5_VERSION_5_9),y)
+QT5_VERSION_MAJOR = 5.9
+QT5_VERSION = $(QT5_VERSION_MAJOR).0
+QT5_SITE = http://download.qt.io/official_releases/qt/$(QT5_VERSION_MAJOR)/$(QT5_VERSION)/submodules
+QT5_SNAPSHOTS_SITE = http://download.qt.io/snapshots/qt/$(QT5_VERSION_MAJOR)/$(QT5_VERSION)/latest_src/submodules
 else
 QT5_VERSION_MAJOR = 5.6
 QT5_VERSION = $(QT5_VERSION_MAJOR).2
diff --git a/package/qt5/qt5base/qt5base.hash b/package/qt5/qt5base/qt5base.hash
index 3f6af8a..5169513 100644
--- a/package/qt5/qt5base/qt5base.hash
+++ b/package/qt5/qt5base/qt5base.hash
@@ -3,3 +3,6 @@ sha256 2f6eae93c5d982fe0a387a01aeb3435571433e23e9d9d9246741faf51f1ee787 qtbase-o
 
 # Hash from: http://download.qt.io/official_releases/qt/5.8/5.8.0/submodules/qtbase-opensource-src-5.8.0.tar.xz
 sha256 c17111ae02a44dc7be1ec2cf979a47ee9e58edf4904041a525c21f4fa53fc005  qtbase-opensource-src-5.8.0.tar.xz
+
+# Hash from: http://download.qt.io/official_releases/qt/5.9/5.9.0/submodules/qtbase-opensource-src-5.9.0.tar.xz
+sha256 267eb2af1a203c087f2113f43b08014d0e2d2cb269295b8602d869a2fad5296c  qtbase-opensource-src-5.9.0.tar.xz
diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index 5fe8bb8..97db864 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -9,6 +9,13 @@ QT5BASE_SITE = $(QT5_SITE)
 QT5BASE_SOURCE = qtbase-opensource-src-$(QT5BASE_VERSION).tar.xz
 
 QT5BASE_DEPENDENCIES = host-pkgconf zlib pcre
+#TODO:More better syntax? likely BR2_PACKAGE_QT5_VERSION < 5.9
+ifeq ($(BR2_PACKAGE_QT5_VERSION_5_9),y)
+QT5BASE_DEPENDENCIES += pcre2
+else
+QT5BASE_DEPENDENCIES += pcre
+endif
+
 QT5BASE_INSTALL_STAGING = YES
 
 # A few comments:
-- 
2.7.4
