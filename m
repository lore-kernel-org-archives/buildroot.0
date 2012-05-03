From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu,  3 May 2012 10:25:37 -0300
Subject: [Buildroot] [PATCH] ushare: needs libintl if NLS is enabled
Message-ID: <1336051537-10676-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/ushare/Config.in |    2 ++
 package/ushare/ushare.mk |    7 ++++++-
 2 files changed, 8 insertions(+), 1 deletions(-)

diff --git a/package/ushare/Config.in b/package/ushare/Config.in
index a714fa0..acf025f 100644
--- a/package/ushare/Config.in
+++ b/package/ushare/Config.in
@@ -2,6 +2,8 @@ config BR2_PACKAGE_USHARE
 	bool "ushare"
 	depends on BR2_LARGEFILE
 	select BR2_PACKAGE_LIBUPNP
+	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
+	select BR2_PACKAGE_LIBINTL if BR2_NEEDS_GETTEXT_IF_LOCALE
 	help
 	  uShare is a UPnP (TM) A/V & DLNA Media Server.
 	  It implements the server component that provides UPnP media devices
diff --git a/package/ushare/ushare.mk b/package/ushare/ushare.mk
index ac8cbc3..5421d8a 100644
--- a/package/ushare/ushare.mk
+++ b/package/ushare/ushare.mk
@@ -9,6 +9,11 @@ USHARE_SOURCE = ushare-$(USHARE_VERSION).tar.bz2
 USHARE_SITE = http://ushare.geexbox.org/releases
 USHARE_DEPENDENCIES = host-pkg-config libupnp
 
+ifeq ($(BR2_NEEDS_GETTEXT_IF_LOCALE),y)
+USHARE_DEPENDENCIES += gettext libintl
+USHARE_LDFLAGS += -lintl
+endif
+
 define USHARE_CONFIGURE_CMDS
 	(cd $(@D); \
 		$(TARGET_CONFIGURE_OPTS) \
@@ -19,7 +24,7 @@ define USHARE_CONFIGURE_CMDS
 endef
 
 define USHARE_BUILD_CMDS
-	$(MAKE) -C $(@D)
+	$(MAKE) LDFLAGS="$(TARGET_LDFLAGS) $(USHARE_LDFLAGS)" -C $(@D)
 endef
 
 define USHARE_INSTALL_TARGET_CMDS
-- 
1.7.3.4
