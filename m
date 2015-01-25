From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Jan 2015 00:21:35 +0100
Subject: [Buildroot] [git commit] flex: remove deprecated binary in target
Message-ID: <20150125233550.A7AA17FF09@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=aa6ea7aba3a9a0edd5c8618a83240f4a66263286
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It's been deprecated for a year now so remove the option.

Also rename patch to new naming convention.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in.legacy                                   |    8 +++++++
 .../{flex-prog-ar.patch => 0001-prog-ar.patch}     |    0
 package/flex/Config.in                             |   21 --------------------
 package/flex/flex.mk                               |   11 ----------
 4 files changed, 8 insertions(+), 32 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 243416e..d6f32a0 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -102,6 +102,14 @@ endif
 
 comment "Legacy options removed in 2015.02"
 
+config BR2_PACKAGE_FLEX_BINARY
+	bool "flex binary in target option removed"
+	select BR2_LEGACY
+	help
+	  The flex binary in the target option has been removed.
+	  It's been deprecated for some time now and is essentially a
+	  development tool which isn't very useful in the target.
+
 config BR2_PACKAGE_BISON
 	bool "bison target package removed"
 	select BR2_LEGACY
diff --git a/package/flex/flex-prog-ar.patch b/package/flex/0001-prog-ar.patch
similarity index 100%
rename from package/flex/flex-prog-ar.patch
rename to package/flex/0001-prog-ar.patch
diff --git a/package/flex/Config.in b/package/flex/Config.in
index 9ac600d..7199c6a 100644
--- a/package/flex/Config.in
+++ b/package/flex/Config.in
@@ -6,24 +6,3 @@ config BR2_PACKAGE_FLEX
 	  programs that perform pattern-matching on text.
 
 	  http://flex.sourceforge.net/
-
-if BR2_PACKAGE_FLEX
-
-config BR2_PACKAGE_FLEX_BINARY
-	bool "Install flex binary on target"
-	# needs fork()
-	depends on BR2_USE_MMU
-	# runtime dependency
-	select BR2_PACKAGE_M4
-	# development tool, useless on the target
-	depends on BR2_DEPRECATED_SINCE_2014_02
-	depends on BR2_USE_WCHAR # m4
-	help
-	  Install the flex binary tool in the target filesystem.
-
-comment "flex binary needs a toolchain w/ wchar"
-	depends on BR2_DEPRECATED_SINCE_2014_02
-	depends on BR2_USE_MMU
-	depends on !BR2_USE_WCHAR
-
-endif
diff --git a/package/flex/flex.mk b/package/flex/flex.mk
index cd92dd7..9a3f840 100644
--- a/package/flex/flex.mk
+++ b/package/flex/flex.mk
@@ -15,15 +15,6 @@ FLEX_CONF_ENV = ac_cv_path_M4=/usr/bin/m4
 # we don't have a host-gettext/libintl
 HOST_FLEX_DEPENDENCIES = host-m4
 
-ifeq ($(BR2_PACKAGE_FLEX_BINARY),y)
-# lex -> flex
-define FLEX_INSTALL_LEX
-	cd $(TARGET_DIR)/usr/bin && ln -snf flex lex
-endef
-FLEX_POST_INSTALL_HOOKS += FLEX_INSTALL_LEX
-
-else
-
 define FLEX_DISABLE_PROGRAM
 	$(SED) 's/^bin_PROGRAMS.*//' $(@D)/Makefile.in
 endef
@@ -35,7 +26,5 @@ define FLEX_REMOVE_BROKEN_SYMLINK
 endef
 FLEX_POST_INSTALL_TARGET_HOOKS += FLEX_REMOVE_BROKEN_SYMLINK
 
-endif
-
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
