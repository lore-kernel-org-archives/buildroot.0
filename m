From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 2 Feb 2015 09:40:08 +0100
Subject: [Buildroot] [git commit] pps-tools: also pass TARGET_CONFIGURE_OPTS
	to make install
Message-ID: <20150202084350.4883F807F6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=242f6720931d4f86fb6f8fc9742a29a297f878c4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Without these environment variables, pps-tools rebuilds for the host machine
architecture and does not run on the target machine.

Signed-off-by: Ryan Coe <bluemrp9@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pps-tools/pps-tools.mk |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/pps-tools/pps-tools.mk b/package/pps-tools/pps-tools.mk
index 7876403..48feea9 100644
--- a/package/pps-tools/pps-tools.mk
+++ b/package/pps-tools/pps-tools.mk
@@ -16,12 +16,14 @@ endef
 
 define PPS_TOOLS_INSTALL_STAGING_CMDS
 	mkdir -p $(STAGING_DIR)/usr/include/sys $(STAGING_DIR)/usr/bin
-	$(TARGET_MAKE_ENV) $(MAKE) DESTDIR=$(STAGING_DIR) -C $(@D) install
+	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
+		DESTDIR=$(STAGING_DIR) -C $(@D) install
 endef
 
 define PPS_TOOLS_INSTALL_TARGET_CMDS
 	mkdir -p $(TARGET_DIR)/usr/include/sys $(TARGET_DIR)/usr/bin
-	$(TARGET_MAKE_ENV) $(MAKE) DESTDIR=$(TARGET_DIR) -C $(@D) install
+	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
+		DESTDIR=$(TARGET_DIR) -C $(@D) install
 endef
 
 $(eval $(generic-package))
