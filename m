From: Marek Belisko <marek.belisko@open-nandra.com>
Date: Thu,  3 Mar 2011 14:53:30 +0100
Subject: [Buildroot] [PATCH] buildroot: Add webdav support to lighttpd.
Message-ID: <1299160410-14587-1-git-send-email-marek.belisko@open-nandra.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Marek Belisko <marek.belisko@open-nandra.com>
---
 package/lighttpd/Config.in   |    8 ++++++++
 package/lighttpd/lighttpd.mk |    7 +++++++
 2 files changed, 15 insertions(+), 0 deletions(-)

diff --git a/package/lighttpd/Config.in b/package/lighttpd/Config.in
index b56d66b..49877e4 100644
--- a/package/lighttpd/Config.in
+++ b/package/lighttpd/Config.in
@@ -42,5 +42,13 @@ config BR2_PACKAGE_LIGHTTPD_PCRE
 	help
 	  Enable PCRE support. Needed to support mod_rewrite
 
+config BR2_PACKAGE_LIGHTTPD_WEBDAV
+	bool "webdav"
+	depends on BR2_PACKAGE_LIGHTTPD
+	select BR2_PACKAGE_LIBXML2
+	select BR2_PACKAGE_SQLITE
+	help
+	  Enable webdav support. Needed to support mod_webdav
+
 endmenu
 endif
diff --git a/package/lighttpd/lighttpd.mk b/package/lighttpd/lighttpd.mk
index 67cd272..0b35df8 100644
--- a/package/lighttpd/lighttpd.mk
+++ b/package/lighttpd/lighttpd.mk
@@ -43,6 +43,13 @@ else
 LIGHTTPD_CONF_OPT += --without-pcre
 endif
 
+ifeq ($(BR2_PACKAGE_LIGHTTPD_WEBDAV),y)
+LIGHTTPD_DEPENDENCIES += libxml2 sqlite
+LIGHTTPD_CONF_OPT += --with-webdav-props --with-webdav-locks
+else
+LIGHTTPD_CONF_OPT += ---without-webdav-props --without-webdav-locks
+endif
+
 define LIGHTTPD_UNINSTALL_TARGET_CMDS
 	rm -f $(TARGET_DIR)/usr/sbin/lighttpd
 	rm -f $(TARGET_DIR)/usr/sbin/lighttpd-angel
-- 
1.7.1
