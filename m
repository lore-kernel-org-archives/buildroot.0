From: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@savoirfairelinux.com>
Date: Thu, 15 Mar 2018 15:50:54 -0400
Subject: [Buildroot] [PATCH v2 4/4] qt5: bump latest version to 5.10.1
In-Reply-To: <20180315195054.15991-1-gael.portay@savoirfairelinux.com>
References: <20180315195054.15991-1-gael.portay@savoirfairelinux.com>
Message-ID: <20180315195054.15991-5-gael.portay@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The tarball filename has changed since 5.10. The module suffix
*opensource-src* has changed to *everywhere-src*. I introduced the
*QT5_SOURCE_TARBALL_PREFIX* variable to set the right filename according
to the Qt version.

qtwebengine:

	select libnss. It is a requirement[1] because OpenSSL
	certificate validation[2] and NSS bundle[3] was dropped.

	add host-libnss and host-libpng to satisfy new requirement to
	build an internal host-tool.

	set ninja host pkg-config tool using environment variable
	$GN_PKG_CONFIG_HOST[4]. The build system uses pkg-config to get
	package data for both host and target architectures. Using the
	same call to pkg-config for both target and host leads to build
	mismatches: it tries to link a host-tool using target libraries.

[1]: https://github.com/qt/qtwebengine/commit/9b449045fbd5fd3b58bcaff6cf0c5878cd6e64eb
[2]: https://codereview.chromium.org/2862543003
[3]: https://codereview.chromium.org/1882433002
[4]: https://github.com/qt/qtwebengine/blob/v5.10.1/src/core/config/linux.pri#L111-L125

Signed-off-by: Ga?l PORTAY <gael.portay@savoirfairelinux.com>
---
Changes since v1:
 * rename QT5_SRC into QT5_SOURCE_TARBALL_PREFIX
 * remove qt5source macro and use directly QT5_SOURCE_TARBALL_PREFIX
 * remove code snippet from commit message (qt5.10)

 package/qt5/Config.in                                    | 4 ++--
 package/qt5/qt5.mk                                       | 6 ++++--
 package/qt5/qt53d/qt53d.hash                             | 4 ++--
 package/qt5/qt53d/qt53d.mk                               | 2 +-
 package/qt5/qt5base/qt5base.hash                         | 4 ++--
 package/qt5/qt5base/qt5base.mk                           | 2 +-
 package/qt5/qt5canvas3d/qt5canvas3d.hash                 | 4 ++--
 package/qt5/qt5canvas3d/qt5canvas3d.mk                   | 2 +-
 package/qt5/qt5charts/qt5charts.hash                     | 4 ++--
 package/qt5/qt5charts/qt5charts.mk                       | 2 +-
 package/qt5/qt5connectivity/qt5connectivity.hash         | 4 ++--
 package/qt5/qt5connectivity/qt5connectivity.mk           | 2 +-
 package/qt5/qt5declarative/qt5declarative.hash           | 4 ++--
 package/qt5/qt5declarative/qt5declarative.mk             | 2 +-
 package/qt5/qt5enginio/qt5enginio.mk                     | 2 +-
 package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash | 4 ++--
 package/qt5/qt5graphicaleffects/qt5graphicaleffects.mk   | 2 +-
 package/qt5/qt5imageformats/qt5imageformats.hash         | 4 ++--
 package/qt5/qt5imageformats/qt5imageformats.mk           | 2 +-
 package/qt5/qt5location/qt5location.hash                 | 4 ++--
 package/qt5/qt5location/qt5location.mk                   | 2 +-
 package/qt5/qt5multimedia/qt5multimedia.hash             | 4 ++--
 package/qt5/qt5multimedia/qt5multimedia.mk               | 2 +-
 package/qt5/qt5quickcontrols/qt5quickcontrols.hash       | 4 ++--
 package/qt5/qt5quickcontrols/qt5quickcontrols.mk         | 2 +-
 package/qt5/qt5quickcontrols2/qt5quickcontrols2.hash     | 4 ++--
 package/qt5/qt5quickcontrols2/qt5quickcontrols2.mk       | 2 +-
 package/qt5/qt5script/qt5script.hash                     | 4 ++--
 package/qt5/qt5script/qt5script.mk                       | 2 +-
 package/qt5/qt5scxml/qt5scxml.hash                       | 4 ++--
 package/qt5/qt5scxml/qt5scxml.mk                         | 2 +-
 package/qt5/qt5sensors/qt5sensors.hash                   | 4 ++--
 package/qt5/qt5sensors/qt5sensors.mk                     | 2 +-
 package/qt5/qt5serialbus/qt5serialbus.hash               | 4 ++--
 package/qt5/qt5serialbus/qt5serialbus.mk                 | 2 +-
 package/qt5/qt5serialport/qt5serialport.hash             | 4 ++--
 package/qt5/qt5serialport/qt5serialport.mk               | 2 +-
 package/qt5/qt5svg/qt5svg.hash                           | 4 ++--
 package/qt5/qt5svg/qt5svg.mk                             | 2 +-
 package/qt5/qt5tools/qt5tools.hash                       | 4 ++--
 package/qt5/qt5tools/qt5tools.mk                         | 2 +-
 package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.hash   | 4 ++--
 package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk     | 2 +-
 package/qt5/qt5wayland/qt5wayland.hash                   | 4 ++--
 package/qt5/qt5wayland/qt5wayland.mk                     | 2 +-
 package/qt5/qt5webchannel/qt5webchannel.hash             | 4 ++--
 package/qt5/qt5webchannel/qt5webchannel.mk               | 2 +-
 package/qt5/qt5webengine/Config.in                       | 1 +
 package/qt5/qt5webengine/qt5webengine.hash               | 4 ++--
 package/qt5/qt5webengine/qt5webengine.mk                 | 8 +++++++-
 package/qt5/qt5webkit-examples/qt5webkit-examples.mk     | 2 +-
 package/qt5/qt5websockets/qt5websockets.hash             | 4 ++--
 package/qt5/qt5websockets/qt5websockets.mk               | 2 +-
 package/qt5/qt5x11extras/qt5x11extras.hash               | 4 ++--
 package/qt5/qt5x11extras/qt5x11extras.mk                 | 2 +-
 package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash           | 4 ++--
 package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk             | 2 +-
 57 files changed, 93 insertions(+), 84 deletions(-)

diff --git a/package/qt5/Config.in b/package/qt5/Config.in
index a9ee44c11f..b7786f7a63 100644
--- a/package/qt5/Config.in
+++ b/package/qt5/Config.in
@@ -35,14 +35,14 @@ choice
 	prompt "Qt5 version"
 
 config BR2_PACKAGE_QT5_VERSION_LATEST
-	bool "Latest (5.9)"
+	bool "Latest (5.10)"
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
 	depends on BR2_HOST_GCC_AT_LEAST_4_8 # C++11
 	depends on !BR2_ARM_CPU_ARMV4 # needs ARMv5+
 	# no built-in double-conversion support
 	depends on !BR2_arc && !BR2_nios2 && !BR2_xtensa
 	help
-	  This option builds Qt 5.9, which is licensed under
+	  This option builds Qt 5.10, which is licensed under
 	  (L)GPL-3.0+.
 
 comment "Latest Qt version needs host/toolchain w/ gcc >= 4.8"
diff --git a/package/qt5/qt5.mk b/package/qt5/qt5.mk
index 3c03c10066..14a2b938a0 100644
--- a/package/qt5/qt5.mk
+++ b/package/qt5/qt5.mk
@@ -5,11 +5,13 @@
 ################################################################################
 
 ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
-QT5_VERSION_MAJOR = 5.9
-QT5_VERSION = $(QT5_VERSION_MAJOR).4
+QT5_VERSION_MAJOR = 5.10
+QT5_VERSION = $(QT5_VERSION_MAJOR).1
+QT5_SOURCE_TARBALL_PREFIX = everywhere-src
 else
 QT5_VERSION_MAJOR = 5.6
 QT5_VERSION = $(QT5_VERSION_MAJOR).3
