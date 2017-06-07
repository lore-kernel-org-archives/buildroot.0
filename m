From: Petr Kulhavy <brain@jikos.cz>
Date: Wed,  7 Jun 2017 20:44:29 +0200
Subject: [Buildroot] [PATCH v6 1/1] linuxptp: new package
Message-ID: <1496861069-6958-1-git-send-email-brain@jikos.cz>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add the Linux PTP Project package.
http://linuxptp.sourceforge.net/

The SysV and systemd init scripts start the daemon in slave-only mode on eth0
and synchronize the system clock to PTP.

Signed-off-by: Petr Kulhavy <brain@jikos.cz>
--
Changes v5 -> v6:
	- fix broken SYSV init-script path in makefile
	- use current GIT head with fixed issues instead of the released version 1.8
	- remove patches as they are now integrated in GIT

Changes v4 -> v5:
	- move ptp4l parameters into a config file /etc/linuxptp.cfg
	- add step threshold of 1 second into the configuration to quickly correct large errors
	- add systemd service for phc2sys to sync the system clock

Changes v3 -> v4:
	- rename init scripts to linuxptp
	- use git format of the additional patches
	- use the package name in menuconfig 
	- clean-up the clock_nanosleep patch

Changes v2 -> v3:
	- add patches to fix build issues and enable compilation on all targets

Changes v1 -> v2:
	- rename package from ptp4l to linuxptp
	- add EXTRA_LDFLAGS to the build cmd (suggested by Danomi Manchego)
	- sysV startup script: add restart/reload code, use PID file
	- clean-up empty lines and formatting issues
	- license uses SPDX license code
	- update DEVELOPERS file
---
 DEVELOPERS                                     |  3 ++
 package/Config.in                              |  1 +
 package/linuxptp/Config.in                     | 13 ++++++++
 package/linuxptp/S65linuxptp                   | 46 ++++++++++++++++++++++++++
 package/linuxptp/linuxptp-system-clock.service | 11 ++++++
 package/linuxptp/linuxptp.cfg                  | 19 +++++++++++
 package/linuxptp/linuxptp.hash                 |  2 ++
 package/linuxptp/linuxptp.mk                   | 43 ++++++++++++++++++++++++
 package/linuxptp/linuxptp.service              | 11 ++++++
 9 files changed, 149 insertions(+)
 create mode 100644 package/linuxptp/Config.in
 create mode 100755 package/linuxptp/S65linuxptp
 create mode 100644 package/linuxptp/linuxptp-system-clock.service
 create mode 100644 package/linuxptp/linuxptp.cfg
 create mode 100644 package/linuxptp/linuxptp.hash
 create mode 100644 package/linuxptp/linuxptp.mk
 create mode 100644 package/linuxptp/linuxptp.service

diff --git a/DEVELOPERS b/DEVELOPERS
index 8fbb69a..524a655 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1267,6 +1267,9 @@ F:	package/sdl2_gfx/
 F:	package/sdl2_image/
 F:	package/sdl2_ttf/
 
+N:	Petr Kulhavy <brain@jikos.cz>
+F:	package/linuxptp/
+
 N:	Petr Vorel <petr.vorel@gmail.com>
 F:	package/linux-backports/
 F:	package/ltp-testsuite/
diff --git a/package/Config.in b/package/Config.in
index d57813c..200ae00 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1597,6 +1597,7 @@ menu "Networking applications"
 	source "package/links/Config.in"
 	source "package/linphone/Config.in"
 	source "package/linux-zigbee/Config.in"
+	source "package/linuxptp/Config.in"
 	source "package/lldpd/Config.in"
 	source "package/lrzsz/Config.in"
 	source "package/macchanger/Config.in"
