From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 19 Dec 2013 16:33:47 +0100
Subject: [Buildroot] [git commit] qt5: version bump
Message-ID: <20131219153646.2EE009C0F1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e4a839277f7d74104e25fb4fd846f9c2bf3f9c1e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

-bump version to 5.2.0
-remove unneeded patches
-remove invalid configure options

[Peter: uclibc-no-lfs + qatomic patches still needed, new patch for uClibc]
Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qt5/qt5.mk                                 |    4 +-
 ...-Add-egl-cflags-when-opengles2-is-enabled.patch |   32 ----
 package/qt5/qt5base/qt5base-0004-egl-cflags.patch  |   28 ----
 ...ic-ppc.patch => qt5base-0004-qatomic-ppc.patch} |    0
 .../qt5base-0005-fix-gui-build-without-png.patch   |   22 ---
 .../qt5base-0005-uclibc-no-gnu-lib-names.patch     |   44 +++++
 ...ate-vc_dispmanx_element_change_attributes.patch |   44 -----
 ...-detect-posix_fallocate-at-configure-time.patch |  166 --------------------
 ...igure-Parse-device-option-value-correctly.patch |   37 -----
 ...cs-devices-linux_device_post.conf-for-non.patch |  107 -------------
 package/qt5/qt5base/qt5base.mk                     |    3 -
 ...t-0002-ANGLE-doesn-t-build-with-bison-3.0.patch |   38 -----
 12 files changed, 46 insertions(+), 479 deletions(-)

