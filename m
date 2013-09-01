From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 1 Sep 2013 21:03:13 +0200
Subject: [Buildroot] [git commit] netatalk: bump to version 3.0.5
Message-ID: <20130901194715.172DB9B6AF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c22889cd67b647c15d55e46b273f1ebfb2d596b8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Make it use external instead of bundled libevent - it's better for size
reasons (avoiding possible duplication) and security reasons (easier to
upgrade one global library than possibly two or more, and generally
upstream would probably be more responsive to those).

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/netatalk/Config.in   |    1 +
 package/netatalk/netatalk.mk |   13 ++++++++-----
 2 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/package/netatalk/Config.in b/package/netatalk/Config.in
index e3deaef..5c676e9 100644
--- a/package/netatalk/Config.in
+++ b/package/netatalk/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_NETATALK
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_BERKELEYDB
 	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_LIBEVENT
 	select BR2_PACKAGE_LIBGCRYPT
 	select BR2_PACKAGE_LIBGPG_ERROR
 	help
diff --git a/package/netatalk/netatalk.mk b/package/netatalk/netatalk.mk
index 684e790..37115ec 100644
--- a/package/netatalk/netatalk.mk
+++ b/package/netatalk/netatalk.mk
@@ -4,15 +4,17 @@
 #
 ################################################################################
 
-NETATALK_VERSION = 3.0
+NETATALK_VERSION = 3.0.5
 NETATALK_SITE = http://downloads.sourceforge.net/project/netatalk/netatalk/$(NETATALK_VERSION)
 NETATALK_SOURCE = netatalk-$(NETATALK_VERSION).tar.bz2
-
 NETATALK_AUTORECONF = YES
 NETATALK_CONFIG_SCRIPTS = netatalk-config
+NETATALK_DEPENDENCIES = host-pkgconf openssl berkeleydb libgcrypt libgpg-error \
+	libevent
 
-NETATALK_DEPENDENCIES = host-pkgconf openssl berkeleydb libgcrypt libgpg-error
-NETATALK_CONF_ENV += CC="$(TARGET_CC) -std=gnu99"
+# Don't run ldconfig!
+NETATALK_CONF_ENV += CC="$(TARGET_CC) -std=gnu99" \
+	ac_cv_path_NETA_LDCONFIG=""
 NETATALK_CONF_OPT += --with-cnid-cdb-backend \
 	--with-bdb=$(STAGING_DIR)/usr \
 	--disable-zeroconf \
@@ -21,7 +23,8 @@ NETATALK_CONF_OPT += --with-cnid-cdb-backend \
 	--with-shadow \
 	--disable-shell-check \
 	--without-kerberos \
-	--without-pam
+	--without-pam \
+	--with-libevent=no
 
 ifeq ($(BR2_PACKAGE_CUPS),y)
 	NETATALK_DEPENDENCIES += cups
