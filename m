From: Thomas Preston <thomas.preston@codethink.co.uk>
Date: Wed, 20 Nov 2019 17:39:14 +0000
Subject: [Buildroot] [RFC PATCH v3 00/30] Add Chromium Embedded Framework
 library
Message-ID: <20191120173944.130142-1-thomas.preston@codethink.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,
Here's our third attempt at adding libcef to Buildroot. We've tried to
address all feedback from the list, so thank you to everyone who has
contributed to that. If there are any further clarifications, we'll
respond directly.

Features:
- cefsimple sample application
- Widevine support
- ARM cross compilation (tested on a Raspberry Pi)
- Intel VA-API

The branch is split up into the following sections:
1. Buildroot changes to support libcef
2. The libcef package itself
3. libcef features, excluding V8 snapshot
4. A series of host- packages required by the V8 snapshot feature
5. The V8 snapshot feature

Still in progress:
- Testing using an external toolchain
- Testing V8 Snapshot build. Not sure if this works outside our build
  machine yet and it definitely doesn't work for ARM.

Known bugs:
- WebGL doesn't work on the ARM cross compile. We probably won't get
  around to fixing this for the Raspberry Pi.

Any more feedback would be greatly appreciated.

Many thanks,
Thomas Preston

Changes since RFC v2 (high-level):
- Updated to CEF 78.2.9+g4907ec5+chromium-78.0.3904.70
- Now using bitbucket auto-archive feature
- Moved staging variables closer to the definition where they are used
- Using the new host-pkg-config wrapper based on pkgconf-personality
  fixup (we fixed up qt5webengine too). We're aware there are some
  problems with pkgconf breaking some other packages right now.
- Wired up the Chromium `use_sysroot` and `target_sysroot` GN defines
- Added "host" architecture to LLVM targets (Chromium needs to build
  host binaries when cross compiling for ARM)
- Tidied up clang flags
- Added more comments describing `is_official_build` and the second
  output build directory (for building libcef_dll_wrapper).
- Removed cefclient because it has ancient dependencies
- Split out features into separate commits
- Moved patching to LIBCEF_PRE_PATCH_HOOKS
- Utilise the toolchain unbundling BUILD.gn
- Removed useless Python2 linking
- Install libEGL.so and libGLESv2.so, which are required by the browser

Joseph Kogut (1):
  package/llvm: add config to build backend for host arch

Matt Weber (2):
  package/llvm: install target binary/debug tools
  package/compiler-rt: new package

Michael Drake (23):
  package/libkrb5: Add host tools package.
  package/compiler-rt: Fix to install the blacklist datafiles for
    host-clang.
  package/webp: Enable host package build.
  package/Makefile.in: Provide TARGET_CROSS without path and trailing -
  package/libcef: New package
  package/libcef: Add option to enable VA-API HW acceleration.
  package/libcef: Add proprietary codecs build option.
  package/widevine: Add package for the widevine CDM library.
  package/libcef: Widevine support depends on widevine package.
  package/alsa-lib/alsa-lib: Add host package.
  package/ffmpeg: Add host package.
  package/libvpx: Add host package.
  package/x11r7/xcb-util: Add host package.
  package/x11r7/xlib_libXScrnSaver: Add host package.
  package/x11r7/xlib_libXcomposite: Add host package.
  package/x11r7/xlib_libXext: Add host package.
  package/x11r7/xlib_libXi: Add host package.
  package/x11r7/xlib_libXrandr: Add host package.
  package/x11r7/xlib_libXtst: Add host package.
  package/pciutils: Enable host package.
  package/libdrm: Add host package.
  package/mesa3d: Add host package.
  package/libcef: Add v8 Snapshot option.

