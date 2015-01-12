From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 12 Jan 2015 22:22:20 +0100
Subject: [Buildroot] [git commit] bind: Add systemd unit file and install it
	to run at startup.
Message-ID: <20150112212246.0CEA6804FF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c45c3ed8adc0b717036951729c7155f75d29db8a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The unit file is taken from debian, but tested working.
We'll call it named.service to match the sysV initscript.

Signed-off-by: Nathaniel Roach <nroach44@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/bind/bind.mk       |    9 +++++++++
 package/bind/named.service |   12 ++++++++++++
 2 files changed, 21 insertions(+), 0 deletions(-)

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
