From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 21 Jan 2021 22:36:12 +0100
Subject: [Buildroot] [git commit] configs/qemu_*: bump kernel version to
 5.10.7
Message-ID: <20210121211654.E94AE8110C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=742f37de8d0e3797698411dfc6a63bd7e98aafe2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump most QEMU defconfigs (every one that was previously on 5.4.y)
to latest longterm kernel 5.10.7.

Please note the following exceptions/modifications:
- board/qemu/qemu_s390x_defconfig: ignored (already up to date)
- board/qemu/sh4*-r2d:
    - Remove the remaining kernel patch [1] provided by Alan Modra
      fixing rodata alignment, carried here by Romain Naour [2] to
      fix an issue preventing kernel from booting with binutils 2.23.
      Patch is present in upstream Linux now.
    - Fix compile-time error regarding 64-bit time data structures
      from kernel headers when building with uclibc. Previous fix [3]
      existed upstream; but see details below.
    - board/qemu/ppc-mpc8544ds: Updated kernel patch
- board/qemu/arm-versatile: Updated kernel patch
- board/qemu/mips*r6*: Updated kernel patch

Tested on all configs/qemu* configurations. [4]

[1] https://www.sourceware.org/ml/binutils/2019-12/msg00112.html
[2] https://git.busybox.net/buildroot/commit/?id=a2331c8a61bdd71c47492efc818fb0458a349219
[3] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=fc94cf2092c7c1267fa2deb8388d624f50eba808
[4] https://gitlab.com/clumsyape/buildroot/-/pipelines/244024195

Signed-off-by: Geoffrey Le Gourri??rec <geoffrey.legourrierec@gmail.com>
Reviewed-by: Joel Stanley <joel@jms.id.au>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../patches/linux/versatile-nommu.patch            | 22 +++----
 ...-include-hi-and-lo-in-clobber-list-for-R6.patch | 16 ++---
 ...-include-hi-and-lo-in-clobber-list-for-R6.patch | 16 ++---
 ...-include-hi-and-lo-in-clobber-list-for-R6.patch | 16 ++---
 ...-include-hi-and-lo-in-clobber-list-for-R6.patch | 16 ++---
 ...pc-Fix-mcpu-options-for-SPE-only-compiler.patch | 10 +--
 ...types.h-and-not-time_types.h-in-sockios.h.patch | 76 ++++++++++++++++++++++
 .../patches/linux/0001-arch-sh-vmlinux.scr.patch   | 32 ---------
 ...types.h-and-not-time_types.h-in-sockios.h.patch | 76 ++++++++++++++++++++++
 .../patches/linux/0001-arch-sh-vmlinux.scr.patch   | 32 ---------
 configs/qemu_aarch64_virt_defconfig                |  6 +-
 configs/qemu_arm_versatile_defconfig               |  6 +-
 configs/qemu_arm_versatile_nommu_defconfig         |  6 +-
 configs/qemu_arm_vexpress_defconfig                |  6 +-
 configs/qemu_arm_vexpress_tz_defconfig             |  6 +-
 configs/qemu_m68k_mcf5208_defconfig                |  6 +-
 configs/qemu_m68k_q800_defconfig                   |  6 +-
 configs/qemu_microblazebe_mmu_defconfig            |  6 +-
 configs/qemu_microblazeel_mmu_defconfig            |  6 +-
 configs/qemu_mips32r2_malta_defconfig              |  6 +-
 configs/qemu_mips32r2el_malta_defconfig            |  6 +-
 configs/qemu_mips32r6_malta_defconfig              |  6 +-
 configs/qemu_mips32r6el_malta_defconfig            |  6 +-
 configs/qemu_mips64_malta_defconfig                |  6 +-
 configs/qemu_mips64el_malta_defconfig              |  6 +-
 configs/qemu_mips64r6_malta_defconfig              |  6 +-
 configs/qemu_mips64r6el_malta_defconfig            |  6 +-
 configs/qemu_nios2_10m50_defconfig                 |  6 +-
 configs/qemu_or1k_defconfig                        |  6 +-
 configs/qemu_ppc64_e5500_defconfig                 |  4 +-
 configs/qemu_ppc64_pseries_defconfig               |  6 +-
 configs/qemu_ppc64le_pseries_defconfig             |  6 +-
 configs/qemu_ppc_g3beige_defconfig                 |  6 +-
 configs/qemu_ppc_mac99_defconfig                   |  6 +-
 configs/qemu_ppc_mpc8544ds_defconfig               |  6 +-
 configs/qemu_riscv32_virt_defconfig                |  6 +-
 configs/qemu_riscv64_virt_defconfig                |  6 +-
 configs/qemu_sh4_r2d_defconfig                     |  6 +-
 configs/qemu_sh4eb_r2d_defconfig                   |  6 +-
 configs/qemu_sparc64_sun4u_defconfig               |  6 +-
 configs/qemu_sparc_ss10_defconfig                  |  6 +-
 configs/qemu_x86_64_defconfig                      |  6 +-
 configs/qemu_x86_defconfig                         |  6 +-
 configs/qemu_xtensa_lx60_defconfig                 |  6 +-
 configs/qemu_xtensa_lx60_nommu_defconfig           |  6 +-
 45 files changed, 304 insertions(+), 216 deletions(-)

diff --git a/board/qemu/arm-versatile/patches/linux/versatile-nommu.patch b/board/qemu/arm-versatile/patches/linux/versatile-nommu.patch
index a2c0962f85..956ae5f5f5 100644
--- a/board/qemu/arm-versatile/patches/linux/versatile-nommu.patch
+++ b/board/qemu/arm-versatile/patches/linux/versatile-nommu.patch
@@ -1,4 +1,4 @@
-From 4ac4324dcdaf237aa34545b3795acb2e5c42d10e Mon Sep 17 00:00:00 2001
+From 525dd2f3cf4a94837ce6b71d793acb90c25a5654 Mon Sep 17 00:00:00 2001
 From: Waldemar Brodkorb <wbx@openadk.org>
 Date: Fri, 1 Feb 2019 11:36:20 +0100
 Subject: [PATCH] arm-versatile-nommu: Linux patch
@@ -21,10 +21,10 @@ Signed-off-by: Romain Naour <romain.naour@smile.fr>
  create mode 100644 arch/arm/mach-versatile/Makefile.boot
 
 diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
-index e8cd55a5b04c..fc2dbff70394 100644
+index 002e0cf025f5..c71299b6f91f 100644
 --- a/arch/arm/Kconfig
 +++ b/arch/arm/Kconfig
-@@ -353,6 +353,17 @@ config ARM_SINGLE_ARMV7M
+@@ -343,6 +343,17 @@ config ARM_SINGLE_ARMV7M
  	select SPARSE_IRQ
  	select USE_OF
  
@@ -43,10 +43,10 @@ index e8cd55a5b04c..fc2dbff70394 100644
  	bool "EBSA-110"
  	select ARCH_USES_GETTIMEOFFSET
 diff --git a/arch/arm/Kconfig.debug b/arch/arm/Kconfig.debug
-index f6fcb8a79889..92fc637d3db8 100644
+index 8986a91a6f31..69cb6404e8ce 100644
 --- a/arch/arm/Kconfig.debug
 +++ b/arch/arm/Kconfig.debug
-@@ -1843,7 +1843,8 @@ config DEBUG_UNCOMPRESS
+@@ -1943,7 +1943,8 @@ config DEBUG_UNCOMPRESS
  config UNCOMPRESS_INCLUDE
  	string
  	default "debug/uncompress.h" if ARCH_MULTIPLATFORM || ARCH_MSM || \
@@ -57,10 +57,10 @@ index f6fcb8a79889..92fc637d3db8 100644
  
  config EARLY_PRINTK
 diff --git a/arch/arm/include/asm/mach/map.h b/arch/arm/include/asm/mach/map.h
-index 9b7c328fb207..b1fe9c8b5c3e 100644
+index 92282558caf7..90bd9c069ffc 100644
 --- a/arch/arm/include/asm/mach/map.h
 +++ b/arch/arm/include/asm/mach/map.h
