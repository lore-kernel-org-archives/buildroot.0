From: Alex Suykov <alex.suykov@gmail.com>
Date: Sat, 23 May 2015 13:05:27 +0300
Subject: [Buildroot] [PATCH 16/38] netatalk: systemd support
In-Reply-To: <cover.1432332802.git.alex.suykov@gmail.com>
References: <cover.1432332802.git.alex.suykov@gmail.com>
Message-ID: <65f17c0367cfd65343d8529bca5be912b0484ed8.1432332802.git.alex.suykov@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
---
 package/netatalk/netatalk.mk      |  8 ++++++++
 package/netatalk/netatalk.service | 10 ++++++++++
 2 files changed, 18 insertions(+)
 create mode 100644 package/netatalk/netatalk.service

diff --git a/package/netatalk/netatalk.mk b/package/netatalk/netatalk.mk
index a882b3c..c1fe440 100644
--- a/package/netatalk/netatalk.mk
+++ b/package/netatalk/netatalk.mk
@@ -57,4 +57,12 @@ define NETATALK_INSTALL_INIT_SYSV
 		$(TARGET_DIR)/etc/init.d/S50netatalk
 endef
 
+define NETATALK_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 644 package/netatalk/netatalk.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/netatalk.service
+	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
+	ln -sf /usr/lib/systemd/system/netatalk.service \
+		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/netatalk.service
+endef
+
 $(eval $(autotools-package))
diff --git a/package/netatalk/netatalk.service b/package/netatalk/netatalk.service
new file mode 100644
index 0000000..e31bfd1
--- /dev/null
+++ b/package/netatalk/netatalk.service
@@ -0,0 +1,10 @@
+[Unit]
+Description=Netatalk
+After=network.target
+
+[Service]
+ExecStart=/usr/sbin/netatalk -d
+Restart=always
+
+[Install]
+WantedBy=multi-user.target
-- 
2.0.3
