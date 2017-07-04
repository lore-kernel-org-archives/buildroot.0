From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  4 Jul 2017 16:49:01 +0200
Subject: [Buildroot] [PATCH 081/100] vim: use the new gettext logic
In-Reply-To: <20170704144920.12318-1-thomas.petazzoni@free-electrons.com>
References: <20170704144920.12318-1-thomas.petazzoni@free-electrons.com>
Message-ID: <20170704144920.12318-82-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit switches to use the new gettext logic, which involves:

 - using TARGET_NLS_DEPENDENCIES instead of hand-encoded dependencies
   on gettext/host-gettext

 - dropping BR2_PACKAGE_GETTEXT selection

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/vim/Config.in | 1 -
 package/vim/vim.mk    | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/vim/Config.in b/package/vim/Config.in
index b851627..1469be8 100644
--- a/package/vim/Config.in
+++ b/package/vim/Config.in
@@ -4,7 +4,6 @@ config BR2_PACKAGE_VIM
 	depends on BR2_USE_WCHAR
 	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	select BR2_PACKAGE_NCURSES
-	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	help
 	  VIM Text editor
 
diff --git a/package/vim/vim.mk b/package/vim/vim.mk
index ec49460..c235a08 100644
--- a/package/vim/vim.mk
+++ b/package/vim/vim.mk
@@ -8,7 +8,7 @@ VIM_VERSION = v8.0.0329
 VIM_SITE = $(call github,vim,vim,$(VIM_VERSION))
 # Win over busybox vi since vim is more feature-rich
 VIM_DEPENDENCIES = \
-	ncurses $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext) \
+	ncurses $(TARGET_NLS_DEPENDENCIES) \
 	$(if $(BR2_PACKAGE_BUSYBOX),busybox)
 VIM_SUBDIR = src
 VIM_CONF_ENV = \
-- 
2.9.4
