From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 11 Apr 2013 09:22:48 +0200
Subject: [Buildroot] [git commit] toolchain/arm: drop generic and old,
	add fa526/626, unify strongarm
Message-ID: <20130411081131.AF15C9A809@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9474421da36d8602f56b84b150e4cf4c78e788b3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

* Add Faraday FA526/626 as suggested on bug #1291
Note however that these cores are v4 and NOT v4t.

* Make the sa110 & sa1110 cores -> strongarm since they're the same.

* Drop all of the ARM variants lower than v4 including generic, there's
no point in supporting obsolete targets.

* Fix uClibc USE_BX logic, it was always on, this would break the new
FA526/626 support and broke StrongARM since it's a v4 core.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 Config.in.legacy                      |   16 ++++++++++++++++
 arch/Config.in.arm                    |   29 +++++++++--------------------
 toolchain/gcc/Config.in               |    6 +++---
 toolchain/uClibc/Config.in            |    7 ++-----
 toolchain/uClibc/uClibc-0.9.31.config |    2 +-
 toolchain/uClibc/uclibc.mk            |    3 +++
 6 files changed, 34 insertions(+), 29 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 43e2afe..4cd62b8 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -44,6 +44,22 @@ endif
 # Legacy options since 2013.02
 #
 
+config BR2_sa110
+	bool "sa110 ARM target switched to strongarm"
+	select BR2_LEGACY
+	select BR2_strongarm
+	help
+	  The SA110 is the same as a generic StrongARM, it just differs
+	  in speed, peripherals and cache.
+
+config BR2_sa1100
+	bool "sa1100 ARM target switched to strongarm"
+	select BR2_LEGACY
+	select BR2_strongarm
+	help
+	  The SA1100 is the same as a generic StrongARM, it just differs
+	  in speed, peripherals and cache.
+
 config BR2_PACKAGE_GDISK
 	bool "gdisk has been replaced by gptfdisk"
 	select BR2_LEGACY
diff --git a/arch/Config.in.arm b/arch/Config.in.arm
index 79f08f7..f706dcc 100644
--- a/arch/Config.in.arm
+++ b/arch/Config.in.arm
@@ -9,18 +9,12 @@ config BR2_ARM_CPU_MAYBE_HAS_NEON
 choice
 	prompt "Target Architecture Variant"
 	depends on BR2_arm || BR2_armeb
-	default BR2_generic_arm
+	default BR2_arm926t
 	help
 	  Specific CPU variant to use
 
-config BR2_generic_arm
-	bool "generic_arm"
 config BR2_arm7tdmi
 	bool "arm7tdmi"
-config BR2_arm610
-	bool "arm610"
-config BR2_arm710
-	bool "arm710"
 config BR2_arm720t
 	bool "arm720t"
 config BR2_arm920t
@@ -51,10 +45,10 @@ config BR2_cortex_a9
 config BR2_cortex_a15
 	bool "cortex-A15"
 	select BR2_ARM_CPU_HAS_NEON
-config BR2_sa110
-	bool "sa110"
-config BR2_sa1100
-	bool "sa1100"
+config BR2_fa526
+	bool "fa526/626"
+config BR2_strongarm
+	bool "strongarm sa110/sa1100"
 config BR2_xscale
 	bool "xscale"
 config BR2_iwmmxt
@@ -105,9 +99,6 @@ config BR2_ENDIAN
 	default "BIG"	 if BR2_armeb
 
 config BR2_GCC_TARGET_TUNE
-	default "arm600"	if BR2_arm600
-	default "arm610"	if BR2_arm610
-	default "arm620"	if BR2_arm620
 	default "arm7tdmi"	if BR2_arm7tdmi
 	default "arm7tdmi"	if BR2_arm720t
 	default "arm7tdmi"	if BR2_arm740t
@@ -123,15 +114,13 @@ config BR2_GCC_TARGET_TUNE
 	default "cortex-a8"	if BR2_cortex_a8
 	default "cortex-a9"	if BR2_cortex_a9
 	default "cortex-a15"	if BR2_cortex_a15
-	default "strongarm110"	if BR2_sa110
-	default "strongarm1100"	if BR2_sa1100
+	default "fa526"		if BR2_fa526
+	default "strongarm"	if BR2_strongarm
 	default "xscale"	if BR2_xscale
 	default "iwmmxt"	if BR2_iwmmxt
 
 config BR2_GCC_TARGET_ARCH
 	default "armv4t"	if BR2_arm7tdmi
-	default "armv3"		if BR2_arm610
-	default "armv3"		if BR2_arm710
 	default "armv4t"	if BR2_arm720t
 	default "armv4t"	if BR2_arm920t
 	default "armv4t"	if BR2_arm922t
@@ -145,8 +134,8 @@ config BR2_GCC_TARGET_ARCH
 	default "armv7-a"	if BR2_cortex_a8
 	default "armv7-a"	if BR2_cortex_a9
 	default "armv7-a"	if BR2_cortex_a15
-	default "armv4"		if BR2_sa110
-	default "armv4"		if BR2_sa1100
+	default "armv4"		if BR2_fa526
+	default "armv4"		if BR2_strongarm
 	default "armv5te"	if BR2_xscale
 	default "iwmmxt"	if BR2_iwmmxt
 
