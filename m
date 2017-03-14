From: Max Filippov <jcmvbkbc@gmail.com>
Date: Tue, 14 Mar 2017 11:30:41 -0700
Subject: [Buildroot] [PATCH 12/23] arch/xtensa: add macros to generate hooks
In-Reply-To: <1489516252-3803-1-git-send-email-jcmvbkbc@gmail.com>
References: <1489516252-3803-1-git-send-email-jcmvbkbc@gmail.com>
Message-ID: <1489516252-3803-13-git-send-email-jcmvbkbc@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

These macro generators, one for the target variant, one for the host
variant, work like the package macro generators, and generate a
post-extract hook.

Packages that need the Xtensa overlay can then:
  - define <PKG>_ARC_XTENSA_OVERLAY_COMPONENT
  - $(eval ...) the appropriate macro (target or host).

This will allow to keep consistency across all packages that need that
overlay, to avoid them diverging again in the future should we need to
change the way we handle the Xtensa overlay (like, allowing it to be
downloaded).

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
 arch/arch.mk.xtensa | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arch.mk.xtensa b/arch/arch.mk.xtensa
index 2843333..0377ceb 100644
--- a/arch/arch.mk.xtensa
+++ b/arch/arch.mk.xtensa
@@ -26,3 +26,33 @@ ARCH_XTENSA_OVERLAY_TAR = $(call qstrip,$(BR2_XTENSA_OVERLAY_DIR))/xtensa_$(ARCH
 define arch-xtensa-overlay-extract
 	tar xf $(ARCH_XTENSA_OVERLAY_TAR) -C $(1) --strip-components=1 $(2)
 endef
+
+################################################################################
+# arch-xtensa-overlay-inner -- generates the make targets needed to extract
+# the xtensa overlay
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
2.1.4
