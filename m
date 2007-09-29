From: aldot at uclibc.org <aldot@uclibc.org>
Date: Sat, 29 Sep 2007 12:17:40 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot: target target/device/Arm
	target/device/A etc...
Message-ID: <20070929191740.D349BA45A9@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-09-29 12:17:39 -0700 (Sat, 29 Sep 2007)
New Revision: 20119

Log:
- add mips/mipsel target architecture selection
- rename BR2_ARM_[EO]ABI to the commonly used BR2_[EO]ABI


Modified:
   trunk/buildroot/target/Config.in.arch
   trunk/buildroot/target/device/Arm/Config.in
   trunk/buildroot/target/device/Arm/Makefile.in
   trunk/buildroot/target/device/Arm/integrator926_defconfig
   trunk/buildroot/target/device/Arm/integrator926_huge_defconfig
   trunk/buildroot/target/device/Atmel/at91rm9200df/at91rm9200df_defconfig
   trunk/buildroot/target/device/Atmel/at91sam9260dfc/at91sam9260dfc_defconfig
   trunk/buildroot/target/device/Atmel/at91sam9260pf/at91sam9260pf_defconfig
   trunk/buildroot/target/device/Atmel/at91sam9261ek/at91sam9261ek_defconfig
   trunk/buildroot/target/linux-experimental/Makefile.in
   trunk/buildroot/target/linux/Makefile.in
   trunk/buildroot/toolchain/uClibc/uclibc.mk


Changeset:
Modified: trunk/buildroot/target/Config.in.arch
===================================================================
--- trunk/buildroot/target/Config.in.arch	2007-09-29 18:27:14 UTC (rev 20118)
+++ trunk/buildroot/target/Config.in.arch	2007-09-29 19:17:39 UTC (rev 20119)
@@ -111,18 +111,59 @@
 choice
 	prompt "Target ABI"
 	depends BR2_arm || BR2_armeb
-	default BR2_ARM_OABI
+	default BR2_OABI
 	help
 	  Application Binary Interface to use
 
-config BR2_ARM_OABI
+config BR2_OABI
 	bool "OABI"
-config BR2_ARM_EABI
+config BR2_EABI
 	bool "EABI"
 endchoice
 
 choice
 	prompt "Target Architecture Variant"
+	depends BR2_mips || BR2_mipsel
+	default BR2_mips_3
+	help
+	  Specific CPU variant to use
+
+config BR2_mips_1
+	bool "mips 1"
+config BR2_mips_2
+	bool "mips 2"
+config BR2_mips_3
+	bool "mips 3"
+config BR2_mips_4
+	bool "mips 4"
+config BR2_mips_32
+	bool "mips 32"
+config BR2_mips_32r2
+	bool "mips 32r2"
+config BR2_mips_64
+	bool "mips 64"
+config BR2_mips16_
+	bool "mips 16"
+endchoice
+
+
+choice
+	prompt "Target ABI"
+	depends BR2_mips || BR2_mipsel
+	default BR2_EABI
+	help
+	  Application Binary Interface to use
+
+config BR2_OABI
+	bool "OABI"
+config BR2_EABI
+	bool "EABI"
+config BR2_ABI64
+	bool "N64"
+endchoice
+
+choice
+	prompt "Target Architecture Variant"
 	depends BR2_avr32
 config BR2_at32ap7000
 	bool "AT32AP7000"
@@ -642,11 +683,11 @@
 	default aapcs		if BR2_arm_dunno
 	default aapcs-linux	if BR2_arm_dunno
 	default iwmmxt		if BR2_iwmmxt
-	default 32		if BR2_mipsel && BR2_OABI
+	default 32		if (BR2_mipsel || BR2_arm) && BR2_OABI
 	default n32		if BR2_mipsel && BR2_EABI
 	default o64		if BR2_mips && BR2_OABI
+	default eabi		if (BR2_mips || BR2_arm) && BR2_EABI
 	default 64		if BR2_mips && BR2_ABI64
-	default eabi		if BR2_mips && BR2_EABI
 	default mmixware	if BR2_mmix && BR2_ABI_native
 	default gnu		if BR2_mmix && !BR2_ABI_native
 	default altivec		if BR2_powerpc && BR2_ABI_altivec

