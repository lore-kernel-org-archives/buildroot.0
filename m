From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue,  1 May 2018 22:40:33 +0200
Subject: [Buildroot] [PATCH 2/7] libcurl: replace libidn by libidn2
In-Reply-To: <20180501204038.20000-1-fontaine.fabrice@gmail.com>
References: <20180501204038.20000-1-fontaine.fabrice@gmail.com>
Message-ID: <20180501204038.20000-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libidn has been replaced by libidn2 since 7.51.0 (October 2016):
https://github.com/curl/curl/commit/9c91ec778104ae3b744b39444d544e82d5ee9ece

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
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
-- 
2.14.1
