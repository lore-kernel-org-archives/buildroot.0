From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 27 May 2014 13:27:57 +0200
Subject: [Buildroot] [git commit] qt5: bump to 5.3.0
Message-ID: <20140601083246.670609CE5B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6a5c818cb7b0fc76ab32b9880721eed8a76df015
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove upstreamed patches.

See http://qt-project.org/qt5/qt53 for the release information.

Signed-off-by: Fatih A????c?? <fatih.asici@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qt5/qt5.mk                                 |    4 +-
 ...ase-0004-QDnsLookup-Fix-build-with-uClibc.patch |   35 ++++++++++
 package/qt5/qt5base/qt5base-0004-qatomic-ppc.patch |   29 ---------
 .../qt5base-0005-uclibc-no-gnu-lib-names.patch     |   44 -------------
 ...not-check-feature-macros-for-posix_falloc.patch |   41 ------------
 ...qt5base-0007-Fix-no-opengl-build-with-egl.patch |   65 -------------------
 ...on-t-require-GL-when-build-with-no-opengl.patch |   28 --------
 ...5base-Fix-linuxfb-argument-mmsize-parsing.patch |   38 -----------
 ...n_t-build-scanner-example-without-qtquick.patch |   30 ---------
 ...ample-needs-no-widgets-but-it-needs-quick.patch |   67 --------------------
 10 files changed, 37 insertions(+), 344 deletions(-)

