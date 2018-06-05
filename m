From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 5 Jun 2018 21:43:42 +0200
Subject: [Buildroot] [git commit] package/mender: new package
Message-ID: <20180605194224.2CEBB811CC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6ed0e6ba235c3fd8a915e2f5777a4bfc69a5fcff
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch add mender, an open source over-the-air (OTA) software
updater for embedded Linux devices.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
[Thomas:
 - add entry to DEVELOPERS file.
 - drop dependency on systemd, since there is really no build
   dependency, it's just that the init script integration is missing.
 - add Config.in comment about the thread dependency
 - don't override install commands, otherwise the mender binary is not
   installed, and instead use a post install target hook.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                               |  1 +
 package/Config.in                        |  1 +
 package/mender/Config.in                 | 17 +++++++++++
 package/mender/mender-device-identity    | 52 ++++++++++++++++++++++++++++++++
 package/mender/mender-inventory-hostinfo | 21 +++++++++++++
 package/mender/mender-inventory-network  | 47 +++++++++++++++++++++++++++++
 package/mender/mender.conf               | 14 +++++++++
 package/mender/mender.hash               |  2 ++
 package/mender/mender.mk                 | 36 ++++++++++++++++++++++
 package/mender/mender.service            | 15 +++++++++
 package/mender/server.crt                | 22 ++++++++++++++
 package/mender/tenant.conf               |  0
 12 files changed, 228 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index e5d5a26e1f..32fa08f5c3 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -145,6 +145,7 @@ F:	package/libunwind/
 N:	Angelo Compagnucci <angelo.compagnucci@gmail.com>
 F:	package/corkscrew/
 F:	package/i2c-tools/
+F:	package/mender/
 F:	package/mono/
 F:	package/mono-gtksharp3/
 F:	package/monolite/
diff --git a/package/Config.in b/package/Config.in
index 9640ab2d4e..fcabed4fde 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2015,6 +2015,7 @@ menu "System tools"
 	source "package/kvmtool/Config.in"
 	source "package/libostree/Config.in"
 	source "package/lxc/Config.in"
+	source "package/mender/Config.in"
 	source "package/monit/Config.in"
 	source "package/ncdu/Config.in"
 	source "package/numactl/Config.in"
diff --git a/package/mender/Config.in b/package/mender/Config.in
new file mode 100644
index 0000000000..61a20cfd8a
--- /dev/null
+++ b/package/mender/Config.in
@@ -0,0 +1,17 @@
+config BR2_PACKAGE_MENDER
+	bool "mender"
+	depends on BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_HOST_GO_CGO_LINKING_SUPPORTS
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	help
+	  Mender is an open source over-the-air (OTA) software updater for
+	  embedded Linux devices. Mender comprises a client running at the
+	  embedded device, as well as a server that manages deployments
+	  across many devices.
+
+	  https://github.com/mendersoftware/mender
+
+comment "mender needs a toolchain w/ threads"
+	depends on BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_HOST_GO_CGO_LINKING_SUPPORTS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/mender/mender-device-identity b/package/mender/mender-device-identity
new file mode 100644
index 0000000000..d87f843357
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
index 0000000000..cf508fdf88
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
index 0000000000..b017c4ea14
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
index 0000000000..a5c7c545c3
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
index 0000000000..30a04fad7a
--- /dev/null
+++ b/package/mender/mender.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256 267fa73ad472b034248ee298593b5c52ea0b105fd73c91febb3587280c61bee2 mender-1.4.0.tar.gz
diff --git a/package/mender/mender.mk b/package/mender/mender.mk
new file mode 100644
index 0000000000..ab0078e0cc
--- /dev/null
+++ b/package/mender/mender.mk
@@ -0,0 +1,36 @@
+################################################################################
+#
+# mender
+#
+################################################################################
+
+MENDER_VERSION = 1.4.0
+MENDER_SOURCE = mender-$(MENDER_VERSION).tar.gz
+MENDER_SITE = $(call github,mendersoftware,mender,$(MENDER_VERSION))
+
+define MENDER_INSTALL_CONFIG_FILES
+	$(INSTALL) -D -m 0644 package/mender/mender.conf \
+		$(TARGET_DIR)/etc/mender/mender.conf
+	$(INSTALL) -D -m 0644 package/mender/tenant.conf \
+		$(TARGET_DIR)/etc/mender/tenant.conf
+	$(INSTALL) -D -m 0644 package/mender/server.crt \
+		$(TARGET_DIR)/etc/mender/server.crt
+	$(INSTALL) -D -m 0755 package/mender/mender-device-identity \
+		$(TARGET_DIR)/var/share/mender/identity/mender-device-identity
+	$(INSTALL) -D -m 0755 package/mender/mender-inventory-network \
+		$(TARGET_DIR)/var/share/mender/inventory/mender-inventory-network
+	$(INSTALL) -D -m 0755 package/mender/mender-inventory-hostinfo \
+		$(TARGET_DIR)/var/share/mender/inventory/mender-inventory-hostinfo
+endef
+
+MENDER_POST_INSTALL_TARGET_HOOKS += MENDER_INSTALL_CONFIG_FILES
+
+define MENDER_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 0644 package/mender/mender.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/mender.service
+	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
+	ln -fs ../../../../usr/lib/systemd/system/mender.service \
+		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/mender.service
+endef
+
+$(eval $(golang-package))
diff --git a/package/mender/mender.service b/package/mender/mender.service
new file mode 100644
index 0000000000..ec77fbc46c
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
index 0000000000..79a57e15e7
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
index 0000000000..e69de29bb2
