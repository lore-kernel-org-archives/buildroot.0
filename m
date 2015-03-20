From: Mike Williams <mike@mikebwilliams.com>
Date: Fri, 20 Mar 2015 15:13:52 -0400
Subject: [Buildroot] [PATCH v2 01/25] lighttpd: use upstream systemd service
	file
In-Reply-To: <1426878856-15747-1-git-send-email-mike@mikebwilliams.com>
References: <1426878856-15747-1-git-send-email-mike@mikebwilliams.com>
Message-ID: <1426878856-15747-2-git-send-email-mike@mikebwilliams.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Mike Williams <mike@mikebwilliams.com>
---
 package/lighttpd/lighttpd.mk      |  6 +++---
 package/lighttpd/lighttpd.service | 10 ----------
 2 files changed, 3 insertions(+), 13 deletions(-)
 delete mode 100644 package/lighttpd/lighttpd.service

diff --git a/package/lighttpd/lighttpd.mk b/package/lighttpd/lighttpd.mk
index 8f34561..cdbf91d 100644
--- a/package/lighttpd/lighttpd.mk
+++ b/package/lighttpd/lighttpd.mk
@@ -84,12 +84,12 @@ define LIGHTTPD_INSTALL_INIT_SYSV
 endef
 
 define LIGHTTPD_INSTALL_INIT_SYSTEMD
-	$(INSTALL) -D -m 0644 package/lighttpd/lighttpd.service \
-		$(TARGET_DIR)/etc/systemd/system/lighttpd.service
+	$(INSTALL) -D -m 0644 $(@D)/doc/systemd/lighttpd.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/lighttpd.service
 
 	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
 
-	ln -fs ../lighttpd.service \
+	ln -fs ../../../../usr/lib/systemd/lighttpd.service \
 		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/lighttpd.service
 endef
 
diff --git a/package/lighttpd/lighttpd.service b/package/lighttpd/lighttpd.service
deleted file mode 100644
index 0ca5357..0000000
--- a/package/lighttpd/lighttpd.service
+++ /dev/null
@@ -1,10 +0,0 @@
-[Unit]
-Description=Lighttpd Web Server
-After=network.target
-
-[Service]
-ExecStart=/usr/sbin/lighttpd-angel -f /etc/lighttpd/lighttpd.conf -D
-ExecReload=/bin/kill -HUP $MAINPID
-
-[Install]
-WantedBy=multi-user.target
-- 
2.1.0
