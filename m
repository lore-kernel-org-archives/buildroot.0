From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Jan 2015 00:15:45 +0100
Subject: [Buildroot] [git commit] bison: remove deprecated target package
Message-ID: <20150125233550.96FB17FF09@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=38dabc6e9b4b67e33b3b1ec3def7d8366096136a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It's been deprecated for a year now so remove the target variant.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in.legacy        |    8 ++++++++
 package/Config.in       |    1 -
 package/bison/Config.in |   19 -------------------
 package/bison/bison.mk  |    9 ---------
 4 files changed, 8 insertions(+), 29 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 50591af..243416e 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -102,6 +102,14 @@ endif
 
 comment "Legacy options removed in 2015.02"
 
+config BR2_PACKAGE_BISON
+	bool "bison target package removed"
+	select BR2_LEGACY
+	help
+	  The bison target package has been removed, it's been
+	  deprecated for some time now and is essentially a development
+	  tool which isn't very useful in the target.
+
 config BR2_PACKAGE_GOB2
 	bool "gob2 target package removed"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
index d3d2f39..2dc0ac6 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -102,7 +102,6 @@ endmenu
 
 menu "Development tools"
 	source "package/binutils/Config.in"
-	source "package/bison/Config.in"
 	source "package/bsdiff/Config.in"
 	source "package/bustle/Config.in"
 	source "package/cppunit/Config.in"
diff --git a/package/bison/Config.in b/package/bison/Config.in
deleted file mode 100644
index 8d88430..0000000
--- a/package/bison/Config.in
+++ /dev/null
@@ -1,19 +0,0 @@
-config BR2_PACKAGE_BISON
-	bool "bison"
-	depends on BR2_USE_WCHAR
-	select BR2_PACKAGE_M4
-	# m4 uses fork()
-	depends on BR2_USE_MMU
-	# development tool, useless on the target
-	depends on BR2_DEPRECATED_SINCE_2014_02
-	help
-	  General-purpose parser generator that converts a
-	  grammar description for an LALR context-free grammar into a C
-	  program to parse that grammar.
-
-	  http://www.gnu.org/software/bison/
-
-comment "bison needs a toolchain w/ wchar"
-	depends on BR2_DEPRECATED_SINCE_2014_02
-	depends on BR2_USE_MMU
-	depends on !BR2_USE_WCHAR
diff --git a/package/bison/bison.mk b/package/bison/bison.mk
index fdf87f6..c092b78 100644
--- a/package/bison/bison.mk
+++ b/package/bison/bison.mk
@@ -9,15 +9,6 @@ BISON_SOURCE = bison-$(BISON_VERSION).tar.xz
 BISON_SITE = $(BR2_GNU_MIRROR)/bison
 BISON_LICENSE = GPLv3+
 BISON_LICENSE_FILES = COPYING
-BISON_CONF_ENV = ac_cv_path_M4=/usr/bin/m4
-BISON_DEPENDENCIES = m4
 BISON_AUTORECONF = YES
 
-define BISON_DISABLE_EXAMPLES
-	echo 'all install:' > $(@D)/examples/Makefile
-endef
-
-BISON_POST_CONFIGURE_HOOKS += BISON_DISABLE_EXAMPLES
-
-$(eval $(autotools-package))
 $(eval $(host-autotools-package))
