From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Dec 2010 15:17:04 +0100
Subject: [Buildroot] [PATCH 08/14] toolchain: rework thread options
In-Reply-To: <cover.1292163398.git.thomas.petazzoni@free-electrons.com>
References: <cover.1292163398.git.thomas.petazzoni@free-electrons.com>
Message-ID: <4c7626f5038ea265905e9c86c1af123d34623ab0.1292163398.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The selection of linuxthreads, linuxthreads old or NPTL doesn't make a
lot of sense for external toolchains. So, instead, we :

 * Introduce an hidden BR2_TOOLCHAIN_HAS_THREADS option, which must be
   selected by toolchain specific options when thread support is
   available. Package needing to test thread support should use this
   option.

 * Move the none/linuxthreads/linuxthreads old/NPTL selection to
   Buildroot internal toolchain configuration.

 * Add an option in external toolchain to tell if thread support is
   available or not in the external toolchain.

ffmpeg, dmalloc and openvpn are fixed to use the new
BR2_TOOLCHAIN_HAS_THREADS option. For openvpn, --enable-threads=posix
is no longer used, as the configure script doesn't even understand
this option.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/dmalloc/dmalloc.mk                |    6 +++---
 package/ltp-testsuite/Config.in           |    4 ++--
 package/multimedia/ffmpeg/ffmpeg.mk       |    6 +++---
 package/openvpn/openvpn.mk                |    6 +++---
 toolchain/Makefile.in                     |    6 ------
 toolchain/gcc/gcc-uclibc-4.x.mk           |    6 ++++++
 toolchain/toolchain-buildroot/Config.in.2 |   27 +++++++++++++++++++++++++++
 toolchain/toolchain-common.in             |   29 +++--------------------------
 toolchain/toolchain-external/Config.in    |   14 ++++++++++++++
 toolchain/toolchain-external/ext-tool.mk  |    2 +-
 10 files changed, 62 insertions(+), 44 deletions(-)

diff --git a/package/dmalloc/dmalloc.mk b/package/dmalloc/dmalloc.mk
index 60ad763..dca0488 100644
--- a/package/dmalloc/dmalloc.mk
+++ b/package/dmalloc/dmalloc.mk
@@ -16,10 +16,10 @@ else
 DMALLOC_CONF_OPT+=--disable-cxx
 endif
 
-ifeq ($(BR2_PTHREADS_NONE),y)
-DMALLOC_CONF_OPT+=--disable-threads
-else
+ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
 DMALLOC_CONF_OPT+=--enable-threads
+else
+DMALLOC_CONF_OPT+=--disable-threads
 endif
 
 define DMALLOC_POST_PATCH
diff --git a/package/ltp-testsuite/Config.in b/package/ltp-testsuite/Config.in
index e059af3..5024cc3 100644
--- a/package/ltp-testsuite/Config.in
+++ b/package/ltp-testsuite/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_LTP_TESTSUITE
 	bool "ltp-testsuite"
-	depends on !BR2_PTHREADS_NONE
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	# Several tests of LTP use legacy functions that are usually
 	# not available in uClibc.
 	depends on BR2_TOOLCHAIN_EXTERNAL_GLIBC || \
@@ -15,4 +15,4 @@ comment "ltp-testsuite requires a glibc toolchain with thread support"
 	depends on (!BR2_TOOLCHAIN_EXTERNAL_GLIBC && \
 		    !BR2_TOOLCHAIN_CTNG_glibc	  && \
 		    !BR2_TOOLCHAIN_CTNG_eglibc)   || \
-                    BR2_PTHREADS_NONE
+                    !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/multimedia/ffmpeg/ffmpeg.mk b/package/multimedia/ffmpeg/ffmpeg.mk
index 959efa3..f0ec930 100644
--- a/package/multimedia/ffmpeg/ffmpeg.mk
+++ b/package/multimedia/ffmpeg/ffmpeg.mk
@@ -111,10 +111,10 @@ else
 FFMPEG_CONF_OPT += --disable-outdevs
 endif
 
-ifeq ($(BR2_PTHREADS_NONE),y)
-FFMPEG_CONF_OPT += --disable-pthreads
-else
+ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
 FFMPEG_CONF_OPT += --enable-pthreads
+else
+FFMPEG_CONF_OPT += --disable-pthreads
 endif
 
 ifeq ($(BR2_PACKAGE_ZLIB),y)
