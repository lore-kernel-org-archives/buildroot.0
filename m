From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu,  7 Mar 2013 21:18:28 +0100
Subject: [Buildroot] [PATCH 00/32 v3] Add Qt5 packages
Message-ID: <1362687540-19440-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Here is a set of patches that add Qt5 support in Buildroot. I have
built a number of different combinations, but there are some many
different possibilities, that I obviously couldn't test all of
them. Some testing will be appreciated, but for sure, only the
autobuilders will really help in getting a good build coverage of all
this.

In short:

 * Patch 1 fixes xcb-util to have the proper dependency on libxcb.

 * Patches 2 and 3 add the xcb-util-wm and xcb-util-image packages, that
   are needed to build the XCB backend of Qt5.

 * Patches 4 and 5 improve the rpi-userland package to provide a .pc
   file that allows to easily link against the RPi implementation of
   OpenGLES and EGL.

 * Patch 6 makes packages using host-jpeg use host-libjpeg instead so
   that we don't have to provide a virtual host-jpeg package.

 * Patch 7 converts the jpeg virtual package to a real package.

 * Patches 8 and 9 adds some basic infrastructure to support the Qt5
   packages.

 * Patch 10 adds the Qt5Base package.

 * Patches 11 to 20 extend the Qt5Base package with various features
   (GUI, OpenSSL, EGL, D-Bus, etc.)

 * Patch 21 creates a common variable to share the Qt5 version between
   all the Qt5 packages.

 * Patches 22 to 31 add more Qt5 libraries: Qt5Svg, Qt5Webkit,
   Qt5Script, and more.

 * Patch 32 fixes a build problem of Qt5Webkit when an OpenGLES
   backend is used (it forgets to add the right include paths).

Changes v2 -> v3:

 * Drop patches that have been merged upstream.
 * Fix the xcb-util package to depend on libxcb.
 * Fix the xcb-util-wm package to depend on libxcb.
 * Bump the version of Qt5 to 5.0.1 (instead of 5.0.0)
 * Add patch from Floris Bos to fix Qt5Webkit build with an OpenGLES
   backend.
 * Fix QT5_BASE -> QT5BASE, noticed by Lionel Orry.
 * Add missing "depends on" in Qt5Quick, Qt5Multimedia and
   Qt5GraphicalEffects. They all select Qt5Declarative, which itself
   depends on the availability of an OpenGLES backend.

Changes v1 -> v2:

 * Make the package that depended on host-jpeg depend on host-libjpeg
   directly, so that we don't need to provide a virtual host-jpeg
   package.
 * Integrated patches from Floris Bos to fix issues related RPi
   OpenGLES/EGL libraries, and to get the installation of fonts done
   by the qt5base package.
 * pcre: fixed typo is -> if in commit log [Gustavo Zacarias]
 * pcre: fix help text in Config.in [Gustavo Zacarias]

The patches are also available from:

  http://git.free-electrons.com/users/thomas-petazzoni/buildroot/log/?h=qt5

Best regards,

Thomas

Floris Bos (4):
  rpi-userland: add bcm_host to egl.pc
  qt5base: add rPi EGL glue code
  qt5base: install bundled fonts to target
  qt5webkit: add EGL dir to includepath

