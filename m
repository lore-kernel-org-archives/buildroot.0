From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 14 Feb 2015 10:23:10 +0100
Subject: [Buildroot] [PATCH 07/12 v2] package/binutils: avr32 is gone
In-Reply-To: <cover.1423905753.git.yann.morin.1998@free.fr>
References: <cover.1423905753.git.yann.morin.1998@free.fr>
Message-ID: <15daae6ad6b07ab2cab1e25430cab716ba9ebe9d.1423905753.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/binutils/Config.in.host | 13 ++++---------
 package/binutils/binutils.mk    |  8 --------
 2 files changed, 4 insertions(+), 17 deletions(-)

diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
index 0739467..504e9ca 100644
--- a/package/binutils/Config.in.host
+++ b/package/binutils/Config.in.host
@@ -7,33 +7,28 @@ choice
 	help
 	  Select the version of binutils you wish to use.
 
-	config BR2_BINUTILS_VERSION_2_18_AVR32_1_0_1
-		depends on BR2_avr32
-		bool "binutils 2.18-avr32-1.0.1"
-
 	config BR2_BINUTILS_VERSION_2_22
-		depends on !BR2_avr32 && !BR2_aarch64 && !BR2_microblaze && !BR2_powerpc64le
+		depends on !BR2_aarch64 && !BR2_microblaze && !BR2_powerpc64le
 		bool "binutils 2.22"
 
 	# bfin disabled for newer binutils due to
 	# https://sourceware.org/bugzilla/show_bug.cgi?id=17334
 	config BR2_BINUTILS_VERSION_2_23_2
-		depends on !BR2_avr32 && !BR2_aarch64 && !BR2_bfin && !BR2_microblaze && !BR2_powerpc64le
+		depends on !BR2_aarch64 && !BR2_bfin && !BR2_microblaze && !BR2_powerpc64le
 		bool "binutils 2.23.2"
 
 	config BR2_BINUTILS_VERSION_2_24
-		depends on !BR2_avr32 && !BR2_bfin
+		depends on !BR2_bfin
 		bool "binutils 2.24"
 
 	config BR2_BINUTILS_VERSION_2_25
-		depends on !BR2_avr32 && !BR2_bfin
+		depends on !BR2_bfin
 		bool "binutils 2.25"
 
 endchoice
 
 config BR2_BINUTILS_VERSION
 	string
-	default "2.18-avr32-1.0.1" if BR2_BINUTILS_VERSION_2_18_AVR32_1_0_1
 	default "arc-2014.12"	if BR2_arc
 	default "2.22"		if BR2_BINUTILS_VERSION_2_22
 	default "2.23.2"	if BR2_BINUTILS_VERSION_2_23_2
diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index c3b3c18..9e99253 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -8,17 +8,9 @@
 # If not, we do like other packages
 BINUTILS_VERSION = $(call qstrip,$(BR2_BINUTILS_VERSION))
 ifeq ($(BINUTILS_VERSION),)
-ifeq ($(BR2_avr32),y)
-# avr32 uses a special version
-BINUTILS_VERSION = 2.18-avr32-1.0.1
-else
 BINUTILS_VERSION = 2.22
 endif
-endif
 
-ifeq ($(ARCH),avr32)
-BINUTILS_SITE = ftp://www.at91.com/pub/buildroot
-endif
 ifeq ($(BR2_arc),y)
 BINUTILS_SITE = $(call github,foss-for-synopsys-dwc-arc-processors,binutils-gdb,$(BINUTILS_VERSION))
 BINUTILS_SOURCE = binutils-$(BINUTILS_VERSION).tar.gz
-- 
1.9.1
