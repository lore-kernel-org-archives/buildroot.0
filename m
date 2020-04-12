From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 12 Apr 2020 22:08:47 +0200
Subject: [Buildroot] [git commit] package/libcoap: properly enable DTLS
 support
Message-ID: <20200412200439.6473B8E82F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8b14f6b49b962d4d8f7135d85afa15658ea8f94b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The DTLS support needs either gnutls or openssl, so let's have these
packages as optional dependencies. We prefer gnutls over openssl as
done by upstream in their configure.ac when the user does not provide
any option (which is the case currently)

While there is support for tinydtls, and Buildroot has a tinydtls
package, libcoap is only able to use its own internal library, and
only when static linking is enabled, so we simply disable the use of
tinydtls altogether.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libcoap/libcoap.mk | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/package/libcoap/libcoap.mk b/package/libcoap/libcoap.mk
index e2fbaa3dfb..bea0e68889 100644
--- a/package/libcoap/libcoap.mk
+++ b/package/libcoap/libcoap.mk
@@ -10,7 +10,17 @@ LIBCOAP_INSTALL_STAGING = YES
 LIBCOAP_LICENSE = BSD-2-Clause
 LIBCOAP_LICENSE_FILES = COPYING LICENSE
 LIBCOAP_DEPENDENCIES = host-pkgconf
-LIBCOAP_CONF_OPTS = --disable-examples
+LIBCOAP_CONF_OPTS = --disable-examples --without-tinydtls
 LIBCOAP_AUTORECONF = YES
 
+ifeq ($(BR2_PACKAGE_GNUTLS),y)
+LIBCOAP_DEPENDENCIES += gnutls
+LIBCOAP_CONF_OPTS += --enable-dtls --with-gnutls --without-openssl
+else ifeq ($(BR2_PACKAGE_OPENSSL),y)
+LIBCOAP_DEPENDENCIES += openssl
+LIBCOAP_CONF_OPTS += --enable-dtls --without-gnutls --with-openssl
+else
+LIBCOAP_CONF_OPTS += --disable-dtls
+endif
+
 $(eval $(autotools-package))
