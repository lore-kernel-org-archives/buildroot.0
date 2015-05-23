From: Alex Suykov <alex.suykov@gmail.com>
Date: Sat, 23 May 2015 13:04:58 +0300
Subject: [Buildroot] [PATCH 13/38] lirc-tools: systemd support
In-Reply-To: <cover.1432332802.git.alex.suykov@gmail.com>
References: <cover.1432332802.git.alex.suykov@gmail.com>
Message-ID: <bf18460f473cb1531b92812c8f93b387d6a8939c.1432332802.git.alex.suykov@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
---
 package/lirc-tools/lirc-tools.mk |  8 ++++++++
 package/lirc-tools/lircd.service | 10 ++++++++++
 2 files changed, 18 insertions(+)
 create mode 100644 package/lirc-tools/lircd.service

diff --git a/package/lirc-tools/lirc-tools.mk b/package/lirc-tools/lirc-tools.mk
index 6837042..a9edf2b 100644
--- a/package/lirc-tools/lirc-tools.mk
+++ b/package/lirc-tools/lirc-tools.mk
@@ -21,4 +21,12 @@ define LIRC_TOOLS_INSTALL_INIT_SYSV
 		$(TARGET_DIR)/etc/init.d/S25lircd
 endef
 
+define LIRC_TOOLS_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 644 package/lirc-tools/lircd.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/lircd.service
+	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
+	ln -sf /usr/lib/systemd/system/lircd.service \
+		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/lircd.service
+endef
+
 $(eval $(autotools-package))
diff --git a/package/lirc-tools/lircd.service b/package/lirc-tools/lircd.service
new file mode 100644
index 0000000..f16ebc8
--- /dev/null
+++ b/package/lirc-tools/lircd.service
@@ -0,0 +1,10 @@
+[Unit]
+Description=Linux infrared remote control daemon
+After=syslog.target
+
+[Service]
+ExecStart=/usr/sbin/lircd -n -O /etc/lirc/lirc_options.conf
+Restart=always
+
+[Install]
+WantedBy=multi-user.target
-- 
2.0.3
