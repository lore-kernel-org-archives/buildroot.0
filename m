From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Wed,  9 Feb 2011 23:57:20 +0100
Subject: [Buildroot] [PATCH 2/4] toolchain/ct-ng: use MMU option from the BR
	config
In-Reply-To: <1297292242-5300-1-git-send-email-yann.morin.1998@anciens.enib.fr>
References: <1297292242-5300-1-git-send-email-yann.morin.1998@anciens.enib.fr>
Message-ID: <1297292242-5300-3-git-send-email-yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>
---
 toolchain/toolchain-crosstool-ng/crosstool-ng.mk |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/toolchain/toolchain-crosstool-ng/crosstool-ng.mk b/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
index c838f51..b14c08e 100644
--- a/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
+++ b/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
@@ -198,10 +198,14 @@ CTNG_FIX_DOT_CONFIG_SED += s:^(|\# )(CT_ARCH_[BL]E).*:\# \2 is not set:;
 CTNG_FIX_DOT_CONFIG_SED += s:^\# (CT_ARCH_$(CTNG_ENDIAN)) is not set:\1=y:;
 CTNG_FIX_DOT_CONFIG_SED += s:^(|\# )(CT_ARCH_(32|64)).*:\# \2 is not set:;
 CTNG_FIX_DOT_CONFIG_SED += s:^\# (CT_ARCH_$(CTNG_BIT)) is not set:\1=y:;
-CTNG_FIX_DOT_CONFIG_SED += s:^\# (CT_ARCH_USE_MMU) is not set:\1=y:;
 CTNG_FIX_DOT_CONFIG_SED += s:^(CT_TARGET_VENDOR)=.*:\1="unknown":;
 CTNG_FIX_DOT_CONFIG_SED += s:^(CT_TARGET_ALIAS)=.*:\1="$(GNU_TARGET_NAME)":;
 CTNG_FIX_DOT_CONFIG_SED += s:^(CT_CC_PKGVERSION)="(.*)":\1="crosstool-NG $(CTNG_VERSION) - buildroot $(BR2_VERSION_FULL)":;
+ifneq ($(call qstrip,$(BR2_USE_MMU)),)
+CTNG_FIX_DOT_CONFIG_SED += s:^\# (CT_ARCH_USE_MMU) is not set:\1=y:;
+else
+CTNG_FIX_DOT_CONFIG_SED += s:^(CT_ARCH_USE_MMU)=y:\# \1 is not set:;
+endif
 ifneq ($(call qstrip,$(BR2_PACKAGE_GDB_SERVER))$(call qstrip,$(BR2_PACKAGE_GDB_HOST)),)
 CTNG_FIX_DOT_CONFIG_SED += s:^(CT_DEBUG_gdb)=.*:\# \1 is not set:;
 endif
-- 
1.7.1
