From: Alex Suykov <alex.suykov@gmail.com>
Date: Sat, 23 May 2015 13:03:35 +0300
Subject: [Buildroot] [PATCH 08/38] gpsd: systemd support
In-Reply-To: <cover.1432332802.git.alex.suykov@gmail.com>
References: <cover.1432332802.git.alex.suykov@gmail.com>
Message-ID: <99b199604291189d9c5aa2448b721b28601497b6.1432332802.git.alex.suykov@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Just like with the sysv script, non-empty DEVICES value
must be substituted in the installed file.

Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
---
 package/gpsd/gpsd.mk      | 10 ++++++++++
 package/gpsd/gpsd.service | 10 ++++++++++
 2 files changed, 20 insertions(+)
 create mode 100644 package/gpsd/gpsd.service

diff --git a/package/gpsd/gpsd.mk b/package/gpsd/gpsd.mk
index 1bf4415..953da66 100644
--- a/package/gpsd/gpsd.mk
+++ b/package/gpsd/gpsd.mk
@@ -208,6 +208,16 @@ define GPSD_INSTALL_INIT_SYSV
 	$(SED) 's,^DEVICES=.*,DEVICES=$(BR2_PACKAGE_GPSD_DEVICES),' $(TARGET_DIR)/etc/init.d/S50gpsd
 endef
 
+define GPSD_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 644 package/gpsd/gpsd.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/gpsd.service
+	$(SED) 's at DEVICES@$(BR2_PACKAGE_GPSD_DEVICES)@' \
+		$(TARGET_DIR)/usr/lib/systemd/system/gpsd.service
+	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
+	ln -sf /usr/lib/systemd/system/gpsd.service \
+		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/gpsd.service
+endef
+
 define GPSD_INSTALL_STAGING_CMDS
 	(cd $(@D); \
 		$(GPSD_SCONS_ENV) \
diff --git a/package/gpsd/gpsd.service b/package/gpsd/gpsd.service
new file mode 100644
index 0000000..4608b99
--- /dev/null
+++ b/package/gpsd/gpsd.service
@@ -0,0 +1,10 @@
+[Unit]
+Description=GPS daemon
+After=syslog.target network.target
+
+[Service]
+ExecStart=/usr/sbin/gpsd -N DEVICES
+Restart=always
+
+[Install]
+WantedBy=multi-user.target
-- 
2.0.3
