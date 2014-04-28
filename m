From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 28 Apr 2014 22:14:27 +0200
Subject: [Buildroot] [git commit] use default gcc 4.8.2 for microblaze
Message-ID: <20140429125019.14E319C9C5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3f82e9dbcd6d066841f85c881bdc9beb591bc744
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Upstream gcc 4.8.2 works fine for microblaze, no need for
Xilinx Git.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Acked-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Tested-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gcc/Config.in.host |   12 +++---------
 package/gcc/gcc.mk         |    4 ----
 2 files changed, 3 insertions(+), 13 deletions(-)

diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index ca991da..6c2f753 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -9,7 +9,7 @@ choice
 	default BR2_GCC_VERSION_4_2_2_AVR32_2_1_5 if BR2_avr32
 	default BR2_GCC_VERSION_4_8_X if BR2_aarch64
 	default BR2_GCC_VERSION_4_8_ARC if BR2_arc
-	default BR2_GCC_VERSION_4_9_MICROBLAZE if BR2_microblaze
+	default BR2_GCC_VERSION_4_8_X if BR2_microblaze
 	default BR2_GCC_VERSION_4_5_X if BR2_bfin
 	default BR2_GCC_VERSION_4_7_X
 	help
@@ -50,7 +50,7 @@ choice
 		bool "gcc 4.7.x"
 
 	config BR2_GCC_VERSION_4_8_X
-		depends on !BR2_microblaze && !BR2_arc && !BR2_avr32 && !BR2_bfin && !BR2_cortex_a12 && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8
+		depends on !BR2_arc && !BR2_avr32 && !BR2_bfin && !BR2_cortex_a12 && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8
 		select BR2_GCC_NEEDS_MPC
 		bool "gcc 4.8.x"
 
@@ -64,13 +64,8 @@ choice
 		select BR2_GCC_NEEDS_MPC
 		bool "gcc 4.9.x"
 
-	config BR2_GCC_VERSION_4_9_MICROBLAZE
-		depends on BR2_microblaze
-		select BR2_GCC_NEEDS_MPC
-		bool "gcc 4.9-microblaze"
-
 	config BR2_GCC_VERSION_SNAP
-		depends on !BR2_microblaze && !BR2_arc && !BR2_avr32 && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8
+		depends on !BR2_arc && !BR2_avr32 && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8
 		select BR2_GCC_NEEDS_MPC
 		bool "gcc snapshot"
 endchoice
@@ -104,7 +99,6 @@ config BR2_GCC_VERSION
 	default "4.8.2"     if BR2_GCC_VERSION_4_8_X
 	default "4.9.0"     if BR2_GCC_VERSION_4_9_X
 	default "c6227bc154124e270f15793deddfa3fe18f7db54" if BR2_GCC_VERSION_4_8_ARC
-	default "b93bb009e021aba64dd4b8cdb0bbc5a176c55543" if BR2_GCC_VERSION_4_9_MICROBLAZE
 	default BR2_GCC_SNAP_DATE if BR2_GCC_VERSION_SNAP
 
 config BR2_EXTRA_GCC_CONFIG_OPTIONS
diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index 32219cc..3fe2844 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -22,10 +22,6 @@ GCC_SITE = ftp://www.at91.com/pub/buildroot/
 else ifeq ($(BR2_arc),y)
 GCC_SITE = $(call github,foss-for-synopsys-dwc-arc-processors,gcc,$(GCC_VERSION))
 GCC_SOURCE = gcc-$(GCC_VERSION).tar.gz
-else ifeq ($(BR2_microblaze),y)
-GCC_SITE = $(call github,Xilinx,gcc,$(GCC_VERSION))
-GCC_SOURCE = gcc-$(GCC_VERSION).tar.gz
-else
 GCC_SITE = $(BR2_GNU_MIRROR:/=)/gcc/gcc-$(GCC_VERSION)
 endif
 
