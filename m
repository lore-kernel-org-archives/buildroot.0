From: Waldemar Brodkorb <wbx@openadk.org>
Date: Fri, 3 Feb 2017 15:16:58 +0100
Subject: [Buildroot] [PATCH] uclibc: enable mips{32,64}r6 support
Message-ID: <20170203141658.GA9200@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The config for ISA choice is removed for a long time as
the buildsystem does not pass -march=mips* to the compiler anymore.
For mips{32,64}r6 support NAN selection is required.

Tested with qemu mips32/mips64 defconfigs.

A small patch is required. Bug found while testing qemu defconfigs.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 ...0001-fstat-make-new-code-aarch64-specific.patch | 29 ++++++++++++++++++++++
 package/uclibc/Config.in                           |  7 +++---
 package/uclibc/uclibc.mk                           | 10 ++++----
 toolchain/toolchain-buildroot/Config.in            |  2 --
 4 files changed, 37 insertions(+), 11 deletions(-)
 create mode 100644 package/uclibc/0001-fstat-make-new-code-aarch64-specific.patch

diff --git a/package/uclibc/0001-fstat-make-new-code-aarch64-specific.patch b/package/uclibc/0001-fstat-make-new-code-aarch64-specific.patch
new file mode 100644
index 0000000..eb0198d
--- /dev/null
+++ b/package/uclibc/0001-fstat-make-new-code-aarch64-specific.patch
@@ -0,0 +1,29 @@
+From 71127e5cc937878883e6021da3da337a7aa9c099 Mon Sep 17 00:00:00 2001
+From: Waldemar Brodkorb <wbx@openadk.org>
+Date: Fri, 3 Feb 2017 06:04:16 +0100
+Subject: [PATCH 10229/10229] fstat: make new code aarch64 specific
+
+The new code get's used by MIPS64 N64 and fails.
+Make the new code aarch64 specific.
+
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+---
+ libc/sysdeps/linux/common/fstat.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libc/sysdeps/linux/common/fstat.c b/libc/sysdeps/linux/common/fstat.c
+index ac77eb2..c27f926 100644
+--- a/libc/sysdeps/linux/common/fstat.c
++++ b/libc/sysdeps/linux/common/fstat.c
+@@ -21,7 +21,7 @@ int fstat(int fd, struct stat *buf)
+ }
+ libc_hidden_def(fstat)
+ 
+-#elif __WORDSIZE == 64 && defined __NR_newfstatat
++#elif __WORDSIZE == 64 && defined __NR_newfstatat && __aarch64__
+ #include <fcntl.h>
+ 
+ int fstat(int fd, struct stat *buf)
+-- 
+2.1.4
+
diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
index 4d5f629..0628af3 100644
--- a/package/uclibc/Config.in
+++ b/package/uclibc/Config.in
@@ -128,12 +128,11 @@ config BR2_UCLIBC_MIPS_ABI
 	default "N32" if BR2_MIPS_NABI32
 	default "N64" if BR2_MIPS_NABI64
 
-config BR2_UCLIBC_MIPS_ISA
+config BR2_UCLIBC_MIPS_NAN
 	string
 	depends on BR2_UCLIBC_TARGET_ARCH = "mips"
-	default "MIPS32" if BR2_MIPS_CPU_MIPS32
-	default "MIPS32R2" if BR2_MIPS_CPU_MIPS32R2
-	default "MIPS64" if BR2_MIPS_CPU_MIPS64
+	default "LEGACY" if BR2_MIPS_CPU_MIPS32 || BR2_MIPS_CPU_MIPS64
+	default "2008" if BR2_MIPS_CPU_MIPS32R6 || BR2_MIPS_CPU_MIPS64R6
 
 config BR2_UCLIBC_SH_TYPE
 	string
diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index 9f9bffb..8f6035e 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -163,10 +163,10 @@ define UCLIBC_MIPS_ABI_CONFIG
 	$(call KCONFIG_ENABLE_OPT,$(UCLIBC_MIPS_ABI),$(@D)/.config)
 endef
 
-UCLIBC_MIPS_ISA = CONFIG_MIPS_ISA_$(call qstrip,$(BR2_UCLIBC_MIPS_ISA))
-define UCLIBC_MIPS_ISA_CONFIG
-	$(SED) '/CONFIG_MIPS_ISA_.*/d' $(@D)/.config
-	$(call KCONFIG_ENABLE_OPT,$(UCLIBC_MIPS_ISA),$(@D)/.config)
+UCLIBC_MIPS_NAN = CONFIG_MIPS_NAN_$(call qstrip,$(BR2_UCLIBC_MIPS_NAN))
+define UCLIBC_MIPS_NAN_CONFIG
+	$(SED) '/CONFIG_MIPS_NAN_.*/d' $(@D)/.config
+	$(call KCONFIG_ENABLE_OPT,$(UCLIBC_MIPS_NAN),$(@D)/.config)
 endef
 endif # mips
 
@@ -418,7 +418,7 @@ define UCLIBC_KCONFIG_FIXUP_CMDS
 	$(UCLIBC_ARM_NO_CONTEXT_FUNCS)
 	$(UCLIBC_M68K_BINFMT_FLAT)
 	$(UCLIBC_MIPS_ABI_CONFIG)
-	$(UCLIBC_MIPS_ISA_CONFIG)
+	$(UCLIBC_MIPS_NAN_CONFIG)
 	$(UCLIBC_SH_TYPE_CONFIG)
 	$(UCLIBC_SPARC_TYPE_CONFIG)
 	$(UCLIBC_POWERPC_TYPE_CONFIG)
diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
index 9c672d2..a46b65e 100644
--- a/toolchain/toolchain-buildroot/Config.in
+++ b/toolchain/toolchain-buildroot/Config.in
@@ -34,8 +34,6 @@ config BR2_TOOLCHAIN_BUILDROOT_UCLIBC
 		   BR2_mips    || BR2_mipsel || BR2_mips64 || BR2_mips64el || \
 		   BR2_or1k    || BR2_powerpc || BR2_sh2a   || BR2_sh4	   || \
 		   BR2_sh4eb   || BR2_sparc   || BR2_xtensa || BR2_x86_64
-	# Unsupported for MIPS R6
-	depends on !BR2_MIPS_CPU_MIPS32R6 && !BR2_MIPS_CPU_MIPS64R6
 	help
 	  This option selects uClibc-ng as the C library for the
 	  cross-compilation toolchain.
-- 
2.1.4
