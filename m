From: Petr Kulhavy <brain@jikos.cz>
Date: Tue,  9 May 2017 17:34:20 +0200
Subject: [Buildroot] [PATCH v2 1/1] linuxptp: new package
Message-ID: <1494344060-16183-1-git-send-email-brain@jikos.cz>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add the Linux PTP Project package.
http://linuxptp.sourceforge.net/

The sysV and systemd init scripts start the daemon in automatic mode on eth0.

Signed-off-by: Petr Kulhavy <brain@jikos.cz>
--
Changes v1 -> v2:
	- rename package from ptp4l to linuxptp
	- add EXTRA_LDFLAGS to the build cmd (suggested by Danomi Manchego)
	- sysV startup script: add restart/reload code, use PID file
	- clean-up empty lines and formatting issues
	- license uses SPDX license code
	- update DEVELOPERS file
---
 DEVELOPERS                     |  3 +++
 package/Config.in              |  1 +
 package/linuxptp/Config.in     | 13 +++++++++++++
 package/linuxptp/S65ptp4l      | 36 ++++++++++++++++++++++++++++++++++++
 package/linuxptp/linuxptp.hash |  2 ++
 package/linuxptp/linuxptp.mk   | 37 +++++++++++++++++++++++++++++++++++++
 package/linuxptp/ptp4l.service | 10 ++++++++++
 7 files changed, 102 insertions(+)
 create mode 100644 package/linuxptp/Config.in
 create mode 100755 package/linuxptp/S65ptp4l
 create mode 100644 package/linuxptp/linuxptp.hash
 create mode 100644 package/linuxptp/linuxptp.mk
 create mode 100644 package/linuxptp/ptp4l.service

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
index 0000000..7e4a77b
--- /dev/null
+++ b/package/linuxptp/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_LINUXPTP
+	bool "Linux PTP"
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
diff --git a/package/linuxptp/S65ptp4l b/package/linuxptp/S65ptp4l
new file mode 100755
index 0000000..50b9e96
--- /dev/null
+++ b/package/linuxptp/S65ptp4l
@@ -0,0 +1,36 @@
+#!/bin/sh
+#
+# Start ptp4l
+#
+
+start() {
+	printf "Starting ptp4l: "
+	start-stop-daemon -S -b -q -p /var/run/ptp4l.pid \
+		-x /usr/sbin/ptp4l -- -A -i eth0
+	[ $? = 0 ] && echo "OK" || echo "FAIL"
+}
+
+stop() {
+	printf "Stopping ptp4l: "
+	start-stop-daemon -K -q -p /var/run/ptp4l.pid \
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
diff --git a/package/linuxptp/linuxptp.hash b/package/linuxptp/linuxptp.hash
new file mode 100644
index 0000000..1ac9443
--- /dev/null
+++ b/package/linuxptp/linuxptp.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256	fa8e00f6ec73cefa7bb313dce7f60dfe5eb9e2bde3353594e9ac18edc93e5165  linuxptp-1.8.tgz
diff --git a/package/linuxptp/linuxptp.mk b/package/linuxptp/linuxptp.mk
new file mode 100644
index 0000000..dcd9c26
--- /dev/null
+++ b/package/linuxptp/linuxptp.mk
@@ -0,0 +1,37 @@
+################################################################################
+#
+# Linux PTP
+#
+################################################################################
+
+LINUXPTP_VERSION = 1.8
+LINUXPTP_SOURCE = linuxptp-$(LINUXPTP_VERSION).tgz
+LINUXPTP_SITE = http://sourceforge.net/projects/linuxptp/files/v$(LINUXPTP_VERSION)
+LINUXPTP_LICENSE = GPL-2.0+
+LINUXPTP_LICENSE_FILES = COPYING
+
+define LINUXPTP_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) KBUILD_OUTPUT=$(TARGET_DIR) CC=$(TARGET_CC) \
+		EXTRA_CFLAGS="$(TARGET_CFLAGS)" EXTRA_LDFLAGS="$(TARGET_LDFLAGS)" \
+		-C $(@D) all
+endef
+
+define LINUXPTP_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) prefix=/usr DESTDIR=$(TARGET_DIR) \
+		$(TARGET_CONFIGURE_OPTS) -C $(@D) install
+endef
+
+define LINUXPTP_INSTALL_INIT_SYSV
+	$(INSTALL) -m 755 -D $(@D)/package/linuxptp/S65ptp4l \
+		$(TARGET_DIR)/etc/init.d/S65ptp4l
+endef
+
+define LINUXPTP_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 644 $(LINUXPTP_PKGDIR)/ptp4l.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/ptp4l.service
+	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
+	ln -sf ../../../../usr/lib/systemd/system/ptp4l.service \
+		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/ptp4l.service
+endef
+
+$(eval $(generic-package))
diff --git a/package/linuxptp/ptp4l.service b/package/linuxptp/ptp4l.service
new file mode 100644
index 0000000..ec6bbc5
--- /dev/null
+++ b/package/linuxptp/ptp4l.service
@@ -0,0 +1,10 @@
+[Unit]
+Description=Precision Time Protocol daemon
+After=syslog.target network.target
+
+[Service]
+ExecStart=/usr/sbin/ptp4l -A -i eth0
+Restart=always
+
+[Install]
+WantedBy=multi-user.target
-- 
2.7.4
