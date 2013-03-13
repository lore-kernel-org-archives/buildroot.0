From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 13 Mar 2013 19:30:25 +0100
Subject: [Buildroot] [PATCH] toolchain/crosstool-NG: only use the un-tainted
	Buildroot version sting
Message-ID: <1363199425-17105-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The 'full' Buildroot version string contains the git cset hash, so will
change for each commit in the current tree.

As Przemyslaw points out, this will cause the crosstool-NG backend to
rebuild the toolchain, as the 'full' Buildroot version is included in
the crosstool-NG config (to further push down to the components version
string).

Using the 'full' Buildroot version string is arguably useful, so switch
to using the 'simple' Buildroot version string instead.

Reported-by: "Przemyslaw Wrzos" <przemyslaw.wrzos@calyptech.com>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/toolchain-crosstool-ng/crosstool-ng.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/toolchain/toolchain-crosstool-ng/crosstool-ng.mk b/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
index 6554982..fbace5f 100644
--- a/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
+++ b/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
@@ -206,7 +206,7 @@ CTNG_FIX_BUILDROOT_CONFIG_SED += s:^(|\# )(CT_ARCH_(32|64)).*:\# \2 is not set:;
 CTNG_FIX_BUILDROOT_CONFIG_SED += s:^\# (CT_ARCH_$(CTNG_BIT)) is not set:\1=y:;
 CTNG_FIX_BUILDROOT_CONFIG_SED += s:^(CT_TARGET_VENDOR)=.*:\1="buildroot":;
 CTNG_FIX_BUILDROOT_CONFIG_SED += s:^(CT_TARGET_ALIAS)=.*:\1="$(ARCH)-linux":;
-CTNG_FIX_BUILDROOT_CONFIG_SED += s:^(CT_TOOLCHAIN_PKGVERSION)="(.*)":\1="buildroot $(BR2_VERSION_FULL)":;
+CTNG_FIX_BUILDROOT_CONFIG_SED += s:^(CT_TOOLCHAIN_PKGVERSION)="(.*)":\1="buildroot $(BR2_VERSION)":;
 ifneq ($(call qstrip,$(BR2_USE_MMU)),)
 CTNG_FIX_BUILDROOT_CONFIG_SED += s:^\# (CT_ARCH_USE_MMU) is not set:\1=y:;
 else
-- 
1.7.2.5
