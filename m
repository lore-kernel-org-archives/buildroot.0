From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 15 Oct 2017 15:47:43 +0200
Subject: [Buildroot] [git commit] ifupdown-scripts: do not install .empty
	files
Message-ID: <20171015134050.D1C3D80FB6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=58b74e0dbf9b22d7dbc11127c29e23e234a9e8cf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

ifupdown-scripts has some .empty files to maintain empty directories
in git. Previously this package used to be part of the skeleton which
used SYSTEM_RSYNC to copy the directories to the target. When it was
split into a separate package, cp -a was used to do the copy instead,
which copies the .empty files.

Change to SYSTEM_RSYNC which excludes .empty files.

Signed-off-by: Cam Hutchison <camh@xdna.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ifupdown-scripts/ifupdown-scripts.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ifupdown-scripts/ifupdown-scripts.mk b/package/ifupdown-scripts/ifupdown-scripts.mk
index 317c8f4..ebc89b3 100644
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
