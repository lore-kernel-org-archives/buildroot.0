From: Waldemar Brodkorb <wbx@openadk.org>
Date: Sun, 8 May 2016 11:02:42 +0200
Subject: [Buildroot] [PATCH 2/4] toolchain: add bfin support
Message-ID: <20160508090242.GA32305@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

With gcc 6.1.0 and binutils 2.26 internal bfin toolchain
can be used. A gcc patch is required, which was reported upstream.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/binutils/Config.in.host                       |  8 +++++---
 .../6.1.0/892-disable-dwarf-bfin.patch.conditional    | 19 +++++++++++++++++++
 package/gcc/Config.in.host                            |  8 ++++----
 package/gcc/gcc.mk                                    | 11 +++++++++++
 package/uclibc/Config.in                              |  1 +
 toolchain/Config.in                                   |  1 -
 6 files changed, 40 insertions(+), 8 deletions(-)
 create mode 100644 package/gcc/6.1.0/892-disable-dwarf-bfin.patch.conditional

diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
index e42918e..ec6d2d8 100644
--- a/package/binutils/Config.in.host
+++ b/package/binutils/Config.in.host
@@ -9,7 +9,7 @@ choice
 
 	config BR2_BINUTILS_VERSION_2_23_X
 		depends on !BR2_aarch64 && !BR2_microblaze && \
-			   !BR2_powerpc64le && !BR2_nios2
+			   !BR2_powerpc64le && !BR2_nios2 && !BR2_bfin
 		# Unsupported for MIPS R6
 		depends on !BR2_mips_32r6 && !BR2_mips_64r6
 		# Unsupported ARM cores
@@ -17,8 +17,8 @@ choice
 		bool "binutils 2.23.2"
 
 	config BR2_BINUTILS_VERSION_2_24_X
-		# supported, but broken on Nios-II and powerpc64le
-		depends on !BR2_nios2 && !BR2_powerpc64le
+		# supported, but broken on Nios-II, Blackfin and powerpc64le
+		depends on !BR2_nios2 && !BR2_powerpc64le && !BR2_bfin
 		# Unsupported for MIPS R6
 		depends on !BR2_mips_32r6 && !BR2_mips_64r6
 		# Unsupported ARM cores
@@ -27,6 +27,8 @@ choice
 
 	config BR2_BINUTILS_VERSION_2_25_X
 		bool "binutils 2.25.1"
+		# supported but broken on Blackfin
+		depends on !BR2_bfin
 
 	config BR2_BINUTILS_VERSION_2_26_X
 		bool "binutils 2.26"
diff --git a/package/gcc/6.1.0/892-disable-dwarf-bfin.patch.conditional b/package/gcc/6.1.0/892-disable-dwarf-bfin.patch.conditional
new file mode 100644
index 0000000..f63ec24
--- /dev/null
+++ b/package/gcc/6.1.0/892-disable-dwarf-bfin.patch.conditional
@@ -0,0 +1,19 @@
+Dwarf support does not compile
+
+Reported upstream:
+https://gcc.gnu.org/bugzilla/show_bug.cgi?id=68468
+
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+
+diff -Nur gcc-6.1.0.orig/libgcc/config.host gcc-6.1.0/libgcc/config.host
+--- gcc-6.1.0.orig/libgcc/config.host	2016-02-26 21:02:28.000000000 +0100
++++ gcc-6.1.0/libgcc/config.host	2016-04-30 20:49:06.542101273 +0200
+@@ -231,7 +231,7 @@
+   esac
+   ;;
+ *-*-linux* | frv-*-*linux* | *-*-kfreebsd*-gnu | *-*-knetbsd*-gnu | *-*-gnu* | *-*-kopensolaris*-gnu)
+-  tmake_file="$tmake_file t-crtstuff-pic t-libgcc-pic t-eh-dw2-dip t-slibgcc t-slibgcc-gld t-slibgcc-elf-ver t-linux"
++  tmake_file="$tmake_file t-crtstuff-pic t-libgcc-pic t-slibgcc t-slibgcc-gld t-slibgcc-elf-ver t-linux"
+   extra_parts="crtbegin.o crtbeginS.o crtbeginT.o crtend.o crtendS.o"
+   if test x$enable_vtable_verify = xyes; then
+     extra_parts="$extra_parts vtv_start.o vtv_end.o vtv_start_preinit.o vtv_end_preinit.o"
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 8cf2d56..45cd1f7 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -18,7 +18,7 @@ choice
 		depends on BR2_DEPRECATED_SINCE_2016_05
 		# Broken or unsupported architectures
 		depends on !BR2_microblaze && !BR2_aarch64 && !BR2_arc \