Thomas Petazzoni (28):
  xcb-util: add dependency on libxcb
  x11r7/xcb-util-wm: new package
  x11r7/xcb-util-image: new package
  rpi-userland: add .pc files for OpenGLESv2 and EGL libs
  efl/libeet, efl/libevas: use host-libjpeg instead of host-jpeg
  jpeg: convert to a real package
  qt5: base infrastructure
  qt5: add macro to fixup Qt5 .la and .prl files
  qt5base: new package
  qt5base: add GUI support
  qt5base: support debug or release modes
  qt5base: add OpenSSL support
  qt5base: add eglfs graphics backend
  qt5base: add support for fontconfig, png, jpeg, gif
  qt5base: add D-Bus support
  qt5base: add glib support
  qt5base: add support to build against ICU
  qt5: factor Qt5 version
  qt5/qt5svg: new package
  qt5/qt5script: new package
  qt5/qt5imageformats: new package
  qt5/qt5xmlpatterns: new package
  qt5/qt5jsbackend: new package
  qt5/qt5declarative: new package
  qt5/qt5graphicaleffects: new package
  qt5/qt5multimedia: new package
  qt5/qt5quick1: new package
  qt5/qt5webkit: new package

 package/Config.in                                  |    1 +
 package/efl/libeet/libeet.mk                       |    2 +-
 package/efl/libevas/libevas.mk                     |    2 +-
 package/jpeg/jpeg.mk                               |   22 ++-
 package/qt5/Config.in                              |   28 +++
 package/qt5/qt5.mk                                 |   12 ++
 package/qt5/qt5base/Config.in                      |  158 ++++++++++++++++
 ...nce-add-egl-to-CONFIG-to-get-correct-incl.patch |   32 ++++
 package/qt5/qt5base/qt5base-mkspecs-files.patch    |   64 +++++++
 package/qt5/qt5base/qt5base-uclibc-no-lfs.patch    |   36 ++++
 package/qt5/qt5base/qt5base.mk                     |  188 ++++++++++++++++++++
 package/qt5/qt5declarative/Config.in               |   18 ++
 package/qt5/qt5declarative/qt5declarative.mk       |   48 +++++
 package/qt5/qt5graphicaleffects/Config.in          |   14 ++
 .../qt5/qt5graphicaleffects/qt5graphicaleffects.mk |   40 +++++
 package/qt5/qt5imageformats/Config.in              |   10 ++
 package/qt5/qt5imageformats/qt5imageformats.mk     |   39 ++++
 package/qt5/qt5jsbackend/Config.in                 |   10 ++
 ...t5jsbackend-dont-import-bz2-python-module.patch |   29 +++
 .../qt5/qt5jsbackend/qt5jsbackend-fix-uclibc.patch |   33 ++++
 package/qt5/qt5jsbackend/qt5jsbackend.mk           |   41 +++++
 package/qt5/qt5multimedia/Config.in                |   14 ++
 package/qt5/qt5multimedia/qt5multimedia.mk         |   43 +++++
 package/qt5/qt5quick1/Config.in                    |   18 ++
 package/qt5/qt5quick1/qt5quick1.mk                 |   45 +++++
 package/qt5/qt5script/Config.in                    |   10 ++
 package/qt5/qt5script/qt5script.mk                 |   41 +++++
 package/qt5/qt5svg/Config.in                       |   11 ++
 package/qt5/qt5svg/qt5svg.mk                       |   47 +++++
 package/qt5/qt5webkit/Config.in                    |   12 ++
 .../qt5/qt5webkit/qt5webkit-egl-includepath.patch  |   40 +++++
 package/qt5/qt5webkit/qt5webkit.mk                 |   43 +++++
 package/qt5/qt5xmlpatterns/Config.in               |   10 ++
 package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk       |   41 +++++
 .../rpi-userland-add-pkgconfig-files.patch         |   54 ++++++
 package/x11r7/Config.in                            |    2 +
 package/x11r7/xcb-util-image/Config.in             |   15 ++
 package/x11r7/xcb-util-image/xcb-util-image.mk     |   14 ++
 package/x11r7/xcb-util-wm/Config.in                |   16 ++
 package/x11r7/xcb-util-wm/xcb-util-wm.mk           |   14 ++
 package/x11r7/xcb-util/Config.in                   |    1 +
 package/x11r7/xcb-util/xcb-util.mk                 |    2 +-
 42 files changed, 1313 insertions(+), 7 deletions(-)
 create mode 100644 package/qt5/Config.in
 create mode 100644 package/qt5/qt5.mk
 create mode 100644 package/qt5/qt5base/Config.in
 create mode 100644 package/qt5/qt5base/qt5base-eglconvenience-add-egl-to-CONFIG-to-get-correct-incl.patch
 create mode 100644 package/qt5/qt5base/qt5base-mkspecs-files.patch
 create mode 100644 package/qt5/qt5base/qt5base-uclibc-no-lfs.patch
 create mode 100644 package/qt5/qt5base/qt5base.mk
 create mode 100644 package/qt5/qt5declarative/Config.in
 create mode 100644 package/qt5/qt5declarative/qt5declarative.mk
 create mode 100644 package/qt5/qt5graphicaleffects/Config.in
 create mode 100644 package/qt5/qt5graphicaleffects/qt5graphicaleffects.mk
 create mode 100644 package/qt5/qt5imageformats/Config.in
 create mode 100644 package/qt5/qt5imageformats/qt5imageformats.mk
 create mode 100644 package/qt5/qt5jsbackend/Config.in
 create mode 100644 package/qt5/qt5jsbackend/qt5jsbackend-dont-import-bz2-python-module.patch
 create mode 100644 package/qt5/qt5jsbackend/qt5jsbackend-fix-uclibc.patch
 create mode 100644 package/qt5/qt5jsbackend/qt5jsbackend.mk
 create mode 100644 package/qt5/qt5multimedia/Config.in
 create mode 100644 package/qt5/qt5multimedia/qt5multimedia.mk
 create mode 100644 package/qt5/qt5quick1/Config.in
 create mode 100644 package/qt5/qt5quick1/qt5quick1.mk
 create mode 100644 package/qt5/qt5script/Config.in
 create mode 100644 package/qt5/qt5script/qt5script.mk
 create mode 100644 package/qt5/qt5svg/Config.in
 create mode 100644 package/qt5/qt5svg/qt5svg.mk
 create mode 100644 package/qt5/qt5webkit/Config.in
 create mode 100644 package/qt5/qt5webkit/qt5webkit-egl-includepath.patch
 create mode 100644 package/qt5/qt5webkit/qt5webkit.mk
 create mode 100644 package/qt5/qt5xmlpatterns/Config.in
 create mode 100644 package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk
 create mode 100644 package/rpi-userland/rpi-userland-add-pkgconfig-files.patch
 create mode 100644 package/x11r7/xcb-util-image/Config.in
 create mode 100644 package/x11r7/xcb-util-image/xcb-util-image.mk
 create mode 100644 package/x11r7/xcb-util-wm/Config.in
 create mode 100644 package/x11r7/xcb-util-wm/xcb-util-wm.mk

-- 
1.7.9.5
