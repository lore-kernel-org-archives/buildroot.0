From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Sun, 16 Oct 2016 18:05:16 +0100
Subject: [Buildroot] [PATCH 1/7] toolchain-wrapper: pass MIPS optimizations
	to TOOLCHAIN_WRAPPER_OPTS
Message-ID: <20161016170522.36074-1-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 toolchain/toolchain-wrapper.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/toolchain/toolchain-wrapper.mk b/toolchain/toolchain-wrapper.mk
index af39071..6e480e6 100644
--- a/toolchain/toolchain-wrapper.mk
+++ b/toolchain/toolchain-wrapper.mk
@@ -12,9 +12,14 @@ endif
 TOOLCHAIN_WRAPPER_ARGS = $($(PKG)_TOOLCHAIN_WRAPPER_ARGS)
 TOOLCHAIN_WRAPPER_ARGS += -DBR_SYSROOT='"$(STAGING_SUBDIR)"'
 
+# MIPS optimization flags
+TOOLCHAIN_WRAPPER_MIPS_OPTS =
+
 # We create a list like '"-mfoo", "-mbar", "-mbarfoo"' so that each flag is a
 # separate argument when used in execv() by the toolchain wrapper.
 TOOLCHAIN_WRAPPER_OPTS = \
+	$(foreach f,$(call qstrip,$(TOOLCHAIN_WRAPPER_MIPS_OPTS)),"$(f)"$(comma))
+TOOLCHAIN_WRAPPER_OPTS += \
 	$(foreach f,$(call qstrip,$(BR2_TARGET_OPTIMIZATION)),"$(f)"$(comma))
 TOOLCHAIN_WRAPPER_ARGS += -DBR_ADDITIONAL_CFLAGS='$(TOOLCHAIN_WRAPPER_OPTS)'
 
-- 
2.10.0
