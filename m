From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  3 Jan 2012 21:48:46 +0100
Subject: [Buildroot] [PATCH 1/3] xenomai: bump to 2.6.0
In-Reply-To: <cover.1325623724.git.thomas.petazzoni@free-electrons.com>
References: <cover.1325623724.git.thomas.petazzoni@free-electrons.com>
Message-ID: <cd40e28044a3cbd6a93176e2ff4320e4231ac8f4.1325623724.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/xenomai/Config.in                   |   60 ----------------------
 package/xenomai/xenomai-fix-lfs-issue.patch |   72 +++++++++++++++++++++++++++
 package/xenomai/xenomai.mk                  |   11 +----
 3 files changed, 73 insertions(+), 70 deletions(-)
 create mode 100644 package/xenomai/xenomai-fix-lfs-issue.patch

diff --git a/package/xenomai/Config.in b/package/xenomai/Config.in
index cfeaa04..98ebf0a 100644
--- a/package/xenomai/Config.in
+++ b/package/xenomai/Config.in
@@ -43,66 +43,6 @@ config BR2_PACKAGE_XENOMAI_SMP
 	  This option allows to enable or disable SMP support. It has
 	  to match your kernel configuration.
 
-choice
-	prompt "Xenomai ARM CPU type"
-	depends on BR2_arm
-	default BR2_PACKAGE_XENOMAI_CPU_GENERIC_ARM
-	help
-	  On the ARM architecture, Xenomai needs to be configured for
-	  a specific sub-architecture.  Select the appropriate
-	  sub-architecture from the list.
-
-	config BR2_PACKAGE_XENOMAI_CPU_AT91RM9200
-		bool "Atmel AT91RM9200"
-
-	config BR2_PACKAGE_XENOMAI_CPU_AT91SAM926X
-		bool "Atmel AT91SAM926X"
-
-	config BR2_PACKAGE_XENOMAI_CPU_INTEGRATOR
-		bool "ARM Ltd. Integrator"
-
-	config BR2_PACKAGE_XENOMAI_CPU_IXP4XX
-		bool "Intel IXP4XX (XScale)"
-
-	config BR2_PACKAGE_XENOMAI_CPU_IMX
-		bool "Freescale i.MX (MX1/MXL)"
-
-	config BR2_PACKAGE_XENOMAI_CPU_IMX21
-		bool "Freescale i.MX21"
-
-	config BR2_PACKAGE_XENOMAI_CPU_MX2
-		bool "Freescale MXC/MX2"
-
-	config BR2_PACKAGE_XENOMAI_CPU_MX3
-		bool "Freescale MXC/MX3"
-
-	config BR2_PACKAGE_XENOMAI_CPU_SA1100
-		bool "StrongARM SA1100"
-
-	config BR2_PACKAGE_XENOMAI_CPU_S3C2410
-		bool "S3C2410"
-
-	config BR2_PACKAGE_XENOMAI_CPU_GENERIC_ARM
-		bool "Generic ARM"
-
-endchoice
-
-# Now set CPU type. We force manually selected type even if detected in case
-# user takes the risk.
-config BR2_PACKAGE_XENOMAI_CPU_TYPE
-	string
-	depends on BR2_PACKAGE_XENOMAI && BR2_arm
-	default "at91rm9200"  if BR2_PACKAGE_XENOMAI_CPU_AT91RM9200
-	default "at91sam926x" if BR2_PACKAGE_XENOMAI_CPU_AT91SAM926X
-	default "integrator"  if BR2_PACKAGE_XENOMAI_CPU_INTEGRATOR
-	default "ixp4xx"      if BR2_PACKAGE_XENOMAI_CPU_IXP4XX
-	default "generic"     if BR2_PACKAGE_XENOMAI_CPU_GENERIC_ARM
-	default "imx"         if BR2_PACKAGE_XENOMAI_CPU_IMX
-	default "imx21"       if BR2_PACKAGE_XENOMAI_CPU_IMX21
-	default "mx2"         if BR2_PACKAGE_XENOMAI_CPU_MX2
-	default "mx3"         if BR2_PACKAGE_XENOMAI_CPU_MX3
-	default "s3c2410"     if BR2_PACKAGE_XENOMAI_CPU_S3C2410
-
 config BR2_PACKAGE_XENOMAI_TESTSUITE
        bool "Install testsuite"
        help