diff --git a/package/qt5/qt5.mk b/package/qt5/qt5.mk
index 0ce6cf5..c897496 100644
--- a/package/qt5/qt5.mk
+++ b/package/qt5/qt5.mk
@@ -1,5 +1,5 @@
-QT5_VERSION_MAJOR = 5.2
-QT5_VERSION = $(QT5_VERSION_MAJOR).1
+QT5_VERSION_MAJOR = 5.3
+QT5_VERSION = $(QT5_VERSION_MAJOR).0
 QT5_SITE = http://download.qt-project.org/official_releases/qt/$(QT5_VERSION_MAJOR)/$(QT5_VERSION)/submodules/
 include $(sort $(wildcard package/qt5/*/*.mk))
 
diff --git a/package/qt5/qt5base/qt5base-0004-QDnsLookup-Fix-build-with-uClibc.patch b/package/qt5/qt5base/qt5base-0004-QDnsLookup-Fix-build-with-uClibc.patch
new file mode 100644
index 0000000..90aa2be
--- /dev/null
+++ b/package/qt5/qt5base/qt5base-0004-QDnsLookup-Fix-build-with-uClibc.patch
@@ -0,0 +1,35 @@
+From af2241c678bcd9af58d38f98f5caec96a498733e Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Fatih=20A=C5=9F=C4=B1c=C4=B1?= <fatih.asici@gmail.com>
+Date: Fri, 23 May 2014 17:02:01 +0300
+Subject: [PATCH] QDnsLookup: Fix build with uClibc
+
+uClibc doesn't have a nsmap member in __res_state. Since it also doesn't have
+res_nquery() which is mandatory for QDnsLookup, we can simply disable the code
+to fix the build.
+
+Sent-Upstream: https://codereview.qt-project.org/86159
+Signed-off-by: Fatih A????c?? <fatih.asici@gmail.com>
+Change-Id: Ia872f535519aca3a2de763548c6dd0e3e0ee20d4
+---
+ src/network/kernel/qdnslookup_unix.cpp | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/network/kernel/qdnslookup_unix.cpp b/src/network/kernel/qdnslookup_unix.cpp
+index 26834df..2a482a6 100644
+--- a/src/network/kernel/qdnslookup_unix.cpp
++++ b/src/network/kernel/qdnslookup_unix.cpp
+@@ -160,9 +160,11 @@ void QDnsLookupRunnable::query(const int requestType, const QByteArray &requestN
+                 Q_CHECK_PTR(ns);
+                 state._u._ext.nsaddrs[0] = ns;
+             }
++#ifndef __UCLIBC__
+             // Set nsmap[] to indicate that nsaddrs[0] is an IPv6 address
+             // See: https://sourceware.org/ml/libc-hacker/2002-05/msg00035.html
+             state._u._ext.nsmap[0] = MAXNS + 1;
++#endif
+             state._u._ext.nscount6 = 1;
+             ns->sin6_family = AF_INET6;
+             ns->sin6_port = htons(53);
+-- 
+1.9.1
+
diff --git a/package/qt5/qt5base/qt5base-0004-qatomic-ppc.patch b/package/qt5/qt5base/qt5base-0004-qatomic-ppc.patch
deleted file mode 100644
index 906b56a..0000000
--- a/package/qt5/qt5base/qt5base-0004-qatomic-ppc.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-Set loadAcquire() as const
-
-Fixes powerpc build.
-
-Fetched-from: https://bugzilla.redhat.com/attachment.cgi?id=812643
-Signed-off-by: Fatih A????c?? <fatih.asici@gmail.com>
-
-Index: qtbase-opensource-src-5.1.1/src/corelib/thread/qoldbasicatomic.h
-===================================================================
---- qtbase-opensource-src-5.1.1.orig/src/corelib/thread/qoldbasicatomic.h
-+++ qtbase-opensource-src-5.1.1/src/corelib/thread/qoldbasicatomic.h
-@@ -63,7 +63,7 @@ public:
-     // Atomic API, implemented in qatomic_XXX.h
- 
-     int load() const { return _q_value; }
--    int loadAcquire() { return _q_value; }
-+    int loadAcquire() const { return _q_value; }
-     void store(int newValue) { _q_value = newValue; }
-     void storeRelease(int newValue) { _q_value = newValue; }
- 
-@@ -107,7 +107,7 @@ public:
-     // Atomic API, implemented in qatomic_XXX.h
- 
-     T *load() const { return _q_value; }
--    T *loadAcquire() { return _q_value; }
-+    T *loadAcquire() const { return _q_value; }
-     void store(T *newValue) { _q_value = newValue; }
-     void storeRelease(T *newValue) { _q_value = newValue; }
- 
diff --git a/package/qt5/qt5base/qt5base-0005-uclibc-no-gnu-lib-names.patch b/package/qt5/qt5base/qt5base-0005-uclibc-no-gnu-lib-names.patch
deleted file mode 100644
index 7c667db..0000000
--- a/package/qt5/qt5base/qt5base-0005-uclibc-no-gnu-lib-names.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-[PATCH]: fix build on uClibc
-
-Reported upstream: https://bugreports.qt-project.org/browse/QTBUG-35742
-
-uClibc defines __GNU_LIBRARY__ like glibc, but doesn't provide
-gnu/lib-names.h, so the build breaks with:
-
-kernel/qdnslookup_unix.cpp:56:29: fatal error: gnu/lib-names.h:
-No such file or directory
-
-Fix it by explicitly checking for !uClibc.
-
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- src/network/kernel/qdnslookup_unix.cpp |    2 +-
- src/network/kernel/qhostinfo_unix.cpp  |    2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-Index: qt5base-5.2.0/src/network/kernel/qdnslookup_unix.cpp
-===================================================================
---- qt5base-5.2.0.orig/src/network/kernel/qdnslookup_unix.cpp
-+++ qt5base-5.2.0/src/network/kernel/qdnslookup_unix.cpp
-@@ -52,7 +52,7 @@
- #include <arpa/nameser_compat.h>
- #include <resolv.h>
- 
--#ifdef __GNU_LIBRARY__
-+#if defined(__GNU_LIBRARY__) && !defined(__UCLIBC__)
- #  include <gnu/lib-names.h>
- #endif
- 
-Index: qt5base-5.2.0/src/network/kernel/qhostinfo_unix.cpp
-===================================================================
---- qt5base-5.2.0.orig/src/network/kernel/qhostinfo_unix.cpp
-+++ qt5base-5.2.0/src/network/kernel/qhostinfo_unix.cpp
-@@ -63,7 +63,7 @@
- #  include <resolv.h>
- #endif
- 
--#ifdef __GNU_LIBRARY__
-+#if defined(__GNU_LIBRARY__) && !defined(__UCLIBC__)
- #  include <gnu/lib-names.h>
- #endif
- 
diff --git a/package/qt5/qt5base/qt5base-0006-sqlite3-Do-not-check-feature-macros-for-posix_falloc.patch b/package/qt5/qt5base/qt5base-0006-sqlite3-Do-not-check-feature-macros-for-posix_falloc.patch
deleted file mode 100644
index 554f1cd..0000000
--- a/package/qt5/qt5base/qt5base-0006-sqlite3-Do-not-check-feature-macros-for-posix_falloc.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 18eee84e9458bdcb244df4c5ad968c8d5ea1860a Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Fatih=20A=C5=9F=C4=B1c=C4=B1?= <fatih.asici@gmail.com>
-Date: Fri, 18 Apr 2014 10:19:03 +0300
-Subject: [PATCH] sqlite3: Do not check feature macros for posix_fallocate()
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Build system already checks for this function and defines
-HAVE_POSIX_FALLOCATE if it is available.
-
-Next releases of Qt will come with an updated sqlite3 which removes this
-check.
-
-Change-Id: I55e403aa01a7f054f9fe4773ce96dad399afce80
-Signed-off-by: Fatih A????c?? <fatih.asici@gmail.com>
----
- src/3rdparty/sqlite/sqlite3.c | 7 -------
- 1 file changed, 7 deletions(-)
-
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
-1.9.1
-
diff --git a/package/qt5/qt5base/qt5base-0007-Fix-no-opengl-build-with-egl.patch b/package/qt5/qt5base/qt5base-0007-Fix-no-opengl-build-with-egl.patch
deleted file mode 100644
index c0f03d5..0000000
--- a/package/qt5/qt5base/qt5base-0007-Fix-no-opengl-build-with-egl.patch
+++ /dev/null
@@ -1,65 +0,0 @@
-From cd14b80dd87ff9ae632bf0479a1d824c72316362 Mon Sep 17 00:00:00 2001
-From: Laszlo Agocs <laszlo.agocs@digia.com>
-Date: Wed, 12 Mar 2014 16:56:19 +0100
-Subject: [PATCH] Fix no-opengl build with egl
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Disable eglfs and similar plugins when opengl is not enabled.
-(but egl is present)
-
-GL-dependent parts of eglconvenience need to be skipped too.
-
-Task-number: QTBUG-37457
-Change-Id: I44d49495241551bc7b1f565aa0b5ace9f310628e
-Reviewed-by: Thiago Macieira <thiago.macieira@intel.com>
-Reviewed-by: J??rgen Lind <jorgen.lind@digia.com>
-Signed-off-by: Fatih A????c?? <fatih.asici@gmail.com>
-
-Conflicts:
-	src/platformsupport/eglconvenience/eglconvenience.pri
----
- configure                                             | 2 +-
- src/platformsupport/eglconvenience/eglconvenience.pri | 7 +++++--
- 2 files changed, 6 insertions(+), 3 deletions(-)
-
-diff --git a/configure b/configure
-index aaa59bd..0c310ff 100755
---- a/configure
-+++ b/configure
-@@ -5337,7 +5337,7 @@ if [ "$CFG_EGL" != "no" ]; then
- fi
- 
- if [ "$CFG_EGLFS" != "no" ]; then
--    if [ "$XPLATFORM_QNX" = "no" ]; then
-+    if [ "$XPLATFORM_QNX" = "no" ] && [ "$CFG_OPENGL" != "no" ]; then
-         CFG_EGLFS="$CFG_EGL"
-     else
-         CFG_EGLFS="no"
-diff --git a/src/platformsupport/eglconvenience/eglconvenience.pri b/src/platformsupport/eglconvenience/eglconvenience.pri
-index 506f4ab..462c60c 100644
---- a/src/platformsupport/eglconvenience/eglconvenience.pri
-+++ b/src/platformsupport/eglconvenience/eglconvenience.pri
-@@ -1,13 +1,16 @@
- contains(QT_CONFIG,egl) {
-     HEADERS += \
-         $$PWD/qeglconvenience_p.h \
--        $$PWD/qeglplatformcontext_p.h \
-         $$PWD/qeglpbuffer_p.h
-     SOURCES += \
-         $$PWD/qeglconvenience.cpp \
--        $$PWD/qeglplatformcontext.cpp \
-         $$PWD/qeglpbuffer.cpp
- 
-+    contains(QT_CONFIG,opengl) {
-+        HEADERS += $$PWD/qeglplatformcontext_p.h
-+        SOURCES += $$PWD/qeglplatformcontext.cpp
-+    }
-+
-     contains(QT_CONFIG,xlib) {
-         HEADERS += \
-             $$PWD/qxlibeglintegration_p.h
--- 
-1.9.1
-
diff --git a/package/qt5/qt5base/qt5base-CMake-don-t-require-GL-when-build-with-no-opengl.patch b/package/qt5/qt5base/qt5base-CMake-don-t-require-GL-when-build-with-no-opengl.patch
deleted file mode 100644
index e04bcc4..0000000
--- a/package/qt5/qt5base/qt5base-CMake-don-t-require-GL-when-build-with-no-opengl.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 02edc30764935d64f0994a9c592ca729f1c37410 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Peter=20K=C3=BCmmel?= <syntheticpp@gmx.net>
-Date: Fri, 31 Jan 2014 22:28:19 +0100
-Subject: [PATCH] CMake: don't require GL when build with -no-opengl
-
-Task-number: QTBUG-36509
-Change-Id: I03451527ab91754d87ff2a43985952c7c7641826
-Reviewed-by: Stephen Kelly <stephen.kelly@kdab.com>
----
- src/gui/gui.pro | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/gui/gui.pro b/src/gui/gui.pro
-index 3203b41..f4c35a3 100644
---- a/src/gui/gui.pro
-+++ b/src/gui/gui.pro
-@@ -81,7 +81,7 @@ contains(QT_CONFIG, angle) {
-         !isEmpty(QMAKE_LIBDIR_OPENGL_ES2): CMAKE_OPENGL_LIBDIR = $$cmakePortablePaths($$QMAKE_LIBDIR_OPENGL_ES2)
-         CMAKE_GL_HEADER_NAME = GLES2/gl2.h
-         CMAKE_QT_OPENGL_IMPLEMENTATION = GLESv2
--    } else {
-+    } else:contains(QT_CONFIG, opengl) {
-         !isEmpty(QMAKE_INCDIR_OPENGL): CMAKE_GL_INCDIRS = $$cmakeTargetPaths($$QMAKE_INCDIR_OPENGL)
-         CMAKE_OPENGL_INCDIRS = $$cmakePortablePaths($$QMAKE_INCDIR_OPENGL)
-         CMAKE_OPENGL_LIBS = $$cmakeProcessLibs($$QMAKE_LIBS_OPENGL)
--- 
-1.8.3.2
-
diff --git a/package/qt5/qt5base/qt5base-Fix-linuxfb-argument-mmsize-parsing.patch b/package/qt5/qt5base/qt5base-Fix-linuxfb-argument-mmsize-parsing.patch
deleted file mode 100644
index 3b9811b..0000000
--- a/package/qt5/qt5base/qt5base-Fix-linuxfb-argument-mmsize-parsing.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From b1fb89055d4d1bc88b7b0b788ad8eca4f3641f9a Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Peter=20K=C3=BCmmel?= <syntheticpp@gmx.net>
-Date: Fri, 7 Feb 2014 13:12:37 +0100
-Subject: [PATCH] Fix linuxfb argument 'mmsize' parsing
-
-Parse first for 'mmsize' because the regex for 'size' also fits to 'mmsize'.
-
-Task-number: QTBUG-29133
-Change-Id: Idc4950270818e496d5d94a97a172b7c780f069b1
----
- src/plugins/platforms/linuxfb/qlinuxfbscreen.cpp | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/plugins/platforms/linuxfb/qlinuxfbscreen.cpp b/src/plugins/platforms/linuxfb/qlinuxfbscreen.cpp
-index 735a43d..33a9523 100644
---- a/src/plugins/platforms/linuxfb/qlinuxfbscreen.cpp
-+++ b/src/plugins/platforms/linuxfb/qlinuxfbscreen.cpp
-@@ -333,6 +333,8 @@ bool QLinuxFbScreen::initialize()
-     foreach (const QString &arg, mArgs) {
-         if (arg == QLatin1String("nographicsmodeswitch"))
-             doSwitchToGraphicsMode = false;
-+        else if (mmSizeRx.indexIn(arg) != -1)
-+            userMmSize = QSize(mmSizeRx.cap(1).toInt(), mmSizeRx.cap(2).toInt());
-         else if (sizeRx.indexIn(arg) != -1)
-             userGeometry.setSize(QSize(sizeRx.cap(1).toInt(), sizeRx.cap(2).toInt()));
-         else if (offsetRx.indexIn(arg) != -1)
-@@ -341,8 +343,6 @@ bool QLinuxFbScreen::initialize()
-             ttyDevice = ttyRx.cap(1);
-         else if (fbRx.indexIn(arg) != -1)
-             fbDevice = fbRx.cap(1);
--        else if (mmSizeRx.indexIn(arg) != -1)
--            userMmSize = QSize(mmSizeRx.cap(1).toInt(), mmSizeRx.cap(2).toInt());
-     }
- 
-     if (fbDevice.isEmpty()) {
--- 
-1.8.3.2
-
diff --git a/package/qt5/qt5connectivity/qt5connectivity-0001-don_t-build-scanner-example-without-qtquick.patch b/package/qt5/qt5connectivity/qt5connectivity-0001-don_t-build-scanner-example-without-qtquick.patch
deleted file mode 100644
index 0751ba7..0000000
--- a/package/qt5/qt5connectivity/qt5connectivity-0001-don_t-build-scanner-example-without-qtquick.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-qt5connectivity: Don't build scanner example without QtQuick
-Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
-
-From 1454664752505f5870e4173d15362bfdfe4148e7 Mon Sep 17 00:00:00 2001
-From: Alex Blasche <alexander.blasche@digia.com>
-Date: Wed, 15 Jan 2014 12:11:31 +0100
-Subject: [PATCH] Don't build scanner example without QtQuick
-
-Task-number: QTBUG-35711
-Change-Id: I0406fb5edd8fb2a90046308853485eaaa4311a26
-Reviewed-by: Friedemann Kleint <Friedemann.Kleint@digia.com>
-Reviewed-by: Fabian Bumberger <fbumberger@rim.com>
-Reviewed-by: Alex Blasche <alexander.blasche@digia.com>
----
- examples/bluetooth/bluetooth.pro |    2 +-
- 1 files changed, 1 insertions(+), 1 deletions(-)
-
-diff --git a/examples/bluetooth/bluetooth.pro b/examples/bluetooth/bluetooth.pro
-index e3ef769..549bb7c 100644
---- a/examples/bluetooth/bluetooth.pro
-+++ b/examples/bluetooth/bluetooth.pro
-@@ -6,4 +6,4 @@ qtHaveModule(widgets) {
-                bttennis
- }
- 
--SUBDIRS += scanner
-+qtHaveModule(quick): SUBDIRS += scanner
--- 
-1.7.1
-
diff --git a/package/qt5/qt5connectivity/qt5connectivity-0002-the-poster-example-needs-no-widgets-but-it-needs-quick.patch b/package/qt5/qt5connectivity/qt5connectivity-0002-the-poster-example-needs-no-widgets-but-it-needs-quick.patch
deleted file mode 100644
index d8b75f4..0000000
--- a/package/qt5/qt5connectivity/qt5connectivity-0002-the-poster-example-needs-no-widgets-but-it-needs-quick.patch
+++ /dev/null
@@ -1,67 +0,0 @@
-qt5connectivity: the poster example needs no widgets, but it needs quick
-Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
-
-From 0156038682cc40d44fedfc28dc9b78d1a0e6203b Mon Sep 17 00:00:00 2001
-From: Oswald Buddenhagen <oswald.buddenhagen@digia.com>
-Date: Tue, 18 Feb 2014 15:28:48 +0100
-Subject: [PATCH] the poster example needs no widgets, but it needs quick
-
-Task-number: QTBUG-36893
-Change-Id: Ic77fe07aa450001386be0b2e0d4a99f2e674dbb2
-Reviewed-by: Alex Blasche <alexander.blasche@digia.com>
-Reviewed-by: Rolf Eike Beer <eb@emlix.com>
----
- examples/nfc/nfc.pro              |    5 ++++-
- examples/nfc/poster/poster.pro    |    2 +-
- examples/nfc/poster/qmlposter.cpp |    4 ++--
- 3 files changed, 7 insertions(+), 4 deletions(-)
-
-diff --git a/examples/nfc/nfc.pro b/examples/nfc/nfc.pro
-index e4f7e35..0076a71 100644
---- a/examples/nfc/nfc.pro
-+++ b/examples/nfc/nfc.pro
-@@ -2,7 +2,10 @@ TEMPLATE = subdirs
- qtHaveModule(widgets) {
-     SUBDIRS += \
-         annotatedurl \
--        ndefeditor \
-+        ndefeditor
-+}
-+qtHaveModule(quick) {
-+    SUBDIRS += \
-         poster
- }
- 
-diff --git a/examples/nfc/poster/poster.pro b/examples/nfc/poster/poster.pro
-index 47de298..b6e87ed 100644
---- a/examples/nfc/poster/poster.pro
-+++ b/examples/nfc/poster/poster.pro
-@@ -1,4 +1,4 @@
--QT += qml quick network nfc widgets
-+QT += qml quick network nfc
- 
- SOURCES += \
-     qmlposter.cpp
-diff --git a/examples/nfc/poster/qmlposter.cpp b/examples/nfc/poster/qmlposter.cpp
-index 89f3695..2fc943d 100644
---- a/examples/nfc/poster/qmlposter.cpp
-+++ b/examples/nfc/poster/qmlposter.cpp
-@@ -38,13 +38,13 @@
- **
- ****************************************************************************/
- 
--#include <QtWidgets/QApplication>
-+#include <QtGui/QGuiApplication>
- #include <QtQml/QQmlEngine>
- #include <QtQuick/QQuickView>
- 
- int main(int argc, char *argv[])
- {
--    QApplication application(argc, argv);
-+    QGuiApplication application(argc, argv);
-     const QString mainQmlApp = QLatin1String("qrc:/poster.qml");
-     QQuickView view;
-     view.setSource(QUrl(mainQmlApp));
--- 
-1.7.1
-
