From: Alex Suykov <alex.suykov@gmail.com>
Date: Sat, 23 May 2015 13:14:42 +0300
Subject: [Buildroot] [PATCH 37/38] samba4: install systemd files
In-Reply-To: <cover.1432332802.git.alex.suykov@gmail.com>
References: <cover.1432332802.git.alex.suykov@gmail.com>
Message-ID: <a98e85c22089032761afba40c1df85b04c3da942.1432332802.git.alex.suykov@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The package comes with usable .service files for
smbd, nmbd and winbind, but does not install them.

Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
---
 package/samba4/samba4.mk | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index e5971fb..77ae62a 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -155,4 +155,20 @@ define SAMBA4_INSTALL_INIT_SYSV
 		$(TARGET_DIR)/etc/init.d/S91smb
 endef
 
+define SAMBA4_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 644 $(@D)/packaging/systemd/nmb.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/nmb.service
+	$(INSTALL) -D -m 644 $(@D)/packaging/systemd/smb.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/smb.service
+	$(INSTALL) -D -m 644 $(@D)/packaging/systemd/winbind.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/winbind.service
+	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
+	ln -sf /usr/lib/systemd/system/nmb.service \
+		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/nmb.service
+	ln -sf /usr/lib/systemd/system/smb.service \
+		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/smb.service
+	ln -sf /usr/lib/systemd/system/winbind.service \
+		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/winbind.service
+endef
+
 $(eval $(generic-package))
-- 
2.0.3
