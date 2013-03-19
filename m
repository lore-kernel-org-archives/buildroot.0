From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 19 Mar 2013 13:58:46 -0300
Subject: [Buildroot] [PATCH] stunnel: security bump to version 4.55
Message-ID: <1363712326-29884-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes CVE-2013-1762, improves CVE-2010-3684 workaround.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/stunnel/Config.in  | 1 +
 package/stunnel/stunnel.mk | 8 ++++----
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/stunnel/Config.in b/package/stunnel/Config.in
index b1977ed..e4a9567 100644
--- a/package/stunnel/Config.in
+++ b/package/stunnel/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_STUNNEL
 	bool "stunnel"
+	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_OPENSSL
 	help
 	  Stunnel is a program that wraps any TCP connection with an SSL
diff --git a/package/stunnel/stunnel.mk b/package/stunnel/stunnel.mk
index 7c280cc..92344d1 100644
--- a/package/stunnel/stunnel.mk
+++ b/package/stunnel/stunnel.mk
@@ -4,12 +4,12 @@
 #
 #############################################################
 
-STUNNEL_VERSION = 4.44
+STUNNEL_VERSION = 4.55
 STUNNEL_SITE = http://ftp.nluug.nl/pub/networking/stunnel
 STUNNEL_DEPENDENCIES = openssl
-STUNNEL_CONF_OPT += \
-	--with-ssl=$(STAGING_DIR)/usr \
-	--with-threads=fork
+STUNNEL_CONF_OPT = --with-ssl=$(STAGING_DIR)/usr --with-threads=fork
+STUNNEL_LICENSE = GPLv2+
+STUNNEL_LICENSE_FILES = COPYING COPYRIGHT.GPL
 
 define STUNNEL_INSTALL_CONF_SCRIPT
 	$(INSTALL) -m 0755 -D package/stunnel/S50stunnel $(TARGET_DIR)/etc/init.d/S50stunnel
-- 
1.8.1.5