+QT5_SOURCE_TARBALL_PREFIX = opensource-src
 endif
 QT5_SITE = https://download.qt.io/official_releases/qt/$(QT5_VERSION_MAJOR)/$(QT5_VERSION)/submodules
 
diff --git a/package/qt5/qt53d/qt53d.hash b/package/qt5/qt53d/qt53d.hash
index 9d629eb540..9d9ff8f69c 100644
--- a/package/qt5/qt53d/qt53d.hash
+++ b/package/qt5/qt53d/qt53d.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qt3d-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 10d05a30e925fcad971126c7f47a5e32c39f007dab96b298b2094501f9607ffe qt3d-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.4/submodules/qt3d-opensource-src-5.9.4.tar.xz.mirrorlist
-sha256 ad18b1c98a100025a96d600008c9478f646432c9e8cf11fb9a405c55f1970550 qt3d-opensource-src-5.9.4.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.10/5.10.1/submodules/qt3d-everywhere-src-5.10.1.tar.xz.mirrorlist
+sha256 041fb42536a72bbf9be17a6f52d4b73ce93fb98b456fd63503cc47d80d196b3b  qt3d-everywhere-src-5.10.1.tar.xz
 
 # Hashes for license files:
 sha256 edfe70e99be2a7c109d860b19204609e582720b211c50caedac729da372a1253 LICENSE.GPL
diff --git a/package/qt5/qt53d/qt53d.mk b/package/qt5/qt53d/qt53d.mk
index fcb743db21..d5a3a8edcc 100644
--- a/package/qt5/qt53d/qt53d.mk
+++ b/package/qt5/qt53d/qt53d.mk
@@ -6,7 +6,7 @@
 
 QT53D_VERSION = $(QT5_VERSION)
 QT53D_SITE = $(QT5_SITE)
-QT53D_SOURCE = qt3d-opensource-src-$(QT53D_VERSION).tar.xz
+QT53D_SOURCE = qt3d-$(QT5_SOURCE_TARBALL_PREFIX)-$(QT53D_VERSION).tar.xz
 QT53D_DEPENDENCIES = qt5base qt5declarative
 QT53D_INSTALL_STAGING = YES
 
diff --git a/package/qt5/qt5base/qt5base.hash b/package/qt5/qt5base/qt5base.hash
index a72d8cd4da..d788c071d8 100644
--- a/package/qt5/qt5base/qt5base.hash
+++ b/package/qt5/qt5base/qt5base.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtbase-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 fef48529a6fc2617a30d75d952cb327c6be341fd104154993922184b3b3b4da1 qtbase-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.4/submodules/qtbase-opensource-src-5.9.4.tar.xz.mirrorlist
-sha256 69e6bde3ab00673a77e1506173551fec7d0cd899fcbf9b1260517db1b61004cf qtbase-opensource-src-5.9.4.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.10/5.10.1/submodules/qtbase-everywhere-src-5.10.1.tar.xz.mirrorlist
+sha256 d8660e189caa5da5142d5894d328b61a4d3ee9750b76d61ad74e4eee8765a969  qtbase-everywhere-src-5.10.1.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index b3f9c799cb..76c129d2e4 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -6,7 +6,7 @@
 
 QT5BASE_VERSION = $(QT5_VERSION)
 QT5BASE_SITE = $(QT5_SITE)
-QT5BASE_SOURCE = qtbase-opensource-src-$(QT5BASE_VERSION).tar.xz
+QT5BASE_SOURCE = qtbase-$(QT5_SOURCE_TARBALL_PREFIX)-$(QT5BASE_VERSION).tar.xz
 
 QT5BASE_DEPENDENCIES = host-pkgconf zlib
 QT5BASE_INSTALL_STAGING = YES
diff --git a/package/qt5/qt5canvas3d/qt5canvas3d.hash b/package/qt5/qt5canvas3d/qt5canvas3d.hash
index 68d1691d3d..d15fde9df7 100644
--- a/package/qt5/qt5canvas3d/qt5canvas3d.hash
+++ b/package/qt5/qt5canvas3d/qt5canvas3d.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtcanvas3d-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 e99e0e159f2fba539b7947a1921072f6807f20958d32809edbf12aac571f56ff qtcanvas3d-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.4/submodules/qtcanvas3d-opensource-src-5.9.4.tar.xz.mirrorlist
-sha256 ef358503e2f243c2e162c3fef2181707ff3485376198d8e4fcc6d979e6ebed29 qtcanvas3d-opensource-src-5.9.4.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.10/5.10.1/submodules/qtcanvas3d-everywhere-src-5.10.1.tar.xz.mirrorlist
+sha256 de829a8e6aa4b8496048e9b6f3bff306a80c35935855a94426025ddfb8bcb0c0  qtcanvas3d-everywhere-src-5.10.1.tar.xz
 
 # Hashes for license files:
 sha256 edfe70e99be2a7c109d860b19204609e582720b211c50caedac729da372a1253 LICENSE.GPLv2
diff --git a/package/qt5/qt5canvas3d/qt5canvas3d.mk b/package/qt5/qt5canvas3d/qt5canvas3d.mk
index 97b0ec494e..13e233f237 100644
--- a/package/qt5/qt5canvas3d/qt5canvas3d.mk
+++ b/package/qt5/qt5canvas3d/qt5canvas3d.mk
@@ -6,7 +6,7 @@
 
 QT5CANVAS3D_VERSION = $(QT5_VERSION)
 QT5CANVAS3D_SITE = $(QT5_SITE)
-QT5CANVAS3D_SOURCE = qtcanvas3d-opensource-src-$(QT5CANVAS3D_VERSION).tar.xz
+QT5CANVAS3D_SOURCE = qtcanvas3d-$(QT5_SOURCE_TARBALL_PREFIX)-$(QT5CANVAS3D_VERSION).tar.xz
 QT5CANVAS3D_DEPENDENCIES = qt5base qt5declarative
 QT5CANVAS3D_INSTALL_STAGING = YES
 
diff --git a/package/qt5/qt5charts/qt5charts.hash b/package/qt5/qt5charts/qt5charts.hash
index a0c2d0d739..5a5845ef9f 100644
--- a/package/qt5/qt5charts/qt5charts.hash
+++ b/package/qt5/qt5charts/qt5charts.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.4/submodules/qtcharts-opensource-src-5.9.4.tar.xz.mirrorlist
-sha256 75f72983fde6720a093d5f065d33f47e77a4bd2188ae9d41ebb9a4fcc459d3e7 qtcharts-opensource-src-5.9.4.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.10/5.10.1/submodules/qtcharts-everywhere-src-5.10.1.tar.xz.mirrorlist
+sha256 4f0d577bf73dd2bbb2765c2cfb493a2d68790fc2c64f42544d31dba806321ec9  qtcharts-everywhere-src-5.10.1.tar.xz
 
 # Hashes for license files:
 sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903 LICENSE.GPL3
diff --git a/package/qt5/qt5charts/qt5charts.mk b/package/qt5/qt5charts/qt5charts.mk
index 17fdd96702..123cb658fe 100644
--- a/package/qt5/qt5charts/qt5charts.mk
+++ b/package/qt5/qt5charts/qt5charts.mk
@@ -6,7 +6,7 @@
 
 QT5CHARTS_VERSION = $(QT5_VERSION)
 QT5CHARTS_SITE = $(QT5_SITE)
-QT5CHARTS_SOURCE = qtcharts-opensource-src-$(QT5CHARTS_VERSION).tar.xz
+QT5CHARTS_SOURCE = qtcharts-$(QT5_SOURCE_TARBALL_PREFIX)-$(QT5CHARTS_VERSION).tar.xz
 QT5CHARTS_DEPENDENCIES = qt5base
 QT5CHARTS_INSTALL_STAGING = YES
 
