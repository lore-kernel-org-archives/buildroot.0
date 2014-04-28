From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 28 Apr 2014 22:08:23 +0200
Subject: [Buildroot] [git commit] use default binutils for microblaze
Message-ID: <20140429125019.083FF9CA6F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=83d739f92258613481aeaa78babd9f8557754f3e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Upstream binutils 2.24 works fine for microblaze, no need for
Xilinx Git.

[Peter: disable older versions as suggested by Gustavo]
Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Acked-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Tested-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/binutils/Config.in.host |   15 +++++++--------
 package/binutils/binutils.mk    |    5 -----
 2 files changed, 7 insertions(+), 13 deletions(-)

diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
index 2f86f51..5515570 100644
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
@@ -14,30 +14,30 @@ choice
 		bool "binutils 2.18-avr32-1.0.1"
 
 	config BR2_BINUTILS_VERSION_2_20_1
-		depends on !BR2_avr32 && !BR2_aarch64
+		depends on !BR2_avr32 && !BR2_aarch64 && !BR2_microblaze
 		depends on !BR2_ARM_EABIHF
 		bool "binutils 2.20.1"
 
 	config BR2_BINUTILS_VERSION_2_21
-		depends on !BR2_avr32 && !BR2_aarch64
+		depends on !BR2_avr32 && !BR2_aarch64 && !BR2_microblaze
 		depends on !BR2_ARM_EABIHF
 		bool "binutils 2.21"
 
 	config BR2_BINUTILS_VERSION_2_21_1
-		depends on !BR2_avr32 && !BR2_aarch64
+		depends on !BR2_avr32 && !BR2_aarch64 && !BR2_microblaze
 		depends on !BR2_ARM_EABIHF
 		bool "binutils 2.21.1"
 
 	config BR2_BINUTILS_VERSION_2_22
-		depends on !BR2_avr32 && !BR2_aarch64
+		depends on !BR2_avr32 && !BR2_aarch64 && !BR2_microblaze
 		bool "binutils 2.22"
 
 	config BR2_BINUTILS_VERSION_2_23_1
-		depends on !BR2_avr32 && !BR2_aarch64
+		depends on !BR2_avr32 && !BR2_aarch64 && !BR2_microblaze
 		bool "binutils 2.23.1"
 
 	config BR2_BINUTILS_VERSION_2_23_2
-		depends on !BR2_avr32 && !BR2_aarch64
+		depends on !BR2_avr32 && !BR2_aarch64 && !BR2_microblaze
 		bool "binutils 2.23.2"
 
 	config BR2_BINUTILS_VERSION_2_24
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
