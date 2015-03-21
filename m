From: Alex Suykov <alex.suykov@gmail.com>
Date: Sat, 21 Mar 2015 20:32:01 +0200
Subject: [Buildroot] [RFC 09/11] am33x-cm3: new init infrastructure
In-Reply-To: <cover.1426960081.git.alex.suykov@gmail.com>
References: <cover.1426960081.git.alex.suykov@gmail.com>
Message-ID: <3dcfb5ed25f4c2fe9a6df6679189a234ca47db3a.1426960081.git.alex.suykov@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Non-daemon entry.
---
 package/am33x-cm3/S93-am335x-pm-firmware-load | 6 ------
 package/am33x-cm3/am33x-cm3.mk                | 5 -----
 package/am33x-cm3/am33x-cm3.run               | 6 ++++++
 3 files changed, 6 insertions(+), 11 deletions(-)
 delete mode 100755 package/am33x-cm3/S93-am335x-pm-firmware-load
 create mode 100644 package/am33x-cm3/am33x-cm3.run

diff --git a/package/am33x-cm3/S93-am335x-pm-firmware-load b/package/am33x-cm3/S93-am335x-pm-firmware-load
deleted file mode 100755
index 56c17b3..0000000
--- a/package/am33x-cm3/S93-am335x-pm-firmware-load
+++ /dev/null
@@ -1,6 +0,0 @@
-#!/bin/sh
-
-# Load the PM CM3 firmware
-echo 1 > /sys/devices/ocp.2/44d00000.wkup_m3/firmware/am335x-pm-firmware.bin/loading
-cat /lib/firmware/am335x-pm-firmware.bin > /sys/devices/ocp.2/44d00000.wkup_m3/firmware/am335x-pm-firmware.bin/data
-echo 0 > /sys/devices/ocp.2/44d00000.wkup_m3/firmware/am335x-pm-firmware.bin/loading
diff --git a/package/am33x-cm3/am33x-cm3.mk b/package/am33x-cm3/am33x-cm3.mk
index 01cb9a0..b00f6bb 100644
--- a/package/am33x-cm3/am33x-cm3.mk
+++ b/package/am33x-cm3/am33x-cm3.mk
@@ -23,9 +23,4 @@ define AM33X_CM3_INSTALL_TARGET_CMDS
 		$(TARGET_DIR)/lib/firmware/am335x-pm-firmware.bin
 endef
 
-define AM33X_CM3_INSTALL_INIT_SYSV
-	$(INSTALL) -m 0755 -D package/am33x-cm3/S93-am335x-pm-firmware-load \
-		$(TARGET_DIR)/etc/init.d/S93-am335x-pm-firmware-load
-endef
-
 $(eval $(generic-package))
diff --git a/package/am33x-cm3/am33x-cm3.run b/package/am33x-cm3/am33x-cm3.run
new file mode 100644
index 0000000..68629a4
--- /dev/null
+++ b/package/am33x-cm3/am33x-cm3.run
@@ -0,0 +1,5 @@
+## Load the PM CM3 firmware
+
+echo 1 > /sys/devices/ocp.2/44d00000.wkup_m3/firmware/am335x-pm-firmware.bin/loading
+cat /lib/firmware/am335x-pm-firmware.bin > /sys/devices/ocp.2/44d00000.wkup_m3/firmware/am335x-pm-firmware.bin/data
+echo 0 > /sys/devices/ocp.2/44d00000.wkup_m3/firmware/am335x-pm-firmware.bin/loading
-- 
2.0.3
