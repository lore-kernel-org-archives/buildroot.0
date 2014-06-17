From: Jeremy Kerr <jk@ozlabs.org>
Date: Tue, 17 Jun 2014 13:21:47 +0800
Subject: [Buildroot] [PATCH 6/7 v3] package/petitboot: Add petitboot,
 the userspace bootloader
In-Reply-To: <1402982507.183937.570365596242.0.gpush@pablo>
Message-ID: <1402982507.185942.882894195923.6.gpush@pablo>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This change adds the petitboot package, a bootloader that exists in
userspace, and uses the kexec facility to boot into a new kernel.

We add a little extra infrastructure to get things integrated into a
buildroot environment:

 - scripts to make kexec work with busybox init, for a clean shutdown

 - udev rules to get removable event notifications, and start the
   petitboot UI processes

 - startup scripts for the device-discovery process

Signed-off-by: Jeremy Kerr <jk@ozlabs.org>

---
 package/Config.in                            |    1 
 package/petitboot/Config.in                  |   21 +++++++
 package/petitboot/S14silence-console         |    9 +++
 package/petitboot/S15pb-discover             |   23 +++++++
 package/petitboot/kexec-restart              |    8 ++
 package/petitboot/petitboot-console-ui.rules |    5 +
 package/petitboot/petitboot.mk               |   57 +++++++++++++++++++
 package/petitboot/removable-event-poll.rules |    4 +
 8 files changed, 128 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index b0d4d47..a769d33 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1116,6 +1116,7 @@ endif
 	source "package/ncdu/Config.in"
 	source "package/numactl/Config.in"
 	source "package/nut/Config.in"
+	source "package/petitboot/Config.in"
 	source "package/powerpc-utils/Config.in"
 	source "package/polkit/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
