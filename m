From: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@savoirfairelinux.com>
Date: Sun, 11 Feb 2018 23:25:21 -0500
Subject: [Buildroot] [PATCH v1 0/3] qt5: fix build issue with mesa w/out xcb
Message-ID: <20180212042524.28675-1-gael.portay@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

Julien Corjon and I have noticed a build issue with qtmultimedia,
qtwayland and qtwebkit modules when using mesa3d (as EGL backend)
without using XCB. When BR2_PACKAGE_LIBXCB is set the issue is gone.
Julien has opened an issue in Qt tracker[1].

The mesa's EGL/eglplatform.h header includes X11 headers unless the
macro MESA_EGL_NO_X11_HEADERS is defined[2].

	/home/gportay/src/buildroot/output-qt5.10/host/x86_64-buildroot-linux-gnu/sysroot/usr/include/EGL/eglplatform.h:118:22: fatal error: X11/Xlib.h: No such file or directory
	 #include <X11/Xlib.h>
	                      ^
	compilation terminated.

The workaround tells qmake to pass the cflag MESA_EGL_NO_X11_HEADERS to
make that prevents from including the missing X headers.

This workaround is performed in the situation when mesa3d is in use as
OpenGL EGL backend and when XCB library is *not* compiled.

[1]: https://bugreports.qt.io/browse/QTBUG-66233
[2]: https://github.com/mesa3d/mesa/blob/79ee1b2ff0b85f4eeb4165d23a7943c28d3a3d93/include/EGL/eglplatform.h#L109-L125

Regards,
Ga?l PORTAY (3):
  qt5webkit: fix build issue with mesa3d w/out xcb
  qt5multimedia: fix build issue with mesa3d w/out xcb
  qt5wayland: fix build issue with mesa3d w/out xcb

 package/qt5/qt5multimedia/qt5multimedia.mk | 11 ++++++++++-
 package/qt5/qt5wayland/qt5wayland.mk       |  9 +++++++++
 package/qt5/qt5webkit/qt5webkit.mk         | 11 ++++++++++-
 3 files changed, 29 insertions(+), 2 deletions(-)

-- 
2.15.1
