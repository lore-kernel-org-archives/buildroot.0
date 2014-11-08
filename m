From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 8 Nov 2014 17:35:32 +0100
Subject: [Buildroot] [git commit] vim: install vi symlink
Message-ID: <20141108171552.EB0F7B2F40@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=124edd4d5f4cddbd40a1113dccc255c5956bd9ae
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Install a 'vi' symlink to win over busybox vi (more features) and in
case busybox isn't around, for people expecting plain simple 'vi' to
call the editor.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/vim/vim.mk |   10 +++++++++-
 1 files changed, 9 insertions(+), 1 deletions(-)

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
