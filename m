From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 3 May 2010 00:00:10 +0200
Subject: [Buildroot] [git commit master] openssl: convert to the generic
	infrastructure
Message-ID: <20100502220949.73D238A6CC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=c9a06efff3cb246b20312b85eecbeba424541b4b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

OpenSSL is not using the autotools as its build system. Therefore, we
must use the generic infrastructure instead of the autotools one.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/openssl/openssl.mk |   85 ++++++++++++++++++++++++++-----------------
 1 files changed, 51 insertions(+), 34 deletions(-)

diff --git a/package/openssl/openssl.mk b/package/openssl/openssl.mk
index 0f8c83c..c52e256 100644
--- a/package/openssl/openssl.mk
+++ b/package/openssl/openssl.mk
@@ -5,6 +5,8 @@
 #############################################################
 OPENSSL_VERSION:=0.9.8n
 OPENSSL_SITE:=http://www.openssl.org/source
+OPENSSL_INSTALL_STAGING = YES
+OPENSSL_DEPENDENCIES = zlib
 
 OPENSSL_TARGET_ARCH=generic32
 
@@ -19,17 +21,8 @@ ifeq ($(ARCH),x86_64)
 OPENSSL_TARGET_ARCH=x86_64
 endif
 
-OPENSSL_INSTALL_STAGING = YES
-OPENSSL_INSTALL_STAGING_OPT = INSTALL_PREFIX=$(STAGING_DIR) install
-
-OPENSSL_INSTALL_TARGET_OPT = INSTALL_PREFIX=$(TARGET_DIR) install
-
-OPENSSL_DEPENDENCIES = zlib
-
-$(eval $(call AUTOTARGETS,package,openssl))
-
-$(OPENSSL_TARGET_CONFIGURE):
-	(cd $(OPENSSL_DIR); \
+define OPENSSL_CONFIGURE_CMDS
+	(cd $(@D); \
 		$(TARGET_CONFIGURE_ARGS) \
 		$(TARGET_CONFIGURE_OPTS) \
 		./Configure \
@@ -43,38 +36,62 @@ $(OPENSSL_TARGET_CONFIGURE):
 			no-rc5 \
 			zlib-dynamic \
 	)
-	$(SED) "s:-march=[-a-z0-9] ::" -e "s:-mcpu=[-a-z0-9] ::g" $(OPENSSL_DIR)/Makefile
-	$(SED) "s:-O[0-9]:$(TARGET_CFLAGS):" $(OPENSSL_DIR)/Makefile
-	touch $@
-
-$(OPENSSL_TARGET_BUILD):
-	$(MAKE1) CC=$(TARGET_CC) -C $(OPENSSL_DIR) all build-shared
-	$(MAKE1) CC=$(TARGET_CC) -C $(OPENSSL_DIR) do_linux-shared
-	touch $@
-
-$(OPENSSL_HOOK_POST_INSTALL):
-	$(if $(BR2_HAVE_DEVFILES),,rm -rf $(TARGET_DIR)/usr/lib/ssl)
-ifeq ($(BR2_PACKAGE_OPENSSL_BIN),y)
-	$(STRIPCMD) $(STRIP_STRIP_ALL) $(TARGET_DIR)/usr/bin/openssl
-else
+	$(SED) "s:-march=[-a-z0-9] ::" -e "s:-mcpu=[-a-z0-9] ::g" $(@D)/Makefile
+	$(SED) "s:-O[0-9]:$(TARGET_CFLAGS):" $(@D)/Makefile
+endef
+
+define OPENSSL_BUILD_CMDS
+	$(MAKE1) CC=$(TARGET_CC) -C $(@D) all build-shared
+	$(MAKE1) CC=$(TARGET_CC) -C $(@D) do_linux-shared
+endef
+
+define OPENSSL_INSTALL_STAGING_CMDS
+	$(MAKE1) -C $(@D) INSTALL_PREFIX=$(STAGING_DIR) install
+endef
+
+define OPENSSL_INSTALL_TARGET_CMDS
+	$(MAKE1) -C $(@D) INSTALL_PREFIX=$(TARGET_DIR) install
+endef
+
+define OPENSSL_REMOVE_DEV_FILES
+	rm -rf $(TARGET_DIR)/usr/lib/ssl
+endef
+
+ifneq ($(BR2_HAVE_DEVFILES),y)
+OPENSSL_POST_INSTALL_TARGET_HOOKS += OPENSSL_REMOVE_DEV_FILES
+endif
+
+define OPENSSL_REMOVE_OPENSSL_BIN
 	rm -f $(TARGET_DIR)/usr/bin/openssl
+endef
+
+ifneq ($(BR2_PACKAGE_OPENSSL_BIN),y)
+OPENSSL_POST_INSTALL_TARGET_HOOKS += OPENSSL_REMOVE_OPENSSL_BIN
 endif
+
+define OPENSSL_INSTALL_FIXUPS
 	rm -f $(TARGET_DIR)/usr/bin/c_rehash
 	# libraries gets installed read only, so strip fails
+	chmod +w $(TARGET_DIR)/usr/lib/engines/lib*.so
 	for i in $(addprefix $(TARGET_DIR)/usr/lib/,libcrypto.so.* libssl.so.*); \
-	do chmod +w $$i; $(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $$i; done
-ifneq ($(BR2_PACKAGE_OPENSSL_ENGINES),y)
+	do chmod +w $$i; done
+endef
+
+OPENSSL_POST_INSTALL_TARGET_HOOKS += OPENSSL_INSTALL_FIXUPS
+
+define OPENSSL_REMOVE_OPENSSL_ENGINES
 	rm -rf $(TARGET_DIR)/usr/lib/engines
-else
-	chmod +w $(TARGET_DIR)/usr/lib/engines/lib*.so
-	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/engines/lib*.so
+endef
+
+ifneq ($(BR2_PACKAGE_OPENSSL_ENGINES),y)
+OPENSSL_POST_INSTALL_TARGET_HOOKS += OPENSSL_REMOVE_OPENSSL_ENGINES
 endif
-	touch $@
 
-$(OPENSSL_TARGET_UNINSTALL):
-	$(call MESSAGE,"Uninstalling")
+define OPENSSL_UNINSTALL_CMDS
 	rm -rf $(addprefix $(TARGET_DIR)/,etc/ssl usr/bin/openssl usr/include/openssl)
 	rm -rf $(addprefix $(TARGET_DIR)/usr/lib/,ssl engines libcrypto* libssl* pkgconfig/libcrypto.pc)
 	rm -rf $(addprefix $(STAGING_DIR)/,etc/ssl usr/bin/openssl usr/include/openssl)
 	rm -rf $(addprefix $(STAGING_DIR)/usr/lib/,ssl engines libcrypto* libssl* pkgconfig/libcrypto.pc)
-	rm -f $(OPENSSL_TARGET_INSTALL_TARGET) $(OPENSSL_HOOK_POST_INSTALL)
+endef
+
+$(eval $(call GENTARGETS,package,openssl))
-- 
1.6.3.3
