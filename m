From: Joshua Henderson <joshua.henderson@microchip.com>
Date: Tue, 11 Jul 2017 10:56:40 -0700
Subject: [Buildroot] [PATCH] package/qt5base: Remove upstreamed 5.8.0 patches
Message-ID: <1499795800-712-1-git-send-email-joshua.henderson@microchip.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This removes the following patches that have been upstreamed:

- qt5base/5.8.0/0001-fix-parallel-builds-with-qt-freetype-system-libpng.patch [1]
- qt5base/5.8.0/0002-fix-VNC-platform-plugin-build-on-big-endian-machines.patch [2]
- qt5base/5.8.0/0003-QAtomic-pass-explicit-failure-mode-to-std-atomic-com.patch [3]
- qt5base/5.8.0/0003-eglfs-fix-x11-header-related-compile-failure.patch [4]

And the following patches that do not appear to be upstream:

- qt5base/5.8.0/0004-examples-fix-compile-without-gui-module.patch

[1] https://code.qt.io/cgit/qt/qtbase.git/commit/?id=4dcfd90e4fd7d4c49138038dbbcbda8794a9fbff
[2] https://code.qt.io/cgit/qt/qtbase.git/commit/?id=6f64bfa654fb7e20bb75ec3b0544b81482babb44
[3] https://code.qt.io/cgit/qt/qtbase.git/commit/?id=5cc0de2e084cb887a75b076b82cf470ecdcd4dd3
[4] https://code.qt.io/cgit/qt/qtbase.git/commit/?id=e9a7739e77f79baeb5452189b6d17e63de5b341d

Signed-off-by: Joshua Henderson <joshua.henderson@microchip.com>
Cc: Julien Corjon <corjon.j@ecagroup.com>
Cc: Brent Sink <brents_3@hotmail.com>
---
 ...lel-builds-with-qt-freetype-system-libpng.patch | 34 --------
 ...tform-plugin-build-on-big-endian-machines.patch | 97 ----------------------
 ...s-explicit-failure-mode-to-std-atomic-com.patch | 65 ---------------
 ...fs-fix-x11-header-related-compile-failure.patch | 36 --------
 ...4-examples-fix-compile-without-gui-module.patch | 42 ----------
 5 files changed, 274 deletions(-)
 delete mode 100644 package/qt5/qt5base/5.8.0/0001-fix-parallel-builds-with-qt-freetype-system-libpng.patch
 delete mode 100644 package/qt5/qt5base/5.8.0/0002-fix-VNC-platform-plugin-build-on-big-endian-machines.patch
 delete mode 100644 package/qt5/qt5base/5.8.0/0003-QAtomic-pass-explicit-failure-mode-to-std-atomic-com.patch
 delete mode 100644 package/qt5/qt5base/5.8.0/0003-eglfs-fix-x11-header-related-compile-failure.patch
 delete mode 100644 package/qt5/qt5base/5.8.0/0004-examples-fix-compile-without-gui-module.patch

