From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Oct 2014 22:19:11 +0100
Subject: [Buildroot] [git commit] package/apr-util: make sqlite optional
Message-ID: <20141026213050.BC3C9B0BFD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=86a91e2c5782b240054334375afc85a730310929
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/apr-util/Config.in   |    1 -
 package/apr-util/apr-util.mk |    9 ++++++++-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/package/apr-util/Config.in b/package/apr-util/Config.in
index f54e85a..6757e7e 100644
--- a/package/apr-util/Config.in
+++ b/package/apr-util/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_APR_UTIL
 	bool "apr-util"
 	select BR2_PACKAGE_APR
-	select BR2_PACKAGE_SQLITE
 	select BR2_PACKAGE_EXPAT
 	# apr really needs shared library support
 	depends on !BR2_PREFER_STATIC_LIB
diff --git a/package/apr-util/apr-util.mk b/package/apr-util/apr-util.mk
index 1b85dae..6bc6ee9 100644
--- a/package/apr-util/apr-util.mk
+++ b/package/apr-util/apr-util.mk
@@ -9,7 +9,7 @@ APR_UTIL_SITE = http://archive.apache.org/dist/apr
 APR_UTIL_LICENSE = Apache-2.0
 APR_UTIL_LICENSE_FILES = LICENSE
 APR_UTIL_INSTALL_STAGING = YES
-APR_UTIL_DEPENDENCIES = apr expat sqlite
+APR_UTIL_DEPENDENCIES = apr expat
 APR_UTIL_CONF_OPTS = \
 	--with-apr=$(STAGING_DIR)/usr/bin/apr-1-config
 APR_UTIL_CONFIG_SCRIPTS = apu-1-config
@@ -18,4 +18,11 @@ APR_UTIL_CONFIG_SCRIPTS = apu-1-config
 # features.
 APR_UTIL_DEPENDENCIES += $(if $(BR2_PACKAGE_LIBICONV),libiconv)
 
+ifeq ($(BR2_PACKAGE_SQLITE),y)
+APR_UTIL_CONF_OPTS += --with-sqlite3="$(STAGING_DIR)/usr"
+APR_UTIL_DEPENDENCIES += sqlite
+else
+APR_UTIL_CONF_OPTS += --without-sqlite3
+endif
+
 $(eval $(autotools-package))