diff --git a/package/qt5/qt5connectivity/qt5connectivity.hash b/package/qt5/qt5connectivity/qt5connectivity.hash
index 21d0ded4e0..8364536309 100644
--- a/package/qt5/qt5connectivity/qt5connectivity.hash
+++ b/package/qt5/qt5connectivity/qt5connectivity.hash
@@ -1,5 +1,5 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtconnectivity-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 fa406e3d63fa4a2acc8ecae6d110f20c766f19a21c7061a12f3c167deb07ccde qtconnectivity-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.4/submodules/qtconnectivity-opensource-src-5.9.4.tar.xz.mirrorlist
-sha256 dba750363bf55648a08bc44372f423d31f405f6deac5393f0b76376a3e9e0c8b qtconnectivity-opensource-src-5.9.4.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.10/5.10.1/submodules/qtconnectivity-everywhere-src-5.10.1.tar.xz.mirrorlist
+sha256 652821dc6819658ec4bc1a6bf149fd7a61008748ff4745b54f038ccf276d3ec9  qtconnectivity-everywhere-src-5.10.1.tar.xz
diff --git a/package/qt5/qt5connectivity/qt5connectivity.mk b/package/qt5/qt5connectivity/qt5connectivity.mk
index 4369a411a5..6de1536b78 100644
--- a/package/qt5/qt5connectivity/qt5connectivity.mk
+++ b/package/qt5/qt5connectivity/qt5connectivity.mk
@@ -6,7 +6,7 @@
 
 QT5CONNECTIVITY_VERSION = $(QT5_VERSION)
 QT5CONNECTIVITY_SITE = $(QT5_SITE)
-QT5CONNECTIVITY_SOURCE = qtconnectivity-opensource-src-$(QT5CONNECTIVITY_VERSION).tar.xz
+QT5CONNECTIVITY_SOURCE = qtconnectivity-$(QT5_SOURCE_TARBALL_PREFIX)-$(QT5CONNECTIVITY_VERSION).tar.xz
 QT5CONNECTIVITY_DEPENDENCIES = qt5base
 QT5CONNECTIVITY_INSTALL_STAGING = YES
 
diff --git a/package/qt5/qt5declarative/qt5declarative.hash b/package/qt5/qt5declarative/qt5declarative.hash
index 308a4f0f56..1634a88ecc 100644
--- a/package/qt5/qt5declarative/qt5declarative.hash
+++ b/package/qt5/qt5declarative/qt5declarative.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtdeclarative-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 f63fc053d0d16b8a9ca9308f8ead77874b470ae31b66057e2bd336bf648191fc qtdeclarative-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.4/submodules/qtdeclarative-opensource-src-5.9.4.tar.xz.mirrorlist
-sha256 dc638a3b207dd2c6607a21415f6dd8d760568535dfe4b485fdb4576c98832d65 qtdeclarative-opensource-src-5.9.4.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.10/5.10.1/submodules/qtdeclarative-everywhere-src-5.10.1.tar.xz.mirrorlist
+sha256 3af9ed51bce5b5c6f04c4a67a6008f98765ccde897c43fff670621ab70789553  qtdeclarative-everywhere-src-5.10.1.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5declarative/qt5declarative.mk b/package/qt5/qt5declarative/qt5declarative.mk
index de8b048329..2fe72b3be6 100644
--- a/package/qt5/qt5declarative/qt5declarative.mk
+++ b/package/qt5/qt5declarative/qt5declarative.mk
@@ -6,7 +6,7 @@
 
 QT5DECLARATIVE_VERSION = $(QT5_VERSION)
 QT5DECLARATIVE_SITE = $(QT5_SITE)
-QT5DECLARATIVE_SOURCE = qtdeclarative-opensource-src-$(QT5DECLARATIVE_VERSION).tar.xz
+QT5DECLARATIVE_SOURCE = qtdeclarative-$(QT5_SOURCE_TARBALL_PREFIX)-$(QT5DECLARATIVE_VERSION).tar.xz
 QT5DECLARATIVE_DEPENDENCIES = qt5base qt5xmlpatterns
 QT5DECLARATIVE_INSTALL_STAGING = YES
 
diff --git a/package/qt5/qt5enginio/qt5enginio.mk b/package/qt5/qt5enginio/qt5enginio.mk
index 603b2a517d..38f309646f 100644
--- a/package/qt5/qt5enginio/qt5enginio.mk
+++ b/package/qt5/qt5enginio/qt5enginio.mk
@@ -7,7 +7,7 @@
 # Qt5Enginio does not follow Qt versionning
 # see https://bugreports.qt.io/browse/QTBUG-50111
 QT5ENGINIO_VERSION = 1.6.3
-QT5ENGINIO_SITE = $(QT5_SITE)
+QT5ENGINIO_SITE = https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules
 QT5ENGINIO_SOURCE = qtenginio-opensource-src-$(QT5ENGINIO_VERSION).tar.xz
 QT5ENGINIO_DEPENDENCIES = openssl qt5base
 QT5ENGINIO_INSTALL_STAGING = YES
diff --git a/package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash b/package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash
index 9a1bbdac32..0eb188f139 100644
--- a/package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash
+++ b/package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtgraphicaleffects-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 c742592d5e45b122b29df60b69be23ba7c817f2dc471db86e054f6ea24a999ed qtgraphicaleffects-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.4/submodules/qtgraphicaleffects-opensource-src-5.9.4.tar.xz.mirrorlist
-sha256 97f75327d7d20ec02e920f1c86ee2bc4063396833d93215e509e95c58e24b8ef qtgraphicaleffects-opensource-src-5.9.4.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.10/5.10.1/submodules/qtgraphicaleffects-everywhere-src-5.10.1.tar.xz.mirrorlist
+sha256 3f3b0631b579630bf58e99f3ca0d8dfdb6a44153c63cf90ac9e07041b4b1847f  qtgraphicaleffects-everywhere-src-5.10.1.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5graphicaleffects/qt5graphicaleffects.mk b/package/qt5/qt5graphicaleffects/qt5graphicaleffects.mk
index 2f6380f712..c5011a94f0 100644
--- a/package/qt5/qt5graphicaleffects/qt5graphicaleffects.mk
+++ b/package/qt5/qt5graphicaleffects/qt5graphicaleffects.mk
@@ -6,7 +6,7 @@
 
 QT5GRAPHICALEFFECTS_VERSION = $(QT5_VERSION)
 QT5GRAPHICALEFFECTS_SITE = $(QT5_SITE)
-QT5GRAPHICALEFFECTS_SOURCE = qtgraphicaleffects-opensource-src-$(QT5GRAPHICALEFFECTS_VERSION).tar.xz
+QT5GRAPHICALEFFECTS_SOURCE = qtgraphicaleffects-$(QT5_SOURCE_TARBALL_PREFIX)-$(QT5GRAPHICALEFFECTS_VERSION).tar.xz
 QT5GRAPHICALEFFECTS_DEPENDENCIES = qt5base qt5declarative
 QT5GRAPHICALEFFECTS_INSTALL_STAGING = YES
 
diff --git a/package/qt5/qt5imageformats/qt5imageformats.hash b/package/qt5/qt5imageformats/qt5imageformats.hash
index 37d0519ed4..ac858ea244 100644
--- a/package/qt5/qt5imageformats/qt5imageformats.hash
+++ b/package/qt5/qt5imageformats/qt5imageformats.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtimageformats-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 efe4da3c90c976c9b9a2eb6b081d2b8e1435935695104456276ce98e8a5848c3 qtimageformats-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.4/submodules/qtimageformats-opensource-src-5.9.4.tar.xz.mirrorlist
-sha256 69e17081a8649b7db138073942d07d2e99f78f4b954ccd6aab3a406e92dbddd9 qtimageformats-opensource-src-5.9.4.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.10/5.10.1/submodules/qtimageformats-everywhere-src-5.10.1.tar.xz.mirrorlist
+sha256 2804baa2779eae015096820e233d7f86bb7fde9853b7c9150a321a453422a283  qtimageformats-everywhere-src-5.10.1.tar.xz
 
 # Hashes for license files:
 sha256 edfe70e99be2a7c109d860b19204609e582720b211c50caedac729da372a1253 LICENSE.GPLv2
