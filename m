From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 24 Oct 2013 08:43:28 +0200
Subject: [Buildroot] [git commit] ifplugd: ensure directories exist before
	installing to them
Message-ID: <20131024064830.55B9399B2D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=cfea3556422e92969bedbde95d32af4c3dc25c83
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add the -D to install commands to ensure that all the necessary
installation directories exist.

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ifplugd/ifplugd.mk |    9 ++++-----
 1 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/ifplugd/ifplugd.mk b/package/ifplugd/ifplugd.mk
index ee5bd25..837e016 100644
--- a/package/ifplugd/ifplugd.mk
+++ b/package/ifplugd/ifplugd.mk
@@ -21,14 +21,13 @@ ifeq ($(BR2_PACKAGE_BUSYBOX),y)
 endif
 
 define IFPLUGD_INSTALL_FIXUP
-	$(INSTALL) -d $(TARGET_DIR)/etc/ifplugd
 	@if [ ! -f $(TARGET_DIR)/etc/ifplugd/ifplugd.conf ]; then \
-		$(INSTALL) $(@D)/conf/ifplugd.conf $(TARGET_DIR)/etc/ifplugd/; \
+		$(INSTALL) -D $(@D)/conf/ifplugd.conf $(TARGET_DIR)/etc/ifplugd/ifplugd.conf; \
 		$(SED) 's^\(ARGS=.*\)w^\1^' $(TARGET_DIR)/etc/ifplugd/ifplugd.conf; \
 	fi
-	$(INSTALL) -m 0755 $(@D)/conf/ifplugd.action \
-		$(TARGET_DIR)/etc/ifplugd/
-	$(INSTALL) -m 0755 $(@D)/conf/ifplugd.init \
+	$(INSTALL) -D -m 0755 $(@D)/conf/ifplugd.action \
+		$(TARGET_DIR)/etc/ifplugd/ifplugd.action
+	$(INSTALL) -D -m 0755 $(@D)/conf/ifplugd.init \
 		$(TARGET_DIR)/etc/init.d/S45ifplugd
 	# don't use bash for init script
 	$(SED) 's^/bin/bash^/bin/sh^g' $(TARGET_DIR)/etc/init.d/S45ifplugd
