From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 13 Jun 2021 11:10:43 +0200
Subject: [Buildroot] [PATCH v2,
 1/2] package/libkrb5: add openssl optional dependency
Message-ID: <20210613091044.877789-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

openssl is an optional dependency which is enabled by default since at
least 2007 and
https://github.com/krb5/krb5/commit/4c17f25c0f106ec8e3aad2cee4e7a24f66b5a65d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2 (after review of Yann E. Morin):
 - Add openssl optional dependency

 package/libkrb5/libkrb5.mk | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/package/libkrb5/libkrb5.mk b/package/libkrb5/libkrb5.mk
index e4f3fa4186..794cedd33c 100644
--- a/package/libkrb5/libkrb5.mk
+++ b/package/libkrb5/libkrb5.mk
@@ -41,6 +41,21 @@ else
 LIBKRB5_CONF_OPTS += --without-ldap
 endif
 
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+LIBKRB5_CONF_OPTS += \
+	--enable-pkinit \
+	--with-crypto-impl=openssl \
+	--with-spake-openssl \
+	--with-tls-impl=openssl
+LIBKRB5_DEPENDENCIES += openssl
+else
+LIBKRB5_CONF_OPTS += \
+	--disable-pkinit \
+	--with-crypto-impl=builtin \
+	--without-spake-openssl \
+	--without-tls-impl
+endif
+
 ifeq ($(BR2_PACKAGE_LIBEDIT),y)
 LIBKRB5_CONF_OPTS += --with-libedit
 LIBKRB5_DEPENDENCIES += host-pkgconf libedit
-- 
2.30.2
