From: Mirza Krak <mirza.krak@northern.tech>
Date: Wed, 15 Aug 2018 01:13:31 +0200
Subject: [Buildroot] [PATCH 2/8] package/mender: update install of config
 files
In-Reply-To: <20180814231337.19114-1-mirza.krak@northern.tech>
References: <20180814231337.19114-1-mirza.krak@northern.tech>
Message-ID: <20180814231337.19114-3-mirza.krak@northern.tech>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Summary of changes:

- identity and inventory scripts are part of Mender source repo,
  hence remove the local files and install from source directory.

- tenant.conf is not used by Mender, remove it

These are required to run Mender in managed mode (daemon).

- Create /data and /uboot directories.
- Symlink /var/lib/mender to /data
- Added /etc/mender/script/version file

Signed-off-by: Mirza Krak <mirza.krak@northern.tech>
---
 package/mender/mender-device-identity    | 52 ------------------------
 package/mender/mender-inventory-hostinfo | 21 ----------
 package/mender/mender-inventory-network  | 47 ---------------------
 package/mender/mender.mk                 | 22 ++++++----
 package/mender/mender.service            |  1 -
 package/mender/tenant.conf               |  0
 6 files changed, 14 insertions(+), 129 deletions(-)
 delete mode 100644 package/mender/mender-device-identity
 delete mode 100644 package/mender/mender-inventory-hostinfo
 delete mode 100644 package/mender/mender-inventory-network
 delete mode 100644 package/mender/tenant.conf

