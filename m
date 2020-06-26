From: Marc Chalain <marc.chalain@gmail.com>
Date: Fri, 26 Jun 2020 13:29:19 +0200
Subject: [Buildroot] [PATCH 1/1] package/gpiod: add gpiod hardware handling
 daemon
Message-ID: <20200626112919.27946-1-marc.chalain@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gpiod is a little daemon to trig gpio event and launch scripts on level
changing events.
As udev or mdev, it reads rules files to attach scripts on events. and
launch the scripts with environment variables to describe the event.
It uses libgpiod to monitor the gpio and libconfig to read the rules.
It is tested on Raspberry Pi (0,3,4) with success.

Signed-off-by: Marc Chalain <marc.chalain@gmail.com>
---
 package/Config.in              |  1 +
 package/gpiod/Config.in        | 14 +++++++++
 package/gpiod/S20gpiod.in      | 56 ++++++++++++++++++++++++++++++++++
 package/gpiod/gpiod.hash       |  2 ++
 package/gpiod/gpiod.mk         | 52 +++++++++++++++++++++++++++++++
 package/gpiod/gpiod.service.in | 11 +++++++
 6 files changed, 136 insertions(+)
 create mode 100644 package/gpiod/Config.in
 create mode 100755 package/gpiod/S20gpiod.in
 create mode 100644 package/gpiod/gpiod.hash
 create mode 100644 package/gpiod/gpiod.mk
 create mode 100644 package/gpiod/gpiod.service.in

diff --git a/package/Config.in b/package/Config.in
index 6a34a895af..c86315630f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -458,6 +458,7 @@ endmenu
 	source "package/freescale-imx/Config.in"
 	source "package/fxload/Config.in"
 	source "package/gcnano-binaries/Config.in"
+	source "package/gpiod/Config.in"
 	source "package/gpm/Config.in"
 	source "package/gpsd/Config.in"
 	source "package/gptfdisk/Config.in"
