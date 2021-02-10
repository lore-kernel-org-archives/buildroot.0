From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 10 Feb 2021 11:25:37 +0100
Subject: [Buildroot] [git commit branch/2020.11.x] package/xenomai: disable
 cobalt for armv8
Message-ID: <20210210183739.64AD880F69@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b74c28ab89a02bfbe710db6f9b31d466858aa1e8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.11.x

When a armv8 target is used in 32bits mode, xenomai fail to detect the
ARM architecture and abord the build. (__ARM_ARCH_7A__ is not defined
for armv8 cpus).

There are no autobuilder failures for this issue since cobalt is never
selected, but the following defconfig:

BR2_arm=y
BR2_cortex_a53=y
BR2_ARM_FPU_NEON_VFPV4=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_PACKAGE_XENOMAI=y
BR2_PACKAGE_XENOMAI_COBALT=y

This was initialy reproduced using the raspberrypi3_defconfig with
Xenomai package with cobalt selected.

In order to use Xenomai on raspberrypi3 in 32 bits mode, one has to
select BR2_cortex_a7 instead of BR2_cortex_a53 (see a13a388dd444).

See:
https://gitlab.denx.de/Xenomai/xenomai/-/blob/v3.1/lib/cobalt/arch/arm/include/asm/xenomai/features.h#L52

Signed-off-by: Romain Naour <romain.naour@gmail.com>
[yann.morin.1998 at free.fr:
  - switch to independent conditional 'default y'
  - slightly reword the commit log
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 6490a11018e71d8200f74af581c0a65b1612085a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/xenomai/Config.in | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/xenomai/Config.in b/package/xenomai/Config.in
index e39a550416..ec6d9e5d29 100644
--- a/package/xenomai/Config.in
+++ b/package/xenomai/Config.in
@@ -1,8 +1,9 @@
 config BR2_PACKAGE_XENOMAI_COBALT_ARCH_SUPPORTS
 	bool
-	default y
-	depends on BR2_i386 || BR2_x86_64 || (BR2_arm && !BR2_ARM_CPU_ARMV7M) || \
-		BR2_powerpc
+	default y if BR2_i386
+	default y if BR2_x86_64
+	default y if BR2_powerpc
+	default y if BR2_arm && !BR2_ARM_CPU_ARMV7M && !BR2_ARM_CPU_ARMV8A
 
 comment "xenomai needs a glibc or uClibc toolchain w/ threads"
 	depends on BR2_USE_MMU
