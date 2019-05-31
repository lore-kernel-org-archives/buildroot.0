From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 31 May 2019 22:59:57 +0200
Subject: [Buildroot] [git commit] arch/csky: remove BR2_CSKY_DSP option
Message-ID: <20190602201237.89B3981354@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=55c642287819a062d52e7f290c76ada778772fba
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The DSP extention is in fact no longer used for C-SKY, nor supported
by C-SKY gcc, so we remove it.

Signed-off-by: Guo Ren <ren_guo@c-sky.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
[Thomas: split from the VDSP patch, add Config.in.legacy]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Config.in.legacy    | 7 +++++++
 arch/Config.in.csky | 4 ----
 arch/arch.mk.csky   | 4 ----
 3 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index a32cbcb6f2..2cf00a0aac 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2019.05"
 
+config BR2_CSKY_DSP
+	bool "C-SKY DSP support removed"
+	select BR2_LEGACY
+	help
+	 C-SKY DSP instruction support for ck810 / ck807 was removed,
+	 as it was no longer supported in C-SKY gcc.
+
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_COMPOSITOR
 	bool "compositor moved to gst1-plugins-base"
 	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_COMPOSITOR
diff --git a/arch/Config.in.csky b/arch/Config.in.csky
index a9d6548d8e..9c893da5f8 100644
--- a/arch/Config.in.csky
+++ b/arch/Config.in.csky
@@ -23,10 +23,6 @@ config BR2_CSKY_FPU
 	  Floating-Point Coprocessor or if you don't need FPU support
 	  for your user-space programs.
 
-config BR2_CSKY_DSP
-	bool "Enable DSP enhanced instructions"
-	depends on BR2_ck810 || BR2_ck807
-
 config BR2_ARCH
 	default "csky"
 
diff --git a/arch/arch.mk.csky b/arch/arch.mk.csky
index a39fbd43c2..677c3223ed 100644
--- a/arch/arch.mk.csky
+++ b/arch/arch.mk.csky
@@ -13,10 +13,6 @@ else ifeq ($(BR2_ck810),y)
 GCC_TARGET_CPU := ck810
 endif
 
-ifeq ($(BR2_CSKY_DSP),y)
-GCC_TARGET_CPU := $(GCC_TARGET_CPU)e
-endif
-
 ifeq ($(BR2_CSKY_FPU),y)
 GCC_TARGET_CPU := $(GCC_TARGET_CPU)f
 endif