-			&& !BR2_powerpc64le && !BR2_nios2
+			&& !BR2_powerpc64le && !BR2_nios2 && !BR2_bfin
 		# Broken or unsupported ARM cores
 		depends on !BR2_cortex_a12 && !BR2_pj4 && !BR2_cortex_a17
 		# Broken or unsupported PPC cores
@@ -37,7 +37,7 @@ choice
 		bool "gcc 4.8.x"
 		# Broken or unsupported architectures
 		depends on !BR2_microblaze && !BR2_arc \
-			&& !BR2_powerpc64le && !BR2_nios2
+			&& !BR2_powerpc64le && !BR2_nios2 && !BR2_bfin
 		# Broken or unsupported ARM cores
 		depends on !BR2_cortex_a12 && !BR2_cortex_a17
 		# Broken or unsupported PPC cores
@@ -61,7 +61,7 @@ choice
 	config BR2_GCC_VERSION_4_9_X
 		bool "gcc 4.9.x"
 		# Broken or unsupported architectures
-		depends on !BR2_arc
+		depends on !BR2_arc && !BR2_bfin
 		# Broken or unsupported ARM cores
 		depends on !BR2_cortex_a17
 		# Unsupported for MIPS R6
@@ -74,7 +74,7 @@ choice
 	config BR2_GCC_VERSION_5_X
 		bool "gcc 5.x"
 		# Broken or unsupported architectures
-		depends on !BR2_arc
+		depends on !BR2_arc && !BR2_bfin
 		select BR2_GCC_NEEDS_MPC
 		select BR2_GCC_SUPPORTS_GRAPHITE
 		select BR2_TOOLCHAIN_GCC_AT_LEAST_5
diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index 46f05ff..2648a26 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -41,11 +41,18 @@ endef
 endif
 endif
 
+ifeq ($(ARCH),bfin)
+define HOST_GCC_APPLY_BFIN_PATCH
+	$(APPLY_PATCHES) $(@D) package/gcc/$(GCC_VERSION) 892-disable-dwarf-bfin.patch.conditional
+endef
+endif
+
 define HOST_GCC_APPLY_PATCHES
 	if test -d package/gcc/$(GCC_VERSION); then \
 	  $(APPLY_PATCHES) $(@D) package/gcc/$(GCC_VERSION) \*.patch ; \
 	fi;
 	$(HOST_GCC_APPLY_POWERPC_PATCH)
+	$(HOST_GCC_APPLY_BFIN_PATCH)
 endef
 
 HOST_GCC_EXCLUDES = \
@@ -189,6 +196,9 @@ endif
 ifneq ($(call qstrip,$(BR2_GCC_TARGET_ABI)),)
 HOST_GCC_COMMON_CONF_OPTS += --with-abi=$(BR2_GCC_TARGET_ABI)
 endif
+
+# for Blackfin you can't use --with-cpu
+ifeq ($BR2_bfin),)
 ifneq ($(call qstrip,$(BR2_GCC_TARGET_CPU)),)
 ifneq ($(call qstrip,$(BR2_GCC_TARGET_CPU_REVISION)),)
 HOST_GCC_COMMON_CONF_OPTS += --with-cpu=$(call qstrip,$(BR2_GCC_TARGET_CPU)-$(BR2_GCC_TARGET_CPU_REVISION))
@@ -196,6 +206,7 @@ else
 HOST_GCC_COMMON_CONF_OPTS += --with-cpu=$(call qstrip,$(BR2_GCC_TARGET_CPU))
 endif
 endif
+endif
 
 GCC_TARGET_FPU = $(call qstrip,$(BR2_GCC_TARGET_FPU))
 ifneq ($(GCC_TARGET_FPU),)
diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
index efa84e9..cfa2c9b 100644
--- a/package/uclibc/Config.in
+++ b/package/uclibc/Config.in
@@ -125,6 +125,7 @@ config BR2_UCLIBC_TARGET_ARCH
 	string
 	default "arc"	   if BR2_arcle || BR2_arceb
 	default "arm"	   if BR2_arm	|| BR2_armeb
+	default "bfin"	   if BR2_bfin
 	default "m68k"	   if BR2_m68k
 	default "mips"	   if BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
 	default "powerpc"  if BR2_powerpc
diff --git a/toolchain/Config.in b/toolchain/Config.in
index fc30c6e..b9ba677 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -40,7 +40,6 @@ choice
 
 config BR2_TOOLCHAIN_BUILDROOT
 	bool "Buildroot toolchain"
-	depends on !BR2_bfin
 	select BR2_TOOLCHAIN_HAS_SHADOW_PASSWORDS
 
 config BR2_TOOLCHAIN_EXTERNAL
-- 
2.1.4
