From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 18 Oct 2016 20:51:28 +0200
Subject: [Buildroot] [PATCH 2/2] MIPS: add support for MSA
In-Reply-To: <20161018185128.6404-1-arnout@mind.be>
References: <20161018185128.6404-1-arnout@mind.be>
Message-ID: <20161018185128.6404-2-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
[Arnout: use the TARGET_FLAGS variable]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
v2: use the TARGET_FLAGS variable introduced by the previous patch
   (Arnout)
---
 arch/Config.in.mips            | 17 +++++++++++++++++
 toolchain/toolchain-wrapper.mk |  7 +++++++
 2 files changed, 24 insertions(+)

diff --git a/arch/Config.in.mips b/arch/Config.in.mips
index f7bfa21..fb9053c 100644
--- a/arch/Config.in.mips
+++ b/arch/Config.in.mips
@@ -16,6 +16,14 @@ config BR2_MIPS_CPU_MIPS64R5
 config BR2_MIPS_CPU_MIPS64R6
 	bool
 
+# mips cpu features
+config BR2_MIPS_CPU_HAS_MSA
+	bool
+
+# for some cores, MSA support is optional
+config BR2_MIPS_CPU_MAYBE_HAS_MSA
+	bool
+
 choice
 	prompt "Target Architecture Variant"
 	depends on BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
@@ -113,6 +121,15 @@ config BR2_MIPS_SOFT_FLOAT
 	  floating point functions, then everything will need to be
 	  compiled with soft floating point support (-msoft-float).
 
+config BR2_MIPS_ENABLE_MSA
+	bool "Enable MIPS SIMD Architecture (MSA) support"
+	depends on BR2_MIPS_CPU_MAYBE_HAS_MSA && !BR2_SOFT_FLOAT
+	select BR2_MIPS_CPU_HAS_MSA
+	help
+	  For some CPU cores, the MSA extension is optional.
+	  Select this option if you are certain your particular
+	  implementation has MSA support and you want to use it.
+
 config BR2_ARCH
 	default "mips"		if BR2_mips
 	default "mipsel"	if BR2_mipsel
diff --git a/toolchain/toolchain-wrapper.mk b/toolchain/toolchain-wrapper.mk
index 8939650..76fd557 100644
--- a/toolchain/toolchain-wrapper.mk
+++ b/toolchain/toolchain-wrapper.mk
@@ -9,6 +9,13 @@ else
 TOOLCHAIN_WRAPPER_HASH_STYLE = both
 endif
 
+# MIPS optimization flags
+ifeq ($(BR2_MIPS_CPU_HAS_MSA),y)
+TARGET_FLAGS += -mmsa
+endif
+
+# Keep BR2_TARGET_OPTIMIZATION as the last one since it may be used
+# to override the automatically added options above.
 TARGET_FLAGS += $(call qstrip,$(BR2_TARGET_OPTIMIZATION))
 
 TOOLCHAIN_WRAPPER_ARGS = $($(PKG)_TOOLCHAIN_WRAPPER_ARGS)
-- 
2.9.3
