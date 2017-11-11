From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 11 Nov 2017 23:20:42 +0100
Subject: [Buildroot] [git commit] package/ffmpeg: simplify
 BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS logic
Message-ID: <20171111221414.70892810F9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bd2544d3d3903935fc4dc0ec9c930720441e545f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Suggested by Arnout:
http://lists.busybox.net/pipermail/buildroot/2017-November/206631.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ffmpeg/Config.in | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/ffmpeg/Config.in b/package/ffmpeg/Config.in
index ed87ddd..17a4881 100644
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
