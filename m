From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 3 Jul 2016 16:04:34 +0200
Subject: [Buildroot] [git commit] package/quagga: Add systemd.service file
Message-ID: <20160703140503.4EDD980AC7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=649cf99821d4418319aaf0c897ab43cab4dc902f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use a template service file as all of the daemons use almost
identical arguments and generally appear the same to the init
system.

We "Wants=" zebra as that's the daemon for interfacing to the
kernel, and it's not required for the other daemons to work
but it's probably going to be used in nearly all setups.

/usr/bin/env is needed as systemd doesn't allow the instance
variable (%i) in the executable path.

We don't enable these services by default as this would require
creating configuration and /etc/default files. (And is easily
achieved with an FS overlay)

[Peter: remove killmode/killsignal/restartsec as suggested by Maxime]
Signed-off-by: Nathaniel Roach <nroach44@gmail.com>
Reviewed-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/quagga/quagga.mk       |  2 ++
 package/quagga/quagga at .service | 17 +++++++++++++++++
 2 files changed, 19 insertions(+)

diff --git a/package/quagga/quagga.mk b/package/quagga/quagga.mk
index 22e90ad..1bbc72d 100644
--- a/package/quagga/quagga.mk
+++ b/package/quagga/quagga.mk
@@ -75,6 +75,8 @@ endif
 define QUAGGA_INSTALL_INIT_SYSTEMD
 	$(INSTALL) -D -m 644 package/quagga/quagga_tmpfiles.conf \
 		$(TARGET_DIR)/usr/lib/tmpfiles.d/quagga.conf
+	$(INSTALL) -D -m 644 package/quagga/quagga at .service \
+		$(TARGET_DIR)/usr/lib/systemd/system/quagga at .service
 endef
 
 $(eval $(autotools-package))
diff --git a/package/quagga/quagga at .service b/package/quagga/quagga at .service
new file mode 100644
index 0000000..797af32
--- /dev/null
+++ b/package/quagga/quagga at .service
@@ -0,0 +1,17 @@
+[Unit]
+Description=Quagga %i routing daemon
+ConditionFileIsExecutable=/usr/sbin/%i
+Wants=quagga at zebra.service
+
+[Service]
+Type=simple
+EnvironmentFile=/etc/default/quagga-%i
+PrivateTmp=true
+# Systemd doesn't like having %i in the executable path.
+ExecStart=/usr/bin/env /usr/sbin/%i $OPTS -f /etc/quagga/%i.conf
+ExecReload=/bin/kill -HUP $MAINPID
+Restart=on-failure
+
+[Install]
+WantedBy=multi-user.target
+
