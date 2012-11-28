From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 28 Nov 2012 11:35:14 -0300
Subject: [Buildroot] [PATCH] flex: fix build for nommu systems
Message-ID: <1354113314-30687-1-git-send-email-gustavo@zacarias.com.ar>
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
 package/flex/Config.in        |   10 +++++-----
 package/flex/flex.mk          |   26 +++++++++-----------------
 package/gob2/Config.in        |    1 -
 package/ipsec-tools/Config.in |    1 -
 package/libcue/Config.in      |    1 -
 package/linux-pam/Config.in   |    1 -
 package/radvd/Config.in       |    1 -
 7 files changed, 14 insertions(+), 27 deletions(-)

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
index 2599cdc..19b6ef2 100644
--- a/package/flex/flex.mk
+++ b/package/flex/flex.mk
@@ -16,30 +16,22 @@ FLEX_DEPENDENCIES = \
 # we don't have a host-gettext/libintl
 HOST_FLEX_DEPENDENCIES =
 
-# lex -> flex
-define FLEX_INSTALL_LEX
-	cd $(TARGET_DIR)/usr/bin && ln -snf flex lex
+ifeq ($(BR2_PACKAGE_FLEX_BINARY),)
+define FLEX_DISABLE_PROGRAM
+	$(SED) 's/^bin_PROGRAMS.*//' $(@D)/Makefile.in
 endef
 
-define FLEX_UNINSTALL_LEX
-	-rm $(TARGET_DIR)/usr/bin/lex
-endef
+FLEX_POST_EXTRACT_HOOKS += FLEX_DISABLE_PROGRAM
 
-FLEX_POST_INSTALL_HOOKS += FLEX_INSTALL_LEX
-FLEX_POST_CLEAN_HOOKS += FLEX_UNINSTALL_LEX
+else
 
-# libfl installation
-ifeq ($(BR2_PACKAGE_FLEX_LIBFL),y)
-define FLEX_INSTALL_LIBFL
-	install -D $(FLEX_DIR)/libfl.a $(STAGING_DIR)/usr/lib/libfl.a
+# lex -> flex
+define FLEX_INSTALL_LEX
+	cd $(TARGET_DIR)/usr/bin && ln -snf flex lex
 endef
 
-define FLEX_UNINSTALL_LIBFL
-	-rm $(STAGING_DIR)/lib/libfl.a
-endef
+FLEX_POST_INSTALL_HOOKS += FLEX_INSTALL_LEX
 
-FLEX_POST_INSTALL_HOOKS += FLEX_INSTALL_LIBFL
-FLEX_POST_CLEAN_HOOKS += FLEX_UNINSTALL_LIBFL
 endif
 
 $(eval $(autotools-package))
diff --git a/package/gob2/Config.in b/package/gob2/Config.in
index cbe30d6..4a09c41 100644
--- a/package/gob2/Config.in
+++ b/package/gob2/Config.in
@@ -5,7 +5,6 @@ config BR2_PACKAGE_GOB2
 	depends on BR2_USE_MMU
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_FLEX
-	select BR2_PACKAGE_FLEX_LIBFL
 	select BR2_PACKAGE_BISON
 	help
 	  GOB (GTK+ Object Builder) is a preprocessor which simplifies
diff --git a/package/ipsec-tools/Config.in b/package/ipsec-tools/Config.in
index 6f6dc37..06a5a56 100644
--- a/package/ipsec-tools/Config.in
+++ b/package/ipsec-tools/Config.in
@@ -2,7 +2,6 @@ config BR2_PACKAGE_IPSEC_TOOLS
 	bool "ipsec-tools"
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_FLEX
-	select BR2_PACKAGE_FLEX_LIBFL
 	help
 	  This package is required to support IPSec for Linux 2.6+
 
diff --git a/package/libcue/Config.in b/package/libcue/Config.in
index e5e2e16..6121746 100644
--- a/package/libcue/Config.in
+++ b/package/libcue/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_LIBCUE
 	bool "libcue"
 	select BR2_PACKAGE_FLEX
-	select BR2_PACKAGE_FLEX_LIBFL
 	help
 	  CUE Sheet Parser Library
 
diff --git a/package/linux-pam/Config.in b/package/linux-pam/Config.in
index 7cfd814..7a4ae94 100644
--- a/package/linux-pam/Config.in
+++ b/package/linux-pam/Config.in
@@ -2,7 +2,6 @@ config BR2_PACKAGE_LINUX_PAM
 	bool "linux-pam"
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	select BR2_PACKAGE_FLEX
-	select BR2_PACKAGE_FLEX_LIBFL
 	depends on (BR2_ENABLE_LOCALE && BR2_USE_WCHAR)
 	help
 	  A Security Framework that Provides Authentication for Applications
diff --git a/package/radvd/Config.in b/package/radvd/Config.in
index d0d9d70..98dbae2 100644
--- a/package/radvd/Config.in
+++ b/package/radvd/Config.in
@@ -3,7 +3,6 @@ config BR2_PACKAGE_RADVD
 	# libdaemon uses fork()
 	depends on BR2_USE_MMU
 	select BR2_PACKAGE_FLEX
-	select BR2_PACKAGE_FLEX_LIBFL
 	select BR2_PACKAGE_LIBDAEMON
 	depends on BR2_INET_IPV6
 	help
-- 
1.7.8.6
