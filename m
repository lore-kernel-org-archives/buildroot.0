From: Romain Naour <romain.naour@gmail.com>
Date: Tue,  2 Feb 2021 21:56:14 +0100
Subject: [Buildroot] [PATCH 2/2] package/xenomai: disable cobalt for armv8
In-Reply-To: <20210202205614.59303-1-romain.naour@gmail.com>
References: <20210202205614.59303-1-romain.naour@gmail.com>
Message-ID: <20210202205614.59303-2-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When a armv8 target is used in 32bits mode, xenomai fail to
detect the ARM architecture and abord the build.
(__ARM_ARCH_7A__ is not defined for armv8 cpus).

There are no autobuilder failures for this issue since cobalt
is never selected, but the following defconfig:

BR2_arm=y
BR2_cortex_a53=y
BR2_ARM_FPU_NEON_VFPV4=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_PACKAGE_XENOMAI=y
BR2_PACKAGE_XENOMAI_COBALT=y

This was initialy reproduced using the raspberrypi3_defconfig
with Xenomai package with cobalt selected.

In order to use Xenomai on raspberrypi3 in 32 bits mode,
you have to select BR2_cortex_a7. This partially revert the
commit a13a388dd444ee047f0e7b8c10f5e6c235ec5004.

See:
https://gitlab.denx.de/Xenomai/xenomai/-/blob/v3.1/lib/cobalt/arch/arm/include/asm/xenomai/features.h#L52

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/xenomai/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/xenomai/Config.in b/package/xenomai/Config.in
index b1b02373c3..e060bcc46f 100644
--- a/package/xenomai/Config.in
+++ b/package/xenomai/Config.in
@@ -1,8 +1,8 @@
 config BR2_PACKAGE_XENOMAI_COBALT_ARCH_SUPPORTS
 	bool
 	default y
-	depends on BR2_i386 || BR2_x86_64 || (BR2_arm && !BR2_ARM_CPU_ARMV7M) || \
-		BR2_powerpc
+	depends on BR2_i386 || BR2_x86_64 || BR2_powerpc || \
+		(BR2_arm && !BR2_ARM_CPU_ARMV7M && !BR2_ARM_CPU_ARMV8A)
 
 comment "xenomai needs a glibc or uClibc toolchain w/ threads"
 	depends on BR2_USE_MMU
-- 
2.29.2
