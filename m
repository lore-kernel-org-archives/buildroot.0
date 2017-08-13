From: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@savoirfairelinux.com>
Date: Sun, 13 Aug 2017 09:56:47 -0400
Subject: [Buildroot] [PATCH v7 0/3] Qt WebEngine support
Message-ID: <20170813135650.14067-1-gael.portay@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

The purpose of this patch series is to continue the integration of Qt5 WebEngine
in buildroot; started long time ago by Akihiko Odaki [1] and Julien Corjon [2].

The first patch adds the rpi-userland OpenGL libraries symlinks. WebEngine
eglfs backend loads dynamically libEGL.so.1 and libGLESv2.so.2 [3].

	$ ls -l output/target/usr/lib/libEGL* output/target/usr/lib/libGLESv2*
	-rwxr-xr-x 1 buildroot buildroot 130032 Aug 10 21:17 output/target/usr/lib/libEGL.so
	lrwxrwxrwx 1 buildroot buildroot      9 Aug  9 12:30 output/target/usr/lib/libEGL.so.1 -> libEGL.so
	-rwxr-xr-x 1 buildroot buildroot  71088 Aug 10 21:16 output/target/usr/lib/libGLESv2.so
	lrwxrwxrwx 1 buildroot buildroot     12 Aug  9 12:30 output/target/usr/lib/libGLESv2.so.2 -> libGLESv2.so

A PR has been made [4].

The second patch provides the Qt WebEngine package. The additionnal patch fixes
a build issue when samples are compiled without the support of printing [5].
This patch is already merged [6] and concerns only 5.9.1.

It fixes the error below.

	.obj/browsermainwindow.o: In function `BrowserMainWindow::printRequested(QWebEnginePage*)': browsermainwindow.cpp:(.text+0x2cc0): undefined reference to `QWebEnginePage::print(QPrinter*, QWebEngineCallback<bool> const&)'

The last patch is a special defconfig that provides a Qt WebEngine setup on
raspberrypi3.

With this patchset, one can run the Qt quicknanobrowser sample on a rpi3 with
the following options:
  - BR2_TOOLCHAIN_BUILDROOT_LIBC="glibc" and
    BR2_TOOLCHAIN_BUILDROOT_CXX=y (Qt 5 needs a toolchain w/ wchar, NPTL, C++,
    dynamic library)
  - BR2_PACKAGE_LIBERATION (Qt 5.8 requires a least one font)
  - BR2_PACKAGE_RPI_USERLAND (to enable OpenGL backend)
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

I have tested it with a rpi 3; and I will be glad if someone else has another
EGL platform to test it.

Enjoy ;)

Note: For now, quicknanobrowser will just display the qt website without any
input backend.

Note 2: Since bump to 5.9.1, the chromium's copy of opus fails with neon [7].
BR2_PACKAGE_QT5WEBENGINE_SYSTEM_FFMPEG option allows one to use buildroot copy
(which compiles fine).

	In file included from ../../3rdparty/chromium/third_party/opus/src/silk/arm/NSQ_neon.c:31:0:
	/home/gportay/src/buildroot/output-rpi3-qt5.9/host/lib/gcc/arm-buildroot-linux-gnueabihf/6.4.0/include/arm_neon.h:8997:1: error: inlining failed in call to always_inline ?vld1q_s32?: target specific option mismatch
	 vld1q_s32 (const int32_t * __a)
	 ^~~~~~~~~
	../../3rdparty/chromium/third_party/opus/src/silk/arm/NSQ_neon.c:40:15: note: called from here
	     int32x4_t coef0 = vld1q_s32(coef32);
		       ^~~~~
	../../3rdparty/chromium/third_party/opus/src/silk/arm/NSQ_neon.c: At top level:
	cc1: warning: unrecognized command line option ?-Wno-#pragma-messages?

Note 3: Since bump to 5.9.1, chromium requires udev.

Note 4: Tested against:
        - GCC 6.x and binutils 2.27 on rpi 3.
        - GCC 7.x and binutils 2.28 on rpi 3.

Note 5: Version 5.6.2 causes a build issue while building chromium. I disabled
        the build against this version and am waiting for the release 5.6.3.

[1] https://patchwork.ozlabs.org/patch/640633/
[2] http://lists.busybox.net/pipermail/buildroot/2015-July/132010.html
[3] https://github.com/qt/qtwebengine/blob/5.9/src/core/surface_factory_qt.cpp#L76-L86
[4] https://github.com/raspberrypi/userland/pull/379
[5] https://bugreports.qt.io/browse/QTBUG-61510
[6] https://codereview.qt-project.org/#/c/198041/
[7] https://patchwork.ozlabs.org/patch/791332/

