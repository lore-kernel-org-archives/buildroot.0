From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  6 Jul 2013 22:48:50 +0200
Subject: [Buildroot] [PATCH 11/12] package/uClibc: drop ARM EABI conditions
In-Reply-To: <cover.1373143368.git.yann.morin.1998@free.fr>
References: <cover.1373143368.git.yann.morin.1998@free.fr>
Message-ID: <851574689df41cedf7fa987395d5c0a03d6ca533.1373143368.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

... since we now only support EABI for ARM, we only need to
force EABI unconditionally.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/uclibc/Config.in | 5 -----
 package/uclibc/uclibc.mk | 4 +---
 2 files changed, 1 insertion(+), 8 deletions(-)

diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
index b9917a7..8d16e8c 100644
--- a/package/uclibc/Config.in
+++ b/package/uclibc/Config.in
@@ -182,11 +182,6 @@ config BR2_UCLIBC_ARM_TYPE
 	default ARM_CORTEXA8	if BR2_cortex_a8
 	default ARM_CORTEXA9	if BR2_cortex_a9
 
-config BR2_UCLIBC_ARM_ABI
-	string
-	depends on BR2_UCLIBC_TARGET_ARCH = "arm"
-	default EABI if BR2_ARM_EABI
-
 config BR2_UCLIBC_ARM_BX
 	bool
 	depends on BR2_UCLIBC_TARGET_ARCH = "arm"
diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index 421e323..8eca5fe 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -69,11 +69,9 @@ define UCLIBC_ARM_TYPE_CONFIG
 	$(call UCLIBC_OPT_SET,$(UCLIBC_ARM_TYPE),y,$(@D))
 endef
 
-UCLIBC_ARM_ABI = CONFIG_ARM_$(call qstrip,$(BR2_UCLIBC_ARM_ABI))
-
 define UCLIBC_ARM_ABI_CONFIG
 	$(SED) '/CONFIG_ARM_.ABI/d' $(@D)/.config
-	$(call UCLIBC_OPT_SET,$(UCLIBC_ARM_ABI),y,$(@D))
+	$(call UCLIBC_OPT_SET,CONFIG_ARM_EABI,y,$(@D))
 endef
 
 ifeq ($(BR2_UCLIBC_ARM_BX),y)
-- 
1.8.1.2