diff --git a/package/qt5/qt5imageformats/qt5imageformats.mk b/package/qt5/qt5imageformats/qt5imageformats.mk
index f70f131d50..fa13ebedaf 100644
--- a/package/qt5/qt5imageformats/qt5imageformats.mk
+++ b/package/qt5/qt5imageformats/qt5imageformats.mk
@@ -6,7 +6,7 @@
 
 QT5IMAGEFORMATS_VERSION = $(QT5_VERSION)
 QT5IMAGEFORMATS_SITE = $(QT5_SITE)
-QT5IMAGEFORMATS_SOURCE = qtimageformats-opensource-src-$(QT5IMAGEFORMATS_VERSION).tar.xz
+QT5IMAGEFORMATS_SOURCE = qtimageformats-$(QT5_SOURCE_TARBALL_PREFIX)-$(QT5IMAGEFORMATS_VERSION).tar.xz
 QT5IMAGEFORMATS_DEPENDENCIES = qt5base
 QT5IMAGEFORMATS_INSTALL_STAGING = YES
 
diff --git a/package/qt5/qt5location/qt5location.hash b/package/qt5/qt5location/qt5location.hash
index 3f9ba667c1..c89af3fa89 100644
--- a/package/qt5/qt5location/qt5location.hash
+++ b/package/qt5/qt5location/qt5location.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtlocation-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 b7a81c58cc331fb15bea8fba21d3c9a59f6dc6ad2e4855e30a14ce59a2af1466 qtlocation-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.4/submodules/qtlocation-opensource-src-5.9.4.tar.xz.mirrorlist
-sha256 37ed68b0243a30b836cda79802e3f33404b1792f7b845a25b2e4989dc2fed2a0 qtlocation-opensource-src-5.9.4.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.10/5.10.1/submodules/qtlocation-everywhere-src-5.10.1.tar.xz.mirrorlist
+sha256 5e5cc05517c701a2c8ebba1fbe3ddff2b6b90d5aa554d307b1c477fe0cfd72c9  qtlocation-everywhere-src-5.10.1.tar.xz
 
 # Hashes for license files:
 sha256 edfe70e99be2a7c109d860b19204609e582720b211c50caedac729da372a1253 LICENSE.GPLv2
diff --git a/package/qt5/qt5location/qt5location.mk b/package/qt5/qt5location/qt5location.mk
index e9f1e4d93d..d75d518bcb 100644
--- a/package/qt5/qt5location/qt5location.mk
+++ b/package/qt5/qt5location/qt5location.mk
@@ -6,7 +6,7 @@
 
 QT5LOCATION_VERSION = $(QT5_VERSION)
 QT5LOCATION_SITE = $(QT5_SITE)
-QT5LOCATION_SOURCE = qtlocation-opensource-src-$(QT5LOCATION_VERSION).tar.xz
+QT5LOCATION_SOURCE = qtlocation-$(QT5_SOURCE_TARBALL_PREFIX)-$(QT5LOCATION_VERSION).tar.xz
 QT5LOCATION_DEPENDENCIES = qt5base
 QT5LOCATION_INSTALL_STAGING = YES
 
diff --git a/package/qt5/qt5multimedia/qt5multimedia.hash b/package/qt5/qt5multimedia/qt5multimedia.hash
index 5cb253790a..0fb25b6e09 100644
--- a/package/qt5/qt5multimedia/qt5multimedia.hash
+++ b/package/qt5/qt5multimedia/qt5multimedia.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtmultimedia-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 ae36039ea8037742342f1615687e0ca2188f3ed0d700627a5e5be546c15e1b46 qtmultimedia-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.4/submodules/qtmultimedia-opensource-src-5.9.4.tar.xz.mirrorlist
-sha256 4952a00712e209ad34241b22cb338bad2f44c42a77316b3b05389faeee1e4e74 qtmultimedia-opensource-src-5.9.4.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.10/5.10.1/submodules/qtmultimedia-everywhere-src-5.10.1.tar.xz.mirrorlist
+sha256 a1fa98015ee5a6b81f2d337abc98d8b297c6718f7714a1f13fccfd2934c23649  qtmultimedia-everywhere-src-5.10.1.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5multimedia/qt5multimedia.mk b/package/qt5/qt5multimedia/qt5multimedia.mk
index 041ef49092..acf4534a7d 100644
--- a/package/qt5/qt5multimedia/qt5multimedia.mk
+++ b/package/qt5/qt5multimedia/qt5multimedia.mk
@@ -6,7 +6,7 @@
 
 QT5MULTIMEDIA_VERSION = $(QT5_VERSION)
 QT5MULTIMEDIA_SITE = $(QT5_SITE)
-QT5MULTIMEDIA_SOURCE = qtmultimedia-opensource-src-$(QT5MULTIMEDIA_VERSION).tar.xz
+QT5MULTIMEDIA_SOURCE = qtmultimedia-$(QT5_SOURCE_TARBALL_PREFIX)-$(QT5MULTIMEDIA_VERSION).tar.xz
 QT5MULTIMEDIA_DEPENDENCIES = qt5base
 QT5MULTIMEDIA_INSTALL_STAGING = YES
 
diff --git a/package/qt5/qt5quickcontrols/qt5quickcontrols.hash b/package/qt5/qt5quickcontrols/qt5quickcontrols.hash
index ca1e217d83..a829e6b495 100644
--- a/package/qt5/qt5quickcontrols/qt5quickcontrols.hash
+++ b/package/qt5/qt5quickcontrols/qt5quickcontrols.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtquickcontrols-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 31bb0fc8f21b855af6ff02c415be3246128b523d0ef7c05e248e92281ab0db8e qtquickcontrols-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.4/submodules/qtquickcontrols-opensource-src-5.9.4.tar.xz.mirrorlist
-sha256 16a205a09bfe9d54c38e9ef555e6f1ecd082576ef2a33cb80b6d49a7ccaed98b qtquickcontrols-opensource-src-5.9.4.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.10/5.10.1/submodules/qtquickcontrols-everywhere-src-5.10.1.tar.xz.mirrorlist
+sha256 d231a1993dc6a3f0dbc60a21d01fc0be15b0c26e881bd0631573952ea61682b7  qtquickcontrols-everywhere-src-5.10.1.tar.xz
 
 # Hashes for license files:
 sha256 edfe70e99be2a7c109d860b19204609e582720b211c50caedac729da372a1253 LICENSE.GPLv2
diff --git a/package/qt5/qt5quickcontrols/qt5quickcontrols.mk b/package/qt5/qt5quickcontrols/qt5quickcontrols.mk
index 88e767bcf9..71fad8fd53 100644
--- a/package/qt5/qt5quickcontrols/qt5quickcontrols.mk
+++ b/package/qt5/qt5quickcontrols/qt5quickcontrols.mk
@@ -6,7 +6,7 @@
 
 QT5QUICKCONTROLS_VERSION = $(QT5_VERSION)
 QT5QUICKCONTROLS_SITE = $(QT5_SITE)
-QT5QUICKCONTROLS_SOURCE = qtquickcontrols-opensource-src-$(QT5QUICKCONTROLS_VERSION).tar.xz
+QT5QUICKCONTROLS_SOURCE = qtquickcontrols-$(QT5_SOURCE_TARBALL_PREFIX)-$(QT5QUICKCONTROLS_VERSION).tar.xz
 QT5QUICKCONTROLS_DEPENDENCIES = qt5base qt5declarative
 QT5QUICKCONTROLS_INSTALL_STAGING = YES
 
