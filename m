From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 05 Feb 2014 11:50:08 +0100
Subject: [Buildroot] [PATCH 2 of 7] autoconf: remove deprecated target
	package
In-Reply-To: <patchbomb.1391597406@argentina>
References: <patchbomb.1391597406@argentina>
Message-ID: <9da33a429263592d79db.1391597408@argentina>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The autoconf support on target has been deprecated for more than four
buildroot releases and thus can be removed. This doesn't change anything
about the host autoconf support.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 Config.in.legacy             |   8 ++++++++
 package/Config.in            |   1 -
 package/autoconf/Config.in   |  10 ----------
 package/autoconf/autoconf.mk |   6 ------
 4 files changed, 8 insertions(+), 17 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -101,6 +101,14 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2014.02"
 
+config BR2_PACKAGE_AUTOCONF
+	bool "autoconf target package has been removed"
+	select BR2_LEGACY
+	help
+	  The 'autoconf' target package has been removed since it has been
+	  deprecated for more than four buildroot releases.
+	  Note: the host autoconf still exists.
+
 config BR2_PACKAGE_XSTROKE
 	bool "xstroke has been removed"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
--- a/package/Config.in
+++ b/package/Config.in
@@ -81,7 +81,6 @@ source "package/whetstone/Config.in"
 endmenu
 
 menu "Development tools"
-source "package/autoconf/Config.in"
 source "package/automake/Config.in"
 source "package/binutils/Config.in"
 source "package/bison/Config.in"
diff --git a/package/autoconf/Config.in b/package/autoconf/Config.in
deleted file mode 100644
--- a/package/autoconf/Config.in
+++ /dev/null
@@ -1,10 +0,0 @@
-config BR2_PACKAGE_AUTOCONF
-	bool "autoconf"
-	# We no longer support a toolchain on the target
-	depends on BR2_DEPRECATED_SINCE_2012_11
-	select BR2_PACKAGE_PERL
-	help
-	  Extensible program for developing configure scripts.  These
-	  scripts handle all the mundane system/feature detection.
-
-	  http://www.gnu.org/software/autoconf/
diff --git a/package/autoconf/autoconf.mk b/package/autoconf/autoconf.mk
--- a/package/autoconf/autoconf.mk
+++ b/package/autoconf/autoconf.mk
@@ -11,17 +11,11 @@ AUTOCONF_SITE = $(BR2_GNU_MIRROR)/autoco
 AUTOCONF_LICENSE = GPLv3+ with exceptions
 AUTOCONF_LICENSE_FILES = COPYINGv3 COPYING.EXCEPTION
 
-AUTOCONF_CONF_ENV = EMACS="no" ac_cv_path_M4=$(HOST_DIR)/usr/bin/m4 \
-		    ac_cv_prog_gnu_m4_gnu=no
-
-AUTOCONF_DEPENDENCIES = host-m4 perl
-
 HOST_AUTOCONF_CONF_ENV = EMACS="no" ac_cv_path_M4=$(HOST_DIR)/usr/bin/m4 \
 			ac_cv_prog_gnu_m4_gnu=no
 
 HOST_AUTOCONF_DEPENDENCIES = host-m4 host-libtool
 
-$(eval $(autotools-package))
 $(eval $(host-autotools-package))
 
 # variables used by other packages
