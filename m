From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 9 Apr 2014 00:57:19 +0200
Subject: [Buildroot] [git commit] tcl: bump to version 8.6.1
Message-ID: <20140408230233.05C929C69E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7fda943b435d0ad64125d004aae82c6ee4d821da
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Turn off building compatibility layers for old/broken versions of
standard functions (strstr, strtoul, strtod) with the assumption that
anything buildroot is using as a standard C library will be good enough
to not have broken behavior.

Signed-off-by: Andrew Ruder <andrew.ruder@elecsyscorp.com>
Cc: Peter Korsgaard <jacmet@uclibc.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tcl/Config.in                        |   13 +++++--
 package/tcl/tcl-0001-dont-build-compat.patch |   32 ++++++++++++++++
 package/tcl/tcl-8.4.19-strtod.patch          |   11 ------
 package/tcl/tcl.mk                           |   50 ++++++++++++++++++++++----
 package/tcllib/tcllib.mk                     |    2 +-
 5 files changed, 86 insertions(+), 22 deletions(-)

diff --git a/package/tcl/Config.in b/package/tcl/Config.in
index 5dcf63d..db41d65 100644
--- a/package/tcl/Config.in
+++ b/package/tcl/Config.in
@@ -1,28 +1,35 @@
 config BR2_PACKAGE_TCL
 	bool "tcl"
+	# fork()
+	depends on BR2_USE_MMU
+	depends on BR2_INET_IPV6
 	help
 	  TCL (Tool Command Language) is a simple textual language.
 
 	  http://www.tcl.tk
 
+comment "tcl needs a toolchain w/ ipv6"
+	depends on BR2_USE_MMU
+	depends on !BR2_INET_IPV6
+
 if BR2_PACKAGE_TCL
 
 config BR2_PACKAGE_TCL_DEL_ENCODINGS
-	bool "delete encodings (saves 1.4Mb)"
+	bool "delete encodings (saves 1.6Mb)"
 	default y
 	help
 	  Delete encoding files for TCL. If your programs do not use
 	  various tcl character recoding functions, you may safely
 	  choose Y here.
 
-	  It saves approx. 1.4 Mb of space.
+	  It saves approx. 1.6 Mb of space.
 
 config BR2_PACKAGE_TCL_SHLIB_ONLY
 	bool "install only shared library"
 	default y
 	help
 	  Install only TCL shared library and not binary tcl
-	  interpreter(tclsh8.4).
+	  interpreter (tclsh).
 
 	  Saves ~14kb.
 
