From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu,  5 Dec 2013 09:05:56 -0300
Subject: [Buildroot] [PATCH] pkg-config: remove deprecated
Message-ID: <1386245156-21088-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/Config.in                                  |  1 -
 package/pkg-config/Config.in                       | 19 --------------
 .../pkg-config/pkg-config-0.25-fix-variable.patch  | 30 ----------------------
 package/pkg-config/pkg-config.mk                   | 12 ---------
 4 files changed, 62 deletions(-)
 delete mode 100644 package/pkg-config/Config.in
 delete mode 100644 package/pkg-config/pkg-config-0.25-fix-variable.patch
 delete mode 100644 package/pkg-config/pkg-config.mk

diff --git a/package/Config.in b/package/Config.in
index 29786d0..3c98c50 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -112,7 +112,6 @@ source "package/make/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/patch/Config.in"
 endif
-source "package/pkg-config/Config.in"
 source "package/pkgconf/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/sed/Config.in"
diff --git a/package/pkg-config/Config.in b/package/pkg-config/Config.in
deleted file mode 100644
index 52c0c32..0000000
--- a/package/pkg-config/Config.in
+++ /dev/null
@@ -1,19 +0,0 @@
-config BR2_PACKAGE_PKG_CONFIG
-	bool "pkg-config"
-	depends on BR2_USE_WCHAR # glib2
-	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
-	depends on BR2_USE_MMU # glib2
-	depends on BR2_DEPRECATED
-	select BR2_PACKAGE_LIBGLIB2
-	help
-	  pkg-config is a system for managing library compile/link
-	  flags that works with automake and autoconf. It replaces
-	  the ubiquitous *-config scripts you may have seen with a
-	  single tool.
-
-	  http://www.freedesktop.org/software/pkgconfig/
-
-comment "pkg-config needs a toolchain w/ wchar, threads"
-	depends on BR2_DEPRECATED
-	depends on BR2_USE_MMU
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/pkg-config/pkg-config-0.25-fix-variable.patch b/package/pkg-config/pkg-config-0.25-fix-variable.patch
deleted file mode 100644
index 13a2b91..0000000
--- a/package/pkg-config/pkg-config-0.25-fix-variable.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-[PATCH] prefix sysroot to include/libdir path variables
-
-Prefix includedir / libdir variable values with sysroot if a variable is
-requested (--variable=<name>), similar to how it's done for -I / -L flags.
-
-This is sometimes used to find header files (E.G. in gst-plugins configure),
-so ensure the sysroot'ed files are used.
-
-Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
----
- main.c |    6 +++++
- 1 file changed, 6 insertions(+)
-
-Index: pkg-config-0.25/main.c
-===================================================================
---- pkg-config-0.25.orig/main.c
-+++ pkg-config-0.25/main.c
-@@ -700,6 +700,12 @@
-   if (variable_name)
-     {
-       char *str = packages_get_var (packages, variable_name);
-+      /* include/lib variable? */
-+      if (pcsysrootdir &&
-+          (!strcmp(variable_name, "includedir") ||
-+           !strcmp(variable_name, "mapdir") ||
-+           !strcmp(variable_name, "libdir")))
-+          printf ("%s/", pcsysrootdir);
-       printf ("%s", str);
-       g_free (str);
-       need_newline = TRUE;
diff --git a/package/pkg-config/pkg-config.mk b/package/pkg-config/pkg-config.mk
deleted file mode 100644
index a80d7cb..0000000
--- a/package/pkg-config/pkg-config.mk
+++ /dev/null
@@ -1,12 +0,0 @@
-################################################################################
-#
-# pkg-config
-#
-################################################################################
-
-PKG_CONFIG_VERSION = 0.25
-PKG_CONFIG_SITE = http://pkgconfig.freedesktop.org/releases/
-PKG_CONFIG_DEPENDENCIES = libglib2
-PKG_CONFIG_CONF_OPT = --with-installed-glib
-
-$(eval $(autotools-package))
-- 
1.8.3.2
