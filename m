From: Markos Chandras <markos.chandras@gmail.com>
Date: Tue, 12 Feb 2013 10:14:55 +0000
Subject: [Buildroot] [PATCH] vim: Add option to remove documentation from
	target
Message-ID: <1360664095-16562-1-git-send-email-markos.chandras@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Markos Chandras <markos.chandras@imgtec.com>

Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 package/vim/Config.in |    8 ++++++++
 package/vim/vim.mk    |    8 ++++++++
 2 files changed, 16 insertions(+), 0 deletions(-)

diff --git a/package/vim/Config.in b/package/vim/Config.in
index 891715e..28e34b5 100644
--- a/package/vim/Config.in
+++ b/package/vim/Config.in
@@ -14,3 +14,11 @@ config BR2_PACKAGE_VIM_RUNTIME
 	help
 	  Install VIM runtime (syntax highlighing + macros).
 	  This option adds about 15MB of data to /usr/share/
+
+config BR2_PACKAGE_VIM_REMOVE_DOCS
+	bool "remove documentation"
+	default y
+	depends on BR2_PACKAGE_VIM
+	help
+	  Remove documentation files from the target.
+	  This option removes about 5.6MB of data from /usr/share/
diff --git a/package/vim/vim.mk b/package/vim/vim.mk
index fa5f8ae..d199d9b 100644
--- a/package/vim/vim.mk
+++ b/package/vim/vim.mk
@@ -36,8 +36,16 @@ define VIM_INSTALL_RUNTIME_CMDS
 		$(MAKE) DESTDIR=$(TARGET_DIR) installmacros
 endef
 
+define VIM_REMOVE_DOCS
+	find $(TARGET_DIR)/usr/share/vim -type f -name "*.txt" -delete
+endef
+
 ifeq ($(BR2_PACKAGE_VIM_RUNTIME),y)
 VIM_POST_INSTALL_TARGET_HOOKS += VIM_INSTALL_RUNTIME_CMDS
 endif
 
+ifeq ($(BR2_PACKAGE_VIM_REMOVE_DOCS),y)
+VIM_POST_INSTALL_TARGET_HOOKS += VIM_REMOVE_DOCS
+endif
+
 $(eval $(autotools-package))
-- 
1.7.1
