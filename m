From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 Mar 2016 22:43:11 +0100
Subject: [Buildroot] [PATCH 05/16] uclibc: disable DOPIC on ARM noMMU
In-Reply-To: <1458164602-16983-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1458164602-16983-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1458164602-16983-6-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As explained by Waldemar, enabling DOPIC in uClibc will lead to the
creation of a Position Independent library. In turn, this will cause
elf2flt to generate a "Has-PIC-GOT" flat binary, which doesn't work on
ARM. In fact, elf2flt on ARM really except to have non-PIC code as
input, so we must disable DOPIC in the uClibc configuration.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/uclibc/uclibc.mk | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index ce706e0..d11c103 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -94,6 +94,14 @@ define UCLIBC_ARM_THUMB_CONFIG
 endef
 endif
 
+ifeq ($(UCLIBC_TARGET_ARCH),arm)
+ifeq ($(BR2_USE_MMU),)
+define UCLIBC_ARM_NOMMU
+	$(call KCONFIG_DISABLE_OPT,DOPIC,$(@D)/.config)
+endef
+endif
+endif
+
 ifeq ($(BR2_UCLIBC_ARM_BX),y)
 define UCLIBC_ARM_BX_CONFIG
 	$(call KCONFIG_ENABLE_OPT,USE_BX,$(@D)/.config)
@@ -378,6 +386,7 @@ define UCLIBC_KCONFIG_FIXUP_CMDS
 	$(UCLIBC_ARM_ABI_CONFIG)
 	$(UCLIBC_ARM_THUMB_CONFIG)
 	$(UCLIBC_ARM_BX_CONFIG)
+	$(UCLIBC_ARM_NOMMU)
 	$(UCLIBC_MIPS_ABI_CONFIG)
 	$(UCLIBC_MIPS_ISA_CONFIG)
 	$(UCLIBC_SH_TYPE_CONFIG)
-- 
2.6.4
