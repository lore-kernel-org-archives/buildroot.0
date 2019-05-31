From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 31 May 2019 22:59:57 +0200
Subject: [Buildroot] [git commit] arch/csky: add support for VDSP extensions
Message-ID: <20190602201237.986AC81354@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d2658caea07498ca14aa2bb2da84698e75a7c0b3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

VDSP is C-SKY enhanced extension instruction set for SIMD, AI and DSP
operation. It is supported by abiv2, used by the ck807, ck810, ck860
cores.

Signed-off-by: Guo Ren <ren_guo@c-sky.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
[Thomas: update help text in Config.in.legacy about the BR2_CSKY_DSP
option.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Config.in.legacy    | 4 +++-
 arch/Config.in.csky | 4 ++++
 arch/arch.mk.csky   | 4 ++++
 3 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 2cf00a0aac..f299181447 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -151,7 +151,9 @@ config BR2_CSKY_DSP
 	select BR2_LEGACY
 	help
 	 C-SKY DSP instruction support for ck810 / ck807 was removed,
-	 as it was no longer supported in C-SKY gcc.
+	 as it was no longer supported in C-SKY gcc. Perhaps the VDSP
+	 instructions should be used instead, using the BR2_CSKY_VDSP
+	 option.
 
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_COMPOSITOR
 	bool "compositor moved to gst1-plugins-base"
diff --git a/arch/Config.in.csky b/arch/Config.in.csky
index 9c893da5f8..1aede81282 100644
--- a/arch/Config.in.csky
+++ b/arch/Config.in.csky
@@ -23,6 +23,10 @@ config BR2_CSKY_FPU
 	  Floating-Point Coprocessor or if you don't need FPU support
 	  for your user-space programs.
 
+config BR2_CSKY_VDSP
+	bool "Enable VDSP enhanced instructions Co-processor"
+	depends on BR2_CSKY_FPU
+
 config BR2_ARCH
 	default "csky"
 
diff --git a/arch/arch.mk.csky b/arch/arch.mk.csky
index 677c3223ed..f2c90eb206 100644
--- a/arch/arch.mk.csky
+++ b/arch/arch.mk.csky
@@ -17,4 +17,8 @@ ifeq ($(BR2_CSKY_FPU),y)
 GCC_TARGET_CPU := $(GCC_TARGET_CPU)f
 endif
 
+ifeq ($(BR2_CSKY_VDSP),y)
+GCC_TARGET_CPU := $(GCC_TARGET_CPU)v
+endif
+
 endif
