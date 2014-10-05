From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  5 Oct 2014 19:38:52 +0200
Subject: [Buildroot] [PATCH v2 04/16] package/apr-util: make sqlite optional
In-Reply-To: <1412530744-20649-1-git-send-email-bernd.kuhls@t-online.de>
References: <1412530744-20649-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1412530744-20649-5-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
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
-- 
1.7.10.4