-@@ -62,6 +62,7 @@ extern int ioremap_page(unsigned long virt, unsigned long phys,
+@@ -59,6 +59,7 @@ extern int ioremap_page(unsigned long virt, unsigned long phys,
  #else
  #define iotable_init(map,num)	do { } while (0)
  #define vm_reserve_area_early(a,s,c)	do { } while (0)
@@ -69,7 +69,7 @@ index 9b7c328fb207..b1fe9c8b5c3e 100644
  
  #endif
 diff --git a/arch/arm/mach-versatile/Kconfig b/arch/arm/mach-versatile/Kconfig
-index f5c275434d6c..06ad999d5978 100644
+index d88e7725bf99..d38b90157f13 100644
 --- a/arch/arm/mach-versatile/Kconfig
 +++ b/arch/arm/mach-versatile/Kconfig
 @@ -1,7 +1,8 @@
@@ -93,10 +93,10 @@ index 000000000000..eacfc3f5c33e
 +# Patch waits for application at
 +# http://www.arm.linux.org.uk/developer/patches/viewpatch.php?id=7889/1 .
 diff --git a/arch/arm/mach-versatile/versatile_dt.c b/arch/arm/mach-versatile/versatile_dt.c
-index 3c8d39c12909..8cfa05a37295 100644
+index 02ba68abe533..835b51bc597b 100644
 --- a/arch/arm/mach-versatile/versatile_dt.c
 +++ b/arch/arm/mach-versatile/versatile_dt.c
-@@ -37,7 +37,11 @@
+@@ -22,7 +22,11 @@
  #include <asm/mach/map.h>
  
  /* macro to get at MMIO space when running virtually */
@@ -109,5 +109,5 @@ index 3c8d39c12909..8cfa05a37295 100644
  
  /*
 -- 
-2.14.5
+2.17.1
 
diff --git a/board/qemu/mips32r6-malta/patches/linux/0001-mips-Do-not-include-hi-and-lo-in-clobber-list-for-R6.patch b/board/qemu/mips32r6-malta/patches/linux/0001-mips-Do-not-include-hi-and-lo-in-clobber-list-for-R6.patch
index 801efb5d08..01d78f6ffe 100644
--- a/board/qemu/mips32r6-malta/patches/linux/0001-mips-Do-not-include-hi-and-lo-in-clobber-list-for-R6.patch
+++ b/board/qemu/mips32r6-malta/patches/linux/0001-mips-Do-not-include-hi-and-lo-in-clobber-list-for-R6.patch
@@ -1,4 +1,4 @@
-From bb04c220d82598066eeadf49defaec1157d4d206 Mon Sep 17 00:00:00 2001
+From b9af6f34e43bf5264d75933f2080f16b8741048d Mon Sep 17 00:00:00 2001
 From: Romain Naour <romain.naour@gmail.com>
 Date: Sat, 25 Jul 2020 11:46:01 +0200
 Subject: [PATCH] mips: Do not include hi and lo in clobber list for R6
@@ -31,10 +31,10 @@ Signed-off-by: Romain Naour <romain.naour@gmail.com>
  1 file changed, 45 insertions(+)
 
 diff --git a/arch/mips/include/asm/vdso/gettimeofday.h b/arch/mips/include/asm/vdso/gettimeofday.h
-index 0ae9b4cbc153..ea600e0ebfe7 100644
+index 2203e2d0ae2a..e28096faecf6 100644
 --- a/arch/mips/include/asm/vdso/gettimeofday.h
 +++ b/arch/mips/include/asm/vdso/gettimeofday.h
-@@ -36,12 +36,21 @@ static __always_inline long gettimeofday_fallback(
+@@ -30,12 +30,21 @@ static __always_inline long gettimeofday_fallback(
  	register long nr asm("v0") = __NR_gettimeofday;
  	register long error asm("a3");
  
@@ -56,7 +56,7 @@ index 0ae9b4cbc153..ea600e0ebfe7 100644
  
  	return error ? -ret : ret;
  }
-@@ -60,12 +69,21 @@ static __always_inline long clock_gettime_fallback(
+@@ -54,12 +63,21 @@ static __always_inline long clock_gettime_fallback(
  #endif
  	register long error asm("a3");
  
@@ -78,7 +78,7 @@ index 0ae9b4cbc153..ea600e0ebfe7 100644
  
  	return error ? -ret : ret;
  }
-@@ -84,12 +102,21 @@ static __always_inline int clock_getres_fallback(
+@@ -78,12 +96,21 @@ static __always_inline int clock_getres_fallback(
  #endif
  	register long error asm("a3");
  
@@ -100,7 +100,7 @@ index 0ae9b4cbc153..ea600e0ebfe7 100644
  
  	return error ? -ret : ret;
  }
-@@ -108,12 +135,21 @@ static __always_inline long clock_gettime32_fallback(
+@@ -100,12 +127,21 @@ static __always_inline long clock_gettime32_fallback(
  	register long nr asm("v0") = __NR_clock_gettime;
  	register long error asm("a3");
  
@@ -122,7 +122,7 @@ index 0ae9b4cbc153..ea600e0ebfe7 100644
  
  	return error ? -ret : ret;
  }
-@@ -128,12 +164,21 @@ static __always_inline int clock_getres32_fallback(
+@@ -120,12 +156,21 @@ static __always_inline int clock_getres32_fallback(
  	register long nr asm("v0") = __NR_clock_getres;
  	register long error asm("a3");
  
@@ -145,5 +145,5 @@ index 0ae9b4cbc153..ea600e0ebfe7 100644
  	return error ? -ret : ret;
  }
 -- 
-2.25.4
+2.17.1
 
diff --git a/board/qemu/mips32r6el-malta/patches/linux/0001-mips-Do-not-include-hi-and-lo-in-clobber-list-for-R6.patch b/board/qemu/mips32r6el-malta/patches/linux/0001-mips-Do-not-include-hi-and-lo-in-clobber-list-for-R6.patch
index 801efb5d08..01d78f6ffe 100644
--- a/board/qemu/mips32r6el-malta/patches/linux/0001-mips-Do-not-include-hi-and-lo-in-clobber-list-for-R6.patch
+++ b/board/qemu/mips32r6el-malta/patches/linux/0001-mips-Do-not-include-hi-and-lo-in-clobber-list-for-R6.patch
@@ -1,4 +1,4 @@
-From bb04c220d82598066eeadf49defaec1157d4d206 Mon Sep 17 00:00:00 2001
+From b9af6f34e43bf5264d75933f2080f16b8741048d Mon Sep 17 00:00:00 2001
 From: Romain Naour <romain.naour@gmail.com>
 Date: Sat, 25 Jul 2020 11:46:01 +0200
 Subject: [PATCH] mips: Do not include hi and lo in clobber list for R6
@@ -31,10 +31,10 @@ Signed-off-by: Romain Naour <romain.naour@gmail.com>
  1 file changed, 45 insertions(+)
 
 diff --git a/arch/mips/include/asm/vdso/gettimeofday.h b/arch/mips/include/asm/vdso/gettimeofday.h
-index 0ae9b4cbc153..ea600e0ebfe7 100644
+index 2203e2d0ae2a..e28096faecf6 100644
 --- a/arch/mips/include/asm/vdso/gettimeofday.h
 +++ b/arch/mips/include/asm/vdso/gettimeofday.h
-@@ -36,12 +36,21 @@ static __always_inline long gettimeofday_fallback(
+@@ -30,12 +30,21 @@ static __always_inline long gettimeofday_fallback(
  	register long nr asm("v0") = __NR_gettimeofday;
  	register long error asm("a3");
  
@@ -56,7 +56,7 @@ index 0ae9b4cbc153..ea600e0ebfe7 100644
  
  	return error ? -ret : ret;
  }
-@@ -60,12 +69,21 @@ static __always_inline long clock_gettime_fallback(
+@@ -54,12 +63,21 @@ static __always_inline long clock_gettime_fallback(
  #endif
  	register long error asm("a3");
  
@@ -78,7 +78,7 @@ index 0ae9b4cbc153..ea600e0ebfe7 100644
  
  	return error ? -ret : ret;
  }
-@@ -84,12 +102,21 @@ static __always_inline int clock_getres_fallback(
+@@ -78,12 +96,21 @@ static __always_inline int clock_getres_fallback(
  #endif
  	register long error asm("a3");
  
@@ -100,7 +100,7 @@ index 0ae9b4cbc153..ea600e0ebfe7 100644
  
  	return error ? -ret : ret;
  }
-@@ -108,12 +135,21 @@ static __always_inline long clock_gettime32_fallback(
+@@ -100,12 +127,21 @@ static __always_inline long clock_gettime32_fallback(
  	register long nr asm("v0") = __NR_clock_gettime;
  	register long error asm("a3");
  
@@ -122,7 +122,7 @@ index 0ae9b4cbc153..ea600e0ebfe7 100644
  
  	return error ? -ret : ret;
  }
-@@ -128,12 +164,21 @@ static __always_inline int clock_getres32_fallback(
+@@ -120,12 +156,21 @@ static __always_inline int clock_getres32_fallback(
  	register long nr asm("v0") = __NR_clock_getres;
  	register long error asm("a3");
  
@@ -145,5 +145,5 @@ index 0ae9b4cbc153..ea600e0ebfe7 100644
  	return error ? -ret : ret;
  }
 -- 
-2.25.4
+2.17.1
 
diff --git a/board/qemu/mips64r6-malta/patches/linux/0001-mips-Do-not-include-hi-and-lo-in-clobber-list-for-R6.patch b/board/qemu/mips64r6-malta/patches/linux/0001-mips-Do-not-include-hi-and-lo-in-clobber-list-for-R6.patch
index ad2647e627..01d78f6ffe 100644
--- a/board/qemu/mips64r6-malta/patches/linux/0001-mips-Do-not-include-hi-and-lo-in-clobber-list-for-R6.patch
+++ b/board/qemu/mips64r6-malta/patches/linux/0001-mips-Do-not-include-hi-and-lo-in-clobber-list-for-R6.patch
@@ -1,4 +1,4 @@
-From cfb381d8f4b64f3752c95b4bdd787be63ef84fb2 Mon Sep 17 00:00:00 2001
+From b9af6f34e43bf5264d75933f2080f16b8741048d Mon Sep 17 00:00:00 2001
 From: Romain Naour <romain.naour@gmail.com>
 Date: Sat, 25 Jul 2020 11:46:01 +0200
 Subject: [PATCH] mips: Do not include hi and lo in clobber list for R6
@@ -31,10 +31,10 @@ Signed-off-by: Romain Naour <romain.naour@gmail.com>
  1 file changed, 45 insertions(+)
 
 diff --git a/arch/mips/include/asm/vdso/gettimeofday.h b/arch/mips/include/asm/vdso/gettimeofday.h
-index 0ae9b4cbc153..ea600e0ebfe7 100644
+index 2203e2d0ae2a..e28096faecf6 100644
 --- a/arch/mips/include/asm/vdso/gettimeofday.h
 +++ b/arch/mips/include/asm/vdso/gettimeofday.h
-@@ -36,12 +36,21 @@ static __always_inline long gettimeofday_fallback(
+@@ -30,12 +30,21 @@ static __always_inline long gettimeofday_fallback(
  	register long nr asm("v0") = __NR_gettimeofday;
  	register long error asm("a3");
  
@@ -56,7 +56,7 @@ index 0ae9b4cbc153..ea600e0ebfe7 100644
  
  	return error ? -ret : ret;
  }
-@@ -60,12 +69,21 @@ static __always_inline long clock_gettime_fallback(
+@@ -54,12 +63,21 @@ static __always_inline long clock_gettime_fallback(
  #endif
  	register long error asm("a3");
  
@@ -78,7 +78,7 @@ index 0ae9b4cbc153..ea600e0ebfe7 100644
  
  	return error ? -ret : ret;
  }
-@@ -84,12 +102,21 @@ static __always_inline int clock_getres_fallback(
+@@ -78,12 +96,21 @@ static __always_inline int clock_getres_fallback(
  #endif
  	register long error asm("a3");
  
@@ -100,7 +100,7 @@ index 0ae9b4cbc153..ea600e0ebfe7 100644
  
  	return error ? -ret : ret;
  }
-@@ -108,12 +135,21 @@ static __always_inline long clock_gettime32_fallback(
+@@ -100,12 +127,21 @@ static __always_inline long clock_gettime32_fallback(
  	register long nr asm("v0") = __NR_clock_gettime;
  	register long error asm("a3");
  
@@ -122,7 +122,7 @@ index 0ae9b4cbc153..ea600e0ebfe7 100644
  
  	return error ? -ret : ret;
  }
-@@ -128,12 +164,21 @@ static __always_inline int clock_getres32_fallback(
+@@ -120,12 +156,21 @@ static __always_inline int clock_getres32_fallback(
  	register long nr asm("v0") = __NR_clock_getres;
  	register long error asm("a3");
  
@@ -145,5 +145,5 @@ index 0ae9b4cbc153..ea600e0ebfe7 100644
  	return error ? -ret : ret;
  }
 -- 
-2.25.4
+2.17.1
 
diff --git a/board/qemu/mips64r6el-malta/patches/linux/0001-mips-Do-not-include-hi-and-lo-in-clobber-list-for-R6.patch b/board/qemu/mips64r6el-malta/patches/linux/0001-mips-Do-not-include-hi-and-lo-in-clobber-list-for-R6.patch
index ad2647e627..01d78f6ffe 100644
--- a/board/qemu/mips64r6el-malta/patches/linux/0001-mips-Do-not-include-hi-and-lo-in-clobber-list-for-R6.patch
+++ b/board/qemu/mips64r6el-malta/patches/linux/0001-mips-Do-not-include-hi-and-lo-in-clobber-list-for-R6.patch
@@ -1,4 +1,4 @@
-From cfb381d8f4b64f3752c95b4bdd787be63ef84fb2 Mon Sep 17 00:00:00 2001
+From b9af6f34e43bf5264d75933f2080f16b8741048d Mon Sep 17 00:00:00 2001
 From: Romain Naour <romain.naour@gmail.com>
 Date: Sat, 25 Jul 2020 11:46:01 +0200
 Subject: [PATCH] mips: Do not include hi and lo in clobber list for R6
@@ -31,10 +31,10 @@ Signed-off-by: Romain Naour <romain.naour@gmail.com>
  1 file changed, 45 insertions(+)
 
 diff --git a/arch/mips/include/asm/vdso/gettimeofday.h b/arch/mips/include/asm/vdso/gettimeofday.h
-index 0ae9b4cbc153..ea600e0ebfe7 100644
+index 2203e2d0ae2a..e28096faecf6 100644
 --- a/arch/mips/include/asm/vdso/gettimeofday.h
 +++ b/arch/mips/include/asm/vdso/gettimeofday.h
-@@ -36,12 +36,21 @@ static __always_inline long gettimeofday_fallback(
+@@ -30,12 +30,21 @@ static __always_inline long gettimeofday_fallback(
  	register long nr asm("v0") = __NR_gettimeofday;
  	register long error asm("a3");
  
@@ -56,7 +56,7 @@ index 0ae9b4cbc153..ea600e0ebfe7 100644
  
  	return error ? -ret : ret;
  }
-@@ -60,12 +69,21 @@ static __always_inline long clock_gettime_fallback(
+@@ -54,12 +63,21 @@ static __always_inline long clock_gettime_fallback(
  #endif
  	register long error asm("a3");
  
@@ -78,7 +78,7 @@ index 0ae9b4cbc153..ea600e0ebfe7 100644
  
  	return error ? -ret : ret;
  }
-@@ -84,12 +102,21 @@ static __always_inline int clock_getres_fallback(
+@@ -78,12 +96,21 @@ static __always_inline int clock_getres_fallback(
  #endif
  	register long error asm("a3");
  
@@ -100,7 +100,7 @@ index 0ae9b4cbc153..ea600e0ebfe7 100644
  
  	return error ? -ret : ret;
  }
-@@ -108,12 +135,21 @@ static __always_inline long clock_gettime32_fallback(
+@@ -100,12 +127,21 @@ static __always_inline long clock_gettime32_fallback(
  	register long nr asm("v0") = __NR_clock_gettime;
  	register long error asm("a3");
  
@@ -122,7 +122,7 @@ index 0ae9b4cbc153..ea600e0ebfe7 100644
  
  	return error ? -ret : ret;
  }
-@@ -128,12 +164,21 @@ static __always_inline int clock_getres32_fallback(
+@@ -120,12 +156,21 @@ static __always_inline int clock_getres32_fallback(
  	register long nr asm("v0") = __NR_clock_getres;
  	register long error asm("a3");
  
@@ -145,5 +145,5 @@ index 0ae9b4cbc153..ea600e0ebfe7 100644
  	return error ? -ret : ret;
  }
 -- 
-2.25.4
+2.17.1
 
diff --git a/board/qemu/ppc-mpc8544ds/patches/linux/0001-powerpc-Fix-mcpu-options-for-SPE-only-compiler.patch b/board/qemu/ppc-mpc8544ds/patches/linux/0001-powerpc-Fix-mcpu-options-for-SPE-only-compiler.patch
index a7bc31bda2..b8c8a72587 100644
--- a/board/qemu/ppc-mpc8544ds/patches/linux/0001-powerpc-Fix-mcpu-options-for-SPE-only-compiler.patch
+++ b/board/qemu/ppc-mpc8544ds/patches/linux/0001-powerpc-Fix-mcpu-options-for-SPE-only-compiler.patch
@@ -1,4 +1,4 @@
-From 44e3424424b447b00fbe1f10ddba81b55817e970 Mon Sep 17 00:00:00 2001
+From a0919e3177295f4aaa9006915adcddc31788d809 Mon Sep 17 00:00:00 2001
 From: Ben Hutchings <ben@decadent.org.uk>
 Date: Wed, 26 Dec 2018 00:00:40 +0000
 Subject: [PATCH] powerpc: Fix -mcpu= options for SPE-only compiler
@@ -20,7 +20,7 @@ Signed-off-by: Romain Naour <romain.naour@gmail.com>
  1 file changed, 3 insertions(+), 1 deletion(-)
 
 diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
-index 37ac731a556b..5211ea4f48b1 100644
+index 5c8c06215dd4..e3dbea6d7ae0 100644
 --- a/arch/powerpc/Makefile
 +++ b/arch/powerpc/Makefile
 @@ -12,7 +12,7 @@
@@ -32,7 +32,7 @@ index 37ac731a556b..5211ea4f48b1 100644
  
  # Set default 32 bits cross compilers for vdso and boot wrapper
  CROSS32_COMPILE ?=
-@@ -166,6 +166,7 @@ CFLAGS-$(CONFIG_PPC32)	+= $(call cc-option, $(MULTIPLEWORD))
+@@ -164,6 +164,7 @@ CFLAGS-$(CONFIG_PPC32)	+= $(call cc-option, $(MULTIPLEWORD))
  
  CFLAGS-$(CONFIG_PPC32)	+= $(call cc-option,-mno-readonly-in-sdata)
  
@@ -40,7 +40,7 @@ index 37ac731a556b..5211ea4f48b1 100644
  ifdef CONFIG_PPC_BOOK3S_64
  ifdef CONFIG_CPU_LITTLE_ENDIAN
  CFLAGS-$(CONFIG_GENERIC_CPU) += -mcpu=power8
-@@ -177,6 +178,7 @@ endif
+@@ -175,6 +176,7 @@ endif
  else
  CFLAGS-$(CONFIG_GENERIC_CPU) += -mcpu=powerpc64
  endif
@@ -49,5 +49,5 @@ index 37ac731a556b..5211ea4f48b1 100644
  ifdef CONFIG_FUNCTION_TRACER
  CC_FLAGS_FTRACE := -pg
 -- 
-2.25.4
+2.17.1
 
diff --git a/board/qemu/sh4-r2d/patches/linux-headers/0001-Use-types.h-and-not-time_types.h-in-sockios.h.patch b/board/qemu/sh4-r2d/patches/linux-headers/0001-Use-types.h-and-not-time_types.h-in-sockios.h.patch
new file mode 100644
index 0000000000..90bd4e8c6c
--- /dev/null
+++ b/board/qemu/sh4-r2d/patches/linux-headers/0001-Use-types.h-and-not-time_types.h-in-sockios.h.patch
@@ -0,0 +1,76 @@
+From 34c78b21878ae7b0471299d11a7e861125e31b2c Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Geoffrey=20Le=20Gourri=C3=A9rec?=
+ <geoffrey.legourrierec@gmail.com>
+Date: Mon, 18 Jan 2021 23:40:28 +0100
+Subject: [PATCH] Use types.h and not time_types.h in sockios.h
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+This fixes builds for sh arch when libc is not using relevant
+time data structures definitions for 32-bit machines. A previous
+commit [1] provided a fix, that we seemed to slip through here.
+
+As of the time of this writing, the bug was found with non-
+up to date uclibc 1.0.37 only (currently the only libc supporting
+sh architecture).
+
+[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=fc94cf2092c7c1267fa2deb8388d624f50eba808
+
+Signed-off-by: Geoffrey Le Gourri??rec <geoffrey.legourrierec@gmail.com>
+Cc: Arnd Bergmann <arnd@arndb.de>
+
+---
+
+For the record, here's the build-time error:
+
+/usr/bin/make -j2 -C /builds/clumsyape/buildroot/output/build/uclibc-1.0.37 ARCH="sh" CROSS_COMPILE="/builds/clumsyape/buildroot/output/host/bin/sh4-buildroot-linux-uclibc-" UCLIBC_EXTRA_CFLAGS="" HOSTCC="/usr/bin/gcc"
+make[1]: Entering directory '/builds/clumsyape/buildroot/output/build/uclibc-1.0.37'
+  GEN libpthread/nptl/sysdeps/unix/sysv/linux/lowlevelcond.h
+  GEN libpthread/nptl/sysdeps/unix/sysv/linux/lowlevelcond.h
+  GEN libpthread/nptl/sysdeps/unix/sysv/linux/lowlevelrobustlock.h
+  GEN libpthread/nptl/sysdeps/unix/sysv/linux/lowlevelrobustlock.h
+In file included from /builds/clumsyape/buildroot/output/build/linux-headers-5.10.7/usr/include/asm/sockios.h:5,
+                 from /builds/clumsyape/buildroot/output/build/linux-headers-5.10.7/usr/include/asm-generic/socket.h:6,
+                 from /builds/clumsyape/buildroot/output/build/linux-headers-5.10.7/usr/include/asm/socket.h:1,
+                 from ./include/bits/socket.h:360,
+                 from ./include/sys/socket.h:39,
+                 from ./include/netinet/in.h:24,
+                 from ./include/resolv.h:57,
+                 from ./libpthread/nptl/descr.h:36,
+                 from ./libpthread/nptl/pthreadP.h:25,
+                 from <stdin>:2:
+/builds/clumsyape/buildroot/output/build/linux-headers-5.10.7/usr/include/linux/time_types.h:8:2: error: unknown type name '__kernel_time64_t'
+    8 |  __kernel_time64_t       tv_sec;                 /* seconds */
+      |  ^~~~~~~~~~~~~~~~~
+/builds/clumsyape/buildroot/output/build/linux-headers-5.10.7/usr/include/linux/time_types.h:32:2: error: unknown type name '__kernel_old_time_t'
+   32 |  __kernel_old_time_t tv_sec;  /* seconds */
+      |  ^~~~~~~~~~~~~~~~~~~
+libpthread/nptl/sysdeps/unix/sysv/linux/Makefile.commonarch:135: recipe for target 'libpthread/nptl/sysdeps/unix/sysv/linux/lowlevelrobustlock.h' failed
+make[1]: *** [libpthread/nptl/sysdeps/unix/sysv/linux/lowlevelrobustlock.h] Error 1
+make[1]: Leaving directory '/builds/clumsyape/buildroot/output/build/uclibc-1.0.37'
+
+I did a quick header dependency analysis starting from __kernel_time64_t
+(one of the offending types), but could "follow up" to linux/time_types.h
+as expected; so I fail to understand how this could break. What's even
+more confusing is linux/time_types.h includes linux/types.h itself.
+---
+ arch/sh/include/uapi/asm/sockios.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/arch/sh/include/uapi/asm/sockios.h b/arch/sh/include/uapi/asm/sockios.h
+index ef01ced9e169..d97d14685305 100644
+--- a/arch/sh/include/uapi/asm/sockios.h
++++ b/arch/sh/include/uapi/asm/sockios.h
+@@ -2,7 +2,7 @@
+ #ifndef __ASM_SH_SOCKIOS_H
+ #define __ASM_SH_SOCKIOS_H
+ 
+-#include <linux/time_types.h>
++#include <linux/types.h>
+ 
+ /* Socket-level I/O control calls. */
+ #define FIOGETOWN	_IOR('f', 123, int)
+-- 
+2.17.1
+
diff --git a/board/qemu/sh4-r2d/patches/linux/0001-arch-sh-vmlinux.scr.patch b/board/qemu/sh4-r2d/patches/linux/0001-arch-sh-vmlinux.scr.patch
deleted file mode 100644
index 7543767a53..0000000000
--- a/board/qemu/sh4-r2d/patches/linux/0001-arch-sh-vmlinux.scr.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From fe657afd48fc67841d32207ef9eeeb5f099764cd Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@gmail.com>
-Date: Sat, 21 Dec 2019 11:52:04 +0100
-Subject: [PATCH] arch/sh: vmlinux.scr
-
-Building the kernel using a toolchain built with Binutils 2.33.1 prevent
-booting a sh4 system under Qemu.
-Apply the patch provided by Alan Modra [2] that fix alignment of rodata.
-
-[1] https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=ebd2263ba9a9124d93bbc0ece63d7e0fae89b40e
-[2] https://www.sourceware.org/ml/binutils/2019-12/msg00112.html
-
-Signed-off-by: Romain Naour <romain.naour@gmail.com>
----
- arch/sh/boot/compressed/vmlinux.scr | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/arch/sh/boot/compressed/vmlinux.scr b/arch/sh/boot/compressed/vmlinux.scr
-index 862d74808236..dd292b4b9082 100644
---- a/arch/sh/boot/compressed/vmlinux.scr
-+++ b/arch/sh/boot/compressed/vmlinux.scr
-@@ -1,6 +1,6 @@
- SECTIONS
- {
--  .rodata..compressed : {
-+  .rodata..compressed : ALIGN(8) {
- 	input_len = .;
- 	LONG(input_data_end - input_data) input_data = .;
- 	*(.data)
--- 
-2.24.1
-
diff --git a/board/qemu/sh4eb-r2d/patches/linux-headers/0001-Use-types.h-and-not-time_types.h-in-sockios.h.patch b/board/qemu/sh4eb-r2d/patches/linux-headers/0001-Use-types.h-and-not-time_types.h-in-sockios.h.patch
new file mode 100644
index 0000000000..90bd4e8c6c
--- /dev/null
+++ b/board/qemu/sh4eb-r2d/patches/linux-headers/0001-Use-types.h-and-not-time_types.h-in-sockios.h.patch
@@ -0,0 +1,76 @@
+From 34c78b21878ae7b0471299d11a7e861125e31b2c Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Geoffrey=20Le=20Gourri=C3=A9rec?=
+ <geoffrey.legourrierec@gmail.com>
+Date: Mon, 18 Jan 2021 23:40:28 +0100
+Subject: [PATCH] Use types.h and not time_types.h in sockios.h
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+This fixes builds for sh arch when libc is not using relevant
+time data structures definitions for 32-bit machines. A previous
+commit [1] provided a fix, that we seemed to slip through here.
+
+As of the time of this writing, the bug was found with non-
+up to date uclibc 1.0.37 only (currently the only libc supporting
+sh architecture).
+
+[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=fc94cf2092c7c1267fa2deb8388d624f50eba808
+
+Signed-off-by: Geoffrey Le Gourri??rec <geoffrey.legourrierec@gmail.com>
+Cc: Arnd Bergmann <arnd@arndb.de>
+
+---
+
+For the record, here's the build-time error:
+
+/usr/bin/make -j2 -C /builds/clumsyape/buildroot/output/build/uclibc-1.0.37 ARCH="sh" CROSS_COMPILE="/builds/clumsyape/buildroot/output/host/bin/sh4-buildroot-linux-uclibc-" UCLIBC_EXTRA_CFLAGS="" HOSTCC="/usr/bin/gcc"
+make[1]: Entering directory '/builds/clumsyape/buildroot/output/build/uclibc-1.0.37'
+  GEN libpthread/nptl/sysdeps/unix/sysv/linux/lowlevelcond.h
+  GEN libpthread/nptl/sysdeps/unix/sysv/linux/lowlevelcond.h
+  GEN libpthread/nptl/sysdeps/unix/sysv/linux/lowlevelrobustlock.h
+  GEN libpthread/nptl/sysdeps/unix/sysv/linux/lowlevelrobustlock.h
+In file included from /builds/clumsyape/buildroot/output/build/linux-headers-5.10.7/usr/include/asm/sockios.h:5,
+                 from /builds/clumsyape/buildroot/output/build/linux-headers-5.10.7/usr/include/asm-generic/socket.h:6,
+                 from /builds/clumsyape/buildroot/output/build/linux-headers-5.10.7/usr/include/asm/socket.h:1,
+                 from ./include/bits/socket.h:360,
+                 from ./include/sys/socket.h:39,
+                 from ./include/netinet/in.h:24,
+                 from ./include/resolv.h:57,
+                 from ./libpthread/nptl/descr.h:36,
+                 from ./libpthread/nptl/pthreadP.h:25,
+                 from <stdin>:2:
+/builds/clumsyape/buildroot/output/build/linux-headers-5.10.7/usr/include/linux/time_types.h:8:2: error: unknown type name '__kernel_time64_t'
+    8 |  __kernel_time64_t       tv_sec;                 /* seconds */
+      |  ^~~~~~~~~~~~~~~~~
+/builds/clumsyape/buildroot/output/build/linux-headers-5.10.7/usr/include/linux/time_types.h:32:2: error: unknown type name '__kernel_old_time_t'
+   32 |  __kernel_old_time_t tv_sec;  /* seconds */
+      |  ^~~~~~~~~~~~~~~~~~~
+libpthread/nptl/sysdeps/unix/sysv/linux/Makefile.commonarch:135: recipe for target 'libpthread/nptl/sysdeps/unix/sysv/linux/lowlevelrobustlock.h' failed
+make[1]: *** [libpthread/nptl/sysdeps/unix/sysv/linux/lowlevelrobustlock.h] Error 1
+make[1]: Leaving directory '/builds/clumsyape/buildroot/output/build/uclibc-1.0.37'
+
+I did a quick header dependency analysis starting from __kernel_time64_t
+(one of the offending types), but could "follow up" to linux/time_types.h
+as expected; so I fail to understand how this could break. What's even
+more confusing is linux/time_types.h includes linux/types.h itself.
+---
+ arch/sh/include/uapi/asm/sockios.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/arch/sh/include/uapi/asm/sockios.h b/arch/sh/include/uapi/asm/sockios.h
+index ef01ced9e169..d97d14685305 100644
+--- a/arch/sh/include/uapi/asm/sockios.h
++++ b/arch/sh/include/uapi/asm/sockios.h
+@@ -2,7 +2,7 @@
+ #ifndef __ASM_SH_SOCKIOS_H
+ #define __ASM_SH_SOCKIOS_H
+ 
+-#include <linux/time_types.h>
++#include <linux/types.h>
+ 
+ /* Socket-level I/O control calls. */
+ #define FIOGETOWN	_IOR('f', 123, int)
+-- 
+2.17.1
+
diff --git a/board/qemu/sh4eb-r2d/patches/linux/0001-arch-sh-vmlinux.scr.patch b/board/qemu/sh4eb-r2d/patches/linux/0001-arch-sh-vmlinux.scr.patch
deleted file mode 100644
index 7543767a53..0000000000
--- a/board/qemu/sh4eb-r2d/patches/linux/0001-arch-sh-vmlinux.scr.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From fe657afd48fc67841d32207ef9eeeb5f099764cd Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@gmail.com>
-Date: Sat, 21 Dec 2019 11:52:04 +0100
-Subject: [PATCH] arch/sh: vmlinux.scr
-
-Building the kernel using a toolchain built with Binutils 2.33.1 prevent
-booting a sh4 system under Qemu.
-Apply the patch provided by Alan Modra [2] that fix alignment of rodata.
-
-[1] https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=ebd2263ba9a9124d93bbc0ece63d7e0fae89b40e
-[2] https://www.sourceware.org/ml/binutils/2019-12/msg00112.html
-
-Signed-off-by: Romain Naour <romain.naour@gmail.com>
----
- arch/sh/boot/compressed/vmlinux.scr | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/arch/sh/boot/compressed/vmlinux.scr b/arch/sh/boot/compressed/vmlinux.scr
-index 862d74808236..dd292b4b9082 100644
---- a/arch/sh/boot/compressed/vmlinux.scr
-+++ b/arch/sh/boot/compressed/vmlinux.scr
-@@ -1,6 +1,6 @@
- SECTIONS
- {
--  .rodata..compressed : {
-+  .rodata..compressed : ALIGN(8) {
- 	input_len = .;
- 	LONG(input_data_end - input_data) input_data = .;
- 	*(.data)
--- 
-2.24.1
-
diff --git a/configs/qemu_aarch64_virt_defconfig b/configs/qemu_aarch64_virt_defconfig
index a0ea422e84..aa00ddf831 100644
--- a/configs/qemu_aarch64_virt_defconfig
+++ b/configs/qemu_aarch64_virt_defconfig
@@ -15,13 +15,13 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 
-# Linux headers same as kernel, a 5.4 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
+# Linux headers same as kernel, a 5.10 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.4.88"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.7"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
diff --git a/configs/qemu_arm_versatile_defconfig b/configs/qemu_arm_versatile_defconfig
index e8c602fd07..10dd9e52b4 100644
--- a/configs/qemu_arm_versatile_defconfig
+++ b/configs/qemu_arm_versatile_defconfig
@@ -14,13 +14,13 @@ BR2_TARGET_ROOTFS_EXT2=y
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 
-# Linux headers same as kernel, a 5.4 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
+# Linux headers same as kernel, a 5.10 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.4.88"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.7"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/arm-versatile/linux.config"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
diff --git a/configs/qemu_arm_versatile_nommu_defconfig b/configs/qemu_arm_versatile_nommu_defconfig
index 1deac2d468..fa783f9299 100644
--- a/configs/qemu_arm_versatile_nommu_defconfig
+++ b/configs/qemu_arm_versatile_nommu_defconfig
@@ -25,13 +25,13 @@ BR2_TARGET_ROOTFS_INITRAMFS=y
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 
-# Linux headers same as kernel, a 5.4 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
+# Linux headers same as kernel, a 5.10 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.4.88"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.7"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/arm-versatile/linux-nommu.config"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
diff --git a/configs/qemu_arm_vexpress_defconfig b/configs/qemu_arm_vexpress_defconfig
index fc0a14e3ee..20fdbb4062 100644
--- a/configs/qemu_arm_vexpress_defconfig
+++ b/configs/qemu_arm_vexpress_defconfig
@@ -19,13 +19,13 @@ BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 # Qemu >= 5.1 requires an SD card size to be a power of 2, e.g. 64 MiB.
 BR2_TARGET_ROOTFS_EXT2_SIZE="64M"
 
-# Linux headers same as kernel, a 5.4 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
+# Linux headers same as kernel, a 5.10 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.4.88"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.7"
 BR2_LINUX_KERNEL_DEFCONFIG="vexpress"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="vexpress-v2p-ca9"
diff --git a/configs/qemu_arm_vexpress_tz_defconfig b/configs/qemu_arm_vexpress_tz_defconfig
index f554e7f0ab..3e37024deb 100644
--- a/configs/qemu_arm_vexpress_tz_defconfig
+++ b/configs/qemu_arm_vexpress_tz_defconfig
@@ -15,13 +15,13 @@ BR2_TARGET_ROOTFS_CPIO=y
 BR2_TARGET_ROOTFS_CPIO_GZIP=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Linux headers same as kernel, a 5.4 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
+# Linux headers same as kernel, a 5.10 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.4.88"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.7"
 BR2_LINUX_KERNEL_DEFCONFIG="vexpress"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/qemu/arm-vexpress-tz/linux.fragment"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
diff --git a/configs/qemu_m68k_mcf5208_defconfig b/configs/qemu_m68k_mcf5208_defconfig
index 2dcb0d4ec3..c45a775556 100644
--- a/configs/qemu_m68k_mcf5208_defconfig
+++ b/configs/qemu_m68k_mcf5208_defconfig
@@ -13,13 +13,13 @@ BR2_TARGET_ROOTFS_INITRAMFS=y
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 
-# Linux headers same as kernel, a 5.4 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
+# Linux headers same as kernel, a 5.10 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.4.88"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.7"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/m68k-mcf5208/linux.config"
 BR2_LINUX_KERNEL_VMLINUX=y
diff --git a/configs/qemu_m68k_q800_defconfig b/configs/qemu_m68k_q800_defconfig
index 5f1260590a..abd0560cb1 100644
--- a/configs/qemu_m68k_q800_defconfig
+++ b/configs/qemu_m68k_q800_defconfig
@@ -13,13 +13,13 @@ BR2_TARGET_ROOTFS_EXT2=y
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 
-# Linux headers same as kernel, a 5.4 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
+# Linux headers same as kernel, a 5.10 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.4.88"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.7"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/m68k-q800/linux.config"
 BR2_LINUX_KERNEL_VMLINUX=y
diff --git a/configs/qemu_microblazebe_mmu_defconfig b/configs/qemu_microblazebe_mmu_defconfig
index b5c110bced..638c6629da 100644
--- a/configs/qemu_microblazebe_mmu_defconfig
+++ b/configs/qemu_microblazebe_mmu_defconfig
@@ -14,13 +14,13 @@ BR2_TARGET_ROOTFS_INITRAMFS=y
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 
-# Linux headers same as kernel, a 5.4 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
+# Linux headers same as kernel, a 5.10 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.4.88"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.7"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/microblazebe-mmu/linux.config"
 BR2_LINUX_KERNEL_LINUX_BIN=y
diff --git a/configs/qemu_microblazeel_mmu_defconfig b/configs/qemu_microblazeel_mmu_defconfig
index 5cc2056eee..6e62cc3304 100644
--- a/configs/qemu_microblazeel_mmu_defconfig
+++ b/configs/qemu_microblazeel_mmu_defconfig
@@ -14,13 +14,13 @@ BR2_TARGET_ROOTFS_INITRAMFS=y
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 
-# Linux headers same as kernel, a 5.4 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
+# Linux headers same as kernel, a 5.10 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.4.88"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.7"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/microblazeel-mmu/linux.config"
 BR2_LINUX_KERNEL_LINUX_BIN=y
diff --git a/configs/qemu_mips32r2_malta_defconfig b/configs/qemu_mips32r2_malta_defconfig
index 35fc897126..434e3d9530 100644
--- a/configs/qemu_mips32r2_malta_defconfig
+++ b/configs/qemu_mips32r2_malta_defconfig
@@ -13,13 +13,13 @@ BR2_TARGET_ROOTFS_EXT2=y
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 
-# Linux headers same as kernel, a 5.4 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
+# Linux headers same as kernel, a 5.10 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.4.88"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.7"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips32r2-malta/linux.config"
 BR2_LINUX_KERNEL_VMLINUX=y
diff --git a/configs/qemu_mips32r2el_malta_defconfig b/configs/qemu_mips32r2el_malta_defconfig
index 4743c1c675..2b8b2e8df1 100644
--- a/configs/qemu_mips32r2el_malta_defconfig
+++ b/configs/qemu_mips32r2el_malta_defconfig
@@ -13,13 +13,13 @@ BR2_TARGET_ROOTFS_EXT2=y
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 
-# Linux headers same as kernel, a 5.4 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
+# Linux headers same as kernel, a 5.10 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.4.88"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.7"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips32r2el-malta/linux.config"
 BR2_LINUX_KERNEL_VMLINUX=y
diff --git a/configs/qemu_mips32r6_malta_defconfig b/configs/qemu_mips32r6_malta_defconfig
index 6e2b651c67..bf1306a2b2 100644
--- a/configs/qemu_mips32r6_malta_defconfig
+++ b/configs/qemu_mips32r6_malta_defconfig
@@ -13,13 +13,13 @@ BR2_TARGET_ROOTFS_EXT2=y
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 
-# Linux headers same as kernel, a 5.4 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
+# Linux headers same as kernel, a 5.10 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.4.88"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.7"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips32r6-malta/linux.config"
 BR2_LINUX_KERNEL_VMLINUX=y
diff --git a/configs/qemu_mips32r6el_malta_defconfig b/configs/qemu_mips32r6el_malta_defconfig
index d1642f8b69..5edf591bcf 100644
--- a/configs/qemu_mips32r6el_malta_defconfig
+++ b/configs/qemu_mips32r6el_malta_defconfig
@@ -13,13 +13,13 @@ BR2_TARGET_ROOTFS_EXT2=y
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 
-# Linux headers same as kernel, a 5.4 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
+# Linux headers same as kernel, a 5.10 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.4.88"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.7"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips32r6el-malta/linux.config"
 BR2_LINUX_KERNEL_VMLINUX=y
diff --git a/configs/qemu_mips64_malta_defconfig b/configs/qemu_mips64_malta_defconfig
index a1fca695c1..ec841b5a09 100644
--- a/configs/qemu_mips64_malta_defconfig
+++ b/configs/qemu_mips64_malta_defconfig
@@ -13,13 +13,13 @@ BR2_TARGET_ROOTFS_EXT2=y
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 
-# Linux headers same as kernel, a 5.4 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
+# Linux headers same as kernel, a 5.10 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.4.88"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.7"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips64-malta/linux.config"
 BR2_LINUX_KERNEL_VMLINUX=y
diff --git a/configs/qemu_mips64el_malta_defconfig b/configs/qemu_mips64el_malta_defconfig
index 6a3f5ec64a..680ccbbd60 100644
--- a/configs/qemu_mips64el_malta_defconfig
+++ b/configs/qemu_mips64el_malta_defconfig
@@ -13,13 +13,13 @@ BR2_TARGET_ROOTFS_EXT2=y
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 
-# Linux headers same as kernel, a 5.4 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
+# Linux headers same as kernel, a 5.10 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.4.88"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.7"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips64el-malta/linux.config"
 BR2_LINUX_KERNEL_VMLINUX=y
diff --git a/configs/qemu_mips64r6_malta_defconfig b/configs/qemu_mips64r6_malta_defconfig
index 07bf4d4af9..53c5c09788 100644
--- a/configs/qemu_mips64r6_malta_defconfig
+++ b/configs/qemu_mips64r6_malta_defconfig
@@ -14,13 +14,13 @@ BR2_TARGET_ROOTFS_EXT2=y
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 
-# Linux headers same as kernel, a 5.4 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
+# Linux headers same as kernel, a 5.10 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.4.88"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.7"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips64r6-malta/linux.config"
 BR2_LINUX_KERNEL_VMLINUX=y
diff --git a/configs/qemu_mips64r6el_malta_defconfig b/configs/qemu_mips64r6el_malta_defconfig
index 6408a70d27..8230b1a9f9 100644
--- a/configs/qemu_mips64r6el_malta_defconfig
+++ b/configs/qemu_mips64r6el_malta_defconfig
@@ -14,13 +14,13 @@ BR2_TARGET_ROOTFS_EXT2=y
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 
-# Linux headers same as kernel, a 5.4 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
+# Linux headers same as kernel, a 5.10 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.4.88"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.7"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips64r6el-malta/linux.config"
 BR2_LINUX_KERNEL_VMLINUX=y
diff --git a/configs/qemu_nios2_10m50_defconfig b/configs/qemu_nios2_10m50_defconfig
index 007c21971b..d562e941b7 100644
--- a/configs/qemu_nios2_10m50_defconfig
+++ b/configs/qemu_nios2_10m50_defconfig
@@ -1,7 +1,7 @@
 BR2_nios2=y
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.4.88"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.7"
 BR2_LINUX_KERNEL_DEFCONFIG="10m50"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/qemu/nios2-10m50/linux.fragment"
 BR2_TARGET_ROOTFS_INITRAMFS=y
@@ -10,8 +10,8 @@ BR2_TARGET_ROOTFS_INITRAMFS=y
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 
-# Linux headers same as kernel, a 5.4 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
+# Linux headers same as kernel, a 5.10 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 
 # Kernel needs mkimage
 BR2_PACKAGE_HOST_UBOOT_TOOLS=y
diff --git a/configs/qemu_or1k_defconfig b/configs/qemu_or1k_defconfig
index f27e6e2aa1..21d86e22ce 100644
--- a/configs/qemu_or1k_defconfig
+++ b/configs/qemu_or1k_defconfig
@@ -9,13 +9,13 @@ BR2_TARGET_ROOTFS_INITRAMFS=y
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 
-# Linux headers same as kernel, a 5.4 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
+# Linux headers same as kernel, a 5.10 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.4.88"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.7"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/or1k/linux.config"
 
diff --git a/configs/qemu_ppc64_e5500_defconfig b/configs/qemu_ppc64_e5500_defconfig
index 0dae31ea7e..dace0af8ee 100644
--- a/configs/qemu_ppc64_e5500_defconfig
+++ b/configs/qemu_ppc64_e5500_defconfig
@@ -10,12 +10,12 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 
 # Linux headers same as the kernel
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.4.88"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.7"
 BR2_LINUX_KERNEL_DEFCONFIG="corenet64_smp"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/qemu/ppc64-e5500/linux.fragment"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
diff --git a/configs/qemu_ppc64_pseries_defconfig b/configs/qemu_ppc64_pseries_defconfig
index 03bd672fab..4ce116e26a 100644
--- a/configs/qemu_ppc64_pseries_defconfig
+++ b/configs/qemu_ppc64_pseries_defconfig
@@ -14,13 +14,13 @@ BR2_TARGET_ROOTFS_EXT2=y
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 
-# Linux headers same as kernel, a 5.4 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
+# Linux headers same as kernel, a 5.10 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.4.88"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.7"
 BR2_LINUX_KERNEL_DEFCONFIG="pseries"
 BR2_LINUX_KERNEL_VMLINUX=y
 
diff --git a/configs/qemu_ppc64le_pseries_defconfig b/configs/qemu_ppc64le_pseries_defconfig
index d7a7947911..3be9de74a6 100644
--- a/configs/qemu_ppc64le_pseries_defconfig
+++ b/configs/qemu_ppc64le_pseries_defconfig
@@ -14,13 +14,13 @@ BR2_TARGET_ROOTFS_EXT2=y
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 
-# Linux headers same as kernel, a 5.4 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
+# Linux headers same as kernel, a 5.10 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.4.88"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.7"
 BR2_LINUX_KERNEL_DEFCONFIG="pseries_le"
 BR2_LINUX_KERNEL_VMLINUX=y
 
diff --git a/configs/qemu_ppc_g3beige_defconfig b/configs/qemu_ppc_g3beige_defconfig
index b468281976..6e41afe8d7 100644
--- a/configs/qemu_ppc_g3beige_defconfig
+++ b/configs/qemu_ppc_g3beige_defconfig
@@ -13,13 +13,13 @@ BR2_TARGET_ROOTFS_EXT2=y
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 
-# Linux headers same as kernel, a 5.4 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
+# Linux headers same as kernel, a 5.10 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.4.88"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.7"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/ppc-g3beige/linux.config"
 BR2_LINUX_KERNEL_VMLINUX=y
diff --git a/configs/qemu_ppc_mac99_defconfig b/configs/qemu_ppc_mac99_defconfig
index cfef5de26c..a1e9c1a5a6 100644
--- a/configs/qemu_ppc_mac99_defconfig
+++ b/configs/qemu_ppc_mac99_defconfig
@@ -5,13 +5,13 @@ BR2_powerpc_7400=y
 # System
 BR2_SYSTEM_DHCP="eth0"
 
-# Linux headers same as kernel, a 5.4 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
+# Linux headers same as kernel, a 5.10 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.4.88"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.7"
 BR2_LINUX_KERNEL_DEFCONFIG="pmac32"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/qemu/ppc-mac99/linux.fragment"
 BR2_LINUX_KERNEL_VMLINUX=y
diff --git a/configs/qemu_ppc_mpc8544ds_defconfig b/configs/qemu_ppc_mpc8544ds_defconfig
index 8776deeeea..55e6db5a0d 100644
--- a/configs/qemu_ppc_mpc8544ds_defconfig
+++ b/configs/qemu_ppc_mpc8544ds_defconfig
@@ -14,13 +14,13 @@ BR2_TARGET_ROOTFS_INITRAMFS=y
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 
-# Linux headers same as kernel, a 5.4 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
+# Linux headers same as kernel, a 5.10 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.4.88"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.7"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/ppc-mpc8544ds/linux.config"
 BR2_LINUX_KERNEL_VMLINUX=y
diff --git a/configs/qemu_riscv32_virt_defconfig b/configs/qemu_riscv32_virt_defconfig
index 079da1604b..1042088988 100644
--- a/configs/qemu_riscv32_virt_defconfig
+++ b/configs/qemu_riscv32_virt_defconfig
@@ -13,13 +13,13 @@ BR2_TARGET_ROOTFS_EXT2=y
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 
-# Linux headers same as kernel, a 5.4 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
+# Linux headers same as kernel, a 5.10 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.4.58"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.7"
 BR2_LINUX_KERNEL_DEFCONFIG="rv32"
 BR2_LINUX_KERNEL_IMAGE=y
 
diff --git a/configs/qemu_riscv64_virt_defconfig b/configs/qemu_riscv64_virt_defconfig
index f7de7d1b27..93d38b1ec2 100644
--- a/configs/qemu_riscv64_virt_defconfig
+++ b/configs/qemu_riscv64_virt_defconfig
@@ -13,13 +13,13 @@ BR2_TARGET_ROOTFS_EXT2=y
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 
-# Linux headers same as kernel, a 5.4 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
+# Linux headers same as kernel, a 5.10 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.4.88"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.7"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_IMAGE=y
 
diff --git a/configs/qemu_sh4_r2d_defconfig b/configs/qemu_sh4_r2d_defconfig
index 75e639c814..395e0fc849 100644
--- a/configs/qemu_sh4_r2d_defconfig
+++ b/configs/qemu_sh4_r2d_defconfig
@@ -15,13 +15,13 @@ BR2_TARGET_ROOTFS_EXT2=y
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 
-# Linux headers same as kernel, a 5.4 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
+# Linux headers same as kernel, a 5.10 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 
 # Linux kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.4.88"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.7"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/sh4-r2d/linux.config"
 BR2_LINUX_KERNEL_ZIMAGE=y
diff --git a/configs/qemu_sh4eb_r2d_defconfig b/configs/qemu_sh4eb_r2d_defconfig
index 68d7d73c2b..7f8e879b5d 100644
--- a/configs/qemu_sh4eb_r2d_defconfig
+++ b/configs/qemu_sh4eb_r2d_defconfig
@@ -14,13 +14,13 @@ BR2_TARGET_ROOTFS_EXT2=y
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 
-# Linux headers same as kernel, a 5.4 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
+# Linux headers same as kernel, a 5.10 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 
 # Linux kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.4.88"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.7"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/sh4eb-r2d/linux.config"
 BR2_LINUX_KERNEL_ZIMAGE=y
diff --git a/configs/qemu_sparc64_sun4u_defconfig b/configs/qemu_sparc64_sun4u_defconfig
index 6ad2605aac..cff0c2968a 100644
--- a/configs/qemu_sparc64_sun4u_defconfig
+++ b/configs/qemu_sparc64_sun4u_defconfig
@@ -13,13 +13,13 @@ BR2_TARGET_ROOTFS_EXT2=y
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 
-# Linux headers same as kernel, a 5.4 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
+# Linux headers same as kernel, a 5.10 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 
 # Linux kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.4.88"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.7"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/sparc64-sun4u/linux.config"
 
diff --git a/configs/qemu_sparc_ss10_defconfig b/configs/qemu_sparc_ss10_defconfig
index 8fb9c499de..0181f16846 100644
--- a/configs/qemu_sparc_ss10_defconfig
+++ b/configs/qemu_sparc_ss10_defconfig
@@ -13,13 +13,13 @@ BR2_TARGET_ROOTFS_EXT2=y
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 
-# Linux headers same as kernel, a 5.4 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
+# Linux headers same as kernel, a 5.10 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 
 # Linux kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.4.88"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.7"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/sparc-ss10/linux.config"
 
diff --git a/configs/qemu_x86_64_defconfig b/configs/qemu_x86_64_defconfig
index b8140c3e39..25e0d43f49 100644
--- a/configs/qemu_x86_64_defconfig
+++ b/configs/qemu_x86_64_defconfig
@@ -15,13 +15,13 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/qemu/x86_64/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 
-# Linux headers same as kernel, a 5.4 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
+# Linux headers same as kernel, a 5.10 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.4.88"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.7"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86_64/linux.config"
 
diff --git a/configs/qemu_x86_defconfig b/configs/qemu_x86_defconfig
index 71bcca87b5..bcd325b7ec 100644
--- a/configs/qemu_x86_defconfig
+++ b/configs/qemu_x86_defconfig
@@ -16,13 +16,13 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/qemu/x86/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 
-# Linux headers same as kernel, a 5.4 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
+# Linux headers same as kernel, a 5.10 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.4.88"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.7"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86/linux.config"
 
diff --git a/configs/qemu_xtensa_lx60_defconfig b/configs/qemu_xtensa_lx60_defconfig
index 26b7b5da66..50c1c4ccf0 100644
--- a/configs/qemu_xtensa_lx60_defconfig
+++ b/configs/qemu_xtensa_lx60_defconfig
@@ -15,13 +15,13 @@ BR2_TARGET_ROOTFS_INITRAMFS=y
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 
-# Linux headers same as kernel, a 5.4 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
+# Linux headers same as kernel, a 5.10 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.4.88"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.7"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/xtensa-lx60/linux.config"
 BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
diff --git a/configs/qemu_xtensa_lx60_nommu_defconfig b/configs/qemu_xtensa_lx60_nommu_defconfig
index 9fa81b4d63..baf72da9b8 100644
--- a/configs/qemu_xtensa_lx60_nommu_defconfig
+++ b/configs/qemu_xtensa_lx60_nommu_defconfig
@@ -19,13 +19,13 @@ BR2_TARGET_ROOTFS_INITRAMFS=y
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 
-# Linux headers same as kernel, a 5.4 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
+# Linux headers same as kernel, a 5.10 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.4.88"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.7"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/xtensa-lx60/linux-nommu.config"
 BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
