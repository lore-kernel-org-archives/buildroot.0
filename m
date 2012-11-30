From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 30 Nov 2012 07:46:03 -0300
Subject: [Buildroot] [PATCHv2] flex: fix build for nommu systems
Message-ID: <1354272363-10162-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The flex binary uses fork() so it breaks on !MMU builds.
Since we usually don't require flex in the target and the common
scenario is that we just want libfl in staging reverse the options so
that BR2_PACKAGE_FLEX just builds and install libfl.a and change the
LIBFL option to BR2_PACKAGE_FLEX_BINARY to install the binary in the
target.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/flex/Config.in |   10 +++++-----
 package/flex/flex.mk   |   20 +++++---------------
 2 files changed, 10 insertions(+), 20 deletions(-)

diff --git a/package/flex/Config.in b/package/flex/Config.in
index b10eb00..adef468 100644
--- a/package/flex/Config.in
+++ b/package/flex/Config.in
@@ -6,10 +6,10 @@ config BR2_PACKAGE_FLEX
 
 	  http://www.gnu.org/software/flex/
 
-config BR2_PACKAGE_FLEX_LIBFL
-	bool "Install libfl.a under staging_dir/usr/lib"
-	default y
+config BR2_PACKAGE_FLEX_BINARY
+	bool "Install tool in the target"
+	# needs fork()
+	depends on BR2_USE_MMU
 	depends on BR2_PACKAGE_FLEX
 	help
-	  Install libfl.a under staging_dir/usr/lib for further development
-	  on a host machine.
+	  Install the flex binary tool in the target filesystem.
diff --git a/package/flex/flex.mk b/package/flex/flex.mk
index 2599cdc..0c1ed5a 100644
--- a/package/flex/flex.mk
+++ b/package/flex/flex.mk
@@ -16,30 +16,20 @@ FLEX_DEPENDENCIES = \
 # we don't have a host-gettext/libintl
 HOST_FLEX_DEPENDENCIES =
 
+ifeq ($(BR2_PACKAGE_FLEX_BINARY),y)
 # lex -> flex
 define FLEX_INSTALL_LEX
 	cd $(TARGET_DIR)/usr/bin && ln -snf flex lex
 endef
-
-define FLEX_UNINSTALL_LEX
-	-rm $(TARGET_DIR)/usr/bin/lex
-endef
-
 FLEX_POST_INSTALL_HOOKS += FLEX_INSTALL_LEX
-FLEX_POST_CLEAN_HOOKS += FLEX_UNINSTALL_LEX
 
-# libfl installation
-ifeq ($(BR2_PACKAGE_FLEX_LIBFL),y)
-define FLEX_INSTALL_LIBFL
-	install -D $(FLEX_DIR)/libfl.a $(STAGING_DIR)/usr/lib/libfl.a
-endef
+else
 
-define FLEX_UNINSTALL_LIBFL
-	-rm $(STAGING_DIR)/lib/libfl.a
+define FLEX_DISABLE_PROGRAM
+	$(SED) 's/^bin_PROGRAMS.*//' $(@D)/Makefile.in
 endef
+FLEX_POST_PATCH_HOOKS += FLEX_DISABLE_PROGRAM
 
-FLEX_POST_INSTALL_HOOKS += FLEX_INSTALL_LIBFL
-FLEX_POST_CLEAN_HOOKS += FLEX_UNINSTALL_LIBFL
 endif
 
 $(eval $(autotools-package))
-- 
1.7.8.6
