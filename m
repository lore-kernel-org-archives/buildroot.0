From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sun,  4 Nov 2012 20:25:23 +0100
Subject: [Buildroot] [PATCH 2/2] Make BerkeleyDB optional for Netatalk
In-Reply-To: <1352057123-7137-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1352057123-7137-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <1352057123-7137-2-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As the documentation of netatalk states :
"dbd is the default backend since version 2.1"
So cdb (which is the CNID provided by BerkeleyDB) should not be the default.

Also, this patches fixes a trouble when compiling with berkeleydb in 64bits
where netatalk would look the berkeleylib in [...]/lib64 instead of [...]/lib
---
 package/netatalk/Config.in   |    1 -
 package/netatalk/netatalk.mk |   16 ++++++++++++----
 2 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/package/netatalk/Config.in b/package/netatalk/Config.in
index 26f14c3..e602acd 100644
--- a/package/netatalk/Config.in
+++ b/package/netatalk/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_NETATALK
 	bool "netatalk"
-	select BR2_PACKAGE_BERKELEYDB
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_LIBGCRYPT
 	select BR2_PACKAGE_LIBGPG_ERROR
diff --git a/package/netatalk/netatalk.mk b/package/netatalk/netatalk.mk
index 4aa179e..70c8a13 100644
--- a/package/netatalk/netatalk.mk
+++ b/package/netatalk/netatalk.mk
@@ -7,11 +7,10 @@ NETATALK_VERSION = 3.0
 NETATALK_SITE = http://downloads.sourceforge.net/project/netatalk/netatalk/$(NETATALK_VERSION)
 NETATALK_SOURCE = netatalk-$(NETATALK_VERSION).tar.bz2

-NETATALK_DEPENDENCIES = host-pkg-config openssl berkeleydb libgcrypt libgpg-error
+NETATALK_DEPENDENCIES = host-pkg-config openssl libgcrypt libgpg-error
 NETATALK_CONF_ENV += CC="$(TARGET_CC) -std=gnu99"
-NETATALK_CONF_OPT += --with-cnid-cdb-backend \
-	--with-bdb=$(STAGING_DIR)/usr \
-	--disable-zeroconf \
+
+NETATALK_CONF_OPT += --disable-zeroconf \
 	--with-ssl-dir=$(STAGING_DIR)/usr \
 	--with-libgcrypt-dir=$(STAGING_DIR)/usr \
 	--with-shadow \
@@ -19,6 +18,15 @@ NETATALK_CONF_OPT += --with-cnid-cdb-backend \
 	--without-kerberos \
 	--without-pam

+ifeq ($(BR2_PACKAGE_BERKELEYDB),y)
+	NETATALK_DEPENDENCIES += berkeleydb
+	NETATALK_CONF_ENV += BDB_LIB=$(STAGING_LIB)/usr/lib
+	NETATALK_CONF_OPT += --with-cnid-cdb-backend \
+		--with-bdb=$(STAGING_DIR)/usr
+else
+	NETATALK_CONF_OPT += --without-cnid-cdb-backend
+endif
+
 ifeq ($(BR2_PACKAGE_CUPS),y)
 	NETATALK_DEPENDENCIES += cups
 	NETATALK_CONF_ENV += ac_cv_path_CUPS_CONFIG=$(STAGING_DIR)/usr/bin/cups-config
--
1.7.10.4