diff --git a/package/tcl/tcl-0001-dont-build-compat.patch b/package/tcl/tcl-0001-dont-build-compat.patch
new file mode 100644
index 0000000..85c5c57
--- /dev/null
+++ b/package/tcl/tcl-0001-dont-build-compat.patch
@@ -0,0 +1,32 @@
+From: Andrew Ruder <andrew.ruder@elecsyscorp.com>
+Subject: [PATCH] Disable tcl compatibility layers
+
+Turn off building compatibility layers for old/broken versions of
+standard functions (strstr, strtoul, strtod) with the assumption that
+anything buildroot is using as a standard C library will be good enough
+to not have broken behavior.
+
+Signed-off-by: Andrew Ruder <andrew.ruder@elecsyscorp.com>
+---
+
+diff --git a/unix/tcl.m4 b/unix/tcl.m4
+--- a/unix/tcl.m4
++++ b/unix/tcl.m4
+@@ -2466,7 +2466,7 @@ AC_DEFUN([SC_BUGGY_STRTOD], [
+ 		    }
+ 		    exit(0);
+ 		}], tcl_cv_strtod_buggy=ok, tcl_cv_strtod_buggy=buggy,
+-		    tcl_cv_strtod_buggy=buggy)])
++		    tcl_cv_strtod_buggy=ok)])
+ 	if test "$tcl_cv_strtod_buggy" = buggy; then
+ 	    AC_LIBOBJ([fixstrtod])
+ 	    USE_COMPAT=1
+@@ -2725,7 +2725,7 @@ AC_DEFUN([SC_TCL_CHECK_BROKEN_FUNC],[
+     if test ["$tcl_ok"] = 1; then
+ 	AC_CACHE_CHECK([proper ]$1[ implementation], [tcl_cv_]$1[_unbroken],
+ 	    AC_TRY_RUN([[int main() {]$2[}]],[tcl_cv_]$1[_unbroken]=ok,
+-		[tcl_cv_]$1[_unbroken]=broken,[tcl_cv_]$1[_unbroken]=unknown))
++		[tcl_cv_]$1[_unbroken]=broken,[tcl_cv_]$1[_unbroken]=ok))
+ 	if test ["$tcl_cv_]$1[_unbroken"] = "ok"; then
+ 	    tcl_ok=1
+ 	else
diff --git a/package/tcl/tcl-8.4.19-strtod.patch b/package/tcl/tcl-8.4.19-strtod.patch
deleted file mode 100644
index a997454..0000000
--- a/package/tcl/tcl-8.4.19-strtod.patch
+++ /dev/null
@@ -1,11 +0,0 @@
---- tcl8.4.9/compat/strtod.c	2002-02-25 16:26:12.000000000 +0200
-+++ tcl8.4.9/compat/strtod.c	2005-05-30 08:55:18.000000000 +0300
-@@ -24,6 +24,8 @@
- #define NULL 0
- #endif
- 
-+#undef strtod
-+
- static int maxExponent = 511;	/* Largest possible base 10 exponent.  Any
- 				 * exponent larger than this will already
- 				 * produce underflow or overflow, so there's
diff --git a/package/tcl/tcl.mk b/package/tcl/tcl.mk
index 4647f03..efb2ec8 100644
--- a/package/tcl/tcl.mk
+++ b/package/tcl/tcl.mk
@@ -4,24 +4,52 @@
 #
 ################################################################################
 
-TCL_VERSION_MAJOR = 8.4
-TCL_VERSION = $(TCL_VERSION_MAJOR).19
+TCL_VERSION_MAJOR = 8.6
+TCL_VERSION = $(TCL_VERSION_MAJOR).1
 TCL_SOURCE = tcl$(TCL_VERSION)-src.tar.gz
 TCL_SITE = http://downloads.sourceforge.net/project/tcl/Tcl/$(TCL_VERSION)
 TCL_LICENSE = tcl license
 TCL_LICENSE_FILES = license.terms
 TCL_SUBDIR = unix
 TCL_INSTALL_STAGING = YES
+TCL_AUTORECONF = YES
+
+# Note that --with-system-sqlite will only make a difference
+# in the sqlite package (which gets removed if sqlite not
+# configured).  Don't need to worry about conditionally including
+# it in the configure options
 TCL_CONF_OPT = \
 		--disable-symbols \
 		--disable-langinfo \
-		--disable-framework
+		--disable-framework \
+		--with-system-sqlite
 
 HOST_TCL_CONF_OPT = \
 		--disable-symbols \
 		--disable-langinfo \
 		--disable-framework
 
+# I haven't found a good way to force pkgs to not build
+# or configure without just removing the entire pkg directory.
+define HOST_TCL_REMOVE_PACKAGES
+	rm -fr $(@D)/pkgs/sqlite3.8.0 \
+	       $(@D)/pkgs/tdbc1.0.0 \
+	       $(@D)/pkgs/tdbcmysql1.0.0 \
+	       $(@D)/pkgs/tdbcodbc1.0.0 \
+	       $(@D)/pkgs/tdbcpostgres1.0.0 \
+	       $(@D)/pkgs/tdbcsqlite3-1.0.0
+endef
+HOST_TCL_PRE_CONFIGURE_HOOKS += HOST_TCL_REMOVE_PACKAGES
+define TCL_REMOVE_PACKAGES
+	rm -fr $(if $(BR2_PACKAGE_SQLITE),,$(@D)/pkgs/sqlite3.8.0) \
+	       $(if $(BR2_PACKAGE_SQLITE),,$(@D)/pkgs/tdbc1.0.0) \
+	       $(@D)/pkgs/tdbcmysql1.0.0 \
+	       $(@D)/pkgs/tdbcodbc1.0.0 \
+	       $(@D)/pkgs/tdbcpostgres1.0.0 \
+	       $(if $(BR2_PACKAGE_SQLITE),,$(@D)/pkgs/tdbcsqlite3-1.0.0)
+endef
+TCL_PRE_CONFIGURE_HOOKS += TCL_REMOVE_PACKAGES
+
 ifeq ($(BR2_PACKAGE_TCL_DEL_ENCODINGS),y)
 define TCL_REMOVE_ENCODINGS
 	rm -rf $(TARGET_DIR)/usr/lib/tcl$(TCL_VERSION_MAJOR)/encoding/*
@@ -41,12 +69,20 @@ endef
 TCL_POST_INSTALL_TARGET_HOOKS += TCL_SYMLINK_TCLSH
 endif
 
-# library get installed read only, so strip fails
-define TCL_FIXUP_RO_LIB
-	chmod +w $(TARGET_DIR)/usr/lib/libtcl*
+# Until someone needs it, we don't handle locale installation.  tcl has
+# a complicated method of translating LANG-style locale names into its internal
+# .msg name which makes it difficult to save the correct locales per the
+# configured whitelist.
+define TCL_REMOVE_EXTRA
+	rm -fr $(TARGET_DIR)/usr/lib/tclConfig.sh \
+	       $(TARGET_DIR)/usr/lib/tclooConfig.sh \
+	       $(TARGET_DIR)/usr/lib/tcl$(TCL_VERSION_MAJOR)/tclAppInit.c \
+	       $(TARGET_DIR)/usr/lib/tcl$(TCL_VERSION_MAJOR)/msgs
 endef
+TCL_POST_INSTALL_TARGET_HOOKS += TCL_REMOVE_EXTRA
 
-TCL_POST_INSTALL_TARGET_HOOKS += TCL_FIXUP_RO_LIB
+TCL_DEPENDENCIES = $(if $(BR2_PACKAGE_SQLITE),sqlite)
+HOST_TCL_DEPENDENCIES =
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/package/tcllib/tcllib.mk b/package/tcllib/tcllib.mk
index f2aca36..037ec1c 100644
--- a/package/tcllib/tcllib.mk
+++ b/package/tcllib/tcllib.mk
@@ -10,6 +10,6 @@ TCLLIB_SITE          = http://downloads.sourceforge.net/project/tcllib/tcllib/$(
 TCLLIB_LICENSE       = tcl license
 TCLLIB_LICENSE_FILES = license.terms
 TCLLIB_DEPENDENCIES  = host-tcl
-TCLLIB_CONF_ENV      = ac_cv_path_tclsh="$(HOST_DIR)/usr/bin/tclsh8.4"
+TCLLIB_CONF_ENV      = ac_cv_path_tclsh="$(HOST_DIR)/usr/bin/tclsh$(TCL_VERSION_MAJOR)"
 
 $(eval $(autotools-package))
