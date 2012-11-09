From: Chris Zankel <chris@zankel.net>
Date: Thu, 08 Nov 2012 22:33:28 -0800
Subject: [Buildroot] [PATCH 1/2 v2] xtensa: add support for the Xtensa
	architecture
Message-ID: <509ca3b9.e9c5440a.24b8.24a1@mx.google.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The Xtensa architecture had been removed because it required special
handling and depended on additional directories and files that became
obsolete over time. This change is more aligned to other architectures.

Signed-off-by: Chris Zankel <chris@zankel.net>

diff --git a/arch/Config.in b/arch/Config.in
index 4d1f81f..ad4a9e0 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -145,6 +145,13 @@ config BR2_x86_64
 	  architecture compatible microprocessor).
 	  http://en.wikipedia.org/wiki/X86_64
 
+config BR2_xtensa
+	bool "Xtensa"
+	help
+	  Xtensa is a Tensilica processor IP architecture.
+	  http://en.wikipedia.org/wiki/Xtensa
+	  http://www.tensilica.com/
+
 endchoice
 
 config BR2_microblaze
@@ -158,4 +165,5 @@ source "arch/Config.in.powerpc"
 source "arch/Config.in.sh"
 source "arch/Config.in.sparc"
 source "arch/Config.in.x86"
+source "arch/Config.in.xtensa"
 source "arch/Config.in.common"
diff --git a/arch/Config.in.common b/arch/Config.in.common
index 1ed9929..d2bfd59 100644
--- a/arch/Config.in.common
+++ b/arch/Config.in.common
@@ -49,6 +49,7 @@ config BR2_ARCH
 	default "sh4aeb"	if BR2_sh4aeb
 	default "sh64"		if BR2_sh64
 	default "sparc"		if BR2_sparc
+	default "xtensa"	if BR2_xtensa
 
 
 config BR2_ENDIAN
diff --git a/linux/Config.in b/linux/Config.in
index 277ef0e..29a2110 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -152,7 +152,8 @@ config BR2_LINUX_KERNEL_BZIMAGE
 
 config BR2_LINUX_KERNEL_ZIMAGE
 	bool "zImage"
-	depends on BR2_arm || BR2_armeb || BR2_powerpc || BR2_sparc || BR2_sh || BR2_sh64
+	depends on BR2_arm || BR2_armeb || BR2_powerpc || BR2_sparc || \
+		   BR2_sh || BR2_sh64 || BR2_xtensa
 
 config BR2_LINUX_KERNEL_APPENDED_ZIMAGE
 	bool "zImage with appended DT"
diff --git a/package/autoconf/Config.in b/package/autoconf/Config.in
index c304572..3622f3d 100644
--- a/package/autoconf/Config.in
+++ b/package/autoconf/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_AUTOCONF
 	bool "autoconf"
-	depends on !(BR2_avr32 || BR2_bfin || BR2_sh2 || BR2_sh2a || BR2_sh3 || BR2_sh3eb || BR2_sh64)
+	depends on !(BR2_avr32 || BR2_bfin || BR2_sh2 || BR2_sh2a || BR2_sh3)
+	depends on !(BR2_sh3eb || BR2_sh64 || BR2_xtensa)
 	select BR2_PACKAGE_PERL
 	help
 	  Extensible program for developing configure scripts.  These
@@ -9,4 +10,5 @@ config BR2_PACKAGE_AUTOCONF
 	  http://www.gnu.org/software/autoconf/
 
 comment "autoconf requires an architecture supported by qemu"
-	depends on BR2_avr32 || BR2_bfin || BR2_sh2 || BR2_sh2a || BR2_sh3 || BR2_sh3eb || BR2_sh64
+	depends on BR2_avr32 || BR2_bfin || BR2_sh2 || BR2_sh2a || BR2_sh3 || \
+		   BR2_sh3eb || BR2_sh64 || BR2_xtensa
diff --git a/package/automake/Config.in b/package/automake/Config.in
index f8d74ef..6e48517 100644
--- a/package/automake/Config.in
+++ b/package/automake/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_AUTOMAKE
 	bool "automake"
-	depends on !(BR2_avr32 || BR2_bfin || BR2_sh2 || BR2_sh2a || BR2_sh3 || BR2_sh3eb || BR2_sh64)
+	depends on !(BR2_avr32 || BR2_bfin || BR2_sh2 || BR2_sh2a || BR2_sh3)
+	depends on !(BR2_sh3eb || BR2_sh64 || BR2_xtensa)
 	select BR2_PACKAGE_AUTOCONF
 	select BR2_PACKAGE_PERL
 	help
