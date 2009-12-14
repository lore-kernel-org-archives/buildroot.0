From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Dec 2009 00:04:46 +0100
Subject: [Buildroot] [PATCH 14/23] uclibc: remove support for external
	source toolchains
In-Reply-To: <cover.1260831891.git.thomas.petazzoni@free-electrons.com>
References: <cover.1260831891.git.thomas.petazzoni@free-electrons.com>
Message-ID: <8a5c3653acf1a86a7a613ee43f3cab9ee03a68b3.1260831891.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/uClibc/uclibc.mk |   22 +++++-----------------
 1 files changed, 5 insertions(+), 17 deletions(-)

diff --git a/toolchain/uClibc/uclibc.mk b/toolchain/uClibc/uclibc.mk
index 67601b1..79d272f 100644
--- a/toolchain/uClibc/uclibc.mk
+++ b/toolchain/uClibc/uclibc.mk
@@ -12,31 +12,19 @@ ifndef UCLIBC_CONFIG_FILE
 UCLIBC_CONFIG_FILE=$(call qstrip,$(BR2_UCLIBC_CONFIG))
 endif
 
-UCLIBC_VER:=$(call qstrip,$(BR2_UCLIBC_VERSION_STRING))
-
-UCLIBC_OFFICIAL_VERSION:=$(UCLIBC_VER)$(VENDOR_SUFFIX)$(VENDOR_UCLIBC_RELEASE)
+UCLIBC_VERSION:=$(call qstrip,$(BR2_UCLIBC_VERSION_STRING))
 
 ifeq ($(BR2_UCLIBC_VERSION_SNAPSHOT),y)
 UCLIBC_SITE:=http://www.uclibc.org/downloads/snapshots
-UCLIBC_DIR:=$(TOOLCHAIN_DIR)/uClibc
 else ifeq ($(findstring avr32,$(UCLIBC_VERSION)),avr32)
 UCLIBC_SITE:=ftp://www.at91.com/pub/buildroot/
-UCLIBC_DIR:=$(TOOLCHAIN_DIR)/uClibc-$(UCLIBC_OFFICIAL_VERSION)
 else
 UCLIBC_SITE:=http://www.uclibc.org/downloads
-UCLIBC_DIR:=$(TOOLCHAIN_DIR)/uClibc-$(UCLIBC_OFFICIAL_VERSION)
-ifeq ($(BR2_TOOLCHAIN_EXTERNAL_SOURCE),y)
-UCLIBC_SITE:=$(VENDOR_SITE)
-endif
 endif
 
-ifeq ($(BR2_TOOLCHAIN_BUILDROOT),y)
+UCLIBC_DIR:=$(TOOLCHAIN_DIR)/uClibc-$(UCLIBC_VERSION)
 UCLIBC_PATCH_DIR:=toolchain/uClibc/
-else
-UCLIBC_PATCH_DIR:=toolchain/uClibc/ext_source/$(VENDOR_PATCH_DIR)/$(UCLIBC_OFFICIAL_VERSION)
-endif
-
-UCLIBC_SOURCE:=uClibc-$(UCLIBC_OFFICIAL_VERSION).tar.bz2
+UCLIBC_SOURCE:=uClibc-$(UCLIBC_VERSION).tar.bz2
 
 UCLIBC_CAT:=$(BZCAT)
 
@@ -106,8 +94,8 @@ uclibc-patched: $(UCLIBC_DIR)/.patched
 $(UCLIBC_DIR)/.patched: $(UCLIBC_DIR)/.unpacked
 ifneq ($(BR2_UCLIBC_VERSION_SNAPSHOT),y)
 	toolchain/patch-kernel.sh $(UCLIBC_DIR) $(UCLIBC_PATCH_DIR) \
-		uClibc-$(UCLIBC_OFFICIAL_VERSION)-\*.patch \
-		uClibc-$(UCLIBC_OFFICIAL_VERSION)-\*.patch.$(ARCH)
+		uClibc-$(UCLIBC_VERSION)-\*.patch \
+		uClibc-$(UCLIBC_VERSION)-\*.patch.$(ARCH)
 else
 	toolchain/patch-kernel.sh $(UCLIBC_DIR) $(UCLIBC_PATCH_DIR) \
 		uClibc.\*.patch uClibc.\*.patch.$(ARCH)
-- 
1.6.3.3
