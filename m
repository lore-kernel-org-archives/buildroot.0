From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue,  7 Nov 2017 22:11:49 +0100
Subject: [Buildroot] [PATCH v2 1/1] package/ffmpeg: fix fenv build failure
 on ARCv2 with glibc
Message-ID: <20171107211149.17617-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://git.buildroot.net/buildroot/commit/toolchain?id=0633eb58a2912328508a76f8fe9875a0d113a880
added glibc support for ARCv2 which lacks fenv.h.

Fixes
http://autobuild.buildroot.net/results/aec/aec300d7d4472421398a24202d6871c965bd1be5/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v2: Restricted dependency to BR2_archs38 && BR2_TOOLCHAIN_USES_GLIBC
    (Thomas)

 package/ffmpeg/Config.in | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/ffmpeg/Config.in b/package/ffmpeg/Config.in
index ed87ddd492..9890a22deb 100644
--- a/package/ffmpeg/Config.in
+++ b/package/ffmpeg/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS
 	bool
-	# fenv.h lacks FE_INVALID, FE_OVERFLOW & FE_UNDERFLOW on nios2
+	# fenv.h lacks FE_INVALID, FE_OVERFLOW & FE_UNDERFLOW on archs38
+	# in combination with glibc and nios2
 	# No support for ARMv7-M in the ARM assembly logic
 	# Microblaze build affected by gcc PR71124 (infinite loop)
 	# m68k coldfire causes a build failure, because the check for
@@ -9,7 +10,9 @@ config BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS
 	# not. See https://patchwork.ozlabs.org/patch/756664/ and
 	# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=68467 for more
 	# details.
-	default y if !BR2_nios2 && !BR2_ARM_CPU_ARMV7M && !BR2_microblaze && !BR2_m68k_cf
+	default y if !(BR2_archs38 && BR2_TOOLCHAIN_USES_GLIBC) && \
+		!BR2_nios2 && !BR2_ARM_CPU_ARMV7M && \
+		!BR2_microblaze && !BR2_m68k_cf
 
 menuconfig BR2_PACKAGE_FFMPEG
 	bool "ffmpeg"
-- 
2.11.0
