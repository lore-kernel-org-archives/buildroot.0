From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 11 Jul 2011 23:46:22 +0200
Subject: [Buildroot] [git commit] uboot: Add 2011.06, remove 2010.03
Message-ID: <20110711214654.C44BD8A482@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=e488c285b1839976e1d508d8be8c0208cc453f3e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 boot/uboot/Config.in                     |   10 +++++-----
 boot/uboot/uboot-2010.03-fix-avr32.patch |    5 -----
 boot/uboot/uboot.mk                      |    5 -----
 3 files changed, 5 insertions(+), 15 deletions(-)
 delete mode 100644 boot/uboot/uboot-2010.03-fix-avr32.patch

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index dbd4f34..070533e 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -12,10 +12,13 @@ config BR2_TARGET_UBOOT_BOARDNAME
 
 choice
 	prompt "U-Boot Version"
-	default BR2_TARGET_UBOOT_2011_03
+	default BR2_TARGET_UBOOT_2011_06
 	help
 	  Select the specific U-Boot version you want to use
 
+config BR2_TARGET_UBOOT_2011_06
+	bool "2011.06"
+
 config BR2_TARGET_UBOOT_2011_03
 	bool "2011.03"
 
@@ -28,9 +31,6 @@ config BR2_TARGET_UBOOT_2010_09
 config BR2_TARGET_UBOOT_2010_06
 	bool "2010.06"
 
-config BR2_TARGET_UBOOT_2010_03
-	bool "2010.03"
-
 config BR2_TARGET_UBOOT_CUSTOM_TARBALL
 	bool "Custom tarball"
 
@@ -48,11 +48,11 @@ endif
 
 config BR2_TARGET_UBOOT_VERSION
 	string
+	default "2011.06"	if BR2_TARGET_UBOOT_2011_06
 	default "2011.03"	if BR2_TARGET_UBOOT_2011_03
 	default "2010.12"	if BR2_TARGET_UBOOT_2010_12
 	default "2010.09"	if BR2_TARGET_UBOOT_2010_09
 	default "2010.06"	if BR2_TARGET_UBOOT_2010_06
-	default "2010.03"	if BR2_TARGET_UBOOT_2010_03
 	default "custom"	if BR2_TARGET_UBOOT_CUSTOM_TARBALL
 	default $BR2_TARGET_UBOOT_CUSTOM_GIT_VERSION if BR2_TARGET_UBOOT_CUSTOM_GIT
 
diff --git a/boot/uboot/uboot-2010.03-fix-avr32.patch b/boot/uboot/uboot-2010.03-fix-avr32.patch
deleted file mode 100644
index 1f9aab8..0000000
--- a/boot/uboot/uboot-2010.03-fix-avr32.patch
+++ /dev/null
@@ -1,5 +0,0 @@
-diff -Naur u-boot-2010.03-orig/include/asm-avr32/unaligned.h u-boot-2010.03/include/asm-avr32/unaligned.h
---- u-boot-2010.03-orig/include/asm-avr32/unaligned.h	1969-12-31 21:00:00.000000000 -0300
-+++ u-boot-2010.03/include/asm-avr32/unaligned.h	2010-06-22 23:09:49.000000000 -0300
-@@ -0,0 +1 @@
-+#include <asm-generic/unaligned.h>
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index e87727b..ec592e1 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -33,11 +33,6 @@ endif
 
 UBOOT_ARCH=$(KERNEL_ARCH)
 
-# u-boot in the past used arch=ppc for powerpc
-ifneq ($(findstring x2010.03,x$(UBOOT_VERSION)),)
-UBOOT_ARCH=$(KERNEL_ARCH:powerpc=ppc)
-endif
-
 UBOOT_CONFIGURE_OPTS += CONFIG_NOSOFTFLOAT=1
 UBOOT_MAKE_OPTS += \
 	CROSS_COMPILE="$(CCACHE) $(TARGET_CROSS)" \
-- 
1.7.3.4
