From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed,  5 Nov 2014 13:01:59 -0300
Subject: [Buildroot] [PATCH] stunnel: bump to version 5.07
Message-ID: <1415203319-30399-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also enable optional systemd support.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/stunnel/stunnel.hash |  2 +-
 package/stunnel/stunnel.mk   | 11 +++++++++--
 2 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/package/stunnel/stunnel.hash b/package/stunnel/stunnel.hash
index 89af571..e4e6366 100644
--- a/package/stunnel/stunnel.hash
+++ b/package/stunnel/stunnel.hash
@@ -1,2 +1,2 @@
 # From http://www.stunnel.org/pipermail/stunnel-announce/2014-October/000084.html
-sha256	098c2b6db0793ea4fa5b6767ce6ef1853e9f6cc2f32133024be55f6a460b1a40	stunnel-5.06.tar.gz
+sha256	505c6c63c4a20fc0cce8c35ef1ab7626c7b01071e3fca4ac6ea417afe8065309	stunnel-5.07.tar.gz
diff --git a/package/stunnel/stunnel.mk b/package/stunnel/stunnel.mk
index 7be0cc7..dc56261 100644
--- a/package/stunnel/stunnel.mk
+++ b/package/stunnel/stunnel.mk
@@ -4,13 +4,20 @@
 #
 ################################################################################
 
-STUNNEL_VERSION = 5.06
+STUNNEL_VERSION = 5.07
 STUNNEL_SITE = http://ftp.nluug.nl/pub/networking/stunnel/archive/5.x
 STUNNEL_DEPENDENCIES = openssl
-STUNNEL_CONF_OPTS = --with-ssl=$(STAGING_DIR)/usr --with-threads=fork
+STUNNEL_CONF_OPTS = --with-ssl=$(STAGING_DIR)/usr --with-threads=fork \
+	--disable-libwrap
 STUNNEL_LICENSE = GPLv2+
 STUNNEL_LICENSE_FILES = COPYING COPYRIGHT.GPL
 
+ifeq ($(BR2_INIT_SYSTEMD),y)
+STUNNEL_DEPENDENCIES += systemd
+else
+STUNNEL_CONF_OPTS += --disable-systemd
+endif
+
 define STUNNEL_INSTALL_CONF_SCRIPT
 	$(INSTALL) -m 0755 -D package/stunnel/S50stunnel $(TARGET_DIR)/etc/init.d/S50stunnel
 	[ -f $(TARGET_DIR)/etc/stunnel/stunnel.conf ] || \
-- 
2.0.4
