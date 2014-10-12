From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 12 Oct 2014 12:09:34 +0200
Subject: [Buildroot] [git commit] gcc: remove gcc snapshot option
Message-ID: <20141012104112.81234B23A6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d313a80d6221c8446f93ca0537a50fc26692050d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As discussed during the dev days. It is broken for uClibc/musl and
architectures not using mainline gcc, so it has only very limited
usefulness.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gcc/Config.in.host |   23 -----------------------
 package/gcc/gcc.mk         |   10 ++--------
 2 files changed, 2 insertions(+), 31 deletions(-)

diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 75c589c..d96428c 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -112,34 +112,12 @@ choice
 		select BR2_GCC_NEEDS_MPC
 		select BR2_GCC_SUPPORTS_GRAPHITE
 
-	config BR2_GCC_VERSION_SNAP
-		bool "gcc snapshot"
-		# Broken or unsupported architectures
-		depends on !BR2_arc && !BR2_avr32
-		# musl patches only for release gcc versions
-		depends on !BR2_TOOLCHAIN_BUILDROOT_MUSL
-		select BR2_GCC_NEEDS_MPC
-		select BR2_GCC_SUPPORTS_GRAPHITE
 endchoice
 
 config BR2_GCC_SUPPORTS_FINEGRAINEDMTUNE
 	bool
 	default y if !BR2_GCC_VERSION_4_2_2_AVR32_2_1_5
 
-config BR2_GCC_SNAP_DATE
-	string "GCC snapshot date"
-	default "4.8-20120429"
-	depends on BR2_GCC_VERSION_SNAP
-	help
-	  Enter snapshot date to use for gcc.
-	  Format is: A.B-YYYYMMDD
-
-	  A is GCC major version, for example 4.
-	  B is GCC minor version, for example 7.
-	  YYYYMMDD is snapshot date, for example 20110430.
-
-	  This way we'd get version 4.7-20110430
-
 config BR2_GCC_VERSION
 	string
 	default "4.2.2-avr32-2.1.5" if BR2_GCC_VERSION_4_2_2_AVR32_2_1_5
@@ -149,7 +127,6 @@ config BR2_GCC_VERSION
 	default "4.8.3"     if BR2_GCC_VERSION_4_8_X
 	default "4.9.1"     if BR2_GCC_VERSION_4_9_X
 	default "arc-2014.08" if BR2_GCC_VERSION_4_8_ARC
-	default BR2_GCC_SNAP_DATE if BR2_GCC_VERSION_SNAP
 
 config BR2_EXTRA_GCC_CONFIG_OPTIONS
 	string "Additional gcc options"
diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index 3303591..7bed159 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -10,13 +10,7 @@
 
 GCC_VERSION = $(call qstrip,$(BR2_GCC_VERSION))
 
-ifeq ($(BR2_GCC_VERSION_SNAP),y)
-GCC_SNAP_DATE = $(call qstrip,$(BR2_GCC_SNAP_DATE))
-endif
-
-ifneq ($(GCC_SNAP_DATE),)
-GCC_SITE = ftp://gcc.gnu.org/pub/gcc/snapshots/$(GCC_SNAP_DATE)
-else ifeq ($(findstring avr32,$(GCC_VERSION)),avr32)
+ifeq ($(findstring avr32,$(GCC_VERSION)),avr32)
 GCC_SITE = ftp://www.at91.com/pub/buildroot
 else ifeq ($(BR2_arc),y)
 GCC_SITE = $(call github,foss-for-synopsys-dwc-arc-processors,gcc,$(GCC_VERSION))
@@ -160,7 +154,7 @@ else
 HOST_GCC_COMMON_CONF_OPTS += --without-isl --without-cloog
 endif
 
-ifneq ($(BR2_arc)$(BR2_GCC_VERSION_SNAP),)
+ifeq ($(BR2_arc),y)
 HOST_GCC_COMMON_DEPENDENCIES += host-flex host-bison
 endif
 
