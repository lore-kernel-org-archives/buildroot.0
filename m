From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 Nov 2015 21:17:09 +0100
Subject: [Buildroot] [git commit] qt5base: Patch Qt config to detect
	sunxi-mali
Message-ID: <20151117201735.6ABB681E38@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1fe3ff6de0ccf191cc7df7aebcad73e792b8851a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently Qt 5.5 only detects and build the eglfs_mali device
integration if the commercial Mali driver package from ARM is used.
This patch makes sure the Qt configure script also test for the
sunxi-mali driver package. It also removes the dependency of
the proprietary fbdev_window.h.

This issue is set to be fixed in upcoming Qt 5.6:
https://codereview.qt-project.org/#/c/125837/

[Thomas: renumber patch from 0010 to 0009.]

Signed-off-by: Daniel Nystr??m <daniel.nystrom@timeterminal.se>
Tested-by: Ariel D'Alessandro <ariel@vanguardiasur.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Tested-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
[Thomas: build tested before the patch, verified that indeed the
eglfs-mali plugin doesn't get built, and that after the patch it gets
built as expected.]
---
 .../qt5base/0009-fix-eglfs-for-sunxi-mali.patch    |  109 ++++++++++++++++++++
 1 files changed, 109 insertions(+), 0 deletions(-)

diff --git a/package/qt5/qt5base/0009-fix-eglfs-for-sunxi-mali.patch b/package/qt5/qt5base/0009-fix-eglfs-for-sunxi-mali.patch
new file mode 100644
index 0000000..a578af3
--- /dev/null
+++ b/package/qt5/qt5base/0009-fix-eglfs-for-sunxi-mali.patch
@@ -0,0 +1,109 @@
+Fix Qt5 configure script not autodetecting sunxi-mali drivers rendering
+in eglfs_mali not being built. The patch also fix compatibility issues
+regarding header files only included in the proprietary version.
+
+This will be fixed in Qt 5.6.
+
+ref: https://codereview.qt-project.org/#/c/125837/
+
+Signed-off-by: Daniel Nystr??m <daniel.nystrom@timeterminal.se>
+
+diff --git a/config.tests/qpa/eglfs-mali-2/eglfs-mali-2.cpp b/config.tests/qpa/eglfs-mali-2/eglfs-mali-2.cpp
+new file mode 100644
+index 0000000..1914d64
+--- /dev/null
++++ b/config.tests/qpa/eglfs-mali-2/eglfs-mali-2.cpp
+@@ -0,0 +1,44 @@
++/****************************************************************************
++**
++** Copyright (C) 2015 The Qt Company Ltd.
++** Contact: http://www.qt.io/licensing/
++**
++** This file is part of the config.tests of the Qt Toolkit.
++**
++** $QT_BEGIN_LICENSE:LGPL21$
++** Commercial License Usage
++** Licensees holding valid commercial Qt licenses may use this file in
++** accordance with the commercial license agreement provided with the
++** Software or, alternatively, in accordance with the terms contained in
++** a written agreement between you and The Qt Company. For licensing terms
++** and conditions see http://www.qt.io/terms-conditions. For further
++** information use the contact form at http://www.qt.io/contact-us.
++**
++** GNU Lesser General Public License Usage
++** Alternatively, this file may be used under the terms of the GNU Lesser
++** General Public License version 2.1 or version 3 as published by the Free
++** Software Foundation and appearing in the file LICENSE.LGPLv21 and
++** LICENSE.LGPLv3 included in the packaging of this file. Please review the
++** following information to ensure the GNU Lesser General Public License
++** requirements will be met: https://www.gnu.org/licenses/lgpl.html and
++** http://www.gnu.org/licenses/old-licenses/lgpl-2.1.html.
++**
++** As a special exception, The Qt Company gives you certain additional
++** rights. These rights are described in The Qt Company LGPL Exception
++** version 1.1, included in the file LGPL_EXCEPTION.txt in this package.
++**
++** $QT_END_LICENSE$
++**
++****************************************************************************/
++
++#include <EGL/egl.h>
++#include <GLES2/gl2.h>
++
++int main(int, char **)
++{
++    EGLDisplay dpy = 0;
++    EGLContext ctx = 0;
++    mali_native_window *w = 0;
++    eglDestroyContext(dpy, ctx);
++    return 0;
++}
+diff --git a/config.tests/qpa/eglfs-mali-2/eglfs-mali-2.pro b/config.tests/qpa/eglfs-mali-2/eglfs-mali-2.pro
+new file mode 100644
+index 0000000..85bcf64
+--- /dev/null
++++ b/config.tests/qpa/eglfs-mali-2/eglfs-mali-2.pro
+@@ -0,0 +1,5 @@
++SOURCES = eglfs-mali-2.cpp
++
++CONFIG -= qt
++
++LIBS += -lEGL -lGLESv2
+diff --git a/configure b/configure
+index cea62fb..09781bc 100755
+--- a/configure
++++ b/configure
+@@ -5624,7 +5624,8 @@ if [ "$CFG_EGLFS" != "no" ]; then
+         else
+             CFG_EGLFS_BRCM=no
+         fi
+-        if compileTest qpa/eglfs-mali "eglfs-mali"; then
++        if compileTest qpa/eglfs-mali "eglfs-mali" \
++            || compileTest qpa/eglfs-mali-2 "eglfs-mali-2"; then
+             CFG_EGLFS_MALI=yes
+         else
+             CFG_EGLFS_MALI=no
+diff --git a/src/plugins/platforms/eglfs/deviceintegration/eglfs_mali/qeglfsmaliintegration.cpp b/src/plugins/platforms/eglfs/deviceintegration/eglfs_mali/qeglfsmaliintegration.cpp
+index 455d780..43decdf 100644
+--- a/src/plugins/platforms/eglfs/deviceintegration/eglfs_mali/qeglfsmaliintegration.cpp
++++ b/src/plugins/platforms/eglfs/deviceintegration/eglfs_mali/qeglfsmaliintegration.cpp
+@@ -32,7 +32,6 @@
+ ****************************************************************************/
+
+ #include "qeglfsmaliintegration.h"
+-#include <EGL/fbdev_window.h>
+
+ #include <unistd.h>
+ #include <fcntl.h>
+@@ -43,6 +42,11 @@
+
+ QT_BEGIN_NAMESPACE
+
++struct fbdev_window {
++    unsigned short width;
++    unsigned short height;
++};
++
+ void QEglFSMaliIntegration::platformInit()
+ {
+     // Keep the non-overridden base class functions based on fb0 working.
