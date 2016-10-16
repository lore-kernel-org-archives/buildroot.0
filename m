From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Sun, 16 Oct 2016 18:05:17 +0100
Subject: [Buildroot] [PATCH 2/7] MIPS: add support for MSA
In-Reply-To: <20161016170522.36074-1-Vincent.Riera@imgtec.com>
References: <20161016170522.36074-1-Vincent.Riera@imgtec.com>
Message-ID: <20161016170522.36074-2-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 arch/Config.in.mips            | 17 +++++++++++++++++
 toolchain/toolchain-wrapper.mk |  3 +++
 2 files changed, 20 insertions(+)

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
index 6e480e6..f9a1899 100644
--- a/toolchain/toolchain-wrapper.mk
+++ b/toolchain/toolchain-wrapper.mk
@@ -14,6 +14,9 @@ TOOLCHAIN_WRAPPER_ARGS += -DBR_SYSROOT='"$(STAGING_SUBDIR)"'
 
 # MIPS optimization flags
 TOOLCHAIN_WRAPPER_MIPS_OPTS =
+ifeq ($(BR2_MIPS_CPU_HAS_MSA),y)
+TOOLCHAIN_WRAPPER_MIPS_OPTS += -mmsa
+endif
 
 # We create a list like '"-mfoo", "-mbar", "-mbarfoo"' so that each flag is a
 # separate argument when used in execv() by the toolchain wrapper.
-- 
2.10.0
