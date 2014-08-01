From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri,  1 Aug 2014 19:32:36 +0200
Subject: [Buildroot] =?utf-8?q?=5BPATCH_v16_0/3=5D_package/xbmc=3A_Add_sup?=
	=?utf-8?q?port_for_OpenGL_and_libva=2C_add_option_for_Goom?=
Message-ID: <1406914359-31106-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The series is compiled-tested using

for Intel platform:
BR2_TOOLCHAIN_EXTERNAL=y
BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
BR2_PACKAGE_XBMC=y
BR2_PACKAGE_XBMC_LIBBLURAY=y
BR2_PACKAGE_XBMC_LIBCEC=y
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

for raspberry pi:
BR2_arm=y
BR2_arm1176jzf_s=y
BR2_DEFCONFIG="configs/raspberrypi_defconfig"
BR2_KERNEL_HEADERS_VERSION=y
BR2_DEFAULT_KERNEL_VERSION="3.12.20"
BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_12=y
BR2_TOOLCHAIN_BUILDROOT_LARGEFILE=y
BR2_TOOLCHAIN_BUILDROOT_INET_IPV6=y
BR2_TOOLCHAIN_BUILDROOT_INET_RPC=y
BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
BR2_TARGET_GENERIC_GETTY_PORT="tty1"
BR2_LINUX_KERNEL=y
BR2_LINUX_KERNEL_CUSTOM_GIT=y
BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://github.com/raspberrypi/linux.git"
BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="a25152fdfbfd3b4330da16fc3aeb6b1ef8843805"
BR2_LINUX_KERNEL_DEFCONFIG="bcmrpi_quick"
BR2_LINUX_KERNEL_ZIMAGE=y
BR2_PACKAGE_XBMC=y
BR2_PACKAGE_XBMC_AVAHI=y
BR2_PACKAGE_XBMC_DBUS=y
BR2_PACKAGE_XBMC_LIBBLURAY=y
BR2_PACKAGE_XBMC_LIBCEC=y
BR2_PACKAGE_XBMC_LIBMICROHTTPD=y
BR2_PACKAGE_XBMC_LIBNFS=y
BR2_PACKAGE_XBMC_RTMPDUMP=y
BR2_PACKAGE_XBMC_LIBSHAIRPLAY=y
BR2_PACKAGE_XBMC_LIBSMBCLIENT=y
BR2_PACKAGE_XBMC_LIBTHEORA=y
BR2_PACKAGE_XBMC_LIBUSB=y
BR2_PACKAGE_XBMC_WAVPACK=y
BR2_PACKAGE_XBMC_ADDON_XVDR=y
BR2_PACKAGE_XBMC_PVR_ADDONS=y
BR2_PACKAGE_RPI_FIRMWARE=y
BR2_PACKAGE_RPI_USERLAND=y

Regards, Bernd

v16: - rebased
     - removed "Add missing egl-related cflags"
       http://patchwork.ozlabs.org/patch/372801/ for now, as it should be xbmc?
       job to find the necessary pkgconf options (Thomas).
       This patch is also not really important as it is needed for mesa3d on
       raspberry pi, but this combination is not the main target, instead
       rpi-userland is designed to be the main OpenGL provider on rpi.
v15: - rebased
     - bump xbmc to 13.2b2
     - lots of patches removed after they were committed
v14: - rebased
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
     - fix libpng support in xbmc?s rsxs screensaver
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


Bernd Kuhls (3):
  xbmc: Add X.org/OpenGL support
  xbmc: Add option for Goom screensaver
  xbmc: Add VA-API support

 package/xbmc/Config.in |   40 +++++++++++++++++++++++++++++++++++++---
 package/xbmc/xbmc.mk   |   48 +++++++++++++++++++++++++++++++++++++++++-------
 2 files changed, 78 insertions(+), 10 deletions(-)

-- 
1.7.10.4
