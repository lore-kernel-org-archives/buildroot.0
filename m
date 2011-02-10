From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Thu, 10 Feb 2011 20:15:53 +0100
Subject: [Buildroot] [git commit master 1/1] toolchain/ct-ng: use processor
	variant from BR config
Message-ID: <20110210202907.13F848F43E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=a8e4599212f5e5303a523b4cbdcbe8ed5cd9a52d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
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
1.7.3.4