@@ -10,4 +11,5 @@ config BR2_PACKAGE_AUTOMAKE
 	  http://www.gnu.org/software/automake/
 
 comment "automake requires an architecture supported by qemu"
-	depends on BR2_avr32 || BR2_bfin || BR2_sh2 || BR2_sh2a || BR2_sh3 || BR2_sh3eb || BR2_sh64
+	depends on BR2_avr32 || BR2_bfin || BR2_sh2 || BR2_sh2a || BR2_sh3 || \
+		   BR2_sh3eb || BR2_sh64 || BR2_xtensa
diff --git a/package/ltrace/Config.in b/package/ltrace/Config.in
index a65ca48..4cce767 100644
--- a/package/ltrace/Config.in
+++ b/package/ltrace/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_LTRACE
 	bool "ltrace"
 	depends on !(BR2_avr32 || BR2_mips || BR2_mipsel || BR2_sh || BR2_sh64)
+	depends on !BR2_xtensa
 	select BR2_PACKAGE_LIBELF
 	help
 	  Debugging program which runs a specified command until it exits.
diff --git a/package/perl/Config.in b/package/perl/Config.in
index 0642deb..2906714 100644
--- a/package/perl/Config.in
+++ b/package/perl/Config.in
@@ -7,6 +7,7 @@ config BR2_PACKAGE_PERL
 	depends on !BR2_sh3
 	depends on !BR2_sh3eb
 	depends on !BR2_sh64
+	depends on !BR2_xtensa
 	help
 	  Larry Wall's Practical Extraction and Report Language
 	  An interpreted scripting language, known among some as "Unix's Swiss
@@ -47,4 +48,5 @@ config BR2_PACKAGE_PERL_GDBM_FILE
 endif
 
 comment "perl requires an architecture supported by qemu"
-	depends on BR2_avr32 || BR2_bfin || BR2_sh2 || BR2_sh2a || BR2_sh3 || BR2_sh3eb || BR2_sh64
+	depends on BR2_avr32 || BR2_bfin || BR2_sh2 || BR2_sh2a || BR2_sh3 || \
+		   BR2_sh3eb || BR2_sh64 || BR2_xtensa
diff --git a/toolchain/Config.in b/toolchain/Config.in
index 29ed2f0..7edf82b 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -23,7 +23,7 @@ config BR2_TOOLCHAIN_EXTERNAL
 
 config BR2_TOOLCHAIN_CTNG
 	bool "Crosstool-NG toolchain"
-	depends on !BR2_microblaze && !BR2_aarch64
+	depends on !BR2_microblaze && !BR2_aarch64 && !BR2_xtensa
 	select BR2_TOOLCHAIN_HAS_SHADOW_PASSWORDS
 	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG_IF_NEEDED
 	help
diff --git a/toolchain/toolchain-common.in b/toolchain/toolchain-common.in
index 4c2a28b..9f11a39 100644
--- a/toolchain/toolchain-common.in
+++ b/toolchain/toolchain-common.in
@@ -93,7 +93,7 @@ config BR2_NEEDS_GETTEXT_IF_LOCALE
 	default y if (BR2_NEEDS_GETTEXT && BR2_ENABLE_LOCALE)
 
 config BR2_USE_MMU
-	bool "Enable MMU support" if BR2_arm || BR2_armeb || BR2_mips || BR2_mipsel || BR2_sh
+	bool "Enable MMU support" if BR2_arm || BR2_armeb || BR2_mips || BR2_mipsel || BR2_sh || BR2_xtensa
 	default y if !BR2_bfin
 	help
 	  If your target has a MMU, you should say Y here.  If you
diff --git a/toolchain/uClibc/uclibc.mk b/toolchain/uClibc/uclibc.mk
index 8cf59bc..055267c 100644
--- a/toolchain/uClibc/uclibc.mk
+++ b/toolchain/uClibc/uclibc.mk
@@ -38,6 +38,7 @@ UCLIBC_TARGET_ARCH:=$(shell $(SHELL) -c "echo $(ARCH) | sed \
 		-e 's/sh[234].*/sh/' \
 		-e 's/mips.*/mips/' \
 		-e 's/cris.*/cris/' \
+		-e 's/xtensa.*/xtensa/' \
 ")
 
 UCLIBC_TARGET_ENDIAN:=$(call qstrip,$(BR2_ENDIAN))
