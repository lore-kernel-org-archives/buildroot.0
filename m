From: Nathan Ford <nford@westpond.com>
Date: Wed, 22 Jan 2020 11:19:22 -0500
Subject: [Buildroot] [PATCH 1/1] package/qt5/qt5webengine: Fix building
 against system ffmpeg
Message-ID: <CAOgXH4cKir4gopXC8vi0rENaamo4aw=Epv2dShmCgRv3wwNFQg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 As of QT 5.10 the WEBENGINE_CONFIG options have been
 removed in favor of configure command line options.
 dist/changes-5.9.0 and dist/changes-5.10.0 document
 this.

qt5webengine also now requires webp mux support or the auto
detection of ffmpeg will fail.

This fixes bug 12416

Signed-off-by: Nathan Ford <nford@westpond.com>

diff --git a/package/qt5/qt5webengine/Config.in
b/package/qt5/qt5webengine/Config.in
index 0e776ec..18e4418 100644
--- a/package/qt5/qt5webengine/Config.in
+++ b/package/qt5/qt5webengine/Config.in
@@ -42,6 +42,7 @@ config BR2_PACKAGE_QT5WEBENGINE
        select BR2_PACKAGE_OPUS
        select BR2_PACKAGE_WEBP
        select BR2_PACKAGE_WEBP_DEMUX
+       select BR2_PACKAGE_WEBP_MUX
        select BR2_PACKAGE_QT5BASE_DBUS
        select BR2_PACKAGE_QT5BASE_EGLFS
        select BR2_PACKAGE_QT5BASE_FONTCONFIG
diff --git a/package/qt5/qt5webengine/qt5webengine.mk
b/package/qt5/qt5webengine/qt5webengine.mk
index 1d5ee8d..5a2ca6d 100644
--- a/package/qt5/qt5webengine/qt5webengine.mk
+++ b/package/qt5/qt5webengine/qt5webengine.mk
@@ -30,16 +30,16 @@ ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
 QT5WEBENGINE_DEPENDENCIES += host-libpng host-libnss libnss
 endif

-QT5WEBENGINE_QMAKEFLAGS += WEBENGINE_CONFIG+=use_system_ffmpeg
+QT5WEBENGINE_QMAKEFLAGS += -webengine-ffmpeg

 ifeq ($(BR2_PACKAGE_QT5WEBENGINE_PROPRIETARY_CODECS),y)
-QT5WEBENGINE_QMAKEFLAGS += WEBENGINE_CONFIG+=use_proprietary_codecs
+QT5WEBENGINE_QMAKEFLAGS += -webengine-proprietary-codecs
 endif

 ifeq ($(BR2_PACKAGE_QT5WEBENGINE_ALSA),y)
 QT5WEBENGINE_DEPENDENCIES += alsa-lib
 else
-QT5WEBENGINE_QMAKEFLAGS += QT_CONFIG-=alsa
+QT5WEBENGINE_QMAKEFLAGS += -no-webengine-alsa
 endif

 # QtWebengine's build system uses python, but only supports python2. We work
@@ -64,7 +64,7 @@ QT5WEBENGINE_ENV +=
GN_PKG_CONFIG_HOST=$(@D)/host-bin/host-pkg-config
 endif

 define QT5WEBENGINE_CONFIGURE_CMDS
-       (cd $(@D); $(TARGET_MAKE_ENV) $(QT5WEBENGINE_ENV)
$(HOST_DIR)/bin/qmake $(QT5WEBENGINE_QMAKEFLAGS))
+       (cd $(@D); $(TARGET_MAKE_ENV) $(QT5WEBENGINE_ENV)
$(HOST_DIR)/bin/qmake -- $(QT5WEBENGINE_QMAKEFLAGS))
 endef

 define QT5WEBENGINE_BUILD_CMDS
