From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 13 Feb 2020 23:15:10 +0100
Subject: [Buildroot] [PATCH 1/1] package/libcoap: add openssl and gnutls
 optional dependencies
Message-ID: <20200213221510.2343763-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

openssl and gnutls are optional dependencies since version 4.2.0 and
https://github.com/obgm/libcoap/commit/4cef54f15190a42b6d3ad7a17ed71331e50a1bdf

Prefer gnutls over openssl has done by upstream in their configure.ac
when the user does not provide any option (which is the case currently)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libcoap/libcoap.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/libcoap/libcoap.mk b/package/libcoap/libcoap.mk
index e2fbaa3dfb..02577ecebe 100644
--- a/package/libcoap/libcoap.mk
+++ b/package/libcoap/libcoap.mk
@@ -13,4 +13,12 @@ LIBCOAP_DEPENDENCIES = host-pkgconf
 LIBCOAP_CONF_OPTS = --disable-examples
 LIBCOAP_AUTORECONF = YES
 
+ifeq ($(BR2_PACKAGE_GNUTLS),y)
+LIBCOAP_DEPENDENCIES += gnutls
+LIBCOAP_CONF_OPTS += --with-gnutls
+else ifeq ($(BR2_PACKAGE_OPENSSL),y)
+LIBCOAP_DEPENDENCIES += openssl
+LIBCOAP_CONF_OPTS += --with-openssl
+endif
+
 $(eval $(autotools-package))
-- 
2.24.1
