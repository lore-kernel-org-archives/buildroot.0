From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 7 May 2013 16:30:30 +0200
Subject: [Buildroot] [git commit] dropbear: disable standalone mode for nommu
Message-ID: <20130507143455.809ED99CC3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=494d5c9665fd707dc8586478158ed1814ade44c1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

dropbear for nommu targets must disable the standalone (non-inetd) mode
since the platform lacks fork(), fixes:
http://autobuild.buildroot.net/results/ecbdfab10f54bec75c112bbf005bba9ae2b18dc8/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/dropbear/dropbear.mk |   22 +++++++++++++---------
 1 files changed, 13 insertions(+), 9 deletions(-)

diff --git a/package/dropbear/dropbear.mk b/package/dropbear/dropbear.mk
index d5dfe6d..e00890e 100644
--- a/package/dropbear/dropbear.mk
+++ b/package/dropbear/dropbear.mk
@@ -39,6 +39,19 @@ define DROPBEAR_BUILD_FEATURED
 	$(SED) 's:.*\(#define DROPBEAR_SHA2_512_HMAC\).*:\1:' $(@D)/options.h
 endef
 
+define DROPBEAR_DISABLE_STANDALONE
+	$(SED) 's:\(#define NON_INETD_MODE\):/*\1 */:' $(@D)/options.h
+endef
+
+ifeq ($(BR2_USE_MMU),y)
+define DROPBEAR_INSTALL_INIT_SYSV
+	$(INSTALL) -D -m 755 package/dropbear/S50dropbear \
+		$(TARGET_DIR)/etc/init.d/S50dropbear
+endef
+else
+DROPBEAR_POST_EXTRACT_HOOKS += DROPBEAR_DISABLE_STANDALONE
+endif
+
 ifeq ($(BR2_PACKAGE_DROPBEAR_DISABLE_REVERSEDNS),y)
 DROPBEAR_POST_EXTRACT_HOOKS += DROPBEAR_DISABLE_REVERSE_DNS
 endif
@@ -64,15 +77,6 @@ define DROPBEAR_INSTALL_TARGET_CMDS
 	for f in $(DROPBEAR_TARGET_BINS); do \
 		ln -snf ../sbin/dropbear $(TARGET_DIR)/usr/bin/$$f ; \
 	done
-	if [ ! -f $(TARGET_DIR)/etc/init.d/S50dropbear ]; then \
-		$(INSTALL) -m 0755 -D package/dropbear/S50dropbear $(TARGET_DIR)/etc/init.d/S50dropbear; \
-	fi
-endef
-
-define DROPBEAR_UNINSTALL_TARGET_CMDS
-	rm -f $(TARGET_DIR)/usr/sbin/dropbear
-	rm -f $(addprefix $(TARGET_DIR)/usr/bin/, $(DROPBEAR_TARGET_BINS))
-	rm -f $(TARGET_DIR)/etc/init.d/S50dropbear
 endef
 
 $(eval $(autotools-package))
