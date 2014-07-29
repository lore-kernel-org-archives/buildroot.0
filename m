From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 29 Jul 2014 23:34:14 +0200
Subject: [Buildroot] [PATCH 0/2] xdriver_xf86-video-intel: Bump version to
	2.99.914, add DRI3 support
Message-ID: <1406669656-15300-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

this small series bumps xdriver_xf86-video-intel to the latest version.
While being at it, add DRI3 support to X.org server so the intel driver
can pick it up. The patch for xdriver_xf86-video-intel should be one
commit, although addressing various topics, because it would otherwise
fail at configure stage because of newly introduced DRI checks.

This patch merges and supersedes

my original 2.99.911 bump
http://patchwork.ozlabs.org/patch/370975/

the 2.99.912 bump by Ben Widawsky
http://patchwork.ozlabs.org/patch/371343/

SNA does not depend on xlib_libXcomposite, this patch by Ben is not needed
http://patchwork.ozlabs.org/patch/371342/

sna/dri2: Protect compsiteext.h include with build check by Ben
http://patchwork.ozlabs.org/patch/373074/
was applied upstream and released with 2.99.913
http://cgit.freedesktop.org/xorg/driver/xf86-video-intel/commit/?id=fac6845820e49dbbea2a625b7bb745d8f9159b56

This series was compile-tested using these defconfigs:

- without any DRI support:
BR2_TOOLCHAIN_EXTERNAL=y
BR2_PACKAGE_XORG7=y
BR2_PACKAGE_XSERVER_XORG_SERVER=y
BR2_PACKAGE_XSERVER_XORG_SERVER_MODULAR=y
BR2_PACKAGE_XDRIVER_XF86_VIDEO_INTEL=y

- DRI1 & DRI2 support:
BR2_TOOLCHAIN_EXTERNAL=y
BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
BR2_PACKAGE_MESA3D=y
BR2_PACKAGE_MESA3D_DRI_DRIVER_I965=y
BR2_PACKAGE_XORG7=y
BR2_PACKAGE_XSERVER_XORG_SERVER=y
BR2_PACKAGE_XSERVER_XORG_SERVER_MODULAR=y
BR2_PACKAGE_XDRIVER_XF86_VIDEO_INTEL=y

- DRI1/2/3 support (added this line to the DRI1/2 defconfig):
BR2_PACKAGE_XPROTO_DRI3PROTO=y

Configure summary for the DRI1/2/3 case:

xf86-video-intel 2.99.914 will be compiled with:
  Xorg Video ABI version: 18.0
  Acceleration backends: *sna uxa
  Additional debugging support? none
  Support for Kernel Mode Setting? yes
  Support for legacy User Mode Setting (for i810)? yes
  Support for Direct Rendering Infrastructure: DRI1 DRI2 DRI3 Present

Regards, Bernd

Bernd Kuhls (2):
  xserver_xorg-server: Add support for DRI3
  xdriver_xf86-video-intel: Bump version to 2.99.914

 package/x11r7/xdriver_xf86-video-intel/Config.in   |    8 +----
 .../xdriver_xf86-video-intel.mk                    |   33 +++++++++++++++-----
 .../xserver_xorg-server/xserver_xorg-server.mk     |    6 +++-
 3 files changed, 32 insertions(+), 15 deletions(-)

-- 
1.7.10.4
