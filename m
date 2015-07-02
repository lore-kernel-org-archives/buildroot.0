From: Anthony Viallard <viallard@syscom-instruments.com>
Date: Thu,  2 Jul 2015 11:15:15 +0200
Subject: [Buildroot] [PATCH 1/1] force rsync of local package and try to
	rebuild it with its dependencies
Message-ID: <1435828515-16620-1-git-send-email-viallard@syscom-instruments.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The purpose of this patch is to force rsync of local site packages and
rebuild them if their source code has changed. Therefore, if the source
of a package has changed, it will be rebuild if you type make or
make <pkg>. Likewise, if a package has a library dependency which is
local site package too and you type make <pkg>, the library will be
rebuild if the source has been modified.

This behavior is pretty useful if you use buildroot with many of your
own packages. Especially if you share these packages with a developer
team through a version control system like git.

Signed-off-by: Anthony Viallard <viallard@syscom-instruments.com>
---
 package/pkg-generic.mk | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index d5b29f0..d31ebc2 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -102,7 +102,7 @@ $(BUILD_DIR)/%/.stamp_rsynced:
 	@$(call MESSAGE,"Syncing from source dir $(SRCDIR)")
 	@test -d $(SRCDIR) || (echo "ERROR: $(SRCDIR) does not exist" ; exit 1)
 	$(foreach hook,$($(PKG)_PRE_RSYNC_HOOKS),$(call $(hook))$(sep))
-	rsync -au $(RSYNC_VCS_EXCLUSIONS) $(SRCDIR)/ $(@D)
+	rsync -au $(RSYNC_VCS_EXCLUSIONS) --include core $(SRCDIR)/ $(@D)
 	$(foreach hook,$($(PKG)_POST_RSYNC_HOOKS),$(call $(hook))$(sep))
 	$(Q)touch $@
 
@@ -458,7 +458,11 @@ $(2)_PRE_LEGAL_INFO_HOOKS       ?=
 $(2)_POST_LEGAL_INFO_HOOKS      ?=
 
 # human-friendly targets and target sequencing
+ifeq ($$($(2)_SITE_METHOD),local)
+$(1):			$(1)-clean-for-rebuild $(1)-install
+else
 $(1):			$(1)-install
+endif
 
 ifeq ($$($(2)_TYPE),host)
 $(1)-install:	        $(1)-install-host
@@ -604,12 +608,12 @@ $(1)-reinstall:		$(1)-clean-for-reinstall $(1)
 $(1)-clean-for-rebuild: $(1)-clean-for-reinstall
 			rm -f $$($(2)_TARGET_BUILD)
 
-$(1)-rebuild:		$(1)-clean-for-rebuild $(1)
+$(1)-rebuild:		$(1)-clean-for-rebuild $(1)-install
 
 $(1)-clean-for-reconfigure: $(1)-clean-for-rebuild
 			rm -f $$($(2)_TARGET_CONFIGURE)
 
-$(1)-reconfigure:	$(1)-clean-for-reconfigure $(1)
+$(1)-reconfigure:	$(1)-clean-for-reconfigure $(1)-install
 
 # define the PKG variable for all targets, containing the
 # uppercase package variable prefix
-- 
2.1.4