diff --git a/package/qt5/qt5.mk b/package/qt5/qt5.mk
index 671a217..e925fb4 100644
--- a/package/qt5/qt5.mk
+++ b/package/qt5/qt5.mk
@@ -1,5 +1,5 @@
-QT5_VERSION = 5.1.1
-QT5_SITE = http://download.qt-project.org/official_releases/qt/5.1/$(QT5_VERSION)/submodules/
+QT5_VERSION = 5.2.0
+QT5_SITE = http://download.qt-project.org/official_releases/qt/5.2/$(QT5_VERSION)/submodules/
 include $(sort $(wildcard package/qt5/*/*.mk))
 
 define QT5_LA_PRL_FILES_FIXUP
diff --git a/package/qt5/qt5base/qt5base-0001-xcb-Add-egl-cflags-when-opengles2-is-enabled.patch b/package/qt5/qt5base/qt5base-0001-xcb-Add-egl-cflags-when-opengles2-is-enabled.patch
deleted file mode 100644
index 87acd9b..0000000
--- a/package/qt5/qt5base/qt5base-0001-xcb-Add-egl-cflags-when-opengles2-is-enabled.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From cbffa1e467a4c8b9e8061364b69e250b23fb7b59 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Fatih=20A=C5=9F=C4=B1c=C4=B1?= <fatih.asici@gmail.com>
-Date: Sun, 15 Sep 2013 11:15:33 +0300
-Subject: [PATCH] xcb: Add egl cflags when opengles2 is enabled
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-This patch is sent to upstream and applied:
-https://qt.gitorious.org/qt/qtbase/commit/ff7b57bbb936bc86a64aa2a947fa8984adf400c8
-
-Signed-off-by: Fatih A????c?? <fatih.asici@gmail.com>
----
- src/plugins/platforms/xcb/xcb-plugin.pro |    2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/plugins/platforms/xcb/xcb-plugin.pro b/src/plugins/platforms/xcb/xcb-plugin.pro
-index 8299528..bc21afe 100644
---- a/src/plugins/platforms/xcb/xcb-plugin.pro
-+++ b/src/plugins/platforms/xcb/xcb-plugin.pro
-@@ -73,7 +73,7 @@ contains(QT_CONFIG, xcb-render) {
- contains(QT_CONFIG, opengl) {
-     contains(QT_CONFIG, opengles2) {
-         DEFINES += XCB_USE_EGL
--        LIBS += -lEGL
-+        CONFIG += egl
-         HEADERS += qxcbeglsurface.h
- 
-         # EGL on MeeGo 1.2 Harmattan needs this macro to map EGLNativeDisplayType
--- 
-1.7.10.4
-
diff --git a/package/qt5/qt5base/qt5base-0004-egl-cflags.patch b/package/qt5/qt5base/qt5base-0004-egl-cflags.patch
deleted file mode 100644
index bff82a8..0000000
--- a/package/qt5/qt5base/qt5base-0004-egl-cflags.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-egl.prf: Append egl CFLAGS to QMAKE_C[XX]FLAGS
-
-Projects including egl in their config (e.g. with CONFIG += egl) cannot get
-egl CFLAGS without this.
-
-Signed-off-by: Fatih A????c?? <fatih.asici@gmail.com>
-
---- a/configure
-+++ b/configure
-@@ -4934,6 +4934,7 @@
-         QMAKE_CFLAGS_EGL=`$PKG_CONFIG --cflags egl 2>/dev/null`
-         QMakeVar set QMAKE_INCDIR_EGL "$QMAKE_INCDIR_EGL"
-         QMakeVar set QMAKE_LIBS_EGL "$QMAKE_LIBS_EGL"
-+        QMakeVar set QMAKE_CFLAGS_EGL "$QMAKE_CFLAGS_EGL"
-     fi       # detect EGL support
-     if compileTest qpa/egl "EGL" $QMAKE_CFLAGS_EGL $QMAKE_LIBS_EGL; then
-         CFG_EGL=yes
---- a/mkspecs/features/egl.prf
-+++ b/mkspecs/features/egl.prf
-@@ -14,6 +14,8 @@
- } else {
-     INCLUDEPATH += $$QMAKE_INCDIR_EGL
-     LIBS_PRIVATE += $$QMAKE_LIBS_EGL
-+    QMAKE_CFLAGS += $$QMAKE_CFLAGS_EGL
-+    QMAKE_CXXFLAGS += $$QMAKE_CFLAGS_EGL
-     LIBS += $$QMAKE_LFLAGS_EGL
-     for(p, QMAKE_LIBDIR_EGL) {
-         exists($$p):LIBS_PRIVATE += -L$$p
diff --git a/package/qt5/qt5base/qt5base-0008-qatomic-ppc.patch b/package/qt5/qt5base/qt5base-0004-qatomic-ppc.patch
similarity index 100%
rename from package/qt5/qt5base/qt5base-0008-qatomic-ppc.patch
rename to package/qt5/qt5base/qt5base-0004-qatomic-ppc.patch
diff --git a/package/qt5/qt5base/qt5base-0005-fix-gui-build-without-png.patch b/package/qt5/qt5base/qt5base-0005-fix-gui-build-without-png.patch
deleted file mode 100644
index ea0a7e3..0000000
--- a/package/qt5/qt5base/qt5base-0005-fix-gui-build-without-png.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-[PATCH] fix QtGUI build without PNG support
-
-Upstream bug: https://bugreports.qt-project.org/browse/QTBUG-33496
-
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- src/gui/kernel/qplatformtheme.cpp |    2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-Index: qt5base-5.1.1/src/gui/kernel/qplatformtheme.cpp
-===================================================================
---- qt5base-5.1.1.orig/src/gui/kernel/qplatformtheme.cpp
-+++ qt5base-5.1.1/src/gui/kernel/qplatformtheme.cpp
-@@ -48,7 +48,7 @@
- #include <QtCore/qfileinfo.h>
- #include <qpalette.h>
- #include <qtextformat.h>
--#include <qiconloader_p.h>
-+#include <private/qiconloader_p.h>
- 
- QT_BEGIN_NAMESPACE
- 
diff --git a/package/qt5/qt5base/qt5base-0005-uclibc-no-gnu-lib-names.patch b/package/qt5/qt5base/qt5base-0005-uclibc-no-gnu-lib-names.patch
new file mode 100644
index 0000000..7c667db
--- /dev/null
+++ b/package/qt5/qt5base/qt5base-0005-uclibc-no-gnu-lib-names.patch
@@ -0,0 +1,44 @@
+[PATCH]: fix build on uClibc
+
+Reported upstream: https://bugreports.qt-project.org/browse/QTBUG-35742
+
+uClibc defines __GNU_LIBRARY__ like glibc, but doesn't provide
+gnu/lib-names.h, so the build breaks with:
+
+kernel/qdnslookup_unix.cpp:56:29: fatal error: gnu/lib-names.h:
+No such file or directory
+
+Fix it by explicitly checking for !uClibc.
+
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ src/network/kernel/qdnslookup_unix.cpp |    2 +-
+ src/network/kernel/qhostinfo_unix.cpp  |    2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+Index: qt5base-5.2.0/src/network/kernel/qdnslookup_unix.cpp
+===================================================================
+--- qt5base-5.2.0.orig/src/network/kernel/qdnslookup_unix.cpp
++++ qt5base-5.2.0/src/network/kernel/qdnslookup_unix.cpp
+@@ -52,7 +52,7 @@
+ #include <arpa/nameser_compat.h>
+ #include <resolv.h>
+ 
+-#ifdef __GNU_LIBRARY__
++#if defined(__GNU_LIBRARY__) && !defined(__UCLIBC__)
+ #  include <gnu/lib-names.h>
+ #endif
+ 
+Index: qt5base-5.2.0/src/network/kernel/qhostinfo_unix.cpp
+===================================================================
+--- qt5base-5.2.0.orig/src/network/kernel/qhostinfo_unix.cpp
++++ qt5base-5.2.0/src/network/kernel/qhostinfo_unix.cpp
+@@ -63,7 +63,7 @@
+ #  include <resolv.h>
+ #endif
+ 
+-#ifdef __GNU_LIBRARY__
++#if defined(__GNU_LIBRARY__) && !defined(__UCLIBC__)
+ #  include <gnu/lib-names.h>
+ #endif
+ 
diff --git a/package/qt5/qt5base/qt5base-0006-qeglfshooksrpi-update-vc_dispmanx_element_change_attributes.patch b/package/qt5/qt5base/qt5base-0006-qeglfshooksrpi-update-vc_dispmanx_element_change_attributes.patch
deleted file mode 100644
index 417970d..0000000
--- a/package/qt5/qt5base/qt5base-0006-qeglfshooksrpi-update-vc_dispmanx_element_change_attributes.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 90005fae17acc994948aa5a79fc262fd07b69865 Mon Sep 17 00:00:00 2001
-From: Dario Freddi <dario.freddi@ispirata.com>
-Date: Fri, 13 Sep 2013 12:10:03 +0200
-Subject: [PATCH] qeglfshooksrpi: update vc_dispmanx_element_change_attributes
-
-Remove the extern prototype as it's now defined in latest
-firmware headers correctly. Moreover, the signature of the function
-changed. This patch fixes both issues.
-
-Change-Id: I0114b436dbaf5a171e6429a1e3760e292c7152cf
-Reviewed-by: Andy Nichols <andy.nichols@digia.com>
----
- .../devices/linux-rasp-pi-g++/qeglfshooks_pi.cpp   |    8 +-------
- 1 files changed, 1 insertions(+), 7 deletions(-)
-
-diff --git a/mkspecs/devices/linux-rasp-pi-g++/qeglfshooks_pi.cpp b/mkspecs/devices/linux-rasp-pi-g++/qeglfshooks_pi.cpp
-index 9b48113..add96bf 100644
---- a/mkspecs/devices/linux-rasp-pi-g++/qeglfshooks_pi.cpp
-+++ b/mkspecs/devices/linux-rasp-pi-g++/qeglfshooks_pi.cpp
-@@ -88,12 +88,6 @@ static EGLNativeWindowType createDispmanxLayer(const QPoint &pos, const QSize &s
-     return eglWindow;
- }
- 
--// this function is not part of debian squeeze headers
--extern "C" int VCHPOST_ vc_dispmanx_element_change_attributes(DISPMANX_UPDATE_HANDLE_T update,
--    DISPMANX_ELEMENT_HANDLE_T element, uint32_t change_flags, int32_t layer,
--    uint8_t opacity, const VC_RECT_T *dest_rect, const VC_RECT_T *src_rect,
--    DISPMANX_RESOURCE_HANDLE_T mask, VC_IMAGE_TRANSFORM_T transform);
--
- // these constants are not in any headers (yet)
- #define ELEMENT_CHANGE_LAYER          (1<<0)
- #define ELEMENT_CHANGE_OPACITY        (1<<1)
-@@ -128,7 +122,7 @@ static void moveDispmanxLayer(EGLNativeWindowType window, const QPoint &pos)
-                                           &dst_rect,
-                                           NULL,
-                                           0,
--                                          (VC_IMAGE_TRANSFORM_T)0);
-+                                          (DISPMANX_TRANSFORM_T)0);
- 
-     vc_dispmanx_update_submit_sync(dispman_update);
- }
--- 
-1.7.1
-
diff --git a/package/qt5/qt5base/qt5base-0007-detect-posix_fallocate-at-configure-time.patch b/package/qt5/qt5base/qt5base-0007-detect-posix_fallocate-at-configure-time.patch
deleted file mode 100644
index 51cea04..0000000
--- a/package/qt5/qt5base/qt5base-0007-detect-posix_fallocate-at-configure-time.patch
+++ /dev/null
@@ -1,166 +0,0 @@
-From 46e632e2555b6b8abe6b8d8ad7d255e27c128e25 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Fatih=20A=C5=9F=C4=B1c=C4=B1?= <fatih.asici@gmail.com>
-Date: Mon, 11 Nov 2013 17:04:46 +0200
-Subject: [PATCH] Detect posix_fallocate at configure time
-
-Testing feature macros is not enough for uclibc. Fixes build of the built-in
-sqlite3 with uclibc <= 0.9.33.2. Later versions will have posix_fallocate().
-
-Change-Id: I918a52777ac63624635802221effc6b86fa2269c
-Signed-off-by: Fatih A????c?? <fatih.asici@gmail.com>
-Reported-Upstream: https://codereview.qt-project.org/70935
----
- .../unix/posix_fallocate/posix_fallocate.cpp       | 53 ++++++++++++++++++++++
- .../unix/posix_fallocate/posix_fallocate.pro       |  2 +
- configure                                          | 14 ++++++
- src/3rdparty/sqlite.pri                            |  1 +
- src/3rdparty/sqlite/sqlite3.c                      |  7 ---
- 5 files changed, 70 insertions(+), 7 deletions(-)
- create mode 100644 config.tests/unix/posix_fallocate/posix_fallocate.cpp
- create mode 100644 config.tests/unix/posix_fallocate/posix_fallocate.pro
-
-diff --git a/config.tests/unix/posix_fallocate/posix_fallocate.cpp b/config.tests/unix/posix_fallocate/posix_fallocate.cpp
-new file mode 100644
-index 0000000..5acd45a
---- /dev/null
-+++ b/config.tests/unix/posix_fallocate/posix_fallocate.cpp
-@@ -0,0 +1,53 @@
-+/****************************************************************************
-+**
-+** Copyright (C) 2013 Digia Plc and/or its subsidiary(-ies).
-+** Contact: http://www.qt-project.org/legal
-+**
-+** This file is part of the config.tests of the Qt Toolkit.
-+**
-+** $QT_BEGIN_LICENSE:LGPL$
-+** Commercial License Usage
-+** Licensees holding valid commercial Qt licenses may use this file in
-+** accordance with the commercial license agreement provided with the
-+** Software or, alternatively, in accordance with the terms contained in
-+** a written agreement between you and Digia.  For licensing terms and
-+** conditions see http://qt.digia.com/licensing.  For further information
-+** use the contact form at http://qt.digia.com/contact-us.
-+**
-+** GNU Lesser General Public License Usage
-+** Alternatively, this file may be used under the terms of the GNU Lesser
-+** General Public License version 2.1 as published by the Free Software
-+** Foundation and appearing in the file LICENSE.LGPL included in the
-+** packaging of this file.  Please review the following information to
-+** ensure the GNU Lesser General Public License version 2.1 requirements
-+** will be met: http://www.gnu.org/licenses/old-licenses/lgpl-2.1.html.
-+**
-+** In addition, as a special exception, Digia gives you certain additional
-+** rights.  These rights are described in the Digia Qt LGPL Exception
-+** version 1.1, included in the file LGPL_EXCEPTION.txt in this package.
-+**
-+** GNU General Public License Usage
-+** Alternatively, this file may be used under the terms of the GNU
-+** General Public License version 3.0 as published by the Free Software
-+** Foundation and appearing in the file LICENSE.GPL included in the
-+** packaging of this file.  Please review the following information to
-+** ensure the GNU General Public License version 3.0 requirements will be
-+** met: http://www.gnu.org/copyleft/gpl.html.
-+**
-+**
-+** $QT_END_LICENSE$
-+**
-+****************************************************************************/
-+
-+#include <fcntl.h>
-+
-+int main(int, char **)
-+{
-+#if _XOPEN_SOURCE >= 600 || _POSIX_C_SOURCE >= 200112L
-+    return ::posix_fallocate(0, 0, 0);
-+#else
-+#  error posix_fallocate not available
-+    // MIPSpro doesn't understand #error, so force a compiler error
-+    force_compiler_error = true;
-+#endif
-+}
-diff --git a/config.tests/unix/posix_fallocate/posix_fallocate.pro b/config.tests/unix/posix_fallocate/posix_fallocate.pro
-new file mode 100644
-index 0000000..f01b15f
---- /dev/null
-+++ b/config.tests/unix/posix_fallocate/posix_fallocate.pro
-@@ -0,0 +1,2 @@
-+SOURCES = posix_fallocate.cpp
-+CONFIG -= qt dylib
-diff --git a/configure b/configure
-index 81e2a93..b67ed89 100755
---- a/configure
-+++ b/configure
-@@ -968,6 +968,7 @@ CFG_MIPS_DSP=auto
- CFG_MIPS_DSPR2=auto
- CFG_CLOCK_GETTIME=auto
- CFG_CLOCK_MONOTONIC=auto
-+CFG_POSIX_FALLOCATE=auto
- CFG_MREMAP=auto
- CFG_GETADDRINFO=auto
- CFG_IPV6IFNAME=auto
-@@ -5653,6 +5654,15 @@ elif [ "$CFG_CLOCK_GETTIME" = "no" ]; then
-     CFG_CLOCK_MONOTONIC=no
- fi
- 
-+# detect posix_fallocate
-+if [ "$CFG_POSIX_FALLOCATE" = "auto" ]; then
-+    if compileTest unix/posix_fallocate "posix_fallocate"; then
-+        CFG_POSIX_FALLOCATE=yes
-+    else
-+        CFG_POSIX_FALLOCATE=no
-+    fi
-+fi
-+
- # detect mremap
- if [ "$CFG_MREMAP" = "auto" ]; then
-     if compileTest unix/mremap "mremap"; then
-@@ -5970,6 +5980,9 @@ fi
- if [ "$CFG_CLOCK_MONOTONIC" = "yes" ]; then
-     QT_CONFIG="$QT_CONFIG clock-monotonic"
- fi
-+if [ "$CFG_POSIX_FALLOCATE" = "yes" ]; then
-+    QT_CONFIG="$QT_CONFIG posix_fallocate"
-+fi
- if [ "$CFG_MREMAP" = "yes" ]; then
-     QT_CONFIG="$QT_CONFIG mremap"
- fi
-@@ -6449,6 +6462,7 @@ QMakeVar set sql-plugins "$SQL_PLUGINS"
- [ "$CFG_GLIB" != "yes" ]     && QCONFIG_FLAGS="$QCONFIG_FLAGS QT_NO_GLIB"
- [ "$CFG_QGTKSTYLE" != "yes" ] && QCONFIG_FLAGS="$QCONFIG_FLAGS QT_NO_STYLE_GTK"
- [ "$CFG_CLOCK_MONOTONIC" = "no" ] && QCONFIG_FLAGS="$QCONFIG_FLAGS QT_NO_CLOCK_MONOTONIC"
-+[ "$CFG_POSIX_FALLOCATE" = "no" ] && QCONFIG_FLAGS="$QCONFIG_FLAGS QT_NO_POSIX_FALLOCATE"
- [ "$CFG_MREMAP" = "no" ]     && QCONFIG_FLAGS="$QCONFIG_FLAGS QT_NO_MREMAP"
- [ "$CFG_GETADDRINFO" = "no" ]&& QCONFIG_FLAGS="$QCONFIG_FLAGS QT_NO_GETADDRINFO"
- [ "$CFG_IPV6IFNAME" = "no" ] && QCONFIG_FLAGS="$QCONFIG_FLAGS QT_NO_IPV6IFNAME"
-diff --git a/src/3rdparty/sqlite.pri b/src/3rdparty/sqlite.pri
-index 58d4ddd..072502c 100644
---- a/src/3rdparty/sqlite.pri
-+++ b/src/3rdparty/sqlite.pri
-@@ -1,5 +1,6 @@
- CONFIG(release, debug|release):DEFINES *= NDEBUG
- DEFINES += SQLITE_OMIT_LOAD_EXTENSION SQLITE_OMIT_COMPLETE SQLITE_ENABLE_FTS3 SQLITE_ENABLE_FTS3_PARENTHESIS SQLITE_ENABLE_RTREE
- !contains(CONFIG, largefile):DEFINES += SQLITE_DISABLE_LFS
-+contains(QT_CONFIG, posix_fallocate):DEFINES += HAVE_POSIX_FALLOCATE=1
- INCLUDEPATH +=  $$PWD/sqlite
- SOURCES +=      $$PWD/sqlite/sqlite3.c
-diff --git a/src/3rdparty/sqlite/sqlite3.c b/src/3rdparty/sqlite/sqlite3.c
-index 03fa649..1ae9be2 100644
---- a/src/3rdparty/sqlite/sqlite3.c
-+++ b/src/3rdparty/sqlite/sqlite3.c
-@@ -22935,13 +22935,6 @@ SQLITE_PRIVATE const char *sqlite3OpcodeName(int i){
- */
- #if SQLITE_OS_UNIX              /* This file is used on unix only */
- 
--/* Use posix_fallocate() if it is available
--*/
--#if !defined(HAVE_POSIX_FALLOCATE) \
--      && (_XOPEN_SOURCE >= 600 || _POSIX_C_SOURCE >= 200112L)
--# define HAVE_POSIX_FALLOCATE 1
--#endif
--
- /*
- ** There are various methods for file locking used for concurrency
- ** control:
--- 
-1.8.4.rc3
-
diff --git a/package/qt5/qt5base/qt5base-0008-configure-Parse-device-option-value-correctly.patch b/package/qt5/qt5base/qt5base-0008-configure-Parse-device-option-value-correctly.patch
deleted file mode 100644
index aaf1d35..0000000
--- a/package/qt5/qt5base/qt5base-0008-configure-Parse-device-option-value-correctly.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 4723f3fd04edf1aad6750ca91fd4648216d8b408 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Fatih=20A=C5=9F=C4=B1c=C4=B1?= <fatih.asici@gmail.com>
-Date: Sat, 21 Sep 2013 00:14:39 +0300
-Subject: [PATCH] configure: Parse -device-option value correctly
-
-The regular expression does not parse correctly when a device option value
-contains the character '=' (e.g. QMAKE_CFLAGS="-D_FILE_OFFSET_BITS=64").
-
-In order to break string at the first equal sign and to simplify code,
-use "cut" command as in other places in configure script.
-
-Task-number: QTBUG-33584
-Change-Id: I05b474d2ba6bff84c1e40d00475963bab36d94b6
-Reviewed-by: Oswald Buddenhagen <oswald.buddenhagen@digia.com>
-Signed-off-by: Fatih A????c?? <fatih.asici@gmail.com>
----
- configure | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/configure b/configure
-index 64568dd..388899e 100755
---- a/configure
-+++ b/configure
-@@ -1609,8 +1609,8 @@ while [ "$#" -gt 0 ]; do
-         [ "$XPLATFORM" = "undefined" ] && exit 101
-         ;;
-     device-option)
--        DEV_VAR=`echo $VAL | sed "s,^\(.*\)=.*,\1,"`
--        DEV_VAL=`echo $VAL | sed "s,^.*=\(.*\),\1,"`
-+        DEV_VAR=`echo $VAL | cut -d '=' -f 1`
-+        DEV_VAL=`echo $VAL | cut -d '=' -f 2-`
-         DeviceVar set $DEV_VAR "$DEV_VAL"
-         ;;
-     qpa)
--- 
-1.8.4.rc3
-
diff --git a/package/qt5/qt5base/qt5base-0009-Fixed-mkspecs-devices-linux_device_post.conf-for-non.patch b/package/qt5/qt5base/qt5base-0009-Fixed-mkspecs-devices-linux_device_post.conf-for-non.patch
deleted file mode 100644
index 7eeea38..0000000
--- a/package/qt5/qt5base/qt5base-0009-Fixed-mkspecs-devices-linux_device_post.conf-for-non.patch
+++ /dev/null
@@ -1,107 +0,0 @@
-From f2a611ce6cb0f86d9331641a804de6a507900db7 Mon Sep 17 00:00:00 2001
-From: Tomasz Olszak <olszak.tomasz@gmail.com>
-Date: Thu, 18 Jul 2013 20:45:47 +0000
-Subject: [PATCH] Fixed mkspecs/devices/linux_device_post.conf for non-arm
- platforms.
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Now arm specific -mfloat-abi flag is added to compiler flags
-only for arm architecture in linux_arm_device_post.conf.
-
-Change-Id: Ie77ac6e0717d9d1fd9c14e1d6a26e86f08ab418c
-Reviewed-by: Jaros??aw Staniek <staniek@kde.org>
-Reviewed-by: Oswald Buddenhagen <oswald.buddenhagen@digia.com>
-Signed-off-by: Fatih A????c?? <fatih.asici@gmail.com>
----
- mkspecs/devices/common/linux_arm_device_post.conf | 7 +++++++
- mkspecs/devices/common/linux_device_post.conf     | 6 ------
- mkspecs/devices/linux-imx53qsb-g++/qmake.conf     | 2 +-
- mkspecs/devices/linux-imx6-g++/qmake.conf         | 2 +-
- mkspecs/devices/linux-rasp-pi-g++/qmake.conf      | 2 +-
- mkspecs/devices/linux-tegra2-g++/qmake.conf       | 2 +-
- 6 files changed, 11 insertions(+), 10 deletions(-)
- create mode 100644 mkspecs/devices/common/linux_arm_device_post.conf
-
-diff --git a/mkspecs/devices/common/linux_arm_device_post.conf b/mkspecs/devices/common/linux_arm_device_post.conf
-new file mode 100644
-index 0000000..7ce4759
---- /dev/null
-+++ b/mkspecs/devices/common/linux_arm_device_post.conf
-@@ -0,0 +1,7 @@
-+contains(DISTRO_OPTS, hard-float) {
-+    COMPILER_FLAGS += -mfloat-abi=hard
-+} else {
-+    COMPILER_FLAGS += -mfloat-abi=softfp
-+}
-+
-+include(linux_device_post.conf)
-diff --git a/mkspecs/devices/common/linux_device_post.conf b/mkspecs/devices/common/linux_device_post.conf
-index f8dbf76..548e75a 100644
---- a/mkspecs/devices/common/linux_device_post.conf
-+++ b/mkspecs/devices/common/linux_device_post.conf
-@@ -3,12 +3,6 @@ contains(DISTRO_OPTS, deb-multi-arch) {
-                       -Wl,-rpath-link,$$[QT_SYSROOT]/lib/$${GCC_MACHINE_DUMP}
- }
- 
--contains(DISTRO_OPTS, hard-float) {
--    COMPILER_FLAGS += -mfloat-abi=hard
--} else {
--    COMPILER_FLAGS += -mfloat-abi=softfp
--}
--
- QMAKE_CFLAGS       += $$COMPILER_FLAGS
- QMAKE_CXXFLAGS     += $$COMPILER_FLAGS
- 
-diff --git a/mkspecs/devices/linux-imx53qsb-g++/qmake.conf b/mkspecs/devices/linux-imx53qsb-g++/qmake.conf
-index 0a5ed89..3a9766c 100644
---- a/mkspecs/devices/linux-imx53qsb-g++/qmake.conf
-+++ b/mkspecs/devices/linux-imx53qsb-g++/qmake.conf
-@@ -32,6 +32,6 @@ QMAKE_CXXFLAGS_RELEASE += $$IMX5_CFLAGS_RELEASE
- QMAKE_CFLAGS_DEBUG     += $$IMX5_CFLAGS
- QMAKE_CXXFLAGS_DEBUG   += $$IMX5_CFLAGS
- 
--include(../common/linux_device_post.conf)
-+include(../common/linux_arm_device_post.conf)
- 
- load(qt_config)
-diff --git a/mkspecs/devices/linux-imx6-g++/qmake.conf b/mkspecs/devices/linux-imx6-g++/qmake.conf
-index 20f6d11..2b8dbf6 100644
---- a/mkspecs/devices/linux-imx6-g++/qmake.conf
-+++ b/mkspecs/devices/linux-imx6-g++/qmake.conf
-@@ -34,6 +34,6 @@ QMAKE_CXXFLAGS_RELEASE += $$IMX6_CFLAGS_RELEASE
- QMAKE_CFLAGS_DEBUG     += $$IMX6_CFLAGS
- QMAKE_CXXFLAGS_DEBUG   += $$IMX6_CFLAGS
- 
--include(../common/linux_device_post.conf)
-+include(../common/linux_arm_device_post.conf)
- 
- load(qt_config)
-diff --git a/mkspecs/devices/linux-rasp-pi-g++/qmake.conf b/mkspecs/devices/linux-rasp-pi-g++/qmake.conf
-index d6fea47..5f923ad 100644
---- a/mkspecs/devices/linux-rasp-pi-g++/qmake.conf
-+++ b/mkspecs/devices/linux-rasp-pi-g++/qmake.conf
-@@ -42,6 +42,6 @@ QMAKE_CXXFLAGS          = $$QMAKE_CFLAGS
- EGLFS_PLATFORM_HOOKS_SOURCES = $$PWD/qeglfshooks_pi.cpp
- EGLFS_PLATFORM_HOOKS_LIBS = -lbcm_host
- 
--include(../common/linux_device_post.conf)
-+include(../common/linux_arm_device_post.conf)
- 
- load(qt_config)
-diff --git a/mkspecs/devices/linux-tegra2-g++/qmake.conf b/mkspecs/devices/linux-tegra2-g++/qmake.conf
-index 1c7a8cc..320e1b8 100644
---- a/mkspecs/devices/linux-tegra2-g++/qmake.conf
-+++ b/mkspecs/devices/linux-tegra2-g++/qmake.conf
-@@ -26,6 +26,6 @@ TEGRA2_CFLAGS           = -mtune=cortex-a9 -march=armv7-a -mhard-float -mfloat-a
- QMAKE_CFLAGS           += $$TEGRA2_CFLAGS
- QMAKE_CXXFLAGS         += $$TEGRA2_CFLAGS
- 
--include(../common/linux_device_post.conf)
-+include(../common/linux_arm_device_post.conf)
- 
- load(qt_config)
--- 
-1.8.4.rc3
-
diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index d95b186..1b753d3 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -23,10 +23,7 @@ QT5BASE_CONFIGURE_OPTS += \
 	-no-kms \
 	-no-cups \
 	-no-nis \
-	-no-libudev \
 	-no-iconv \
-	-no-gstreamer \
-	-no-gtkstyle \
 	-system-zlib \
 	-system-pcre \
 	-no-pch
diff --git a/package/qt5/qt5webkit/qt5webkit-0002-ANGLE-doesn-t-build-with-bison-3.0.patch b/package/qt5/qt5webkit/qt5webkit-0002-ANGLE-doesn-t-build-with-bison-3.0.patch
deleted file mode 100644
index e69e137..0000000
--- a/package/qt5/qt5webkit/qt5webkit-0002-ANGLE-doesn-t-build-with-bison-3.0.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 60ba8bd5b3575d0c7740571fbb4e681b21a49a82 Mon Sep 17 00:00:00 2001
-From: Allan Sandfeld Jensen <allan.jensen@digia.com>
-Date: Fri, 16 Aug 2013 18:27:07 +0200
-Subject: [PATCH] ANGLE doesn't build with bison 3.0
-
-https://bugs.webkit.org/show_bug.cgi?id=119798
-
-Reviewed by Antti Koivisto.
-
-Make glslang.y compatible with bison 3.0
-by using %lex-param to set YYLEX_PARAM.
-
-* src/compiler/glslang.y:
-
-git-svn-id: http://svn.webkit.org/repository/webkit/trunk at 154109 268f45cc-cd09-0410-ab3c-d52691b4dbfc
-
-Task-number: QTBUG-32913
-Change-Id: I15505d31f0588c4d558b73befdb9d2358e29c1a3
-Reviewed-by: Jocelyn Turcotte <jocelyn.turcotte@digia.com>
----
- Source/ThirdParty/ANGLE/src/compiler/glslang.y | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/Source/ThirdParty/ANGLE/src/compiler/glslang.y b/Source/ThirdParty/ANGLE/src/compiler/glslang.y
-index 3cad335..b41e95a 100644
---- a/Source/ThirdParty/ANGLE/src/compiler/glslang.y
-+++ b/Source/ThirdParty/ANGLE/src/compiler/glslang.y
-@@ -47,6 +47,7 @@ WHICH GENERATES THE GLSL ES PARSER (glslang_tab.cpp AND glslang_tab.h).
- %expect 1 /* One shift reduce conflict because of if | else */
- %pure-parser
- %parse-param {TParseContext* context}
-+%lex-param {YYLEX_PARAM}
- 
- %union {
-     struct {
--- 
-1.8.4.2
-
