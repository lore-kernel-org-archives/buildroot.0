From: mchalain <marc.chalain@gmail.com>
Date: Tue, 16 Jun 2020 18:42:00 +0200
Subject: [Buildroot] [PATCH 1/1] package/gpiod: add gpiod hardware handling
 daemon
Message-ID: <20200616164200.6399-1-marc.chalain@gmail.com>
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
It is tested on Raspberry Pi (0,3,4) with success, during few months.

Signed-off-by: mchalain <marc.chalain@gmail.com>
---
 package/Config.in             |  1 +
 package/gpiod/Config.in       | 14 ++++++++++
 package/gpiod/S20gpiod        | 41 +++++++++++++++++++++++++++
 package/gpiod/gpiod.hash      |  1 +
 package/gpiod/gpiod.mk        | 52 +++++++++++++++++++++++++++++++++++
 package/gpiod/gpiod_defconfig |  0
 6 files changed, 109 insertions(+)
 create mode 100644 package/gpiod/Config.in
 create mode 100755 package/gpiod/S20gpiod
 create mode 100644 package/gpiod/gpiod.hash
 create mode 100644 package/gpiod/gpiod.mk
 create mode 100644 package/gpiod/gpiod_defconfig

diff --git a/package/Config.in b/package/Config.in
index d32eadab88..d529442fe7 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -457,6 +457,7 @@ endmenu
 	source "package/freescale-imx/Config.in"
 	source "package/fxload/Config.in"
 	source "package/gcnano-binaries/Config.in"
+	source "package/gpiod/Config.in"
 	source "package/gpm/Config.in"
 	source "package/gpsd/Config.in"
 	source "package/gptfdisk/Config.in"
diff --git a/package/gpiod/Config.in b/package/gpiod/Config.in
new file mode 100644
index 0000000000..e9d5dc47f9
--- /dev/null
+++ b/package/gpiod/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_GPIOD
+	bool "gpiod: gpio monitor daemon"
+	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_8
+	select BR2_PACKAGE_LIBGPIOD
+	select BR2_PACKAGE_LIBCONFIG
+	help
+	  GPIOD monitors gpio events and start scripts.
+	  The daemon loads rules defining a gpio and
+	  the scripts to launch when the level of gpio changes.
+
+comment "gpiod: needs a toolchain w/ support of MMU and headers > 4.8"
+	depends on !BR2_USE_MMU
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_8
diff --git a/package/gpiod/S20gpiod b/package/gpiod/S20gpiod
new file mode 100755
index 0000000000..1a912c8e43
--- /dev/null
+++ b/package/gpiod/S20gpiod
@@ -0,0 +1,41 @@
+#!/bin/sh
+#
+# Starts gpiod.
+#
+
+RUNDIR=/var/run
+SBINDIR=/usr/sbin
+BINDIR=/usr/bin
+
+start() {
+	printf "Starting gpiod: "
+	start-stop-daemon -S -q --exec ${SBINDIR}/gpiod -- -D -p ${RUNDIR}/gpiod.pid
+	[ $? == 0 ] && echo "OK" || echo "FAILED"
+}
+stop() {
+	printf "Stopping gpiod: "
+	${SBINDIR}/gpiod -K -p ${RUNDIR}/gpiod.pid
+	echo "OK"
+}
+restart() {
+	stop
+	start
+}
+
+case "$1" in
+  start)
+	start
+	;;
+  stop)
+	stop
+	;;
+  restart|reload)
+	restart
+	;;
+  *)
+	echo "Usage: $0 {start|stop|restart}"
+	exit 1
+esac
+
+exit $?
+
diff --git a/package/gpiod/gpiod.hash b/package/gpiod/gpiod.hash
new file mode 100644
index 0000000000..4a9c10297c
--- /dev/null
+++ b/package/gpiod/gpiod.hash
@@ -0,0 +1 @@
+sha256 f7c12fafcfb02515ae34d9502b4121d7980606fb53b57bee35143bd985bfdddc  gpiod-1.0.tar.gz
diff --git a/package/gpiod/gpiod.mk b/package/gpiod/gpiod.mk
new file mode 100644
index 0000000000..ed99f1d3be
--- /dev/null
+++ b/package/gpiod/gpiod.mk
@@ -0,0 +1,52 @@
+################################################################################
+#
+# gpiod
+#
+################################################################################
+
+GPIOD_VERSION = 1.0
+GPIOD_SITE = $(call github,mchalain,gpiod,$(GPIOD_VERSION))
+
+GPIOD_MAKE_OPTS+=prefix=/usr
+GPIOD_MAKE_OPTS+=sysconfdir=/etc/gpiod
+#GPIOD_MAKE_OPTS+=DEBUG=y
+
+GPIOD_KCONFIG_FILE=$(GPIOD_PKGDIR)/gpiod_defconfig
+GPIOD_KCONFIG_EDITORS = config
+GPIOD_KCONFIG_OPTS = $(GPIOD_MAKE_OPTS)
+
+GPIOD_DEPENDENCIES += libgpiod
+GPIOD_DEPENDENCIES += libconfig
+
+define GPIOD_LIBCONFIG_OPTS
+	$(call KCONFIG_ENABLE_OPT,LIBCONFIG,$(@D)/.config)
+endef
+
+define GPIOD_KCONFIG_FIXUP_CMDS
+	$(GPIOD_LIBCONFIG_OPTS)
+endef
+
+define GPIOD_BUILD_CMDS
+	$(TARGET_CONFIGURE_OPTS) $(TARGET_MAKE_ENV) \
+		$(MAKE1) -C $(@D) $(GPIOD_MAKE_OPTS)
+endef
+
+define GPIOD_INSTALL_TARGET_CMDS
+	$(INSTALL) -d -m 755 $(TARGET_DIR)/etc/gpiod/rules.d
+	$(MAKE) -C $(@D) $(GPIOD_MAKE_OPTS) \
+		DESTDIR="$(TARGET_DIR)" DEVINSTALL=n install
+endef
+
+define GPIOD_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 644 $(GPIOD_PKGDIR)/gpiod.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/gpiod.service
+	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
+	ln -fs ../../../../usr/lib/systemd/system/gpiod.service \
+		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/gpiod.service
+endef
+define GPIOD_INSTALL_INIT_SYSV
+	$(INSTALL) -D -m 755 $(GPIOD_PKGDIR)/S20gpiod \
+		$(TARGET_DIR)/etc/init.d/S20gpiod
+endef
+
+$(eval $(kconfig-package))
diff --git a/package/gpiod/gpiod_defconfig b/package/gpiod/gpiod_defconfig
new file mode 100644
index 0000000000..e69de29bb2
-- 
2.17.1
