From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 31 Oct 2019 19:18:04 -0600
Subject: [Buildroot] [PATCH 1/1] package/cups: enable systemd services
Message-ID: <20191101011804.58725-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

These are normally enabled by systemctl preset-all.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/cups/cups.mk | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/package/cups/cups.mk b/package/cups/cups.mk
index bc2913b428..68fb4473c4 100644
--- a/package/cups/cups.mk
+++ b/package/cups/cups.mk
@@ -70,4 +70,18 @@ else
 CUPS_CONF_OPTS += --disable-avahi
 endif
 
+define CUPS_INSTALL_INIT_SYSTEMD
+	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
+	ln -sf ../../../../lib/systemd/system/org.cups.cupsd.path \
+		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/org.cups.cupsd.path
+	mkdir -p $(TARGET_DIR)/etc/systemd/system/printer.target.wants
+	ln -sf ../../../../lib/systemd/system/org.cups.cupsd.service \
+		$(TARGET_DIR)/etc/systemd/system/printer.target.wants/org.cups.cupsd.service
+	mkdir -p $(TARGET_DIR)/etc/systemd/system/sockets.target.wants
+	ln -sf ../../../../lib/systemd/system/org.cups.cupsd.socket \
+		$(TARGET_DIR)/etc/systemd/system/sockets.target.wants/org.cups.cupsd.socket
+	ln -sf ../../../../lib/systemd/system/org.cups.cups-lpd.socket \
+		$(TARGET_DIR)/etc/systemd/system/sockets.target.wants/org.cups.cups-lpd.socket
+endef
+
 $(eval $(autotools-package))
-- 
2.20.1
