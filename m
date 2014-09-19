From: Waldemar Brodkorb <wbx@openadk.org>
Date: Fri, 19 Sep 2014 12:34:04 +0200
Subject: [Buildroot] [PATCH 2/2] qemu-sparc: use default gcc
Message-ID: <20140919103404.GA24103@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

With the kernel patch from:
http://patchwork.ozlabs.org/patch/384285/
There is no problem with latest gcc anymore.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 .../linux/linux-0001-sparc-memset-fix.patch        |   50 ++++++++++++++++++++
 configs/qemu_sparc_ss10_defconfig                  |    2 +
 package/gcc/Config.in.host                         |    7 ++-
 3 files changed, 55 insertions(+), 4 deletions(-)
 create mode 100644 board/qemu/sparc-ss10/linux/linux-0001-sparc-memset-fix.patch

diff --git a/board/qemu/sparc-ss10/linux/linux-0001-sparc-memset-fix.patch b/board/qemu/sparc-ss10/linux/linux-0001-sparc-memset-fix.patch
new file mode 100644
index 0000000..022c87b
--- /dev/null
+++ b/board/qemu/sparc-ss10/linux/linux-0001-sparc-memset-fix.patch
@@ -0,0 +1,50 @@
+This makes memset follow the standard (instead of returning 0 on success). This
+is needed when certain versions of gcc optimizes around memset calls and assume
+that the address argument is preserved in %o0.
+
+Signed-off-by: Andreas Larsson <andreas@gaisler.com>
+
+diff -Nur linux-3.16.2.orig/arch/sparc/lib/memset.S linux-3.16.2/arch/sparc/lib/memset.S
+--- linux-3.16.2.orig/arch/sparc/lib/memset.S	2014-09-06 01:37:11.000000000 +0200
++++ linux-3.16.2/arch/sparc/lib/memset.S	2014-09-18 09:53:49.563047773 +0200
+@@ -65,6 +65,8 @@
+ 	.globl	__memset_start, __memset_end
+ __memset_start:
+ memset:
++	mov	%o0, %g1
++	mov	1, %g4
+ 	and	%o1, 0xff, %g3
+ 	sll	%g3, 8, %g2
+ 	or	%g3, %g2, %g3
+@@ -89,6 +91,7 @@
+ 	 sub	%o0, %o2, %o0
+ 
+ __bzero:
++	clr	%g4
+ 	mov	%g0, %g3
+ 1:
+ 	cmp	%o1, 7
+@@ -151,8 +154,8 @@
+ 	bne,a	8f
+ 	 EX(stb	%g3, [%o0], and %o1, 1)
+ 8:
+-	retl
+-	 clr	%o0
++	b	0f
++	 nop
+ 7:
+ 	be	13b
+ 	 orcc	%o1, 0, %g0
+@@ -164,6 +167,12 @@
+ 	bne	8b
+ 	 EX(stb	%g3, [%o0 - 1], add %o1, 1)
+ 0:
++	andcc	%g4, 1, %g0
++	be	5f
++	 nop
++	retl
++	 mov	%g1, %o0
++5:
+ 	retl
+ 	 clr	%o0
+ __memset_end:
diff --git a/configs/qemu_sparc_ss10_defconfig b/configs/qemu_sparc_ss10_defconfig
index 47f04b0..22b2b87 100644
--- a/configs/qemu_sparc_ss10_defconfig
+++ b/configs/qemu_sparc_ss10_defconfig
@@ -2,6 +2,8 @@
 BR2_sparc=y
 BR2_sparc_v8=y
 
+BR2_GLOBAL_PATCH_DIR="board/qemu/sparc-ss10"
+
 # filesystem
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index b536a66..76223e9 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -10,7 +10,6 @@ choice
 	prompt "GCC compiler Version"
 	default BR2_GCC_VERSION_4_4_X if BR2_sparc_sparchfleon || BR2_sparc_sparchfleonv8 || BR2_sparc_sparcsfleon || BR2_sparc_sparcsfleonv8
 	default BR2_GCC_VERSION_4_2_2_AVR32_2_1_5 if BR2_avr32
-	default BR2_GCC_VERSION_4_7_X if BR2_sparc
 	default BR2_GCC_VERSION_4_8_ARC if BR2_arc
 	default BR2_GCC_VERSION_4_9_X if BR2_microblaze || BR2_powerpc64le
 	default BR2_GCC_VERSION_4_5_X if BR2_bfin
@@ -47,7 +46,7 @@ choice
 		bool "gcc 4.7.x"
 
 	config BR2_GCC_VERSION_4_8_X
-		depends on !BR2_microblaze && !BR2_arc && !BR2_avr32 && !BR2_bfin && !BR2_cortex_a12 && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8 && !BR2_powerpc64le && !BR2_sparc
+		depends on !BR2_microblaze && !BR2_arc && !BR2_avr32 && !BR2_bfin && !BR2_cortex_a12 && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8 && !BR2_powerpc64le
 		select BR2_GCC_NEEDS_MPC
 		select BR2_GCC_SUPPORTS_GRAPHITE
 		bool "gcc 4.8.x"
@@ -58,14 +57,14 @@ choice
 		bool "gcc 4.8-arc"
 
 	config BR2_GCC_VERSION_4_9_X
-		depends on !BR2_arc && !BR2_avr32 && !BR2_bfin && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8 && !BR2_sparc
+		depends on !BR2_arc && !BR2_avr32 && !BR2_bfin && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8
 		# PR60102 https://gcc.gnu.org/bugzilla/show_bug.cgi?id=60102
 		select BR2_GCC_NEEDS_MPC
 		select BR2_GCC_SUPPORTS_GRAPHITE
 		bool "gcc 4.9.x"
 
 	config BR2_GCC_VERSION_SNAP
-		depends on !BR2_arc && !BR2_avr32 && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8 && !BR2_sparc
+		depends on !BR2_arc && !BR2_avr32 && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8
 		select BR2_GCC_NEEDS_MPC
 		# musl patches only for gcc 4.7+
 		depends on !BR2_TOOLCHAIN_BUILDROOT_MUSL
-- 
1.7.10.4
