From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 19 Feb 2013 12:41:00 +0100
Subject: [Buildroot] [git commit] vim: Add post-install hook to remove
	documentation from target
Message-ID: <20130219114157.14A529AB88@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=443b66ae4bd6957ba66851324a8d1bd9f8a86075
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
Reviewed-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
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
