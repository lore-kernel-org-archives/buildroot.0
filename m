From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Sat, 29 Mar 2014 20:53:40 -0400
Subject: [Buildroot] [PATCH 1/1] ifplugd: only install default action if not
	provided in skeleton
Message-ID: <1396140820-1793-1-git-send-email-danomimanchego123@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>

---

This is basically a parallel check-in to ec771579451c54c8590800ca1803cd6bfcc9a116,
which extended the same consideration to ifplugd.conf.
---
 package/ifplugd/ifplugd.mk |    8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/ifplugd/ifplugd.mk b/package/ifplugd/ifplugd.mk
index 837e016..81b3884 100644
--- a/package/ifplugd/ifplugd.mk
+++ b/package/ifplugd/ifplugd.mk
@@ -21,12 +21,14 @@ ifeq ($(BR2_PACKAGE_BUSYBOX),y)
 endif
 
 define IFPLUGD_INSTALL_FIXUP
-	@if [ ! -f $(TARGET_DIR)/etc/ifplugd/ifplugd.conf ]; then \
+	if [ ! -f $(TARGET_DIR)/etc/ifplugd/ifplugd.conf ]; then \
 		$(INSTALL) -D $(@D)/conf/ifplugd.conf $(TARGET_DIR)/etc/ifplugd/ifplugd.conf; \
 		$(SED) 's^\(ARGS=.*\)w^\1^' $(TARGET_DIR)/etc/ifplugd/ifplugd.conf; \
 	fi
-	$(INSTALL) -D -m 0755 $(@D)/conf/ifplugd.action \
-		$(TARGET_DIR)/etc/ifplugd/ifplugd.action
+	if [ ! -f $(TARGET_DIR)/etc/ifplugd/ifplugd.action ]; then \
+		$(INSTALL) -D -m 0755 $(@D)/conf/ifplugd.action \
+			$(TARGET_DIR)/etc/ifplugd/ifplugd.action
+	fi
 	$(INSTALL) -D -m 0755 $(@D)/conf/ifplugd.init \
 		$(TARGET_DIR)/etc/init.d/S45ifplugd
 	# don't use bash for init script
-- 
1.7.9.5
