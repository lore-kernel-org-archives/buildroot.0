From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 30 Jan 2011 00:40:13 +0100
Subject: [Buildroot] [git commit master 1/1] pkg-config: add --with-sysroot
	option for compiled in default sysroot setting
Message-ID: <20110129234038.9CB708E076@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=50bda85e88fa10be32733dd0334aea93519bc915
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Similar to the --with-pc-path option. It works just like the existing
PKG_CONFIG_SYSROOT_DIR environment variable, but compiled in.
The environment variable overrides this default setting if set.

This way we don't need to pass PKG_CONFIG_SYSROOT_DIR in the environment
when building for the target, and it is easier to reuse pkg-config outside
BR (E.G. for the SDK) without having to setup special environment
variables.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Makefile.in                                |    3 +-
 .../pkg-config-0.25-add-with-sysroot.patch         |   70 ++++++++++++++++++++
 package/pkg-config/pkg-config.mk                   |    3 +
 3 files changed, 74 insertions(+), 2 deletions(-)
 create mode 100644 package/pkg-config/pkg-config-0.25-add-with-sysroot.patch

diff --git a/package/Makefile.in b/package/Makefile.in
index 4e795f9..ef2c591 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -218,9 +218,7 @@ TARGET_CONFIGURE_OPTS=PATH=$(TARGET_PATH) \
 		CXXFLAGS="$(TARGET_CXXFLAGS)" \
 		LDFLAGS="$(TARGET_LDFLAGS)" \
 		FCFLAGS="$(TARGET_FCFLAGS)" \
-		PKG_CONFIG_SYSROOT_DIR="$(STAGING_DIR)" \
 		PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" \
-		PKG_CONFIG_PATH="$(STAGING_DIR)/usr/lib/pkgconfig:$(PKG_CONFIG_PATH)" \
 		PERLLIB="$(HOST_DIR)/usr/lib/perl" \
 		STAGING_DIR="$(STAGING_DIR)"
 
@@ -242,6 +240,7 @@ HOST_CONFIGURE_OPTS=PATH=$(HOST_PATH) \
 		PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1 \
 		PKG_CONFIG_ALLOW_SYSTEM_LIBS=1 \
 		PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" \
+		PKG_CONFIG_SYSROOT_DIR="/" \
 		PKG_CONFIG_LIBDIR="$(HOST_DIR)/usr/lib/pkgconfig" \
 		PERLLIB="$(HOST_DIR)/usr/lib/perl" \
 		LD_LIBRARY_PATH="$(HOST_DIR)/usr/lib:$(LD_LIBRARY_PATH)"
diff --git a/package/pkg-config/pkg-config-0.25-add-with-sysroot.patch b/package/pkg-config/pkg-config-0.25-add-with-sysroot.patch
new file mode 100644
index 0000000..0fdcd25
--- /dev/null
+++ b/package/pkg-config/pkg-config-0.25-add-with-sysroot.patch
@@ -0,0 +1,70 @@
+[PATCH] Add compiled in default sysroot
+
+Similar to the --with-pc-path option. It works just like the existing
+PKG_CONFIG_SYSROOT_DIR environment variable, but compiled in.
+The environment variable overrides this default setting if set.
+
+Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
+---
+ Makefile.am  |    6 ++++++
+ configure.in |    6 ++++++
+ main.c       |    5 +++--
+ 3 files changed, 15 insertions(+), 2 deletions(-)
+
+Index: pkg-config-0.25/Makefile.am
+===================================================================
+--- pkg-config-0.25.orig/Makefile.am
++++ pkg-config-0.25/Makefile.am
+@@ -31,6 +31,12 @@ AM_CFLAGS=@WARN_CFLAGS@
+ INCLUDES=-DPKG_CONFIG_PC_PATH="\"$(pc_path)\"" $(included_glib_includes) \
+ 	$(popt_includes)
+ 
++if USE_SYSROOT
++INCLUDES += -DPKG_CONFIG_SYSROOT="\"$(sysroot)\""
++else
++INCLUDES += -DPKG_CONFIG_SYSROOT=NULL
++endif
++
+ pkg_config_SOURCES= \
+ 	pkg.h \
+ 	pkg.c \
+Index: pkg-config-0.25/configure.in
+===================================================================
+--- pkg-config-0.25.orig/configure.in
++++ pkg-config-0.25/configure.in
+@@ -32,6 +32,12 @@ fi
+ 
+ PKG_CONFIG_FIND_PC_PATH
+ 
++AC_ARG_WITH(sysroot,
++ [  --with-sysroot         Use sysroot <dir> by default ],
++ [ sysroot="$withval" ])
++
++AC_SUBST([sysroot])
++AM_CONDITIONAL(USE_SYSROOT, test "x$sysroot" != "x")
+ #
+ # Code taken from gtk+-2.0's configure.in.
+ #
+Index: pkg-config-0.25/main.c
+===================================================================
+--- pkg-config-0.25.orig/main.c
++++ pkg-config-0.25/main.c
+@@ -39,7 +39,7 @@
+ static int want_debug_spew = 0;
+ static int want_verbose_errors = 0;
+ static int want_stdout_errors = 0;
+-char *pcsysrootdir = NULL;
++char *pcsysrootdir = PKG_CONFIG_SYSROOT;
+ 
+ void
+ debug_spew (const char *format, ...)
+@@ -311,7 +311,8 @@ main (int argc, char **argv)
+       add_search_dirs(PKG_CONFIG_PC_PATH, G_SEARCHPATH_SEPARATOR_S);
+     }
+ 
+-  pcsysrootdir = getenv ("PKG_CONFIG_SYSROOT_DIR");
++  if (getenv ("PKG_CONFIG_SYSROOT_DIR"))
++	  pcsysrootdir = getenv ("PKG_CONFIG_SYSROOT_DIR");
+   if (pcsysrootdir)
+     {
+       define_global_variable ("pc_sysrootdir", pcsysrootdir);
diff --git a/package/pkg-config/pkg-config.mk b/package/pkg-config/pkg-config.mk
index 413853d..bb52db8 100644
--- a/package/pkg-config/pkg-config.mk
+++ b/package/pkg-config/pkg-config.mk
@@ -13,8 +13,11 @@ PKG_CONFIG_CONF_OPT = --with-installed-glib
 
 HOST_PKG_CONFIG_CONF_OPT = \
 		--with-pc-path="$(STAGING_DIR)/usr/lib/pkgconfig" \
+		--with-sysroot="$(STAGING_DIR)" \
 		--disable-static
 
+HOST_PKG_CONFIG_AUTORECONF = YES
+
 $(eval $(call AUTOTARGETS,package,pkg-config))
 $(eval $(call AUTOTARGETS,package,pkg-config,host))
 
-- 
1.7.3.4