Modified: trunk/buildroot/target/device/Arm/Config.in
===================================================================
--- trunk/buildroot/target/device/Arm/Config.in	2007-09-29 18:27:14 UTC (rev 20118)
+++ trunk/buildroot/target/device/Arm/Config.in	2007-09-29 19:17:39 UTC (rev 20119)
@@ -12,8 +12,8 @@
 	depends BR2_arm
 	default n
 	select BR2_PACKAGE_LINUX
-	select BR2_ARM_EABI
-	select BR2_KERNEL_HEADERS_2_6_20
+	select BR2_EABI
+	select BR2_KERNEL_HEADERS_2_6_22
 	select BR2_PTHREADS
 	select BR2_arm926t
 	help

Modified: trunk/buildroot/target/device/Arm/Makefile.in
===================================================================
--- trunk/buildroot/target/device/Arm/Makefile.in	2007-09-29 18:27:14 UTC (rev 20118)
+++ trunk/buildroot/target/device/Arm/Makefile.in	2007-09-29 19:17:39 UTC (rev 20119)
@@ -7,7 +7,7 @@
 endif
 
 # pin some settings
-BR2_ARM_EABI:=y
+BR2_EABI:=y
 BR2_GNU_TARGET_SUFFIX:="linux-uclibcgnueabi"
 BR2_DEFAULT_KERNEL_HEADERS:="2.6.22.8"
 endif

Modified: trunk/buildroot/target/device/Arm/integrator926_defconfig
===================================================================
--- trunk/buildroot/target/device/Arm/integrator926_defconfig	2007-09-29 18:27:14 UTC (rev 20118)
+++ trunk/buildroot/target/device/Arm/integrator926_defconfig	2007-09-29 19:17:39 UTC (rev 20119)
@@ -39,8 +39,8 @@
 # BR2_xscale is not set
 # BR2_iwmmxt is not set
 BR2_ARM_TYPE="ARM926T"
-# BR2_ARM_OABI is not set
-BR2_ARM_EABI=y
+# BR2_OABI is not set
+BR2_EABI=y
 # BR2_x86_i386 is not set
 # BR2_x86_i486 is not set
 # BR2_x86_i586 is not set

Modified: trunk/buildroot/target/device/Arm/integrator926_huge_defconfig
===================================================================
--- trunk/buildroot/target/device/Arm/integrator926_huge_defconfig	2007-09-29 18:27:14 UTC (rev 20118)
+++ trunk/buildroot/target/device/Arm/integrator926_huge_defconfig	2007-09-29 19:17:39 UTC (rev 20119)
@@ -39,8 +39,8 @@
 # BR2_xscale is not set
 # BR2_iwmmxt is not set
 BR2_ARM_TYPE="ARM926T"
-# BR2_ARM_OABI is not set
-BR2_ARM_EABI=y
+# BR2_OABI is not set
+BR2_EABI=y
 BR2_ARCH="arm"
 BR2_ENDIAN="LITTLE"
 BR2_GCC_TARGET_TUNE="arm9tdmi"

Modified: trunk/buildroot/target/device/Atmel/at91rm9200df/at91rm9200df_defconfig
===================================================================
--- trunk/buildroot/target/device/Atmel/at91rm9200df/at91rm9200df_defconfig	2007-09-29 18:27:14 UTC (rev 20118)
+++ trunk/buildroot/target/device/Atmel/at91rm9200df/at91rm9200df_defconfig	2007-09-29 19:17:39 UTC (rev 20119)
@@ -153,8 +153,8 @@
 BR2_GCC_SUPPORTS_SYSROOT=y
 # BR2_GCC_SUPPORTS_FINEGRAINEDMTUNE is not set
 BR2_GCC_VERSION="4.2.1"
-BR2_ARM_OABI=y
-# BR2_ARM_EABI is not set
+BR2_OABI=y
+# BR2_EABI is not set
 BR2_TOOLCHAIN_SYSROOT=y
 # BR2_GCC_USE_SJLJ_EXCEPTIONS is not set
 BR2_EXTRA_GCC_CONFIG_OPTIONS=""

