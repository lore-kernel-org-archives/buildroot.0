From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 17 Apr 2016 23:31:34 +0200
Subject: [Buildroot] [PATCH v2] arch/x86: remove support for i386
Message-ID: <1460928694-22593-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The Linux kernel doesn't even support i386 anymore, there is no NPTL
support for i386 and uClibc-ng only supports NPTL on x86, so there is
essentially no usable thread implementation. Most likely glibc and
musl also don't support i386 either. So it's time to remove the
support for this architecture variant.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
Changes since v1:
 - Add Config.in.legacy entry, as suggested by Arnout.
 - Remove i386 reference in qemu.mk, as noticed by Arnout.
---
 .defconfig                             | 1 -
 Config.in.legacy                       | 6 ++++++
 arch/Config.in.x86                     | 5 -----
 package/openssl/openssl.mk             | 5 -----
 package/qemu/qemu.mk                   | 1 -
 package/uclibc/Config.in               | 3 +--
 toolchain/toolchain-common.in          | 3 ---
 toolchain/toolchain-external/Config.in | 3 +--
 8 files changed, 8 insertions(+), 19 deletions(-)

diff --git a/.defconfig b/.defconfig
index 585be55..037647e 100644
--- a/.defconfig
+++ b/.defconfig
@@ -19,7 +19,6 @@ BR2_i386=y
 # BR2_sparc is not set
 # BR2_sparc64 is not set
 # BR2_x86_64 is not set
-# BR2_x86_i386 is not set
 # BR2_x86_i486 is not set
 # BR2_x86_i586 is not set
 BR2_x86_i686=y
diff --git a/Config.in.legacy b/Config.in.legacy
index 60702ce..b2bd034 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -145,6 +145,12 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2016.05"
 
+config BR2_x86_i386
+	bool "x86 i386 support removed"
+	help
+	  The support for the i386 processors of the x86 architecture
+	  has been removed.
+
 config BR2_PACKAGE_QT5WEBKIT_EXAMPLES
 	bool "qt5webkit-examples package removed"
 	select BR2_LEGACY
diff --git a/arch/Config.in.x86 b/arch/Config.in.x86
index 7be814b..4039db8 100644
--- a/arch/Config.in.x86
+++ b/arch/Config.in.x86
@@ -25,9 +25,6 @@ choice
 	help
 	  Specific CPU variant to use
 
-config BR2_x86_i386
-	bool "i386"
-	depends on !BR2_x86_64
 config BR2_x86_i486
 	bool "i486"
 	depends on !BR2_x86_64
@@ -210,7 +207,6 @@ config BR2_x86_winchip2
 endchoice
 
 config BR2_ARCH
-	default "i386"		if BR2_x86_i386
 	default "i486"		if BR2_x86_i486
 	default "i586"		if BR2_x86_i586
 	default "i586"		if BR2_x86_x1000
@@ -246,7 +242,6 @@ config BR2_ENDIAN
 	default "LITTLE"
 
 config BR2_GCC_TARGET_ARCH
-	default "i386"		if BR2_x86_i386
 	default "i486"		if BR2_x86_i486
 	default "i586"		if BR2_x86_i586
 	default "i586"		if BR2_x86_x1000
diff --git a/package/openssl/openssl.mk b/package/openssl/openssl.mk
index 30dfe31..3b8e525 100644
--- a/package/openssl/openssl.mk
+++ b/package/openssl/openssl.mk
@@ -53,11 +53,6 @@ ifeq ($(ARCH),x86_64)
 OPENSSL_TARGET_ARCH = x86_64
 endif
 
-# Workaround for bug #3445
-ifeq ($(BR2_x86_i386),y)
-OPENSSL_TARGET_ARCH = generic32 386
-endif
-
 define HOST_OPENSSL_CONFIGURE_CMDS
 	(cd $(@D); \
 		$(HOST_CONFIGURE_OPTS) \
diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index 4397367..522910e 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -23,7 +23,6 @@ HOST_QEMU_DEPENDENCIES = host-pkgconf host-python host-zlib host-libglib2 host-p
 #       arm             arm
 #       armeb           armeb
 #       bfin            not supported
-#       i386            i386
 #       i486            i386
 #       i586            i386
 #       i686            i386
diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
index eac5d05..efa84e9 100644
--- a/package/uclibc/Config.in
+++ b/package/uclibc/Config.in
@@ -71,7 +71,7 @@ choice
 		select BR2_TOOLCHAIN_HAS_THREADS
 		select BR2_TOOLCHAIN_HAS_THREADS_NPTL
 		depends on BR2_USE_MMU
-		depends on !BR2_m68k && !BR2_x86_i386
+		depends on !BR2_m68k
 endchoice
 
 config BR2_PTHREAD_DEBUG
@@ -176,7 +176,6 @@ config BR2_UCLIBC_POWERPC_TYPE
 config BR2_UCLIBC_X86_TYPE
 	string
 	depends on BR2_UCLIBC_TARGET_ARCH = "i386"
-	default "386"        if BR2_x86_i386
 	default "486"        if BR2_x86_i486
 	default "586"        if BR2_x86_i586
 	default "586MMX"     if BR2_x86_pentium_mmx
diff --git a/toolchain/toolchain-common.in b/toolchain/toolchain-common.in
index 0907c5e..7ad1c05 100644
--- a/toolchain/toolchain-common.in
+++ b/toolchain/toolchain-common.in
@@ -316,7 +316,6 @@ config BR2_TOOLCHAIN_GCC_AT_LEAST
 config BR2_TOOLCHAIN_HAS_SYNC_1
 	bool
 	default y
-	depends on !BR2_x86_i386
 	depends on !BR2_bfin
 	depends on !BR2_microblaze
 	depends on !BR2_sparc
@@ -330,7 +329,6 @@ config BR2_TOOLCHAIN_HAS_SYNC_4
 	bool
 	default y
 	depends on !BR2_sparc
-	depends on !BR2_x86_i386
 	depends on !(BR2_arc && !BR2_ARC_ATOMIC_EXT)
 
 # The availability of __sync for 8-byte types on ARM is somewhat
@@ -362,7 +360,6 @@ config BR2_TOOLCHAIN_X86_HAS_SYNC_8
 	bool
 	default y
 	depends on BR2_i386
-	depends on !BR2_x86_i386
 	depends on !BR2_x86_i486
 	depends on !BR2_x86_c3
 	depends on !BR2_x86_winchip_c6
diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index ff759a0..d6f57a1 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -615,8 +615,7 @@ config BR2_TOOLCHAIN_EXTERNAL_MUSL_CROSS
 	bool "Musl 1.1.12 toolchain (experimental)"
 	depends on (BR2_arm && BR2_ARM_EABI) || \
 		(BR2_arm && BR2_ARM_EABIHF && !BR2_ARM_CPU_ARMV4) || \
-		(BR2_armeb && BR2_ARM_EABI) || \
-		(BR2_i386 && !BR2_x86_i386) || \
+		(BR2_armeb && BR2_ARM_EABI) || BR2_i386 || \
 		(BR2_mips && !BR2_SOFT_FLOAT) || \
 		BR2_mipsel || (BR2_powerpc && BR2_powerpc_CLASSIC) || \
 		BR2_sh4 || BR2_sh4eb || \
-- 
2.6.4
