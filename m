From: Alex Suykov <alex.suykov@gmail.com>
Date: Sat, 23 May 2015 13:02:32 +0300
Subject: [Buildroot] [PATCH 03/38] dcron: systemd support
In-Reply-To: <cover.1432332802.git.alex.suykov@gmail.com>
References: <cover.1432332802.git.alex.suykov@gmail.com>
Message-ID: <b887d362acbbadad2b0b691fe218eb95cec90d43.1432332802.git.alex.suykov@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
---
 package/dcron/dcron.mk      |  8 ++++++++
 package/dcron/dcron.service | 10 ++++++++++
 2 files changed, 18 insertions(+)
 create mode 100644 package/dcron/dcron.service

diff --git a/package/dcron/dcron.mk b/package/dcron/dcron.mk
index fcb585d..840471f 100644
--- a/package/dcron/dcron.mk
+++ b/package/dcron/dcron.mk
@@ -33,4 +33,12 @@ define DCRON_INSTALL_INIT_SYSV
 	$(INSTALL) -D -m 0755 package/dcron/S90dcron $(TARGET_DIR)/etc/init.d/S90dcron
 endef
 
+define DCRON_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 644 package/dcron/dcron.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/dcron.service
+	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
+	ln -sf /usr/lib/systemd/system/dcron.service \
+		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/dcron.service
+endef
+
 $(eval $(generic-package))
diff --git a/package/dcron/dcron.service b/package/dcron/dcron.service
new file mode 100644
index 0000000..b9fa489
--- /dev/null
+++ b/package/dcron/dcron.service
@@ -0,0 +1,10 @@
+[Unit]
+Description=Task scheduler daemon
+After=syslog.target
+
+[Service]
+ExecStart=/usr/sbin/crond -f -S
+Restart=always
+
+[Install]
+WantedBy=multi-user.target
-- 
2.0.3
