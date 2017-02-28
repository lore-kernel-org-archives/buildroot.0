From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 28 Feb 2017 18:39:59 +0100
Subject: [Buildroot] [PATCH 5/7] via_imx6_vab820_defconfig: fix build with
	gcc5
In-Reply-To: <20170228174001.23830-1-arnout@mind.be>
References: <20170228174001.23830-1-arnout@mind.be>
Message-ID: <20170228174001.23830-6-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Kernel doesn't have the compiler-gcc5.h header, so include the universal
patch that fixes this issue.

U-Boot doesn't have the compiler-gcc5.h header and has several other
problems. Get upstream patches to fix those.

U-Boot patches are needed for several defconfigs, but they differ
slightly in the context. However, the patches have been written in a
generic way so they are almost identicat between boards.

Cc: Gergely Imreh <imrehg@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ....h-remove-dependency-on-compiler-gcc-345.patch} | 84 +++++++++++++--------
 .../0002-ARM-asm-io.h-use-static-inline.patch      | 81 ++++++++++++++++++++
 ...mon-main.c-make-show_boot_progress-__weak.patch | 35 +++++++++
 .../patches/uboot/0004-arm-board-use-__weak.patch  | 88 ++++++++++++++++++++++
 configs/via_imx6_vab820_defconfig                  |  3 +
 5 files changed, 258 insertions(+), 33 deletions(-)
 copy board/{linux-gcc-patches/linux/0001-compiler-gcc-integrate-the-various-compiler-gcc-345-.patch => via/imx6_vab820/patches/uboot/0001-compiler-gcc.h-remove-dependency-on-compiler-gcc-345.patch} (63%)
 create mode 100644 board/via/imx6_vab820/patches/uboot/0002-ARM-asm-io.h-use-static-inline.patch
 create mode 100644 board/via/imx6_vab820/patches/uboot/0003-common-main.c-make-show_boot_progress-__weak.patch
 create mode 100644 board/via/imx6_vab820/patches/uboot/0004-arm-board-use-__weak.patch

diff --git a/board/linux-gcc-patches/linux/0001-compiler-gcc-integrate-the-various-compiler-gcc-345-.patch b/board/via/imx6_vab820/patches/uboot/0001-compiler-gcc.h-remove-dependency-on-compiler-gcc-345.patch
similarity index 63%
copy from board/linux-gcc-patches/linux/0001-compiler-gcc-integrate-the-various-compiler-gcc-345-.patch
copy to board/via/imx6_vab820/patches/uboot/0001-compiler-gcc.h-remove-dependency-on-compiler-gcc-345.patch
index 2435d21be0..867cbf2126 100644
--- a/board/linux-gcc-patches/linux/0001-compiler-gcc-integrate-the-various-compiler-gcc-345-.patch
+++ b/board/via/imx6_vab820/patches/uboot/0001-compiler-gcc.h-remove-dependency-on-compiler-gcc-345.patch
@@ -1,43 +1,35 @@
-From cb984d101b30eb7478d32df56a0023e4603cba7f Mon Sep 17 00:00:00 2001
-From: Joe Perches <joe@perches.com>
-Date: Thu, 25 Jun 2015 15:01:02 -0700
-Subject: [PATCH] compiler-gcc: integrate the various compiler-gcc[345].h files
+From 1ed5595fc67a19ccd1503659e3845452369c96ae Mon Sep 17 00:00:00 2001
+From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
+Date: Tue, 28 Feb 2017 13:32:48 +0100
+Subject: [PATCH] compiler-gcc.h: remove dependency on compiler-gcc[345].h
 
-As gcc major version numbers are going to advance rather rapidly in the
-future, there's no real value in separate files for each compiler
-version.
+This is based on commit 9b2c282b348dfe966bbba967dc7a45ce817cce50 upstream.
 
-Deduplicate some of the macros #defined in each file too.
+Copy these from Linux v4.5-rc6 tag.
 