diff --git a/package/qt5/qt5base/5.8.0/0001-fix-parallel-builds-with-qt-freetype-system-libpng.patch b/package/qt5/qt5base/5.8.0/0001-fix-parallel-builds-with-qt-freetype-system-libpng.patch
deleted file mode 100644
index 8548ef0..0000000
--- a/package/qt5/qt5base/5.8.0/0001-fix-parallel-builds-with-qt-freetype-system-libpng.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 74af93f5298b54bc2327843f390bf202776f2f48 Mon Sep 17 00:00:00 2001
-From: Oswald Buddenhagen <oswald.buddenhagen@qt.io>
-Date: Tue, 10 Jan 2017 14:18:02 +0100
-Subject: [PATCH] fix parallel builds with -qt-freetype -system-libpng
-
-freetype has no dependency on gui, so it needs to pull in gui's
-configuration manually, as that's where the system libpng is found.
-
-Task-number: QTBUG-58038
-Change-Id: I881495f7d2a8f7c1a45d7d4c9e7698ff1d30f2a9
-Reviewed-by: Joerg Bornemann <joerg.bornemann@qt.io>
-Reviewed-by: Joni Poikelin <joni.poikelin@qt.io>
-
-Upstream: https://code.qt.io/cgit/qt/qtbase.git/commit/?id=4dcfd90e4fd7d4c49138038dbbcbda8794a9fbff
-Signed-off-by: Peter Seiderer <ps.report@gmx.net>
----
- src/3rdparty/freetype/freetype.pro | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/3rdparty/freetype/freetype.pro b/src/3rdparty/freetype/freetype.pro
-index 5b1eb92e..390a6da7 100644
---- a/src/3rdparty/freetype/freetype.pro
-+++ b/src/3rdparty/freetype/freetype.pro
-@@ -69,6 +69,7 @@ DEFINES += FT_CONFIG_OPTION_SYSTEM_ZLIB
- include(../zlib_dependency.pri)
- 
- DEFINES += FT_CONFIG_OPTION_USE_PNG
-+include($$OUT_PWD/../../gui/qtgui-config.pri)
- QMAKE_USE_PRIVATE += libpng
- 
- DEFINES += TT_CONFIG_OPTION_SUBPIXEL_HINTING
--- 
-2.11.0
-
diff --git a/package/qt5/qt5base/5.8.0/0002-fix-VNC-platform-plugin-build-on-big-endian-machines.patch b/package/qt5/qt5base/5.8.0/0002-fix-VNC-platform-plugin-build-on-big-endian-machines.patch
deleted file mode 100644
index e7d7ee3..0000000
--- a/package/qt5/qt5base/5.8.0/0002-fix-VNC-platform-plugin-build-on-big-endian-machines.patch
+++ /dev/null
@@ -1,97 +0,0 @@
-From 35ee8b53549fab6ebffe289417e1d94298447af7 Mon Sep 17 00:00:00 2001
-From: Shawn Rutledge <shawn.rutledge@digia.com>
-Date: Fri, 10 Feb 2017 13:56:58 +0100
-Subject: [PATCH] fix VNC platform plugin build on big-endian machines
-
-Task-number: QTBUG-58734
-Change-Id: I3e44ee4be5003acaba2f1b8ed2658a3ff1bd700e
-Reviewed-by: Lars Knoll <lars.knoll@qt.io>
-Reviewed-by: Dmitry Shachnev <mitya57@gmail.com>
-
-Upstream: http://code.qt.io/cgit/qt/qtbase.git/patch/?id=6f64bfa654fb7e20bb75ec3b0544b81482babb44
-Signed-off-by: Peter Seiderer <ps.report@gmx.net>
----
- src/plugins/platforms/vnc/qvncclient.cpp | 6 +++---
- src/plugins/platforms/vnc/qvncscreen.cpp | 7 ++++++-
- src/plugins/platforms/vnc/qvncscreen.h   | 2 +-
- 3 files changed, 10 insertions(+), 5 deletions(-)
-
-diff --git a/src/plugins/platforms/vnc/qvncclient.cpp b/src/plugins/platforms/vnc/qvncclient.cpp
-index dae3e83f..58dcfc9b 100644
---- a/src/plugins/platforms/vnc/qvncclient.cpp
-+++ b/src/plugins/platforms/vnc/qvncclient.cpp
-@@ -142,7 +142,7 @@ void QVncClient::convertPixels(char *dst, const char *src, int count) const
-         case 16: {
-             quint16 p = *reinterpret_cast<const quint16*>(src);
- #if Q_BYTE_ORDER == Q_BIG_ENDIAN
--            if (swapBytes)
-+            if (m_swapBytes)
-                 p = ((p & 0xff) << 8) | ((p & 0xff00) >> 8);
- #endif
-             r = (p >> 11) & 0x1f;
-@@ -484,7 +484,7 @@ void QVncClient::setPixelFormat()
-         m_sameEndian = (QSysInfo::ByteOrder == QSysInfo::BigEndian) == !!m_pixelFormat.bigEndian;
-         m_needConversion = pixelConversionNeeded();
- #if Q_BYTE_ORDER == Q_BIG_ENDIAN
--        m_swapBytes = qvnc_screen->swapBytes();
-+        m_swapBytes = server()->screen()->swapBytes();
- #endif
-     }
- }
-@@ -639,7 +639,7 @@ bool QVncClient::pixelConversionNeeded() const
-         return true;
- 
- #if Q_BYTE_ORDER == Q_BIG_ENDIAN
--    if (qvnc_screen->swapBytes())
-+    if (server()->screen()->swapBytes())
-         return true;
- #endif
- 
-diff --git a/src/plugins/platforms/vnc/qvncscreen.cpp b/src/plugins/platforms/vnc/qvncscreen.cpp
-index 34def457..64f1bc0b 100644
---- a/src/plugins/platforms/vnc/qvncscreen.cpp
-+++ b/src/plugins/platforms/vnc/qvncscreen.cpp
-@@ -43,6 +43,7 @@
- #include <QtFbSupport/private/qfbcursor_p.h>
- 
- #include <QtGui/QPainter>
-+#include <QtGui/QScreen>
- #include <QtCore/QRegularExpression>
- 
- 
-@@ -172,14 +173,18 @@ QPixmap QVncScreen::grabWindow(WId wid, int x, int y, int width, int height) con
- }
- 
- #if Q_BYTE_ORDER == Q_BIG_ENDIAN
--bool QVNCScreen::swapBytes() const
-+bool QVncScreen::swapBytes() const
- {
-+    return false;
-+
-+    /* TODO
-     if (depth() != 16)
-         return false;
- 
-     if (screen())
-         return screen()->frameBufferLittleEndian();
-     return frameBufferLittleEndian();
-+    */
- }
- #endif
- 
-diff --git a/src/plugins/platforms/vnc/qvncscreen.h b/src/plugins/platforms/vnc/qvncscreen.h
-index 785abd6d..0b42c3c7 100644
---- a/src/plugins/platforms/vnc/qvncscreen.h
-+++ b/src/plugins/platforms/vnc/qvncscreen.h
-@@ -73,7 +73,7 @@ public:
-     void clearDirty() { dirtyRegion = QRegion(); }
- 
- #if Q_BYTE_ORDER == Q_BIG_ENDIAN
--    bool swapBytes() const
-+    bool swapBytes() const;
- #endif
- 
-     QStringList mArgs;
--- 
-2.11.0
-
diff --git a/package/qt5/qt5base/5.8.0/0003-QAtomic-pass-explicit-failure-mode-to-std-atomic-com.patch b/package/qt5/qt5base/5.8.0/0003-QAtomic-pass-explicit-failure-mode-to-std-atomic-com.patch
deleted file mode 100644
index 3a43584..0000000
--- a/package/qt5/qt5base/5.8.0/0003-QAtomic-pass-explicit-failure-mode-to-std-atomic-com.patch
+++ /dev/null
@@ -1,65 +0,0 @@
-From c5d7425f8ad391112758db161e3e08f18dc9d299 Mon Sep 17 00:00:00 2001
-From: Marc Mutz <marc.mutz@kdab.com>
-Date: Thu, 26 May 2016 08:30:26 +0200
-Subject: [PATCH] QAtomic: pass explicit failure mode to
- std::atomic::compare_exchange_strong
-
-... in an attempt to avoid GCC 4.8 errors such as
-
-  bits/atomic_base.h:577:70: error: failure memory model cannot be stronger than success memory model for '__atomic_compare_exchange'
-  return __atomic_compare_exchange_n(&_M_i, &__i1, __i2, 0, __m1, __m2);
-                                                                      ^
-
-as seen on Android.
-
-Change-Id: If046e735888cf331d2d6506d8d5ca9aa7402f9ad
-[Bug report: https://bugreports.qt.io/browse/QTBUG-59399
- Patch sent upstream: https://codereview.qt-project.org/#/c/187980/]
-Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.org>
----
- src/corelib/arch/qatomic_cxx11.h |    8 ++++----
- 1 file changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/src/corelib/arch/qatomic_cxx11.h b/src/corelib/arch/qatomic_cxx11.h
-index bb49aae..d6731ec 100644
---- a/src/corelib/arch/qatomic_cxx11.h
-+++ b/src/corelib/arch/qatomic_cxx11.h
-@@ -153,7 +153,7 @@ template <typename X> struct QAtomicOps
-     template <typename T>
-     static bool testAndSetRelaxed(std::atomic<T> &_q_value, T expectedValue, T newValue, T *currentValue = Q_NULLPTR) Q_DECL_NOTHROW
-     {
--        bool tmp = _q_value.compare_exchange_strong(expectedValue, newValue, std::memory_order_relaxed);
-+        bool tmp = _q_value.compare_exchange_strong(expectedValue, newValue, std::memory_order_relaxed, std::memory_order_relaxed);
-         if (currentValue)
-             *currentValue = expectedValue;
-         return tmp;
-@@ -162,7 +162,7 @@ template <typename X> struct QAtomicOps
-     template <typename T>
-     static bool testAndSetAcquire(std::atomic<T> &_q_value, T expectedValue, T newValue, T *currentValue = Q_NULLPTR) Q_DECL_NOTHROW
-     {
--        bool tmp = _q_value.compare_exchange_strong(expectedValue, newValue, std::memory_order_acquire);
-+        bool tmp = _q_value.compare_exchange_strong(expectedValue, newValue, std::memory_order_acquire, std::memory_order_acquire);
-         if (currentValue)
-             *currentValue = expectedValue;
-         return tmp;
-@@ -171,7 +171,7 @@ template <typename X> struct QAtomicOps
-     template <typename T>
-     static bool testAndSetRelease(std::atomic<T> &_q_value, T expectedValue, T newValue, T *currentValue = Q_NULLPTR) Q_DECL_NOTHROW
-     {
--        bool tmp = _q_value.compare_exchange_strong(expectedValue, newValue, std::memory_order_release);
-+        bool tmp = _q_value.compare_exchange_strong(expectedValue, newValue, std::memory_order_release, std::memory_order_relaxed);
-         if (currentValue)
-             *currentValue = expectedValue;
-         return tmp;
-@@ -180,7 +180,7 @@ template <typename X> struct QAtomicOps
-     template <typename T>
-     static bool testAndSetOrdered(std::atomic<T> &_q_value, T expectedValue, T newValue, T *currentValue = Q_NULLPTR) Q_DECL_NOTHROW
-     {
--        bool tmp = _q_value.compare_exchange_strong(expectedValue, newValue, std::memory_order_acq_rel);
-+        bool tmp = _q_value.compare_exchange_strong(expectedValue, newValue, std::memory_order_acq_rel, std::memory_order_acquire);
-         if (currentValue)
-             *currentValue = expectedValue;
-         return tmp;
--- 
-1.7.10.4
-
diff --git a/package/qt5/qt5base/5.8.0/0003-eglfs-fix-x11-header-related-compile-failure.patch b/package/qt5/qt5base/5.8.0/0003-eglfs-fix-x11-header-related-compile-failure.patch
deleted file mode 100644
index 0e8bcff..0000000
--- a/package/qt5/qt5base/5.8.0/0003-eglfs-fix-x11-header-related-compile-failure.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 8902f4d7b7c532592d1a34ad117698d3e380e9e1 Mon Sep 17 00:00:00 2001
-From: Peter Seiderer <ps.report@gmx.net>
-Date: Fri, 10 Mar 2017 22:23:06 +0100
-Subject: [PATCH] eglfs: fix x11 header related compile failure
-
-Add egl config and QT_EGL_NO_X11 define (as all other eglfs project
-files do).
-
-Task-number: QTBUG-59427
-Change-Id: Ifbb11eae0fdf0e58c0b7feecb9a7914a889c8f77
-
-Upstream: https://codereview.qt-project.org/188158
-Signed-off-by: Peter Seiderer <ps.report@gmx.net>
----
- src/plugins/platforms/eglfs/eglfs-plugin.pro | 5 +++++
- 1 file changed, 5 insertions(+)
-
-diff --git a/src/plugins/platforms/eglfs/eglfs-plugin.pro b/src/plugins/platforms/eglfs/eglfs-plugin.pro
-index cf4863975a..ec229796e5 100644
---- a/src/plugins/platforms/eglfs/eglfs-plugin.pro
-+++ b/src/plugins/platforms/eglfs/eglfs-plugin.pro
-@@ -2,6 +2,11 @@ TARGET = qeglfs
- 
- QT += eglfsdeviceintegration-private
- 
-+CONFIG += egl
-+
-+# Avoid X11 header collision, use generic EGL native types
-+DEFINES += QT_EGL_NO_X11
-+
- SOURCES += $$PWD/qeglfsmain.cpp
- 
- OTHER_FILES += $$PWD/eglfs.json
--- 
-2.11.0
-
diff --git a/package/qt5/qt5base/5.8.0/0004-examples-fix-compile-without-gui-module.patch b/package/qt5/qt5base/5.8.0/0004-examples-fix-compile-without-gui-module.patch
deleted file mode 100644
index 148ced8..0000000
--- a/package/qt5/qt5base/5.8.0/0004-examples-fix-compile-without-gui-module.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From fe8a9bacf781fcf290e04a08f2b8e37d881d58bb Mon Sep 17 00:00:00 2001
-From: Peter Seiderer <ps.report@gmx.net>
-Date: Thu, 27 Apr 2017 22:41:28 +0200
-Subject: [PATCH] examples: fix compile without gui module
-
-Fixes:
-
-  Project ERROR: Could not find feature opengl.
-
-Signed-off-by: Peter Seiderer <ps.report@gmx.net>
----
- examples/gui/gui.pro         | 2 +-
- examples/widgets/widgets.pro | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/examples/gui/gui.pro b/examples/gui/gui.pro
-index a4d960d3f5..b8080c2075 100644
---- a/examples/gui/gui.pro
-+++ b/examples/gui/gui.pro
-@@ -6,5 +6,5 @@ CONFIG += no_docs_target
- 
- SUBDIRS += analogclock
- SUBDIRS += rasterwindow
--qtConfig(opengl): \
-+qtHaveModule(gui):qtConfig(opengl): \
-     SUBDIRS += openglwindow
-diff --git a/examples/widgets/widgets.pro b/examples/widgets/widgets.pro
-index 513ddc91f2..cef4936d32 100644
---- a/examples/widgets/widgets.pro
-+++ b/examples/widgets/widgets.pro
-@@ -22,7 +22,7 @@ SUBDIRS       = \
-                 tutorials \
-                 widgets
- 
--qtConfig(opengl): \
-+qtHaveModule(gui):qtConfig(opengl): \
-     SUBDIRS += windowcontainer
- 
- contains(DEFINES, QT_NO_CURSOR): SUBDIRS -= mainwindows
--- 
-2.11.0
-
-- 
2.7.4
