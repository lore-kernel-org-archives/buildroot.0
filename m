From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Dec 2009 00:04:33 +0100
Subject: [Buildroot] [PATCH 01/23] binutils: add avr32 special version
In-Reply-To: <cover.1260831891.git.thomas.petazzoni@free-electrons.com>
References: <cover.1260831891.git.thomas.petazzoni@free-electrons.com>
Message-ID: <f18480603222ebc9996abc43793082012fb18ab0.1260831891.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 * Add a new binutils version 2.18-avr32-1.0.1 to the Config.in

 * Use a different site to download avr32 binutils version in binutils.mk

 * Only apply patches from the patch directory if it exists in
   binutils.mk

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/binutils/Config.in   |    5 +++++
 toolchain/binutils/binutils.mk |    5 +++++
 2 files changed, 10 insertions(+), 0 deletions(-)

diff --git a/toolchain/binutils/Config.in b/toolchain/binutils/Config.in
index b892b6f..4405bcb 100644
--- a/toolchain/binutils/Config.in
+++ b/toolchain/binutils/Config.in
@@ -24,6 +24,10 @@ choice
 		depends on BR2_DEPRECATED
 		bool "binutils 2.18.50.0.9"
 
+	config BR2_BINUTILS_VERSION_2_18_AVR32_1_0_1
+	       depends on BR2_avr32
+	       bool "binutils 2.18-avr32-1.0.1"
+
 	config BR2_BINUTILS_VERSION_2_19
 		depends on !BR2_avr32 && !BR2_nios2
 		depends on BR2_DEPRECATED
@@ -46,6 +50,7 @@ config BR2_BINUTILS_VERSION
 	default "2.17"		if BR2_BINUTILS_VERSION_2_17
 	default "2.18"		if BR2_BINUTILS_VERSION_2_18
 	default "2.18.50.0.9"	if BR2_BINUTILS_VERSION_2_18_50_0_9
+	default "2.18-avr32-1.0.1" if BR2_BINUTILS_VERSION_2_18_AVR32_1_0_1
 	default "2.19"		if BR2_BINUTILS_VERSION_2_19
 	default "2.19.1"	if BR2_BINUTILS_VERSION_2_19_1
 	default "2.20"		if BR2_BINUTILS_VERSION_2_20
diff --git a/toolchain/binutils/binutils.mk b/toolchain/binutils/binutils.mk
index 8cddf2d..38bee9e 100644
--- a/toolchain/binutils/binutils.mk
+++ b/toolchain/binutils/binutils.mk
@@ -22,6 +22,9 @@ endif
 ifeq ($(BINUTILS_VERSION),2.17)
 BINUTILS_SITE:=$(BR2_GNU_MIRROR)/binutils/
 endif
+ifeq ($(findstring avr32,$(BINUTILS_VERSION)),avr32)
+BINUTILS_SITE:=ftp://www.at91.com/pub/buildroot/
+endif
 
 # We do not rely on the host's gmp/mpfr but use a known working one
 BINUTILS_HOST_PREREQ:=
@@ -79,7 +82,9 @@ $(BINUTILS_DIR)/.unpacked: $(DL_DIR)/$(BINUTILS_SOURCE)
 binutils-patched: $(BINUTILS_DIR)/.patched
 $(BINUTILS_DIR)/.patched: $(BINUTILS_DIR)/.unpacked
 	# Apply appropriate binutils patches.
+ifneq ($(wildcard $(BINUTILS_PATCH_DIR)),)
 	toolchain/patch-kernel.sh $(BINUTILS_DIR) $(BINUTILS_PATCH_DIR) \*.patch $(BINUTILS_PATCH_EXTRA)
+endif
 	touch $@
 
 $(BINUTILS_DIR1)/.configured: $(BINUTILS_DIR)/.patched
-- 
1.6.3.3
