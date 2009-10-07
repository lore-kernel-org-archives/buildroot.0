From: Michael Roth <mroth@nessie.de>
Date: Wed,  7 Oct 2009 11:20:26 +0200
Subject: [Buildroot] [PATCH 03/23] qt: enable proper re-configure
In-Reply-To: <1254907246-5650-1-git-send-email-mroth@nessie.de>
References: <1254907246-5650-1-git-send-email-mroth@nessie.de>
Message-ID: <1254907246-5650-4-git-send-email-mroth@nessie.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The Qt configure script doesn't use config.cache but the
generated Makefile provides a confclean target to properly
clean out old configuration.

Signed-off-by: Michael Roth <mroth@nessie.de>
---
 package/qt/qt.mk |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/qt/qt.mk b/package/qt/qt.mk
index f4a63a4..7189f03 100644
--- a/package/qt/qt.mk
+++ b/package/qt/qt.mk
@@ -442,6 +442,7 @@ $(QT_TARGET_DIR)/.unpacked: $(DL_DIR)/$(QT_SOURCE)
 	touch $@
 
 $(QT_TARGET_DIR)/.configured: $(QT_TARGET_DIR)/.unpacked
+	-[ -f $(QT_TARGET_DIR)/Makefile ] && $(MAKE) -C $(QT_TARGET_DIR) confclean
 ifneq ($(BR2_INET_IPV6),y)
 	$(SED) 's/^CFG_IPV6=auto/CFG_IPV6=no/' $(QT_TARGET_DIR)/configure
 	$(SED) 's/^CFG_IPV6IFNAME=auto/CFG_IPV6IFNAME=no/' $(QT_TARGET_DIR)/configure
@@ -466,7 +467,7 @@ endif
 # when cross compiling, Qt 4.4.3 is wrong here.
 # Don't use TARGET_CONFIGURE_OPTS here, qmake would be compiled for the target
 # instead of the host then.
-	(cd $(QT_TARGET_DIR); rm -rf config.cache; \
+	(cd $(QT_TARGET_DIR); \
 		PATH=$(TARGET_PATH) \
 		PKG_CONFIG_SYSROOT_DIR="$(STAGING_DIR)" \
 		PKG_CONFIG_PATH="$(STAGING_DIR)/usr/lib/pkgconfig:$(PKG_CONFIG_PATH)" \
-- 
1.6.3.3
