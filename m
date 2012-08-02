From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 02 Aug 2012 19:53:36 -0000
Subject: [Buildroot] [git commit branch/next] openssl: fix static build
Message-ID: <20120802195247.6A8778E204@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d8c630d5390226bf4d46c1af43448630a7cd1a0c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/openssl/openssl.mk |   18 ++++++++++++++----
 1 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/package/openssl/openssl.mk b/package/openssl/openssl.mk
index 62861c5..9ef79e1 100644
--- a/package/openssl/openssl.mk
+++ b/package/openssl/openssl.mk
@@ -48,13 +48,14 @@ define OPENSSL_CONFIGURE_CMDS
 			--openssldir=/etc/ssl \
 			--libdir=/lib \
 			threads \
-			shared \
+			$(if $(BR2_PREFER_STATIC_LIB),no-shared,shared) \
 			no-idea \
 			no-rc5 \
 			enable-camellia \
 			enable-mdc2 \
 			enable-tlsext \
-			zlib-dynamic \
+			$(if $(BR2_PREFER_STATIC_LIB),zlib,zlib-dynamic) \
+			$(if $(BR2_PREFER_STATIC_LIB),no-dso) \
 	)
 	$(SED) "s:-march=[-a-z0-9] ::" -e "s:-mcpu=[-a-z0-9] ::g" $(@D)/Makefile
 	$(SED) "s:-O[0-9]:$(OPENSSL_CFLAGS):" $(@D)/Makefile
@@ -91,13 +92,22 @@ endif
 
 define OPENSSL_INSTALL_FIXUPS
 	rm -f $(TARGET_DIR)/usr/bin/c_rehash
-	# libraries gets installed read only, so strip fails
+endef
+
+OPENSSL_POST_INSTALL_TARGET_HOOKS += OPENSSL_INSTALL_FIXUPS
+
+ifneq ($(BR2_PREFER_STATIC_LIB),y)
+
+# libraries gets installed read only, so strip fails
+define OPENSSL_INSTALL_FIXUPS_SHARED
 	chmod +w $(TARGET_DIR)/usr/lib/engines/lib*.so
 	for i in $(addprefix $(TARGET_DIR)/usr/lib/,libcrypto.so.* libssl.so.*); \
 	do chmod +w $$i; done
 endef
 
-OPENSSL_POST_INSTALL_TARGET_HOOKS += OPENSSL_INSTALL_FIXUPS
+OPENSSL_POST_INSTALL_TARGET_HOOKS += OPENSSL_INSTALL_FIXUPS_SHARED
+
+endif
 
 define OPENSSL_REMOVE_OPENSSL_ENGINES
 	rm -rf $(TARGET_DIR)/usr/lib/engines
