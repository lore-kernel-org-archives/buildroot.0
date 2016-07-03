From: Nathaniel Roach <nroach44@gmail.com>
Date: Sun,  3 Jul 2016 16:18:59 +0800
Subject: [Buildroot] [PATCH v3] package/quagga: Add systemd.service file
Message-ID: <1467533939-26606-1-git-send-email-nroach44@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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

Signed-off-by: Nathaniel Roach <nroach44@gmail.com>
---
Changes v2 -> v3:
 - Remove invalid references to quagga.service (Arnout)
 - Check if the binary is executable before trying to start it
   (Arnout)
 - Remove PID file arguments and options (Arnout)
 - Add reload capability as the daemons do support it

Changes v1 -> v2:
 (As suggested by Arnout Vandecappelle)
 - Completely remove shim and use /usr/bin/env instead
 - Don't tell quagga to fork as systemd prefers it
 - Add comment to .service file about /usr/bin/env
 - Explain not enabling the service on build in patch
---
 package/quagga/quagga.mk       |  2 ++
 package/quagga/quagga at .service | 20 ++++++++++++++++++++
 2 files changed, 22 insertions(+)
 create mode 100644 package/quagga/quagga at .service

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
index 0000000..16acc30
--- /dev/null
+++ b/package/quagga/quagga at .service
@@ -0,0 +1,20 @@
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
+KillMode=mixed
+KillSignal=SIGINT
+Restart=on-failure
+RestartSec=1
+
+[Install]
+WantedBy=multi-user.target
+
-- 
2.8.1
