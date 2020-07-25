From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 25 Jul 2020 12:18:29 +0200
Subject: [Buildroot] [PATCH 2/2] package/libgsasl: enable gcrypt support
In-Reply-To: <20200725101829.1192501-1-fontaine.fabrice@gmail.com>
References: <20200725101829.1192501-1-fontaine.fabrice@gmail.com>
Message-ID: <20200725101829.1192501-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libgsasl/libgsasl.mk | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/libgsasl/libgsasl.mk b/package/libgsasl/libgsasl.mk
index 0cec9c73bd..40e7c4c918 100644
--- a/package/libgsasl/libgsasl.mk
+++ b/package/libgsasl/libgsasl.mk
@@ -9,8 +9,13 @@ LIBGSASL_SITE = $(BR2_GNU_MIRROR)/gsasl
 LIBGSASL_LICENSE = LGPL-2.1+ (library), GPL-3.0+ (programs)
 LIBGSASL_LICENSE_FILES = README COPYING.LIB COPYING
 LIBGSASL_INSTALL_STAGING = YES
-# It doesn't seem to build with our libgcrypt so better be safe
+
+ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
+LIBGSASL_CONF_OPTS = --with-libgcrypt-prefix=$(STAGING_DIR)/usr
+LIBGSASL_DEPENDENCIES += libgcrypt
+else
 LIBGSASL_CONF_OPTS = --without-libgcrypt
+endif
 
 ifeq ($(BR2_PACKAGE_LIBIDN),y)
 LIBGSASL_CONF_OPTS += --with-libidn-prefix=$(STAGING_DIR)/usr
-- 
2.27.0
