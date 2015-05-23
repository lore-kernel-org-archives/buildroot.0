From: Alex Suykov <alex.suykov@gmail.com>
Date: Sat, 23 May 2015 13:06:09 +0300
Subject: [Buildroot] [PATCH 19/38] olsr: systemd support
In-Reply-To: <cover.1432332802.git.alex.suykov@gmail.com>
References: <cover.1432332802.git.alex.suykov@gmail.com>
Message-ID: <ac31cdd39a0dbb6b172575dc356a93e81389e080.1432332802.git.alex.suykov@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
---
 package/olsr/olsr.mk      |  8 ++++++++
 package/olsr/olsr.service | 10 ++++++++++
 2 files changed, 18 insertions(+)
 create mode 100644 package/olsr/olsr.service

diff --git a/package/olsr/olsr.mk b/package/olsr/olsr.mk
index 7e28b1e..f07770a 100644
--- a/package/olsr/olsr.mk
+++ b/package/olsr/olsr.mk
@@ -40,4 +40,12 @@ define OLSR_INSTALL_INIT_SYSV
 		$(TARGET_DIR)/etc/init.d/S50olsr
 endef
 
+define OLSR_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 644 package/olsr/olsr.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/olsr.service
+	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
+	ln -sf /usr/lib/systemd/system/olsr.service \
+		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/olsr.service
+endef
+
 $(eval $(generic-package))
diff --git a/package/olsr/olsr.service b/package/olsr/olsr.service
new file mode 100644
index 0000000..9ec8930
--- /dev/null
+++ b/package/olsr/olsr.service
@@ -0,0 +1,10 @@
+[Unit]
+Description=Ad-hoc wireless mesh routing daemon
+After=network.target
+
+[Service]
+ExecStart=/usr/sbin/olsrd -nofork
+Restart=always
+
+[Install]
+WantedBy=multi-user.target
-- 
2.0.3