Note 6: The chromium.inc has been generated thanks
( echo 'CHROMIUM_LICENSE_FILES = \' &&
  cd output/build/qt5webengine-5.9.1/ && \
  find "src/3rdparty/chromium/" -type f -iname "*LICENSE*" -o -iname "*COPYING*" -o -iname "*GPL*" | \
  sed -e '/\.asm$/d' \
      -e '/\.h$/d' \
      -e '/\.c$/d' \
      -e '/\.cc$/d' \
      -e '/\.cpp$/d' \
      -e '/\.pyc\?$/d' \
      -e '/\.pl$/d' \
      -e '/\.sha1$/d' \
      -e '/\.patch$/d' \
      -e '/licensecheck/d' \
      -e 's,^,\t,' \
      -e 's,$, \\,' | \
  sort && \
  echo '' ) >package/qt5/qt5webengine/chromium.inc

Changes since RFC:
 - rebase to master (use SPDX licenses, remove license approved, update
   qt5_defconfig...)
 - remove the patch "prefer arm tune"
 - disable build with Qt 5.6 LTS (not working, waiting for 5.6.3 in August)
 - re-order patches

Changes since v1:
 - manually create symlinks to preserve SONAME
 - add my signed-off-by to the qt webengine patch
 - make qtwe package depends on supported architectures
 - fix Kconfig comment about Qt 5.6
 - sort alphabetically chromium licenses

Changes since v2:
 - fix build issue when I sorted alphabetically the chromium licenses
 - replace legacy option BR2_TARGET_ROOTFS_EXT2_BLOCK to
   new option BR2_TARGET_ROOTFS_EXT2_SIZE

Changes since v3:
 - add my signed-off-by and the PR link to the rpi-userland patch
 - move rpi patch index from 0001 to 0007

Changes since v4:
 - bump to Qt WebEngine to 5.9.1
 - added the mainlined patch that fixes the build issue with samples when print
   is not supported
 - udev is selected (required by chromium)
 - add config entry to use system ffmpeg and set it to yes by default
 - the patch concerning the path to CA certificates has been removed since it is
   no more relevant in 5.9.x
 - increase BR2_TARGET_ROOTFS_EXT2_SIZE to 360MB to support
   $ du -sk target/
   312480	target/

Changes since v5:
 - really add the mainlined patch that fixes the build issue with samples when
   print is not supported
 - add BR2_PACKAGE_QT5WEBENGINE_ARCH_SUPPORTS to list all supported
   architectures
 - add BR2_PACKAGE_QT5WEBENGINE missing dependencies (tc, mmu, wchar...)
 - stop using && for depends on relationships
 - update chromium licence list in chromium.inc
 - remove option BR2_PACKAGE_QT5WEBENGINE_SYSTEM_FFMPEG;
   and compile ffmpeg, opus, libvpx and webp packages
 - reword help and add url to documentation of package qt5webengine
 - remove hash of 5.6.2 version
 - add QT5WEBENGINE_ namespace to QMAKEFLAGS
 - add missing TARGET_MAKE_ENV to BUILD_CMD
 - create python symlink form $(HOST_DIR)/bin (was $(HOST_DIR)/usr/bin)
 - add myself to DEVELOPERS

Changes since v6:
 - rpi-userland commit message:
   fix output of ls -l snippet
   update url to link to qtwe-5.9.1
   add upstream-status
 - qtwe:
   add missing host-bison, host-flex and host-pkgconf dependencies
   select BR2_HOSTARCH_NEEDS_IA32_COMPILER for 32-bit targets

Ga?l PORTAY (3):
  rpi-userland: fix opengl library symlinks
  qt5webengine: new package
  configs: new raspberrypi3 qt5 config

 DEVELOPERS                                         |   1 +
 configs/raspberrypi3_qt5_defconfig                 |  48 ++++
 package/qt5/Config.in                              |   1 +
 .../0001-Always-compile-QWebEnginePage-print.patch | 244 ++++++++++++++++
 package/qt5/qt5webengine/Config.in                 |  75 +++++
 package/qt5/qt5webengine/chromium.inc              | 310 +++++++++++++++++++++
 package/qt5/qt5webengine/qt5webengine.hash         |   2 +
 package/qt5/qt5webengine/qt5webengine.mk           |  80 ++++++
 .../0007-Add-OpenGL-library-versioning.patch       |  41 +++
 9 files changed, 802 insertions(+)
 create mode 100644 configs/raspberrypi3_qt5_defconfig
 create mode 100644 package/qt5/qt5webengine/5.9.1/0001-Always-compile-QWebEnginePage-print.patch
 create mode 100644 package/qt5/qt5webengine/Config.in
 create mode 100644 package/qt5/qt5webengine/chromium.inc
 create mode 100644 package/qt5/qt5webengine/qt5webengine.hash
 create mode 100644 package/qt5/qt5webengine/qt5webengine.mk
 create mode 100644 package/rpi-userland/0007-Add-OpenGL-library-versioning.patch

-- 
2.13.2