diff --git a/package/qt5/qt5quickcontrols2/qt5quickcontrols2.hash b/package/qt5/qt5quickcontrols2/qt5quickcontrols2.hash
index 15f23b5e4b..f446980e87 100644
--- a/package/qt5/qt5quickcontrols2/qt5quickcontrols2.hash
+++ b/package/qt5/qt5quickcontrols2/qt5quickcontrols2.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtquickcontrols2-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 ec5078470abe2da888c2be5d1749b5961ef5132487c180ce4d4aa19ea7ff81cb qtquickcontrols2-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.4/submodules/qtquickcontrols2-opensource-src-5.9.4.tar.xz.mirrorlist
-sha256 1528a7a356e7073f5eeca93ba6e3330ba708d31c3a8f10dc1ce4546d9557640c qtquickcontrols2-opensource-src-5.9.4.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.10/5.10.1/submodules/qtquickcontrols2-everywhere-src-5.10.1.tar.xz.mirrorlist
+sha256 5dc64a1b901e418b76fd3bf65dfa87a0cb11338741fb8970211c1df6df0e604a  qtquickcontrols2-everywhere-src-5.10.1.tar.xz
 
 # Hashes for license files:
 sha256 d2cfc059acb4abd8e513cd0a73cd8489f34cbafa7bc34d5d31fb3210821cf8ca LICENSE.GPLv3
diff --git a/package/qt5/qt5quickcontrols2/qt5quickcontrols2.mk b/package/qt5/qt5quickcontrols2/qt5quickcontrols2.mk
index f27cafc63b..c2004c2ee7 100644
--- a/package/qt5/qt5quickcontrols2/qt5quickcontrols2.mk
+++ b/package/qt5/qt5quickcontrols2/qt5quickcontrols2.mk
@@ -6,7 +6,7 @@
 
 QT5QUICKCONTROLS2_VERSION = $(QT5_VERSION)
 QT5QUICKCONTROLS2_SITE = $(QT5_SITE)
-QT5QUICKCONTROLS2_SOURCE = qtquickcontrols2-opensource-src-$(QT5QUICKCONTROLS2_VERSION).tar.xz
+QT5QUICKCONTROLS2_SOURCE = qtquickcontrols2-$(QT5_SOURCE_TARBALL_PREFIX)-$(QT5QUICKCONTROLS2_VERSION).tar.xz
 QT5QUICKCONTROLS2_DEPENDENCIES = qt5base qt5declarative
 QT5QUICKCONTROLS2_INSTALL_STAGING = YES
 
diff --git a/package/qt5/qt5script/qt5script.hash b/package/qt5/qt5script/qt5script.hash
index bcb37801a8..2d41a98e83 100644
--- a/package/qt5/qt5script/qt5script.hash
+++ b/package/qt5/qt5script/qt5script.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtscript-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 f08720dd0e3a70377c1cb7fa3b129e24f4cdedade279e51b67c9271ab470b389 qtscript-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.4/submodules/qtscript-opensource-src-5.9.4.tar.xz.mirrorlist
-sha256 4045da078600b5928f8206341c442cc7f5eec8c51f477f7367072ab5c28ee053 qtscript-opensource-src-5.9.4.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.10/5.10.1/submodules/qtscript-everywhere-src-5.10.1.tar.xz.mirrorlist
+sha256 e0618af7cb1f1f30d292c04cf484e3507cf6f4815f79870e35d2b0ce7ac9532d  qtscript-everywhere-src-5.10.1.tar.xz
 
 # Hashes for license files:
 sha256 245248009fd0af1725d183248380e476c1283383909358a13686606352bf2a17 LICENSE.GPLv3
diff --git a/package/qt5/qt5script/qt5script.mk b/package/qt5/qt5script/qt5script.mk
index b6c02d0d1c..b5883f8dca 100644
--- a/package/qt5/qt5script/qt5script.mk
+++ b/package/qt5/qt5script/qt5script.mk
@@ -6,7 +6,7 @@
 
 QT5SCRIPT_VERSION = $(QT5_VERSION)
 QT5SCRIPT_SITE = $(QT5_SITE)
-QT5SCRIPT_SOURCE = qtscript-opensource-src-$(QT5SCRIPT_VERSION).tar.xz
+QT5SCRIPT_SOURCE = qtscript-$(QT5_SOURCE_TARBALL_PREFIX)-$(QT5SCRIPT_VERSION).tar.xz
 QT5SCRIPT_DEPENDENCIES = qt5base
 QT5SCRIPT_INSTALL_STAGING = YES
 
diff --git a/package/qt5/qt5scxml/qt5scxml.hash b/package/qt5/qt5scxml/qt5scxml.hash
index dbe81ecbb6..d272881843 100644
--- a/package/qt5/qt5scxml/qt5scxml.hash
+++ b/package/qt5/qt5scxml/qt5scxml.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.4/submodules/qtscxml-opensource-src-5.9.4.tar.xz.mirrorlist
-sha256 1decc54e157a1492066fe0e7d534c6a9888c096731af7cac9b64c52fd3950b75 qtscxml-opensource-src-5.9.4.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.10/5.10.1/submodules/qtscxml-everywhere-src-5.10.1.tar.xz.mirrorlist
+sha256 0b42d201e4f96af1c404a61f01da6726bab9bfba4e280cc4a82c717f0db26103  qtscxml-everywhere-src-5.10.1.tar.xz
 
 # Hashes for license files:
 
diff --git a/package/qt5/qt5scxml/qt5scxml.mk b/package/qt5/qt5scxml/qt5scxml.mk
index 2d197a2bca..f2cf173d6e 100644
--- a/package/qt5/qt5scxml/qt5scxml.mk
+++ b/package/qt5/qt5scxml/qt5scxml.mk
@@ -6,7 +6,7 @@
 
 QT5SCXML_VERSION = $(QT5_VERSION)
 QT5SCXML_SITE = $(QT5_SITE)
-QT5SCXML_SOURCE = qtscxml-opensource-src-$(QT5SCXML_VERSION).tar.xz
+QT5SCXML_SOURCE = qtscxml-$(QT5_SOURCE_TARBALL_PREFIX)-$(QT5SCXML_VERSION).tar.xz
 QT5SCXML_DEPENDENCIES = qt5base qt5declarative
 QT5SCXML_INSTALL_STAGING = YES
 
diff --git a/package/qt5/qt5sensors/qt5sensors.hash b/package/qt5/qt5sensors/qt5sensors.hash
index 1a78d46770..0b7222f14d 100644
--- a/package/qt5/qt5sensors/qt5sensors.hash
+++ b/package/qt5/qt5sensors/qt5sensors.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtsensors-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 7502d4dc5571865a7eea2a4180c3be396dfb8ce22df4c4f3d7e9ff32ab334973 qtsensors-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.4/submodules/qtsensors-opensource-src-5.9.4.tar.xz.mirrorlist
-sha256 793f3aa056b7ce9ae91acb599eab80525983e5e973bb4a2fdba82776ec9cd458 qtsensors-opensource-src-5.9.4.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.10/5.10.1/submodules/qtsensors-everywhere-src-5.10.1.tar.xz.mirrorlist
+sha256 bb0df76c0e53cf2b39d10dbf0964706a264413aae74a4596119143ab4d165c96  qtsensors-everywhere-src-5.10.1.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5sensors/qt5sensors.mk b/package/qt5/qt5sensors/qt5sensors.mk
index d4dc47e89c..805abcccd1 100644
--- a/package/qt5/qt5sensors/qt5sensors.mk
+++ b/package/qt5/qt5sensors/qt5sensors.mk
@@ -6,7 +6,7 @@
 
 QT5SENSORS_VERSION = $(QT5_VERSION)
 QT5SENSORS_SITE = $(QT5_SITE)
-QT5SENSORS_SOURCE = qtsensors-opensource-src-$(QT5SENSORS_VERSION).tar.xz
+QT5SENSORS_SOURCE = qtsensors-$(QT5_SOURCE_TARBALL_PREFIX)-$(QT5SENSORS_VERSION).tar.xz
 QT5SENSORS_DEPENDENCIES = qt5base
 QT5SENSORS_INSTALL_STAGING = YES
 
