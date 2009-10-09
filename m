From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 9 Oct 2009 14:58:32 +0200
Subject: [Buildroot] [git commit master] qt: enable proper re-configure
Message-ID: <20091009130112.98985772E1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=10efac17fd7db7bd4e7eb8251fe96b45c5ca406d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The Qt configure script doesn't use config.cache but the
generated Makefile provides a confclean target to properly
clean out old configuration.

Signed-off-by: Michael Roth <mroth@nessie.de>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/qt/qt.mk |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/qt/qt.mk b/package/qt/qt.mk
index 68b4e44..5b9906e 100644
--- a/package/qt/qt.mk
+++ b/package/qt/qt.mk
@@ -426,6 +426,7 @@ $(QT_TARGET_DIR)/.unpacked: $(DL_DIR)/$(QT_SOURCE)
 	touch $@
 
 $(QT_TARGET_DIR)/.configured: $(QT_TARGET_DIR)/.unpacked
+	-[ -f $(QT_TARGET_DIR)/Makefile ] && $(MAKE) -C $(QT_TARGET_DIR) confclean
 ifneq ($(BR2_INET_IPV6),y)
 	$(SED) 's/^CFG_IPV6=auto/CFG_IPV6=no/' $(QT_TARGET_DIR)/configure
 	$(SED) 's/^CFG_IPV6IFNAME=auto/CFG_IPV6IFNAME=no/' $(QT_TARGET_DIR)/configure
@@ -450,7 +451,7 @@ endif
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