diff --git a/package/petitboot/Config.in b/package/petitboot/Config.in
new file mode 100644
index 0000000..d1e1783
--- /dev/null
+++ b/package/petitboot/Config.in
@@ -0,0 +1,21 @@
+config BR2_PACKAGE_PETITBOOT
+	bool "petitboot"
+	# petitboot needs udev /dev management
+	depends on BR2_PACKAGE_HAS_UDEV
+	select BR2_PACKAGE_NCURSES
+	select BR2_PACKAGE_NCURSES_TARGET_PANEL
+	select BR2_PACKAGE_NCURSES_TARGET_FORM
+	select BR2_PACKAGE_NCURSES_TARGET_MENU
+	# run-time dependency only
+	select BR2_PACKAGE_KEXEC_LITE if !BR2_PACKAGE_KEXEC
+	# run-time dependency only
+	select BR2_PACKAGE_POWERPC_UTILS if BR2_powerpc || BR2_powerpc64
+	# run-time dependency only
+	select BR2_PACKAGE_IPRUTILS if BR2_powerpc || BR2_powerpc64
+	help
+	  Petitboot is a small kexec-based bootloader
+
+	  http://www.kernel.org/pub/linux/kernel/people/geoff/petitboot/petitboot.html
+
+comment "petitboot requires udev to be enabled"
+	depends on !BR2_PACKAGE_HAS_UDEV
diff --git a/package/petitboot/S14silence-console b/package/petitboot/S14silence-console
new file mode 100755
index 0000000..6570200
--- /dev/null
+++ b/package/petitboot/S14silence-console
@@ -0,0 +1,9 @@
+#!/bin/sh
+
+case "$1" in
+    start)
+        echo 0 0 7 0 > /proc/sys/kernel/printk
+        ;;
+esac
+
+exit 0
diff --git a/package/petitboot/S15pb-discover b/package/petitboot/S15pb-discover
new file mode 100755
index 0000000..ebdf944
--- /dev/null
+++ b/package/petitboot/S15pb-discover
@@ -0,0 +1,23 @@
+#!/bin/sh
+
+LOGFILE=/var/log/petitboot/pb-discover.log
+PIDFILE=/var/run/petitboot.pid
+
+case "$1" in
+    start)
+        ulimit -c unlimited
+        mkdir -p $(dirname $LOGFILE)
+        PATH=/usr/bin:/usr/sbin:/bin:/sbin pb-discover -l $LOGFILE &
+        echo $! > $PIDFILE
+        ;;
+    stop)
+        pid=$(cat $PIDFILE)
+        [ -n "$pid" ] && kill -TERM $pid
+        ;;
+    *)
+        echo "Usage: $0 {start|stop}"
+        exit 1
+        ;;
+esac
+
+exit 0
diff --git a/package/petitboot/kexec-restart b/package/petitboot/kexec-restart
new file mode 100755
index 0000000..0175e76
--- /dev/null
+++ b/package/petitboot/kexec-restart
@@ -0,0 +1,8 @@
+#!/bin/sh
+
+/usr/sbin/kexec -f -e
+
+while :
+do
+    sleep 1
+done
diff --git a/package/petitboot/petitboot-console-ui.rules b/package/petitboot/petitboot-console-ui.rules
new file mode 100644
index 0000000..7464856
--- /dev/null
+++ b/package/petitboot/petitboot-console-ui.rules
@@ -0,0 +1,5 @@
+
+# spawn a petitboot UI on common user-visible interface devices
+SUBSYSTEM=="tty", KERNEL=="hvc*", RUN+="/usr/libexec/petitboot/pb-console --getty --detach -- -n -i 0 $name vt100"
+SUBSYSTEM=="tty", KERNEL=="tty0", RUN+="/usr/libexec/petitboot/pb-console --getty --detach -- -n -i 0 $name vt100"
+SUBSYSTEM=="tty", KERNEL=="ttyS*", RUN+="/usr/libexec/petitboot/pb-console --getty --detach -- -n -i 0 $name vt100"
diff --git a/package/petitboot/petitboot.mk b/package/petitboot/petitboot.mk
new file mode 100644
index 0000000..1bbf522
--- /dev/null
+++ b/package/petitboot/petitboot.mk
@@ -0,0 +1,57 @@
+################################################################################
+#
+# petitboot
+#
+################################################################################
+
+PETITBOOT_VERSION = 509fca5ca2733a741521ae4332400d54d95ee073
+PETITBOOT_SITE = git://ozlabs.org/~jk/petitboot
+PETITBOOT_DEPENDENCIES = ncurses udev host-bison host-flex
+PETITBOOT_LICENSE = GPLv2
+PETITBOOT_LICENSE_FILES = COPYING
+
+PETITBOOT_AUTORECONF = YES
+PETITBOOT_AUTORECONF_OPT = -i
+PETITBOOT_CONF_OPT += --with-ncurses --without-twin-x11 --without-twin-fbdev \
+	      --localstatedir=/var \
+	      HOST_PROG_KEXEC=/usr/sbin/kexec \
+	      HOST_PROG_SHUTDOWN=/usr/libexec/petitboot/bb-kexec-reboot \
+	      $(if $(BR2_PACKAGE_BUSYBOX),--with-tftp=busybox)
+
+ifdef PETITBOOT_DEBUG
+PETITBOOT_CONF_OPT += --enable-debug
+endif
+
+ifeq ($(BR2_PACKAGE_NCURSES_WCHAR),y)
+PETITBOOT_CONF_OPT += --with-ncursesw MENU_LIB=-lmenuw FORM_LIB=-lformw
+endif
+
+PETITBOOT_PRE_CONFIGURE_HOOKS += PETITBOOT_PRE_CONFIGURE_BOOTSTRAP
+
+define PETITBOOT_POST_INSTALL
+	$(INSTALL) -D -m 0755 $(@D)/utils/bb-kexec-reboot \
+		$(TARGET_DIR)/usr/libexec/petitboot
+	$(INSTALL) -d -m 0755 $(TARGET_DIR)/etc/petitboot/boot.d
+	$(INSTALL) -D -m 0755 $(@D)/utils/hooks/01-create-default-dtb \
+		$(TARGET_DIR)/etc/petitboot/boot.d/
+	$(INSTALL) -D -m 0755 $(@D)/utils/hooks/20-set-stdout \
+		$(TARGET_DIR)/etc/petitboot/boot.d/
+
+	$(INSTALL) -D -m 0755 package/petitboot/S14silence-console \
+		$(TARGET_DIR)/etc/init.d/
+	$(INSTALL) -D -m 0755 package/petitboot/S15pb-discover \
+		$(TARGET_DIR)/etc/init.d/
+	$(INSTALL) -D -m 0755 package/petitboot/kexec-restart \
+		$(TARGET_DIR)/usr/sbin/
+	$(INSTALL) -D -m 0755 package/petitboot/petitboot-console-ui.rules \
+		$(TARGET_DIR)/etc/udev/rules.d/
+	$(INSTALL) -D -m 0755 package/petitboot/removable-event-poll.rules \
+		$(TARGET_DIR)/etc/udev/rules.d/
+
+	ln -sf /usr/sbin/pb-udhcpc \
+		$(TARGET_DIR)/usr/share/udhcpc/default.script.d/
+endef
+
+PETITBOOT_POST_INSTALL_TARGET_HOOKS += PETITBOOT_POST_INSTALL
+
+$(eval $(autotools-package))
diff --git a/package/petitboot/removable-event-poll.rules b/package/petitboot/removable-event-poll.rules
new file mode 100644
index 0000000..b736aef
--- /dev/null
+++ b/package/petitboot/removable-event-poll.rules
@@ -0,0 +1,4 @@
+
+# petitboot needs notification for media change events on removable devices,
+# which we only get if we've set the poll_msecs sysfs attribute.
+ACTION!="remove", ATTR{removable}=="1", ATTR{events_poll_msecs}="2000"
