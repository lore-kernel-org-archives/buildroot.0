From: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
Date: Wed, 9 Nov 2016 00:06:41 +0530
Subject: [Buildroot] [PATCH 1/2] wget: fix ssl detection in static libs
	configuration
Message-ID: <1478630202-1630-1-git-send-email-rahul.bedarkar@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When building wget with openssl in static libs configuration, wget
build system fails detect openssl because it doesn't specify LD flags
for private libs used by openssl. This specifically happens when we
pass --with-libssl-prefix to configure which tries to find ssl using
custom flags. If we don't specify --with-libssl-prefix, it relies on
pkg-config files to detect ssl and it's LD flags which helps with static
linking.

This commit removes --with-libssl-prefix conf opts. Since this case is
similar to gnutls, we remove same conf opts for gnutls as well.

wget can be built with either gnutls or openssl crypto libraries, so
separate optional support for both is not required. This commit also
does minor optimization by checking for either gnutls or openssl while
at it.

Fixes:
  http://autobuild.buildroot.net/results/c6a/c6abdff37b86471cf8b0ceffeff5472042923de0/

Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
---
 package/wget/wget.mk | 19 +++++--------------
 1 file changed, 5 insertions(+), 14 deletions(-)

diff --git a/package/wget/wget.mk b/package/wget/wget.mk
index 9cda76b..c9efc03 100644
--- a/package/wget/wget.mk
+++ b/package/wget/wget.mk
@@ -17,26 +17,17 @@ WGET_DEPENDENCIES += busybox
 endif
 
 ifeq ($(BR2_PACKAGE_GNUTLS),y)
-WGET_CONF_OPTS += \
-	--with-ssl=gnutls \
-	--with-libgnutls-prefix=$(STAGING_DIR)
+WGET_CONF_OPTS += --with-ssl=gnutls
 WGET_DEPENDENCIES += gnutls
-endif
-
-ifeq ($(BR2_PACKAGE_OPENSSL),y)
-WGET_CONF_OPTS += --with-ssl=openssl --with-libssl-prefix=$(STAGING_DIR)
+else ifeq ($(BR2_PACKAGE_OPENSSL),y)
+WGET_CONF_OPTS += --with-ssl=openssl
 WGET_DEPENDENCIES += openssl
+else
+WGET_CONF_OPTS += --without-ssl
 endif
 
 ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBUUID),y)
 WGET_DEPENDENCIES += util-linux
 endif
 
-# --with-ssl is default
-ifneq ($(BR2_PACKAGE_GNUTLS),y)
-ifneq ($(BR2_PACKAGE_OPENSSL),y)
-WGET_CONF_OPTS += --without-ssl
-endif
-endif
-
 $(eval $(autotools-package))
-- 
2.6.2
