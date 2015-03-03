From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue,  3 Mar 2015 12:52:31 -0300
Subject: [Buildroot] [PATCH v2 8/8] toolchain-external: add CodeSourcery
	AMD64 2014.05
In-Reply-To: <1425397951-30603-1-git-send-email-gustavo@zacarias.com.ar>
References: <1425397951-30603-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1425397951-30603-8-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This toolchain is AMD64-only so restrict it accordingly.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 toolchain/toolchain-external/Config.in             | 24 ++++++++++++++++++++++
 .../toolchain-external/toolchain-external.hash     |  4 ++++
 toolchain/toolchain-external/toolchain-external.mk |  3 +++
 3 files changed, 31 insertions(+)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index e70c3ce..d29bf43 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -670,6 +670,29 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH2A_201009
 	  has support for the following variants:
 	    - SH2A, uClibc, big endian
 
+config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_AMD64_201405
+	bool "Sourcery CodeBench AMD64 2014.05"
+	depends on BR2_x86_64
+	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
+	depends on !BR2_STATIC_LIBS
+	depends on BR2_x86_jaguar || BR2_x86_steamroller
+	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
+	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
+	select BR2_INSTALL_LIBSTDCPP
+	select BR2_HOSTARCH_NEEDS_IA32_LIBS
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_13
+	help
+	  Sourcery CodeBench toolchain for the amd64 (x86_64)
+	  architectures, from Mentor Graphics. It uses gcc 4.8.3,
+	  binutils 2.24.51, glibc 2.18, gdb 7.7.50 and kernel headers
+	  3.13.0. It has support for the following variants:
+	    - AMD Puma/Jaguar (family 16h), glibc
+	    Default for x86_64, nothing special to do.
+	    - AMD Steamroller (family 15h), glibc
+	    Select a steamroller core.
+	  No other architecture variants are supported since glibc
+	  is optimized for one of these two baselines.
+
 config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_X86_201209
 	bool "Sourcery CodeBench x86/x86_64 2012.09"
 	depends on BR2_i386 || BR2_x86_64
@@ -931,6 +954,7 @@ config BR2_TOOLCHAIN_EXTERNAL_PREFIX
 	default "i686-pc-linux-gnu"	 if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_X86_201109
 	default "i686-pc-linux-gnu"	 if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_X86_201203
 	default "i686-pc-linux-gnu"	 if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_X86_201209
+	default "x86_64-amd-linux-gnu"   if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_AMD64_201405
 	default "bfin-uclinux"		 if BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2 && BR2_BINFMT_FLAT
 	default "bfin-linux-uclibc"	 if BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2 && BR2_BINFMT_FDPIC
 	default "bfin-uclinux"		 if BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2013R1 && BR2_BINFMT_FLAT
diff --git a/toolchain/toolchain-external/toolchain-external.hash b/toolchain/toolchain-external/toolchain-external.hash
index 1f4de78..386f987 100644
--- a/toolchain/toolchain-external/toolchain-external.hash
+++ b/toolchain/toolchain-external/toolchain-external.hash
@@ -6,6 +6,10 @@ md5  14facaac538a43533b89d969d7904d46  mips-2014.05-27-mips-linux-gnu-i686-pc-li
 # From: https://sourcery.mentor.com/GNUToolchain/release2640
 md5  0ba8bc4923c04728ee3787bed4cd5148  mips-2013.11-36-mips-linux-gnu-i686-pc-linux-gnu.tar.bz2
 
+# Sourcery CodeBench Lite for AMD64
+# From https://sourcery.mentor.com/GNUToolchain/release2777
+md5	a1f8650d1a5ff726cca0893522fd8745	amd-2014.05-25-x86_64-amd-linux-gnu-i686-pc-linux-gnu.tar.bz2
+
 ######################################
 # Next hashes are all locally computed
 
diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index f9b8517..78138d3 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -328,6 +328,9 @@ TOOLCHAIN_EXTERNAL_SOURCE = ia32-2012.03-27-i686-pc-linux-gnu-i386-linux.tar.bz2
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_X86_201209),y)
 TOOLCHAIN_EXTERNAL_SITE = https://sourcery.mentor.com/public/gnu_toolchain/i686-pc-linux-gnu/
 TOOLCHAIN_EXTERNAL_SOURCE = ia32-2012.09-62-i686-pc-linux-gnu-i386-linux.tar.bz2
+else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_AMD64_201405),y)
+TOOLCHAIN_EXTERNAL_SITE = https://sourcery.mentor.com/public/gnu_toolchain/x86_64-amd-linux-gnu/
+TOOLCHAIN_EXTERNAL_SOURCE = amd-2014.05-25-x86_64-amd-linux-gnu-i686-pc-linux-gnu.tar.bz2
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2),y)
 TOOLCHAIN_EXTERNAL_SITE = http://downloads.sourceforge.net/project/adi-toolchain/2012R2/2012R2-RC2/i386/
 TOOLCHAIN_EXTERNAL_SOURCE = blackfin-toolchain-2012R2-RC2.i386.tar.bz2
-- 
2.0.5
