From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 15 Nov 2012 16:39:43 +0100
Subject: [Buildroot] [git commit] xtensa: add support for the Xtensa
	architecture
Message-ID: <20121115154219.3B7139A015@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=75720db391376ef23b92e504c43f9972efd53141
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The Xtensa architecture had been removed because it required special
handling and depended on additional directories and files that became
obsolete over time. This change is more aligned to other architectures.

[Thomas: rebased on top of the "arch: improve definition of gcc mtune,
mcpu, etc." patch].

Signed-off-by: Chris Zankel <chris@zankel.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 arch/Config.in                            |   11 +++++++++++
 arch/Config.in.xtensa                     |    2 ++
 linux/Config.in                           |    3 ++-
 package/ltrace/Config.in                  |    1 +
 toolchain/Config.in                       |    2 +-
 toolchain/toolchain-buildroot/Config.in.2 |    4 +++-
 toolchain/toolchain-common.in             |    2 +-
 toolchain/uClibc/Config.in                |    5 +++--
 toolchain/uClibc/uclibc.mk                |    1 +
 9 files changed, 25 insertions(+), 6 deletions(-)

diff --git a/arch/Config.in b/arch/Config.in
index b326cb5..472b10c 100644
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
 
 # The following string values are defined by the individual
@@ -210,3 +217,7 @@ endif
 if BR2_i386 || BR2_x86_64
 source "arch/Config.in.x86"
 endif
+
+if BR2_xtensa
+source "arch/Config.in.xtensa"
+endif
diff --git a/arch/Config.in.xtensa b/arch/Config.in.xtensa
new file mode 100644
index 0000000..66749ee
--- /dev/null
+++ b/arch/Config.in.xtensa
@@ -0,0 +1,2 @@
+config BR2_ARCH
+	default "xtensa"	if BR2_xtensa
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
diff --git a/toolchain/toolchain-buildroot/Config.in.2 b/toolchain/toolchain-buildroot/Config.in.2
index 956ec2f..d27c9f3 100644
--- a/toolchain/toolchain-buildroot/Config.in.2
+++ b/toolchain/toolchain-buildroot/Config.in.2
@@ -68,7 +68,7 @@ config BR2_TOOLCHAIN_BUILDROOT_USE_SSP
 
 choice
 	prompt "Thread library implementation"
-	default BR2_PTHREADS_NATIVE if (!BR2_UCLIBC_VERSION_0_9_31) && !BR2_ARM_OABI
+	default BR2_PTHREADS_NATIVE if (!BR2_UCLIBC_VERSION_0_9_31) && !BR2_ARM_OABI && !BR2_xtensa
 	default BR2_PTHREADS_OLD
 	help
 	  Use this option to select the thread library implementation
@@ -82,6 +82,7 @@ choice
 
 	config BR2_PTHREADS
 		bool "linuxthreads"
+		depends on !BR2_xtensa
 	        select BR2_TOOLCHAIN_HAS_THREADS
 
 	config BR2_PTHREADS_OLD
@@ -94,6 +95,7 @@ choice
 		depends on !BR2_UCLIBC_VERSION_0_9_31
 		depends on !BR2_ARM_OABI
 		depends on !BR2_x86_i386
+		depends on !BR2_xtensa
 endchoice
 
 source "toolchain/elf2flt/Config.in"
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
diff --git a/toolchain/uClibc/Config.in b/toolchain/uClibc/Config.in
index f46a415..e47bc9b 100644
--- a/toolchain/uClibc/Config.in
+++ b/toolchain/uClibc/Config.in
@@ -12,14 +12,15 @@ choice
 
 	config BR2_UCLIBC_VERSION_0_9_31
 		bool "uClibc 0.9.31.x"
+		depends on !BR2_xtensa
 
 	config BR2_UCLIBC_VERSION_0_9_32
 		bool "uClibc 0.9.32.x"
-		depends on !(BR2_avr32 || BR2_sh)
+		depends on !(BR2_avr32 || BR2_sh || BR2_xtensa)
 
 	config BR2_UCLIBC_VERSION_0_9_33
 		bool "uClibc 0.9.33.x"
-		depends on !BR2_avr32
+		depends on !(BR2_avr32 || BR2_xtensa)
 
 	config BR2_UCLIBC_VERSION_SNAPSHOT
 		bool "daily snapshot"
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
