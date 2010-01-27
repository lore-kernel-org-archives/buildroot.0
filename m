From: llandwerlin at gmail.com <llandwerlin@gmail.com>
Date: Wed, 27 Jan 2010 02:09:01 +0100
Subject: [Buildroot] [PATCH 13/19] package: Added post uninstall hooks
In-Reply-To: <1264554547-9009-1-git-send-email-llandwerlin@gmail.com>
References: <1264554547-9009-1-git-send-email-llandwerlin@gmail.com>
Message-ID: <1264554547-9009-14-git-send-email-llandwerlin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Lionel Landwerlin <llandwerlin@gmail.com>

$(PKG)_POST_UNINSTALL_STAGING_HOOKS and $(PKG)_POST_UNINSTALL_TARGET_HOOKS

Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
---
 package/Makefile.package.in |   18 +++++++++++-------
 1 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/package/Makefile.package.in b/package/Makefile.package.in
index fbd7f69..d02706d 100644
--- a/package/Makefile.package.in
+++ b/package/Makefile.package.in
@@ -192,8 +192,10 @@ $(BUILD_DIR)/%/.stamp_cleaned:
 $(BUILD_DIR)/%/.stamp_uninstalled:
 	@$(call MESSAGE,"Uninstalling")
 	$($(PKG)_UNINSTALL_STAGING_CMDS)
+	$(foreach hook,$($(PKG)_POST_UNINSTALL_STAGING_HOOKS),$(call $(hook))$(sep))
 	rm -f $($(PKG)_TARGET_INSTALL_STAGING)
 	$($(PKG)_UNINSTALL_TARGET_CMDS)
+	$(foreach hook,$($(PKG)_POST_UNINSTALL_TARGET_HOOKS),$(call $(hook))$(sep))
 	rm -f $($(PKG)_TARGET_INSTALL_TARGET) $($(PKG)_HOOK_POST_INSTALL)
 
 # Remove package sources
@@ -277,13 +279,15 @@ $(2)_TARGET_CLEAN =		$$($(2)_DIR)/.stamp_cleaned
 $(2)_TARGET_DIRCLEAN =		$$($(2)_DIR)/.stamp_dircleaned
 
 # new-style hooks
-$(2)_POST_EXTRACT_HOOKS         ?=
-$(2)_POST_PATCH_HOOKS           ?=
-$(2)_POST_CONFIGURE_HOOKS       ?=
-$(2)_POST_BUILD_HOOKS           ?=
-$(2)_POST_INSTALL_HOOKS         ?=
-$(2)_POST_INSTALL_STAGING_HOOKS ?=
-$(2)_POST_INSTALL_TARGET_HOOKS  ?=
+$(2)_POST_EXTRACT_HOOKS           ?=
+$(2)_POST_PATCH_HOOKS             ?=
+$(2)_POST_CONFIGURE_HOOKS         ?=
+$(2)_POST_BUILD_HOOKS             ?=
+$(2)_POST_INSTALL_HOOKS           ?=
+$(2)_POST_INSTALL_STAGING_HOOKS   ?=
+$(2)_POST_INSTALL_TARGET_HOOKS    ?=
+$(2)_POST_UNINSTALL_STAGING_HOOKS ?=
+$(2)_POST_UNINSTALL_TARGET_HOOKS  ?=
 
 # old-style hooks
 $(2)_HOOK_POST_EXTRACT =	$$($(2)_DIR)/.stamp_hook_post_extract
-- 
1.6.6
