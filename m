From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 27 Feb 2020 23:52:18 +0100
Subject: [Buildroot] [git commit branch/next] package/qt5multimedia: drop qt
 5.6 support
Message-ID: <20200227224529.D5C048E865@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=be8015ac6d85a31542834e0198dccab07aa5e177
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qt5/qt5multimedia/qt5multimedia.hash |  7 -------
 package/qt5/qt5multimedia/qt5multimedia.mk   | 14 --------------
 2 files changed, 21 deletions(-)

diff --git a/package/qt5/qt5multimedia/qt5multimedia.hash b/package/qt5/qt5multimedia/qt5multimedia.hash
index 016ec44cee..a4df5af5dc 100644
--- a/package/qt5/qt5multimedia/qt5multimedia.hash
+++ b/package/qt5/qt5multimedia/qt5multimedia.hash
@@ -1,6 +1,3 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtmultimedia-opensource-src-5.6.3.tar.xz.mirrorlist
-sha256 ae36039ea8037742342f1615687e0ca2188f3ed0d700627a5e5be546c15e1b46 qtmultimedia-opensource-src-5.6.3.tar.xz
-
 # Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.7/submodules/qtmultimedia-everywhere-src-5.12.7.tar.xz.sha256
 sha256 28bdaa81371f922223775ae5171c4d589a2c07f255abbe5ccf130ecbbdb4db1d qtmultimedia-everywhere-src-5.12.7.tar.xz
 
@@ -10,8 +7,4 @@ sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903 LICENSE.
 sha256 0dbe024961f6ab5c52689cbd036c977975d0d0f6a67ff97762d96cb819dd5652 LICENSE.GPL3-EXCEPT
 sha256 da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768 LICENSE.LGPL3
 sha256 ed8742a95cb9db653a09b050e27ccff5e67ba69c14aa2c3137f2a4e1892f6c0d LICENSE.FDL
-sha256 245248009fd0af1725d183248380e476c1283383909358a13686606352bf2a17 LICENSE.GPLv3
-sha256 1996a36160b2158c2be264d2ddfa6148ebe0f1ececff55aca8d754a1ddcc7bb8 LICENSE.LGPLv21
-sha256 438c1f9a2b256e47dac33249f2ad6d4a9df643f1ec5312216d528a2f7ad82084 LGPL_EXCEPTION.txt
-sha256 5ceb37d1c7c1d92878b82af3c0fd5558087f3d5a08a3a4d43850bad4ad265a52 LICENSE.LGPLv3
 sha256 c1d75c15db4409bcbb182180d582f410a263dc9a631cd546b256e95f1da42165 examples/multimedia/spectrum/3rdparty/fftreal/license.txt
diff --git a/package/qt5/qt5multimedia/qt5multimedia.mk b/package/qt5/qt5multimedia/qt5multimedia.mk
index e598140a9a..0e9a6b97c9 100644
--- a/package/qt5/qt5multimedia/qt5multimedia.mk
+++ b/package/qt5/qt5multimedia/qt5multimedia.mk
@@ -10,13 +10,8 @@ QT5MULTIMEDIA_SOURCE = qtmultimedia-$(QT5_SOURCE_TARBALL_PREFIX)-$(QT5MULTIMEDIA
 QT5MULTIMEDIA_DEPENDENCIES = qt5base
 QT5MULTIMEDIA_INSTALL_STAGING = YES
 
-ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
 QT5MULTIMEDIA_LICENSE = GPL-2.0+ or LGPL-3.0, GPL-3.0 with exception(tools), GFDL-1.3 (docs)
 QT5MULTIMEDIA_LICENSE_FILES = LICENSE.GPL2 LICENSE.GPL3 LICENSE.GPL3-EXCEPT LICENSE.LGPL3 LICENSE.FDL
-else
-QT5MULTIMEDIA_LICENSE = GPL-3.0 or LGPL-2.1 with exception or LGPL-3.0, GFDL-1.3 (docs)
-QT5MULTIMEDIA_LICENSE_FILES = LICENSE.GPLv3 LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3 LICENSE.FDL
-endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE),y)
 QT5MULTIMEDIA_DEPENDENCIES += gst1-plugins-base
@@ -47,18 +42,9 @@ define QT5MULTIMEDIA_INSTALL_STAGING_CMDS
 endef
 
 ifeq ($(BR2_STATIC_LIBS),)
-# since Qt5.10.1 libqgsttools was renamed to libQtMultimediaGstTools
-# and is installed by the default target install step below
-ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST)x$(BR2_PACKAGE_GST1_PLUGINS_BASE),xy)
-define QT5MULTIMEDIA_INSTALL_TARGET_QGSTTOOLS_LIB
-	cp -dpf $(STAGING_DIR)/usr/lib/libqgsttools*.so.* $(TARGET_DIR)/usr/lib
-endef
-endif
-
 define QT5MULTIMEDIA_INSTALL_TARGET_LIBS
 	cp -dpf $(STAGING_DIR)/usr/lib/libQt5Multimedia*.so.* $(TARGET_DIR)/usr/lib
 	cp -dpfr $(STAGING_DIR)/usr/lib/qt/plugins/* $(TARGET_DIR)/usr/lib/qt/plugins
-	$(QT5MULTIMEDIA_INSTALL_TARGET_QGSTTOOLS_LIB)
 endef
 endif # !BR2_STATIC_LIBS
 
