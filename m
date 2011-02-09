From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Wed,  9 Feb 2011 23:57:21 +0100
Subject: [Buildroot] [PATCH 3/4] toolchain/ct-ng: use processor variant from
	BR config
In-Reply-To: <1297292242-5300-1-git-send-email-yann.morin.1998@anciens.enib.fr>
References: <1297292242-5300-1-git-send-email-yann.morin.1998@anciens.enib.fr>
Message-ID: <1297292242-5300-4-git-send-email-yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>
---
 toolchain/toolchain-crosstool-ng/crosstool-ng.mk |   10 +++++++++-
 1 files changed, 9 insertions(+), 1 deletions(-)

diff --git a/toolchain/toolchain-crosstool-ng/crosstool-ng.mk b/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
index b14c08e..553d93b 100644
--- a/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
+++ b/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
@@ -191,7 +191,7 @@ endif
 #
 # Lots of other awfull sed manipulations go here, to override CT-NG's .config
 # with BR2 config options.
-# Known missing: arch variant & options, floating point (HW/SW), uClibc/eglibc config...
+# Known missing: arch options, floating point (HW/SW), uClibc/eglibc config...
 #
 CTNG_FIX_DOT_CONFIG_SED += s:^(CT_INSTALL_DIR_RO)=y:\# \1 is not set:;
 CTNG_FIX_DOT_CONFIG_SED += s:^(|\# )(CT_ARCH_[BL]E).*:\# \2 is not set:;
@@ -215,6 +215,14 @@ else
 CTNG_FIX_DOT_CONFIG_SED += s:^(CT_CC_LANG_CXX)=.*:\# \1 is not set:;
 endif
 
+# Shoe-horn CPU variant now
+ifneq ($(call qstrip,$(BR2_GCC_TARGET_ARCH)),)
+CTNG_FIX_DOT_CONFIG_SED += s:^(CT_ARCH_ARCH)=.*:\1=$(BR2_GCC_TARGET_ARCH):;
+endif
+ifneq ($(call qstrip,$(BR2_GCC_TARGET_TUNE)),)
+CTNG_FIX_DOT_CONFIG_SED += s:^(CT_ARCH_TUNE)=.*:\1=$(BR2_GCC_TARGET_TUNE):;
+endif
+
 # Thread implementation selection
 CTNG_FIX_DOT_CONFIG_SED += s:^(|\# )(CT_THREADS_NONE).*:\# \2 is not set:;
 CTNG_FIX_DOT_CONFIG_SED += s:^(|\# )(CT_THREADS_LINUXTHREADS).*:\# \2 is not set:;
-- 
1.7.1
