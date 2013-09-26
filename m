From: Spenser Gilliland <spenser@gillilanding.com>
Date: Thu, 26 Sep 2013 18:21:43 -0500
Subject: [Buildroot] [PATCH v3 00/11] glmark2 and Mesa updates
Message-ID: <1380237714-2470-1-git-send-email-spenser@gillilanding.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

this patch series adds glmark2 and mesa3d-demos along with supporting updates
for mesa3d and libdrm.  Additionally, a udev bug fix for EABIhf toolchains is
included.

v2->v3:
  - Updates based on reviews.

v1->v2:
  - updates based on reviews.
  - add mesa3d-demos

Spenser Gilliland (11):
  udev: explicitly include pthreads
  sunxi-mali: add explicit pthread/dl/rt dependencies
  libpthread-stubs: move out of x11r7
  libdrm: remove x11 dependency.
  sunxi-cedarx: bump to newer version, use armel2 binaries, add demo
  mesa3d: pull out from x11
  mesa3d: modularize and bump to version 9.1.6
  libpng12: new package
  libpng: ensure libpng12 is installed before libpng
  glmark2: new package
  mesa3d-demos: new package

 package/Config.in                                  |    5 +
 package/glmark2/Config.in                          |   17 ++
 package/glmark2/glmark2-add-mali-support.patch     |  102 ++++++++
 package/glmark2/glmark2-fix-add-GLchar.patch       |   17 ++
 .../glmark2-gl-to-glesv2-on-drm-flavor.patch       |   25 ++
 package/glmark2/glmark2.mk                         |   70 ++++++
 package/libdrm/Config.in                           |    3 +-
 package/libdrm/libdrm.mk                           |    5 +-
 package/libpng/libpng.mk                           |    4 +
 package/libpng12/Config.in                         |    9 +
 package/libpng12/libpng12.mk                       |   18 ++
 .../Config.in                                      |    2 +-
 package/libpthread-stubs/xlib_libpthread-stubs.mk  |   17 ++
 package/mesa3d-demos/Config.in                     |    8 +
 .../mesa3d-demos/mesa3d-demos-non-mesa-impl.patch  |  244 ++++++++++++++++++++
 .../mesa3d-demos/mesa3d-demos-optional-gl.patch    |   75 ++++++
 package/mesa3d-demos/mesa3d-demos-x11-fix.patch    |   30 +++
 package/mesa3d-demos/mesa3d-demos.mk               |   63 +++++
 package/mesa3d/Config.in                           |  182 +++++++++++++++
 package/mesa3d/mesa3d-cross-glsl-compiler.patch    |   41 ++++
 package/mesa3d/mesa3d-gbm-without-dri.patch        |   30 +++
 package/mesa3d/mesa3d.mk                           |  126 ++++++++++
 package/opengl/Config.in                           |    3 +
 package/opengl/libegl/libegl.mk                    |    4 +
 package/opengl/libgl/libgl.mk                      |   20 ++
 package/opengl/libgles/libgles.mk                  |    4 +
 package/opengl/libopenvg/libopenvg.mk              |    4 +
 package/sunxi-cedarx/Config.in                     |   10 +
 package/sunxi-cedarx/sunxi-cedarx.mk               |   27 ++-
 package/sunxi-mali/egl.pc                          |    2 +-
 package/sunxi-mali/glesv2.pc                       |    2 +-
 package/udev/udev.mk                               |    2 +-
 package/x11r7/Config.in                            |    2 -
 package/x11r7/libxcb/Config.in                     |    2 +-
 package/x11r7/mesa3d/Config.in                     |   15 --
 package/x11r7/mesa3d/mesa3d-uclibc-locale.patch    |   56 -----
 package/x11r7/mesa3d/mesa3d.mk                     |   40 ----
 .../xlib_libpthread-stubs/xlib_libpthread-stubs.mk |   16 --
 .../xserver_xorg-server/xserver_xorg-server.mk     |    4 +-
 39 files changed, 1163 insertions(+), 143 deletions(-)
 create mode 100644 package/glmark2/Config.in
 create mode 100644 package/glmark2/glmark2-add-mali-support.patch
 create mode 100644 package/glmark2/glmark2-fix-add-GLchar.patch
 create mode 100644 package/glmark2/glmark2-gl-to-glesv2-on-drm-flavor.patch
 create mode 100644 package/glmark2/glmark2.mk
 create mode 100644 package/libpng12/Config.in
 create mode 100644 package/libpng12/libpng12.mk
 rename package/{x11r7/xlib_libpthread-stubs => libpthread-stubs}/Config.in (81%)
 create mode 100644 package/libpthread-stubs/xlib_libpthread-stubs.mk
 create mode 100644 package/mesa3d-demos/Config.in
 create mode 100644 package/mesa3d-demos/mesa3d-demos-non-mesa-impl.patch
 create mode 100644 package/mesa3d-demos/mesa3d-demos-optional-gl.patch
 create mode 100644 package/mesa3d-demos/mesa3d-demos-x11-fix.patch
 create mode 100644 package/mesa3d-demos/mesa3d-demos.mk
 create mode 100644 package/mesa3d/Config.in
 create mode 100644 package/mesa3d/mesa3d-cross-glsl-compiler.patch
 create mode 100644 package/mesa3d/mesa3d-gbm-without-dri.patch
 create mode 100644 package/mesa3d/mesa3d.mk
 create mode 100644 package/opengl/libgl/libgl.mk
 delete mode 100644 package/x11r7/mesa3d/Config.in
 delete mode 100644 package/x11r7/mesa3d/mesa3d-uclibc-locale.patch
 delete mode 100644 package/x11r7/mesa3d/mesa3d.mk
 delete mode 100644 package/x11r7/xlib_libpthread-stubs/xlib_libpthread-stubs.mk
