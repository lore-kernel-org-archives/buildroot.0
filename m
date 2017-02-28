From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 28 Feb 2017 18:40:00 +0100
Subject: [Buildroot] [PATCH 6/7] altera_socdk_defconfig: fix build with gcc5
In-Reply-To: <20170228174001.23830-1-arnout@mind.be>
References: <20170228174001.23830-1-arnout@mind.be>
Message-ID: <20170228174001.23830-7-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Kernel doesn't have the compiler-gcc5.h header, so include the universal
patch that fixes this issue. A third patch is needed to fix static
inline issues.

U-Boot doesn't have the compiler-gcc5.h header and has several other
problems. Get upstream patches to fix those.

Most patches are shared between the two Altera platforms, so they go
in board/altera/patches. The 4th U-Boot patch, however, needs a
slightly different context so we put it in board/altera/socdk/patches.

The patches are numbered taking into account the more global ones that
precede them. Therefore, the linux patch starts at 0003 (since
board/linux-gcc-patches already has 0001 and 0002), and the
socdk-specific U-Boot patch starts at 0004.

Cc: Charles Manning <cdhmanning@gmail.com>
Cc: Sebastien Bourdelin <sebastien.bourdelin@savoirfairelinux.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...ux-Change-extern-inline-to-static-inline-.patch | 62 ++++++++++++++++++++++
 ...c.h-remove-dependency-on-compiler-gcc-345.patch |  2 +-
 .../0002-ARM-asm-io.h-use-static-inline.patch      |  2 +-
 ...mon-main.c-make-show_boot_progress-__weak.patch | 18 +++++--
 .../patches/uboot/0004-arm-board-use-__weak.patch  |  8 +--
 configs/altera_socdk_defconfig                     |  3 ++
 6 files changed, 84 insertions(+), 11 deletions(-)
 create mode 100644 board/altera/patches/linux/0003-ARM-LLVMLinux-Change-extern-inline-to-static-inline-.patch
 copy board/{via/imx6_vab820 => altera}/patches/uboot/0001-compiler-gcc.h-remove-dependency-on-compiler-gcc-345.patch (99%)
 copy board/{via/imx6_vab820 => altera}/patches/uboot/0002-ARM-asm-io.h-use-static-inline.patch (97%)
 copy board/{via/imx6_vab820 => altera}/patches/uboot/0003-common-main.c-make-show_boot_progress-__weak.patch (69%)
 copy board/{via/imx6_vab820 => altera/socdk}/patches/uboot/0004-arm-board-use-__weak.patch (93%)

