From: Mirza Krak <mirza.krak@northern.tech>
Date: Mon, 20 Aug 2018 15:09:09 +0200
Subject: [Buildroot] [[PATCH v2 09/14] package/mender: use inventory and
 identity script from upstream source
In-Reply-To: <20180820130914.22377-1-mirza.krak@northern.tech>
References: <20180820130914.22377-1-mirza.krak@northern.tech>
Message-ID: <20180820130914.22377-10-mirza.krak@northern.tech>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

These files are part of Mender sources and no point in keeping duplicate
files locally.

Signed-off-by: Mirza Krak <mirza.krak@northern.tech>
---

Changes in V2:
- New patch, split out from package/mender: update install of config files

 package/mender/mender-device-identity    | 52 --------------------------------
 package/mender/mender-inventory-hostinfo | 21 -------------
 package/mender/mender-inventory-network  | 47 -----------------------------
 package/mender/mender.mk                 | 10 +++---
 4 files changed, 5 insertions(+), 125 deletions(-)
 delete mode 100644 package/mender/mender-device-identity
 delete mode 100644 package/mender/mender-inventory-hostinfo
 delete mode 100644 package/mender/mender-inventory-network

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
index 24122cafc5..1f54862077 100644
--- a/package/mender/mender.mk
+++ b/package/mender/mender.mk
@@ -21,12 +21,12 @@ define MENDER_INSTALL_CONFIG_FILES
 	$(INSTALL) -D -m 0644 package/mender/server.crt \
 		$(TARGET_DIR)/etc/mender/server.crt

-	$(INSTALL) -D -m 0755 package/mender/mender-device-identity \
+	$(INSTALL) -D -m 0755 $(@D)/support/mender-device-identity \
 		$(TARGET_DIR)/usr/share/mender/identity/mender-device-identity
-	$(INSTALL) -D -m 0755 package/mender/mender-inventory-network \
-		$(TARGET_DIR)/usr/share/mender/inventory/mender-inventory-network
-	$(INSTALL) -D -m 0755 package/mender/mender-inventory-hostinfo \
-		$(TARGET_DIR)/usr/share/mender/inventory/mender-inventory-hostinfo
+	$(foreach f,hostinfo network, \
+		$(INSTALL) -D -m 0755 $(@D)/support/mender-inventory-$(f) \
+			$(TARGET_DIR)/usr/share/mender/inventory/mender-inventory-$(f)
+	)

 	ln -sf /data/mender $(TARGET_DIR)/var/lib/mender
 endef
--
2.11.0
