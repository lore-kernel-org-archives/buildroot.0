From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 27 Aug 2015 20:24:18 +0200
Subject: [Buildroot] [git commit] package/qt5/qt5multimedia: fix gstreamer1
	support
Message-ID: <20150827182426.CD96881EAC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a0f3a2b88d27df6f3e8e3d45bd8a0506a3d09455
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the missing gstreamer1 build dependencies, which could possibly
prevent the configuration of qt5multimedia from detecting the supported
gstreamer1 features.

Fix the missing gstreamer1 install rules, which resulted in the
following runtime error:

    defaultServiceProvider::requestService(): no service found for - "org.qt-project.qt.mediaplayer"

Signed-off-by: Beno??t Th??baudeau <benoit@wsystem.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/qt5/qt5multimedia/qt5multimedia.mk |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/package/qt5/qt5multimedia/qt5multimedia.mk b/package/qt5/qt5multimedia/qt5multimedia.mk
index 763fc28..50fdd57 100644
--- a/package/qt5/qt5multimedia/qt5multimedia.mk
+++ b/package/qt5/qt5multimedia/qt5multimedia.mk
@@ -21,6 +21,9 @@ endif
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BASE),y)
 QT5MULTIMEDIA_DEPENDENCIES += gst-plugins-base
 endif
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE),y)
+QT5MULTIMEDIA_DEPENDENCIES += gst1-plugins-base
+endif
 
 ifeq ($(BR2_PACKAGE_QT5DECLARATIVE),y)
 QT5MULTIMEDIA_DEPENDENCIES += qt5declarative
@@ -40,7 +43,7 @@ define QT5MULTIMEDIA_INSTALL_STAGING_CMDS
 endef
 
 ifeq ($(BR2_STATIC_LIBS),)
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_BASE),y)
+ifneq ($(BR2_PACKAGE_GST_PLUGINS_BASE)$(BR2_PACKAGE_GST1_PLUGINS_BASE),)
 define QT5MULTIMEDIA_INSTALL_TARGET_QGSTTOOLS_LIB
 	cp -dpf $(STAGING_DIR)/usr/lib/libqgsttools*.so.* $(TARGET_DIR)/usr/lib
 endef
