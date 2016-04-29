From: Waldemar Brodkorb <wbx@openadk.org>
Date: Fri, 29 Apr 2016 19:51:23 +0200
Subject: [Buildroot] [PATCHv2 1/2] toolchain: add coldfire support
Message-ID: <20160429175123.GA27368@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add support for m68k/coldfire. A gcc patch is required
to avoid gcc ICE.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
v1 -> v2:
 - split off patches
 - remove multilib stuff as not really required
 - add comments to gcc patches
 - add gcc 6.1.0 patch
---
 arch/Config.in                               |  2 +-
 arch/Config.in.m68k                          | 20 ++++++++++++++++++++
 package/gcc/4.8.5/891-fix-m68k-uclinux.patch | 18 ++++++++++++++++++
 package/gcc/4.9.3/891-fix-m68k-uclinux.patch | 18 ++++++++++++++++++
 package/gcc/5.3.0/891-fix-m68k-uclinux.patch | 18 ++++++++++++++++++
 package/gcc/6.1.0/891-fix-m68k-uclinux.patch | 18 ++++++++++++++++++
 package/gcc/gcc-final/gcc-final.mk           |  8 ++++++++
 package/uclibc/uclibc.mk                     | 16 ++++++++++++++++
 8 files changed, 117 insertions(+), 1 deletion(-)
 create mode 100644 package/gcc/4.8.5/891-fix-m68k-uclinux.patch
 create mode 100644 package/gcc/4.9.3/891-fix-m68k-uclinux.patch
 create mode 100644 package/gcc/5.3.0/891-fix-m68k-uclinux.patch
 create mode 100644 package/gcc/6.1.0/891-fix-m68k-uclinux.patch

diff --git a/arch/Config.in b/arch/Config.in
index 3f1453f..be37481 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -94,7 +94,7 @@ config BR2_i386
 
 config BR2_m68k
 	bool "m68k"
-	select BR2_ARCH_HAS_MMU_MANDATORY
+	# MMU support is set by the subarchitecture file, arch/Config.in.m68k
 	help
 	  Motorola 68000 family microprocessor
 	  http://en.wikipedia.org/wiki/M68k
diff --git a/arch/Config.in.m68k b/arch/Config.in.m68k
index 94494c8..da06c3a 100644
--- a/arch/Config.in.m68k
+++ b/arch/Config.in.m68k
@@ -4,6 +4,14 @@ config BR2_ARCH
 config BR2_ENDIAN
 	default "BIG"
 
+# symbols used to distinguish between m68k and coldfire
+# for gcc multilib
+config BR2_m68k_m68k
+	bool
+
+config BR2_m68k_cf
+	bool
+
 # coldfire variants will be added later
 choice
 	prompt "Target CPU"
@@ -14,8 +22,20 @@ choice
 
 config BR2_m68k_68040
 	bool "68040"
+	select BR2_m68k_m68k
+	select BR2_ARCH_HAS_MMU_MANDATORY
+
+config BR2_m68k_cf5208
+	bool "5208"
+	select BR2_m68k_cf
+	select BR2_SOFT_FLOAT
 
 endchoice
 
 config BR2_GCC_TARGET_CPU
 	default "68040"		if BR2_m68k_68040
