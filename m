From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 8 Feb 2014 23:29:11 +0100
Subject: [Buildroot] [git commit] automake: remove deprecated target package
Message-ID: <20140208224725.458D79C901@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f75245d9d0f291dc040162ec759ac88e206a69c6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The automake support on target has been deprecated for more than four
buildroot releases and thus can be removed. This doesn't change anything
about the host automake support.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in.legacy             |    8 ++++++++
 package/Config.in            |    1 -
 package/automake/Config.in   |   11 -----------
 package/automake/automake.mk |    3 ---
 4 files changed, 8 insertions(+), 15 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index ef81da3..8199441 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -119,6 +119,14 @@ config BR2_sh3eb
 	  Due to an inexistent user base and generally poor Linux
 	  support, the support for the SH3eb architecture was removed.
 
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
index d3896e4..2d74cf2 100644
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
index ed5060e..0000000
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
index fc661c1..8d7e291 100644
--- a/package/automake/automake.mk
+++ b/package/automake/automake.mk
@@ -10,8 +10,6 @@ AUTOMAKE_SITE = $(BR2_GNU_MIRROR)/automake
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
