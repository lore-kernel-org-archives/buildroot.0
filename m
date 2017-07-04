From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  4 Jul 2017 16:48:39 +0200
Subject: [Buildroot] [PATCH 059/100] net-tools: use the new gettext logic
In-Reply-To: <20170704144920.12318-1-thomas.petazzoni@free-electrons.com>
References: <20170704144920.12318-1-thomas.petazzoni@free-electrons.com>
Message-ID: <20170704144920.12318-60-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit switches to use the new gettext logic, which involves:

 - using TARGET_NLS_DEPENDENCIES instead of hand-encoded dependencies
   on gettext/host-gettext

 - using TARGET_NLS_LIBS to force linking against libintl

 - dropping BR2_PACKAGE_GETTEXT selection

 - using BR2_SYSTEM_ENABLE_NLS instead of BR2_ENABLE_LOCALE to decide
   if NLS support should be enabled or not

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/net-tools/Config.in    | 1 -
 package/net-tools/net-tools.mk | 6 +++---
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/net-tools/Config.in b/package/net-tools/Config.in
index 3980b7e..5e24bd1 100644
--- a/package/net-tools/Config.in
+++ b/package/net-tools/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_NET_TOOLS
 	bool "net-tools"
 	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
-	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	help
 	  A collection of programs that form the base set of the NET-3
 	  networking distribution for the Linux operating system.
diff --git a/package/net-tools/net-tools.mk b/package/net-tools/net-tools.mk
index 5720fcc..57a3eb4 100644
--- a/package/net-tools/net-tools.mk
+++ b/package/net-tools/net-tools.mk
@@ -6,7 +6,7 @@
 
 NET_TOOLS_VERSION = 3f170bff115303e92319791cbd56371e33dcbf6d
 NET_TOOLS_SITE = git://git.code.sf.net/p/net-tools/code
-NET_TOOLS_DEPENDENCIES = $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext)
+NET_TOOLS_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
 NET_TOOLS_LICENSE = GPL-2.0+
 NET_TOOLS_LICENSE_FILES = COPYING
 
@@ -20,7 +20,7 @@ define NET_TOOLS_CONFIGURE_CMDS
 endef
 
 # Enable I18N when appropiate
-ifeq ($(BR2_ENABLE_LOCALE),y)
+ifeq ($(BR2_SYSTEM_ENABLE_NLS),y)
 define NET_TOOLS_ENABLE_I18N
 	$(SED) 's:I18N 0:I18N 1:' $(@D)/config.h
 endef
@@ -35,7 +35,7 @@ NET_TOOLS_POST_CONFIGURE_HOOKS += NET_TOOLS_ENABLE_I18N NET_TOOLS_ENABLE_IPV6
 
 define NET_TOOLS_BUILD_CMDS
 	$(TARGET_CONFIGURE_OPTS) \
-		LIBS="$(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),-lintl)" \
+		LIBS=$(TARGET_NLS_LIBS) \
 		$(MAKE) -C $(@D)
 endef
 
-- 
2.9.4