diff --git a/package/qt5/qt5serialbus/qt5serialbus.hash b/package/qt5/qt5serialbus/qt5serialbus.hash
index 005fd0b5dc..d392897816 100644
--- a/package/qt5/qt5serialbus/qt5serialbus.hash
+++ b/package/qt5/qt5serialbus/qt5serialbus.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtserialbus-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 71c89be3879414e2a11cad93a4882758f9259b1c0aec980560309192c99f9a9e qtserialbus-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.4/submodules/qtserialbus-opensource-src-5.9.4.tar.xz.mirrorlist
-sha256 ce91402e9781ef6ff37e313ce504b7f6fecb74e83d57d640fcbf82f1133fcbc4 qtserialbus-opensource-src-5.9.4.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.10/5.10.1/submodules/qtserialbus-everywhere-src-5.10.1.tar.xz.mirrorlist
+sha256 0650a17950f140130ec20520b06592618850cc5673a815cb4fd585590d922257  qtserialbus-everywhere-src-5.10.1.tar.xz
 
 # Hashes for license files:
 sha256 edfe70e99be2a7c109d860b19204609e582720b211c50caedac729da372a1253 LICENSE.GPLv2
diff --git a/package/qt5/qt5serialbus/qt5serialbus.mk b/package/qt5/qt5serialbus/qt5serialbus.mk
index 218aba4e0a..c9a2139556 100644
--- a/package/qt5/qt5serialbus/qt5serialbus.mk
+++ b/package/qt5/qt5serialbus/qt5serialbus.mk
@@ -6,7 +6,7 @@
 
 QT5SERIALBUS_VERSION = $(QT5_VERSION)
 QT5SERIALBUS_SITE = $(QT5_SITE)
-QT5SERIALBUS_SOURCE = qtserialbus-opensource-src-$(QT5SERIALBUS_VERSION).tar.xz
+QT5SERIALBUS_SOURCE = qtserialbus-$(QT5_SOURCE_TARBALL_PREFIX)-$(QT5SERIALBUS_VERSION).tar.xz
 QT5SERIALBUS_DEPENDENCIES = qt5base qt5serialport
 QT5SERIALBUS_INSTALL_STAGING = YES
 
diff --git a/package/qt5/qt5serialport/qt5serialport.hash b/package/qt5/qt5serialport/qt5serialport.hash
index 04122ef804..544371d391 100644
--- a/package/qt5/qt5serialport/qt5serialport.hash
+++ b/package/qt5/qt5serialport/qt5serialport.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtserialport-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 082d1fee2703aed19f840c4e4031e37c9b929e5bd8ebef2ebac4b28c509bae1a qtserialport-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.4/submodules/qtserialport-opensource-src-5.9.4.tar.xz.mirrorlist
-sha256 0c3d8e2908743c167113ce27be7b685e6f5c827c108107411d0c4c8b2f2b519c qtserialport-opensource-src-5.9.4.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.10/5.10.1/submodules/qtserialport-everywhere-src-5.10.1.tar.xz.mirrorlist
+sha256 08e4cb13bbf165eb99857301f3cffe280a4946ff58a34ccc542ad1f790194a9e  qtserialport-everywhere-src-5.10.1.tar.xz
 
 # Hashes for license files:
 sha256 edfe70e99be2a7c109d860b19204609e582720b211c50caedac729da372a1253 LICENSE.GPLv2
diff --git a/package/qt5/qt5serialport/qt5serialport.mk b/package/qt5/qt5serialport/qt5serialport.mk
index 479870b16e..20237aed16 100644
--- a/package/qt5/qt5serialport/qt5serialport.mk
+++ b/package/qt5/qt5serialport/qt5serialport.mk
@@ -6,7 +6,7 @@
 
 QT5SERIALPORT_VERSION = $(QT5_VERSION)
 QT5SERIALPORT_SITE = $(QT5_SITE)
-QT5SERIALPORT_SOURCE = qtserialport-opensource-src-$(QT5SERIALPORT_VERSION).tar.xz
+QT5SERIALPORT_SOURCE = qtserialport-$(QT5_SOURCE_TARBALL_PREFIX)-$(QT5SERIALPORT_VERSION).tar.xz
 QT5SERIALPORT_DEPENDENCIES = qt5base
 QT5SERIALPORT_INSTALL_STAGING = YES
 
diff --git a/package/qt5/qt5svg/qt5svg.hash b/package/qt5/qt5svg/qt5svg.hash
index a94082c4bf..3a10080e29 100644
--- a/package/qt5/qt5svg/qt5svg.hash
+++ b/package/qt5/qt5svg/qt5svg.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtsvg-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 100f183517b46554079beabd8d2cabe3070a74dd0a2e64b6a304eac71cfadcec qtsvg-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.4/submodules/qtsvg-opensource-src-5.9.4.tar.xz.mirrorlist
-sha256 a2f22732bfd4f0f0204443daaa59448298ab5018750dce4600d01d969355037a qtsvg-opensource-src-5.9.4.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.10/5.10.1/submodules/qtsvg-everywhere-src-5.10.1.tar.xz.mirrorlist
+sha256 00e00c04abcc8363cf7d94ca8b16af61840995a4af23685d49fa4ccafa1c7f5a  qtsvg-everywhere-src-5.10.1.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5svg/qt5svg.mk b/package/qt5/qt5svg/qt5svg.mk
index 5a12755f94..168c4c063f 100644
--- a/package/qt5/qt5svg/qt5svg.mk
+++ b/package/qt5/qt5svg/qt5svg.mk
@@ -6,7 +6,7 @@
 
 QT5SVG_VERSION = $(QT5_VERSION)
 QT5SVG_SITE = $(QT5_SITE)
-QT5SVG_SOURCE = qtsvg-opensource-src-$(QT5SVG_VERSION).tar.xz
+QT5SVG_SOURCE = qtsvg-$(QT5_SOURCE_TARBALL_PREFIX)-$(QT5SVG_VERSION).tar.xz
 QT5SVG_DEPENDENCIES = qt5base
 QT5SVG_INSTALL_STAGING = YES
 
diff --git a/package/qt5/qt5tools/qt5tools.hash b/package/qt5/qt5tools/qt5tools.hash
index 40176e6aee..83e6ef41be 100644
--- a/package/qt5/qt5tools/qt5tools.hash
+++ b/package/qt5/qt5tools/qt5tools.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qttools-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 1a63ba838058d73cb540040589b235ded77f76402693decfd6d4d3c75ea67926 qttools-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.4/submodules/qttools-opensource-src-5.9.4.tar.xz.mirrorlist
-sha256 95aa5782d5a79be22fba36cea4dc2319cf2a2060a3cc1e24e6585b8d98996e87 qttools-opensource-src-5.9.4.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.10/5.10.1/submodules/qttools-everywhere-src-5.10.1.tar.xz.mirrorlist
+sha256 f1ea441e5fe138756e6de3b60ab7d8d3051799eabe85a9408c995dfd4d048a53  qttools-everywhere-src-5.10.1.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5tools/qt5tools.mk b/package/qt5/qt5tools/qt5tools.mk
index cf181e576b..a972756d3a 100644
--- a/package/qt5/qt5tools/qt5tools.mk
+++ b/package/qt5/qt5tools/qt5tools.mk
@@ -6,7 +6,7 @@
 
 QT5TOOLS_VERSION = $(QT5_VERSION)
 QT5TOOLS_SITE = $(QT5_SITE)
-QT5TOOLS_SOURCE = qttools-opensource-src-$(QT5TOOLS_VERSION).tar.xz
+QT5TOOLS_SOURCE = qttools-$(QT5_SOURCE_TARBALL_PREFIX)-$(QT5TOOLS_VERSION).tar.xz
 
 QT5TOOLS_DEPENDENCIES = qt5base
 QT5TOOLS_INSTALL_STAGING = YES
diff --git a/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.hash b/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.hash
index 81c81edff1..44ef1f230f 100644
--- a/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.hash
+++ b/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.4/submodules/qtvirtualkeyboard-opensource-src-5.9.4.tar.xz.mirrorlist
-sha256 bf742a886054f12a73621952879cf7a2182304c498bc31ec8a61ef376b07e1ee qtvirtualkeyboard-opensource-src-5.9.4.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.10/5.10.1/submodules/qtvirtualkeyboard-everywhere-src-5.10.1.tar.xz.mirrorlist
+sha256 4319f90e68a571974d03f39507dde548971412e31f971081ca7eaf388187d52e  qtvirtualkeyboard-everywhere-src-5.10.1.tar.xz
 
 # Hashes for license files:
 sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903 LICENSE.GPL3