diff --git a/package/openvpn/openvpn.mk b/package/openvpn/openvpn.mk
index 7d8fb0c..ba91690 100644
--- a/package/openvpn/openvpn.mk
+++ b/package/openvpn/openvpn.mk
@@ -8,10 +8,10 @@ OPENVPN_VERSION = 2.1.3
 OPENVPN_SITE = http://openvpn.net/release
 OPENVPN_CONF_OPT = --enable-small
 
-ifeq ($(BR2_PTHREADS_NATIVE),y)
-	OPENVPN_CONF_OPT += --enable-threads=posix
-else
+ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
 	OPENVPN_CONF_OPT += --enable-pthread
+else
+	OPENVPN_CONF_OPT += --disable-pthread
 endif
 
 ifeq ($(BR2_PACKAGE_OPENVPN_LZO),y)
diff --git a/toolchain/Makefile.in b/toolchain/Makefile.in
index 371509f..2cb6e95 100644
--- a/toolchain/Makefile.in
+++ b/toolchain/Makefile.in
@@ -1,9 +1,3 @@
-ifeq ($(BR2_PTHREADS_NONE),y)
-THREADS:=--disable-threads
-else
-THREADS:=--enable-threads
-endif
-
 BR2_CONFIGURE_DEVEL_SYSROOT=--with-sysroot=$(TOOLCHAIN_DIR)/uClibc_dev/
 BR2_CONFIGURE_STAGING_SYSROOT=--with-sysroot=$(STAGING_DIR)
 BR2_CONFIGURE_BUILD_TOOLS=--with-build-time-tools=$(STAGING_DIR)/usr/$(REAL_GNU_TARGET_NAME)/bin
diff --git a/toolchain/gcc/gcc-uclibc-4.x.mk b/toolchain/gcc/gcc-uclibc-4.x.mk
index eec6523..5f69906 100644
--- a/toolchain/gcc/gcc-uclibc-4.x.mk
+++ b/toolchain/gcc/gcc-uclibc-4.x.mk
@@ -138,6 +138,12 @@ else
 GCC_TLS:=--disable-tls
 endif
 
+ifeq ($(BR2_PTHREADS_NONE),y)
+THREADS:=--disable-threads
+else
+THREADS:=--enable-threads
+endif
+
 ifeq ($(BR2_GCC_SUPPORTS_FINEGRAINEDMTUNE),y)
 GCC_DECIMAL_FLOAT:=--disable-decimal-float
 endif
diff --git a/toolchain/toolchain-buildroot/Config.in.2 b/toolchain/toolchain-buildroot/Config.in.2
index f1b0a7c..fe93e70 100644
--- a/toolchain/toolchain-buildroot/Config.in.2
+++ b/toolchain/toolchain-buildroot/Config.in.2
@@ -76,6 +76,33 @@ config BR2_TOOLCHAIN_BUILDROOT_USE_SSP
 	  See http://www.linuxfromscratch.org/hints/downloads/files/ssp.txt
 	  for details.
 
+choice
+	prompt "Thread library implementation"
+	default BR2_PTHREADS_OLD
+	help
+	  Use this option to select the thread library implementation
+	  that should be used in your toolchain. Not all thread
+	  variants work with all versions of uClibc, the "linuxthreads
+	  (stable/old)" may be a working fallback if you need
+	  threading at all.
+
+	config BR2_PTHREADS_NONE
+		bool "none"
+
+	config BR2_PTHREADS
+		bool "linuxthreads"
+	        select BR2_TOOLCHAIN_HAS_THREADS
+
+	config BR2_PTHREADS_OLD
+		bool "linuxthreads (stable/old)"
+	        select BR2_TOOLCHAIN_HAS_THREADS
+
+	config BR2_PTHREADS_NATIVE
+		bool "Native POSIX Threading (NPTL)"
+	        select BR2_TOOLCHAIN_HAS_THREADS
+		depends on BR2_UCLIBC_VERSION_SNAPSHOT
+endchoice
+
 source "toolchain/elf2flt/Config.in"
 source "toolchain/mklibs/Config.in"
 source "toolchain/sstrip/Config.in"
diff --git a/toolchain/toolchain-common.in b/toolchain/toolchain-common.in
index 5502ab4..34d70a0 100644
--- a/toolchain/toolchain-common.in
+++ b/toolchain/toolchain-common.in
@@ -26,6 +26,9 @@ config BR2_PROGRAM_INVOCATION
 config BR2_INSTALL_LIBSTDCPP
 	bool
 
+config BR2_TOOLCHAIN_HAS_THREADS
+	bool
+
 config BR2_ENABLE_LOCALE_PURGE
 	bool "Purge unwanted locales"
 	help
