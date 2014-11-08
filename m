From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat,  8 Nov 2014 10:54:37 -0300
Subject: [Buildroot] [PATCH] vim: install vi symlink
Message-ID: <1415454877-2710-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Install a 'vi' symlink to win over busybox vi (more features) and in
case busybox isn't around, for people expecting plain simple 'vi' to
call the editor.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/vim/vim.mk | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/package/vim/vim.mk b/package/vim/vim.mk
index e06af00..7a07ef8 100644
--- a/package/vim/vim.mk
+++ b/package/vim/vim.mk
@@ -8,7 +8,9 @@ VIM_SITE = https://vim.googlecode.com/hg
 VIM_SITE_METHOD = hg
 # 7.4 release patchlevel 333
 VIM_VERSION = 8ae50e3ef8bf
-VIM_DEPENDENCIES = ncurses $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext)
+# Win over busybox vi since vim is more feature-rich
+VIM_DEPENDENCIES = ncurses $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext) \
+	$(if $(BR2_PACKAGE_BUSYBOX),busybox)
 VIM_SUBDIR = src
 VIM_CONF_ENV = vim_cv_toupper_broken=no \
 		vim_cv_terminfo=yes \
@@ -40,6 +42,12 @@ define VIM_REMOVE_DOCS
 	find $(TARGET_DIR)/usr/share/vim -type f -name "*.txt" -delete
 endef
 
+# Avoid oopses with vipw/vigr, lack of $EDITOR and 'vi' command expectation
+define VIM_INSTALL_VI_SYMLINK
+	ln -sf /usr/bin/vim $(TARGET_DIR)/bin/vi
+endef
+VIM_POST_INSTALL_TARGET_HOOKS += VIM_INSTALL_VI_SYMLINK
+
 ifeq ($(BR2_PACKAGE_VIM_RUNTIME),y)
 VIM_POST_INSTALL_TARGET_HOOKS += VIM_INSTALL_RUNTIME_CMDS
 VIM_POST_INSTALL_TARGET_HOOKS += VIM_REMOVE_DOCS
-- 
2.0.4
