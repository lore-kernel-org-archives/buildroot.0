From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 05 Feb 2014 11:50:09 +0100
Subject: [Buildroot] [PATCH 3 of 7] automake: remove deprecated target
	package
In-Reply-To: <patchbomb.1391597406@argentina>
References: <patchbomb.1391597406@argentina>
Message-ID: <1c7599aa01888799e802.1391597409@argentina>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The automake support on target has been deprecated for more than four
buildroot releases and thus can be removed. This doesn't change anything
about the host automake support.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 Config.in.legacy             |   8 ++++++++
 package/Config.in            |   1 -
 package/automake/Config.in   |  11 -----------
 package/automake/automake.mk |   3 ---
 4 files changed, 8 insertions(+), 15 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -101,6 +101,14 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2014.02"
 
+config BR2_PACKAGE_AUTOMAKE
+	bool "automake target package has been removed"
+	select BR2_LEGACY
+	help
+	  The 'automake' target package has been removed since it has been
+	  deprecated for more than four buildroot releases.
+	  Note: the host automake still exists.
+
 config BR2_PACKAGE_AUTOCONF
 	bool "autoconf target package has been removed"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
--- a/package/Config.in
+++ b/package/Config.in
@@ -81,7 +81,6 @@ source "package/whetstone/Config.in"
 endmenu
 
 menu "Development tools"
-source "package/automake/Config.in"
 source "package/binutils/Config.in"
 source "package/bison/Config.in"
 source "package/bsdiff/Config.in"
diff --git a/package/automake/Config.in b/package/automake/Config.in
deleted file mode 100644
--- a/package/automake/Config.in
+++ /dev/null
@@ -1,11 +0,0 @@
-config BR2_PACKAGE_AUTOMAKE
-	bool "automake"
-	# We no longer support a toolchain on the target
-	depends on BR2_DEPRECATED_SINCE_2012_11
-	select BR2_PACKAGE_AUTOCONF
-	select BR2_PACKAGE_PERL
-	help
-	  Tool for automatically generating Makefile's for input to
-	  configure scripts (made by autoconf).
-
-	  http://www.gnu.org/software/automake/
diff --git a/package/automake/automake.mk b/package/automake/automake.mk
--- a/package/automake/automake.mk
+++ b/package/automake/automake.mk
@@ -10,8 +10,6 @@ AUTOMAKE_SITE = $(BR2_GNU_MIRROR)/automa
 AUTOMAKE_LICENSE = GPLv2+
 AUTOMAKE_LICENSE_FILES = COPYING
 
-AUTOMAKE_DEPENDENCIES = host-autoconf autoconf perl
-
 HOST_AUTOMAKE_DEPENDENCIES = host-autoconf
 
 define GTK_DOC_M4_INSTALL
@@ -26,7 +24,6 @@ endef
 HOST_AUTOMAKE_POST_INSTALL_HOOKS += GTK_DOC_M4_INSTALL
 HOST_AUTOMAKE_POST_INSTALL_HOOKS += HOST_AUTOMAKE_MAKE_ACLOCAL
 
-$(eval $(autotools-package))
 $(eval $(host-autotools-package))
 
 # variables used by other packages
