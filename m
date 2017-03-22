From: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@savoirfairelinux.com>
Date: Wed, 22 Mar 2017 14:13:28 -0400
Subject: [Buildroot] [RFC 0/3] Qt WebEngine support
Message-ID: <20170322181331.23500-1-gael.portay@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The purpose of this patch series is to continue the integration of Qt5 WebEngine
in buildroot; started long time ago by Akihiko Odaki [1] and Julien Corjon [2].

The first patch provides the Qt WebEngine package.

The second patch fixes the rpi-userland OpenGL libraries symlinks. WebEngine
eglfs backend is linked against libEGL.so.1 and libGLESv2.so.2.

	# ls -l /usr/lib/lib*GL*
	lrwxrwxrwx    1 root     root            11 Mar 21 17:24 /usr/lib/libEGL.so -> libEGL.so.1
	lrwxrwxrwx    1 root     root            15 Mar 21 17:24 /usr/lib/libEGL.so.1 -> libEGL.so.1.0.0
	-rwxr-xr-x    1 root     root        163152 Mar 22 14:56 /usr/lib/libEGL.so.1.0.0
	lrwxrwxrwx    1 root     root            14 Mar 21 17:24 /usr/lib/libGLESv2.so -> libGLESv2.so.2
	lrwxrwxrwx    1 root     root            18 Mar 21 17:24 /usr/lib/libGLESv2.so.2 -> libGLESv2.so.2.0.0
	-rwxr-xr-x    1 root     root         78788 Mar 22 14:56 /usr/lib/libGLESv2.so.2.0.0

The last patch is a special defconfig that provides a Qt WebEngine setup on
raspberrypi3.

With this patchset, one can run the Qt quicknanobrowser sample on a rpi3 with
the following options:
  - BR2_TOOLCHAIN_BUILDROOT_LIBC="glibc" and
    BR2_TOOLCHAIN_BUILDROOT_CXX=y (Qt 5 needs a toolchain w/ wchar, NPTL, C++,
    dynamic library)
  - BR2_PACKAGE_LIBERATION (Qt 5.8 requires a least one font)
  - BR2_PACKAGE_RPI_USERLAND (to enable OpenGL backend)
  - BR2_PACKAGE_QT5BASE_LICENSE_APPROVED (to not prompt for license agreement;
    webengine takes many hours to be compiled (and maybe more!))
  - BR2_PACKAGE_QT5BASE_EXAMPLES (to install quicknanobrowser sample)
  - BR2_PACKAGE_QT5QUICKCONTROLS (needed by quicknanobrowser)
  - BR2_PACKAGE_QT5WEBENGINE (because it is what we want :))

To browse for HTTPS websites, please consider adding the following options as
well:
  - BR2_PACKAGE_CA_CERT (for certificates)
  - BR2_PACKAGE_NTPD (to sync date)

To run quicknanobrowser:
	# cd /usr/lib/qt/examples/webengine/quicknanobrowser/
	# ./quicknanobrowser

Enjoy ;)

Note: I do not know yet how to add an input backend (mouse, keyboard). For now,
quicknanobrowser will just display the qt website.

[1] https://patchwork.ozlabs.org/patch/640633/
[2] http://lists.busybox.net/pipermail/buildroot/2015-July/132010.html

Ga?l PORTAY (3):
  qt5webengine: new package
  rpi-userland: fix opengl library symlinks
  configs: new raspberrypi3 qt5 config

 configs/raspberrypi3_qt5_defconfig                 |  49 +++++
 package/qt5/Config.in                              |   1 +
 .../qt5/qt5webengine/0001-prefer-arm_tune.patch    |  19 ++
 .../qt5webengine/0002-change-default-ssl-dir.patch |  18 ++
 package/qt5/qt5webengine/Config.in                 |  44 ++++
 package/qt5/qt5webengine/chromium.inc              | 238 +++++++++++++++++++++
 package/qt5/qt5webengine/qt5webengine.hash         |   5 +
 package/qt5/qt5webengine/qt5webengine.mk           |  82 +++++++
 .../0001-Add-OpenGL-library-versioning.patch       |  36 ++++
 9 files changed, 492 insertions(+)
 create mode 100644 configs/raspberrypi3_qt5_defconfig
 create mode 100644 package/qt5/qt5webengine/0001-prefer-arm_tune.patch
 create mode 100644 package/qt5/qt5webengine/0002-change-default-ssl-dir.patch
 create mode 100644 package/qt5/qt5webengine/Config.in
 create mode 100644 package/qt5/qt5webengine/chromium.inc
 create mode 100644 package/qt5/qt5webengine/qt5webengine.hash
 create mode 100644 package/qt5/qt5webengine/qt5webengine.mk
 create mode 100644 package/rpi-userland/0001-Add-OpenGL-library-versioning.patch

-- 
2.12.0