diff --git a/package/xenomai/xenomai-fix-lfs-issue.patch b/package/xenomai/xenomai-fix-lfs-issue.patch
new file mode 100644
index 0000000..157c8e2
--- /dev/null
+++ b/package/xenomai/xenomai-fix-lfs-issue.patch
@@ -0,0 +1,72 @@
+From: Gilles Chanteperdrix <gilles.chanteperdrix@xenomai.org>
+Date: Sat, 5 Nov 2011 20:59:01 +0000 (+0100)
+Subject: posix: fix compilation for LFS
+X-Git-Url: http://git.xenomai.org/?p=xenomai-2.6.git;a=commitdiff_plain;h=06ae5c5e47fbfd9d8dbbe6fcf1a1db0c14bad9de;hp=8f6feff876029244dabc1257cdf13209fbd64fb5
+
+posix: fix compilation for LFS
+---
+
+diff --git a/include/posix/sys/mman.h b/include/posix/sys/mman.h
+index 455e565..a304755 100644
+--- a/include/posix/sys/mman.h
++++ b/include/posix/sys/mman.h
+@@ -63,17 +63,16 @@ int __real_shm_open(const char *name, int oflag, mode_t mode);
+ 
+ int __real_shm_unlink(const char *name);
+ 
+-#if !defined(_FILE_OFFSET_BITS) || _FILE_OFFSET_BITS != 64
+ void *__real_mmap(void *addr,
+ 		  size_t len,
+ 		  int prot,
+ 		  int flags,
+ 		  int fildes,
+ 		  long off);
+-#else
+-#define __real_mmap __real_mmap64
+-#endif
+-#ifdef _LARGEFILE64_SOURCE
++
++#if __WORDSIZE == 32
++#if defined(_LARGEFILE64_SOURCE) \
++	|| defined(_FILE_OFFSET_BITS) && _FILE_OFFSET_BITS == 64
+ void *__real_mmap64(void *addr,
+ 		    size_t len,
+ 		    int prot,
+@@ -82,6 +81,11 @@ void *__real_mmap64(void *addr,
+ 		    long long off);
+ #endif
+ 
++#if defined(_FILE_OFFSET_BITS) && _FILE_OFFSET_BITS == 64
++#define __real_mmap __real_mmap64
++#endif
++#endif
++
+ int __real_munmap(void *addr, size_t len);
+ 
+ #ifdef __cplusplus
+diff --git a/include/posix/unistd.h b/include/posix/unistd.h
+index 49463a0..90cce86 100644
+--- a/include/posix/unistd.h
++++ b/include/posix/unistd.h
+@@ -54,13 +54,17 @@ int ftruncate(int fildes, off_t length);
+ extern "C" {
+ #endif
+ 
+-#if !defined(_FILE_OFFSET_BITS) || _FILE_OFFSET_BITS != 64
+ int __real_ftruncate(int fildes, long length);
+-#else
++
++#if __WORDSIZE == 32
++#if defined(_LARGEFILE64_SOURCE) \
++	|| defined(_FILE_OFFSET_BITS) && _FILE_OFFSET_BITS == 64
++int __real_ftruncate64(int fildes, long long length);
++#endif
++
++#if defined(_FILE_OFFSET_BITS) && _FILE_OFFSET_BITS == 64
+ #define __real_ftruncate __real_ftruncate64
+ #endif
+-#ifdef _LARGEFILE64_SOURCE
+-int __real_ftruncate64(int fildes, long long length);
+ #endif
+ 
+ ssize_t __real_read(int fd, void *buf, size_t nbyte);
diff --git a/package/xenomai/xenomai.mk b/package/xenomai/xenomai.mk
index f795579..b1a492f 100644
--- a/package/xenomai/xenomai.mk
+++ b/package/xenomai/xenomai.mk
@@ -7,7 +7,7 @@
 
 XENOMAI_VERSION = $(call qstrip,$(BR2_PACKAGE_XENOMAI_VERSION))
 ifeq ($(XENOMAI_VERSION),)
-XENOMAI_VERSION = 2.5.6
+XENOMAI_VERSION = 2.6.0
 endif
 
 XENOMAI_SITE = http://download.gna.org/xenomai/stable/
@@ -15,15 +15,6 @@ XENOMAI_SOURCE = xenomai-$(XENOMAI_VERSION).tar.bz2
 
 XENOMAI_INSTALL_STAGING = YES
 
-ifeq ($(BR2_arm),y)
-XENOMAI_CPU_TYPE = $(call qstrip,$(BR2_PACKAGE_XENOMAI_CPU_TYPE))
-# Set "generic" if not defined
-ifeq ($(XENOMAI_CPU_TYPE),)
-XENOMAI_CPU_TYPE = generic
-endif
-XENOMAI_CONF_OPT += --enable-arm-mach=$(XENOMAI_CPU_TYPE)
-endif #BR2_arm
-
 ifeq ($(BR2_PACKAGE_XENOMAI_SMP),y)
 XENOMAI_CONF_OPT += --enable-smp
 endif
-- 
1.7.4.1