@@ -76,32 +79,6 @@ config BR2_SOFT_FLOAT
 	  functions, then everything will need to be compiled with soft
 	  floating point support (-msoft-float).
 
-choice
-	prompt "Thread library implementation"
-	default BR2_PTHREADS_OLD
-	help
-	  If you are building your own toolchain then select the type of 
-	  libpthreads you want to use.
-	  Not all thread variants work with all versions of uClibc,
-	  the "linuxthreads (stable/old)" may be a working fallback
-	  if you need threading at all.
-	  If you have an external binary toolchain then select the type 
-	  of libpthreads it was built with.
-
-	config BR2_PTHREADS_NONE
-		bool "none"
-
-	config BR2_PTHREADS
-		bool "linuxthreads"
-
-	config BR2_PTHREADS_OLD
-		bool "linuxthreads (stable/old)"
-
-	config BR2_PTHREADS_NATIVE
-		bool "Native POSIX Threading (NPTL)"
-		depends on BR2_UCLIBC_VERSION_SNAPSHOT
-endchoice
-
 config BR2_TARGET_OPTIMIZATION
 	string "Target Optimizations"
 	default "-pipe"
diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index bd22e0c..7b86e74 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -8,6 +8,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201009
 	depends on BR2_arm
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_INSTALL_LIBSTDCPP
+	select BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  Toolchain for the ARM architecture, from CodeSourcery. It
 	  uses gcc 4.5.1, binutils 2.20, glibc 2.11 and gdb 7.2.50,
@@ -22,6 +23,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM2010Q1
 	depends on BR2_arm
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_INSTALL_LIBSTDCPP
+	select BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  Toolchain for the ARM architecture, from CodeSourcery. It
 	  uses gcc 4.4.1, binutils 2.19, glibc 2.11, gdb 7.0.50 and
@@ -36,6 +38,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM2009Q1
 	depends on BR2_arm
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_INSTALL_LIBSTDCPP
+	select BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  Toolchain for the ARM architecture, from CodeSourcery. It
 	  uses gcc 4.3.3, binutils 2.19, glibc 2.8 and gdb 6.8 and
@@ -50,6 +53,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS44
 	depends on BR2_mips || BR2_mipsel
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_INSTALL_LIBSTDCPP
+	select BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  Toolchain for the MIPS architecture, from CodeSourcery. It
 	  uses gcc 4.4.1, binutils 2.19, glibc 2.11, uClibc 0.9.30 and
@@ -73,6 +77,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201009
 	depends on BR2_powerpc
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_INSTALL_LIBSTDCPP
+	select BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  Toolchain for the PowerPC architecture, from
 	  CodeSourcery. It uses gcc 4.5.1, binutils 2.20, glibc 2.11,
@@ -91,6 +96,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH201009
 	depends on BR2_sh
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_INSTALL_LIBSTDCPP
+	select BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  Toolchain for the SuperH architecture, from CodeSourcery. It
 	  uses gcc 4.5.1, binutils 2.20, glibc 2.11, uClibc 0.9.30,
@@ -230,6 +236,14 @@ config BR2_TOOLCHAIN_EXTERNAL_CXX
 	  support. If you don't know, leave the default value,
 	  Buildroot will tell you if it's correct or not.
 
+config BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS
+	bool "Toolchain has threads support?"
+	select BR2_TOOLCHAIN_HAS_THREADS
+	help
+	  Select this option if your external toolchain has thread
+	  support. If you don't know, leave the default value,
+	  Buildroot will tell you if it's correct or not.
+
 endif # BR2_TOOLCHAIN_EXTERNAL_CUSTOM
 
 endif # BR2_TOOLCHAIN_EXTERNAL
diff --git a/toolchain/toolchain-external/ext-tool.mk b/toolchain/toolchain-external/ext-tool.mk
index 71aa127..d4f5bc5 100644
--- a/toolchain/toolchain-external/ext-tool.mk
+++ b/toolchain/toolchain-external/ext-tool.mk
@@ -53,7 +53,7 @@ ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
 USR_LIB_EXTERNAL_LIBS+=libstdc++.so
 endif
 
-ifneq ($(BR2_PTHREADS_NONE),y)
+ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
 LIB_EXTERNAL_LIBS+=libpthread.so
 ifeq ($(BR2_PACKAGE_GDB_SERVER),y)
 LIB_EXTERNAL_LIBS+=libthread_db.so
-- 
1.7.0.4
