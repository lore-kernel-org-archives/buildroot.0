From: Quotient Remainder <quotientvremainder@gmail.com>
Date: Mon, 18 Jul 2011 10:46:07 +0100
Subject: [Buildroot] [PATCH] Makefile.package.in: Pass non-prefixed name as
	argument to GENTARGETS_INNER.
Message-ID: <1310982367-20976-1-git-send-email-quotientvremainder@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Instead of effectively running s/^host-// on the package name, just pass the
non-prefixed name to GENTARGETS_INNER.  This removes the need to ban packages
with names starting with "host-".

Signed-off-by: Quotient Remainder <quotientvremainder@gmail.com>
---
 package/Makefile.package.in |    7 ++++---
 1 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/Makefile.package.in b/package/Makefile.package.in
index 74087cd..f4d54fe 100644
--- a/package/Makefile.package.in
+++ b/package/Makefile.package.in
@@ -347,6 +347,7 @@ $(BUILD_DIR)/%/.stamp_dircleaned:
 #             for host packages
 #  argument 4 is the package directory prefix
 #  argument 5 is the type (target or host)
+#  argument 6 is the lowercase package name without the host- prefix.
 ################################################################################
 
 define GENTARGETS_INNER
@@ -516,7 +517,7 @@ $$($(2)_TARGET_INSTALL_HOST):           PKG=$(2)
 $$($(2)_TARGET_BUILD):			PKG=$(2)
 $$($(2)_TARGET_CONFIGURE):		PKG=$(2)
 $$($(2)_TARGET_PATCH):			PKG=$(2)
-$$($(2)_TARGET_PATCH):			RAWNAME=$(patsubst host-%,%,$(1))
+$$($(2)_TARGET_PATCH):			RAWNAME=$(6)
 $$($(2)_TARGET_EXTRACT):		PKG=$(2)
 $$($(2)_TARGET_SOURCE):			PKG=$(2)
 $$($(2)_TARGET_UNINSTALL):		PKG=$(2)
@@ -562,10 +563,10 @@ endef # GENTARGETS_INNER
 define GENTARGETS
 ifeq ($(3),host)
 # In the case of host packages, turn the package name "pkg" into "host-pkg"
-$(call GENTARGETS_INNER,$(3)-$(2),$(call UPPERCASE,$(3)-$(2)),$(call UPPERCASE,$(2)),$(1),host)
+$(call GENTARGETS_INNER,$(3)-$(2),$(call UPPERCASE,$(3)-$(2)),$(call UPPERCASE,$(2)),$(1),host,$(2))
 else
 # In the case of target packages, keep the package name "pkg"
-$(call GENTARGETS_INNER,$(2),$(call UPPERCASE,$(2)),$(call UPPERCASE,$(2)),$(1),target)
+$(call GENTARGETS_INNER,$(2),$(call UPPERCASE,$(2)),$(call UPPERCASE,$(2)),$(1),target,$(2))
 endif
 endef
 
-- 
1.7.6
