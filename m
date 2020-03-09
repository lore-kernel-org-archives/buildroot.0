From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 9 Mar 2020 22:39:39 +0100
Subject: [Buildroot] [git commit] package/qextserialport: convert to qmake
 infra
Message-ID: <20200309215540.B6009802A4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ac5fd1ac947cfff32010198371b45b2f5847fc65
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit converts the qextserialport to the qmake infra, which is a
straightforward conversion as it doesn't require any custom
environment option or additional hook.

Signed-off-by: Andreas Naumann <anaumann@ultratronik.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qextserialport/qextserialport.mk | 24 +-----------------------
 1 file changed, 1 insertion(+), 23 deletions(-)

diff --git a/package/qextserialport/qextserialport.mk b/package/qextserialport/qextserialport.mk
index ecaff21efc..419ea669cb 100644
--- a/package/qextserialport/qextserialport.mk
+++ b/package/qextserialport/qextserialport.mk
@@ -14,26 +14,4 @@ ifeq ($(BR2_STATIC_LIBS),y)
 QEXTSERIALPORT_CONF_OPTS += CONFIG+=qesp_static
 endif
 
-QEXTSERIALPORT_DEPENDENCIES = qt5base
-
-define QEXTSERIALPORT_CONFIGURE_CMDS
-	cd $(@D); $(TARGET_MAKE_ENV) $(QT5_QMAKE) $(QEXTSERIALPORT_CONF_OPTS)
-endef
-
-define QEXTSERIALPORT_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
-endef
-
-define QEXTSERIALPORT_INSTALL_STAGING_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install
-endef
-
-ifeq ($(BR2_STATIC_LIBS),y)
-QEXTSERIALPORT_INSTALL_TARGET = NO
-else
-define QEXTSERIALPORT_INSTALL_TARGET_CMDS
-	cp -a $(@D)/*.so.* $(TARGET_DIR)/usr/lib
-endef
-endif
-
-$(eval $(generic-package))
+$(eval $(qmake-package))
