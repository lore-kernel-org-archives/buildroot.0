From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 12 Mar 2011 22:27:06 +0100
Subject: [Buildroot] [git commit master 1/1] makedevs: convert to GENTARGETS
	format
Message-ID: <20110312212828.6BE7B8FFCA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=3d0a569412545d2ce650a7d38df15faf1e2137cd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

And at the same time fix target build (used host compiler, didn't add
to TARGETS).

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/makedevs/makedevs.mk |   46 ++++++++++++++++++++---------------------
 1 files changed, 22 insertions(+), 24 deletions(-)

diff --git a/package/makedevs/makedevs.mk b/package/makedevs/makedevs.mk
index eee635e..b7c9343 100644
--- a/package/makedevs/makedevs.mk
+++ b/package/makedevs/makedevs.mk
@@ -4,34 +4,32 @@
 #
 #############################################################
 
-MAKEDEVS_DIR=$(BUILD_DIR)/makedevs
+# source included in buildroot
+MAKEDEVS_SOURCE =
+HOST_MAKEDEVS_SOURCE =
 
-$(MAKEDEVS_DIR)/makedevs.c:
-	rm -rf $(MAKEDEVS_DIR)
-	mkdir $(MAKEDEVS_DIR)
-	cp package/makedevs/makedevs.c $(MAKEDEVS_DIR)
+define MAKEDEVS_BUILD_CMDS
+	$(TARGET_CC) $(TARGET_CFLAGS) $(TARGET_LDFLAGS) \
+		package/makedevs/makedevs.c -o $(@D)/makedevs
+endef
 
-$(MAKEDEVS_DIR)/makedevs: $(MAKEDEVS_DIR)/makedevs.c
-	$(CC) -Wall -Werror -O2 $(MAKEDEVS_DIR)/makedevs.c -o $@
+define MAKEDEVS_INSTALL_TARGET_CMDS
+	install -D -m 755 $(@D)/makedevs $(TARGET_DIR)/usr/sbin/makedevs
+endef
 
-$(TARGET_DIR)/usr/bin/makedevs: $(MAKEDEVS_DIR)/makedevs
-	$(INSTALL) -m 755 $^ $@
+define MAKEDEVS_UNINSTALL_TARGET_CMDS
+	rm -f $(TARGET_DIR)/usr/sbin/makedevs
+endef
 
-makedevs: $(TARGET_DIR)/usr/bin/makedevs
-makedevs-source:
 
-HOST_MAKEDEVS_DIR=$(BUILD_DIR)/host-makedevs
+define HOST_MAKEDEVS_BUILD_CMDS
+	$(HOSTCC) $(HOST_CFLAGS) $(HOST_LDFLAGS) \
+		package/makedevs/makedevs.c -o $(@D)/makedevs
+endef
 
-$(HOST_MAKEDEVS_DIR)/makedevs.c:
-	rm -rf $(HOST_MAKEDEVS_DIR)
-	mkdir $(HOST_MAKEDEVS_DIR)
-	cp package/makedevs/makedevs.c $(HOST_MAKEDEVS_DIR)
+define HOST_MAKEDEVS_INSTALL_CMDS
+	install -D -m 755 $(@D)/makedevs $(HOST_DIR)/usr/bin/makedevs
+endef
 
-$(HOST_MAKEDEVS_DIR)/makedevs: $(HOST_MAKEDEVS_DIR)/makedevs.c
-	$(CC) -Wall -Werror -O2 $(HOST_MAKEDEVS_DIR)/makedevs.c -o $@
-
-$(HOST_DIR)/usr/bin/makedevs: $(HOST_MAKEDEVS_DIR)/makedevs
-	$(INSTALL) -m 755 $^ $@
-
-host-makedevs: $(HOST_DIR)/usr/bin/makedevs
-host-makedevs-source:
+$(eval $(call GENTARGETS,package,makedevs))
+$(eval $(call GENTARGETS,package,makedevs,host))
-- 
1.7.3.4
