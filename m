From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  1 Jul 2014 20:03:05 +0200
Subject: [Buildroot] [PATCH 06/10] uclibc: remove BR2_UCLIBC_ARM_TYPE
In-Reply-To: <1404237789-15563-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1404237789-15563-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1404237789-15563-7-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The BR2_UCLIBC_ARM_TYPE was only used for uClibc 0.9.32 on ARM. Now
that only uClibc 0.9.33 is supported for ARM, there is no point in
keeping BR2_UCLIBC_ARM_TYPE, since the corresponding uClibc options no
longer exist.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/uclibc/Config.in | 19 -------------------
 package/uclibc/uclibc.mk |  9 ---------
 2 files changed, 28 deletions(-)

diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
index 0b72050..cda6e0b 100644
--- a/package/uclibc/Config.in
+++ b/package/uclibc/Config.in
@@ -188,25 +188,6 @@ config BR2_UCLIBC_TARGET_ARCH
 	default i386	   if BR2_i386
 	default x86_64	   if BR2_x86_64
 
-# This is only useful for uClibc <= 0.9.32. It can be removed once
-# Buildroot will support only uClibc >= 0.9.33 on ARM.
-config BR2_UCLIBC_ARM_TYPE
-	string
-	depends on BR2_UCLIBC_TARGET_ARCH = "arm"
-	default GENERIC_ARM	if BR2_fa526
-	default ARM920T		if BR2_arm920t
-	default ARM922T		if BR2_arm922t
-	default ARM926T		if BR2_arm926t
-	default ARM10T		if BR2_arm10t
-	default ARM1136JF_S	if BR2_arm1136jf_s
-	default ARM1176JZ_S	if BR2_arm1176jz_s
-	default ARM1176JZF_S	if BR2_arm1176jzf_s
-	default ARM_SA1100	if BR2_strongarm
-	default ARM_XSCALE	if BR2_xscale
-	default ARM_IWMMXT	if BR2_iwmmxt
-	default ARM_CORTEXA8	if BR2_cortex_a8
-	default ARM_CORTEXA9	if BR2_cortex_a9
-
 config BR2_UCLIBC_ARM_BX
 	bool
 	depends on BR2_UCLIBC_TARGET_ARCH = "arm"
diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index 8337bb6..3b9c8ac 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -67,14 +67,6 @@ endef
 #
 
 ifeq ($(UCLIBC_TARGET_ARCH),arm)
-UCLIBC_ARM_TYPE = CONFIG_$(call qstrip,$(BR2_UCLIBC_ARM_TYPE))
-
-define UCLIBC_ARM_TYPE_CONFIG
-	$(SED) 's/^\(CONFIG_[^_]*[_]*ARM[^=]*\)=.*/# \1 is not set/g' \
-		$(@D)/.config
-	$(call UCLIBC_OPT_SET,$(UCLIBC_ARM_TYPE),y,$(@D))
-endef
-
 define UCLIBC_ARM_ABI_CONFIG
 	$(SED) '/CONFIG_ARM_.ABI/d' $(@D)/.config
 	$(call UCLIBC_OPT_SET,CONFIG_ARM_EABI,y,$(@D))
@@ -425,7 +417,6 @@ define UCLIBC_SETUP_DOT_CONFIG
 	$(call UCLIBC_OPT_SET,DEVEL_PREFIX,"/usr",$(@D))
 	$(call UCLIBC_OPT_SET,SHARED_LIB_LOADER_PREFIX,"/lib",$(@D))
 	$(UCLIBC_MMU_CONFIG)
-	$(UCLIBC_ARM_TYPE_CONFIG)
 	$(UCLIBC_ARM_ABI_CONFIG)
 	$(UCLIBC_ARM_BX_CONFIG)
 	$(UCLIBC_MIPS_ABI_CONFIG)
-- 
2.0.0