Modified: trunk/buildroot/target/device/Atmel/at91sam9260dfc/at91sam9260dfc_defconfig
===================================================================
--- trunk/buildroot/target/device/Atmel/at91sam9260dfc/at91sam9260dfc_defconfig	2007-09-29 18:27:14 UTC (rev 20118)
+++ trunk/buildroot/target/device/Atmel/at91sam9260dfc/at91sam9260dfc_defconfig	2007-09-29 19:17:39 UTC (rev 20119)
@@ -42,8 +42,8 @@
 # BR2_xscale is not set
 # BR2_iwmmxt is not set
 BR2_ARM_TYPE="GENERIC_ARM"
-BR2_ARM_OABI=y
-# BR2_ARM_EABI is not set
+BR2_OABI=y
+# BR2_EABI is not set
 BR2_ARCH="arm"
 BR2_ENDIAN="LITTLE"
 

Modified: trunk/buildroot/target/device/Atmel/at91sam9260pf/at91sam9260pf_defconfig
===================================================================
--- trunk/buildroot/target/device/Atmel/at91sam9260pf/at91sam9260pf_defconfig	2007-09-29 18:27:14 UTC (rev 20118)
+++ trunk/buildroot/target/device/Atmel/at91sam9260pf/at91sam9260pf_defconfig	2007-09-29 19:17:39 UTC (rev 20119)
@@ -44,8 +44,8 @@
 # BR2_xscale is not set
 # BR2_iwmmxt is not set
 BR2_ARM_TYPE="GENERIC_ARM"
-BR2_ARM_OABI=y
-# BR2_ARM_EABI is not set
+BR2_OABI=y
+# BR2_EABI is not set
 BR2_ARCH="arm"
 BR2_ENDIAN="LITTLE"
 

Modified: trunk/buildroot/target/device/Atmel/at91sam9261ek/at91sam9261ek_defconfig
===================================================================
--- trunk/buildroot/target/device/Atmel/at91sam9261ek/at91sam9261ek_defconfig	2007-09-29 18:27:14 UTC (rev 20118)
+++ trunk/buildroot/target/device/Atmel/at91sam9261ek/at91sam9261ek_defconfig	2007-09-29 19:17:39 UTC (rev 20119)
@@ -44,8 +44,8 @@
 # BR2_xscale is not set
 # BR2_iwmmxt is not set
 BR2_ARM_TYPE="GENERIC_ARM"
-BR2_ARM_OABI=y
-# BR2_ARM_EABI is not set
+BR2_OABI=y
+# BR2_EABI is not set
 BR2_ARCH="arm"
 BR2_ENDIAN="LITTLE"
 

Modified: trunk/buildroot/target/linux/Makefile.in
===================================================================
--- trunk/buildroot/target/linux/Makefile.in	2007-09-29 18:27:14 UTC (rev 20118)
+++ trunk/buildroot/target/linux/Makefile.in	2007-09-29 19:17:39 UTC (rev 20119)
@@ -148,7 +148,7 @@
 $(LINUX26_DIR)/.configured: $(LINUX26_DIR)/.patched $(LINUX26_KCONFIG)
 	cp -dpf $(LINUX26_KCONFIG) $(LINUX26_DIR)/.config
 	$(SED) '/CONFIG_AEABI=y/d' $(LINUX26_DIR)/.config
-ifeq ($(BR2_ARM_EABI),y)
+ifeq ($(BR2_EABI),y)
 	echo "CONFIG_AEABI=y" >> $(LINUX26_DIR)/.config
 	$(SED) '/CONFIG_OABI_COMPAT/d' $(LINUX26_DIR)/.config
 	echo "# CONFIG_OABI_COMPAT is not set" >> $(LINUX26_DIR)/.config

Modified: trunk/buildroot/target/linux-experimental/Makefile.in
===================================================================
--- trunk/buildroot/target/linux-experimental/Makefile.in	2007-09-29 18:27:14 UTC (rev 20118)
+++ trunk/buildroot/target/linux-experimental/Makefile.in	2007-09-29 19:17:39 UTC (rev 20119)
@@ -184,7 +184,7 @@
 	make -C $(LINUX26_DIR) xconfig
 endif
 	$(SED) '/CONFIG_AEABI/d' $(LINUX26_DIR)/.config
-ifeq ($(BR2_ARM_EABI),y)
+ifeq ($(BR2_EABI),y)
 	echo "CONFIG_AEABI=y" >> $(LINUX26_DIR)/.config
 	$(SED) '/CONFIG_OABI_COMPAT/d' $(LINUX26_DIR)/.config
 	echo "# CONFIG_OABI_COMPAT is not set" >> $(LINUX26_DIR)/.config

