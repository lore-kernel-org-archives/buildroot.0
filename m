From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  7 Jun 2014 14:31:00 +0200
Subject: [Buildroot] [PATCH v12 00/32] xbmc: bump version to 13.1
Message-ID: <1402144292-27837-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

the patch series combines my latest patches to bump xbmc.
It also adds uClibc support to xbmc, a mesa3d version bump
and several new packages to support the new xbmc release
along with libva to get the best out of Intel systems.

The series is compiled-tested using

BR2_TOOLCHAIN_EXTERNAL=y
BR2_PACKAGE_XBMC=y
BR2_PACKAGE_XBMC_AVAHI=y
BR2_PACKAGE_XBMC_DBUS=y
BR2_PACKAGE_XBMC_LIBBLURAY=y
BR2_PACKAGE_XBMC_LIBMICROHTTPD=y
BR2_PACKAGE_XBMC_LIBNFS=y
BR2_PACKAGE_XBMC_RTMPDUMP=y
BR2_PACKAGE_XBMC_LIBSHAIRPLAY=y
BR2_PACKAGE_XBMC_LIBSMBCLIENT=y
BR2_PACKAGE_XBMC_LIBTHEORA=y
BR2_PACKAGE_XBMC_LIBUSB=y
BR2_PACKAGE_XBMC_WAVPACK=y
BR2_PACKAGE_XBMC_GOOM=y
BR2_PACKAGE_XBMC_ADDON_XVDR=y
BR2_PACKAGE_XBMC_PVR_ADDONS=y
BR2_PACKAGE_MESA3D=y
BR2_PACKAGE_MESA3D_DRI_DRIVER_I965=y
BR2_PACKAGE_XORG7=y
BR2_PACKAGE_XSERVER_XORG_SERVER=y
BR2_PACKAGE_XSERVER_XORG_SERVER_MODULAR=y
BR2_PACKAGE_XDRIVER_XF86_VIDEO_INTEL=y

Regards, Bernd

v12: - rebased (no more RC versions ;))
     - bump xbmc to 13.1
       - github helper produces a wrong URL
         (wrong: xbmc-13.1-Gotham.tar.gz, correct: 13.1-Gotham.tar.gz),
         so I had to switch to _SOURCE until a fix is found
     - bump mesa3d version to 10.2.1
v11: - patch series updated by Yann
       - series re-ordering
       - add new required gconv-related patch
       - some commit logs massaging
v10: - reworked patch series based on comments by Yann
       - added comment to xproto_dri3proto
       - removed emtpy line from libva
       - added comment to libglu
     - fix libpng support in xbmc??s rsxs screensaver
     - bump mesa3d version to 10.2-rc4
v9: - reworked patch series based on comments by Yann & Arnout:
      - moved some patches before xbmc version bump for bisectability
      - removed iconv patch to SDL, to be checked later
      - removed rtmpdump/KSV patch from series, to be checked later
      - added description to mesa3d/xorg meta package dependency
      - reworked OpenGL/egl+gles logic in package/xbmc/
    - bump xbmc to 13.1 Beta2
    - cec needs udev to be useful
v8: - squashed "[v7 29/31] ffmpeg cross-compile" into
      "[v8 16/28] Gotham bump" (Thomas)
    - squashed "[v7 21/31] uclibc at arm" & "[v7 31/31] ipv6"
      patches into "[v8 20/28] uclibc" patch (Thomas/Yann)
    - xbmc-pvr-addons: updated comment (Yann)
v7: - rebased
    - bump mesa3d version to 10.2-rc3
    - included v2 of "xproto_dri3proto: New package"
v6: - bump mesa3d version to 10.2-rc2
    - bump libva and libva-intel-driver to 1.3.1


