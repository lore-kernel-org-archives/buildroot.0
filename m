From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 26 Sep 2012 07:48:41 -0300
Subject: [Buildroot] [PATCHv2 3/4] pkg-config: remove package
In-Reply-To: <1348656522-13698-1-git-send-email-gustavo@zacarias.com.ar>
References: <1348656522-13698-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1348656522-13698-3-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/Config.in                                  |    1 -
 package/pkg-config/Config.in                       |   14 ----
 .../pkg-config-0.25-add-with-sysroot.patch         |   78 --------------------
 .../pkg-config/pkg-config-0.25-fix-variable.patch  |   30 --------
 package/pkg-config/pkg-config.mk                   |   25 ------
 5 files changed, 0 insertions(+), 148 deletions(-)
 delete mode 100644 package/pkg-config/Config.in
 delete mode 100644 package/pkg-config/pkg-config-0.25-add-with-sysroot.patch
 delete mode 100644 package/pkg-config/pkg-config-0.25-fix-variable.patch
 delete mode 100644 package/pkg-config/pkg-config.mk

diff --git a/package/Config.in b/package/Config.in
index 0c17918..5c5acfe 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -83,7 +83,6 @@ source "package/m4/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/patch/Config.in"
 endif
-source "package/pkg-config/Config.in"
 source "package/pkgconf/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/sed/Config.in"
diff --git a/package/pkg-config/Config.in b/package/pkg-config/Config.in
deleted file mode 100644
index eae0a21..0000000
--- a/package/pkg-config/Config.in
+++ /dev/null
@@ -1,14 +0,0 @@
-config BR2_PACKAGE_PKG_CONFIG
-	bool "pkg-config"
-	depends on BR2_USE_WCHAR # glib2
-	select BR2_PACKAGE_LIBGLIB2
-	help
-	  pkg-config is a system for managing library compile/link
-	  flags that works with automake and autoconf. It replaces
-	  the ubiquitous *-config scripts you may have seen with a
-	  single tool.
-
-	  http://www.freedesktop.org/software/pkgconfig/
-
-comment "pkg-config requires a toolchain with WCHAR support"
-	depends on !BR2_USE_WCHAR
diff --git a/package/pkg-config/pkg-config-0.25-add-with-sysroot.patch b/package/pkg-config/pkg-config-0.25-add-with-sysroot.patch
deleted file mode 100644
index e8431ed..0000000
--- a/package/pkg-config/pkg-config-0.25-add-with-sysroot.patch
+++ /dev/null
@@ -1,78 +0,0 @@
-[PATCH] Add compiled in default sysroot
-
-Similar to the --with-pc-path option. It works just like the existing
-PKG_CONFIG_SYSROOT_DIR environment variable, but compiled in.
-The environment variable overrides this default setting if set.
-
-Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
----
- Makefile.am  |    6 +++++-
- configure.in |    6 ++++++
- main.c       |    9 +++++++--
- 3 files changed, 18 insertions(+), 3 deletions(-)
-
-Index: pkg-config-0.25/Makefile.am
-===================================================================
---- pkg-config-0.25.orig/Makefile.am
-+++ pkg-config-0.25/Makefile.am
-@@ -28,8 +28,12 @@ EXTRA_DIST = $(m4_DATA) $(man_MANS) READ
- bin_PROGRAMS = pkg-config
- AM_CFLAGS=@WARN_CFLAGS@
- 
-+if USE_SYSROOT
-+sysroot_includes = -DPKG_CONFIG_SYSROOT="\"$(sysroot)\""
-+endif
-+
- INCLUDES=-DPKG_CONFIG_PC_PATH="\"$(pc_path)\"" $(included_glib_includes) \
--	$(popt_includes)
-+	$(popt_includes) $(sysroot_includes)
- 
- pkg_config_SOURCES= \
- 	pkg.h \
-Index: pkg-config-0.25/configure.in
-===================================================================
---- pkg-config-0.25.orig/configure.in
-+++ pkg-config-0.25/configure.in
-@@ -32,6 +32,12 @@ fi
- 
- PKG_CONFIG_FIND_PC_PATH
- 
-+AC_ARG_WITH(sysroot,
-+ [  --with-sysroot         Use sysroot <dir> by default ],
-+ [ sysroot="$withval" ])
-+
-+AC_SUBST([sysroot])
-+AM_CONDITIONAL(USE_SYSROOT, test "x$sysroot" != "x")
- #
- # Code taken from gtk+-2.0's configure.in.
- #
-Index: pkg-config-0.25/main.c
-===================================================================
---- pkg-config-0.25.orig/main.c
-+++ pkg-config-0.25/main.c
-@@ -36,10 +36,14 @@
- #undef STRICT
- #endif
- 
-+#ifndef PKG_CONFIG_SYSROOT
-+#define PKG_CONFIG_SYSROOT NULL
-+#endif
-+
- static int want_debug_spew = 0;
- static int want_verbose_errors = 0;
- static int want_stdout_errors = 0;
--char *pcsysrootdir = NULL;
-+char *pcsysrootdir = PKG_CONFIG_SYSROOT;
- 
- void
- debug_spew (const char *format, ...)
-@@ -311,7 +315,8 @@ main (int argc, char **argv)
-       add_search_dirs(PKG_CONFIG_PC_PATH, G_SEARCHPATH_SEPARATOR_S);
-     }
- 
--  pcsysrootdir = getenv ("PKG_CONFIG_SYSROOT_DIR");
-+  if (getenv ("PKG_CONFIG_SYSROOT_DIR"))
-+	  pcsysrootdir = getenv ("PKG_CONFIG_SYSROOT_DIR");
-   if (pcsysrootdir)
-     {
-       define_global_variable ("pc_sysrootdir", pcsysrootdir);
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
index 7440ac4..0000000
--- a/package/pkg-config/pkg-config.mk
+++ /dev/null
@@ -1,25 +0,0 @@
-#############################################################
-#
-# pkgconfig
-#
-#############################################################
-PKG_CONFIG_VERSION = 0.25
-PKG_CONFIG_SOURCE = pkg-config-$(PKG_CONFIG_VERSION).tar.gz
-PKG_CONFIG_SITE = http://pkgconfig.freedesktop.org/releases/
-
-PKG_CONFIG_DEPENDENCIES = libglib2
-
-PKG_CONFIG_CONF_OPT = --with-installed-glib
-
-HOST_PKG_CONFIG_CONF_OPT = \
-		--with-pc-path="$(STAGING_DIR)/usr/lib/pkgconfig:$(STAGING_DIR)/usr/share/pkgconfig" \
-		--with-sysroot="$(STAGING_DIR)" \
-		--disable-static
-
-HOST_PKG_CONFIG_AUTORECONF = YES
-HOST_PKG_CONFIG_DEPENDENCIES =
-
-$(eval $(autotools-package))
-$(eval $(host-autotools-package))
-
-PKG_CONFIG_HOST_BINARY:=$(HOST_DIR)/usr/bin/pkg-config
-- 
1.7.8.6
