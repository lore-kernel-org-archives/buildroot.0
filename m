From: Waldemar Brodkorb <wbx@openadk.org>
Date: Sun, 13 Apr 2014 11:46:58 +0200
Subject: [Buildroot] [PATCH 1/6] use default binutils for microblaze
In-Reply-To: <1397382423-4939-1-git-send-email-wbx@openadk.org>
References: <1397382423-4939-1-git-send-email-wbx@openadk.org>
Message-ID: <1397382423-4939-2-git-send-email-wbx@openadk.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Upstream binutils 2.24 works fine for microblaze, no need for
Xilinx Git.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/binutils/Config.in.host |    3 +--
 package/binutils/binutils.mk    |    5 -----
 2 files changed, 1 insertion(+), 7 deletions(-)

diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
index 58738e8..25f0dc3 100644
--- a/package/binutils/Config.in.host
+++ b/package/binutils/Config.in.host
@@ -3,8 +3,8 @@ comment "Binutils Options"
 choice
 	prompt "Binutils Version"
 	depends on !BR2_arc
-	depends on !BR2_microblaze
 	default BR2_BINUTILS_VERSION_2_21 if (BR2_mips || BR2_mipsel || BR2_sh)
+	default BR2_BINUTILS_VERSION_2_24 if BR2_microblaze
 	default BR2_BINUTILS_VERSION_2_22
 	help
 	  Select the version of binutils you wish to use.
@@ -50,7 +50,6 @@ config BR2_BINUTILS_VERSION
 	string
 	default "2.18-avr32-1.0.1" if BR2_BINUTILS_VERSION_2_18_AVR32_1_0_1
 	default "a934fe50786aa0dc0fb5da4754e7e07591c9cd8e" if BR2_arc
-	default "8351467c933d277ebea0c8d99ad2b65b5f7b6bc2" if BR2_microblaze
 	default "2.20.1"	if BR2_BINUTILS_VERSION_2_20_1
 	default "2.21"		if BR2_BINUTILS_VERSION_2_21
 	default "2.21.1"	if BR2_BINUTILS_VERSION_2_21_1
diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index b5a2dc7..9cc4d28 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -28,11 +28,6 @@ BINUTILS_SITE = $(call github,foss-for-synopsys-dwc-arc-processors,binutils,$(BI
 BINUTILS_SOURCE = binutils-$(BINUTILS_VERSION).tar.gz
 BINUTILS_FROM_GIT = y
 endif
-ifeq ($(BR2_microblaze),y)
-BINUTILS_SITE = $(call github,Xilinx,binutils,$(BINUTILS_VERSION))
-BINUTILS_SOURCE = binutils-$(BINUTILS_VERSION).tar.gz
-BINUTILS_FROM_GIT = y
-endif
 BINUTILS_SITE ?= $(BR2_GNU_MIRROR)/binutils
 BINUTILS_SOURCE ?= binutils-$(BINUTILS_VERSION).tar.bz2
 BINUTILS_EXTRA_CONFIG_OPTIONS = $(call qstrip,$(BR2_BINUTILS_EXTRA_CONFIG_OPTIONS))
-- 
1.7.10.4
