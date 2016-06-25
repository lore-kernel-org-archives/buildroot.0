From: Nathaniel Roach <nroach44@gmail.com>
Date: Sun, 26 Jun 2016 01:02:08 +0800
Subject: [Buildroot] [PATCH] package/quagga: Add systemd.service file
Message-ID: <1466874128-22828-1-git-send-email-nroach44@gmail.com>
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
Changes v1 -> v2:
 (As suggested by Arnout Vandecappelle)
 - Completely remove shim and use /usr/bin/env instead
 - Don't tell quagga to fork as systemd prefers it
 - Add comment to .service file about /usr/bin/env
 - Explain not enabling the service on build in patch

---
 package/quagga/quagga.mk       |  3 +++
 package/quagga/quagga at .service | 20 ++++++++++++++++++++
 2 files changed, 23 insertions(+)
 create mode 100644 package/quagga/quagga at .service

diff --git a/package/quagga/quagga.mk b/package/quagga/quagga.mk
index 22e90ad..5b5623f 100644
--- a/package/quagga/quagga.mk
+++ b/package/quagga/quagga.mk
@@ -75,6 +75,9 @@ endif
 define QUAGGA_INSTALL_INIT_SYSTEMD
 	$(INSTALL) -D -m 644 package/quagga/quagga_tmpfiles.conf \
 		$(TARGET_DIR)/usr/lib/tmpfiles.d/quagga.conf
+
+	$(INSTALL) -D -m 644 package/quagga/quagga at .service \
+		$(TARGET_DIR)/usr/lib/systemd/system/quagga at .service
 endef
 
 $(eval $(autotools-package))
diff --git a/package/quagga/quagga at .service b/package/quagga/quagga at .service
new file mode 100644
index 0000000..b17af89
--- /dev/null
+++ b/package/quagga/quagga at .service
@@ -0,0 +1,20 @@
+[Unit]
+Description=Quagga %i routing daemon
+PartOf=quagga.service
+ReloadPropagatedFrom=quagga.service
+Wants=quagga at zebra.service
+
+[Service]
+PrivateTmp=true
+KillMode=mixed
+Type=simple
+EnvironmentFile=/etc/default/quagga-%i
+# Systemd doesn't like having %i in the executable path.
+ExecStart=/usr/bin/env /usr/sbin/%i $OPTS -f /etc/quagga/%i.conf -i /var/run/quagga/%i.pid
+PIDFile=/var/run/quagga/%i.pid
+KillSignal=SIGINT
+Restart=on-failure
+RestartSec=1
+
+[Install]
+WantedBy=multi-user.target
-- 
2.8.1
