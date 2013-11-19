From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 19 Nov 2013 12:15:50 +0100
Subject: [Buildroot] [PATCH 2 of 2 for-2013.11] vim: add dependency to
 gettext if locale support is requested
In-Reply-To: <patchbomb.1384859748@argentina>
References: <patchbomb.1384859748@argentina>
Message-ID: <d39e6b9c7e577930b1c9.1384859750@argentina>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Until now, if locale support was requested, vim would be built with NLS or
not depending on the build order. This patch now makes the dependency
explicit.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 package/vim/Config.in |  1 +
 package/vim/vim.mk    |  2 +-
 2 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/vim/Config.in b/package/vim/Config.in
--- a/package/vim/Config.in
+++ b/package/vim/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_VIM
 	bool "vim"
 	depends on BR2_USE_MMU # uses fork()
 	select BR2_PACKAGE_NCURSES
+	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	help
 	  VIM Text editor
 
diff --git a/package/vim/vim.mk b/package/vim/vim.mk
--- a/package/vim/vim.mk
+++ b/package/vim/vim.mk
@@ -8,7 +8,7 @@ VIM_SITE = https://vim.googlecode.com/hg
 VIM_SITE_METHOD = hg
 # 7.3 release patchlevel 762
 VIM_VERSION = 699f8d8f096d
-VIM_DEPENDENCIES = ncurses
+VIM_DEPENDENCIES = ncurses $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext)
 VIM_SUBDIR = src
 VIM_CONF_ENV = vim_cv_toupper_broken=no \
 		vim_cv_terminfo=yes \
