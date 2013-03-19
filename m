From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 19 Mar 2013 20:22:59 +0100
Subject: [Buildroot] [git commit] stunnel: security bump to version 4.55
Message-ID: <20130319192256.B085F9B19F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4fcdc6a3338b7cd86caf40ba8660161eda088d36
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes CVE-2013-1762, improves CVE-2010-3684 workaround.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/stunnel/Config.in  |    1 +
 package/stunnel/stunnel.mk |    8 ++++----
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
