From: =?UTF-8?q?J=C3=A9r=C3=A9my=20Rosen?= <jeremy.rosen@smile.fr>
Date: Mon, 16 Dec 2019 11:30:51 +0100
Subject: [Buildroot] [PATCH v5 12/13] package/rauc: add a WantedBy section
 to the systemd unit file
In-Reply-To: <20191216103052.35220-1-jeremy.rosen@smile.fr>
References: <20191216103052.35220-1-jeremy.rosen@smile.fr>
Message-ID: <20191216103052.35220-13-jeremy.rosen@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

upstream-provided service has no WantedBy, which means that rauc won't
be enabled by default

Add a WantedBy instead of manually creating the symlink so the user can
enable/disable the unit properly

Signed-off-by: J?r?my Rosen <jeremy.rosen@smile.fr>
---
 package/rauc/rauc.mk | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/rauc/rauc.mk b/package/rauc/rauc.mk
index f3434e9c9a..7b35154f56 100644
--- a/package/rauc/rauc.mk
+++ b/package/rauc/rauc.mk
@@ -31,9 +31,8 @@ RAUC_DEPENDENCIES += systemd
 endif
 
 define RAUC_INSTALL_INIT_SYSTEMD
-	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
-	ln -sf ../../../../lib/systemd/system/rauc.service \
-		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/rauc.service
+	mkdir $(TARGET_DIR)/usr/lib/systemd/system/rauc.service.d;\
+	printf '[Install]\nWantedBy=multi-user.target\n' > $(TARGET_DIR)/usr/lib/systemd/system/rauc.service.d/buildroot-enable.conf;
 endef
 
 HOST_RAUC_DEPENDENCIES = \
-- 
2.24.0
