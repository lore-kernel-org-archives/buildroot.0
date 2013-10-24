From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Wed, 23 Oct 2013 21:05:49 -0400
Subject: [Buildroot] [PATCH] ifplugd: ensure directories exist before
	installing to them
Message-ID: <1382576749-1827-1-git-send-email-danomimanchego123@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add the -D to install commands to ensure that all the necessary
installation directories exist.

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>

---

I find that it is sometimes useful to delete the .stamp_target_installed
and run a line like this to view all the files installed by a package:

   make ifplugd TARGET_DIR=$(pwd)/TMP

In the case of ifplugd, such a line fails due to no TMP/etc/init.d.  I'm
submitting this patch to fix this scenario, since theoretically the same
could happen with a customized target skeleton.
---
 package/ifplugd/ifplugd.mk |    9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

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
-- 
1.7.9.5
