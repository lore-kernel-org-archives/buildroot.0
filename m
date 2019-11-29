From: aduskett at gmail.com <aduskett@gmail.com>
Date: Fri, 29 Nov 2019 13:59:12 -0800
Subject: [Buildroot] [PATCH/next v5 3/6] package/polkit: add systemd service
 file.
In-Reply-To: <20191129215915.2549083-1-aduskett@gmail.com>
References: <20191129215915.2549083-1-aduskett@gmail.com>
Message-ID: <20191129215915.2549083-3-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

- Add polkit.service for systemd based systems.
- Add a polkitd user upon which /usr/lib/polkit-1/polkitd relies.
- Set appropriate directory permissions to allow the polkitd user to
  access rules and actions.
- Set appropriate default attributes for the pkexec binary.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
Changes v1 -> v5:
  - Add a [install] section to the servie file (J?r?my)

 package/polkit/polkit.mk      | 18 ++++++++++++++++++
 package/polkit/polkit.service | 10 ++++++++++
 2 files changed, 28 insertions(+)
 create mode 100644 package/polkit/polkit.service

diff --git a/package/polkit/polkit.mk b/package/polkit/polkit.mk
index 7791d23d19..b440cd2f1c 100644
--- a/package/polkit/polkit.mk
+++ b/package/polkit/polkit.mk
@@ -26,4 +26,22 @@ else
 POLKIT_CONF_OPTS += --with-authfw=shadow
 endif
 
+define POLKIT_USERS
+	polkitd -1 polkitd -1 * - - - Polkit Daemon
+endef
+
+define POLKIT_PERMISSIONS
+	/etc/polkit-1 r 750 root polkitd - - - - -
+	/usr/share/polkit-1 r 750 root polkitd - - - - -
+	/usr/bin/pkexec f 4755 root root - - - - -
+endef
+
+define POLKIT_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 644 package/polkit/polkit.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/polkit.service
+	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
+	ln -sf ../../../../usr/lib/systemd/system/polkit.service \
+		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/polkit.service
+endef
+
 $(eval $(autotools-package))
diff --git a/package/polkit/polkit.service b/package/polkit/polkit.service
new file mode 100644
index 0000000000..977b4acc5f
--- /dev/null
+++ b/package/polkit/polkit.service
@@ -0,0 +1,10 @@
+[Unit]
+Description=Authorization Manager
+
+[Service]
+Type=dbus
+BusName=org.freedesktop.PolicyKit1
+ExecStart=/usr/lib/polkit-1/polkitd --no-debug
+
+[Install]
+WantedBy=multi-user.target
-- 
2.23.0
