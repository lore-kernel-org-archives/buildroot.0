From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 30 Aug 2015 14:16:30 +0200
Subject: [Buildroot] [PATCH 1/1] package/x11r7/xserver_xorg-server: dri
	needs arm >= v6
Message-ID: <1440936990-26531-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes

  CC       dri.lo
/tmp/ccc6IbbW.s: Assembler messages:
/tmp/ccc6IbbW.s:3114: Error: selected processor does not support ARM mode `ldrex r2,[r1]'
/tmp/ccc6IbbW.s:3117: Error: selected processor does not support ARM mode `strexeq r2,r0,[r1]'
/tmp/ccc6IbbW.s:3273: Error: selected processor does not support ARM mode `ldrex r2,[r1]'
/tmp/ccc6IbbW.s:3276: Error: selected processor does not support ARM mode `strexeq r2,r3,[r1]'
/tmp/ccc6IbbW.s:3352: Error: selected processor does not support ARM mode `ldrex r1,[r2]'
/tmp/ccc6IbbW.s:3355: Error: selected processor does not support ARM mode `strexeq r1,r0,[r2]'
/tmp/ccc6IbbW.s:3451: Error: selected processor does not support ARM mode `ldrex r3,[r2]'
/tmp/ccc6IbbW.s:3454: Error: selected processor does not support ARM mode `strexeq r3,ip,[r2]'
/tmp/ccc6IbbW.s:3522: Error: selected processor does not support ARM mode `ldrex r3,[r0]'
/tmp/ccc6IbbW.s:3525: Error: selected processor does not support ARM mode `strexeq r3,r1,[r0]'
Makefile:653: recipe for target 'dri.lo' failed
make[5]: *** [dri.lo] Error 1
make[5]: Leaving directory '/home/buildroot/buildroot/output/build/xserver_xorg-server-1.17.2/hw/xfree86/dri'

using this defconfig
BR2_arm=y
BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
BR2_PACKAGE_MESA3D=y
BR2_PACKAGE_MESA3D_DRI_DRIVER_SWRAST=y
BR2_PACKAGE_XORG7=y
BR2_PACKAGE_XSERVER_XORG_SERVER=y

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xserver_xorg-server/xserver_xorg-server.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
index 617bcbc..2442f83 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
@@ -130,7 +130,7 @@ else # modular
 XSERVER_XORG_SERVER_CONF_OPTS += --disable-kdrive --disable-xfbdev
 endif
 
-ifeq ($(BR2_PACKAGE_MESA3D_DRI_DRIVER),y)
+ifeq ($(BR2_PACKAGE_MESA3D_DRI_DRIVER)$(BR2_ARM_CPU_ARMV4)$(BR2_ARM_CPU_ARMV5),y)
 XSERVER_XORG_SERVER_CONF_OPTS += --enable-dri --enable-glx
 XSERVER_XORG_SERVER_DEPENDENCIES += mesa3d xproto_xf86driproto
 else
-- 
2.1.4
