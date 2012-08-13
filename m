From: Sonic Zhang <sonic.adi@gmail.com>
Date: Mon, 13 Aug 2012 15:41:13 +0800
Subject: [Buildroot] [PATCH 1/2] buildroot: target: Add Blackfin
	architecture support.
Message-ID: <1344843674-27814-1-git-send-email-sonic.adi@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Sonic Zhang <sonic.zhang@analog.com>

1) Add NOMMU option, blackfin cpu type option and install shared library
of different ABI option to target/Config.in.
2) Add makefile targets to install shared library of different ABI into
rootfs image.

Signed-off-by: Sonic Zhang <sonic.zhang@analog.com>
---
 target/Config.in.arch |   51 +++++++++++++++++++++++++++++++++++++++++++++++++
 target/Makefile.in    |   24 +++++++++++++++++++++++
 2 files changed, 75 insertions(+), 0 deletions(-)

diff --git a/target/Config.in.arch b/target/Config.in.arch
index 342066e..288cc9e 100644
--- a/target/Config.in.arch
+++ b/target/Config.in.arch
@@ -131,6 +131,19 @@ config BR2_xtensa
 	  http://www.tensilica.com/
 endchoice
 
+config BR2_ABI_FLAT
+	bool
+	default n
+
+config BR2_ABI_ELF
+	bool
+	default y
+	depends on !BR2_ABI_FLAT
+
+config BR2_NOMMU
+	bool "Target has no MMU support"
+	default n
+
 config BR2_microblaze
 	bool
 	default y if BR2_microblazeel || BR2_microblazebe
@@ -230,11 +243,43 @@ choice
 	default BR2_BFIN_FDPIC
 config BR2_BFIN_FDPIC
 	bool "FDPIC"
+	select BR2_ABI_ELF
 config BR2_BFIN_FLAT
 	bool "FLAT"
+	select BR2_ABI_FLAT
 	select BR2_PREFER_STATIC_LIB
+config BR2_BFIN_FLAT_SEP_DATA
+	bool "FLAT (Separate data)"
+	select BR2_ABI_FLAT
+	select BR2_PREFER_STATIC_LIB
+config BR2_BFIN_SHARED_FLAT
+	bool "Shared FLAT"
+	select BR2_ABI_FLAT
+	select BR2_PREFER_STATIC_LIB
+endchoice
+
+choice
+	prompt "Target Architecture Variant"
+	depends on BR2_bfin
+	default BR2_bf609
+	help
+	  Specific CPU variant to use
+config BR2_bf609
+	bool "bf609"
+config BR2_bf537
+	bool "bf537"
 endchoice
 
+config BR2_BFIN_INSTALL_ELF_SHARED
+	depends on BR2_bfin && !BR2_BFIN_FDPIC
+	bool "Install ELF shared libraries"
+	default y
+
+config BR2_BFIN_INSTALL_FLAT_SHARED
+	depends on BR2_bfin && !BR2_BFIN_SHARED_FLAT
+	bool "Install FLAT shared libraries"
+	default y
+
 choice
 	prompt "Target Architecture Variant"
 	depends on BR2_mips || BR2_mipsel
@@ -876,3 +921,9 @@ config BR2_GCC_TARGET_CPU
 	default sparchfleonv8	if BR2_sparc_sparchfleonv8
 	default sparcsfleon	if BR2_sparc_sparcsfleon
 	default sparcsfleonv8	if BR2_sparc_sparcsfleonv8
+	default bf609		if BR2_bf609
+	default bf537		if BR2_bf537
+
+config BR2_GCC_TARGET_CPU_REVISION
+	string "Target CPU revision"
+
diff --git a/target/Makefile.in b/target/Makefile.in
index 915d625..5c285ed 100644
--- a/target/Makefile.in
+++ b/target/Makefile.in
@@ -1,3 +1,27 @@
 # make sure to put everything that is board-specific before the tarroot targets
+TARGETS-y =
+TARGETS-$(BR2_BFIN_INSTALL_ELF_SHARED) += romfs.shared.libs.elf
+TARGETS-$(BR2_BFIN_INSTALL_FLAT_SHARED) += romfs.shared.libs.flat
+TARGETS += $(TARGETS-y)
+
+CROSS_COMPILE_SHARED_ELF ?= bfin-linux-uclibc-
+romfs.shared.libs.elf:
+	set -e; \
+	t=`$(CROSS_COMPILE_SHARED_ELF)gcc $(CPUFLAGS) -print-file-name=libc.a`; \
+	t=`dirname $$t`/../..; \
+	for i in $$t/lib/*so*; do \
+		i=`readlink -f "$$i"`; \
+		soname=`$(CROSS_COMPILE_SHARED_ELF)readelf -d "$$i" | sed -n '/(SONAME)/s:.*[[]\(.*\)[]].*:\1:p'`; \
+		$(INSTALL) -D $$i $(TARGET_DIR)/lib/$$soname; \
+	done
+
+CROSS_COMPILE_SHARED_FLAT ?= bfin-uclinux-
+romfs.shared.libs.flat:
+	set -e; \
+	t=`$(CROSS_COMPILE_SHARED_FLAT)gcc $(CPUFLAGS) -mid-shared-library -print-file-name=libc`; \
+	if [ -f $$t -a ! -h $$t ] ; then \
+		$(INSTALL) -D $$t $(TARGET_DIR)/lib/lib1.so; \
+	fi
+
 include target/generic/Makefile.in
 
-- 
1.7.0.4
