From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 21 Nov 2014 12:02:18 +0000
Subject: [Buildroot] [PATCH 2/4] menu-cache: new package
In-Reply-To: <1416571340-3550-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1416571340-3550-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <1416571340-3550-3-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/Config.in                  |    1 +
 package/menu-cache/Config.in       |   17 +++++++++++++++++
 package/menu-cache/menu-cache.hash |    2 ++
 package/menu-cache/menu-cache.mk   |   17 +++++++++++++++++
 4 files changed, 37 insertions(+), 0 deletions(-)
 create mode 100644 package/menu-cache/Config.in
 create mode 100644 package/menu-cache/menu-cache.hash
 create mode 100644 package/menu-cache/menu-cache.mk

diff --git a/package/Config.in b/package/Config.in
index 7b544cd..56b71e4 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -662,6 +662,7 @@ menu "Graphics"
 	source "package/libungif/Config.in"
 	source "package/libva/Config.in"
 	source "package/libva-intel-driver/Config.in"
+	source "package/menu-cache/Config.in"
 	source "package/opencv/Config.in"
 	source "package/opengl/Config.in"
 	source "package/pango/Config.in"
diff --git a/package/menu-cache/Config.in b/package/menu-cache/Config.in
new file mode 100644
index 0000000..94ce73c
--- /dev/null
+++ b/package/menu-cache/Config.in
@@ -0,0 +1,17 @@
+config BR2_PACKAGE_MENU_CACHE
+	bool "menu-cache"
+	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT
+	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
+	select BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_LIBFM_EXTRA
+	depends on BR2_USE_WCHAR # libglib2, gettext
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
+	depends on BR2_USE_MMU # libglib2
+	help
+	  Small library from LXDE project used for application menu integration
+
+	  http://wiki.lxde.org/
+
+comment "menu-cache needs a toolchain w/ wchar, threads"
+	depends on BR2_USE_MMU
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/menu-cache/menu-cache.hash b/package/menu-cache/menu-cache.hash
new file mode 100644
index 0000000..3b9e5c4
--- /dev/null
+++ b/package/menu-cache/menu-cache.hash
@@ -0,0 +1,2 @@
+# From http://blog.lxde.org/?p=1299
+sha1  e7b3854109f9826472cf9795e924acebe5e27861  menu-cache-1.0.0.tar.xz
diff --git a/package/menu-cache/menu-cache.mk b/package/menu-cache/menu-cache.mk
new file mode 100644
index 0000000..a8ff21b
--- /dev/null
+++ b/package/menu-cache/menu-cache.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# menu-cache
+#
+################################################################################
+
+MENU_CACHE_VERSION_MAJOR = 1.0
+MENU_CACHE_VERSION_MINOR = 0
+MENU_CACHE_VERSION = $(MENU_CACHE_VERSION_MAJOR).$(MENU_CACHE_VERSION_MINOR)
+MENU_CACHE_SOURCE = menu-cache-$(MENU_CACHE_VERSION).tar.xz
+MENU_CACHE_SITE = http://sourceforge.net/projects/lxde/files/menu-cache/$(MENU_CACHE_VERSION_MAJOR)
+MENU_CACHE_DEPENDENCIES = libfm-extra libglib2
+MENU_CACHE_LICENSE = LGPLv2.1
+MENU_CACHE_LICENSE_FILES = COPYING
+MENU_CACHE_INSTALL_STAGING = YES
+
+$(eval $(autotools-package))
-- 
1.7.1
