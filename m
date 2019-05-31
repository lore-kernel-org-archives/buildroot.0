From: guoren at kernel.org <guoren@kernel.org>
Date: Fri, 31 May 2019 14:38:59 +0800
Subject: [Buildroot] [PATCH V4 02/11] arch/csky: Change DSP to VDSP for -mcpu
In-Reply-To: <1559284748-32011-1-git-send-email-guoren@kernel.org>
References: <1559284748-32011-1-git-send-email-guoren@kernel.org>
Message-ID: <1559284748-32011-3-git-send-email-guoren@kernel.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Guo Ren <ren_guo@c-sky.com>

DSP extention is no longer used for C-SKY gcc and use VDSP instead of
DSP.

VDSP is C-SKY enhanced extension instruction set for SIMD, AI and DSP
operation. It could be supported by abiv2 (ck807, ck810, ck860).

Signed-off-by: Guo Ren <ren_guo@c-sky.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 arch/Config.in.csky | 6 +++---
 arch/arch.mk.csky   | 8 ++++----
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/Config.in.csky b/arch/Config.in.csky
index 6d87681..3817a2d 100644
--- a/arch/Config.in.csky
+++ b/arch/Config.in.csky
@@ -23,9 +23,9 @@ config BR2_CSKY_FPU
 	  Floating-Point Coprocessor or if you don't need FPU support
 	  for your user-space programs.
 
-config BR2_CSKY_DSP
-	bool "Enable DSP enhanced instructions"
-	depends on BR2_ck810 || BR2_ck807
+config BR2_CSKY_VDSP
+	bool "Enable VDSP enhanced instructions Co-processor"
+	depends on BR2_CSKY_FPU
 
 config BR2_ARCH
 	default "csky"
diff --git a/arch/arch.mk.csky b/arch/arch.mk.csky
index a39fbd4..f2c90eb 100644
--- a/arch/arch.mk.csky
+++ b/arch/arch.mk.csky
@@ -13,12 +13,12 @@ else ifeq ($(BR2_ck810),y)
 GCC_TARGET_CPU := ck810
 endif
 
-ifeq ($(BR2_CSKY_DSP),y)
-GCC_TARGET_CPU := $(GCC_TARGET_CPU)e
-endif
-
 ifeq ($(BR2_CSKY_FPU),y)
 GCC_TARGET_CPU := $(GCC_TARGET_CPU)f
 endif
 
+ifeq ($(BR2_CSKY_VDSP),y)
+GCC_TARGET_CPU := $(GCC_TARGET_CPU)v
+endif
+
 endif
-- 
2.7.4