diff --git a/package/linuxptp/Config.in b/package/linuxptp/Config.in
new file mode 100644
index 0000000..a5604ed
--- /dev/null
+++ b/package/linuxptp/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_LINUXPTP
+	bool "linuxptp"
+	help
+	  The Linux PTP Project is the Precision Time Protocol
+	  implementation according to IEEE standard 1588 for Linux.
+
+	  The dual design goals are to provide a robust implementation
+	  of the standard and to use the most relevant and modern
+	  Application Programming Interfaces (API) offered by the Linux
+	  kernel. Supporting legacy APIs and other platforms is not a
+	  goal.
+
+	  http://linuxptp.sourceforge.net/
diff --git a/package/linuxptp/S65linuxptp b/package/linuxptp/S65linuxptp
new file mode 100755
index 0000000..46b8921
--- /dev/null
+++ b/package/linuxptp/S65linuxptp
@@ -0,0 +1,46 @@
+#!/bin/sh
+#
+# Start linuxptp
+#
+
+start() {
+	printf "Starting linuxptp daemon: "
+	start-stop-daemon -S -b -q -p /var/run/linuxptp-ptp4l.pid \
+		-x /usr/sbin/ptp4l -- -f /etc/linuxptp.cfg
+	[ $? = 0 ] && echo "OK" || echo "FAIL"
+
+	printf "Starting linuxptp system clock synchronization: "
+	start-stop-daemon -S -b -q -p /var/run/linuxptp-phc2sys.pid \
+		-x /usr/sbin/phc2sys -- -s eth0 -c CLOCK_REALTIME -w -S 1.0
+	[ $? = 0 ] && echo "OK" || echo "FAIL"
+}
+
+stop() {
+	printf "Stopping linuxptp system clock synchronization: "
+	start-stop-daemon -K -q -p /var/run/linuxptp-phc2sys.pid \
+		-x /usr/sbin/phc2sys
+	echo "OK"
+
+	printf "Stopping linuxptp daemon: "
+	start-stop-daemon -K -q -p /var/run/linuxptp-ptp4l.pid \
+		-x /usr/sbin/ptp4l
+	echo "OK"
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
+	stop
+	start
+	;;
+  *)
+	echo "Usage: $0 {start|stop|restart}"
+	exit 1
+esac
+
+exit $?
diff --git a/package/linuxptp/linuxptp-system-clock.service b/package/linuxptp/linuxptp-system-clock.service
new file mode 100644
index 0000000..7327254
--- /dev/null
+++ b/package/linuxptp/linuxptp-system-clock.service
@@ -0,0 +1,11 @@
+[Unit]
+Description=Precision Time Protocol system clock synchronization
+After=syslog.target network.target
+
+[Service]
+ExecStart=/usr/sbin/phc2sys -s /dev/ptp0 -c CLOCK_REALTIME -w -S 1.0
+Restart=always
+
+[Install]
+WantedBy=multi-user.target
+WantedBy=linuxptp.service
diff --git a/package/linuxptp/linuxptp.cfg b/package/linuxptp/linuxptp.cfg
new file mode 100644
index 0000000..f9d02e8
--- /dev/null
+++ b/package/linuxptp/linuxptp.cfg
@@ -0,0 +1,19 @@
+# LinuxPTP configuration file for synchronizing the system clock to
+# a remote PTP master in slave-only mode.
+#
+# By default synchronize time in slave-only mode using UDP and hardware time
+# stamps on eth0. If the difference to master is >1.0 second correct by
+# stepping the clock instead of adjusting the frequency.
+#
+# If you change the configuration don't forget to update the phc2sys
+# parameters accordingly in linuxptp-system-clock.service (systemd)
+# or the linuxptp SysV init script.
+
+[global]
+slaveOnly		1
+delay_mechanism		Auto
+network_transport	UDPv4
+time_stamping		hardware
+step_threshold		1.0
+
+[eth0]
diff --git a/package/linuxptp/linuxptp.hash b/package/linuxptp/linuxptp.hash
new file mode 100644
index 0000000..ccda2d6
--- /dev/null
+++ b/package/linuxptp/linuxptp.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256	b8190ab71a99f1dc32847f33cb301d2464d3f9e5f4c51300d55589aff42e8b3f  linuxptp-97c351cafd7327fd28047580c9e2528a6f7e742b.tar.gz
diff --git a/package/linuxptp/linuxptp.mk b/package/linuxptp/linuxptp.mk
new file mode 100644
index 0000000..bc19afe
--- /dev/null
+++ b/package/linuxptp/linuxptp.mk
@@ -0,0 +1,43 @@
+################################################################################
+#
+# Linux PTP
+#
+################################################################################
+
+LINUXPTP_VERSION = 97c351cafd7327fd28047580c9e2528a6f7e742b
+LINUXPTP_SITE_METHOD = git
+LINUXPTP_SITE = git://git.code.sf.net/p/linuxptp/code
+LINUXPTP_LICENSE = GPL-2.0+
+LINUXPTP_LICENSE_FILES = COPYING
+
+define LINUXPTP_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) KBUILD_OUTPUT=$(TARGET_DIR) \
+		EXTRA_CFLAGS="$(TARGET_CFLAGS)" EXTRA_LDFLAGS="$(TARGET_LDFLAGS)" \
+		CC="$(TARGET_CC)" \
+		-C $(@D) all
+endef
+
+define LINUXPTP_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) prefix=/usr DESTDIR=$(TARGET_DIR) \
+		$(TARGET_CONFIGURE_OPTS) -C $(@D) install
+
+	$(INSTALL) -D -m 644 $(LINUXPTP_PKGDIR)/linuxptp.cfg \
+		$(TARGET_DIR)/etc/linuxptp.cfg
+endef
+
+define LINUXPTP_INSTALL_INIT_SYSV
+	$(INSTALL) -m 755 -D $(LINUXPTP_PKGDIR)/S65linuxptp \
+		$(TARGET_DIR)/etc/init.d/S65linuxptp
+endef
+
+define LINUXPTP_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 644 $(LINUXPTP_PKGDIR)/linuxptp.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/linuxptp.service
+	$(INSTALL) -D -m 644 $(LINUXPTP_PKGDIR)/linuxptp-system-clock.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/linuxptp-system-clock.service
+	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
+	ln -sf ../../../../usr/lib/systemd/system/linuxptp.service \
+		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/linuxptp.service
+endef
+
+$(eval $(generic-package))
diff --git a/package/linuxptp/linuxptp.service b/package/linuxptp/linuxptp.service
new file mode 100644
index 0000000..f690430
--- /dev/null
+++ b/package/linuxptp/linuxptp.service
@@ -0,0 +1,11 @@
+[Unit]
+Description=Precision Time Protocol daemon
+After=syslog.target network.target
+Wants=linuxptp-system-clock.service
+
+[Service]
+ExecStart=/usr/sbin/ptp4l -f /etc/linuxptp.cfg
+Restart=always
+
+[Install]
+WantedBy=multi-user.target
-- 
2.7.4
