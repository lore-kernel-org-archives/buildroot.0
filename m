From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Dec 2009 00:04:39 +0100
Subject: [Buildroot] [PATCH 07/23] gcc: improve configuration for snapshot
	versions
In-Reply-To: <cover.1260831891.git.thomas.petazzoni@free-electrons.com>
References: <cover.1260831891.git.thomas.petazzoni@free-electrons.com>
Message-ID: <636afc4664238b9555411622f45ff4d00ceffcde.1260831891.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Make the selection of a snapshot version a normal gcc version choice,
and make sure BR2_GCC_VERSION is properly defined.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/gcc/Config.in   |   11 ++++++-----
 toolchain/gcc/Makefile.in |    2 +-
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/toolchain/gcc/Config.in b/toolchain/gcc/Config.in
index 07e42a6..10cb841 100644
--- a/toolchain/gcc/Config.in
+++ b/toolchain/gcc/Config.in
@@ -55,11 +55,11 @@ choice
 	config BR2_GCC_VERSION_4_4_X
 		depends on !BR2_avr32 && !BR2_nios2
 		bool "gcc 4.4.x"
-endchoice
 
-config BR2_GCC_IS_SNAP
-	depends on !BR2_avr32
-	bool
+	config BR2_GCC_VERSION_SNAP
+		depends on !BR2_avr32 && !BR2_nios2
+		bool "gcc snapshot"
+endchoice
 
 config BR2_GCC_SUPPORTS_SYSROOT
 	bool
@@ -72,7 +72,7 @@ config BR2_GCC_SUPPORTS_FINEGRAINEDMTUNE
 config BR2_GCC_SNAP_DATE
 	string "GCC snapshot date"
 	default "20070921"
-	depends on BR2_GCC_IS_SNAP
+	depends on BR2_GCC_VERSION_SNAP
 	help
 	  Enter snapshot date to use for gcc.  Format is:
 	  YYYYMMDD
@@ -89,6 +89,7 @@ config BR2_GCC_VERSION
 	default "4.3.3"     if BR2_GCC_VERSION_4_3_3
 	default "4.3.4"     if BR2_GCC_VERSION_4_3_4
 	default "4.4.2"     if BR2_GCC_VERSION_4_4_X
+	default $BR2_GCC_SNAP_DATE if BR2_GCC_VERSION_SNAP
 
 config BR2_TOOLCHAIN_SYSROOT
 	bool "Enable toolchain with --sysroot support"
diff --git a/toolchain/gcc/Makefile.in b/toolchain/gcc/Makefile.in
index e92ecbc..c3e21cf 100644
--- a/toolchain/gcc/Makefile.in
+++ b/toolchain/gcc/Makefile.in
@@ -8,7 +8,7 @@ GCC_VERSION:=$(call qstrip,$(BR2_GCC_VERSION))
 TARGET_OPTIMIZATION:=$(call qstrip,$(BR2_TARGET_OPTIMIZATION))
 EXTRA_GCC_CONFIG_OPTIONS:=$(call qstrip,$(BR2_EXTRA_GCC_CONFIG_OPTIONS))
 
-ifeq ($(call qstrip,$(BR2_GCC_IS_SNAP)),y)
+ifeq ($(call qstrip,$(BR2_GCC_VERSION_SNAP)),y)
 GCC_SNAP_DATE:=$(call qstrip,$(BR2_GCC_SNAP_DATE))
 else
 GCC_SNAP_DATE:=
-- 
1.6.3.3
