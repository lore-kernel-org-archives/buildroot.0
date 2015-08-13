From: James Knight <james.knight@rockwellcollins.com>
Date: Thu, 13 Aug 2015 13:14:50 -0400
Subject: [Buildroot] [PATCH 2/3] package/neon: add host variant
In-Reply-To: <1439486091-6564-1-git-send-email-james.knight@rockwellcollins.com>
References: <1439486091-6564-1-git-send-email-james.knight@rockwellcollins.com>
Message-ID: <1439486091-6564-2-git-send-email-james.knight@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Required by an upcoming host variant of the `rpm` package.

Signed-off-by: James Knight <james.knight@rockwellcollins.com>
---
 package/neon/neon.mk | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/package/neon/neon.mk b/package/neon/neon.mk
index 0cff1a2..adfc836 100644
--- a/package/neon/neon.mk
+++ b/package/neon/neon.mk
@@ -9,42 +9,60 @@ NEON_SITE = http://www.webdav.org/neon
 NEON_LICENSE = LGPLv2+ (library), GPLv2+ (manual and tests)
 NEON_LICENSE_FILES = src/COPYING.LIB test/COPYING README
 NEON_INSTALL_STAGING = YES
-NEON_CONF_OPTS = --without-gssapi --disable-rpath
 NEON_CONFIG_SCRIPTS = neon-config
+
+NEON_CONF_OPTS = --without-gssapi --disable-rpath
 NEON_DEPENDENCIES = host-pkgconf
+HOST_NEON_CONF_OPTS = --without-gssapi --disable-rpath
+HOST_NEON_DEPENDENCIES = host-pkgconf
 
 ifeq ($(BR2_PACKAGE_NEON_ZLIB),y)
 NEON_CONF_OPTS += --with-zlib=$(STAGING_DIR)
 NEON_DEPENDENCIES += zlib
+HOST_NEON_CONF_OPTS += --with-zlib=$(HOST_DIR)
+HOST_NEON_DEPENDENCIES += host-zlib
 else
 NEON_CONF_OPTS += --without-zlib
+HOST_NEON_CONF_OPTS += --without-zlib
 endif
 
 ifeq ($(BR2_PACKAGE_NEON_SSL),y)
 NEON_CONF_OPTS += --with-ssl
 NEON_DEPENDENCIES += openssl
+HOST_NEON_CONF_OPTS += --with-ssl
+HOST_NEON_DEPENDENCIES += host-openssl
 else
 NEON_CONF_OPTS += --without-ssl
+HOST_NEON_CONF_OPTS += --without-ssl
 endif
 
 ifeq ($(BR2_PACKAGE_NEON_EXPAT),y)
 NEON_CONF_OPTS += --with-expat=$(STAGING_DIR)/usr/lib/libexpat.la
 NEON_DEPENDENCIES += expat
+HOST_NEON_CONF_OPTS += --with-expat=$(HOST_DIR)/usr/lib/libexpat.la
+HOST_NEON_DEPENDENCIES += host-expat
 else
 NEON_CONF_OPTS += --with-expat=no
+HOST_NEON_CONF_OPTS += --with-expat=no
 endif
 
 ifeq ($(BR2_PACKAGE_NEON_LIBXML2),y)
 NEON_CONF_OPTS += --with-libxml2=yes
 NEON_CONF_ENV += ac_cv_prog_XML2_CONFIG=$(STAGING_DIR)/usr/bin/xml2-config
 NEON_DEPENDENCIES += libxml2
+HOST_NEON_CONF_OPTS += --with-libxml2=yes
+HOST_NEON_CONF_ENV += ac_cv_prog_XML2_CONFIG=$(HOST_DIR)/usr/bin/xml2-config
+HOST_NEON_DEPENDENCIES += host-libxml2
 else
 NEON_CONF_OPTS += --with-libxml2=no
+HOST_NEON_CONF_OPTS += --with-libxml2=no
 endif
 
 ifeq ($(BR2_PACKAGE_NEON_EXPAT)$(BR2_PACKAGE_NEON_LIBXML2),)
 # webdav needs xml support
 NEON_CONF_OPTS += --disable-webdav
+HOST_NEON_CONF_OPTS += --disable-webdav
 endif
 
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
1.9.5.msysgit.1
