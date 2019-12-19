From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 19 Dec 2019 01:56:05 +0000
Subject: [Buildroot] [Bug 12416] New: qt5webengine should not use
 WEBENGINE_CONFIG
Message-ID: <bug-12416-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12416

            Bug ID: 12416
           Summary: qt5webengine should not use WEBENGINE_CONFIG
           Product: buildroot
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: jeffy.chen at rock-chips.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

Hi guys,

According to the changes, the WEBENGINE_CONFIG has been removed in 5.10.0:
https://code.qt.io/cgit/qt/qtwebengine.git/commit/?id=1691d2298a8adf511ed95d5aa5d4410adcbdd1e3


qt5webengine-5.12.2$ vi dist/changes-5.9.0

Important Changes
-----------------

 - Configure options are now handled by the global configure script. This
   means options previously controlled by WEBENGINE_CONFIG options should
   now use configure flags. For instance the configure command-line option
   -proprietary-codecs replaces WEBENGINE_CONFIG+=use_proprietary_codecs.

qt5webengine-5.12.2$ vi dist/changes-5.10.0

Important Changes
-----------------

   * WebEngine Features are now configured as Qt features and
     WEBENGINE_CONFIG has been removed.


This works:

+++ b/package/qt5/qt5webengine/qt5webengine.mk
@@ -32,10 +32,10 @@ ifeq ($(BR2_PACKAGE_QT5_VERSION_5_6),)
 QT5WEBENGINE_DEPENDENCIES += host-libpng host-libnss libnss
 endif

-QT5WEBENGINE_QMAKEFLAGS += WEBENGINE_CONFIG+=use_system_ffmpeg
+QT5WEBENGINE_CONFIG += -webengine-ffmpeg

 ifeq ($(BR2_PACKAGE_QT5WEBENGINE_PROPRIETARY_CODECS),y)
-QT5WEBENGINE_QMAKEFLAGS += WEBENGINE_CONFIG+=use_proprietary_codecs
+QT5WEBENGINE_CONFIG += -proprietary-codecs
 endif

 ifeq ($(BR2_PACKAGE_QT5WEBENGINE_ALSA),y)
@@ -66,7 +66,7 @@ QT5WEBENGINE_ENV +=
GN_PKG_CONFIG_HOST=$(@D)/host-bin/host-pkg-config
 endif

 define QT5WEBENGINE_CONFIGURE_CMDS
-       (cd $(@D); $(TARGET_MAKE_ENV) $(QT5WEBENGINE_ENV) $(HOST_DIR)/bin/qmake
$(QT5WEBENGINE_QMAKEFLAGS))
+       (cd $(@D); $(TARGET_MAKE_ENV) $(QT5WEBENGINE_ENV) $(HOST_DIR)/bin/qmake
$(QT5WEBENGINE_QMAKEFLAGS) -- $(QT5WEBENGINE_CONFIG))
 endef

-- 
You are receiving this mail because:
You are on the CC list for the bug.
