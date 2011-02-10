From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Thu, 10 Feb 2011 20:15:53 +0100
Subject: [Buildroot] [git commit master 1/1] toolchain/ct-ng: use soft-float
	option from BR config
Message-ID: <20110210202907.4A2998F43E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=835357388ff591e3d431cbcecf75842a428b4f4a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/toolchain-crosstool-ng/crosstool-ng.mk |   11 ++++++++++-
 1 files changed, 10 insertions(+), 1 deletions(-)

diff --git a/toolchain/toolchain-crosstool-ng/crosstool-ng.mk b/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
index 553d93b..d066e98 100644
--- a/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
+++ b/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
@@ -191,7 +191,7 @@ endif
 #
 # Lots of other awfull sed manipulations go here, to override CT-NG's .config
 # with BR2 config options.
-# Known missing: arch options, floating point (HW/SW), uClibc/eglibc config...
+# Known missing: arch options, uClibc/eglibc config...
 #
 CTNG_FIX_DOT_CONFIG_SED += s:^(CT_INSTALL_DIR_RO)=y:\# \1 is not set:;
 CTNG_FIX_DOT_CONFIG_SED += s:^(|\# )(CT_ARCH_[BL]E).*:\# \2 is not set:;
@@ -223,6 +223,15 @@ ifneq ($(call qstrip,$(BR2_GCC_TARGET_TUNE)),)
 CTNG_FIX_DOT_CONFIG_SED += s:^(CT_ARCH_TUNE)=.*:\1=$(BR2_GCC_TARGET_TUNE):;
 endif
 
+# And floating point now
+ifeq ($(call qstrip,$(BR2_SOFT_FLOAT)),)
+CTNG_FIX_DOT_CONFIG_SED += s:^\# (CT_ARCH_FLOAT_HW) is not set:\1=y:;
+CTNG_FIX_DOT_CONFIG_SED += s:^(CT_ARCH_FLOAT_SW)=y:\# \1 is not set:;
+else
+CTNG_FIX_DOT_CONFIG_SED += s:^(CT_ARCH_FLOAT_HW)=y:\# \1 is not set:;
+CTNG_FIX_DOT_CONFIG_SED += s:^\# (CT_ARCH_FLOAT_SW) is not set:\1=y:;
+endif
+
 # Thread implementation selection
 CTNG_FIX_DOT_CONFIG_SED += s:^(|\# )(CT_THREADS_NONE).*:\# \2 is not set:;
 CTNG_FIX_DOT_CONFIG_SED += s:^(|\# )(CT_THREADS_LINUXTHREADS).*:\# \2 is not set:;
-- 
1.7.3.4