Bernd Kuhls (28):
  xbmc: add host-gettext dependency
  xbmc: add host-nasm dependency
  xbmc: add host-yasm dependency for MMX/64bit archs
  xbmc: add missing egl-related cflags
  xbmc: hdmi cec supports needs udev for device scanning
  xbmc: bump version to 13.1
  xbmc-pvr-addons: bump to a version compatible with XBMC Gotham
  xbmc-addon-xvdr: bump to a version compatible with XBMC Gotham
  mesa3d: Bump version to 10.2.1, fix xa build
  mesa3d: Depend on xorg meta package instead of xserver_xorg-server
  mesa3d: add dependency xproto_presentproto
  mesa3d: Remove dependency for the libxml2 module of host-python
  mesa3d: Add dri3 support
  mesa3d: dri2 does not need udev support
  libva: new package
  libva-intel-driver: new package
  ffmpeg: Add libva support
  libglu: new package
  libglew: new package
  sdl: Add new dependency libglu for opengl support
  xdriver_xf86-video-intel: Bump version to 2.99.911
  xbmc: Allow compilation with uClibc
  xbmc: Add alsa support
  xbmc: Add lame support
  xbmc: Fix TexturePacker compile
  xbmc: Add X.org/OpenGL support
  xbmc: Add option for Goom screensaver
  xbmc: Add VA-API support

Samuel Martin (2):
  xbmc: fix missing libraries from rpi-userland
  rpi-userland: cleanup *_CONF_OPT

Yann E. MORIN (2):
  toolchain: add option to copy the gconv libraries
  package/libcec: fix missing libraries from rpi-userland

 Makefile                                           |    6 +
 package/Config.in                                  |    4 +
 package/ffmpeg/ffmpeg.mk                           |    8 +-
 package/libcec/libcec.mk                           |    1 +
 package/libglew/Config.in                          |   19 ++
 package/libglew/libglew.mk                         |   36 ++++
 package/libglu/Config.in                           |   10 +
 package/libglu/libglu.mk                           |   17 ++
 package/libva-intel-driver/Config.in               |   19 ++
 package/libva-intel-driver/libva-intel-driver.mk   |   29 +++
 package/libva/Config.in                            |   18 ++
 package/libva/libva-0001-no_test_decode.patch      |   17 ++
 package/libva/libva.mk                             |   56 +++++
 package/libxml2/Config.in                          |    3 -
 package/libxml2/libxml2-python2.patch              |   27 ---
 package/libxml2/libxml2.mk                         |   16 +-
 package/mesa3d/Config.in                           |   24 +--
 .../mesa3d-0002-dri2-does-not-need-udev.patch      |   25 +++
 package/mesa3d/mesa3d.mk                           |   25 ++-
 package/rpi-userland/rpi-userland.mk               |    2 +-
 package/sdl/sdl.mk                                 |    3 +-
 package/x11r7/xdriver_xf86-video-intel/Config.in   |    5 +-
 .../xdriver_xf86-video-intel.mk                    |   27 ++-
 .../xbmc-addon-xvdr-0001-foreign-automake.patch    |   28 ---
 package/xbmc-addon-xvdr/xbmc-addon-xvdr.mk         |    7 +-
 package/xbmc-pvr-addons/xbmc-pvr-addons.mk         |    7 +-
 package/xbmc/Config.in                             |   59 +++++-
 package/xbmc/xbmc-0002-mathutil.patch              |  213 ++++++++++++++++++++
 package/xbmc/xbmc.mk                               |   95 +++++++--
 toolchain/toolchain-common.in                      |   10 +
 30 files changed, 682 insertions(+), 134 deletions(-)
 create mode 100644 package/libglew/Config.in
 create mode 100644 package/libglew/libglew.mk
 create mode 100644 package/libglu/Config.in
 create mode 100644 package/libglu/libglu.mk
 create mode 100644 package/libva-intel-driver/Config.in
 create mode 100644 package/libva-intel-driver/libva-intel-driver.mk
 create mode 100644 package/libva/Config.in
 create mode 100644 package/libva/libva-0001-no_test_decode.patch
 create mode 100644 package/libva/libva.mk
 delete mode 100644 package/libxml2/libxml2-python2.patch
 create mode 100644 package/mesa3d/mesa3d-0002-dri2-does-not-need-udev.patch
 delete mode 100644 package/xbmc-addon-xvdr/xbmc-addon-xvdr-0001-foreign-automake.patch
 create mode 100644 package/xbmc/xbmc-0002-mathutil.patch

-- 
1.7.10.4
