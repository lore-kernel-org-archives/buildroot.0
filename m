From: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@savoirfairelinux.com>
Date: Thu,  1 Mar 2018 16:34:25 -0500
Subject: [Buildroot] [PATCH 1/4] qt5base: fix build issue with mesa3d w/out
 xcb
In-Reply-To: <20180301213428.21011-1-gael.portay@savoirfairelinux.com>
References: <20180301213428.21011-1-gael.portay@savoirfairelinux.com>
Message-ID: <20180301213428.21011-2-gael.portay@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The mesa's EGL/eglplatform.h header includes X11 headers unless the flag
MESA_EGL_NO_X11_HEADERS is defined[1].

A build issue happens when mesa3d is selected as then OpenGL EGL backend
but the XCB library is not selected.

This commit backports the patch from the Gerrit of Qt which is in
review[5]. It extends the QMAKE_CXXFLAGS with cflags contained in the
egl.pc file.

In this situation, the define MESA_EGL_NO_X11_HEADERS is given to the
compiler that prevent from including the missing X headers.

The issues QTBUG-61712[3] and QTBUG-66233[4] are opened in the Qt
tracker.

[1]: https://github.com/mesa3d/mesa/blob/79ee1b2ff0b85f4eeb4165d23a7943c28d3a3d93/include/EGL/eglplatform.h#L109-L125
[2]: https://codereview.qt-project.org/#/c/198906/
[3]: https://bugreports.qt.io/browse/QTBUG-61712
[4]: https://bugreports.qt.io/browse/QTBUG-66233

Cc: Julien CORJON <corjon.j@ecagroup.com>
Cc: Peter Seiderer <ps.report@gmx.net>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Ga?l PORTAY <gael.portay@savoirfairelinux.com>
---
 ...002-qtbase-Fix-build-error-when-using-EGL.patch | 37 ++++++++++++++++++++++
 ...001-qtbase-Fix-build-error-when-using-EGL.patch | 37 ++++++++++++++++++++++
 2 files changed, 74 insertions(+)
 create mode 100644 package/qt5/qt5base/5.6.3/0002-qtbase-Fix-build-error-when-using-EGL.patch
 create mode 100644 package/qt5/qt5base/5.9.4/0001-qtbase-Fix-build-error-when-using-EGL.patch

diff --git a/package/qt5/qt5base/5.6.3/0002-qtbase-Fix-build-error-when-using-EGL.patch b/package/qt5/qt5base/5.6.3/0002-qtbase-Fix-build-error-when-using-EGL.patch
new file mode 100644
index 0000000000..0d0e0f922b
--- /dev/null
+++ b/package/qt5/qt5base/5.6.3/0002-qtbase-Fix-build-error-when-using-EGL.patch
@@ -0,0 +1,37 @@
+From d69bd3fd52502c7eb2799397fea14afe350e2cbf Mon Sep 17 00:00:00 2001
+From: Yuqing Zhu <carol.zhu@nxp.com>
+Date: Mon, 27 Mar 2017 15:33:35 +0800
+Subject: [PATCH] qtbase: Fix build error when using EGL
+MIME-Version: 1.0
+Content-Type: text/plain; charset=utf-8
+Content-Transfer-Encoding: 8bit
+
+A build error was occurring due to missing EGL configuration.
+
+Fixed by adding the necessary ties to the EGL pkg-config.
+
+Task-number: QTBUG-61712
+Change-Id: I87190ea39392b4604c563cf9d89edb85068d85fc
+Upstream-Status: Pending
+Signed-off-by: Ga?l PORTAY <gael.portay@savoirfairelinux.com>
+---
+ mkspecs/features/egl.prf | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/mkspecs/features/egl.prf b/mkspecs/features/egl.prf
+index 9fa0c9e219..85d5852ba6 100644
+--- a/mkspecs/features/egl.prf
++++ b/mkspecs/features/egl.prf
+@@ -1,3 +1,9 @@
++# egl headers need a definition
++PKG_CONFIG = $$pkgConfigExecutable()
++PKGCONFIG_CFLAGS = $$system($$PKG_CONFIG --cflags egl)
++PKGCONFIG_CFLAGS = $$find(PKGCONFIG_CFLAGS, ^-D.*)
++QMAKE_CFLAGS_EGL = $$PKGCONFIG_CFLAGS
++
+ INCLUDEPATH += $$QMAKE_INCDIR_EGL
+ LIBS_PRIVATE += $$QMAKE_LIBS_EGL
+ QMAKE_CFLAGS += $$QMAKE_CFLAGS_EGL
+-- 
+2.16.1
+
diff --git a/package/qt5/qt5base/5.9.4/0001-qtbase-Fix-build-error-when-using-EGL.patch b/package/qt5/qt5base/5.9.4/0001-qtbase-Fix-build-error-when-using-EGL.patch
new file mode 100644
index 0000000000..6876498022
--- /dev/null
+++ b/package/qt5/qt5base/5.9.4/0001-qtbase-Fix-build-error-when-using-EGL.patch
@@ -0,0 +1,37 @@
+From c11299086b7718332e2b4fbc37ce6f6ff427c5ba Mon Sep 17 00:00:00 2001
+From: Yuqing Zhu <carol.zhu@nxp.com>
+Date: Mon, 27 Mar 2017 15:33:35 +0800
+Subject: [PATCH] qtbase: Fix build error when using EGL
+MIME-Version: 1.0
+Content-Type: text/plain; charset=utf-8
+Content-Transfer-Encoding: 8bit
+
+A build error was occurring due to missing EGL configuration.
+
+Fixed by adding the necessary ties to the EGL pkg-config.
+
+Task-number: QTBUG-61712
+Change-Id: I87190ea39392b4604c563cf9d89edb85068d85fc
+Upstream-Status: Pending
+Signed-off-by: Ga?l PORTAY <gael.portay@savoirfairelinux.com>
+---
+ mkspecs/features/egl.prf | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/mkspecs/features/egl.prf b/mkspecs/features/egl.prf
+index 9fa0c9e219..85d5852ba6 100644
+--- a/mkspecs/features/egl.prf
++++ b/mkspecs/features/egl.prf
+@@ -1,3 +1,9 @@
++# egl headers need a definition
++PKG_CONFIG = $$pkgConfigExecutable()
++PKGCONFIG_CFLAGS = $$system($$PKG_CONFIG --cflags egl)
++PKGCONFIG_CFLAGS = $$find(PKGCONFIG_CFLAGS, ^-D.*)
++QMAKE_CFLAGS_EGL = $$PKGCONFIG_CFLAGS
++
+ INCLUDEPATH += $$QMAKE_INCDIR_EGL
+ LIBS_PRIVATE += $$QMAKE_LIBS_EGL
+ QMAKE_CFLAGS += $$QMAKE_CFLAGS_EGL
+-- 
+2.16.1
+
-- 
2.16.1
