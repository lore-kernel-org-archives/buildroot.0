From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 23 Nov 2015 15:48:13 +0100
Subject: [Buildroot] [PATCH 43/51] arch/xtensa: add macros to generate hooks
In-Reply-To: <cover.1448289515.git.yann.morin.1998@free.fr>
References: <cover.1448289515.git.yann.morin.1998@free.fr>
Message-ID: <2302945c50d1cfd4819a70100e61a1cdb4a6ab69.1448289515.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

These macro generators, one fr the target variant, one for the host
variant, work like the package macro generators, and generate two
hooks:
  - a post-extract hook,
  - a post-legal-info hook.

Packages that need the Xtensa overlay can then:
  - define <PKG>_ARC_XTENSA_OVERLAY_COMPONENT
  - $(eval ...) the appropriate macro (target or host).

This will allow to keep consistency across the four packages that need
that overlay, to avoid them diverging again in the future should we need
to change the way we handle the Xtensa overlay (like, allowing it to be
downloaded).

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 arch/arch.mk.xtensa | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/arch/arch.mk.xtensa b/arch/arch.mk.xtensa
index 3001538..d2f4f59 100644
--- a/arch/arch.mk.xtensa
+++ b/arch/arch.mk.xtensa
@@ -39,3 +39,38 @@ endef
 define arch-xtensa-overlay-legal-info
 	$(call hardlink-copy,$(ARCH_XTENSA_OVERLAY_TAR),$(1))
 endef
+
+################################################################################
+# arch-xtensa-overlay-inner -- generates the make targets needed to extract
+# the xtensa overlay, and save it to legal-info
+#
+# argument 1 is the uppercase package name, including a HOST_ prefix
+#            for host packages
+#
+# Packages that call that macro shall define FOO_ARCH_XTENSA_OVERLAY_COMPONENT
+# and set it to one of the component to extract, one of: binutils, gcc, gdb.
+#
+################################################################################
+define arch-xtensa-overlay-inner
+
+ifneq ($$(ARCH_XTENSA_CORE_NAME),)
+
+define $(1)_XTENSA_OVERLAY_EXTRACT
+	$$(call arch-xtensa-overlay-extract,$$(@D),$$($(1)_ARCH_XTENSA_OVERLAY_COMPONENT))
+endef
+$(1)_POST_EXTRACT_HOOKS += $(1)_XTENSA_OVERLAY_EXTRACT
+
+define $(1)_XTENSA_OVERLAY_LEGAL_INFO
+	$(Q)$$(call arch-xtensa-overlay-legal-info,$$($(1)_REDIST_SOURCES_DIR))
+endef
+$(1)_POST_LEGAL_INFO_HOOKS += $(1)_XTENSA_OVERLAY_LEGAL_INFO
+
+endif # ARCH_XTENSA_CORE_NAME != ""
+
+endef # arch-xtensa-overlay-inner
+
+################################################################################
+# arch-xtensa-overlay -- the target generator macro for the Xtensa overlay
+################################################################################
+arch-xtensa-overlay = $(call arch-xtensa-overlay-inner,$(call UPPERCASE,$(pkgname)))
+host-arch-xtensa-overlay = $(call arch-xtensa-overlay-inner,HOST_$(call UPPERCASE,$(pkgname)))
-- 
1.9.1
