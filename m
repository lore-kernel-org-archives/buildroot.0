From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  1 Jun 2014 12:28:54 +0200
Subject: [Buildroot] [PATCH] package infra: remove duplicates in
	dependencies list
Message-ID: <1401618534-16200-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Currently, we just use what a package declares as its dependencies.

But some packages may declare the same depdency more than once. For
example, php has two options to add SQL support: 'mysql' or 'mysqli',
which are not exclusive. So, php.mk has mysql twice as a dependency.

Although that does not cause any grievance for make, we end up generating
dependency graphs where this duplicate dependency is visible.

Add an intermediary variable which contains the $(sort)-ed list of the
dependnecies, thus eliminating any duplicates.

This has the side effect of also sorting the list, which is probably
good for reproducibility anyway.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>

---
Changes v1 -> v2:
  - fix typoes in commit log  (Thomas)
  - s/dupes/duplicates/  (Thomas)
---
 package/pkg-generic.mk | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 5116ed9..e950569 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -391,6 +391,9 @@ $(2)_DEPENDENCIES += toolchain
 endif
 endif
 
+# Eliminate duplicates in dependencies
+$(2)_FINAL_DEPENDENCIES = $$(sort $$($(2)_DEPENDENCIES))
+
 $(2)_INSTALL_STAGING		?= NO
 $(2)_INSTALL_IMAGES		?= NO
 $(2)_INSTALL_TARGET		?= YES
@@ -476,14 +479,14 @@ $$($(2)_TARGET_INSTALL_HOST):	$$($(2)_TARGET_BUILD)
 $(1)-build:		$$($(2)_TARGET_BUILD)
 $$($(2)_TARGET_BUILD):	$$($(2)_TARGET_CONFIGURE)
 
-# Since $(2)_DEPENDENCIES are phony targets, they are always "newer"
+# Since $(2)_FINAL_DEPENDENCIES are phony targets, they are always "newer"
 # than $(2)_TARGET_CONFIGURE. This would force the configure step (and
 # therefore the other steps as well) to be re-executed with every
-# invocation of make.  Therefore, make $(2)_DEPENDENCIES an order-only
+# invocation of make.  Therefore, make $(2)_FINAL_DEPENDENCIES an order-only
 # dependency by using |.
 
 $(1)-configure:			$$($(2)_TARGET_CONFIGURE)
-$$($(2)_TARGET_CONFIGURE):	| $$($(2)_DEPENDENCIES)
+$$($(2)_TARGET_CONFIGURE):	| $$($(2)_FINAL_DEPENDENCIES)
 
 $$($(2)_TARGET_SOURCE) $$($(2)_TARGET_RSYNC): | dirs prepare
 ifeq ($(filter $(1),$(DEPENDENCIES_HOST_PREREQ)),)
@@ -505,7 +508,7 @@ $$($(2)_TARGET_PATCH):	$$($(2)_TARGET_EXTRACT)
 $(1)-extract:			$$($(2)_TARGET_EXTRACT)
 $$($(2)_TARGET_EXTRACT):	$$($(2)_TARGET_SOURCE)
 
-$(1)-depends:		$$($(2)_DEPENDENCIES)
+$(1)-depends:		$$($(2)_FINAL_DEPENDENCIES)
 
 $(1)-source:		$$($(2)_TARGET_SOURCE)
 else
@@ -515,7 +518,7 @@ else
 #  configure
 $$($(2)_TARGET_CONFIGURE):	$$($(2)_TARGET_RSYNC)
 
-$(1)-depends:		$$($(2)_DEPENDENCIES)
+$(1)-depends:		$$($(2)_FINAL_DEPENDENCIES)
 
 $(1)-patch:		$(1)-rsync
 $(1)-extract:		$(1)-rsync
@@ -526,7 +529,7 @@ $(1)-source:		$$($(2)_TARGET_RSYNC_SOURCE)
 endif
 
 $(1)-show-depends:
-			@echo $$($(2)_DEPENDENCIES)
+			@echo $$($(2)_FINAL_DEPENDENCIES)
 
 $(1)-graph-depends:
 			@$(INSTALL) -d $(O)/graphs
-- 
1.8.3.2
