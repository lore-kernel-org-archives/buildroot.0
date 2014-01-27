From: Spenser Gilliland <spenser@gillilanding.com>
Date: Mon, 27 Jan 2014 15:51:40 -0600
Subject: [Buildroot] [PATCH v2] binutils: coexist upstream and vendor
	binutils for arc and microblaze
In-Reply-To: <1390859507-31670-1-git-send-email-spenser@gillilanding.com>
References: <1390859507-31670-1-git-send-email-spenser@gillilanding.com>
Message-ID: <1390859507-31670-4-git-send-email-spenser@gillilanding.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Make if possible to select an upstream tarball in addition to the default git
snapshot.

Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
---
 package/binutils/Config.in.host | 30 ++++++++++++++++++++++++++----
 package/binutils/binutils.mk    |  7 +++++--
 2 files changed, 31 insertions(+), 6 deletions(-)

diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
index 49b857e..35a2407 100644
--- a/package/binutils/Config.in.host
+++ b/package/binutils/Config.in.host
@@ -2,8 +2,8 @@ comment "Binutils Options"
 
 choice
 	prompt "Binutils Version"
-	depends on !BR2_arc
-	depends on !BR2_microblaze
+	default BR2_BINUTILS_VERSION_ARC_GIT if BR2_arc
+	default BR2_BINUTILS_VERSION_MB_GIT if BR2_microblaze
 	default BR2_BINUTILS_VERSION_2_21 if (BR2_mips || BR2_mipsel || BR2_sh)
 	default BR2_BINUTILS_VERSION_2_22
 	help
@@ -13,35 +13,57 @@ choice
 		depends on BR2_avr32
 		bool "binutils 2.18-avr32-1.0.1"
 
+	config BR2_BINUTILS_VERSION_ARC_GIT
+		depends on BR2_arc
+		bool "binutils arc-git"
+
+	config BR2_BINUTILS_VERSION_MB_GIT
+		depends on BR2_microblaze
+		bool "binutils mb-git"
+
 	config BR2_BINUTILS_VERSION_2_20_1
 		depends on !BR2_avr32
 		depends on !BR2_ARM_EABIHF
+		depends on !BR2_arc
+		depends on !BR2_microblaze
 		bool "binutils 2.20.1"
 
 	config BR2_BINUTILS_VERSION_2_21
 		depends on !BR2_avr32
 		depends on !BR2_ARM_EABIHF
+		depends on !BR2_arc
+		depends on !BR2_microblaze
 		bool "binutils 2.21"
 
 	config BR2_BINUTILS_VERSION_2_21_1
 		depends on !BR2_avr32
 		depends on !BR2_ARM_EABIHF
+		depends on !BR2_arc
+		depends on !BR2_microblaze
 		bool "binutils 2.21.1"
 
 	config BR2_BINUTILS_VERSION_2_22
 		depends on !BR2_avr32
+		depends on !BR2_arc
+		depends on !BR2_microblaze
 		bool "binutils 2.22"
 
 	config BR2_BINUTILS_VERSION_2_23_1
 		depends on !BR2_avr32
+		depends on !BR2_arc
+		depends on !BR2_microblaze
 		bool "binutils 2.23.1"
 
 	config BR2_BINUTILS_VERSION_2_23_2
 		depends on !BR2_avr32
+		depends on !BR2_arc
+		depends on !BR2_microblaze
 		bool "binutils 2.23.2"
 
 	config BR2_BINUTILS_VERSION_2_24
 		depends on !BR2_avr32
+		depends on !BR2_arc
+		depends on !BR2_microblaze
 		bool "binutils 2.24"
 
 endchoice
@@ -49,8 +71,8 @@ endchoice
 config BR2_BINUTILS_VERSION
 	string
 	default "2.18-avr32-1.0.1" if BR2_BINUTILS_VERSION_2_18_AVR32_1_0_1
-	default "0c824ba511fa9b028220eb3c39b566af89ac9dda" if BR2_arc
-	default "8351467c933d277ebea0c8d99ad2b65b5f7b6bc2" if BR2_microblaze
+	default "arg-git" if BR2_BINUTILS_VERSION_ARC_GIT
+	default "mb-git"  if BR2_BINUTILS_VERSION_MB_GIT
 	default "2.20.1"	if BR2_BINUTILS_VERSION_2_20_1
 	default "2.21"		if BR2_BINUTILS_VERSION_2_21
 	default "2.21.1"	if BR2_BINUTILS_VERSION_2_21_1
diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index d6828f5..fada72a 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -23,16 +23,19 @@ endif
 ifeq ($(ARCH),avr32)
 BINUTILS_SITE = ftp://www.at91.com/pub/buildroot
 endif
-ifeq ($(BR2_arc),y)
+ifeq ($(findstring git,$(BINUTILS_VERSION))$(BR2_arc),gity)
+BINUTILS_VERSION = 0c824ba511fa9b028220eb3c39b566af89ac9dda
 BINUTILS_SITE = $(call github,foss-for-synopsys-dwc-arc-processors,binutils,$(BINUTILS_VERSION))
 BINUTILS_SOURCE = binutils-$(BINUTILS_VERSION).tar.gz
 BINUTILS_FROM_GIT = y
 endif
-ifeq ($(BR2_microblaze),y)
+ifeq ($(findstring git,$(BINUTILS_VERSION))$(BR2_microblaze),gity)
+BINUTILS_VERSION = 8351467c933d277ebea0c8d99ad2b65b5f7b6bc2
 BINUTILS_SITE = $(call github,Xilinx,binutils,$(BINUTILS_VERSION))
 BINUTILS_SOURCE = binutils-$(BINUTILS_VERSION).tar.gz
 BINUTILS_FROM_GIT = y
 endif
+
 BINUTILS_SITE ?= $(BR2_GNU_MIRROR)/binutils
 BINUTILS_SOURCE ?= binutils-$(BINUTILS_VERSION).tar.bz2
 BINUTILS_EXTRA_CONFIG_OPTIONS = $(call qstrip,$(BR2_BINUTILS_EXTRA_CONFIG_OPTIONS))
-- 
1.8.3.2
