From: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@savoirfairelinux.com>
Date: Thu,  1 Mar 2018 16:34:24 -0500
Subject: [Buildroot] [PATCH 0/4] qt5base: fix build issue with mesa3d w/out
 xcb
Message-ID: <20180301213428.21011-1-gael.portay@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

This patch series fixes the build issue with qt5multimedia, qt5webkit
and qt5wayland when mesa3d is selected as then OpenGL EGL backend but
the XCB library is not selected.

The first patch fixes the issue in qt5base by backporting a patch which
is in review[1]. The patch extends the QMAKE_CXXFLAGS with cflags
contained in the egl.pc file to pass the flag MESA_EGL_NO_X11_HEADERS to
the compiler and prevent the build issue.

The last three patches reverts the workaround setup earlier in
2018.02-rc2.

Fixes:

	In file included from
	/home/gportay/src/buildroot/output-qt5.10/host/x86_64-buildroot-linux-gnu/sysroot/usr/include/EGL/egl.h:39:0,
	                 from qsgvideonode_egl.h:48,
	                 from qsgvideonode_egl.cpp:40:
	/home/gportay/src/buildroot/output-qt5.10/host/x86_64-buildroot-linux-gnu/sysroot/usr/include/EGL/eglplatform.h:118:22:
	fatal error: X11/Xlib.h: No such file or directory
	#include <X11/Xlib.h>
	                     ^
	compilation terminated.
	Makefile:550: recipe for target '.obj/qsgvideonode_egl.o' failed

Tested with 5.6.3, 5.9.4 and 5.10.1 (with mesa3d without xcb).

Tests should be extended to others ELG platforms and with mesa3d + xcb.

[1]: https://codereview.qt-project.org/#/c/198906/

Regards,
Ga?l PORTAY (4):
  qt5base: fix build issue with mesa3d w/out xcb
  Revert "qt5wayland: fix build issue with mesa3d w/out xcb"
  Revert "qt5webkit: fix build issue with mesa3d w/out xcb"
  Revert "qt5multimedia: fix build issue with mesa3d w/out xcb"

 ...002-qtbase-Fix-build-error-when-using-EGL.patch | 37 ++++++++++++++++++++++
 ...001-qtbase-Fix-build-error-when-using-EGL.patch | 37 ++++++++++++++++++++++
 package/qt5/qt5multimedia/qt5multimedia.mk         |  9 +-----
 package/qt5/qt5wayland/qt5wayland.mk               |  7 ----
 package/qt5/qt5webkit/qt5webkit.mk                 |  9 +-----
 5 files changed, 76 insertions(+), 23 deletions(-)
 create mode 100644 package/qt5/qt5base/5.6.3/0002-qtbase-Fix-build-error-when-using-EGL.patch
 create mode 100644 package/qt5/qt5base/5.9.4/0001-qtbase-Fix-build-error-when-using-EGL.patch

-- 
2.16.1
