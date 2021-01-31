From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 31 Jan 2021 23:15:10 +0100
Subject: [Buildroot] [git commit] package/xserver_xorg-server: don't install
 init script if nodm is enabled
Message-ID: <20210131215501.8C571862F3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=735581122aea7b3f2adec69c771121146ebbe0d0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Both S40xorg and S90nodm tries to run an Xserver on vt1, causing the nodm
one to fail.  If nodm is enabled, then that is likely what the user wants to
run, so skip installing S40xorg.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
