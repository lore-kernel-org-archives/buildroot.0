From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 9 May 2012 11:17:07 +0200
Subject: [Buildroot] [git commit] crosstool-ng: use uClibc 0.9.33.1 / NPTL
	by default
Message-ID: <20120509091953.0979096C81@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a79f0494a14e5a99edc3ff52ff04f796e5a56453
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

So we're in sync with the internal toolchain.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/toolchain-crosstool-ng/Config.in         |    8 +-------
 .../crosstool-ng.config-uClibc                     |   10 +++++-----
 toolchain/toolchain-crosstool-ng/crosstool-ng.mk   |    2 +-
 3 files changed, 7 insertions(+), 13 deletions(-)

diff --git a/toolchain/toolchain-crosstool-ng/Config.in b/toolchain/toolchain-crosstool-ng/Config.in
index 2d1e801..35ea2b1 100644
--- a/toolchain/toolchain-crosstool-ng/Config.in
+++ b/toolchain/toolchain-crosstool-ng/Config.in
@@ -99,11 +99,7 @@ config BR2_TOOLCHAIN_CTNG_CXX
 
 choice
 	prompt "Thread library implementation"
-	default BR2_TOOLCHAIN_CTNG_THREADS_PTHREADS_OLD \
-		if BR2_TOOLCHAIN_CTNG_uClibc
-	default BR2_TOOLCHAIN_CTNG_THREADS_NPTL		\
-		if BR2_TOOLCHAIN_CTNG_eglibc ||		\
-		   BR2_TOOLCHAIN_CTNG_glibc
+	default BR2_TOOLCHAIN_CTNG_THREADS_NPTL
 	help
 	  Enable thread support and select thread implementation. With
 	  glibc, thread support is mandatory but several
@@ -129,8 +125,6 @@ choice
 	config BR2_TOOLCHAIN_CTNG_THREADS_NPTL
 		bool "Native POSIX Threading (NPTL)"
 		select BR2_TOOLCHAIN_HAS_THREADS
-		depends on BR2_TOOLCHAIN_CTNG_eglibc || \
-			   BR2_TOOLCHAIN_CTNG_glibc
 endchoice
 
 endif # BR2_TOOLCHAIN_CTNG
diff --git a/toolchain/toolchain-crosstool-ng/crosstool-ng.config-uClibc b/toolchain/toolchain-crosstool-ng/crosstool-ng.config-uClibc
index 13b30d9..c115096 100644
--- a/toolchain/toolchain-crosstool-ng/crosstool-ng.config-uClibc
+++ b/toolchain/toolchain-crosstool-ng/crosstool-ng.config-uClibc
@@ -322,13 +322,13 @@ CT_CC_GCC_LDBL_128=m
 # C-library
 #
 CT_LIBC="uClibc"
-CT_LIBC_VERSION="0.9.32"
+CT_LIBC_VERSION="0.9.33.1"
 CT_LIBC_uClibc=y
 CT_LIBC_uClibc_AVAILABLE=y
-# CT_LIBC_UCLIBC_V_0_9_33_1 is not set
+# CT_LIBC_UCLIBC_V_0_9_33_1=y
 # CT_LIBC_UCLIBC_V_0_9_33 is not set
 # CT_LIBC_UCLIBC_V_0_9_32_1 is not set
-CT_LIBC_UCLIBC_V_0_9_32=y
+# CT_LIBC_UCLIBC_V_0_9_32 is not set
 # CT_LIBC_UCLIBC_V_0_9_30_3 is not set
 # CT_LIBC_UCLIBC_V_0_9_30_2 is not set
 # CT_LIBC_UCLIBC_V_0_9_30_1 is not set
@@ -355,8 +355,8 @@ CT_THREADS="linuxthreads"
 #
 # Common C library options
 #
-# CT_THREADS_NPTL is not set
-CT_THREADS_LINUXTHREADS=y
+CT_THREADS_NPTL=y
+# CT_THREADS_LINUXTHREADS is not set
 # CT_THREADS_NONE is not set
 CT_LIBC_XLDD=y
 
diff --git a/toolchain/toolchain-crosstool-ng/crosstool-ng.mk b/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
index eb9e963..25d2a16 100644
--- a/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
+++ b/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
@@ -10,7 +10,7 @@
 
 CTNG_DIR := $(BUILD_DIR)/build-toolchain
 
-CTNG_UCLIBC_CONFIG_FILE := $(TOPDIR)/toolchain/uClibc/uClibc-0.9.32.config
+CTNG_UCLIBC_CONFIG_FILE := $(TOPDIR)/toolchain/uClibc/uClibc-0.9.33.config
 CTNG_CONFIG_FILE:=$(call qstrip,$(BR2_TOOLCHAIN_CTNG_CONFIG))
 
 # Hack! ct-ng is in fact a Makefile script. As such, it accepts all
