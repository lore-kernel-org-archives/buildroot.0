From: Romain Naour <romain.naour@openwide.fr>
Date: Sat, 19 Dec 2015 19:14:44 +0100
Subject: [Buildroot] [PATCH 5/7] toolchain-external: ADI Blackfin: support
	only one version
In-Reply-To: <1450548886-21937-1-git-send-email-romain.naour@openwide.fr>
References: <1450548886-21937-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1450548886-21937-5-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

See the conclusion about external toolchains during the Buildroot
meeting [1]:
"In the future, we stick to a single external toolchain version. The
Kconfig symbol should not encode the version (avoid legacy handling)"

[1] http://elinux.org/index.php?title=Buildroot:DeveloperDaysELCE2015#Report

Remove old ADI toolchain handling in glog, openpgm and zeromq.

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 package/glog/Config.in                             |  8 +++----
 package/openpgm/Config.in                          |  5 ++---
 package/zeromq/Config.in                           |  3 +--
 toolchain/toolchain-external/Config.in             | 25 +++-------------------
 .../toolchain-external/toolchain-external.hash     |  4 ----
 toolchain/toolchain-external/toolchain-external.mk | 10 ++-------
 6 files changed, 11 insertions(+), 44 deletions(-)

diff --git a/package/glog/Config.in b/package/glog/Config.in
index 1c48ed9..f708758 100644
--- a/package/glog/Config.in
+++ b/package/glog/Config.in
@@ -3,16 +3,14 @@ config BR2_PACKAGE_GLOG
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_STATIC_LIBS
-	# build issues with these external toolchains
-	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2014R1
-	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2013R1
+	# build issues with this external toolchain
+	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX
 	help
 	  C++ implementation of the Google logging module
 
 	  https://github.com/google/glog
 
 comment "glog needs a toolchain w/ C++, threads, dynamic library"
-	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2014R1
-	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2013R1
+	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
 		BR2_STATIC_LIBS
diff --git a/package/openpgm/Config.in b/package/openpgm/Config.in
index d541d13..94816d8 100644
--- a/package/openpgm/Config.in
+++ b/package/openpgm/Config.in
@@ -1,8 +1,7 @@
 config BR2_PACKAGE_OPENPGM
 	bool "openpgm"
-	# The following toolchains lack required compiler intrinsics
-	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2014R1
-	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2013R1
+	# This toolchain lack required compiler intrinsics
+	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_WCHAR
 	help
diff --git a/package/zeromq/Config.in b/package/zeromq/Config.in
index aa5c1a8..b75ed3a 100644
--- a/package/zeromq/Config.in
+++ b/package/zeromq/Config.in
@@ -29,8 +29,7 @@ if BR2_PACKAGE_ZEROMQ
 
 config BR2_PACKAGE_ZEROMQ_PGM
 	bool "PGM/EPGM support"
-	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2014R1 # openpgm
-	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2013R1 # openpgm
+	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX # openpgm
 	select BR2_PACKAGE_OPENPGM
 	help
 	  Add support for Pragmatic General Multicast protocol (RFC 3208)
diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 7c738cf..fa4b08b 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -381,7 +381,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_X86
 	  Other architecture variants (beyond Pentium-4/Xeon) are
 	  supported as well, but glibc is not optimised for it.
 
-config BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2014R1
+config BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX
 	bool "Blackfin.uclinux.org 2014R1"
 	depends on BR2_bfin
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
@@ -398,23 +398,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2014R1
 	  Toolchain for the Blackfin architecture, from
 	  http://blackfin.uclinux.org.
 
-config BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2013R1
-	bool "Blackfin.uclinux.org 2013R1"
-	depends on BR2_bfin
-	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
-	select BR2_TOOLCHAIN_EXTERNAL_UCLIBC
-	select BR2_INSTALL_LIBSTDCPP
-	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
-	select BR2_USE_WCHAR
-	select BR2_TOOLCHAIN_HAS_THREADS
-	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
-	select BR2_HOSTARCH_NEEDS_IA32_LIBS
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_10
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_3
-	help
-	  Toolchain for the Blackfin architecture, from
-	  http://blackfin.uclinux.org.
-
 # See note about Linar ARM/ARMEB toolchains, above.
 config BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64
 	bool "Linaro AArch64 14.09"
@@ -570,10 +553,8 @@ config BR2_TOOLCHAIN_EXTERNAL_PREFIX
 	default "sh-linux-gnu"           if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH
 	default "i686-pc-linux-gnu"	 if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_X86
 	default "x86_64-amd-linux-gnu"   if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_AMD64