+	default "5208"		if BR2_m68k_cf5208
+
+config BR2_GCC_TARGET_ARCH
+	default "m68k"		if BR2_m68k_m68k
+	default "cf"		if BR2_m68k_cf
diff --git a/package/gcc/4.8.5/891-fix-m68k-uclinux.patch b/package/gcc/4.8.5/891-fix-m68k-uclinux.patch
new file mode 100644
index 0000000..37c7ac4
--- /dev/null
+++ b/package/gcc/4.8.5/891-fix-m68k-uclinux.patch
@@ -0,0 +1,18 @@
+avoids internal compiler error while compiling linux-atomic.c
+See here:
+https://gcc.gnu.org/bugzilla/show_bug.cgi?id=53833
+
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+
+diff -Nur gcc-4.8.5.orig/libgcc/config.host gcc-4.8.5/libgcc/config.host
+--- gcc-4.8.5.orig/libgcc/config.host	2014-03-20 17:12:30.000000000 +0100
++++ gcc-4.8.5/libgcc/config.host	2016-04-27 15:04:01.521171537 +0200
+@@ -689,7 +689,7 @@
+ m68k*-*-openbsd*)
+ 	;;
+ m68k-*-uclinux*)	# Motorola m68k/ColdFire running uClinux with uClibc
+-	tmake_file="$tmake_file m68k/t-floatlib m68k/t-linux"
++	tmake_file="$tmake_file m68k/t-floatlib"
+ 	md_unwind_header=m68k/linux-unwind.h
+ 	;;
+ m68k-*-linux*)			# Motorola m68k's running GNU/Linux
diff --git a/package/gcc/4.9.3/891-fix-m68k-uclinux.patch b/package/gcc/4.9.3/891-fix-m68k-uclinux.patch
new file mode 100644
index 0000000..4347642
--- /dev/null
+++ b/package/gcc/4.9.3/891-fix-m68k-uclinux.patch
@@ -0,0 +1,18 @@
+avoids internal compiler error while compiling linux-atomic.c
+See here:
+https://gcc.gnu.org/bugzilla/show_bug.cgi?id=53833
+
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+
+diff -Nur gcc-4.9.3.orig/libgcc/config.host gcc-4.9.3/libgcc/config.host
+--- gcc-4.9.3.orig/libgcc/config.host	2014-03-27 16:40:31.000000000 +0100
++++ gcc-4.9.3/libgcc/config.host	2016-04-05 16:20:53.422809885 +0200
+@@ -750,7 +750,7 @@
+ m68k*-*-openbsd*)
+ 	;;
+ m68k-*-uclinux*)	# Motorola m68k/ColdFire running uClinux with uClibc
+-	tmake_file="$tmake_file m68k/t-floatlib m68k/t-linux"
++	tmake_file="$tmake_file m68k/t-floatlib"
+ 	md_unwind_header=m68k/linux-unwind.h
+ 	;;
+ m68k-*-linux*)			# Motorola m68k's running GNU/Linux
diff --git a/package/gcc/5.3.0/891-fix-m68k-uclinux.patch b/package/gcc/5.3.0/891-fix-m68k-uclinux.patch
new file mode 100644
index 0000000..4e186bd
--- /dev/null
+++ b/package/gcc/5.3.0/891-fix-m68k-uclinux.patch
@@ -0,0 +1,18 @@
+avoids internal compiler error while compiling linux-atomic.c
+See here:
+https://gcc.gnu.org/bugzilla/show_bug.cgi?id=53833
+
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+
+diff -Nur gcc-5.3.0.orig/libgcc/config.host gcc-5.3.0/libgcc/config.host
+--- gcc-5.3.0.orig/libgcc/config.host	2015-10-01 14:01:18.000000000 +0200
++++ gcc-5.3.0/libgcc/config.host	2016-04-26 21:30:25.353691745 +0200
+@@ -794,7 +794,7 @@
+ m68k*-*-openbsd*)
+ 	;;
+ m68k-*-uclinux*)	# Motorola m68k/ColdFire running uClinux with uClibc
+-	tmake_file="$tmake_file m68k/t-floatlib m68k/t-linux"
++	tmake_file="$tmake_file m68k/t-floatlib"
+ 	md_unwind_header=m68k/linux-unwind.h
+ 	;;
+ m68k-*-linux*)			# Motorola m68k's running GNU/Linux
diff --git a/package/gcc/6.1.0/891-fix-m68k-uclinux.patch b/package/gcc/6.1.0/891-fix-m68k-uclinux.patch
new file mode 100644
index 0000000..754aa74
--- /dev/null
+++ b/package/gcc/6.1.0/891-fix-m68k-uclinux.patch
@@ -0,0 +1,18 @@
+avoids internal compiler error while compiling linux-atomic.c
+See here:
+https://gcc.gnu.org/bugzilla/show_bug.cgi?id=53833
+
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+
+diff -Nur gcc-6.1.0.orig/libgcc/config.host gcc-6.1.0/libgcc/config.host
+--- gcc-6.1.0.orig/libgcc/config.host	2016-02-26 21:02:28.000000000 +0100
++++ gcc-6.1.0/libgcc/config.host	2016-04-29 09:18:40.377989160 +0200
+@@ -812,7 +812,7 @@
+ m68k*-*-openbsd*)
+ 	;;
+ m68k-*-uclinux*)	# Motorola m68k/ColdFire running uClinux with uClibc
+-	tmake_file="$tmake_file m68k/t-floatlib m68k/t-linux"
++	tmake_file="$tmake_file m68k/t-floatlib"
+ 	md_unwind_header=m68k/linux-unwind.h
+ 	;;
+ m68k-*-linux*)			# Motorola m68k's running GNU/Linux
diff --git a/package/gcc/gcc-final/gcc-final.mk b/package/gcc/gcc-final/gcc-final.mk
index 69fdc0c..9730d95 100644
--- a/package/gcc/gcc-final/gcc-final.mk
+++ b/package/gcc/gcc-final/gcc-final.mk
@@ -125,6 +125,14 @@ endef
 HOST_GCC_FINAL_POST_INSTALL_HOOKS += HOST_GCC_FINAL_LD_LINUX_LINK
 endif
 
+# coldfire is not working without removing these object files from libgcc.a
+ifeq ($(BR2_m68k_cf),y)
+define HOST_GCC_FINAL_M68K_LIBGCC_FIXUP
+	find $(STAGING_DIR) -name libgcc.a -print | while read t; do $(GNU_TARGET_NAME)-ar dv "$t" _ctors.o; done
+endef
+HOST_GCC_FINAL_POST_INSTALL_HOOKS += HOST_GCC_FINAL_M68K_LIBGCC_FIXUP
+endif
+
 # Cannot use the HOST_GCC_FINAL_USR_LIBS mechanism below, because we want
 # libgcc_s to be installed in /lib and not /usr/lib.
 define HOST_GCC_FINAL_INSTALL_LIBGCC
diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index 0dfb454..b8ccee2 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -101,6 +101,21 @@ endif
 endif # arm
 
 #
+# m68k/coldfire definitions
+#
+
+ifeq ($(UCLIBC_TARGET_ARCH),m68k)
+
+# disable DOPIC for flat without separate data
+ifeq ($(BR2_BINFMT_FLAT_ONE),y)
+define UCLIBC_M68K_BINFMT_FLAT
+	$(call KCONFIG_DISABLE_OPT,DOPIC,$(@D)/.config)
+endef
+endif
+
+endif # m68k/coldfire
+
+#
 # MIPS definitions
 #
 
@@ -372,6 +387,7 @@ define UCLIBC_KCONFIG_FIXUP_CMDS
 	$(UCLIBC_ARM_ABI_CONFIG)
 	$(UCLIBC_ARM_BINFMT_FLAT)
 	$(UCLIBC_ARM_NO_CONTEXT_FUNCS)
+	$(UCLIBC_M68K_BINFMT_FLAT)
 	$(UCLIBC_MIPS_ABI_CONFIG)
 	$(UCLIBC_MIPS_ISA_CONFIG)
 	$(UCLIBC_SH_TYPE_CONFIG)
-- 
2.1.4
