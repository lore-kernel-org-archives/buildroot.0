From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 10 Apr 2013 17:29:24 -0300
Subject: [Buildroot] [PATCHv2 1/3] openssl: add host variant
Message-ID: <1365625766-11256-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Useful for the upcoming host-python-m2crypto package.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/openssl/openssl.mk | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/package/openssl/openssl.mk b/package/openssl/openssl.mk
index 7701d51..8486c44 100644
--- a/package/openssl/openssl.mk
+++ b/package/openssl/openssl.mk
@@ -46,6 +46,18 @@ ifeq ($(BR2_x86_i386),y)
 	OPENSSL_TARGET_ARCH = generic32 386
 endif
 
+define HOST_OPENSSL_CONFIGURE_CMDS
+	(cd $(@D); \
+		$(HOST_CONFIGURE_OPTS) \
+		./config \
+		--prefix=/usr \
+		--openssldir=/etc/ssl \
+		--libdir=/lib \
+		shared \
+		no-zlib \
+	)
+endef
+
 define OPENSSL_CONFIGURE_CMDS
 	(cd $(@D); \
 		$(TARGET_CONFIGURE_ARGS) \
@@ -69,6 +81,10 @@ define OPENSSL_CONFIGURE_CMDS
 	$(SED) "s:-O[0-9]:$(OPENSSL_CFLAGS):" $(@D)/Makefile
 endef
 
+define HOST_OPENSSL_BUILD_CMDS
+	$(MAKE1) -C $(@D)
+endef
+
 define OPENSSL_BUILD_CMDS
 	$(MAKE1) -C $(@D)
 endef
@@ -77,6 +93,10 @@ define OPENSSL_INSTALL_STAGING_CMDS
 	$(MAKE1) -C $(@D) INSTALL_PREFIX=$(STAGING_DIR) install
 endef
 
+define HOST_OPENSSL_INSTALL_CMDS
+	$(MAKE1) -C $(@D) INSTALL_PREFIX=$(HOST_DIR) install
+endef
+
 define OPENSSL_INSTALL_TARGET_CMDS
 	$(MAKE1) -C $(@D) INSTALL_PREFIX=$(TARGET_DIR) install
 endef
@@ -124,3 +144,4 @@ define OPENSSL_UNINSTALL_CMDS
 endef
 
 $(eval $(generic-package))
+$(eval $(host-generic-package))
-- 
1.8.1.5
