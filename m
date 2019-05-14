From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 14 May 2019 23:09:53 +0200
Subject: [Buildroot] [git commit] package/qt5multimedia: put back gstreamer
 0.10 optional dependency
Message-ID: <20190514210432.6E4E98A63C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=460ee0dbe0b46c55a6ae6729c3dec863e8db97ac
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit b2e16ea64a6f89a82098625bb93db020ea5d4db4 tried to remove
gstreamer 0.10 support by removing its dependency but this was just
masking the issue as we have a build failure with gstreamer 0.10

So put back this dependency.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/qt5/qt5multimedia/qt5multimedia.mk | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/qt5/qt5multimedia/qt5multimedia.mk b/package/qt5/qt5multimedia/qt5multimedia.mk
index 7d332b0304..0a27c857e5 100644
--- a/package/qt5/qt5multimedia/qt5multimedia.mk
+++ b/package/qt5/qt5multimedia/qt5multimedia.mk
@@ -18,6 +18,10 @@ QT5MULTIMEDIA_LICENSE = GPL-3.0 or LGPL-2.1 with exception or LGPL-3.0, GFDL-1.3
 QT5MULTIMEDIA_LICENSE_FILES = LICENSE.GPLv3 LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3 LICENSE.FDL
 endif
 
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BASE),y)
+QT5MULTIMEDIA_DEPENDENCIES += gst-plugins-base
+endif
+
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE),y)
 QT5MULTIMEDIA_DEPENDENCIES += gst1-plugins-base
 endif
@@ -49,7 +53,7 @@ endef
 ifeq ($(BR2_STATIC_LIBS),)
 # since Qt5.10.1 libqgsttools was renamed to libQtMultimediaGstTools
 # and is installed by the default target install step below
-ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST)x$(BR2_PACKAGE_GST1_PLUGINS_BASE),xy)
+ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST)x$(BR2_PACKAGE_GST_PLUGINS_BASE)$(BR2_PACKAGE_GST1_PLUGINS_BASE),xy)
 define QT5MULTIMEDIA_INSTALL_TARGET_QGSTTOOLS_LIB
 	cp -dpf $(STAGING_DIR)/usr/lib/libqgsttools*.so.* $(TARGET_DIR)/usr/lib
 endef