-Neaten comments using normal kernel commenting style.
+This is needed so that we can keep up with newer gcc versions.  Note
+that we don't have the uapi/ hierarchy from the kernel so continue to
+use <linux/types.h>
 
-[Arnout: don't remove compiler-gcc[345].h to make the patch more universal.
-         These headers are not used anymore, but it doesn't hurt if the files
-         still exist.
-         Also, add GCC_VERSION definition (introduced in v3.9) so the same
-         patch can be applied to pre- and post-v3.9 kernels.]
+[Arnout: limit the changes to purely what is needed to get rid of
+         compiler-gcc[345].h. This gives us the best chance that the
+         patch applies to some random U-Boot version. Also, don't
+         remove compiler-gcc[345].h, in case they have changed or don't
+         exist yet.]
 
-Signed-off-by: Joe Perches <joe@perches.com>
-Cc: Andi Kleen <andi@firstfloor.org>
-Cc: Michal Marek <mmarek@suse.cz>
-Cc: Segher Boessenkool <segher@kernel.crashing.org>
-Cc: Sasha Levin <levinsasha928@gmail.com>
-Cc: Anton Blanchard <anton@samba.org>
-Cc: Alan Modra <amodra@gmail.com>
-Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
-Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
+Signed-off-by: Tom Rini <trini@konsulko.com>
 Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
 ---
- include/linux/compiler-gcc.h  | 120 ++++++++++++++++++++++++++++++++++++++++--
- 4 files changed, 116 insertions(+), 185 deletions(-)
+ include/linux/compiler-gcc.h | 155 +++++++++++++++++++++++++++++++++++++++++--
+ 1 file changed, 151 insertions(+), 4 deletions(-)
 
 diff --git a/include/linux/compiler-gcc.h b/include/linux/compiler-gcc.h
-index 5c2c14e3c647..dfaa7b3e9ae9 100644
+index 73dcf804bc..1ad6c64b47 100644
 --- a/include/linux/compiler-gcc.h
 +++ b/include/linux/compiler-gcc.h
-@@ -122,10 +122,128 @@
- #define __maybe_unused		__attribute__((unused))
- #define __always_unused		__attribute__((unused))
+@@ -81,7 +81,154 @@
+ #define __maybe_unused			__attribute__((unused))
+ #define __always_unused			__attribute__((unused))
  
 -#define __gcc_header(x) #x
 -#define _gcc_header(x) __gcc_header(linux/compiler-gcc##x.h)
@@ -132,11 +124,31 @@ index 5c2c14e3c647..dfaa7b3e9ae9 100644
 +
 +#if GCC_VERSION >= 40600
 +/*
-+ * Tell the optimizer that something else uses this function or variable.
++ * When used with Link Time Optimization, gcc can optimize away C functions or
++ * variables which are referenced only from assembly code.  __visible tells the
++ * optimizer that something else uses this function or variable, thus preventing
++ * this.
 + */
 +#define __visible	__attribute__((externally_visible))
 +#endif
 +
++
++#if GCC_VERSION >= 40900 && !defined(__CHECKER__)
++/*
++ * __assume_aligned(n, k): Tell the optimizer that the returned
++ * pointer can be assumed to be k modulo n. The second argument is
++ * optional (default 0), so we use a variadic macro to make the
++ * shorthand.
++ *
++ * Beware: Do not apply this to functions which may return
++ * ERR_PTRs. Also, it is probably unwise to apply it to functions
++ * returning extra information in the low bits (but in that case the
++ * compiler should see some alignment anyway, when the return value is
++ * massaged by 'flags = ptr & 3; ptr &= ~3;').
++ */
++#define __assume_aligned(a, ...) __attribute__((__assume_aligned__(a, ## __VA_ARGS__)))
++#endif
++
 +/*
 + * GCC 'asm goto' miscompiles certain code sequences:
 + *
@@ -164,10 +176,16 @@ index 5c2c14e3c647..dfaa7b3e9ae9 100644
 +#define KASAN_ABI_VERSION 3
 +#endif
 +
++#if GCC_VERSION >= 40902
++/*
++ * Tell the compiler that address safety instrumentation (KASAN)
++ * should not be applied to that function.
++ * Conflicts with inlining: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=67368
++ */
++#define __no_sanitize_address __attribute__((no_sanitize_address))
++#endif
++
 +#endif	/* gcc version >= 40000 specific checks */
