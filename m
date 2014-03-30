From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 30 Mar 2014 11:32:12 +0200
Subject: [Buildroot] [git commit] ifplugd: only install default action if
	not provided in skeleton
Message-ID: <20140330094742.C51DD9BB80@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b1ec31a4dd2b7bd8959bdbc6d44e2cf2b56f8363
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ifplugd/ifplugd.mk |    8 +++++---
 1 files changed, 5 insertions(+), 3 deletions(-)

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
