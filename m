From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 5 Jul 2015 16:10:52 +0200
Subject: [Buildroot] [git commit] samba4: install systemd files
Message-ID: <20150705141115.18D31800D9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ae0d54ab77a1dcb4af3b5515d3e3a99203e100f2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The package comes with usable .service files for smbd, nmbd and
winbind, but does not install them.

[Thomas: use relative paths for the symbolic links.]

Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/samba4/samba4.mk |   16 ++++++++++++++++
 1 files changed, 16 insertions(+), 0 deletions(-)

diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index d7d5299..7d10a0c 100644
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
+	ln -sf ../../../../usr/lib/systemd/system/nmb.service \
+		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/nmb.service
+	ln -sf ../../../../usr/lib/systemd/system/smb.service \
+		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/smb.service
+	ln -sf ../../../../usr/lib/systemd/system/winbind.service \
+		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/winbind.service
+endef
+
 $(eval $(generic-package))
