From: Waldemar Brodkorb <wbx@openadk.org>
Date: Fri, 3 Jun 2016 06:05:31 +0200
Subject: [Buildroot] [PATCH v3 2/3] toolchain: add bfin support
Message-ID: <20160603040531.GA31560@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

With gcc 6.1.0 and binutils 2.26 internal bfin toolchain
can be used. A gcc patch is required, which was reported upstream.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
v2 -> v3:
  - keep BR2_GCC_TARGET_CPU
v1 -> v2:                                                                                                                                              
  - remove conditional patch requested by Thomas Petazzoni
  - do not enable BR2_GCC_TARGET_CPU, may be we can use
    BR2_TARGET_CPU later for passing -mcpu= via CFLAGS
---
 package/binutils/Config.in.host                |  6 ++++--
 package/gcc/6.1.0/892-disable-dwarf-bfin.patch | 24 ++++++++++++++++++++++++
 package/gcc/Config.in.host                     |  8 ++++----
 package/uclibc/Config.in                       |  1 +
 toolchain/Config.in                            |  1 -
 5 files changed, 33 insertions(+), 7 deletions(-)
 create mode 100644 package/gcc/6.1.0/892-disable-dwarf-bfin.patch

diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
index efdc840..d96fab2 100644
--- a/package/binutils/Config.in.host
+++ b/package/binutils/Config.in.host
@@ -8,8 +8,8 @@ choice
 	  Select the version of binutils you wish to use.
 
 	config BR2_BINUTILS_VERSION_2_24_X
-		# supported, but broken on Nios-II and powerpc64le
-		depends on !BR2_nios2 && !BR2_powerpc64le
+		# supported, but broken on Nios-II, Blackfin and powerpc64le
+		depends on !BR2_nios2 && !BR2_powerpc64le && !BR2_bfin
 		# Unsupported for MIPS R6
 		depends on !BR2_mips_32r6 && !BR2_mips_64r6
 		# Unsupported ARM cores
@@ -18,6 +18,8 @@ choice
 
 	config BR2_BINUTILS_VERSION_2_25_X
 		bool "binutils 2.25.1"
+		# supported but broken on Blackfin
+		depends on !BR2_bfin
 
 	config BR2_BINUTILS_VERSION_2_26_X
 		bool "binutils 2.26"
diff --git a/package/gcc/6.1.0/892-disable-dwarf-bfin.patch b/package/gcc/6.1.0/892-disable-dwarf-bfin.patch
new file mode 100644
index 0000000..81acde7
--- /dev/null
+++ b/package/gcc/6.1.0/892-disable-dwarf-bfin.patch
@@ -0,0 +1,24 @@
+Dwarf support does not compile
+
+Reported upstream:
+https://gcc.gnu.org/bugzilla/show_bug.cgi?id=68468
+
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+
+diff -Nur gcc-6.1.0.orig/libgcc/config.host gcc-6.1.0/libgcc/config.host
+--- gcc-6.1.0.orig/libgcc/config.host	2016-02-26 21:02:28.000000000 +0100
++++ gcc-6.1.0/libgcc/config.host	2016-05-12 19:26:30.973350274 +0200
+@@ -230,6 +230,13 @@
+       ;;
+   esac
+   ;;
++bfin-*-*linux*)
++  tmake_file="$tmake_file t-crtstuff-pic t-libgcc-pic t-slibgcc t-slibgcc-gld t-slibgcc-elf-ver t-linux"
++  extra_parts="crtbegin.o crtbeginS.o crtbeginT.o crtend.o crtendS.o"
++  if test x$enable_vtable_verify = xyes; then
++    extra_parts="$extra_parts vtv_start.o vtv_end.o vtv_start_preinit.o vtv_end_preinit.o"
++  fi
++  ;;
+ *-*-linux* | frv-*-*linux* | *-*-kfreebsd*-gnu | *-*-knetbsd*-gnu | *-*-gnu* | *-*-kopensolaris*-gnu)
+   tmake_file="$tmake_file t-crtstuff-pic t-libgcc-pic t-eh-dw2-dip t-slibgcc t-slibgcc-gld t-slibgcc-elf-ver t-linux"
+   extra_parts="crtbegin.o crtbeginS.o crtbeginT.o crtend.o crtendS.o"
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index cfb0958..b4e7a7b 100644
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
diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
index 1aad9a0..6e611db 100644
--- a/package/uclibc/Config.in
+++ b/package/uclibc/Config.in
@@ -120,6 +120,7 @@ config BR2_UCLIBC_TARGET_ARCH
 	string
 	default "arc"	   if BR2_arcle || BR2_arceb
 	default "arm"	   if BR2_arm	|| BR2_armeb
+	default "bfin"	   if BR2_bfin
 	default "m68k"	   if BR2_m68k
 	default "mips"	   if BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
 	default "powerpc"  if BR2_powerpc
diff --git a/toolchain/Config.in b/toolchain/Config.in
index e0044c1..a725556 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -38,7 +38,6 @@ choice
 
 config BR2_TOOLCHAIN_BUILDROOT
 	bool "Buildroot toolchain"
-	depends on !BR2_bfin
 	select BR2_TOOLCHAIN_HAS_SHADOW_PASSWORDS
 
 config BR2_TOOLCHAIN_EXTERNAL
-- 
2.1.4
