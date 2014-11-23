From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 23 Nov 2014 21:38:45 +0100
Subject: [Buildroot] [PATCH 13/51] samba: use <pkg>_INSTALL_INIT_SYSV
	mechanism
In-Reply-To: <1416775163-20215-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1416775163-20215-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1416775163-20215-14-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/samba/samba.mk | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/package/samba/samba.mk b/package/samba/samba.mk
index 1957997..13d2cb7 100644
--- a/package/samba/samba.mk
+++ b/package/samba/samba.mk
@@ -160,17 +160,20 @@ ifeq ($(BR2_PACKAGE_SAMBA_SWAT),y)
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
+	# install start/stop script
+	@if [ ! -f $(TARGET_DIR)/etc/init.d/S91smb ]; then \
+		$(INSTALL) -m 0755 -D package/samba/S91smb $(TARGET_DIR)/etc/init.d/S91smb; \
+	fi
+endef
 
 $(eval $(autotools-package))
-- 
2.1.0
