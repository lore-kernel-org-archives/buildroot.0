From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 26 Dec 2012 10:55:49 -0300
Subject: [Buildroot] [PATCH 3/3] libmicrohttpd: bump to version 0.9.24
In-Reply-To: <1356530149-12305-1-git-send-email-gustavo@zacarias.com.ar>
References: <1356530149-12305-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1356530149-12305-3-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libmicrohttpd/Config.in        |    5 +++++
 package/libmicrohttpd/libmicrohttpd.mk |    8 ++++----
 2 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/package/libmicrohttpd/Config.in b/package/libmicrohttpd/Config.in
index cfedc8f..4e78a99 100644
--- a/package/libmicrohttpd/Config.in
+++ b/package/libmicrohttpd/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LIBMICROHTTPD
 	bool "libmicrohttpd"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  GNU libmicrohttpd is a small C library that makes it easy to
 	  run an HTTP server as part of another application.
@@ -9,6 +10,10 @@ config BR2_PACKAGE_LIBMICROHTTPD
 config BR2_PACKAGE_LIBMICROHTTPD_SSL
        bool "https support"
        depends on BR2_PACKAGE_LIBMICROHTTPD
+       select BR2_PACKAGE_GNUTLS
        select BR2_PACKAGE_LIBGCRYPT
        help
          Enable HTTPS (SSL) support.
+
+comment "libmicrohttpd needs a toolchain with thread support"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libmicrohttpd/libmicrohttpd.mk b/package/libmicrohttpd/libmicrohttpd.mk
index f8690ee..cf84b2d 100644
--- a/package/libmicrohttpd/libmicrohttpd.mk
+++ b/package/libmicrohttpd/libmicrohttpd.mk
@@ -3,14 +3,14 @@
 # libmicrohttpd
 #
 #############################################################
-LIBMICROHTTPD_VERSION = 0.4.6
-LIBMICROHTTPD_SOURCE = libmicrohttpd-$(LIBMICROHTTPD_VERSION).tar.gz
+
+LIBMICROHTTPD_VERSION = 0.9.24
 LIBMICROHTTPD_SITE = $(BR2_GNU_MIRROR)/libmicrohttpd
 LIBMICROHTTPD_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_LIBMICROHTTPD_SSL),y)
-LIBMICROHTTPD_DEPENDENCIES += libgcrypt
-LIBMICROHTTPD_CONF_OPT += --enable-https \
+LIBMICROHTTPD_DEPENDENCIES += gnutls libgcrypt
+LIBMICROHTTPD_CONF_OPT += --enable-https --with-gnutls=$(STAGING_DIR)/usr \
 			  --with-libgcrypt-prefix=$(STAGING_DIR)/usr
 else
 LIBMICROHTTPD_CONF_OPT += --disable-https
-- 
1.7.8.6