Thomas Preston (4):
  pkgconf: Configure using pkgconf-personality
  package/qt5/qt5webengine: Use Buildroot's host-pkg-config wrapper
  package/jpeg-turbo: Add host install
  package/libcef: Add option to build cefsimple.

 DEVELOPERS                                    |    1 +
 package/Config.in                             |    3 +
 package/Makefile.in                           |   12 +-
 package/alsa-lib/alsa-lib.mk                  |    1 +
 package/clang/clang.mk                        |    2 +-
 package/compiler-rt/Config.in                 |   14 +
 package/compiler-rt/compiler-rt.hash          |    2 +
 package/compiler-rt/compiler-rt.mk            |   46 +
 package/ffmpeg/ffmpeg.mk                      |   61 +
 package/jpeg-turbo/jpeg-turbo.mk              |    2 +
 ...et-pkg_config-wrapper-handle-sysroot.patch |   52 +
 .../libcef/0002-stop-widevine-assert.patch    |   15 +
 ...e-cef_use_gtk-for-cefclient-GTK-deps.patch |   57 +
 package/libcef/Config.in                      |  149 +++
 .../build/toolchain/linux/unbundle/BUILD.gn   |   49 +
 package/libcef/libcef.license-files.inc       | 1131 +++++++++++++++++
 package/libcef/libcef.mk                      |  447 +++++++
 .../libcef/scripts/gather-license-files.sh    |   53 +
 package/libcef/scripts/version.sh             |   48 +
 package/libcef/templates/cef_version.h        |   70 +
 package/libdrm/libdrm.mk                      |    6 +
 package/libkrb5/libkrb5.mk                    |    1 +
 package/libvpx/libvpx.mk                      |   29 +
 package/lld/lld.mk                            |    2 +-
 package/llvm/Config.in                        |    6 +
 package/llvm/llvm.mk                          |   19 +-
 package/mesa3d/mesa3d.mk                      |   18 +
 package/pciutils/pciutils.mk                  |   19 +
 package/pkgconf/host-pkg-config.in            |    9 +
 package/pkgconf/host.personality.in           |    6 +
 package/pkgconf/pkg-config.in                 |   15 +-
 package/pkgconf/pkgconf.mk                    |   30 +-
 package/pkgconf/target.personality.in         |    6 +
 package/qt5/qt5webengine/host-pkg-config.in   |    6 -
 package/qt5/qt5webengine/qt5webengine.mk      |    7 +-
 package/webp/webp.mk                          |    5 +
 package/widevine/Config.in                    |    6 +
 package/widevine/widevine.mk                  |   38 +
 package/x11r7/xcb-util/xcb-util.mk            |    2 +
 .../xlib_libXScrnSaver/xlib_libXScrnSaver.mk  |    2 +
 .../xlib_libXcomposite/xlib_libXcomposite.mk  |    2 +
 package/x11r7/xlib_libXext/xlib_libXext.mk    |    2 +
 package/x11r7/xlib_libXi/xlib_libXi.mk        |    7 +
 .../x11r7/xlib_libXrandr/xlib_libXrandr.mk    |    2 +
 package/x11r7/xlib_libXtst/xlib_libXtst.mk    |    7 +
 45 files changed, 2429 insertions(+), 38 deletions(-)
 create mode 100644 package/compiler-rt/Config.in
 create mode 100644 package/compiler-rt/compiler-rt.hash
 create mode 100644 package/compiler-rt/compiler-rt.mk
 create mode 100644 package/libcef/0001-pkg_config-Let-pkg_config-wrapper-handle-sysroot.patch
 create mode 100644 package/libcef/0002-stop-widevine-assert.patch
 create mode 100644 package/libcef/0003-BUILD.gn-Use-cef_use_gtk-for-cefclient-GTK-deps.patch
 create mode 100644 package/libcef/Config.in
 create mode 100644 package/libcef/build/toolchain/linux/unbundle/BUILD.gn
 create mode 100644 package/libcef/libcef.license-files.inc
 create mode 100644 package/libcef/libcef.mk
 create mode 100755 package/libcef/scripts/gather-license-files.sh
 create mode 100755 package/libcef/scripts/version.sh
 create mode 100644 package/libcef/templates/cef_version.h
 create mode 100644 package/pkgconf/host-pkg-config.in
 create mode 100644 package/pkgconf/host.personality.in
 create mode 100644 package/pkgconf/target.personality.in
 delete mode 100644 package/qt5/qt5webengine/host-pkg-config.in
 create mode 100644 package/widevine/Config.in
 create mode 100644 package/widevine/widevine.mk

-- 
2.20.1
