From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri,  1 Dec 2017 21:53:49 +0100
Subject: [Buildroot] [RFCv3 12/15] core: kill DEPENDENCIES_HOST_PREREQ
In-Reply-To: <20171201205352.24287-1-thomas.petazzoni@free-electrons.com>
References: <20171201205352.24287-1-thomas.petazzoni@free-electrons.com>
Message-ID: <20171201205352.24287-13-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Now that DEPENDENCIES_HOST_PREREQ is no longer used anywhere, we can
kill it.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
Changes since v2:
 - New patch
---
 Makefile                             |  2 --
 package/pkg-generic.mk               |  2 --
 support/dependencies/dependencies.mk | 10 +++-------
 3 files changed, 3 insertions(+), 11 deletions(-)

diff --git a/Makefile b/Makefile
index f31834682c..090b3ba191 100644
--- a/Makefile
+++ b/Makefile
@@ -485,8 +485,6 @@ include package/Makefile.in
 -include $(wildcard arch/arch.mk.*)
 include support/dependencies/dependencies.mk
 
-PACKAGES += $(DEPENDENCIES_HOST_PREREQ)
-
 include toolchain/*.mk
 include toolchain/*/*.mk
 
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 7c5d951af9..8c6e34cc9f 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -725,9 +725,7 @@ $(1)-configure:			$$($(2)_TARGET_CONFIGURE)
 $$($(2)_TARGET_CONFIGURE):	| $$($(2)_FINAL_DEPENDENCIES)
 
 $$($(2)_TARGET_SOURCE) $$($(2)_TARGET_RSYNC): | dirs prepare
-ifeq ($$(filter $(1),$$(DEPENDENCIES_HOST_PREREQ)),)
 $$($(2)_TARGET_SOURCE) $$($(2)_TARGET_RSYNC): | dependencies
-endif
 
 ifeq ($$($(2)_OVERRIDE_SRCDIR),)
 # In the normal case (no package override), the sequence of steps is
diff --git a/support/dependencies/dependencies.mk b/support/dependencies/dependencies.mk
index 1a4b5df9f2..d8ec137b12 100644
--- a/support/dependencies/dependencies.mk
+++ b/support/dependencies/dependencies.mk
@@ -14,18 +14,14 @@ $(shell support/dependencies/check-host-$(1).sh $(2))
 endef
 -include $(sort $(wildcard support/dependencies/check-host-*.mk))
 
-core-dependencies:
-	@HOSTCC="$(firstword $(HOSTCC))" MAKE="$(MAKE)" \
+dependencies:
+	@HOSTCC="$(firstword $(HOSTCC_NOCCACHE))" MAKE="$(MAKE)" \
 		DL_TOOLS="$(sort $(DL_TOOLS_DEPENDENCIES))" \
 		$(TOPDIR)/support/dependencies/dependencies.sh
 
-core-dependencies $(DEPENDENCIES_HOST_PREREQ): HOSTCC=$(HOSTCC_NOCCACHE)
-core-dependencies $(DEPENDENCIES_HOST_PREREQ): HOSTCXX=$(HOSTCXX_NOCCACHE)
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
2.13.6
