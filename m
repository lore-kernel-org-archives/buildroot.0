From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 20 May 2018 16:10:43 +0200
Subject: [Buildroot] [git commit branch/next] libcurl: replace libidn by
 libidn2
Message-ID: <20180520141552.6EF34802B0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8451acf298714cd3870366c82a26eafc9c2c00b7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

libidn has been replaced by libidn2 since 7.51.0 (October 2016):
https://github.com/curl/curl/commit/9c91ec778104ae3b744b39444d544e82d5ee9ece

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libcurl/libcurl.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index a3e66d094c..b75e9fb2e9 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -9,7 +9,6 @@ LIBCURL_SOURCE = curl-$(LIBCURL_VERSION).tar.xz
 LIBCURL_SITE = https://curl.haxx.se/download
 LIBCURL_DEPENDENCIES = host-pkgconf \
 	$(if $(BR2_PACKAGE_ZLIB),zlib) \
-	$(if $(BR2_PACKAGE_LIBIDN),libidn) \
 	$(if $(BR2_PACKAGE_RTMPDUMP),rtmpdump)
 LIBCURL_LICENSE = curl
 LIBCURL_LICENSE_FILES = COPYING
@@ -68,6 +67,13 @@ else
 LIBCURL_CONF_OPTS += --disable-ares
 endif
 
+ifeq ($(BR2_PACKAGE_LIBIDN2),y)
+LIBCURL_DEPENDENCIES += libidn2
+LIBCURL_CONF_OPTS += --with-libidn2
+else
+LIBCURL_CONF_OPTS += --without-libidn2
+endif
+
 # Configure curl to support libssh2
 ifeq ($(BR2_PACKAGE_LIBSSH2),y)
 LIBCURL_DEPENDENCIES += libssh2
