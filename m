From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 1 Dec 2014 22:50:13 +0100
Subject: [Buildroot] [git commit] samba: use <pkg>_INSTALL_INIT_SYSV
	mechanism
Message-ID: <20141201221140.9C66B8002F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a47a96136b32adb0600ee0b96b0cbd5eb5f5504a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also makes the installation of the init script unconditional.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/samba/samba.mk |   12 ++++++------
 1 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/samba/samba.mk b/package/samba/samba.mk
index ec8e6ec..92bbe4e 100644
--- a/package/samba/samba.mk
+++ b/package/samba/samba.mk
@@ -176,17 +176,17 @@ ifeq ($(BR2_PACKAGE_SAMBA_SWAT),y)
 SAMBA_POST_INSTALL_TARGET_HOOKS += SAMBA_REMOVE_SWAT_DOCUMENTATION
 endif
 
-define SAMBA_INSTALL_INITSCRIPTS_CONFIG
-	# install start/stop script
-	@if [ ! -f $(TARGET_DIR)/etc/init.d/S91smb ]; then \
-		$(INSTALL) -m 0755 -D package/samba/S91smb $(TARGET_DIR)/etc/init.d/S91smb; \
-	fi
+define SAMBA_INSTALL_CONFIG
 	# install config
 	@if [ ! -f $(TARGET_DIR)/etc/samba/smb.conf ]; then \
 		$(INSTALL) -m 0644 -D package/samba/simple.conf $(TARGET_DIR)/etc/samba/smb.conf; \
 	fi
 endef
 
-SAMBA_POST_INSTALL_TARGET_HOOKS += SAMBA_INSTALL_INITSCRIPTS_CONFIG
+SAMBA_POST_INSTALL_TARGET_HOOKS += SAMBA_INSTALL_CONFIG
+
+define SAMBA_INSTALL_INIT_SYSV
+	$(INSTALL) -m 0755 -D package/samba/S91smb $(TARGET_DIR)/etc/init.d/S91smb
+endef
 
 $(eval $(autotools-package))
