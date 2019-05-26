From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 26 May 2019 20:04:50 +0200
Subject: [Buildroot] [git commit] package/qt5multimedia: fix install with
 gstreamer 0.10 and QT 5.6
Message-ID: <20190526175847.1BB498E035@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=39393f2d77407de212bcfe9aee34a03d9c9ab469
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

QT 5.6 fails to correctly detect gstreamer support with gstreamer 0.10
as a result libqgsttools_p.so is not built and build fails on:
cp: cannot stat '/home/buildroot/autobuild/run/instance-1/output/host/xtensa-buildroot-linux-uclibc/sysroot/usr/lib/libqgsttools*.so.*': No such file or directory

Fixes:
 - http://autobuild.buildroot.org/results/c88afcd365418e29c89f247d9d887b5f786b0ec8

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/qt5/qt5multimedia/qt5multimedia.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/qt5/qt5multimedia/qt5multimedia.mk b/package/qt5/qt5multimedia/qt5multimedia.mk
index 0a27c857e5..b8a1c4ff75 100644
--- a/package/qt5/qt5multimedia/qt5multimedia.mk
+++ b/package/qt5/qt5multimedia/qt5multimedia.mk
@@ -53,7 +53,7 @@ endef
 ifeq ($(BR2_STATIC_LIBS),)
 # since Qt5.10.1 libqgsttools was renamed to libQtMultimediaGstTools
 # and is installed by the default target install step below
-ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST)x$(BR2_PACKAGE_GST_PLUGINS_BASE)$(BR2_PACKAGE_GST1_PLUGINS_BASE),xy)
+ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST)x$(BR2_PACKAGE_GST1_PLUGINS_BASE),xy)
 define QT5MULTIMEDIA_INSTALL_TARGET_QGSTTOOLS_LIB
 	cp -dpf $(STAGING_DIR)/usr/lib/libqgsttools*.so.* $(TARGET_DIR)/usr/lib
 endef
