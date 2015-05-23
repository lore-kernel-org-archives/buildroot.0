From: Alex Suykov <alex.suykov@gmail.com>
Date: Sat, 23 May 2015 13:03:45 +0300
Subject: [Buildroot] [PATCH 09/38] inadyn: systemd support
In-Reply-To: <cover.1432332802.git.alex.suykov@gmail.com>
References: <cover.1432332802.git.alex.suykov@gmail.com>
Message-ID: <2ffe7e630d07e63d8bc7e7f67364d17241e63019.1432332802.git.alex.suykov@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
---
 package/inadyn/inadyn.mk      |  8 ++++++++
 package/inadyn/inadyn.service | 10 ++++++++++
 2 files changed, 18 insertions(+)
 create mode 100644 package/inadyn/inadyn.service

diff --git a/package/inadyn/inadyn.mk b/package/inadyn/inadyn.mk
index b002f94..5c3b0e3 100644
--- a/package/inadyn/inadyn.mk
+++ b/package/inadyn/inadyn.mk
@@ -30,4 +30,12 @@ define INADYN_INSTALL_INIT_SYSV
 		$(TARGET_DIR)/etc/init.d/S70inadyn
 endef
 
+define INADYN_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 644 package/inadyn/inadyn.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/inadyn.service
+	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
+	ln -sf /usr/lib/systemd/system/inadyn.service \
+		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/inadyn.service
+endef
+
 $(eval $(autotools-package))
diff --git a/package/inadyn/inadyn.service b/package/inadyn/inadyn.service
new file mode 100644
index 0000000..abc0a1e
--- /dev/null
+++ b/package/inadyn/inadyn.service
@@ -0,0 +1,10 @@
+[Unit]
+Description=DDNS client
+After=syslog.target network.target
+
+[Service]
+ExecStart=/usr/bin/inadyn
+Restart=always
+
+[Install]
+WantedBy=multi-user.target
-- 
2.0.3
