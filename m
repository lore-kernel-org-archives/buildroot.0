From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 11 Dec 2016 18:23:21 +0100
Subject: [Buildroot] [git commit] jpeg-turbo: add simd support for aarch64
Message-ID: <20161211172617.5F816817EA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=643a21b326ed9b562560d8629501725ea53f86d8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

From the 1.5-b1 release notes:

Added ARM 64-bit (ARMv8) NEON SIMD implementations of the commonly-used
compression algorithms (including the slow integer forward DCT and h2v2 &
h2v1 downsampling algorithms, which are not accelerated in the 32-bit NEON
implementation.) This speeds up the compression of full-color JPEGs by about
75% on average on a Cavium ThunderX processor and by about 2-2.5x on average
on Cortex-A53 and Cortex-A57 cores.

Add it unconditionally for all aarch64 cores, as neon support is required
for all "standard" ARMv8 implementations.  If an ARMv8 implementation w/o
NEON ever shows up, then we will need to add a BR2_AARCH64_CPU_HAS_NEON and
handle it like ARM.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/jpeg/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/jpeg/Config.in b/package/jpeg/Config.in
index e2a3fd0..2bcf405 100644
--- a/package/jpeg/Config.in
+++ b/package/jpeg/Config.in
@@ -8,6 +8,7 @@ config BR2_PACKAGE_JPEG_SIMD_SUPPORT
        bool
        default y if BR2_X86_CPU_HAS_MMX || BR2_ARM_CPU_HAS_NEON || \
 		 BR2_POWERPC_CPU_HAS_ALTIVEC
+		 BR2_aarch64 || BR2_aarch64_be
 
 if BR2_PACKAGE_JPEG
 
