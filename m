From: Alex Suykov <alex.suykov@gmail.com>
Date: Sat, 23 May 2015 13:05:20 +0300
Subject: [Buildroot] [PATCH 15/38] neard: systemd support
In-Reply-To: <cover.1432332802.git.alex.suykov@gmail.com>
References: <cover.1432332802.git.alex.suykov@gmail.com>
Message-ID: <fa0bed763359b6b38358e16ee82ef281878ec8c1.1432332802.git.alex.suykov@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
---
 package/neard/neard.mk      |  8 ++++++++
 package/neard/neard.service | 10 ++++++++++
 2 files changed, 18 insertions(+)
 create mode 100644 package/neard/neard.service

diff --git a/package/neard/neard.mk b/package/neard/neard.mk
index fc92421..dd18b0a 100644
--- a/package/neard/neard.mk
+++ b/package/neard/neard.mk
@@ -23,4 +23,12 @@ define NEARD_INSTALL_INIT_SYSV
 		$(TARGET_DIR)/etc/init.d/S53neard
 endef
 
+define NEARD_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 644 package/neard/neard.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/neard.service
+	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
+	ln -sf /usr/lib/systemd/system/neard.service \
+		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/neard.service
+endef
+
 $(eval $(autotools-package))
diff --git a/package/neard/neard.service b/package/neard/neard.service
new file mode 100644
index 0000000..978163d
--- /dev/null
+++ b/package/neard/neard.service
@@ -0,0 +1,10 @@
+[Unit]
+Description=Near-field communication daemon
+After=syslog.target
+
+[Service]
+ExecStart=/usr/libexec/nfc/neard -d '*'
+Restart=always
+
+[Install]
+WantedBy=multi-user.target
-- 
2.0.3