- 
- #if !defined(__noclone)
- #define __noclone	/* not needed */
 -- 
 2.11.0
 
diff --git a/board/via/imx6_vab820/patches/uboot/0002-ARM-asm-io.h-use-static-inline.patch b/board/via/imx6_vab820/patches/uboot/0002-ARM-asm-io.h-use-static-inline.patch
new file mode 100644
index 0000000000..9eb42d6c31
--- /dev/null
+++ b/board/via/imx6_vab820/patches/uboot/0002-ARM-asm-io.h-use-static-inline.patch
@@ -0,0 +1,81 @@
+From 158ec652dcd8ae228eeae3ae92a3d6ba48ca228e Mon Sep 17 00:00:00 2001
+From: Jeroen Hofstee <jeroen@myspectrum.nl>
+Date: Sun, 22 Jun 2014 23:10:39 +0200
+Subject: [PATCH] ARM:asm:io.h use static inline
+
+When compiling u-boot with W=1 the extern inline void for
+read* is likely causing the most noise. gcc / clang will
+warn there is never a actual declaration for these functions.
+Instead of declaring these extern make them static inline so
+it is actually declared.
+
+[Arnout: rewrite for U-Boot < v2014.01
+         This patch is needed for gcc5]
+
+cc: Albert ARIBAUD <albert.u.boot@aribaud.net>
+Signed-off-by: Jeroen Hofstee <jeroen@myspectrum.nl>
+(cherry picked from commit 8863aa5c984460ce1112d8db895cbf8b13a6ac9d)
+Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
+---
+ arch/arm/include/asm/io.h | 15 +++++++++------
+ 1 file changed, 9 insertions(+), 6 deletions(-)
+
+diff --git a/arch/arm/include/asm/io.h b/arch/arm/include/asm/io.h
+index 1fbc531a08..2f6925b78c 100644
+--- a/arch/arm/include/asm/io.h
++++ b/arch/arm/include/asm/io.h
+@@ -75,42 +75,45 @@ static inline phys_addr_t virt_to_phys(void * vaddr)
+ #define __arch_putw(v,a)		(*(volatile unsigned short *)(a) = (v))
+ #define __arch_putl(v,a)		(*(volatile unsigned int *)(a) = (v))
+ 
+-extern inline void __raw_writesb(unsigned int addr, const void *data, int bytelen)
++static inline void __raw_writesb(unsigned long addr, const void *data,
++				 int bytelen)
+ {
+ 	uint8_t *buf = (uint8_t *)data;
+ 	while(bytelen--)
+ 		__arch_putb(*buf++, addr);
+ }
+ 
+-extern inline void __raw_writesw(unsigned int addr, const void *data, int wordlen)
++static inline void __raw_writesw(unsigned long addr, const void *data,
++				 int wordlen)
+ {
+ 	uint16_t *buf = (uint16_t *)data;
+ 	while(wordlen--)
+ 		__arch_putw(*buf++, addr);
+ }
+ 
+-extern inline void __raw_writesl(unsigned int addr, const void *data, int longlen)
++static inline void __raw_writesl(unsigned long addr, const void *data,
++				 int longlen)
+ {
+ 	uint32_t *buf = (uint32_t *)data;
+ 	while(longlen--)
+ 		__arch_putl(*buf++, addr);
+ }
+ 
+-extern inline void __raw_readsb(unsigned int addr, void *data, int bytelen)
++static inline void __raw_readsb(unsigned long addr, void *data, int bytelen)
+ {
+ 	uint8_t *buf = (uint8_t *)data;
+ 	while(bytelen--)
+ 		*buf++ = __arch_getb(addr);
+ }
+ 
+-extern inline void __raw_readsw(unsigned int addr, void *data, int wordlen)
++static inline void __raw_readsw(unsigned long addr, void *data, int wordlen)
+ {
+ 	uint16_t *buf = (uint16_t *)data;
+ 	while(wordlen--)
+ 		*buf++ = __arch_getw(addr);
+ }
+ 
+-extern inline void __raw_readsl(unsigned int addr, void *data, int longlen)
++static inline void __raw_readsl(unsigned long addr, void *data, int longlen)
+ {
+ 	uint32_t *buf = (uint32_t *)data;
+ 	while(longlen--)
+-- 
+2.11.0
+
diff --git a/board/via/imx6_vab820/patches/uboot/0003-common-main.c-make-show_boot_progress-__weak.patch b/board/via/imx6_vab820/patches/uboot/0003-common-main.c-make-show_boot_progress-__weak.patch
new file mode 100644
index 0000000000..686d448661
--- /dev/null
+++ b/board/via/imx6_vab820/patches/uboot/0003-common-main.c-make-show_boot_progress-__weak.patch
@@ -0,0 +1,35 @@
+From 9cc7a26c35be56cd3f8fa3e3990b9b7e69aed031 Mon Sep 17 00:00:00 2001
+From: Jeroen Hofstee <jeroen@myspectrum.nl>
+Date: Thu, 26 Jun 2014 20:18:31 +0200
+Subject: [PATCH] common: main.c: make show_boot_progress __weak
+
+This not only looks a bit better it also prevents a
+warning with W=1 (no previous prototype).
+
+[Arnout: this patch is needed to fix the build with gcc5]
+
+Signed-off-by: Jeroen Hofstee <jeroen@myspectrum.nl>
+Acked-by: Simon Glass <sjg@chromium.org>
+(cherry picked from commit 3422299dc28fa8257677d03cc1253e3c9bf17e9f)
+Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
+---
+ common/main.c | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/common/main.c b/common/main.c
+index 145ded1fc9..b5c9bb0f35 100644
+--- a/common/main.c
++++ b/common/main.c
+@@ -62,8 +62,7 @@ DECLARE_GLOBAL_DATA_PTR;
+ /*
+  * Board-specific Platform code can reimplement show_boot_progress () if needed
+  */
+-void inline __show_boot_progress (int val) {}
+-void show_boot_progress (int val) __attribute__((weak, alias("__show_boot_progress")));
++__weak void show_boot_progress(int val) {}
+ 
+ #if defined(CONFIG_UPDATE_TFTP)
+ int update_tftp (ulong addr);
+-- 
+2.11.0
+
diff --git a/board/via/imx6_vab820/patches/uboot/0004-arm-board-use-__weak.patch b/board/via/imx6_vab820/patches/uboot/0004-arm-board-use-__weak.patch
new file mode 100644
index 0000000000..7a96183af3
--- /dev/null
+++ b/board/via/imx6_vab820/patches/uboot/0004-arm-board-use-__weak.patch
@@ -0,0 +1,88 @@
+From 99bd7b7fb4d58092f020a808bb57be3b4d4cfc51 Mon Sep 17 00:00:00 2001
+From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
+Date: Tue, 28 Feb 2017 14:07:30 +0100
+Subject: [PATCH] arm: board: use __weak
+
+[Arnout: this patch is needed to fix the build with gcc5]
+
+Signed-off-by: Jeroen Hofstee <jeroen@myspectrum.nl>
+Acked-by: Albert ARIBAUD <albert.u.boot@aribaud.net>
+(cherry picked from commit 8590c800ee60e46f15d6085e3c1fed0d6881fc62)
+Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
+---
+ arch/arm/lib/board.c | 40 ++++++++++++----------------------------
+ 1 file changed, 12 insertions(+), 28 deletions(-)
+
+diff --git a/arch/arm/lib/board.c b/arch/arm/lib/board.c
+index 51b8628b3f..3685e65134 100644
+--- a/arch/arm/lib/board.c
++++ b/arch/arm/lib/board.c
+@@ -82,25 +82,15 @@ extern void dataflash_print_info(void);
+  ************************************************************************
+  * May be supplied by boards if desired
+  */
+-inline void __coloured_LED_init(void) {}
+-void coloured_LED_init(void)
+-	__attribute__((weak, alias("__coloured_LED_init")));
+-inline void __red_led_on(void) {}
+-void red_led_on(void) __attribute__((weak, alias("__red_led_on")));
+-inline void __red_led_off(void) {}
+-void red_led_off(void) __attribute__((weak, alias("__red_led_off")));
+-inline void __green_led_on(void) {}
+-void green_led_on(void) __attribute__((weak, alias("__green_led_on")));
+-inline void __green_led_off(void) {}
+-void green_led_off(void) __attribute__((weak, alias("__green_led_off")));
+-inline void __yellow_led_on(void) {}
+-void yellow_led_on(void) __attribute__((weak, alias("__yellow_led_on")));
+-inline void __yellow_led_off(void) {}
+-void yellow_led_off(void) __attribute__((weak, alias("__yellow_led_off")));
+-inline void __blue_led_on(void) {}
+-void blue_led_on(void) __attribute__((weak, alias("__blue_led_on")));
+-inline void __blue_led_off(void) {}
+-void blue_led_off(void) __attribute__((weak, alias("__blue_led_off")));
++__weak void coloured_LED_init(void) {}
++__weak void red_led_on(void) {}
++__weak void red_led_off(void) {}
++__weak void green_led_on(void) {}
++__weak void green_led_off(void) {}
++__weak void yellow_led_on(void) {}
++__weak void yellow_led_off(void) {}
++__weak void blue_led_on(void) {}
++__weak void blue_led_off(void) {}
+ 
+ /*
+  ************************************************************************
+@@ -215,27 +205,21 @@ typedef int (init_fnc_t) (void);
+ 
+ int print_cpuinfo(void);
+ 
+-void __dram_init_banksize(void)
++__weak void dram_init_banksize(void)
+ {
+ 	gd->bd->bi_dram[0].start = CONFIG_SYS_SDRAM_BASE;
+ 	gd->bd->bi_dram[0].size =  gd->ram_size;
+ }
+-void dram_init_banksize(void)
+-	__attribute__((weak, alias("__dram_init_banksize")));
+ 
+-int __arch_cpu_init(void)
++__weak int arch_cpu_init(void)
+ {
+ 	return 0;
+ }
+-int arch_cpu_init(void)
+-	__attribute__((weak, alias("__arch_cpu_init")));
+ 
+-int __power_init_board(void)
++__weak int power_init_board(void)
+ {
+ 	return 0;
+ }
+-int power_init_board(void)
+-	__attribute__((weak, alias("__power_init_board")));
+ 
+ 	/* Record the board_init_f() bootstage (after arch_cpu_init()) */
+ static int mark_bootstage(void)
+-- 
+2.11.0
+
diff --git a/configs/via_imx6_vab820_defconfig b/configs/via_imx6_vab820_defconfig
index fa646f07dc..d7ebeef62c 100644
--- a/configs/via_imx6_vab820_defconfig
+++ b/configs/via_imx6_vab820_defconfig
@@ -3,6 +3,9 @@ BR2_arm=y
 BR2_cortex_a9=y
 BR2_ARM_ENABLE_VFP=y
 
+# Older Linux and U-Boot require the gcc5 patch
+BR2_GLOBAL_PATCH_DIR="board/linux-gcc-patches board/via/imx6_vab820/patches"
+
 # Linux headers same as kernel, a 3.10 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_10=y
 
-- 
2.11.0
