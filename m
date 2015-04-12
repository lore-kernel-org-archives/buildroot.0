From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Apr 2015 18:37:58 +0200
Subject: [Buildroot] [PATCHv2 14/21] pkg-generic: remove the
	.stamp_rsync_sourced fake stamp file
In-Reply-To: <1428856685-4403-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1428856685-4403-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1428856685-4403-15-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The only reason for the .stamp_rsync_sourced fake stamp file target to
exist was to handle the SOURCE_CHECK operation on packages using the
OVERRIDE_SRCDIR mechanism. Now that this is handled directly inside
$(1)-source-check, there is no longer any need for this part of the
code.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pkg-generic.mk | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index b45b86e..d432a2e 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -122,14 +122,6 @@ $(BUILD_DIR)/%/.stamp_rsynced:
 	$(foreach hook,$($(PKG)_POST_RSYNC_HOOKS),$(call $(hook))$(sep))
 	$(Q)touch $@
 
-# Handle the SOURCE_CHECK case for rsynced packages
-$(BUILD_DIR)/%/.stamp_rsync_sourced:
-ifeq ($(DL_MODE),SOURCE_CHECK)
-	test -d $(SRCDIR)
-else
-	@true # Nothing to do to source a local package
-endif
-
 # Patch
 #
 # The RAWNAME variable is the lowercased package name, which allows to
@@ -439,7 +431,6 @@ $(2)_TARGET_INSTALL_HOST =      $$($(2)_DIR)/.stamp_host_installed
 $(2)_TARGET_BUILD =		$$($(2)_DIR)/.stamp_built
 $(2)_TARGET_CONFIGURE =		$$($(2)_DIR)/.stamp_configured
 $(2)_TARGET_RSYNC =	        $$($(2)_DIR)/.stamp_rsynced
-$(2)_TARGET_RSYNC_SOURCE =      $$($(2)_DIR)/.stamp_rsync_sourced
 $(2)_TARGET_PATCH =		$$($(2)_DIR)/.stamp_patched
 $(2)_TARGET_EXTRACT =		$$($(2)_DIR)/.stamp_extracted
 $(2)_TARGET_SOURCE =		$$($(2)_DIR)/.stamp_downloaded
@@ -568,7 +559,7 @@ $(1)-extract:		$(1)-rsync
 
 $(1)-rsync:		$$($(2)_TARGET_RSYNC)
 
-$(1)-source:		$$($(2)_TARGET_RSYNC_SOURCE)
+$(1)-source:
 
 $(1)-external-deps:
 	@echo "file://$$($(2)_OVERRIDE_SRCDIR)"
@@ -638,8 +629,6 @@ $$($(2)_TARGET_BUILD):			PKG=$(2)
 $$($(2)_TARGET_CONFIGURE):		PKG=$(2)
 $$($(2)_TARGET_RSYNC):                  SRCDIR=$$($(2)_OVERRIDE_SRCDIR)
 $$($(2)_TARGET_RSYNC):                  PKG=$(2)
-$$($(2)_TARGET_RSYNC_SOURCE):		SRCDIR=$$($(2)_OVERRIDE_SRCDIR)
-$$($(2)_TARGET_RSYNC_SOURCE):		PKG=$(2)
 $$($(2)_TARGET_PATCH):			PKG=$(2)
 $$($(2)_TARGET_PATCH):			RAWNAME=$$(patsubst host-%,%,$(1))
 $$($(2)_TARGET_PATCH):			PKGDIR=$(pkgdir)
-- 
2.1.0
