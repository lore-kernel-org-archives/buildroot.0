From: Waldemar Brodkorb <wbx@openadk.org>
Date: Sat, 26 Nov 2016 09:51:44 +0100
Subject: [Buildroot] [PATCH] m68k: add special gcc flag to avoid ICE for
	coldfire
Message-ID: <20161126085144.GA23223@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
  http://autobuild.buildroot.net/results/d47fa41aa860d82471b83ac90967d3a3dacd8611
  http://autobuild.buildroot.net/results/a21de4747f40a5ce93108c8979fbc0277d040e79

Requires this as prerequisite:
http://patchwork.ozlabs.org/patch/683830/

Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
Tested-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 toolchain/toolchain-wrapper.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/toolchain/toolchain-wrapper.mk b/toolchain/toolchain-wrapper.mk
index c7b5019..463ba42 100644
--- a/toolchain/toolchain-wrapper.mk
+++ b/toolchain/toolchain-wrapper.mk
@@ -9,6 +9,13 @@ else
 TOOLCHAIN_WRAPPER_HASH_STYLE = both
 endif
 
+TARGET_FLAGS += $(call qstrip,$(BR2_TARGET_OPTIMIZATION))
+
+# Internal error, aborting at dw2gencfi.c:214 in emit_expr_encoded
+ifeq ($(BR2_m68k_cf),y)
+TARGET_FLAGS += -fno-dwarf2-cfi-asm
+endif
+
 TOOLCHAIN_WRAPPER_ARGS = $($(PKG)_TOOLCHAIN_WRAPPER_ARGS)
 TOOLCHAIN_WRAPPER_ARGS += -DBR_SYSROOT='"$(STAGING_SUBDIR)"'
 
-- 
2.1.4
