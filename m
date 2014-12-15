From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Mon, 15 Dec 2014 11:56:24 +0300
Subject: [Buildroot] [PATCH] system: add "askfirst shell" as an option for
	busybox init
Message-ID: <1418633784-7709-1-git-send-email-abrodkin@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Consider following cases:
 * Buildroot only builds rootfs that could be used on systems with
   different default serial ports (ttyS0, ttyS1, ttyAMA3 etc)
 * Target system has multiple serial ports and in kernel command
   line users/developers may select different serial ports as
   debug consoles

In both cases hard-coded with BR2_TARGET_GENERIC_GETTY tty will
only work for 1 particular serial port.

This change introduces an option to use whatever existing console.
For example console selected in kernel's command line will be used.

I'm not sure if the same thing works for SysVinit so marking it
dependent on Busybox init.

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
Cc: Anton Kolesov <akolesov@synopsys.com>
Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 system/Config.in            | 5 +++++
 system/skeleton/etc/inittab | 3 +++
 system/system.mk            | 9 +++++++++
 3 files changed, 17 insertions(+)

diff --git a/system/Config.in b/system/Config.in
index 39f27c7..0fa0dc6 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -311,6 +311,11 @@ config BR2_TARGET_GENERIC_GETTY_OPTIONS
 endmenu
 endif
 
+config BR2_TARGET_ASKFIRST_SHELL
+	bool "Start an \"askfirst\" shell on the console (whatever that may be)"
+	depends on BR2_INIT_BUSYBOX
+	depends on !BR2_TARGET_GENERIC_GETTY
+
 config BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW
 	bool "remount root filesystem read-write during boot"
 	default y
diff --git a/system/skeleton/etc/inittab b/system/skeleton/etc/inittab
index b1892c1..3a2514a 100644
--- a/system/skeleton/etc/inittab
+++ b/system/skeleton/etc/inittab
@@ -23,6 +23,9 @@ null::sysinit:/bin/hostname -F /etc/hostname
 # now run any rc scripts
 ::sysinit:/etc/init.d/rcS
 
+# Start an "askfirst" shell on the console (whatever that may be)
+#::askfirst:-/bin/sh # ASKFIRST_SHELL
+
 # Put a getty on the serial port
 #ttyS0::respawn:/sbin/getty -L ttyS0 115200 vt100 # GENERIC_SERIAL
 
diff --git a/system/system.mk b/system/system.mk
index e4a3160..f93e27a 100644
--- a/system/system.mk
+++ b/system/system.mk
@@ -76,6 +76,15 @@ endif
 TARGET_FINALIZE_HOOKS += SYSTEM_GETTY
 endif
 
+ifeq ($(BR2_TARGET_ASKFIRST_SHELL),y)
+# Add askfirst shell to busybox inittab
+define SYSTEM_ASKFIRST
+	$(SED) '/# ASKFIRST_SHELL$$/s~^.*#~::askfirst:-/bin/sh #~' \
+		$(TARGET_DIR)/etc/inittab
+endef
+TARGET_FINALIZE_HOOKS += SYSTEM_ASKFIRST
+endif
+
 ifeq ($(BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW),y)
 # Find commented line, if any, and remove leading '#'s
 define SYSTEM_REMOUNT_RW
-- 
2.1.0
