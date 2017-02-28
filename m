From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 28 Feb 2017 22:00:00 +0100
Subject: [Buildroot] [git commit] qt5base: fix VNC platform plugin build on
	big-endian machines
Message-ID: <20170228210226.51CF2820FB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=962d1530841336d64d0843de9826a199cb07405a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes [1], [2]:

  In file included from qvncintegration.cpp:38:0:
  qvncscreen.h:76:22: error: expected ';' at end of member declaration
       bool swapBytes() const

[1] http://autobuild.buildroot.net/results/718/7180ad7d7e78f1c3ce6a1f83a5a8fcc5e0ac03a2
[2] http://autobuild.buildroot.net/results/14f/14f8c436b184192681fb79c7f0c0d0daa35f867b

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...tform-plugin-build-on-big-endian-machines.patch | 97 ++++++++++++++++++++++
 1 file changed, 97 insertions(+)

diff --git a/package/qt5/qt5base/5.8.0/0002-fix-VNC-platform-plugin-build-on-big-endian-machines.patch b/package/qt5/qt5base/5.8.0/0002-fix-VNC-platform-plugin-build-on-big-endian-machines.patch
new file mode 100644
index 0000000..e7d7ee3
--- /dev/null
+++ b/package/qt5/qt5base/5.8.0/0002-fix-VNC-platform-plugin-build-on-big-endian-machines.patch
@@ -0,0 +1,97 @@
+From 35ee8b53549fab6ebffe289417e1d94298447af7 Mon Sep 17 00:00:00 2001
+From: Shawn Rutledge <shawn.rutledge@digia.com>
+Date: Fri, 10 Feb 2017 13:56:58 +0100
+Subject: [PATCH] fix VNC platform plugin build on big-endian machines
+
+Task-number: QTBUG-58734
+Change-Id: I3e44ee4be5003acaba2f1b8ed2658a3ff1bd700e
+Reviewed-by: Lars Knoll <lars.knoll@qt.io>
+Reviewed-by: Dmitry Shachnev <mitya57@gmail.com>
+
+Upstream: http://code.qt.io/cgit/qt/qtbase.git/patch/?id=6f64bfa654fb7e20bb75ec3b0544b81482babb44
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ src/plugins/platforms/vnc/qvncclient.cpp | 6 +++---
+ src/plugins/platforms/vnc/qvncscreen.cpp | 7 ++++++-
+ src/plugins/platforms/vnc/qvncscreen.h   | 2 +-
+ 3 files changed, 10 insertions(+), 5 deletions(-)
+
+diff --git a/src/plugins/platforms/vnc/qvncclient.cpp b/src/plugins/platforms/vnc/qvncclient.cpp
+index dae3e83f..58dcfc9b 100644
+--- a/src/plugins/platforms/vnc/qvncclient.cpp
++++ b/src/plugins/platforms/vnc/qvncclient.cpp
+@@ -142,7 +142,7 @@ void QVncClient::convertPixels(char *dst, const char *src, int count) const
+         case 16: {
+             quint16 p = *reinterpret_cast<const quint16*>(src);
+ #if Q_BYTE_ORDER == Q_BIG_ENDIAN
+-            if (swapBytes)
++            if (m_swapBytes)
+                 p = ((p & 0xff) << 8) | ((p & 0xff00) >> 8);
+ #endif
+             r = (p >> 11) & 0x1f;
+@@ -484,7 +484,7 @@ void QVncClient::setPixelFormat()
+         m_sameEndian = (QSysInfo::ByteOrder == QSysInfo::BigEndian) == !!m_pixelFormat.bigEndian;
+         m_needConversion = pixelConversionNeeded();
+ #if Q_BYTE_ORDER == Q_BIG_ENDIAN
+-        m_swapBytes = qvnc_screen->swapBytes();
++        m_swapBytes = server()->screen()->swapBytes();
+ #endif
+     }
+ }
+@@ -639,7 +639,7 @@ bool QVncClient::pixelConversionNeeded() const
+         return true;
+ 
+ #if Q_BYTE_ORDER == Q_BIG_ENDIAN
+-    if (qvnc_screen->swapBytes())
++    if (server()->screen()->swapBytes())
+         return true;
+ #endif
+ 
+diff --git a/src/plugins/platforms/vnc/qvncscreen.cpp b/src/plugins/platforms/vnc/qvncscreen.cpp
+index 34def457..64f1bc0b 100644
+--- a/src/plugins/platforms/vnc/qvncscreen.cpp
++++ b/src/plugins/platforms/vnc/qvncscreen.cpp
+@@ -43,6 +43,7 @@
+ #include <QtFbSupport/private/qfbcursor_p.h>
+ 
+ #include <QtGui/QPainter>
++#include <QtGui/QScreen>
+ #include <QtCore/QRegularExpression>
+ 
+ 
+@@ -172,14 +173,18 @@ QPixmap QVncScreen::grabWindow(WId wid, int x, int y, int width, int height) con
+ }
+ 
+ #if Q_BYTE_ORDER == Q_BIG_ENDIAN
+-bool QVNCScreen::swapBytes() const
++bool QVncScreen::swapBytes() const
+ {
++    return false;
++
++    /* TODO
+     if (depth() != 16)
+         return false;
+ 
+     if (screen())
+         return screen()->frameBufferLittleEndian();
+     return frameBufferLittleEndian();
++    */
+ }
+ #endif
+ 
+diff --git a/src/plugins/platforms/vnc/qvncscreen.h b/src/plugins/platforms/vnc/qvncscreen.h
+index 785abd6d..0b42c3c7 100644
+--- a/src/plugins/platforms/vnc/qvncscreen.h
++++ b/src/plugins/platforms/vnc/qvncscreen.h
+@@ -73,7 +73,7 @@ public:
+     void clearDirty() { dirtyRegion = QRegion(); }
+ 
+ #if Q_BYTE_ORDER == Q_BIG_ENDIAN
+-    bool swapBytes() const
++    bool swapBytes() const;
+ #endif
+ 
+     QStringList mArgs;
+-- 
+2.11.0
+