diff --git a/package/mender/mender-device-identity b/package/mender/mender-device-identity
deleted file mode 100644
index d87f843357..0000000000
--- a/package/mender/mender-device-identity
+++ /dev/null
@@ -1,52 +0,0 @@
-#!/bin/sh
-
-# Example script called by Mender agent to collect device identity data. The
-# script needs to be located at
-# $(datadir)/mender/identity/mender-device-identity path for the agent to find
-# it. The script shall exit with non-0 status on errors. In this case the agent
-# will discard any output the script may have produced.
-#
-# The script shall output identity data in <key>=<value> format, one
-# entry per line. Example
-#
-# $ ./mender-device-identity
-# mac=de:ad:ca:fe:00:01
-# cpuid=1112233
-#
-# The example script collects the MAC address of a network interface with the
-# type ARPHRD_ETHER and it will pick the interface with the lowest ifindex
-# number if there are multiple interfaces with that type. The identity data is
-# output in the following format:
-#
-# mac=00:01:02:03:04:05
-#
-
-set -ue
-
-SCN=/sys/class/net
-min=65535
-arphrd_ether=1
-ifdev=
-
-# find iface with lowest ifindex, skip non ARPHRD_ETHER types (lo, sit ...)
-for dev in $SCN/*; do
-    iftype=$(cat $dev/type)
-    if [ $iftype -ne $arphrd_ether ]; then
-        continue
-    fi
-
-    idx=$(cat $dev/ifindex)
-    if [ $idx -lt $min ]; then
-        min=$idx
-        ifdev=$dev
-    fi
-done
-
-if [ -z "$ifdev" ]; then
-    echo "no suitable interfaces found" >&2
-    exit 1
-else
-    echo "using interface $ifdev" >&2
-    # grab MAC address
-    echo "mac=$(cat $ifdev/address)"
-fi
diff --git a/package/mender/mender-inventory-hostinfo b/package/mender/mender-inventory-hostinfo
deleted file mode 100644
index cf508fdf88..0000000000
--- a/package/mender/mender-inventory-hostinfo
+++ /dev/null
@@ -1,21 +0,0 @@
-#!/bin/sh
-#
-# The example script collects information about current host
-#
-
-set -ue
-
-LC_ALL=C
-export LC_ALL
-
-grep 'model name' /proc/cpuinfo | uniq | awk -F': ' '
-     // { printf("cpu_model=%s\n", $2);}
-'
-echo "kernel=$(cat /proc/version)"
-
-cat /proc/meminfo | awk '
-/MemTotal/ {printf("mem_total_kB=%d\n", $2)}
-'
-
-echo "hostname=$(cat /etc/hostname)"
-
diff --git a/package/mender/mender-inventory-network b/package/mender/mender-inventory-network
deleted file mode 100644
index b017c4ea14..0000000000
--- a/package/mender/mender-inventory-network
+++ /dev/null
@@ -1,47 +0,0 @@
-#!/bin/sh
-#
-# Example script called by Mender agent to collect inventory data for a
-# particular devce. The script needs to be located in $(datadir)/mender and its
-# name shall start with `mender-inventory-` prefix. The script shall exit with
-# non-0 status on errors. In this case the agent will discard any output the
-# script may have produced.
-#
-# The script shall output inventory data in <key>=<value> format, one entry per
-# line. Entries appearing multiple times will be joined in a list under the same
-# key.
-#
-# $ ./mender-inventory-network
-# mac_br-fbfdad18c33c=02:42:7e:74:96:85
-# network_interfaces=br-fbfdad18c33c
-# ipv4_br-fbfdad18c33c=172.21.0.1/16
-# mac_enp0s25=de:ad:be:ef:bb:05
-# network_interfaces=enp0s25
-# ipv4_enp0s25=123.22.0.197/16
-# ipv4_enp0s25=10.20.20.105/16
-# ipv6_enp0s25=fe80::2aad:beff:feef:bb05/64
-#
-#
-# The example script collects the list of network interfaces, as well as
-# ethernet and IP addresses of each of the interfaces.
-#
-
-set -ue
-
-SCN=/sys/class/net
-min=65535
-ifdev=
-
-# find iface with lowest ifindex, except loopback
-for devpath in $SCN/*; do
-    dev=$(basename $devpath)
-    if [ $dev = "lo" ]; then
-        continue
-    fi
-    echo "mac_$dev=$(cat $devpath/address)"
-    echo "network_interfaces=$dev"
-
-    ip addr show dev $dev | awk -v dev=$dev '
-       /inet / { printf("ipv4_%s=%s\n", dev, $2) }
-       /inet6 / {printf("ipv6_%s=%s\n", dev, $2) }
-    '
-done
diff --git a/package/mender/mender.mk b/package/mender/mender.mk
index 0dad93be28..b2df70256a 100644
--- a/package/mender/mender.mk
+++ b/package/mender/mender.mk
@@ -10,18 +10,24 @@ MENDER_LICENSE = Apache-2.0 & BSD-2-Clause & BSD-3-Clause & MIT & OLDAP-2.8
 MENDER_LICENSE_FILES = LICENSE LIC_FILES_CHKSUM.sha256
 
 define MENDER_INSTALL_CONFIG_FILES
+	$(INSTALL) -d -m 755 $(TARGET_DIR)/data/mender
+	$(INSTALL) -d -m 755 $(TARGET_DIR)/data/uboot
+	$(INSTALL) -d -m 755 $(TARGET_DIR)/uboot
+	$(INSTALL) -d -m 755 $(TARGET_DIR)/usr/share/mender/inventory
+
+	$(INSTALL) -d -m 755 $(TARGET_DIR)/etc/mender/scripts
+	echo -n "2" > $(TARGET_DIR)/etc/mender/scripts/version
+
 	$(INSTALL) -D -m 0644 package/mender/mender.conf \
 		$(TARGET_DIR)/etc/mender/mender.conf
-	$(INSTALL) -D -m 0644 package/mender/tenant.conf \
-		$(TARGET_DIR)/etc/mender/tenant.conf
 	$(INSTALL) -D -m 0644 package/mender/server.crt \
 		$(TARGET_DIR)/etc/mender/server.crt
-	$(INSTALL) -D -m 0755 package/mender/mender-device-identity \
-		$(TARGET_DIR)/var/share/mender/identity/mender-device-identity
-	$(INSTALL) -D -m 0755 package/mender/mender-inventory-network \
-		$(TARGET_DIR)/var/share/mender/inventory/mender-inventory-network
-	$(INSTALL) -D -m 0755 package/mender/mender-inventory-hostinfo \
-		$(TARGET_DIR)/var/share/mender/inventory/mender-inventory-hostinfo
+	$(INSTALL) -D -m 0755 $(@D)/support/mender-device-identity \
+		$(TARGET_DIR)/usr/share/mender/identity/mender-device-identity
+	$(INSTALL) -D -m 0755 $(@D)/support/mender-inventory-* \
+		$(TARGET_DIR)/usr/share/mender/inventory
+
+	ln -sf /data/mender $(TARGET_DIR)/var/lib/mender
 endef
 
 MENDER_POST_INSTALL_TARGET_HOOKS += MENDER_INSTALL_CONFIG_FILES
diff --git a/package/mender/mender.service b/package/mender/mender.service
index ec77fbc46c..9ede55acb5 100644
--- a/package/mender/mender.service
+++ b/package/mender/mender.service
@@ -7,7 +7,6 @@ Type=idle
 User=root
 Group=root
 ExecStartPre=/bin/mkdir -p -m 0700 /data/mender
-ExecStartPre=/bin/ln -sf /etc/mender/tenant.conf /var/lib/mender/authtentoken
 ExecStart=/usr/bin/mender -daemon
 Restart=on-abort
 
diff --git a/package/mender/tenant.conf b/package/mender/tenant.conf
deleted file mode 100644
index e69de29bb2..0000000000
-- 
2.18.0
