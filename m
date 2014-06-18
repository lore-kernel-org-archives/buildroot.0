From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 18 Jun 2014 14:19:00 +0200
Subject: [Buildroot] [git commit] netatalk: add support for zeroconf
Message-ID: <20140618123420.480E69D041@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=50bd1b972c1871d5e0387f2bf2262b649942d90e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: check for avahi-daemon, not just the base avahi package]
Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/netatalk/netatalk.mk |    8 +++++++-
 1 files changed, 7 insertions(+), 1 deletions(-)

diff --git a/package/netatalk/netatalk.mk b/package/netatalk/netatalk.mk
index 1285af2..f13fdf3 100644
--- a/package/netatalk/netatalk.mk
+++ b/package/netatalk/netatalk.mk
@@ -19,7 +19,6 @@ NETATALK_CONF_ENV += CC="$(TARGET_CC) -std=gnu99" \
 	ac_cv_path_NETA_LDCONFIG=""
 NETATALK_CONF_OPT += --with-cnid-cdb-backend \
 	--with-bdb=$(STAGING_DIR)/usr \
-	--disable-zeroconf \
 	--with-ssl-dir=$(STAGING_DIR)/usr \
 	--with-libgcrypt-dir=$(STAGING_DIR)/usr \
 	--with-shadow \
@@ -30,6 +29,13 @@ NETATALK_CONF_OPT += --with-cnid-cdb-backend \
 	--with-dtrace=no \
 	--with-mysql-config=no
 
+ifeq ($(BR2_PACKAGE_AVAHI_DAEMON)$(BR2_PACKAGE_DBUS),yy)
+	NETATALK_DEPENDENCIES += avahi
+	NETATALK_CONF_OPT += --enable-zeroconf=$(STAGING_DIR)/usr
+else
+	NETATALK_CONF_OPT += --disable-zeroconf
+endif
+
 ifeq ($(BR2_PACKAGE_CUPS),y)
 	NETATALK_DEPENDENCIES += cups
 	NETATALK_CONF_ENV += ac_cv_path_CUPS_CONFIG=$(STAGING_DIR)/usr/bin/cups-config
