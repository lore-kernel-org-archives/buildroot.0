From: Alex Suykov <alex.suykov@gmail.com>
Date: Sat, 23 May 2015 13:03:27 +0300
Subject: [Buildroot] [PATCH 07/38] exim: systemd support
In-Reply-To: <cover.1432332802.git.alex.suykov@gmail.com>
References: <cover.1432332802.git.alex.suykov@gmail.com>
Message-ID: <2bc7b8864f7f664c36ceb90062d39aee6e29345d.1432332802.git.alex.suykov@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
---
 package/exim/exim.mk      |  8 ++++++++
 package/exim/exim.service | 10 ++++++++++
 2 files changed, 18 insertions(+)
 create mode 100644 package/exim/exim.service

diff --git a/package/exim/exim.mk b/package/exim/exim.mk
index b852793..c950f4b 100644
--- a/package/exim/exim.mk
+++ b/package/exim/exim.mk
@@ -125,4 +125,12 @@ define EXIM_INSTALL_INIT_SYSV
 		$(TARGET_DIR)/etc/init.d/S86exim
 endef
 
+define EXIM_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 644 package/exim/exim.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/exim.service
+	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
+	ln -sf /usr/lib/systemd/system/exim.service \
+		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/exim.service
+endef
+
 $(eval $(generic-package))
diff --git a/package/exim/exim.service b/package/exim/exim.service
new file mode 100644
index 0000000..26daabc
--- /dev/null
+++ b/package/exim/exim.service
@@ -0,0 +1,10 @@
+[Unit]
+Description=Exim MTA
+After=syslog.target network.target
+
+[Service]
+ExecStart=/usr/bin/exim -bdf
+Restart=always
+
+[Install]
+WantedBy=multi-user.target
-- 
2.0.3