Modified: trunk/buildroot/toolchain/uClibc/uclibc.mk
===================================================================
--- trunk/buildroot/toolchain/uClibc/uclibc.mk	2007-09-29 18:27:14 UTC (rev 20118)
+++ trunk/buildroot/toolchain/uClibc/uclibc.mk	2007-09-29 19:17:39 UTC (rev 20119)
@@ -127,7 +127,7 @@
 	cp -f $(UCLIBC_CONFIG_FILE) $(UCLIBC_DIR)/.oldconfig
 	$(SED) 's,^CROSS_COMPILER_PREFIX=.*,CROSS_COMPILER_PREFIX="$(TARGET_CROSS)",g' \
 		-e 's,# TARGET_$(UCLIBC_TARGET_ARCH) is not set,TARGET_$(UCLIBC_TARGET_ARCH)=y,g' \
-		-e 's,^TARGET_ARCH="none",TARGET_ARCH=\"$(UCLIBC_TARGET_ARCH)\",g' \
+		-e 's,^TARGET_ARCH=".*",TARGET_ARCH=\"$(UCLIBC_TARGET_ARCH)\",g' \
 		-e 's,^KERNEL_SOURCE=.*,KERNEL_SOURCE=\"$(LINUX_HEADERS_DIR)\",g' \
 		-e 's,^KERNEL_HEADERS=.*,KERNEL_HEADERS=\"$(LINUX_HEADERS_DIR)/include\",g' \
 		-e 's,^RUNTIME_PREFIX=.*,RUNTIME_PREFIX=\"/\",g' \
@@ -139,15 +139,31 @@
 		 $(UCLIBC_DIR)/.oldconfig
 	$(SED) 's/^.*$(UCLIBC_ARM_TYPE).*/$(UCLIBC_ARM_TYPE)=y/g' $(UCLIBC_DIR)/.oldconfig
 	$(SED) '/CONFIG_ARM_.ABI/d' $(UCLIBC_DIR)/.oldconfig
-ifeq ($(BR2_ARM_EABI),y)
+ifeq ($(BR2_EABI),y)
 	/bin/echo "# CONFIG_ARM_OABI is not set" >> $(UCLIBC_DIR)/.oldconfig
 	/bin/echo "CONFIG_ARM_EABI=y" >> $(UCLIBC_DIR)/.oldconfig
 endif
-ifeq ($(BR2_ARM_OABI),y)
+ifeq ($(BR2_OABI),y)
 	/bin/echo "CONFIG_ARM_OABI=y" >> $(UCLIBC_DIR)/.oldconfig
 	/bin/echo "# CONFIG_ARM_EABI is not set" >> $(UCLIBC_DIR)/.oldconfig
 endif
 endif
+ifeq ($(UCLIBC_TARGET_ARCH),mips)
+	$(SED) '/CONFIG_MIPS_[NO].._ABI/d' $(UCLIBC_DIR)/.oldconfig
+	(/bin/echo "# CONFIG_MIPS_O32_ABI is not set"; \
+	 /bin/echo "# CONFIG_MIPS_N32_ABI is not set"; \
+	 /bin/echo "# CONFIG_MIPS_N64_ABI is not set"; \
+	) >> $(UCLIBC_DIR)/.oldconfig
+ifeq ($(BR2_OABI),y)
+	$(SED) 's/.*\(CONFIG_MIPS_O32_ABI\).*/\1=y/' $(UCLIBC_DIR)/.oldconfig
+endif
+ifeq ($(BR2_EABI),y)
+	$(SED) 's/.*\(CONFIG_MIPS_N32_ABI\).*/\1=y/' $(UCLIBC_DIR)/.oldconfig
+endif
+ifeq ($(BR2_ABI64),y)
+	$(SED) 's/.*\(CONFIG_MIPS_N64_ABI\).*/\1=y/' $(UCLIBC_DIR)/.oldconfig
+endif
+endif
 ifeq ($(UCLIBC_TARGET_ARCH),sh)
 	/bin/echo "# CONFIG_SH2A is not set" >> $(UCLIBC_DIR)/.oldconfig
 	/bin/echo "# CONFIG_SH2 is not set" >> $(UCLIBC_DIR)/.oldconfig
