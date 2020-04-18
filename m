From: aduskett at gmail.com <aduskett@gmail.com>
Date: Fri, 17 Apr 2020 19:58:13 -0700
Subject: [Buildroot] [PATCH 1/4] package/polkit: install service file
Message-ID: <20200418025816.1642936-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

The default installed service file is missing a target, which causes preset-all
to not enable the service.

Add the service file to package/polkit with the addition of:

[Install]
WantedBy=multi-user.target

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 package/polkit/polkit.mk      |  6 ++++++
 package/polkit/polkit.service | 12 ++++++++++++
 2 files changed, 18 insertions(+)
 create mode 100644 package/polkit/polkit.service

diff --git a/package/polkit/polkit.mk b/package/polkit/polkit.mk
index 8572d8b9ba..ee0b3674de 100644
--- a/package/polkit/polkit.mk
+++ b/package/polkit/polkit.mk
@@ -43,4 +43,10 @@ define POLKIT_PERMISSIONS
 	/usr/bin/pkexec f 4755 root root - - - - -
 endef
 
+define POLKIT_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 644 $(POLKIT_PKGDIR)/polkit.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/polkit.service
+
+endef
+
 $(eval $(autotools-package))
diff --git a/package/polkit/polkit.service b/package/polkit/polkit.service
new file mode 100644
index 0000000000..a69b28cd93
--- /dev/null
+++ b/package/polkit/polkit.service
@@ -0,0 +1,12 @@
+[Unit]
+
+Description=Authorization Manager
+Documentation=man:polkit(8)
+
+[Service]
+Type=dbus
+BusName=org.freedesktop.PolicyKit1
+ExecStart=/usr/lib/polkit-1/polkitd --no-debug
+
+[Install]
+WantedBy=multi-user.target
-- 
2.25.2
