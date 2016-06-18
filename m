From: Nathaniel Roach <nroach44@gmail.com>
Date: Sun, 19 Jun 2016 01:02:00 +0800
Subject: [Buildroot] [PATCH 1/1] package/quagga: Add systemd.service file
	and helper script
Message-ID: <1466269320-23938-1-git-send-email-nroach44@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We use a template service file as all of the daemons use almost
identical arguments and generally appear the same to the init
system.

We "Wants=" zebra as that's the daemon for interfacing to the
kernel, and it's not required for the other daemons to work
but it's probably going to be used in nearly all setups.

We need the helper script as systemd doesn't like having the
instance (%i) in the path to the executable.

Signed-off-by: Nathaniel Roach <nroach44@gmail.com>
---
 package/quagga/quagga-shim     | 51 ++++++++++++++++++++++++++++++++++++++++++
 package/quagga/quagga.mk       |  6 +++++
 package/quagga/quagga at .service | 19 ++++++++++++++++
 3 files changed, 76 insertions(+)
 create mode 100644 package/quagga/quagga-shim
 create mode 100644 package/quagga/quagga at .service

diff --git a/package/quagga/quagga-shim b/package/quagga/quagga-shim
new file mode 100644
index 0000000..1687e7c
--- /dev/null
+++ b/package/quagga/quagga-shim
@@ -0,0 +1,51 @@
+#!/bin/sh
+#Shim for systemd's quagga at .service
+
+export QUAGGA_PATH="/usr/sbin"
+
+# Check if $1 is a valid quagga binary
+case $1 in
+  zebra)
+    export BINARY="zebra"
+    ;;
+
+  bgpd)
+    export BINARY="bgpd"
+    ;;
+
+  ospfd)
+    export BINARY="ospfd"
+    ;;
+
+  ospf6d)
+    export BINARY="bgpd"
+    ;;
+
+  ripd)
+    export BINARY="ripd"
+    ;;
+
+  ripngd)
+    export BINARY="ripngd"
+    ;;
+
+  pimd)
+    export BINARY="pimd"
+    ;;
+
+  *)
+    echo "Must be called with a valid Quagga daemon as the first argument"
+    exit 2
+    ;;
+
+esac
+
+# Check the binary exists
+if [ -e "$QUAGGA_PATH/$BINARY" ]; then
+  shift # Remove the first argument (binary name)
+  "$QUAGGA_PATH/$BINARY" "$@" # Run the daemon with the remaining arguments
+else
+  echo "Binary \"$BINARY\" not found in $QUAGGA_PATH"
+  exit 1
+fi
+
diff --git a/package/quagga/quagga.mk b/package/quagga/quagga.mk
index 22e90ad..5d9c292 100644
--- a/package/quagga/quagga.mk
+++ b/package/quagga/quagga.mk
@@ -75,6 +75,12 @@ endif
 define QUAGGA_INSTALL_INIT_SYSTEMD
 	$(INSTALL) -D -m 644 package/quagga/quagga_tmpfiles.conf \
 		$(TARGET_DIR)/usr/lib/tmpfiles.d/quagga.conf
+
+	$(INSTALL) -D -m 644 package/quagga/quagga at .service \
+		$(TARGET_DIR)/usr/lib/systemd/system/bandwidthd.service
+
+	$(INSTALL) -D -m 755 package/quagga/quagga-shim \
+		$(TARGET_DIR)/usr/sbin/quagga-shim
 endef
 
 $(eval $(autotools-package))
diff --git a/package/quagga/quagga at .service b/package/quagga/quagga at .service
new file mode 100644
index 0000000..3e98318
--- /dev/null
+++ b/package/quagga/quagga at .service
@@ -0,0 +1,19 @@
+[Unit]
+Description=Quagga %i routing daemon
+PartOf=quagga.service
+ReloadPropagatedFrom=quagga.service
+Wants=quagga at zebra.service
+
+[Service]
+PrivateTmp=true
+KillMode=mixed
+Type=forking
+EnvironmentFile=/etc/default/quagga-%i
+ExecStart=/usr/sbin/quagga-shim %i --daemon $OPTS -f /etc/quagga/%i.conf -i /var/run/quagga/%i.pid
+PIDFile=/var/run/quagga/%i.pid
+KillSignal=SIGINT
+Restart=on-failure
+RestartSec=1
+
+[Install]
+WantedBy=multi-user.target
-- 
2.8.1
