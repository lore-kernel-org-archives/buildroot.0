From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 7 Apr 2020 17:28:47 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] package/mesa3d: disable
 v3d support for arm if neon is not supported
Message-ID: <20200407151933.5EA53882C2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6cba3cdfa14b649798bfa8efa79a1c4fc981e168
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

The v3d driver for arm uses neon instructions unconditionally, so
depend on BR2_ARM_CPU_HAS_NEON.

Fixes:

  http://autobuild.buildroot.net/results/66c4df4ee84b73160dde5fe4437b5abdbd2b50d2

  [1050/1079] Compiling C object 'src/gallium/drivers/v3d/99241e4@@v3d_neon at sta/v3d_tiling.c.o'.
  {standard input}: Assembler messages:
  {standard input}:417: Error: selected processor does not support `vldm r6,{q0,q1,q2,q3}' in ARM mode
  {standard input}:418: Error: selected processor does not support `vst1.8 d0,[r4],r5' in ARM mode
  {standard input}:419: Error: selected processor does not support `vst1.8 d1,[r4],r5' in ARM mode
  {standard input}:420: Error: selected processor does not support `vst1.8 d2,[r4],r5' in ARM mode
  {standard input}:421: Error: selected processor does not support `vst1.8 d3,[r4],r5' in ARM mode
  {standard input}:422: Error: selected processor does not support `vst1.8 d4,[r4],r5' in ARM mode
  {standard input}:423: Error: selected processor does not support `vst1.8 d5,[r4],r5' in ARM mode
  {standard input}:424: Error: selected processor does not support `vst1.8 d6,[r4],r5' in ARM mode

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit ff00c284c56e954592a6246d48cd5edadbd34043)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mesa3d/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index 13e516e452..16d77f42c2 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -256,7 +256,7 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_TEGRA
 
 config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_V3D
 	bool "Gallium v3d driver"
-	depends on BR2_arm || BR2_aarch64
+	depends on (BR2_arm && BR2_ARM_CPU_HAS_NEON) || BR2_aarch64
 	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
 	select BR2_PACKAGE_MESA3D_GALLIUM_KMSRO
 	select BR2_PACKAGE_LIBDRM_VC4
