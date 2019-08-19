From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 19 Aug 2019 14:46:00 +0200
Subject: [Buildroot] [PATCH] package/mesa3d: allow VC4 driver on all ARM
 platforms
Message-ID: <20190819124601.21549-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In commit 3e5926555b59b50210bb7814d176b384f9d554ab ("package/{mesa3d,
mesa3d-headers}: bump version to 17.1.2"), the dependency of VC4 on
BR2_arm was changed to BR2_ARM_CPU_HAS_NEON, which the reasoning that
upstream commit
https://cgit.freedesktop.org/mesa/mesa/commit/?h=17.1&id=4d30024238efa829cabc72c1601beeee18c3dbf2
made NEON mandatory. However, this commit (including its commit log)
clearly shows that there is compile-time detection on whether you're
using ARMv6 or ARMv7, and simply says there is no runtime detection
for that (which usually isn't very important in the context of
Buildroot). So, the VC4 driver can be used on ARMv6
RaspberryPis. Therefore, this commit reverts to the BR2_arm
dependency.

Note: while there are some ARMv7 without NEONs, all ARMv7 RaspberryPi
platforms do have NEON, so the compile-time checks done in the VC4
driver are good enough.

Fixes:

  https://bugs.busybox.net/show_bug.cgi?id=12126

Cc: Sahaj Sarup <sahajsarup@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mesa3d/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index 3f44e94229..70067058e6 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -180,7 +180,7 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SWRAST
 
 config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VC4
 	bool "Gallium vc4 driver"
-	depends on BR2_ARM_CPU_HAS_NEON || BR2_aarch64
+	depends on BR2_arm || BR2_aarch64
 	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
 	select BR2_PACKAGE_MESA3D_GALLIUM_KMSRO
 	select BR2_PACKAGE_LIBDRM_VC4
-- 
2.21.0
