From: Lionel Landwerlin <llandwerlin@gmail.com>
Date: Tue, 27 Oct 2009 00:02:44 +0100
Subject: [Buildroot] [PATCH] Allow
 reinstall/rebuild/reconfigure/reautoreconf of autotools packages
Message-ID: <1256598164.8809.360.camel@coalu.atr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


When working upstream with packages, you often have to recompile your
package with the modifications you just did. To act like this with
buildroot, and benefit from the rootfs image's regeneration, you have
to delete manualy the stamps files related to the operations you want
to trigger.

This patch is a first try to provide a way to trigger action on
particular packages without dealing with the buildroot internal's.

It adds the following rules :
   PKG-reautoreconf => autoreconf + configure + build
   PKG-reconfigure => configure + build
   PKG-rebuild => build
   PKG-reinstall-staging => install to staging
   PKG-reinstall-target => install to target

I selected actions to trigger according to my requirement, but I'm
open to suggestions.

Currenlty thoses rules are only available to packages using autotools,
I hope the ongoing work started by Thomas will bring this feature to
all packages.

Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
---
 package/Makefile.autotools.in |   28 ++++++++++++++++++++++++++++
 1 files changed, 28 insertions(+), 0 deletions(-)

diff --git a/package/Makefile.autotools.in b/package/Makefile.autotools.in
index c3257cf..5c02c59 100644
--- a/package/Makefile.autotools.in
+++ b/package/Makefile.autotools.in
@@ -382,12 +382,22 @@ $(1)-install:		$(1)-install-staging $(1)-install-target \
 
 ifeq ($$($(2)_INSTALL_TARGET),YES)
 $(1)-install-target:	$(1)-build $$($(2)_TARGET_INSTALL_TARGET)
+
+$(1)-reinstall-target-internal:
+	rm -f $$($(2)_DIR)/.stamp_target_installed
+
+$(1)-reinstall-target: | $(1)-reinstall-target-internal $(1)-install-target
 else
 $(1)-install-target:
 endif
 
 ifeq ($$($(2)_INSTALL_STAGING),YES)
 $(1)-install-staging:	$(1)-build $$($(2)_TARGET_INSTALL_STAGING)
+
+$(1)-reinstall-staging-internal:
+	rm -f $$($(2)_DIR)/.stamp_staging_installed
+
+$(1)-reinstall-staging: | $(1)-reinstall-staging-internal $(1)-install-staging
 else
 $(1)-install-staging:
 endif
@@ -396,13 +406,31 @@ $(1)-build:		$(1)-configure \
 			$$($(2)_TARGET_BUILD) \
 			$$($(2)_HOOK_POST_BUILD)
 
+$(1)-rebuild-internal:
+	rm -f $$($(2)_DIR)/.stamp_built
+
+$(1)-rebuild: | $(1)-rebuild-internal $(1)-build
+
 $(1)-configure:		$(1)-autoreconf \
 			$$($(2)_TARGET_CONFIGURE) \
 			$$($(2)_HOOK_POST_CONFIGURE)
 
+$(1)-reconfigure-internal:
+	rm -f $$($(2)_DIR)/.stamp_configured
+	rm -f $$($(2)_DIR)/.stamp_built
+
+$(1)-reconfigure: | $(1)-reconfigure-internal $(1)-build
+
 ifeq ($$($(2)_AUTORECONF),YES)
 $(1)-autoreconf:	$(1)-patch $$($(2)_TARGET_AUTORECONF)
 $(2)_DEPENDENCIES += host-automake host-autoconf host-libtool
+
+$(1)-reautoreconf-internal:
+	rm -f $$($(2)_DIR)/.stamp_autoconfigured
+	rm -f $$($(2)_DIR)/.stamp_configured
+	rm -f $$($(2)_DIR)/.stamp_built
+
+$(1)-reautoreconf: | $(1)-reautoreconf-internal $(1)-build
 else
 $(1)-autoreconf:	$(1)-patch
 endif
-- 
1.6.5
