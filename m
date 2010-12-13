From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 13 Dec 2010 17:27:41 +0100
Subject: [Buildroot] [PATCH 05/14] toolchain: rework C++ options
In-Reply-To: <cover.1292257643.git.thomas.petazzoni@free-electrons.com>
References: <cover.1292257643.git.thomas.petazzoni@free-electrons.com>
Message-ID: <fb633b08677502c0569cfacde6bab08650e9fc74.1292257643.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Instead of having BR2_GCC_CROSS_CXX and BR2_INSTALL_LIBSTDCPP, with
BR2_GCC_CROSS_CXX not being visible (and therefore being useless),
let's just keep BR2_INSTALL_LIBSTDCPP to enable C++ in the toolchain
and install C++ libraries on the target.

We also take that opportunity to make BR2_INSTALL_LIBSTDCPP an hidden
option, which is selected by an option in Buildroot toolchain support
or an option in External toolchain support, just as we did for other
toolchain features.

Some work definitely remains to be done :

 - The name BR2_INSTALL_LIBSTDCPP is ugly, but we keep it for the
   moment in order to avoid changing all packages.

 - We should clarify the other language-related options (Fortran,
   Java, Objective-C, etc.).

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Makefile.in                              |    2 +-
 package/lzma/Config.in                           |    4 +-
 package/rpm/Config.in                            |    4 +-
 toolchain/gcc/gcc-uclibc-4.x.mk                  |    2 +-
 toolchain/helpers.mk                             |    2 +-
 toolchain/toolchain-buildroot/Config.in.2        |   16 ++++++++++++++
 toolchain/toolchain-common.in                    |   25 ++-------------------
 toolchain/toolchain-crosstool-ng/Config.in       |    8 +++++++
 toolchain/toolchain-crosstool-ng/crosstool-ng.mk |    2 +-
 toolchain/toolchain-external/Config.in           |   14 ++++++++++++
 10 files changed, 49 insertions(+), 30 deletions(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index 36bd59f..71c8dbc 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -307,7 +307,7 @@ ifneq ($(BR2_INET_IPV6),y)
 DISABLE_IPV6= --disable-ipv6
 endif
 
-ifneq ($(BR2_GCC_CROSS_CXX),y)
+ifneq ($(BR2_INSTALL_LIBSTDCPP),y)
 TARGET_CONFIGURE_OPTS+=CXX=false
 endif
 
diff --git a/package/lzma/Config.in b/package/lzma/Config.in
index 4904721..2b94dde 100644
--- a/package/lzma/Config.in
+++ b/package/lzma/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_LZMA
 	bool "lzma"
-	depends on BR2_GCC_CROSS_CXX
+	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_DEPRECATED
 	help
 	  Lempel Ziv compression method (LZMA) is a compression
@@ -9,4 +9,4 @@ config BR2_PACKAGE_LZMA
 	  http://tukaani.org/lzma/
 
 comment "lzma requires a toolchain with C++ support"
-        depends on !BR2_GCC_CROSS_CXX && BR2_DEPRECATED
+        depends on !BR2_INSTALL_LIBSTDCPP && BR2_DEPRECATED
diff --git a/package/rpm/Config.in b/package/rpm/Config.in
index 448606c..8d4c6a3 100644
--- a/package/rpm/Config.in
+++ b/package/rpm/Config.in
@@ -25,11 +25,11 @@ config BR2_PACKAGE_RPM_BZIP2_PAYLOADS
 config BR2_PACKAGE_RPM_XZ_PAYLOADS
 	bool "support for xz payloads"
 	depends on BR2_PACKAGE_RPM
-	depends on BR2_GCC_CROSS_CXX
+	depends on BR2_INSTALL_LIBSTDCPP
 	help
 	  Support for xz payloads in RPM.
 
 comment "xz payload support requires a toolchain with c++ support"
-	depends on !BR2_GCC_CROSS_CXX
+	depends on !BR2_INSTALL_LIBSTDCPP
 
 
diff --git a/toolchain/gcc/gcc-uclibc-4.x.mk b/toolchain/gcc/gcc-uclibc-4.x.mk
index af085f7..eec6523 100644
--- a/toolchain/gcc/gcc-uclibc-4.x.mk
+++ b/toolchain/gcc/gcc-uclibc-4.x.mk
@@ -67,7 +67,7 @@ GCC_STAGING_PREREQ+=$(STAGING_DIR)/usr/lib/libc.a
 GCC_TARGET_LANGUAGES:=c
 
 GCC_CROSS_LANGUAGES:=c
-ifeq ($(BR2_GCC_CROSS_CXX),y)
+ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
 GCC_CROSS_LANGUAGES:=$(GCC_CROSS_LANGUAGES),c++
 endif
 ifeq ($(BR2_GCC_CROSS_FORTRAN),y)
diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index 24f379d..33f0484 100644
--- a/toolchain/helpers.mk
+++ b/toolchain/helpers.mk
@@ -220,7 +220,7 @@ check_arm_abi = \
 check_cplusplus = \
 	$(TARGET_CXX) -v > /dev/null 2>&1 ; \
 	if test $$? -ne 0 ; then \
-		echo "BR2_INSTALL_LIBSTDCPP is selected but C++ support not available in external toolchain" ; \
+		echo "C++ support is selected but is not available in external toolchain" ; \
 		exit 1 ; \
 	fi
 
diff --git a/toolchain/toolchain-buildroot/Config.in.2 b/toolchain/toolchain-buildroot/Config.in.2
index 2a8dcf5..cf426ee 100644
--- a/toolchain/toolchain-buildroot/Config.in.2
+++ b/toolchain/toolchain-buildroot/Config.in.2
@@ -51,6 +51,22 @@ config BR2_TOOLCHAIN_BUILDROOT_PROGRAM_INVOCATION
 	  (like tar and coreutils) utilize these for extra useful
 	  output, but in general are not required.
 
+config BR2_TOOLCHAIN_BUILDROOT_CXX
+	bool "Enable C++ support"
+	select BR2_INSTALL_LIBSTDCPP
+	depends on !(! BR2_GCC_SUPPORTS_FINEGRAINEDMTUNE && \
+		       BR2_TOOLCHAIN_BUILDROOT_LOCALE    && \
+		       BR2_UCLIBC_VERSION_0_9_31)
+	help
+	  Enable this option if you want your toolchain to support the
+	  C++ language and you want C++ libraries to be installed on
+	  your target system.
+
+comment "C++ support broken in uClibc 0.9.31 with locale enabled with gcc 4.2"
+	depends on !BR2_GCC_SUPPORTS_FINEGRAINEDMTUNE && \
+		    BR2_TOOLCHAIN_BUILDROOT_LOCALE    && \
+		    BR2_UCLIBC_VERSION_0_9_31
+
 source "toolchain/elf2flt/Config.in"
 source "toolchain/mklibs/Config.in"
 source "toolchain/sstrip/Config.in"
diff --git a/toolchain/toolchain-common.in b/toolchain/toolchain-common.in
index ea47466..2c54acd 100644
--- a/toolchain/toolchain-common.in
+++ b/toolchain/toolchain-common.in
@@ -23,6 +23,9 @@ config BR2_ENABLE_LOCALE
 config BR2_PROGRAM_INVOCATION
 	bool
 
+config BR2_INSTALL_LIBSTDCPP
+	bool
+
 config BR2_ENABLE_LOCALE_PURGE
 	bool "Purge unwanted locales"
 	help
@@ -108,28 +111,6 @@ choice
 		depends on BR2_UCLIBC_VERSION_SNAPSHOT
 endchoice
 
-config BR2_GCC_CROSS_CXX
-	bool
-	help
-	  If you are building your own toolchain and want to build 
-	  a C++ cross-compiler this needs to be enabled.
-	  If you have an external binary toolchain that has a C++ compiler
-	  and you want to use it then you need to enable this option.
-
-config BR2_INSTALL_LIBSTDCPP
-	bool "Build/install c++ compiler and libstdc++?"
-	select BR2_GCC_CROSS_CXX
-	depends on !(! BR2_GCC_SUPPORTS_FINEGRAINEDMTUNE && BR2_ENABLE_LOCALE && BR2_UCLIBC_VERSION_0_9_31)
-	help
-	  If you are building your own toolchain and want to build and install
-	  the C++ compiler and library then you need to enable this option.
-	  If you have an external toolchain that has been built with C++ 
-	  support and you want to use the compiler / library then you need 
-	  to select this option.
-
-comment "C++ support broken in uClibc 0.9.31 with locale enabled with gcc 4.2"
-	depends on !BR2_GCC_SUPPORTS_FINEGRAINEDMTUNE && BR2_ENABLE_LOCALE && BR2_UCLIBC_VERSION_0_9_31
-
 config BR2_TARGET_OPTIMIZATION
 	string "Target Optimizations"
 	default "-pipe"
diff --git a/toolchain/toolchain-crosstool-ng/Config.in b/toolchain/toolchain-crosstool-ng/Config.in
index 4ee665d..82e223d 100644
--- a/toolchain/toolchain-crosstool-ng/Config.in
+++ b/toolchain/toolchain-crosstool-ng/Config.in
@@ -98,4 +98,12 @@ config BR2_TOOLCHAIN_CTNG_uClibc_PROGRAM_INVOCATION
 
 endif # BR2_TOOLCHAIN_CTNG_uClibc
 
+config BR2_TOOLCHAIN_CTNG_CXX
+	bool "Enable C++ support"
+	select BR2_INSTALL_LIBSTDCPP
+	help
+	  Enable this option if you want your toolchain to support the
+	  C++ language and you want C++ libraries to be installed on
+	  your target system.
+
 endif # BR2_TOOLCHAIN_CTNG
diff --git a/toolchain/toolchain-crosstool-ng/crosstool-ng.mk b/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
index 1c5e864..817a1f7 100644
--- a/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
+++ b/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
@@ -207,7 +207,7 @@ CTNG_FIX_DOT_CONFIG_SED += s:^(CT_CC_PKGVERSION)="(.*)":\1="crosstool-NG $(CTNG_
 ifneq ($(call qstrip,$(BR2_PACKAGE_GDB_SERVER))$(call qstrip,$(BR2_PACKAGE_GDB_HOST)),)
 CTNG_FIX_DOT_CONFIG_SED += s:^(CT_DEBUG_gdb)=.*:\# \1 is not set:;
 endif
-ifneq ($(call qstrip,$(BR2_INSTALL_LIBSTDCPP)),)
+ifeq ($(call qstrip,$(BR2_TOOLCHAIN_CTNG_CXX)),y)
 CTNG_FIX_DOT_CONFIG_SED += s:^\# (CT_CC_LANG_CXX) is not set:\1=y:;
 else
 CTNG_FIX_DOT_CONFIG_SED += s:^(CT_CC_LANG_CXX)=.*:\# \1 is not set:;
diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 59fcb52..bd22e0c 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -7,6 +7,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201009
 	bool "CodeSourcery ARM 2010.09"
 	depends on BR2_arm
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
+	select BR2_INSTALL_LIBSTDCPP
 	help
 	  Toolchain for the ARM architecture, from CodeSourcery. It
 	  uses gcc 4.5.1, binutils 2.20, glibc 2.11 and gdb 7.2.50,
@@ -20,6 +21,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM2010Q1
 	bool "CodeSourcery ARM 2010q1"
 	depends on BR2_arm
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
+	select BR2_INSTALL_LIBSTDCPP
 	help
 	  Toolchain for the ARM architecture, from CodeSourcery. It
 	  uses gcc 4.4.1, binutils 2.19, glibc 2.11, gdb 7.0.50 and
@@ -33,6 +35,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM2009Q1
 	bool "CodeSourcery ARM 2009q1"
 	depends on BR2_arm
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
+	select BR2_INSTALL_LIBSTDCPP
 	help
 	  Toolchain for the ARM architecture, from CodeSourcery. It
 	  uses gcc 4.3.3, binutils 2.19, glibc 2.8 and gdb 6.8 and
@@ -46,6 +49,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS44
 	bool "CodeSourcery MIPS 4.4"
 	depends on BR2_mips || BR2_mipsel
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
+	select BR2_INSTALL_LIBSTDCPP
 	help
 	  Toolchain for the MIPS architecture, from CodeSourcery. It
 	  uses gcc 4.4.1, binutils 2.19, glibc 2.11, uClibc 0.9.30 and
@@ -68,6 +72,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201009
 	bool "CodeSoucery PowerPC 2010.09"
 	depends on BR2_powerpc
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
+	select BR2_INSTALL_LIBSTDCPP
 	help
 	  Toolchain for the PowerPC architecture, from
 	  CodeSourcery. It uses gcc 4.5.1, binutils 2.20, glibc 2.11,
@@ -85,6 +90,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH201009
 	bool "CodeSoucery PowerPC 2010.09"
 	depends on BR2_sh
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
+	select BR2_INSTALL_LIBSTDCPP
 	help
 	  Toolchain for the SuperH architecture, from CodeSourcery. It
 	  uses gcc 4.5.1, binutils 2.20, glibc 2.11, uClibc 0.9.30,
@@ -216,6 +222,14 @@ config BR2_TOOLCHAIN_EXTERNAL_PROGRAM_INVOCATION
 
 endif # BR2_TOOLCHAIN_EXTERNAL_CUSTOM_UCLIBC
 
+config BR2_TOOLCHAIN_EXTERNAL_CXX
+	bool "Toolchain has C++ support?"
+	select BR2_INSTALL_LIBSTDCPP
+	help
+	  Select this option if your external toolchain has C++
+	  support. If you don't know, leave the default value,
+	  Buildroot will tell you if it's correct or not.
+
 endif # BR2_TOOLCHAIN_EXTERNAL_CUSTOM
 
 endif # BR2_TOOLCHAIN_EXTERNAL
-- 
1.7.0.4
