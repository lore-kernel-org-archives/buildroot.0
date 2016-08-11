From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 11 Aug 2016 15:03:46 +0200
Subject: [Buildroot] [git commit] ffmpeg: disable for ARMv7-M
Message-ID: <20160811130351.C3ECC81871@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9fb11701599177c5303675193b34fe5423787dbd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In the ffmpeg code, libavutil/arm/asm.S makes some assumption about the
ARM architecture for which the code is built. Only ARMv4, ARMv5, ARMv6
and ARMv7-A is supported. Due to this, object files built out of
ARM-optimized assembly code have the wrong architecture information,
causing a failure at link time.

Adding ARMv7-M support would be possible, but it doesn't exist yet in
ffmpeg, and it's pretty unlikely that ffmpeg will ever be needed on an
ARMv7-M platform, so this commit takes the simple approach of disabling
ffmpeg for ARMv7-M.

Fixes:

  http://autobuild.buildroot.net/results/ca4c67b093afd6f14349fcdc87b02e0480172e8c/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ffmpeg/Config.in | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/ffmpeg/Config.in b/package/ffmpeg/Config.in
index 096ff95..3a7bfd3 100644
--- a/package/ffmpeg/Config.in
+++ b/package/ffmpeg/Config.in
@@ -2,7 +2,9 @@ config BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS
 	bool
 	# fenv.h lacks FE_INVALID, FE_OVERFLOW & FE_UNDERFLOW on nios2
 	# ffmpeg's configure script only supports mips64 (r1) variant
-	default y if !BR2_nios2 && !BR2_mips_64r2 && !BR2_mips_64r6
+	# No support for ARMv7-M in the ARM assembly logic
+	default y if !BR2_nios2 && !BR2_mips_64r2 && !BR2_mips_64r6 && \
+		!BR2_ARM_CPU_ARMV7M
 
 menuconfig BR2_PACKAGE_FFMPEG
 	bool "ffmpeg"
