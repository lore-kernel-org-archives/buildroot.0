From: Nathaniel Roach <nroach44@gmail.com>
Date: Sun, 11 Jan 2015 13:31:36 +0800
Subject: [Buildroot] [PATCH] bind: Add systemd unit file and install it to
	run at startup.
In-Reply-To: <1420954296-27101-1-git-send-email-nroach44@gmail.com>
References: <1420954296-27101-1-git-send-email-nroach44@gmail.com>
Message-ID: <1420954296-27101-3-git-send-email-nroach44@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The unit file is taken from debian, but tested working.
We'll call it named.service to match the sysV initscript.

Signed-off-by: Nathaniel Roach <nroach44@gmail.com>
---
 package/bind/bind.mk       |  9 +++++++++
 package/bind/named.service | 12 ++++++++++++
 2 files changed, 21 insertions(+)
 create mode 100644 package/bind/named.service

diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index 983fa20..a98a4c4 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -82,6 +82,15 @@ define BIND_INSTALL_INIT_SYSV
 	$(INSTALL) -m 0755 -D package/bind/S81named \
 		$(TARGET_DIR)/etc/init.d/S81named
 endef
+define BIND_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 644 package/bind/named.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/named.service
+
+	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
+
+	ln -sf /usr/lib/systemd/system/named.service \
+		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/named.service
+endef
 else
 BIND_POST_INSTALL_TARGET_HOOKS += BIND_TARGET_REMOVE_SERVER
 endif
diff --git a/package/bind/named.service b/package/bind/named.service
new file mode 100644
index 0000000..be0158b
--- /dev/null
+++ b/package/bind/named.service
@@ -0,0 +1,12 @@
+[Unit]
+Description=BIND Domain Name Server
+Documentation=man:named(8)
+After=network.target
+
+[Service]
+ExecStart=/usr/sbin/named -f -u named
+ExecReload=/usr/sbin/rndc reload
+ExecStop=/usr/sbin/rndc stop
+
+[Install]
+WantedBy=multi-user.target
-- 
2.1.4
