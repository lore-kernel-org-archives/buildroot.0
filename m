From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 4 Jul 2013 11:08:27 +0200
Subject: [Buildroot] [git commit] eglibc: enable support in the Buildroot
	toolchain backend
Message-ID: <20130704095653.C16CB9A29F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8d29893893fe25461abef645bfd38bf2f49c59a4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Using the newly introduced 'eglibc' package, this commit enables the
option of building a toolchain using the eglibc C library in the
Buildroot toolchain backend.

In details, this commit:

 * Creates a choice to select uClibc or eglibc in the Buildroot
   toolchain backend (in toolchain/toolchain-buildroot/Config.in), and
   removes the fact that the Buildroot toolchain backend forcefully
   enables uClibc (toolchain/Config.in).

 * Creates a BUILDROOT_LIBC variables, which points to the package
   implementing the C library (i.e either 'uclibc' or 'eglibc').

 * Modifies the gcc-final and gcc-intermediate makefiles to use the
   BUILDROOT_LIBC variable instead of hardcoding the use of uclibc.

 * Ensures that TLS support is always enabled when building eglibc.

[Peter: fix commit text to refer to BUILDROOT_LIBC]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/gcc/Config.in.host                       |    4 +-
 package/gcc/gcc-final/gcc-final.mk               |    2 +-
 package/gcc/gcc-intermediate/gcc-intermediate.mk |    2 +-
 package/uclibc/Config.in                         |    4 ++
 toolchain/Config.in                              |    1 -
 toolchain/toolchain-buildroot.mk                 |    4 ++
 toolchain/toolchain-buildroot/Config.in          |   40 ++++++++++++++++++++++
 7 files changed, 52 insertions(+), 5 deletions(-)

diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 7ecf2fb..0e26a80 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -114,9 +114,9 @@ config BR2_GCC_SHARED_LIBGCC
 	  Build/install a shared libgcc library
 
 config BR2_GCC_ENABLE_TLS
-	bool "Enable compiler tls support"
+	bool "Enable compiler tls support" if BR2_TOOLCHAIN_BUILDROOT_UCLIBC
 	default y
-	depends on BR2_PTHREADS_NATIVE
+	depends on BR2_PTHREADS_NATIVE || BR2_TOOLCHAIN_BUILDROOT_EGLIBC
 	help
 	  Enable the compiler to generate code for accessing
 	  thread local storage variables
diff --git a/package/gcc/gcc-final/gcc-final.mk b/package/gcc/gcc-final/gcc-final.mk
index 998c928..f99f1a3 100644
--- a/package/gcc/gcc-final/gcc-final.mk
+++ b/package/gcc/gcc-final/gcc-final.mk
@@ -10,7 +10,7 @@ GCC_FINAL_SOURCE  = $(GCC_SOURCE)
 
 HOST_GCC_FINAL_DEPENDENCIES = \
 	$(HOST_GCC_COMMON_DEPENDENCIES) \
-	uclibc
+	$(BUILDROOT_LIBC)
 
 HOST_GCC_FINAL_EXTRACT_CMDS = $(HOST_GCC_EXTRACT_CMDS)
 
diff --git a/package/gcc/gcc-intermediate/gcc-intermediate.mk b/package/gcc/gcc-intermediate/gcc-intermediate.mk
index 3a71671..5460000 100644
--- a/package/gcc/gcc-intermediate/gcc-intermediate.mk
+++ b/package/gcc/gcc-intermediate/gcc-intermediate.mk
@@ -10,7 +10,7 @@ GCC_INTERMEDIATE_SOURCE  = $(GCC_SOURCE)
 
 HOST_GCC_INTERMEDIATE_DEPENDENCIES = \
 	$(HOST_GCC_COMMON_DEPENDENCIES) \
-	uclibc-configure
+	$(BUILDROOT_LIBC)-configure
 
 HOST_GCC_INTERMEDIATE_EXTRACT_CMDS = $(HOST_GCC_EXTRACT_CMDS)
 
diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
index 410326b..f309243 100644
--- a/package/uclibc/Config.in
+++ b/package/uclibc/Config.in
@@ -1,3 +1,5 @@
+if BR2_TOOLCHAIN_BUILDROOT_UCLIBC
+
 comment "uClibc Options"
 
 choice
@@ -241,3 +243,5 @@ config BR2_UCLIBC_X86_TYPE
 	default PENTIUMIII if BR2_x86_pentium3
 	default PENTIUM4   if BR2_x86_pentium4 || BR2_x86_pentium_m || \
 			      BR2_x86_nocona || BR2_x86_core2
+
+endif # BR2_TOOLCHAIN_BUILDROOT_UCLIBC
diff --git a/toolchain/Config.in b/toolchain/Config.in
index 448bccc..53d2573 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -27,7 +27,6 @@ config BR2_TOOLCHAIN_BUILDROOT
 	bool "Buildroot toolchain"
 	depends on !BR2_microblaze && !BR2_aarch64
 	select BR2_TOOLCHAIN_HAS_SHADOW_PASSWORDS
-	select BR2_TOOLCHAIN_USES_UCLIBC
 
 config BR2_TOOLCHAIN_EXTERNAL
 	bool "External toolchain"
diff --git a/toolchain/toolchain-buildroot.mk b/toolchain/toolchain-buildroot.mk
index e7241bf..3a05800 100644
--- a/toolchain/toolchain-buildroot.mk
+++ b/toolchain/toolchain-buildroot.mk
@@ -2,4 +2,8 @@
 # build of binutils, uClibc, kernel headers and all the intermediate
 # gcc steps.
 
+include toolchain/helpers.mk
+
+BUILDROOT_LIBC = $(call qstrip,$(BR2_TOOLCHAIN_BUILDROOT_LIBC))
+
 toolchain-buildroot: host-gcc-final
diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
index 416695b..396a434 100644
--- a/toolchain/toolchain-buildroot/Config.in
+++ b/toolchain/toolchain-buildroot/Config.in
@@ -2,7 +2,47 @@
 
 if BR2_TOOLCHAIN_BUILDROOT
 source "package/linux-headers/Config.in.host"
+
+choice
+	prompt "C library"
+
+config BR2_TOOLCHAIN_BUILDROOT_UCLIBC
+	bool "uClibc"
+	select BR2_TOOLCHAIN_USES_UCLIBC
+	help
+	  This option selects uClibc as the C library for the
+	  cross-compilation toolchain.
+
+	  http://uclibc.org
+
+config BR2_TOOLCHAIN_BUILDROOT_EGLIBC
+	bool "eglibc (experimental)"
+	depends on BR2_arm    || BR2_armeb    || BR2_aarch64 || \
+		   BR2_i386   || BR2_mips     || BR2_mipsel  || \
+		   BR2_mips64 || BR2_mips64el || BR2_powerpc || \
+		   BR2_sh     || BR2_sh64     || BR2_sparc   || \
+		   BR2_x86_64
+	select BR2_TOOLCHAIN_USES_GLIBC
+	# our eglibc.mk enables RPC support
+	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
+	help
+	  This option selects eglibc as the C library for the
+	  cross-compilation toolchain.
+
+	  The eglibc support in the Buildroot toolchain backend is
+	  very recent, and therefore marked experimental.
+
+	  http://eglibc.org
+
+endchoice
+
+config BR2_TOOLCHAIN_BUILDROOT_LIBC
+	string
+	default "uclibc" if BR2_TOOLCHAIN_BUILDROOT_UCLIBC
+	default "eglibc" if BR2_TOOLCHAIN_BUILDROOT_EGLIBC
+
 source "package/uclibc/Config.in"
+
 source "package/binutils/Config.in.host"
 source "package/gcc/Config.in.host"
 endif
