From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 6 Nov 2014 09:12:24 +0100
Subject: [Buildroot] [git commit] stunnel: bump to version 5.07
Message-ID: <20141106081556.2E83CB2467@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a098184a7d87bec537ab113b96d5d2e7f8a1616d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also enable optional systemd support.

[Peter: fixup announcement url in .hash as pointed out by Baruch]
Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Reviewed-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Tested-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/stunnel/stunnel.hash |    4 ++--
 package/stunnel/stunnel.mk   |   11 +++++++++--
 2 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/package/stunnel/stunnel.hash b/package/stunnel/stunnel.hash
index 89af571..2745a81 100644
--- a/package/stunnel/stunnel.hash
+++ b/package/stunnel/stunnel.hash
@@ -1,2 +1,2 @@
-# From http://www.stunnel.org/pipermail/stunnel-announce/2014-October/000084.html
-sha256	098c2b6db0793ea4fa5b6767ce6ef1853e9f6cc2f32133024be55f6a460b1a40	stunnel-5.06.tar.gz
+# From http://www.stunnel.org/pipermail/stunnel-announce/2014-November/000085.html
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