diff --git a/package/gpiod/Config.in b/package/gpiod/Config.in
new file mode 100644
index 0000000000..e9ba5bdba3
--- /dev/null
+++ b/package/gpiod/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_GPIOD
+	bool "gpiod: gpio monitor daemon"
+	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_8 # libgpiod
+	select BR2_PACKAGE_LIBGPIOD
+	select BR2_PACKAGE_LIBCONFIG
+	help
+	  GPIOD monitors gpio events and start scripts.
+	  The daemon loads rules defining a gpio and
+	  the scripts to launch when the level of gpio changes.
+
+comment "gpiod needs a toolchain w/ kernel headers >= 4.8"
+	depends on !BR2_USE_MMU
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_8
diff --git a/package/gpiod/S20gpiod.in b/package/gpiod/S20gpiod.in
new file mode 100755
index 0000000000..2cc77af145
--- /dev/null
+++ b/package/gpiod/S20gpiod.in
@@ -0,0 +1,56 @@
+#!/bin/sh
+#
+# Starts gpiod.
+#
+
+DAEMON="gpiod"
+PIDFILE="/var/run/$DAEMON.pid"
+
+OPTIONS=""
+
+[ -r "/etc/default/$DAEMON" ] && . "/etc/default/$DAEMON"
+
+start() {
+	printf 'Starting %s: ' "$DAEMON"
+	OPTIONS="${OPTIONS} -p ${PIDFILE}"
+	OPTIONS="${OPTIONS} -D"
+	start-stop-daemon -S -q -x "@PREFIX@/sbin/$DAEMON" \
+		-- $OPTIONS
+	status=$?
+	if [ "$status" -eq 0 ]; then
+		echo "OK"
+	else
+		echo "FAIL"
+	fi
+	return "$status"
+}
+
+stop() {
+	printf 'Stopping %s: ' "$DAEMON"
+	start-stop-daemon -K -q -p "$PIDFILE"
+	status=$?
+	if [ "$status" -eq 0 ]; then
+		rm -f "$PIDFILE"
+		echo "OK"
+	else
+		echo "FAIL"
+	fi
+	return "$status"
+}
+
+restart() {
+	stop
+	sleep 1
+	start
+}
+
+case "$1" in
+	start|stop|restart)
+		"$1";;
+	reload)
+		# Restart, since there is no true "reload" feature.
+		restart;;
+	*)
+		echo "Usage: $0 {start|stop|restart|reload}"
+		exit 1
+esac
diff --git a/package/gpiod/gpiod.hash b/package/gpiod/gpiod.hash
new file mode 100644
index 0000000000..af0486f792
--- /dev/null
+++ b/package/gpiod/gpiod.hash
@@ -0,0 +1,2 @@
+sha256 d042c0394071ea8fc7464f02c2e599021d15a9891bd378677b000aa373436c89  gpiod-1.1.tar.gz
+sha256 dfba39760e099e2a64567309f0c6ceacaf9e6473bf79835fe0f8a8580651ff49  LICENSE
diff --git a/package/gpiod/gpiod.mk b/package/gpiod/gpiod.mk
new file mode 100644
index 0000000000..cef3a58fd5
--- /dev/null
+++ b/package/gpiod/gpiod.mk
@@ -0,0 +1,52 @@
+################################################################################
+#
+# gpiod
+#
+################################################################################
+
+GPIOD_VERSION = 1.1
+GPIOD_SITE = $(call github,mchalain,gpiod,$(GPIOD_VERSION))
+GPIOD_LICENSE = BSD
+GPIOD_LICENSE_FILES = LICENSE
+
+PREFIX=/usr
+SYSCONFDIR=/etc/gpiod
+
+GPIOD_MAKE_OPTS = \
+	prefix=$(PREFIX) \
+	sysconfdir=$(SYSCONFDIR)
+
+GPIOD_DEPENDENCIES = \
+	libgpiod \
+	libconfig
+
+define GPIOD_CONFIGURE_CMDS
+	$(TARGET_CONFIGURE_OPTS) $(TARGET_MAKE_ENV) \
+		$(MAKE1) -C $(@D) $(GPIOD_MAKE_OPTS) defconfig
+endef
+
+define GPIOD_BUILD_CMDS
+	$(TARGET_CONFIGURE_OPTS) $(TARGET_MAKE_ENV) \
+		$(MAKE1) -C $(@D) $(GPIOD_MAKE_OPTS)
+endef
+
+define GPIOD_INSTALL_TARGET_CMDS
+	$(INSTALL) -d -m 755 $(TARGET_DIR)$(SYSCONFDIR)/rules.d
+	$(MAKE) -C $(@D) $(GPIOD_MAKE_OPTS) \
+		DESTDIR="$(TARGET_DIR)" install
+endef
+
+define GPIOD_INSTALL_INIT_SYSTEMD
+	cp $(GPIOD_PKGDIR)/gpiod.service.in $(@D)/gpiod.service
+	$(SED) "s, at PREFIX@,$(PREFIX),g" $(@D)/gpiod.service
+	$(INSTALL) -D -m 644 $(@D)/gpiod.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/gpiod.service
+endef
+define GPIOD_INSTALL_INIT_SYSV
+	cp $(GPIOD_PKGDIR)/S20gpiod.in $(@D)/S20gpiod
+	$(SED) "s, at PREFIX@,$(PREFIX),g" $(@D)/S20gpiod
+	$(INSTALL) -D -m 755 $(@D)/S20gpiod \
+		$(TARGET_DIR)/etc/init.d/S20gpiod
+endef
+
+$(eval $(generic-package))
diff --git a/package/gpiod/gpiod.service.in b/package/gpiod/gpiod.service.in
new file mode 100644
index 0000000000..38a573ccf4
--- /dev/null
+++ b/package/gpiod/gpiod.service.in
@@ -0,0 +1,11 @@
+[Unit]
+Description=GPIO event handler daemon
+
+[Service]
+Type=forking
+ExecStart=@PREFIX@/sbin/gpiod -D -p /var/run/gpiod.pid
+ExecStop=@PREFIX@/sbin/gpiod -K -p /var/run/gpiod.pid
+Restart=always
+
+[Install]
+WantedBy=multi-user.target
-- 
2.17.1