diff --git a/board/altera/patches/linux/0003-ARM-LLVMLinux-Change-extern-inline-to-static-inline-.patch b/board/altera/patches/linux/0003-ARM-LLVMLinux-Change-extern-inline-to-static-inline-.patch
new file mode 100644
index 0000000000..6043d8f65d
--- /dev/null
+++ b/board/altera/patches/linux/0003-ARM-LLVMLinux-Change-extern-inline-to-static-inline-.patch
@@ -0,0 +1,62 @@
+From 76ae03828756bac2c1fa2c7eff7485e5f815dbdb Mon Sep 17 00:00:00 2001
+From: Behan Webster <behanw@converseincode.com>
+Date: Tue, 3 Sep 2013 22:27:26 -0400
+Subject: [PATCH] ARM: LLVMLinux: Change "extern inline" to "static inline" in
+ glue-cache.h
+
+With compilers which follow the C99 standard (like modern versions of gcc and
+clang), "extern inline" does the wrong thing (emits code for an externally
+linkable version of the inline function). "static inline" is the correct choice
+instead.
+
+[Arnout: this patch is needed to fix the build with gcc5]
+
+Author: Behan Webster <behanw@converseincode.com>
+Signed-off-by: Behan Webster <behanw@converseincode.com>
+Reviewed-by: Mark Charlebois <charlebm@gmail.com>
+Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
+---
+ arch/arm/include/asm/glue-cache.h | 22 +++++++++++-----------
+ 1 file changed, 11 insertions(+), 11 deletions(-)
+
+diff --git a/arch/arm/include/asm/glue-cache.h b/arch/arm/include/asm/glue-cache.h
+index c81adc08b3fb..a3c24cd5b7c8 100644
+--- a/arch/arm/include/asm/glue-cache.h
++++ b/arch/arm/include/asm/glue-cache.h
+@@ -130,22 +130,22 @@
+ #endif
+ 
+ #ifndef __ASSEMBLER__
+-extern inline void nop_flush_icache_all(void) { }
+-extern inline void nop_flush_kern_cache_all(void) { }
+-extern inline void nop_flush_kern_cache_louis(void) { }
+-extern inline void nop_flush_user_cache_all(void) { }
+-extern inline void nop_flush_user_cache_range(unsigned long a,
++static inline void nop_flush_icache_all(void) { }
++static inline void nop_flush_kern_cache_all(void) { }
++static inline void nop_flush_kern_cache_louis(void) { }
++static inline void nop_flush_user_cache_all(void) { }
++static inline void nop_flush_user_cache_range(unsigned long a,
+ 		unsigned long b, unsigned int c) { }
+ 
+-extern inline void nop_coherent_kern_range(unsigned long a, unsigned long b) { }
+-extern inline int nop_coherent_user_range(unsigned long a,
++static inline void nop_coherent_kern_range(unsigned long a, unsigned long b) { }
++static inline int nop_coherent_user_range(unsigned long a,
+ 		unsigned long b) { return 0; }
+-extern inline void nop_flush_kern_dcache_area(void *a, size_t s) { }
++static inline void nop_flush_kern_dcache_area(void *a, size_t s) { }
+ 
+-extern inline void nop_dma_flush_range(const void *a, const void *b) { }
++static inline void nop_dma_flush_range(const void *a, const void *b) { }
+ 
+-extern inline void nop_dma_map_area(const void *s, size_t l, int f) { }
+-extern inline void nop_dma_unmap_area(const void *s, size_t l, int f) { }
++static inline void nop_dma_map_area(const void *s, size_t l, int f) { }
++static inline void nop_dma_unmap_area(const void *s, size_t l, int f) { }
+ #endif
+ 
+ #ifndef MULTI_CACHE
+-- 
+2.11.0
+
diff --git a/board/via/imx6_vab820/patches/uboot/0001-compiler-gcc.h-remove-dependency-on-compiler-gcc-345.patch b/board/altera/patches/uboot/0001-compiler-gcc.h-remove-dependency-on-compiler-gcc-345.patch
similarity index 99%
copy from board/via/imx6_vab820/patches/uboot/0001-compiler-gcc.h-remove-dependency-on-compiler-gcc-345.patch
copy to board/altera/patches/uboot/0001-compiler-gcc.h-remove-dependency-on-compiler-gcc-345.patch
index 867cbf2126..0da784cb02 100644
--- a/board/via/imx6_vab820/patches/uboot/0001-compiler-gcc.h-remove-dependency-on-compiler-gcc-345.patch
+++ b/board/altera/patches/uboot/0001-compiler-gcc.h-remove-dependency-on-compiler-gcc-345.patch
@@ -1,4 +1,4 @@
-From 1ed5595fc67a19ccd1503659e3845452369c96ae Mon Sep 17 00:00:00 2001
+From ef827a0768ad9c1683f49db312f8f1823b112811 Mon Sep 17 00:00:00 2001
 From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
 Date: Tue, 28 Feb 2017 13:32:48 +0100
 Subject: [PATCH] compiler-gcc.h: remove dependency on compiler-gcc[345].h
diff --git a/board/via/imx6_vab820/patches/uboot/0002-ARM-asm-io.h-use-static-inline.patch b/board/altera/patches/uboot/0002-ARM-asm-io.h-use-static-inline.patch
similarity index 97%
copy from board/via/imx6_vab820/patches/uboot/0002-ARM-asm-io.h-use-static-inline.patch
copy to board/altera/patches/uboot/0002-ARM-asm-io.h-use-static-inline.patch
index 9eb42d6c31..6d6c243097 100644
--- a/board/via/imx6_vab820/patches/uboot/0002-ARM-asm-io.h-use-static-inline.patch
+++ b/board/altera/patches/uboot/0002-ARM-asm-io.h-use-static-inline.patch
@@ -1,4 +1,4 @@
-From 158ec652dcd8ae228eeae3ae92a3d6ba48ca228e Mon Sep 17 00:00:00 2001
+From cfdf9ef7db99c9d8bb768d334c687195f7153270 Mon Sep 17 00:00:00 2001
 From: Jeroen Hofstee <jeroen@myspectrum.nl>
 Date: Sun, 22 Jun 2014 23:10:39 +0200
 Subject: [PATCH] ARM:asm:io.h use static inline
diff --git a/board/via/imx6_vab820/patches/uboot/0003-common-main.c-make-show_boot_progress-__weak.patch b/board/altera/patches/uboot/0003-common-main.c-make-show_boot_progress-__weak.patch
similarity index 69%
copy from board/via/imx6_vab820/patches/uboot/0003-common-main.c-make-show_boot_progress-__weak.patch
copy to board/altera/patches/uboot/0003-common-main.c-make-show_boot_progress-__weak.patch
index 686d448661..7d75ef204c 100644
--- a/board/via/imx6_vab820/patches/uboot/0003-common-main.c-make-show_boot_progress-__weak.patch
+++ b/board/altera/patches/uboot/0003-common-main.c-make-show_boot_progress-__weak.patch
@@ -1,4 +1,4 @@
-From 9cc7a26c35be56cd3f8fa3e3990b9b7e69aed031 Mon Sep 17 00:00:00 2001
+From f87d5ac472f4a9e67730eed8cbdf8fcd71c56075 Mon Sep 17 00:00:00 2001
 From: Jeroen Hofstee <jeroen@myspectrum.nl>
 Date: Thu, 26 Jun 2014 20:18:31 +0200
 Subject: [PATCH] common: main.c: make show_boot_progress __weak
@@ -13,14 +13,22 @@ Acked-by: Simon Glass <sjg@chromium.org>
 (cherry picked from commit 3422299dc28fa8257677d03cc1253e3c9bf17e9f)
 Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
 ---
- common/main.c | 3 +--
- 1 file changed, 1 insertion(+), 2 deletions(-)
+ common/main.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/common/main.c b/common/main.c
-index 145ded1fc9..b5c9bb0f35 100644
+index 9507cec88b..7bdbc4b6b5 100644
 --- a/common/main.c
 +++ b/common/main.c
-@@ -62,8 +62,7 @@ DECLARE_GLOBAL_DATA_PTR;
+@@ -42,6 +42,7 @@
+ 
+ #include <post.h>
+ #include <linux/ctype.h>
++#include <linux/compiler.h>
+ #include <menu.h>
+ 
+ #if defined(CONFIG_SILENT_CONSOLE) || defined(CONFIG_POST) || defined(CONFIG_CMDLINE_EDITING)
+@@ -51,8 +52,7 @@ DECLARE_GLOBAL_DATA_PTR;
  /*
   * Board-specific Platform code can reimplement show_boot_progress () if needed
   */
diff --git a/board/via/imx6_vab820/patches/uboot/0004-arm-board-use-__weak.patch b/board/altera/socdk/patches/uboot/0004-arm-board-use-__weak.patch
similarity index 93%
copy from board/via/imx6_vab820/patches/uboot/0004-arm-board-use-__weak.patch
copy to board/altera/socdk/patches/uboot/0004-arm-board-use-__weak.patch
index 7a96183af3..03af699153 100644
--- a/board/via/imx6_vab820/patches/uboot/0004-arm-board-use-__weak.patch
+++ b/board/altera/socdk/patches/uboot/0004-arm-board-use-__weak.patch
@@ -1,4 +1,4 @@
-From 99bd7b7fb4d58092f020a808bb57be3b4d4cfc51 Mon Sep 17 00:00:00 2001
+From 2c27dbf181337d2d2176cdc84e4706062a79628e Mon Sep 17 00:00:00 2001
 From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
 Date: Tue, 28 Feb 2017 14:07:30 +0100
 Subject: [PATCH] arm: board: use __weak
@@ -14,10 +14,10 @@ Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
  1 file changed, 12 insertions(+), 28 deletions(-)
 
 diff --git a/arch/arm/lib/board.c b/arch/arm/lib/board.c
-index 51b8628b3f..3685e65134 100644
+index 9f861ccaf6..d939189e1b 100644
 --- a/arch/arm/lib/board.c
 +++ b/arch/arm/lib/board.c
-@@ -82,25 +82,15 @@ extern void dataflash_print_info(void);
+@@ -77,25 +77,15 @@ extern void dataflash_print_info(void);
   ************************************************************************
   * May be supplied by boards if desired
   */
@@ -52,7 +52,7 @@ index 51b8628b3f..3685e65134 100644
  
  /*
   ************************************************************************
-@@ -215,27 +205,21 @@ typedef int (init_fnc_t) (void);
+@@ -210,27 +200,21 @@ typedef int (init_fnc_t) (void);
  
  int print_cpuinfo(void);
  
diff --git a/configs/altera_socdk_defconfig b/configs/altera_socdk_defconfig
index f5a2fc7fd0..5cae199b9e 100644
--- a/configs/altera_socdk_defconfig
+++ b/configs/altera_socdk_defconfig
@@ -6,6 +6,9 @@ BR2_ARM_ENABLE_NEON=y
 BR2_ARM_FPU_NEON=y
 BR2_ARM_INSTRUCTIONS_THUMB2=y
 
+# Older Linux and U-Boot require the gcc5 patch
+BR2_GLOBAL_PATCH_DIR="board/linux-gcc-patches board/altera/patches board/altera/socdk/patches"
+
 # Linux headers same as kernel, a 3.13 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_13=y
 
-- 
2.11.0
