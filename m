From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Tue, 14 Jul 2015 16:38:20 +0200
Subject: [Buildroot] [PATCH] rsyslog: Fix systemd service creation
Message-ID: <1436884700-11759-1-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The rsyslog.service is installed by rsyslog, but the link is not created
so the service is not enabled.
In order to install the service file, use the correct configure flag.

So the INSTALL_INIT_SYSTEMD will create the link, it will also create
another link which is due to the fact that the rsyslog.service contains
an Alias=

If we were to use systemctl enable to enable the service, it would
create both,so we mimic that.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 package/rsyslog/rsyslog.mk | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/package/rsyslog/rsyslog.mk b/package/rsyslog/rsyslog.mk
index 261f59d..5b30d28 100644
--- a/package/rsyslog/rsyslog.mk
+++ b/package/rsyslog/rsyslog.mk
@@ -57,17 +57,32 @@ else
 RSYSLOG_CONF_OPTS += --disable-uuid
 endif
 
+ifeq ($(BR2_INIT_SYSTEMD),y)
+RSYSLOG_CONF_OPTS += \
+	--enable-systemd \
+	--with-systemdsystemunitdir=/usr/lib/systemd/system
+RSYSLOG_DEPENDENCIES += systemd
+else
+RSYSLOG_CONF_OPTS += --disable-systemd
+endif
+
 define RSYSLOG_INSTALL_INIT_SYSV
 	$(INSTALL) -m 0755 -D package/rsyslog/S01logging \
 		$(TARGET_DIR)/etc/init.d/S01logging
 endef
 
+# The rsyslog.service is installed by rsyslog, but the link is not created
+# so the service is not enabled.
+# We need to create another link which is due to the fact that the
+# rsyslog.service contains an Alias=
+# If we were to use systemctl enable to enable the service, it would
+# create both,so we mimic that.
 define RSYSLOG_INSTALL_INIT_SYSTEMD
-	ln -sf /lib/systemd/system/rsyslog.service \
-		$(TARGET_DIR)/etc/systemd/system/syslog.service
 	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
-	ln -sf ../syslog.service \
-		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/syslog.service
+	ln -sf ../../../../usr/lib/systemd/system/rsyslog.service \
+		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/rsyslog.service
+	ln -sf ../../../../usr/lib/systemd/system/rsyslog.service \
+		$(TARGET_DIR)/etc/systemd/system/syslog.service
 endef
 
 define RSYSLOG_INSTALL_CONF
-- 
2.1.4
