From: Adam Duskett <aduskett@gmail.com>
Date: Tue, 14 Nov 2017 09:42:03 -0500
Subject: [Buildroot] [PATCH 1/1] libpjsip: fix ssl support
Message-ID: <20171114144203.8189-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, ssl support is implicitely disabled in the initial configure
options. This overrides the check for openssl below.

libpjsip is also currently only compatible with libopenssl. Change
the check to LIBOPENSSL instead of openssl, and depend on libopenssl.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 package/libpjsip/libpjsip.mk | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/libpjsip/libpjsip.mk b/package/libpjsip/libpjsip.mk
index 6f3f9e3f1a..eca6d8f1ee 100644
--- a/package/libpjsip/libpjsip.mk
+++ b/package/libpjsip/libpjsip.mk
@@ -50,7 +50,6 @@ LIBPJSIP_CONF_OPTS = \
 	--disable-openh264 \
 	--disable-libyuv \
 	--disable-ipp \
-	--disable-ssl \
 	--disable-silk \
 	--with-external-srtp
 
@@ -59,8 +58,8 @@ LIBPJSIP_CONF_OPTS = \
 # so we want to use it.
 LIBPJSIP_CONF_OPTS += --enable-epoll
 
-ifeq ($(BR2_PACKAGE_OPENSSL),y)
-LIBPJSIP_DEPENDENCIES += openssl
+ifeq ($(BR2_PACKAGE_LIBOPENSSL),y)
+LIBPJSIP_DEPENDENCIES += libopenssl
 LIBPJSIP_CONF_OPTS += --with-ssl=$(STAGING_DIR)/usr
 else
 LIBPJSIP_CONF_OPTS += --disable-ssl
-- 
2.13.6