diff --git a/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk b/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk
index 7d2201b55d..bd943b08ac 100644
--- a/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk
+++ b/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk
@@ -6,7 +6,7 @@
 
 QT5VIRTUALKEYBOARD_VERSION = $(QT5_VERSION)
 QT5VIRTUALKEYBOARD_SITE = $(QT5_SITE)
-QT5VIRTUALKEYBOARD_SOURCE = qtvirtualkeyboard-opensource-src-$(QT5VIRTUALKEYBOARD_VERSION).tar.xz
+QT5VIRTUALKEYBOARD_SOURCE = qtvirtualkeyboard-$(QT5_SOURCE_TARBALL_PREFIX)-$(QT5VIRTUALKEYBOARD_VERSION).tar.xz
 QT5VIRTUALKEYBOARD_DEPENDENCIES = qt5base qt5declarative qt5svg
 QT5VIRTUALKEYBOARD_INSTALL_STAGING = YES
 
diff --git a/package/qt5/qt5wayland/qt5wayland.hash b/package/qt5/qt5wayland/qt5wayland.hash
index 86dc65179f..b28677ad29 100644
--- a/package/qt5/qt5wayland/qt5wayland.hash
+++ b/package/qt5/qt5wayland/qt5wayland.hash
@@ -1,8 +1,8 @@
 # hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtwayland-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 5a475278b2db73aa7fa7f3ba6d98d8d72774f5c77e172495007d79f91d09daa3 qtwayland-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.4/submodules/qtwayland-opensource-src-5.9.4.tar.xz.mirrorlist
-sha256 3f7496522013e6122bb8dc00d0c3cc7753a44dca94fa3b22096eaa21e6099874 qtwayland-opensource-src-5.9.4.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.10/5.10.1/submodules/qtwayland-everywhere-src-5.10.1.tar.xz.mirrorlist
+sha256 f5a7643a5ebcdc50d02b293191e675f387f67dc360c27bf6f94345372fba6356  qtwayland-everywhere-src-5.10.1.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5wayland/qt5wayland.mk b/package/qt5/qt5wayland/qt5wayland.mk
index 8a7f2e1fb5..2fc7ca80da 100644
--- a/package/qt5/qt5wayland/qt5wayland.mk
+++ b/package/qt5/qt5wayland/qt5wayland.mk
@@ -6,7 +6,7 @@
 
 QT5WAYLAND_VERSION = $(QT5_VERSION)
 QT5WAYLAND_SITE = $(QT5_SITE)
-QT5WAYLAND_SOURCE = qtwayland-opensource-src-$(QT5WAYLAND_VERSION).tar.xz
+QT5WAYLAND_SOURCE = qtwayland-$(QT5_SOURCE_TARBALL_PREFIX)-$(QT5WAYLAND_VERSION).tar.xz
 QT5WAYLAND_DEPENDENCIES = qt5base qt5declarative wayland
 QT5WAYLAND_INSTALL_STAGING = YES
 
diff --git a/package/qt5/qt5webchannel/qt5webchannel.hash b/package/qt5/qt5webchannel/qt5webchannel.hash
index f1b69438d8..f94942f577 100644
--- a/package/qt5/qt5webchannel/qt5webchannel.hash
+++ b/package/qt5/qt5webchannel/qt5webchannel.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtwebchannel-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 8eb1b0ac2286653c7932758c21e7760788a5d7cfd6162da09afa926d5be50713 qtwebchannel-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.4/submodules/qtwebchannel-opensource-src-5.9.4.tar.xz.mirrorlist
-sha256 90303a72da63f250b6d6731b74827b0a1764904aac790a7264a3f65c94039aa9 qtwebchannel-opensource-src-5.9.4.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.10/5.10.1/submodules/qtwebchannel-everywhere-src-5.10.1.tar.xz.mirrorlist
+sha256 c22c449fecb052597d12f8dd59498db39767037f9098123f3defc04eb20a3764  qtwebchannel-everywhere-src-5.10.1.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5webchannel/qt5webchannel.mk b/package/qt5/qt5webchannel/qt5webchannel.mk
index d46e053a53..f1c08532c0 100644
--- a/package/qt5/qt5webchannel/qt5webchannel.mk
+++ b/package/qt5/qt5webchannel/qt5webchannel.mk
@@ -6,7 +6,7 @@
 
 QT5WEBCHANNEL_VERSION = $(QT5_VERSION)
 QT5WEBCHANNEL_SITE = $(QT5_SITE)
-QT5WEBCHANNEL_SOURCE = qtwebchannel-opensource-src-$(QT5WEBCHANNEL_VERSION).tar.xz
+QT5WEBCHANNEL_SOURCE = qtwebchannel-$(QT5_SOURCE_TARBALL_PREFIX)-$(QT5WEBCHANNEL_VERSION).tar.xz
 QT5WEBCHANNEL_DEPENDENCIES = qt5base qt5websockets
 QT5WEBCHANNEL_INSTALL_STAGING = YES
 
diff --git a/package/qt5/qt5webengine/Config.in b/package/qt5/qt5webengine/Config.in
index 7c99255061..969582712e 100644
--- a/package/qt5/qt5webengine/Config.in
+++ b/package/qt5/qt5webengine/Config.in
@@ -38,6 +38,7 @@ config BR2_PACKAGE_QT5WEBENGINE
 	select BR2_HOSTARCH_NEEDS_IA32_COMPILER if !BR2_ARCH_IS_64 # v8/chromium
 	select BR2_PACKAGE_FFMPEG
 	select BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_LIBNSS if !BR2_PACKAGE_QT5_VERSION_5_6
 	select BR2_PACKAGE_LIBVPX
 	select BR2_PACKAGE_OPUS
 	select BR2_PACKAGE_WEBP
diff --git a/package/qt5/qt5webengine/qt5webengine.hash b/package/qt5/qt5webengine/qt5webengine.hash
index 9195c7f3b6..3b54435822 100644
--- a/package/qt5/qt5webengine/qt5webengine.hash
+++ b/package/qt5/qt5webengine/qt5webengine.hash
@@ -1,5 +1,5 @@
 # Hash from https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtwebengine-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 009d69fb39f6c0e2b0cd89a7e9302cd0ae1872d02c787d3a37f2cacca5ddb7a7 qtwebengine-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.4/submodules/qtwebengine-opensource-src-5.9.4.tar.xz.mirrorlist
-sha256 04b4305489b326bbbfe32b5f1da4a33ae034e54130776e3616b9e6d45a5a8271 qtwebengine-opensource-src-5.9.4.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.10/5.10.1/submodules/qtwebengine-everywhere-src-5.10.1.tar.xz.mirrorlist
+sha256 12644f8d2ba8354a2a533d5a7f3f5139c6ff168c2f51aa3e21b701db6dbc01de  qtwebengine-everywhere-src-5.10.1.tar.xz
diff --git a/package/qt5/qt5webengine/qt5webengine.mk b/package/qt5/qt5webengine/qt5webengine.mk
index 4d423f8329..aa4f982709 100644
--- a/package/qt5/qt5webengine/qt5webengine.mk
+++ b/package/qt5/qt5webengine/qt5webengine.mk
@@ -6,7 +6,7 @@
 
 QT5WEBENGINE_VERSION = $(QT5_VERSION)
 QT5WEBENGINE_SITE = $(QT5_SITE)
-QT5WEBENGINE_SOURCE = qtwebengine-opensource-src-$(QT5WEBENGINE_VERSION).tar.xz
+QT5WEBENGINE_SOURCE = qtwebengine-$(QT5_SOURCE_TARBALL_PREFIX)-$(QT5WEBENGINE_VERSION).tar.xz
 QT5WEBENGINE_DEPENDENCIES = ffmpeg libglib2 libvpx opus webp qt5base \
 	qt5declarative qt5webchannel host-bison host-flex host-gperf \
 	host-pkgconf host-python
