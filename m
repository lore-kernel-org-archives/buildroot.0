From: Markos Chandras <markos.chandras@gmail.com>
Date: Tue, 12 Feb 2013 10:51:39 +0000
Subject: [Buildroot] [PATCH v2] vim: Add post-install hook to remove
	documentation from target
Message-ID: <1360666299-3661-1-git-send-email-markos.chandras@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Markos Chandras <markos.chandras@imgtec.com>

Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 package/vim/vim.mk |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/package/vim/vim.mk b/package/vim/vim.mk
index fa5f8ae..4e273d4 100644
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
 
+ifneq ($(BR2_HAVE_DOCUMENTATION),y)
+VIM_POST_INSTALL_TARGET_HOOKS += VIM_REMOVE_DOCS
+endif
+
 $(eval $(autotools-package))
-- 
1.7.1