diff --git a/toolchain/gcc/Config.in b/toolchain/gcc/Config.in
index f8cb82a..527288f 100644
--- a/toolchain/gcc/Config.in
+++ b/toolchain/gcc/Config.in
@@ -18,15 +18,15 @@ choice
 	       bool "gcc 4.2.2-avr32-2.1.5"
 
 	config BR2_GCC_VERSION_4_3_X
-		depends on !BR2_avr32 && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8 && !BR2_cortex_a5 && !BR2_cortex_a8 && !BR2_cortex_a9 && !BR2_cortex_a15 && !BR2_x86_atom && !BR2_powerpc_e300c2 && !BR2_powerpc_e300c3 && !BR2_powerpc_e500mc && !BR2_powerpc_464 && !BR2_powerpc_464fp && !BR2_powerpc_476 && !BR2_powerpc_476fp
+		depends on !BR2_avr32 && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8 && !BR2_cortex_a5 && !BR2_cortex_a8 && !BR2_cortex_a9 && !BR2_cortex_a15 && !BR2_x86_atom && !BR2_powerpc_e300c2 && !BR2_powerpc_e300c3 && !BR2_powerpc_e500mc && !BR2_powerpc_464 && !BR2_powerpc_464fp && !BR2_powerpc_476 && !BR2_powerpc_476fp && !BR2_fa526
 		bool "gcc 4.3.x"
 
 	config BR2_GCC_VERSION_4_4_X
-		depends on !BR2_avr32 && !BR2_cortex_a5 && !BR2_cortex_a15 && !BR2_x86_atom && !BR2_powerpc_476 && !BR2_powerpc_476fp
+		depends on !BR2_avr32 && !BR2_cortex_a5 && !BR2_cortex_a15 && !BR2_x86_atom && !BR2_powerpc_476 && !BR2_powerpc_476fp && !BR2_fa526
 		bool "gcc 4.4.x"
 
 	config BR2_GCC_VERSION_4_5_X
-		depends on !BR2_avr32 && !BR2_cortex_a15 && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8
+		depends on !BR2_avr32 && !BR2_cortex_a15 && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8 && !BR2_fa526
 		select BR2_GCC_NEEDS_MPC
 		bool "gcc 4.5.x"
 
diff --git a/toolchain/uClibc/Config.in b/toolchain/uClibc/Config.in
index 57c9933..b53bb24 100644
--- a/toolchain/uClibc/Config.in
+++ b/toolchain/uClibc/Config.in
@@ -81,9 +81,7 @@ config BR2_UCLIBC_INSTALL_TEST_SUITE
 config BR2_UCLIBC_ARM_TYPE
 	string
 	depends on BR2_arm || BR2_armeb
-	default GENERIC_ARM	if BR2_generic_arm
-	default ARM610		if BR2_arm610
-	default ARM710		if BR2_arm710
+	default GENERIC_ARM	if BR2_fa526
 	default ARM7TDMI	if BR2_arm7tdmi
 	default ARM720T		if BR2_arm720t
 	default ARM920T		if BR2_arm920t
@@ -93,8 +91,7 @@ config BR2_UCLIBC_ARM_TYPE
 	default ARM1136JF_S	if BR2_arm1136jf_s
 	default ARM1176JZ_S	if BR2_arm1176jz_s
 	default ARM1176JZF_S	if BR2_arm1176jzf_s
-	default ARM_SA110	if BR2_sa110
-	default ARM_SA1100	if BR2_sa1100
+	default ARM_SA1100	if BR2_strongarm
 	default ARM_XSCALE	if BR2_xscale
 	default ARM_IWMMXT	if BR2_iwmmxt
 	default ARM_CORTEXA8	if BR2_cortex_a8
diff --git a/toolchain/uClibc/uClibc-0.9.31.config b/toolchain/uClibc/uClibc-0.9.31.config
index 2f363db..e990178 100644
--- a/toolchain/uClibc/uClibc-0.9.31.config
+++ b/toolchain/uClibc/uClibc-0.9.31.config
@@ -238,7 +238,7 @@ WARNINGS="-Wall"
 # DOMULTI is not set
 # UCLIBC_MJN3_ONLY is not set
 
-# USE_BX is not set
+USE_BX=y
 # CONFIG_GENERIC_ARM is not set
 # CONFIG_ARM610 is not set
 # CONFIG_ARM710 is not set
diff --git a/toolchain/uClibc/uclibc.mk b/toolchain/uClibc/uclibc.mk
index e8b2bb4..113dc79 100644
--- a/toolchain/uClibc/uclibc.mk
+++ b/toolchain/uClibc/uclibc.mk
@@ -130,6 +130,9 @@ ifeq ($(BR2_ARM_OABI),y)
 	/bin/echo "CONFIG_ARM_OABI=y" >> $(UCLIBC_DIR)/.oldconfig
 	/bin/echo "# CONFIG_ARM_EABI is not set" >> $(UCLIBC_DIR)/.oldconfig
 endif
+ifeq ($(BR2_fa526)$(BR2_strongarm),y)
+	$(SED) 's,USE_BX=y,# USE_BX is not set,' $(UCLIBC_DIR)/.oldconfig
+endif
 endif
 ifeq ($(UCLIBC_TARGET_ARCH),mips)
 	$(SED) '/CONFIG_MIPS_[NO].._ABI/d' $(UCLIBC_DIR)/.oldconfig
