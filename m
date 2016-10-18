From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 18 Oct 2016 20:51:27 +0200
Subject: [Buildroot] [PATCH 1/2] toolchain-wrapper.mk: refactor additional
	flags into TARGET_FLAGS
Message-ID: <20161018185128.6404-1-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, the additional flags encoded in the toolchain wrapper are
limited to BR2_TARGET_OPTIMIZATION. However, we are going to add more
flags to it, so it is convenient to have a TARGET_FLAGS variable
that collects all of them and do the list-to-array conversion on all
of them together.

The variable is called TARGET_FLAGS because later it will be modified
to include all the flags that we pass to the toolchain wrapper, and
it will also be used as the base for TARGET_CFLAGS etc.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 toolchain/toolchain-wrapper.mk | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/toolchain/toolchain-wrapper.mk b/toolchain/toolchain-wrapper.mk
index af39071..8939650 100644
--- a/toolchain/toolchain-wrapper.mk
+++ b/toolchain/toolchain-wrapper.mk
@@ -9,14 +9,15 @@ else
 TOOLCHAIN_WRAPPER_HASH_STYLE = both
 endif
 
+TARGET_FLAGS += $(call qstrip,$(BR2_TARGET_OPTIMIZATION))
+
 TOOLCHAIN_WRAPPER_ARGS = $($(PKG)_TOOLCHAIN_WRAPPER_ARGS)
 TOOLCHAIN_WRAPPER_ARGS += -DBR_SYSROOT='"$(STAGING_SUBDIR)"'
 
 # We create a list like '"-mfoo", "-mbar", "-mbarfoo"' so that each flag is a
 # separate argument when used in execv() by the toolchain wrapper.
-TOOLCHAIN_WRAPPER_OPTS = \
-	$(foreach f,$(call qstrip,$(BR2_TARGET_OPTIMIZATION)),"$(f)"$(comma))
-TOOLCHAIN_WRAPPER_ARGS += -DBR_ADDITIONAL_CFLAGS='$(TOOLCHAIN_WRAPPER_OPTS)'
+TOOLCHAIN_WRAPPER_ARGS += \
+	-DBR_ADDITIONAL_CFLAGS='$(foreach f,$(TARGET_FLAGS),"$(f)"$(comma))'
 
 ifeq ($(BR2_CCACHE),y)
 TOOLCHAIN_WRAPPER_ARGS += -DBR_CCACHE
-- 
2.9.3
