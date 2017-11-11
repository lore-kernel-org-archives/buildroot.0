From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 11 Nov 2017 17:22:41 +0100
Subject: [Buildroot] [PATCH 1/2] package/ffmpeg: simplify
 BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS logic
Message-ID: <20171111162242.15110-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Suggested by Arnout:
http://lists.busybox.net/pipermail/buildroot/2017-November/206631.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/ffmpeg/Config.in | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/ffmpeg/Config.in b/package/ffmpeg/Config.in
index ed87ddd492..17a4881348 100644
--- a/package/ffmpeg/Config.in
+++ b/package/ffmpeg/Config.in
@@ -1,15 +1,19 @@
 config BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS
 	bool
+	default y
 	# fenv.h lacks FE_INVALID, FE_OVERFLOW & FE_UNDERFLOW on nios2
+	depends on !BR2_nios
 	# No support for ARMv7-M in the ARM assembly logic
+	depends on !BR2_ARM_CPU_ARMV7M
 	# Microblaze build affected by gcc PR71124 (infinite loop)
+	depends on !BR2_microblaze
 	# m68k coldfire causes a build failure, because the check for
 	# atomics (atomic_store) succeeds, which causes ffmpeg to
 	# think atomic intrinsics are available, while they are
 	# not. See https://patchwork.ozlabs.org/patch/756664/ and
 	# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=68467 for more
 	# details.
-	default y if !BR2_nios2 && !BR2_ARM_CPU_ARMV7M && !BR2_microblaze && !BR2_m68k_cf
+	depends on !BR2_m68k_cf
 
 menuconfig BR2_PACKAGE_FFMPEG
 	bool "ffmpeg"
-- 
2.11.0
