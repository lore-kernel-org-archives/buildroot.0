From: Angelo Compagnucci <angelo@amarulasolutions.com>
Date: Sat, 30 Dec 2017 11:02:07 +0100
Subject: [Buildroot] [PATCH v2 7/7] package/mender: new package
In-Reply-To: <1514628127-15938-1-git-send-email-angelo@amarulasolutions.com>
References: <1514628127-15938-1-git-send-email-angelo@amarulasolutions.com>
Message-ID: <1514628127-15938-8-git-send-email-angelo@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Angelo Compagnucci <angelo.compagnucci@gmail.com>

This patch add mender, an open source over-the-air (OTA) software
updater for embedded Linux devices.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
 package/Config.in                        |  1 +
 package/mender/Config.in                 | 14 +++++++++
 package/mender/mender-device-identity    | 52 ++++++++++++++++++++++++++++++++
 package/mender/mender-inventory-hostinfo | 21 +++++++++++++
 package/mender/mender-inventory-network  | 47 +++++++++++++++++++++++++++++
 package/mender/mender.conf               | 14 +++++++++
 package/mender/mender.hash               |  2 ++
 package/mender/mender.mk                 | 31 +++++++++++++++++++
 package/mender/mender.service            | 15 +++++++++
 package/mender/server.crt                | 22 ++++++++++++++
 package/mender/tenant.conf               |  0
 11 files changed, 219 insertions(+)
 create mode 100644 package/mender/Config.in
 create mode 100644 package/mender/mender-device-identity
 create mode 100644 package/mender/mender-inventory-hostinfo
 create mode 100644 package/mender/mender-inventory-network
 create mode 100644 package/mender/mender.conf
 create mode 100644 package/mender/mender.hash
 create mode 100644 package/mender/mender.mk
 create mode 100644 package/mender/mender.service
 create mode 100644 package/mender/server.crt
 create mode 100644 package/mender/tenant.conf

diff --git a/package/Config.in b/package/Config.in
index bd39a37..5104fc0 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1941,6 +1941,7 @@ menu "System tools"
 	source "package/kvmtool/Config.in"
 	source "package/libostree/Config.in"
 	source "package/lxc/Config.in"
+	source "package/mender/Config.in"
 	source "package/monit/Config.in"
 	source "package/ncdu/Config.in"
 	source "package/numactl/Config.in"
