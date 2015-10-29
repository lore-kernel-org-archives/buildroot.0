From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Date: Thu, 29 Oct 2015 10:00:18 +0100
Subject: [Buildroot] [PATCH v3 2/2] skeleton: optionally wait for network
	interfaces to appear
In-Reply-To: <1446109218-11057-1-git-send-email-jezz@sysmic.org>
References: <1446109218-11057-1-git-send-email-jezz@sysmic.org>
Message-ID: <1446109218-11057-3-git-send-email-jezz@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch has same purpose than 49964858f45d2243c513e6d362e992ad89ec7a45:

  On some machines, the network interface is slow to appear. For example,
  on the Raspberry Pi, the network interface eth0 is an ethernet-over-USB,
  and our standard boot process is too fast, so our network startup script
  is called before the USB bus is compeltely enumerated, thus it can't
  configure eth0.

  Closes #8116.

However, wait-delay hook is enabled only if wait-delay property appears
in /etc/network/interfaces. This patch enable it automaticaly when
interface is configured through DHCP at bootup. But, if user choose
to write /etc/network/interface himself, he have to explicitly
set wait-delay.

Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
---
 package/skeleton/skeleton.mk                       |  1 +
 system/skeleton/etc/network/if-pre-up.d/wait_iface | 21 +++++++++++++++++++++
 2 files changed, 22 insertions(+)
 create mode 100755 system/skeleton/etc/network/if-pre-up.d/wait_iface

diff --git a/package/skeleton/skeleton.mk b/package/skeleton/skeleton.mk
index 920d3b4..d1b797d 100644
--- a/package/skeleton/skeleton.mk
+++ b/package/skeleton/skeleton.mk
@@ -89,6 +89,7 @@ define SET_NETWORK_DHCP
 		echo ;                                               \
 		echo "auto $(NETWORK_DHCP_IFACE)";                   \
 		echo "iface $(NETWORK_DHCP_IFACE) inet dhcp";        \
+		echo "	wait-delay 15";                              \
 	) >> $(TARGET_DIR)/etc/network/interfaces
 endef
 endif
diff --git a/system/skeleton/etc/network/if-pre-up.d/wait_iface b/system/skeleton/etc/network/if-pre-up.d/wait_iface
new file mode 100755
index 0000000..ebccff2
--- /dev/null
+++ b/system/skeleton/etc/network/if-pre-up.d/wait_iface
@@ -0,0 +1,21 @@
+#!/bin/sh
+
+# In case we have a slow-to-appear interface (e.g. eth-over-USB),
+# and we need to configure it, wait until it appears, but not too
+# long either. IF_WAIT_DELAY is in seconds.
+
+if [ "${IF_WAIT_DELAY}" -a ! -e "/sys/class/net/${IFACE}" ]; then
+    printf "Waiting for interface %s to appear" "${IFACE}"
+    while [ ${IF_WAIT_DELAY} -gt 0 ]; do
+        if [ -e "/sys/class/net/${IFACE}" ]; then
+            printf "\n"
+            exit 0
+        fi
+        sleep 1
+        printf "."
+        : $((IF_WAIT_DELAY -= 1))
+    done
+    printf " timeout!\n"
+    exit 1
+fi
+
-- 
2.1.4