@@ -22,6 +22,10 @@ QT5WEBENGINE_DEPENDENCIES += xlib_libXScrnSaver xlib_libXcomposite \
 	xlib_libXcursor xlib_libXi xlib_libXrandr xlib_libXtst
 endif
 
+ifneq ($(BR2_PACKAGE_QT5_VERSION_5_6),y)
+QT5WEBENGINE_DEPENDENCIES += host-libpng host-libnss libnss
+endif
+
 QT5WEBENGINE_QMAKEFLAGS += WEBENGINE_CONFIG+=use_system_ffmpeg
 
 ifeq ($(BR2_PACKAGE_QT5WEBENGINE_PROPRIETARY_CODECS),y)
@@ -44,6 +48,8 @@ define QT5WEBENGINE_PYTHON2_SYMLINK
 endef
 QT5WEBENGINE_PRE_CONFIGURE_HOOKS += QT5WEBENGINE_PYTHON2_SYMLINK
 
+QT5WEBENGINE_ENV += GN_PKG_CONFIG_HOST=host-pkg-config
+
 define QT5WEBENGINE_CONFIGURE_CMDS
 	(cd $(@D); $(TARGET_MAKE_ENV) $(QT5WEBENGINE_ENV) $(HOST_DIR)/bin/qmake $(QT5WEBENGINE_QMAKEFLAGS))
 endef
diff --git a/package/qt5/qt5webkit-examples/qt5webkit-examples.mk b/package/qt5/qt5webkit-examples/qt5webkit-examples.mk
index 4c01d8318a..94153fd652 100644
--- a/package/qt5/qt5webkit-examples/qt5webkit-examples.mk
+++ b/package/qt5/qt5webkit-examples/qt5webkit-examples.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-# no 5.9.2 package available, fall back to 5.9.1 version
+# no 5.10 package available, fall back to 5.9.1 version
 ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
 QT5WEBKIT_EXAMPLES_VERSION = 5.9.1
 QT5WEBKIT_EXAMPLES_SITE = https://download.qt.io/official_releases/qt/5.9/5.9.1/submodules
diff --git a/package/qt5/qt5websockets/qt5websockets.hash b/package/qt5/qt5websockets/qt5websockets.hash
index 368be9b497..34cd6e6ce1 100644
--- a/package/qt5/qt5websockets/qt5websockets.hash
+++ b/package/qt5/qt5websockets/qt5websockets.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtwebsockets-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 a2439045616c89dfe06333734ff4726075c92e01db6e6b6863bc138e39c028eb qtwebsockets-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.4/submodules/qtwebsockets-opensource-src-5.9.4.tar.xz.mirrorlist
-sha256 72970209f0d4260d11688d3d38d9e953d7fa4309a8a55e2c32726a545333e800 qtwebsockets-opensource-src-5.9.4.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.10/5.10.1/submodules/qtwebsockets-everywhere-src-5.10.1.tar.xz.mirrorlist
+sha256 6ecf790955ffe42dce731e10557f4ba625e359e867953d73f7fb453c0bad53ea  qtwebsockets-everywhere-src-5.10.1.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5websockets/qt5websockets.mk b/package/qt5/qt5websockets/qt5websockets.mk
index 4cb2aed1db..4d9df9257b 100644
--- a/package/qt5/qt5websockets/qt5websockets.mk
+++ b/package/qt5/qt5websockets/qt5websockets.mk
@@ -6,7 +6,7 @@
 
 QT5WEBSOCKETS_VERSION = $(QT5_VERSION)
 QT5WEBSOCKETS_SITE = $(QT5_SITE)
-QT5WEBSOCKETS_SOURCE = qtwebsockets-opensource-src-$(QT5WEBSOCKETS_VERSION).tar.xz
+QT5WEBSOCKETS_SOURCE = qtwebsockets-$(QT5_SOURCE_TARBALL_PREFIX)-$(QT5WEBSOCKETS_VERSION).tar.xz
 QT5WEBSOCKETS_DEPENDENCIES = qt5base
 QT5WEBSOCKETS_INSTALL_STAGING = YES
 
diff --git a/package/qt5/qt5x11extras/qt5x11extras.hash b/package/qt5/qt5x11extras/qt5x11extras.hash
index 943577bbd6..173e9e6b57 100644
--- a/package/qt5/qt5x11extras/qt5x11extras.hash
+++ b/package/qt5/qt5x11extras/qt5x11extras.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtx11extras-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 1e7a8e96e0629f2b2b78de684b156b357210cf5df6b42f30789423f2cb07677f qtx11extras-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.4/submodules/qtx11extras-opensource-src-5.9.4.tar.xz.mirrorlist
-sha256 879b18c44550e1be86c29adcca555c92915aab9222c40384beae2f7aa22b22a8 qtx11extras-opensource-src-5.9.4.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.10/5.10.1/submodules/qtx11extras-everywhere-src-5.10.1.tar.xz.mirrorlist
+sha256 c38a371fd50b2da976ed809230678284f029cefb02d240253dcbb3d575dc97b4  qtx11extras-everywhere-src-5.10.1.tar.xz
 
 # Hashes for license files:
 sha256 edfe70e99be2a7c109d860b19204609e582720b211c50caedac729da372a1253 LICENSE.GPLv2
diff --git a/package/qt5/qt5x11extras/qt5x11extras.mk b/package/qt5/qt5x11extras/qt5x11extras.mk
index 0905d5f738..c439e2d31d 100644
--- a/package/qt5/qt5x11extras/qt5x11extras.mk
+++ b/package/qt5/qt5x11extras/qt5x11extras.mk
@@ -6,7 +6,7 @@
 
 QT5X11EXTRAS_VERSION = $(QT5_VERSION)
 QT5X11EXTRAS_SITE = $(QT5_SITE)
-QT5X11EXTRAS_SOURCE = qtx11extras-opensource-src-$(QT5X11EXTRAS_VERSION).tar.xz
+QT5X11EXTRAS_SOURCE = qtx11extras-$(QT5_SOURCE_TARBALL_PREFIX)-$(QT5X11EXTRAS_VERSION).tar.xz
 QT5X11EXTRAS_DEPENDENCIES = qt5base
 QT5X11EXTRAS_INSTALL_STAGING = YES
 
diff --git a/package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash b/package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash
index 9c68eae1d8..8210993782 100644
--- a/package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash
+++ b/package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtxmlpatterns-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 a461ff9f0d7310de9b9904ff9cd34919e958bf4071a6fc7096450b8990ab51f6 qtxmlpatterns-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.4/submodules/qtxmlpatterns-opensource-src-5.9.4.tar.xz.mirrorlist
-sha256 faf51ad39e5c2b856b38989c79d69253ad74d4b8d3278d4aaa79d3c547047f79 qtxmlpatterns-opensource-src-5.9.4.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.10/5.10.1/submodules/qtxmlpatterns-everywhere-src-5.10.1.tar.xz.mirrorlist
+sha256 3cdef59ce96a796606e5adc5756c63c8607fb29b281fddb38acee3e674d5e9fe  qtxmlpatterns-everywhere-src-5.10.1.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk b/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk
index 65fd9bd345..d4626dbe36 100644
--- a/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk
+++ b/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk
@@ -6,7 +6,7 @@
 
 QT5XMLPATTERNS_VERSION = $(QT5_VERSION)
 QT5XMLPATTERNS_SITE = $(QT5_SITE)
-QT5XMLPATTERNS_SOURCE = qtxmlpatterns-opensource-src-$(QT5XMLPATTERNS_VERSION).tar.xz
+QT5XMLPATTERNS_SOURCE = qtxmlpatterns-$(QT5_SOURCE_TARBALL_PREFIX)-$(QT5XMLPATTERNS_VERSION).tar.xz
 QT5XMLPATTERNS_DEPENDENCIES = qt5base
 QT5XMLPATTERNS_INSTALL_STAGING = YES
 
-- 
2.16.1
