From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 29 May 2014 12:40:27 +0200
Subject: [Buildroot] [PATCH 2/3] gettext: remove support for gettext-tools
	on target
In-Reply-To: <1401360028-10423-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1401360028-10423-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1401360028-10423-3-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit removes the BR2_PACKAGE_GETTEXT_TOOLS option, which could
be used to install gettext tools on the target. This is not needed,
because Buildroot is not designed to provide a full development
environment on the target, and gettext translation files should be
processed on the build machine, using the host gettext tools.

Remove this option will allow to optimize the build time of gettext on
the target, by only building the gettext runtime libraries.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in.legacy           | 12 ++++++++++++
 package/gettext/Config.in  | 14 --------------
 package/gettext/gettext.mk |  4 ----
 3 files changed, 12 insertions(+), 18 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 00661db..10e495b 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -99,6 +99,18 @@ comment "----------------------------------------------------"
 endif
 
 ###############################################################################
+comment "Legacy options removed in 2014.08"
+
+config BR2_PACKAGE_GETTEXT_TOOLS
+	bool "gettext-tools on target support removed"
+	select BR2_LEGACY
+	help
+	  The option to install the gettext utilities on the target
+	  has been removed. This is not necessary as Buildroot is not
+	  designed to provide a full development environment on the
+	  target. gettext tools should be used on the build machine
+	  instead.
+
 comment "Legacy options removed in 2014.05"
 
 config BR2_PACKAGE_EVTEST_CAPTURE
diff --git a/package/gettext/Config.in b/package/gettext/Config.in
index d33dd3a..158b14e 100644
--- a/package/gettext/Config.in
+++ b/package/gettext/Config.in
@@ -13,20 +13,6 @@ config BR2_PACKAGE_GETTEXT
 
 	  http://www.gnu.org/software/gettext/
 
-if BR2_PACKAGE_GETTEXT
-
-config BR2_PACKAGE_GETTEXT_TOOLS
-	bool "Install gettext tools"
-	depends on BR2_USE_MMU # fork()
-	depends on BR2_LARGEFILE
-	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
-	help
-	  This option allows to install the complete gettext suite in
-	  the target filesystem. This is typically not useful for
-	  correct operation of programs.
-
-endif
-
 comment "gettext needs a toolchain w/ wchar"
 	depends on BR2_NEEDS_GETTEXT
 	depends on !BR2_USE_WCHAR
diff --git a/package/gettext/gettext.mk b/package/gettext/gettext.mk
index b5efa76..52a72db 100644
--- a/package/gettext/gettext.mk
+++ b/package/gettext/gettext.mk
@@ -46,16 +46,12 @@ ifeq ($(BR2_ENABLE_LOCALE),)
 GETTEXT_CONF_OPT += --enable-nls
 endif
 
-# When the gettext tools are not enabled in the configuration, we only
-# install libintl to the target.
-ifeq ($(BR2_PACKAGE_GETTEXT_TOOLS),)
 # When static libs are preferred the .so files aren't created
 ifeq ($(BR2_PREFER_STATIC_LIB),)
 define GETTEXT_INSTALL_TARGET_CMDS
 	cp -dpf $(STAGING_DIR)/usr/lib/libintl*.so* $(TARGET_DIR)/usr/lib/
 endef
 endif
-endif # GETTEXT_TOOLS = n
 
 # Disable interactive confirmation in host gettextize for package fixups
 define HOST_GETTEXT_GETTEXTIZE_CONFIRMATION
-- 
1.9.3
