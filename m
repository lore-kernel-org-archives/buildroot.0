From: =?UTF-8?q?Bj=C3=B8rn=20Forsman?= <bjorn.forsman@gmail.com>
Date: Sun, 20 Feb 2011 19:27:45 +0100
Subject: [Buildroot] [PATCH] Fix uninstallation of non-staged packages
Message-ID: <1298226465-28124-1-git-send-email-bjorn.forsman@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Packages without $(PKG)_INSTALL_STAGING=YES currently fail to uninstall
themselves with 'make pkg-uninstall'. For a real life example of the
error, try uninstalling 'at' or 'dropbear'.

This patch fixes the issue by only uninstalling packages from staging if
$(PKG)_INSTALL_STAGING==YES.

Signed-off-by: Bj?rn Forsman <bjorn.forsman@gmail.com>
---
 package/Makefile.package.in |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/Makefile.package.in b/package/Makefile.package.in
index 92ce4e2..1482284 100644
--- a/package/Makefile.package.in
+++ b/package/Makefile.package.in
@@ -321,8 +321,10 @@ $(BUILD_DIR)/%/.stamp_cleaned:
 # Uninstall package from target and staging
 $(BUILD_DIR)/%/.stamp_uninstalled:
 	@$(call MESSAGE,"Uninstalling")
+ifeq ($$($(2)_INSTALL_STAGING),YES)
 	$($(PKG)_UNINSTALL_STAGING_CMDS)
 	rm -f $($(PKG)_TARGET_INSTALL_STAGING)
+endif
 	$($(PKG)_UNINSTALL_TARGET_CMDS)
 	rm -f $($(PKG)_TARGET_INSTALL_TARGET) $($(PKG)_HOOK_POST_INSTALL)
 
-- 
1.7.1
