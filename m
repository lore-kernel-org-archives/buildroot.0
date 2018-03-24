From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 24 Mar 2018 15:20:08 +0100
Subject: [Buildroot] [PATCH v4 9/9] core: kill DEPENDENCIES_HOST_PREREQ
In-Reply-To: <20180324142008.10375-1-thomas.petazzoni@bootlin.com>
References: <20180324142008.10375-1-thomas.petazzoni@bootlin.com>
Message-ID: <20180324142008.10375-10-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Now that DEPENDENCIES_HOST_PREREQ is no longer used anywhere, we can
kill it.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
Changes since v3:
 - Added Acked-by from Yann.

Changes since v2:
 - New patch
---
 Makefile                             |  2 --
 package/pkg-generic.mk               |  2 --
 support/dependencies/dependencies.mk | 10 ++--------
 3 files changed, 2 insertions(+), 12 deletions(-)

diff --git a/Makefile b/Makefile
index 925d6e4aec..a3a9d290d9 100644
--- a/Makefile
+++ b/Makefile
@@ -501,8 +501,6 @@ include package/Makefile.in
 -include $(sort $(wildcard arch/arch.mk.*))
 include support/dependencies/dependencies.mk
 
-PACKAGES += $(DEPENDENCIES_HOST_PREREQ)
-
 include $(sort $(wildcard toolchain/*.mk))
 include $(sort $(wildcard toolchain/*/*.mk))
 
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 6d1f267328..6d82f7027e 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -690,9 +690,7 @@ $(1)-configure:			$$($(2)_TARGET_CONFIGURE)
 $$($(2)_TARGET_CONFIGURE):	| $$($(2)_FINAL_DEPENDENCIES)
 
 $$($(2)_TARGET_SOURCE) $$($(2)_TARGET_RSYNC): | dirs prepare
-ifeq ($$(filter $(1),$$(DEPENDENCIES_HOST_PREREQ)),)
 $$($(2)_TARGET_SOURCE) $$($(2)_TARGET_RSYNC): | dependencies
-endif
 
 ifeq ($$($(2)_OVERRIDE_SRCDIR),)
 # In the normal case (no package override), the sequence of steps is
diff --git a/support/dependencies/dependencies.mk b/support/dependencies/dependencies.mk
index bab064319f..563574d6ad 100644
--- a/support/dependencies/dependencies.mk
+++ b/support/dependencies/dependencies.mk
@@ -17,19 +17,13 @@ endef
 include support/dependencies/check-host-tar.mk
 -include $(sort $(filter-out %-tar.mk,$(wildcard support/dependencies/check-host-*.mk)))
 
-core-dependencies:
+dependencies:
 	@MAKE="$(MAKE)" DL_TOOLS="$(sort $(DL_TOOLS_DEPENDENCIES))" \
 		$(TOPDIR)/support/dependencies/dependencies.sh
 
-$(DEPENDENCIES_HOST_PREREQ): HOSTCC=$(HOSTCC_NOCCACHE)
-$(DEPENDENCIES_HOST_PREREQ): HOSTCXX=$(HOSTCXX_NOCCACHE)
-$(DEPENDENCIES_HOST_PREREQ): core-dependencies
-
-dependencies: core-dependencies $(DEPENDENCIES_HOST_PREREQ)
-
 ################################################################################
 #
 # Toplevel Makefile options
 #
 ################################################################################
-.PHONY: dependencies core-dependencies
+.PHONY: dependencies
-- 
2.14.3