diff --git a/package/mender/Config.in b/package/mender/Config.in
new file mode 100644
index 0000000..201128a
--- /dev/null
+++ b/package/mender/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_MENDER
+	bool "mender"
+	depends on BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_HOST_GO_CGO_LINKING_SUPPORTS
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_INIT_SYSTEMD
+	
+	help
+	  Mender is an open source over-the-air (OTA) software updater for
+	  embedded Linux devices. Mender comprises a client running at the
+	  embedded device, as well as a server that manages deployments
+	  across many devices.
+
+	  https://github.com/mendersoftware/mender
diff --git a/package/mender/mender-device-identity b/package/mender/mender-device-identity
new file mode 100644
index 0000000..d87f843
--- /dev/null
+++ b/package/mender/mender-device-identity
@@ -0,0 +1,52 @@
+#!/bin/sh
+
+# Example script called by Mender agent to collect device identity data. The
+# script needs to be located at
+# $(datadir)/mender/identity/mender-device-identity path for the agent to find
+# it. The script shall exit with non-0 status on errors. In this case the agent
+# will discard any output the script may have produced.
+#
+# The script shall output identity data in <key>=<value> format, one
+# entry per line. Example
+#
+# $ ./mender-device-identity
+# mac=de:ad:ca:fe:00:01
+# cpuid=1112233
+#
+# The example script collects the MAC address of a network interface with the
+# type ARPHRD_ETHER and it will pick the interface with the lowest ifindex
+# number if there are multiple interfaces with that type. The identity data is
+# output in the following format:
+#
+# mac=00:01:02:03:04:05
+#
+
+set -ue
+
+SCN=/sys/class/net
+min=65535
+arphrd_ether=1
+ifdev=
+
+# find iface with lowest ifindex, skip non ARPHRD_ETHER types (lo, sit ...)
+for dev in $SCN/*; do
+    iftype=$(cat $dev/type)
+    if [ $iftype -ne $arphrd_ether ]; then
+        continue
+    fi
+
+    idx=$(cat $dev/ifindex)
+    if [ $idx -lt $min ]; then
+        min=$idx
+        ifdev=$dev
+    fi
+done
+
+if [ -z "$ifdev" ]; then
+    echo "no suitable interfaces found" >&2
+    exit 1
+else
+    echo "using interface $ifdev" >&2
+    # grab MAC address
+    echo "mac=$(cat $ifdev/address)"
+fi
diff --git a/package/mender/mender-inventory-hostinfo b/package/mender/mender-inventory-hostinfo
new file mode 100644
index 0000000..cf508fd
--- /dev/null
+++ b/package/mender/mender-inventory-hostinfo
@@ -0,0 +1,21 @@
+#!/bin/sh
+#
+# The example script collects information about current host
+#
+
+set -ue
+
+LC_ALL=C
+export LC_ALL
+
+grep 'model name' /proc/cpuinfo | uniq | awk -F': ' '
+     // { printf("cpu_model=%s\n", $2);}
+'
+echo "kernel=$(cat /proc/version)"
+
+cat /proc/meminfo | awk '
+/MemTotal/ {printf("mem_total_kB=%d\n", $2)}
+'
+
+echo "hostname=$(cat /etc/hostname)"
+
diff --git a/package/mender/mender-inventory-network b/package/mender/mender-inventory-network
new file mode 100644
index 0000000..b017c4e
--- /dev/null
+++ b/package/mender/mender-inventory-network
@@ -0,0 +1,47 @@
+#!/bin/sh
+#
+# Example script called by Mender agent to collect inventory data for a
+# particular devce. The script needs to be located in $(datadir)/mender and its
+# name shall start with `mender-inventory-` prefix. The script shall exit with
+# non-0 status on errors. In this case the agent will discard any output the
+# script may have produced.
+#
+# The script shall output inventory data in <key>=<value> format, one entry per
+# line. Entries appearing multiple times will be joined in a list under the same
+# key.
+#
+# $ ./mender-inventory-network
+# mac_br-fbfdad18c33c=02:42:7e:74:96:85
+# network_interfaces=br-fbfdad18c33c
+# ipv4_br-fbfdad18c33c=172.21.0.1/16
+# mac_enp0s25=de:ad:be:ef:bb:05
+# network_interfaces=enp0s25
+# ipv4_enp0s25=123.22.0.197/16
+# ipv4_enp0s25=10.20.20.105/16
+# ipv6_enp0s25=fe80::2aad:beff:feef:bb05/64
+#
+#
+# The example script collects the list of network interfaces, as well as
+# ethernet and IP addresses of each of the interfaces.
+#
+
+set -ue
+
+SCN=/sys/class/net
+min=65535
+ifdev=
+
+# find iface with lowest ifindex, except loopback
+for devpath in $SCN/*; do
+    dev=$(basename $devpath)
+    if [ $dev = "lo" ]; then
+        continue
+    fi
+    echo "mac_$dev=$(cat $devpath/address)"
+    echo "network_interfaces=$dev"
+
+    ip addr show dev $dev | awk -v dev=$dev '
+       /inet / { printf("ipv4_%s=%s\n", dev, $2) }
+       /inet6 / {printf("ipv6_%s=%s\n", dev, $2) }
+    '
+done
diff --git a/package/mender/mender.conf b/package/mender/mender.conf
new file mode 100644
index 0000000..a5c7c54
--- /dev/null
+++ b/package/mender/mender.conf
@@ -0,0 +1,14 @@
+{
+  "ClientProtocol": "http",
+  "HttpsClient": {
+    "Certificate": "",
+    "Key": ""
+  },
+  "RootfsPartA": "@MENDER_ROOTFS_PART_A@",
+  "RootfsPartB": "@MENDER_ROOTFS_PART_B@",
+  "UpdatePollIntervalSeconds": @MENDER_UPDATE_POLL_INTERVAL_SECONDS@,
+  "InventoryPollIntervalSeconds": @MENDER_INVENTORY_POLL_INTERVAL_SECONDS@,
+  "RetryPollIntervalSeconds": @MENDER_RETRY_POLL_INTERVAL_SECONDS@,
+  "ServerURL": "@MENDER_SERVER_URL@",
+  "ServerCertificate": "@MENDER_CERT_LOCATION@"
+}
diff --git a/package/mender/mender.hash b/package/mender/mender.hash
new file mode 100644
index 0000000..574b675
--- /dev/null
+++ b/package/mender/mender.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256 a2fd103185431946c3455fef0c08909d13413a09638463266e5b6889df8163c5 mender-1.2.1.tar.gz
diff --git a/package/mender/mender.mk b/package/mender/mender.mk
new file mode 100644
index 0000000..40d270c
--- /dev/null
+++ b/package/mender/mender.mk
@@ -0,0 +1,31 @@
+################################################################################
+#
+# mender
+#
+################################################################################
+
+MENDER_VERSION = 1.2.1
+MENDER_SOURCE = mender-$(MENDER_VERSION).tar.gz
+MENDER_SITE = $(call github,mendersoftware,mender,$(MENDER_VERSION))
+
+define MENDER_INSTALL_TARGET_CMDS
+	$(INSTALL) -dm 0755 $(TARGET_DIR)/etc/mender/
+	$(INSTALL) -dm 0755 $(TARGET_DIR)/var/share/mender/identity/
+	$(INSTALL) -dm 0755 $(TARGET_DIR)/var/share/mender/inventory/
+	$(INSTALL) -D -m 0644 package/mender/mender.conf \
+		$(TARGET_DIR)/etc/mender/mender.conf
+	$(INSTALL) -D -m 0644 package/mender/tenant.conf \
+		$(TARGET_DIR)/etc/mender/mender.conf
+	$(INSTALL) -D -m 0644 package/mender/server.crt \
+		$(TARGET_DIR)/etc/mender/server.crt
+	$(INSTALL) -D -m 0755 package/mender/mender-device-identity \
+		$(TARGET_DIR)/var/share/mender/identity/mender-device-identity
+	$(INSTALL) -D -m 0755 package/mender/mender-inventory-network \
+		$(TARGET_DIR)/var/share/mender/inventory/mender-inventory-network
+	$(INSTALL) -D -m 0755 package/mender/mender-inventory-hostinfo \
+		$(TARGET_DIR)/var/share/mender/inventory/mender-inventory-hostinfo
+	$(INSTALL) -D -m 0644 package/mender/mender.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/mender.service
+endef
+
+$(eval $(golang-package))
diff --git a/package/mender/mender.service b/package/mender/mender.service
new file mode 100644
index 0000000..ec77fbc
--- /dev/null
+++ b/package/mender/mender.service
@@ -0,0 +1,15 @@
+[Unit]
+Description=Mender OTA update service
+After=systemd-resolved.service
+
+[Service]
+Type=idle
+User=root
+Group=root
+ExecStartPre=/bin/mkdir -p -m 0700 /data/mender
+ExecStartPre=/bin/ln -sf /etc/mender/tenant.conf /var/lib/mender/authtentoken
+ExecStart=/usr/bin/mender -daemon
+Restart=on-abort
+
+[Install]
+WantedBy=multi-user.target
diff --git a/package/mender/server.crt b/package/mender/server.crt
new file mode 100644
index 0000000..79a57e1
--- /dev/null
+++ b/package/mender/server.crt
@@ -0,0 +1,22 @@
+-----BEGIN CERTIFICATE-----
+MIIBfTCCASOgAwIBAgIJAJOS76a0qWuZMAoGCCqGSM49BAMCMBsxGTAXBgNVBAMM
+EGRvY2tlci5tZW5kZXIuaW8wHhcNMTYxMjE0MTk1MjQ2WhcNMjYxMjEyMTk1MjQ2
+WjAbMRkwFwYDVQQDDBBkb2NrZXIubWVuZGVyLmlvMFkwEwYHKoZIzj0CAQYIKoZI
+zj0DAQcDQgAE7AVYis6MWGPGQYU1/tlLEnskRifDIhvkRb8Y4nQPekRkLkiBYYT3
+iJ46wHrnejbHaLstU9GRdKWOmOuU6HGdO6NQME4wHQYDVR0OBBYEFGOIU4q++Vz8
+9HuT1jg9V+wFeJcyMB8GA1UdIwQYMBaAFGOIU4q++Vz89HuT1jg9V+wFeJcyMAwG
+A1UdEwQFMAMBAf8wCgYIKoZIzj0EAwIDSAAwRQIhAPLnEeWPNeN7eDCEYRitBfyO
+X1yf2kzOm4ohBE5GY9gzAiBCq7HOSkzQDkelmQCCCpGXf/UwYNgQJjSoeGfk0j1a
+TQ==
+-----END CERTIFICATE-----
+-----BEGIN CERTIFICATE-----
+MIIBhDCCASmgAwIBAgIJALQrf4QDot4IMAoGCCqGSM49BAMCMB4xHDAaBgNVBAMM
+E3MzLmRvY2tlci5tZW5kZXIuaW8wHhcNMTYxMjE0MTk1MjQ2WhcNMjYxMjEyMTk1
+MjQ2WjAeMRwwGgYDVQQDDBNzMy5kb2NrZXIubWVuZGVyLmlvMFkwEwYHKoZIzj0C
+AQYIKoZIzj0DAQcDQgAEEc/Y3T+l3DvINePkpvVZORMIdHVs29jgsl48ia7z/NRX
+HlKtKxVGJyFN5Y7sBZeLgBYH3F4Bo3KfmxI7ad0tI6NQME4wHQYDVR0OBBYEFIUm
+cip00QZYpe4ULflbGNJan+Y9MB8GA1UdIwQYMBaAFIUmcip00QZYpe4ULflbGNJa
+n+Y9MAwGA1UdEwQFMAMBAf8wCgYIKoZIzj0EAwIDSQAwRgIhANHij9VZBDHOUPaC
+pFiagnWnYL2HBR72W1xTKQbrLLTXAiEAvpwA4HzSnGmLd3010+jqQuMRHArN5WaX
+h0fy7niBbIQ=
+-----END CERTIFICATE-----
diff --git a/package/mender/tenant.conf b/package/mender/tenant.conf
new file mode 100644
index 0000000..e69de29
-- 
2.7.4
