From: Cam Hutchison <camh@xdna.net>
Date: Sun, 15 Oct 2017 11:57:19 +1100
Subject: [Buildroot] [PATCH 1/1] ifupdown-scripts: Stop installing .empty
	files.
Message-ID: <20171015005719.16792-1-camh@xdna.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

ifupdown-scripts has some .empty files to maintain empty directories in
git. Previously this package used to be part of the skeleton which used
SYSTEM_RSYNC to copy the directories to the target. When it was split
into a separate package, cp -a was used to do the copy instead, which
copies the .empty files.

Change to SYSTEM_RSYNC which excludes .empty files.

Signed-off-by: Cam Hutchison <camh@xdna.net>
---
 package/ifupdown-scripts/ifupdown-scripts.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ifupdown-scripts/ifupdown-scripts.mk b/package/ifupdown-scripts/ifupdown-scripts.mk
index 317c8f49bf..ebc89b3872 100644
--- a/package/ifupdown-scripts/ifupdown-scripts.mk
+++ b/package/ifupdown-scripts/ifupdown-scripts.mk
@@ -31,7 +31,7 @@ endif
 
 define IFUPDOWN_SCRIPTS_INSTALL_TARGET_CMDS
 	mkdir -p $(TARGET_DIR)/etc/network
-	cp -a $(IFUPDOWN_SCRIPTS_PKGDIR)/network/* $(TARGET_DIR)/etc/network
+	$(call SYSTEM_RSYNC,$(IFUPDOWN_SCRIPTS_PKGDIR)/network,$(TARGET_DIR)/etc/network)
 	$(IFUPDOWN_SCRIPTS_LOCALHOST)
 	$(IFUPDOWN_SCRIPTS_DHCP)
 endef
-- 
2.11.0
