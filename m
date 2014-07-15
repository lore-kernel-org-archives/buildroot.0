From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 15 Jul 2014 21:18:55 +0200
Subject: [Buildroot] =?utf-8?q?=5BPATCH_v14_00/20=5D_package/xbmc=3A_Add_s?=
	=?utf-8?q?upport_for_uClibc=2C_libva_and_additional_packages?=
Message-ID: <1405451955-10204-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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

Regards, Bernd

v13: - rebased
     - bump mesa3d version to 10.2.3
     - bump libva-intel-driver to 1.3.2
v13: - rebased
     - lots of patches removed after they were committed
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
     - fix libpng support in xbmc?????????s rsxs screensaver
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


Bernd Kuhls (20):
  package/mesa3d: Bump to version 10.2.3
  package/mesa3d: Depend on xorg meta package instead of
    xserver_xorg-server
  package/mesa3d: add dependency xproto_presentproto
  package/mesa3d: Remove dependency for the libxml2 module of
    host-python
  mesa3d: Add dri3 support
  libva: new package
  libva-intel-driver: new package
  ffmpeg: Add libva support
  libglu: new package
  sdl: Add new dependency libglu for opengl support
  libglew: new package
  xdriver_xf86-video-intel: Bump version to 2.99.911
  xbmc: Add missing egl-related cflags
  xbmc: Allow compilation with uClibc
  xbmc: Add alsa support
  xbmc: Add lame support
  xbmc: Fix TexturePacker compile
  xbmc: Add X.org/OpenGL support
  xbmc: Add option for Goom screensaver
  xbmc: Add VA-API support

 package/Config.in                                  |    3 +-
 package/eudev/Config.in                            |   68 +++++---------
 package/eudev/eudev.mk                             |   56 ++----------
 package/libatasmart/Config.in                      |    5 +-
 package/libcec/libcec.mk                           |    4 +-
 package/libdrm/libdrm.mk                           |    4 +-
 package/libinput/Config.in                         |    5 +-
 package/libinput/libinput.mk                       |    2 +-
 package/libudev/Config.in                          |    6 --
 package/libudev/libudev.mk                         |    7 --
 package/libusb/libusb.mk                           |    5 +-
 package/mesa3d/Config.in                           |    6 +-
 package/mesa3d/mesa3d.mk                           |    4 +-
 package/systemd/Config.in                          |   55 +++++++-----
 package/systemd/systemd.mk                         |    2 +-
 package/transmission/transmission.mk               |    4 +-
 package/vlc/vlc.mk                                 |    4 +-
 package/weston/Config.in                           |    6 +-
 package/weston/weston.mk                           |    2 +-
 package/x11r7/xdriver_xf86-input-evdev/Config.in   |    5 +-
 .../xdriver_xf86-input-evdev.mk                    |    3 +-
 .../xserver_xorg-server/xserver_xorg-server.mk     |    4 +-
 package/xbmc/Config.in                             |    6 +-
 package/xbmc/xbmc.mk                               |    2 +-
 support/scripts/gen-manual-lists.py                |   95 ++++----------------
 system/Config.in                                   |   76 +++-------------
 26 files changed, 133 insertions(+), 306 deletions(-)
 delete mode 100644 package/libudev/Config.in
 delete mode 100644 package/libudev/libudev.mk

-- 
1.7.10.4
