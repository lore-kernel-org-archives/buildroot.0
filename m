From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 29 Oct 2012 22:03:52 +0100
Subject: [Buildroot] [git commit] pkg-config: remove host variant
Message-ID: <20121029211341.BEF609998B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=703d5943f403f779a8ad44afe83d794c2a392d34
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove host-pkg-config in favour of host-pkgconf.
Also remove the sysroot support patch since it's only intended for the
host variant.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../pkg-config-0.25-add-with-sysroot.patch         |   78 --------------------
 package/pkg-config/pkg-config.mk                   |   14 +---
 2 files changed, 1 insertions(+), 91 deletions(-)

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
diff --git a/package/pkg-config/pkg-config.mk b/package/pkg-config/pkg-config.mk
index 7440ac4..6c5e135 100644
--- a/package/pkg-config/pkg-config.mk
+++ b/package/pkg-config/pkg-config.mk
@@ -3,23 +3,11 @@
 # pkgconfig
 #
 #############################################################
+
 PKG_CONFIG_VERSION = 0.25
 PKG_CONFIG_SOURCE = pkg-config-$(PKG_CONFIG_VERSION).tar.gz
 PKG_CONFIG_SITE = http://pkgconfig.freedesktop.org/releases/
-
 PKG_CONFIG_DEPENDENCIES = libglib2
-
 PKG_CONFIG_CONF_OPT = --with-installed-glib
 
-HOST_PKG_CONFIG_CONF_OPT = \
-		--with-pc-path="$(STAGING_DIR)/usr/lib/pkgconfig:$(STAGING_DIR)/usr/share/pkgconfig" \
-		--with-sysroot="$(STAGING_DIR)" \
-		--disable-static
-
-HOST_PKG_CONFIG_AUTORECONF = YES
-HOST_PKG_CONFIG_DEPENDENCIES =
-
 $(eval $(autotools-package))
-$(eval $(host-autotools-package))
-
-PKG_CONFIG_HOST_BINARY:=$(HOST_DIR)/usr/bin/pkg-config
