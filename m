From: Romain Naour <romain.naour@gmail.com>
Date: Thu,  2 Jan 2020 23:04:15 +0100
Subject: [Buildroot] [PATCH] package/gcc: remove gcc 5.5 or1k fork
Message-ID: <20200102220415.431543-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Remove the old gcc 5.5 fork for or1k architecture
that start to fail to build with recent version
of Binutils >= 2.32 with the following error:

host-gcc-final-or1k-musl-5.4.0-20170218/build/./gcc/crtbeginS.o: addend should be zero for plt relocations
host/or1k-buildroot-linux-uclibc/bin/ld: final link failed: bad value

https://gitlab.com/kubu93/buildroot/-/jobs/391938988

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 Config.in.legacy           | 7 +++++++
 package/gcc/Config.in.host | 8 --------
 package/gcc/gcc.mk         | 5 +----
 3 files changed, 8 insertions(+), 12 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 8436951f0f..d34ef88e1d 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2020.02"
 
+config BR2_GCC_VERSION_OR1K
+	bool "gcc 5.x fork for or1k has been removed"
+	select BR2_LEGACY
+	help
+	  Support for gcc 5.x for or1k has been removed. The current
+	  default version (9.x or later) has been selected instead.
+
 config BR2_PACKAGE_PYTHON_SCAPY3K
 	bool "python-scapy3k is replaced by python-scapy"
 	select BR2_LEGACY
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 92af40b19f..3e60ced61f 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -4,7 +4,6 @@ choice
 	prompt "GCC compiler Version"
 	default BR2_GCC_VERSION_ARC if BR2_arc
 	default BR2_GCC_VERSION_CSKY if BR2_csky
-	default BR2_GCC_VERSION_OR1K if BR2_or1k
 	default BR2_GCC_VERSION_8_X
 	help
 	  Select the version of gcc you wish to use.
@@ -21,12 +20,6 @@ config BR2_GCC_VERSION_CSKY
 	depends on BR2_csky
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_6
 
-config BR2_GCC_VERSION_OR1K
-	bool "gcc or1k (5.x)"
-	# Only supported architecture
-	depends on BR2_or1k
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_5
-
 config BR2_GCC_VERSION_5_X
 	bool "gcc 5.x"
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_6
@@ -96,7 +89,6 @@ config BR2_GCC_VERSION
 	default "8.3.0"     if BR2_GCC_VERSION_8_X
 	default "9.2.0"     if BR2_GCC_VERSION_9_X
 	default "arc-2019.09-rc1" if BR2_GCC_VERSION_ARC
-	default "or1k-musl-5.4.0-20170218" if BR2_GCC_VERSION_OR1K
 	default "48152afb96c59733d5bc79e3399bb7b3d4b44266" if BR2_GCC_VERSION_CSKY
 
 config BR2_EXTRA_GCC_CONFIG_OPTIONS
diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index 527f30bf22..128293570d 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -13,9 +13,6 @@ GCC_VERSION = $(call qstrip,$(BR2_GCC_VERSION))
 ifeq ($(BR2_GCC_VERSION_ARC),y)
 GCC_SITE = $(call github,foss-for-synopsys-dwc-arc-processors,gcc,$(GCC_VERSION))
 GCC_SOURCE = gcc-$(GCC_VERSION).tar.gz
-else ifeq ($(BR2_GCC_VERSION_OR1K),y)
-GCC_SITE = $(call github,openrisc,or1k-gcc,$(GCC_VERSION))
-GCC_SOURCE = gcc-$(GCC_VERSION).tar.gz
 else ifeq ($(BR2_csky),y)
 GCC_SITE = $(call github,c-sky,gcc,$(GCC_VERSION))
 GCC_SOURCE = gcc-$(GCC_VERSION).tar.gz
@@ -168,7 +165,7 @@ else
 HOST_GCC_COMMON_CONF_OPTS += --without-isl --without-cloog
 endif
 
-ifeq ($(BR2_arc)$(BR2_GCC_VERSION_OR1K),y)
+ifeq ($(BR2_arc),y)
 HOST_GCC_COMMON_DEPENDENCIES += host-flex host-bison
 endif
 
-- 
2.24.1
