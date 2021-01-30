From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 30 Jan 2021 11:18:33 +0100
Subject: [Buildroot] [PATCH] package/xserver_xorg-server: don't install init
 script if nodm is enabled
Message-ID: <20210130101834.18086-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Both S40xorg and S90nodm tries to run an Xserver on vt1, causing the nodm
one to fail.  If nodm is enabled, then that is likely what the user wants to
run, so skip installing S40xorg.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x11r7/xserver_xorg-server/xserver_xorg-server.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
index 8ac2d17b24..fa8ae13b8c 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
@@ -216,9 +216,12 @@ define XSERVER_XORG_SERVER_INSTALL_INIT_SYSTEMD
 		$(TARGET_DIR)/usr/lib/systemd/system/xorg.service
 endef
 
+# init script conflicts with S90nodm
+ifneq ($(BR2_PACKAGE_NODM),y)
 define XSERVER_XORG_SERVER_INSTALL_INIT_SYSV
 	$(INSTALL) -D -m 755 package/x11r7/xserver_xorg-server/S40xorg \
 		$(TARGET_DIR)/etc/init.d/S40xorg
 endef
+endif
 
 $(eval $(autotools-package))
-- 
2.20.1