-	default "bfin-uclinux"		 if BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2013R1 && BR2_BINFMT_FLAT
-	default "bfin-linux-uclibc"	 if BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2013R1 && BR2_BINFMT_FDPIC
-	default "bfin-uclinux"		 if BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2014R1 && BR2_BINFMT_FLAT
-	default "bfin-linux-uclibc"	 if BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2014R1 && BR2_BINFMT_FDPIC
+	default "bfin-uclinux"		 if BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX && BR2_BINFMT_FLAT
+	default "bfin-linux-uclibc"	 if BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX && BR2_BINFMT_FDPIC
 	default "arm-linux-musleabi"	 if BR2_TOOLCHAIN_EXTERNAL_MUSL_CROSS && BR2_arm
 	default "armeb-linux-musleabi"	 if BR2_TOOLCHAIN_EXTERNAL_MUSL_CROSS && BR2_armeb
 	default "i486-linux-musl"	 if BR2_TOOLCHAIN_EXTERNAL_MUSL_CROSS && BR2_i386
diff --git a/toolchain/toolchain-external/toolchain-external.hash b/toolchain/toolchain-external/toolchain-external.hash
index 91dc27c..35ee85c 100644
--- a/toolchain/toolchain-external/toolchain-external.hash
+++ b/toolchain/toolchain-external/toolchain-external.hash
@@ -6,11 +6,7 @@ sha256 e653102803d0fadc0a83286400c03bc7932ab081d3f8fc8917c34e76468315a2  mips-20
 # Next hashes are all locally computed
 
 # Blackfin toolchains from Analog Devices
-sha256 fba010929c7355a0286fc4b1817d6065ee21380d3c2993383d3778f0b998ca9d  blackfin-toolchain-2012R2-RC2.i386.tar.bz2
-sha256 90284fe72125f381817da505b6f91f2b0c86a763ffe2c722c7d6b3ae60b25010  blackfin-toolchain-2013R1-RC1.i386.tar.bz2
 sha256 e424e90d8481d942a40266d78d1488726561fed3ec38403094f98055e61889d0  blackfin-toolchain-2014R1-RC2.i386.tar.bz2
-sha256 436ca3d901b152094cd6be2b6e274c59643387f46bb0563db1adcab1202f1455  blackfin-toolchain-uclibc-full-2012R2-RC2.i386.tar.bz2
-sha256 4d66a3390ae9e1c4b9aad214757791a5e0c45ef2bb31977fa6d3a80d96290237  blackfin-toolchain-uclibc-full-2013R1-RC1.i386.tar.bz2
 sha256 c65b1b4b918d5185349d62a3b7bf43b4b21e1175c52598ec047ca56b3f11d857  blackfin-toolchain-uclibc-full-2014R1-RC2.i386.tar.bz2
 
 # Mentor's Sourcery CodeBench Lite toolchains
diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index 497577f..f408bdb 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -142,7 +142,7 @@ ifneq ($(TOOLCHAIN_EXTERNAL_PREFIX),)
 TOOLCHAIN_EXTERNAL_BIN := $(shell dirname $(shell which $(TOOLCHAIN_EXTERNAL_PREFIX)-gcc))
 endif
 else
-ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2014R1)$(BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2013R1),y)
+ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX),y)
 TOOLCHAIN_EXTERNAL_BIN := $(TOOLCHAIN_EXTERNAL_INSTALL_DIR)/$(TOOLCHAIN_EXTERNAL_PREFIX)/bin
 else
 TOOLCHAIN_EXTERNAL_BIN := $(TOOLCHAIN_EXTERNAL_INSTALL_DIR)/bin
@@ -329,13 +329,7 @@ TOOLCHAIN_EXTERNAL_SOURCE = ia32-2012.09-62-i686-pc-linux-gnu-i386-linux.tar.bz2
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_AMD64),y)
 TOOLCHAIN_EXTERNAL_SITE = https://sourcery.mentor.com/public/gnu_toolchain/x86_64-amd-linux-gnu
 TOOLCHAIN_EXTERNAL_SOURCE = amd-2015.11-36-x86_64-amd-linux-gnu-i686-pc-linux-gnu.tar.bz2
-else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2013R1),y)
-TOOLCHAIN_EXTERNAL_SITE = http://downloads.sourceforge.net/project/adi-toolchain/2013R1/2013R1-RC1/i386
-TOOLCHAIN_EXTERNAL_SOURCE = blackfin-toolchain-2013R1-RC1.i386.tar.bz2
-TOOLCHAIN_EXTERNAL_EXTRA_DOWNLOADS = blackfin-toolchain-uclibc-full-2013R1-RC1.i386.tar.bz2
-TOOLCHAIN_EXTERNAL_STRIP_COMPONENTS = 3
-TOOLCHAIN_EXTERNAL_POST_EXTRACT_HOOKS += TOOLCHAIN_EXTERNAL_BLACKFIN_UCLIBC_EXTRA_EXTRACT
-else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2014R1),y)
+else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX),y)
 TOOLCHAIN_EXTERNAL_SITE = http://downloads.sourceforge.net/project/adi-toolchain/2014R1/2014R1-RC2/i386
 TOOLCHAIN_EXTERNAL_SOURCE = blackfin-toolchain-2014R1-RC2.i386.tar.bz2
 TOOLCHAIN_EXTERNAL_EXTRA_DOWNLOADS = blackfin-toolchain-uclibc-full-2014R1-RC2.i386.tar.bz2
-- 
2.4.3
