From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed,  9 Feb 2011 15:22:40 -0300
Subject: [Buildroot] [PATCH 2/2] links: bump to version 2.3pre1
In-Reply-To: <1297275760-29399-1-git-send-email-gustavo@zacarias.com.ar>
References: <1297275760-29399-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1297275760-29399-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

* Switch to links 2.3pre1.
* Enable graphics mode via directfb.

TODO: Support X11 mode, maybe linuxfb (requires gpm).

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/links/Config.in                            |   11 ++++++-
 ...sl-largefile.patch => links-no-largefile.patch} |    0
 package/links/links.mk                             |   35 +++++++++++++++----
 3 files changed, 37 insertions(+), 9 deletions(-)
 rename package/links/{links-1.01pre1-no-ssl-largefile.patch => links-no-largefile.patch} (100%)

diff --git a/package/links/Config.in b/package/links/Config.in
index 5a0ce9c..fddf3d2 100644
--- a/package/links/Config.in
+++ b/package/links/Config.in
@@ -3,4 +3,13 @@ config BR2_PACKAGE_LINKS
 	help
 	  Graphics and text mode WWW browser (kind of like lynx).
 
-	  http://atrey.karlin.mff.cuni.cz/~clock/twibright/links
+	  http://links.twibright.com/
+
+config BR2_PACKAGE_LINKS_GRAPHICS
+	bool "use graphics (directfb)"
+	depends on BR2_PACKAGE_LINKS
+	select BR2_PACKAGE_DIRECTFB
+	select BR2_PACKAGE_LIBPNG
+	help
+	  Enable graphics output.
+	  Otherwise links will be text-mode only.
diff --git a/package/links/links-1.01pre1-no-ssl-largefile.patch b/package/links/links-no-largefile.patch
similarity index 100%
rename from package/links/links-1.01pre1-no-ssl-largefile.patch
rename to package/links/links-no-largefile.patch
diff --git a/package/links/links.mk b/package/links/links.mk
index 2e17066..b8520d4 100644
--- a/package/links/links.mk
+++ b/package/links/links.mk
@@ -1,16 +1,35 @@
 #############################################################
 #
-# links (text based web browser)
+# links
 #
 #############################################################
-LINKS_VERSION:=1.01pre1-no-ssl
-LINKS_SITE:=http://artax.karlin.mff.cuni.cz/~mikulas/vyplody/links/download/no-ssl
-LINKS_SOURCE:=links-$(LINKS_VERSION).tar.gz
 
-LINKS_CONF_OPT = --localstatedir=/tmp
+LINKS_VERSION = 2.3pre1
+LINKS_SITE = http://links.twibright.com/download
+LINKS_CONF_OPT = --without-x
 
-define LINKS_INSTALL_TARGET_CMDS
-	install -c $(@D)/links $(TARGET_DIR)/usr/bin/links
-endef
+ifeq ($(BR2_PACKAGE_LINKS_GRAPHICS),y)
+LINKS_CONF_OPT += --enable-graphics
+LINKS_CONF_ENV = ac_cv_path_DIRECTFB_CONFIG=$(STAGING_DIR)/usr/bin/directfb-config
+LINKS_DEPENDENCIES += directfb libpng
+ifeq ($(BR2_PACKAGE_JPEG),y)
+LINKS_DEPENDENCIES += jpeg
+endif
+ifeq ($(BR2_PACKAGE_TIFF),y)
+LINKS_DEPENDENCIES += tiff
+endif
+endif
+
+ifeq ($(BR2_PACKAGE_BZIP2),y)
+LINKS_DEPENDENCIES += bzip2
+endif
+
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+LINKS_DEPENDENCIES += openssl
+endif
+
+ifeq ($(BR2_PACKAGE_ZLIB),y)
+LINKS_DEPENDENCIES += zlib
+endif
 
 $(eval $(call AUTOTARGETS,package,links))
-- 
1.7.3.4
