From: Alex Suykov <alex.suykov@gmail.com>
Date: Sat, 23 May 2015 13:06:55 +0300
Subject: [Buildroot] [PATCH 23/38] pulseaudio: systemd support
In-Reply-To: <cover.1432332802.git.alex.suykov@gmail.com>
References: <cover.1432332802.git.alex.suykov@gmail.com>
Message-ID: <1dba7a22215e2848dd0bb10a11387c5ef8a3caa0.1432332802.git.alex.suykov@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
---
 package/pulseaudio/pulseaudio.mk      |  8 ++++++++
 package/pulseaudio/pulseaudio.service | 11 +++++++++++
 2 files changed, 19 insertions(+)
 create mode 100644 package/pulseaudio/pulseaudio.service

diff --git a/package/pulseaudio/pulseaudio.mk b/package/pulseaudio/pulseaudio.mk
index e68ca68..20e347c 100644
--- a/package/pulseaudio/pulseaudio.mk
+++ b/package/pulseaudio/pulseaudio.mk
@@ -123,6 +123,14 @@ define PULSEAUDIO_INSTALL_INIT_SYSV
 		$(TARGET_DIR)/etc/init.d/S50pulseaudio
 endef
 
+define PULSEAUDIO_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 644 package/pulseaudio/pulseaudio.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/pulseaudio.service
+	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
+	ln -sf /usr/lib/systemd/system/pulseaudio.service \
+		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/pulseaudio.service
+endef
+
 endif
 
 $(eval $(autotools-package))
diff --git a/package/pulseaudio/pulseaudio.service b/package/pulseaudio/pulseaudio.service
new file mode 100644
index 0000000..e1ad805
--- /dev/null
+++ b/package/pulseaudio/pulseaudio.service
@@ -0,0 +1,11 @@
+[Unit]
+Description=Sound Service
+After=syslog.target
+
+[Service]
+UMask=077
+ExecStart=/usr/bin/pulseaudio --system --daemonize=no
+Restart=always
+
+[Install]
+WantedBy=multi-user.target
-- 
2.0.3
