From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 16 Mar 2016 21:38:28 +0200
Subject: [Buildroot] [PATCH] linknx: select libcurl to fix autoreconf
Message-ID: <ad8eed5a1643cc3be56f317dcac61cb1314fc40a.1458157108.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

linknx configure.ac uses the LIBCURL_CHECK_CONFIG macro that is only defined
in libcurl.m4 that is part of libcurl. Select libcurl for now to fix
autoreconf.

Fixes:
http://autobuild.buildroot.net/results/96e/96e9ae0df7ebb7ad3d748a6b518cc59570e0b995/
http://autobuild.buildroot.net/results/179/17971c9f8925ff8623a7d97aac8eda0c287a76c9/
http://autobuild.buildroot.net/results/2a8/2a8af93d6439b313b048ccac7b6cfecbb6baff55/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/linknx/Config.in |  1 +
 package/linknx/linknx.mk | 13 ++++---------
 2 files changed, 5 insertions(+), 9 deletions(-)

diff --git a/package/linknx/Config.in b/package/linknx/Config.in
index 36838fed6c0f..ca55c8bfb2f5 100644
--- a/package/linknx/Config.in
+++ b/package/linknx/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_LINKNX
 	bool "linknx"
 	select BR2_PACKAGE_LIBPTHSEM
+	select BR2_PACKAGE_LIBCURL # for autoreconf
 	select BR2_PACKAGE_ARGP_STANDALONE \
 	       if BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_MUSL
 	depends on BR2_INSTALL_LIBSTDCPP
diff --git a/package/linknx/linknx.mk b/package/linknx/linknx.mk
index 9d1f75e122aa..5dc8bb2d0839 100644
--- a/package/linknx/linknx.mk
+++ b/package/linknx/linknx.mk
@@ -15,9 +15,11 @@ LINKNX_CONF_OPTS = \
 	--without-log4cpp \
 	--without-pth-test \
 	--with-pth=$(STAGING_DIR)/usr \
-	--disable-smtp
+	--disable-smtp \
+	--with-libcurl=$(STAGING_DIR)/usr/bin/curl-config
 
-LINKNX_DEPENDENCIES = libpthsem $(if $(BR2_PACKAGE_ARGP_STANDALONE),argp-standalone)
+LINKNX_DEPENDENCIES = libpthsem libcurl \
+	$(if $(BR2_PACKAGE_ARGP_STANDALONE),argp-standalone)
 
 # This is needed to make autoreconf happy
 define LINKNX_CREATE_MISSING_FILES
@@ -32,11 +34,4 @@ else
 LINKNX_CONF_OPTS += --without-mysql
 endif
 
-ifeq ($(BR2_PACKAGE_LIBCURL),y)
-LINKNX_CONF_OPTS += --with-libcurl=$(STAGING_DIR)/usr/bin/curl-config
-LINKNX_DEPENDENCIES += libcurl
-else
-LINKNX_CONF_OPTS += --without-libcurl
-endif
-
 $(eval $(autotools-package))
-- 
2.7.0
