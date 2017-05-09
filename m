From: Petr Kulhavy <brain@jikos.cz>
Date: Tue,  9 May 2017 11:42:24 +0200
Subject: [Buildroot] [PATCH 1/1] ptp4l: new package
Message-ID: <1494322944-22289-1-git-send-email-brain@jikos.cz>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add the Linux PTP Project package, aka ptp4l.
http://linuxptp.sourceforge.net/

The sysV and systemd init scripts start the daemon in automatic mode on eth0.

Signed-off-by: Petr Kulhavy <brain@jikos.cz>
---
 package/Config.in           |  1 +
 package/ptp4l/Config.in     | 13 +++++++++++++
 package/ptp4l/S65ptp4l      | 29 +++++++++++++++++++++++++++++
 package/ptp4l/ptp4l.hash    |  2 ++
 package/ptp4l/ptp4l.mk      | 37 +++++++++++++++++++++++++++++++++++++
 package/ptp4l/ptp4l.service | 10 ++++++++++
 6 files changed, 92 insertions(+)
 create mode 100644 package/ptp4l/Config.in
 create mode 100755 package/ptp4l/S65ptp4l
 create mode 100644 package/ptp4l/ptp4l.hash
 create mode 100644 package/ptp4l/ptp4l.mk
 create mode 100644 package/ptp4l/ptp4l.service

diff --git a/package/Config.in b/package/Config.in
index d57813c..a59da25 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1660,6 +1660,7 @@ endif
 	source "package/proxychains-ng/Config.in"
 	source "package/ptpd/Config.in"
 	source "package/ptpd2/Config.in"
+	source "package/ptp4l/Config.in"
 	source "package/pure-ftpd/Config.in"
 	source "package/putty/Config.in"
 	source "package/quagga/Config.in"
diff --git a/package/ptp4l/Config.in b/package/ptp4l/Config.in
new file mode 100644
index 0000000..a070545
--- /dev/null
+++ b/package/ptp4l/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_PTP4L
+	bool "ptp4l / Linux PTP"
+	help
+	  The Linux PTP Project is the Precision Time Protocol implementation
+	  according to IEEE standard 1588 for Linux.
+
+	  The dual design goals are to provide a robust implementation of the
+	  standard and to use the most relevant and modern Application
+	  Programming Interfaces (API) offered by the Linux kernel. Supporting
+	  legacy APIs and other platforms is not a goal.
+
+	  http://linuxptp.sourceforge.net/
+
diff --git a/package/ptp4l/S65ptp4l b/package/ptp4l/S65ptp4l
new file mode 100755
index 0000000..6912658
--- /dev/null
+++ b/package/ptp4l/S65ptp4l
@@ -0,0 +1,29 @@
+#!/bin/sh
+#
+# Start ptp4l
+#
+
+case "$1" in
+  start)
+	printf "Starting ptp4l: "
+	start-stop-daemon -S -b -q -x /usr/sbin/ptp4l -- -A -i eth0
+	if [ $? != 0 ]; then
+		echo "FAILED"
+		exit 1
+	else
+		echo "OK"
+	fi
+	;;
+  stop)
+	printf "Stopping ptp4l: "
+	start-stop-daemon -K -q -x /usr/sbin/ptp4l
+	echo "OK"
+	;;
+  restart|reload)
+	;;
+  *)
+	echo "Usage: $0 {start|stop|restart}"
+	exit 1
+esac
+
+exit $?
diff --git a/package/ptp4l/ptp4l.hash b/package/ptp4l/ptp4l.hash
new file mode 100644
index 0000000..1ac9443
--- /dev/null
+++ b/package/ptp4l/ptp4l.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256	fa8e00f6ec73cefa7bb313dce7f60dfe5eb9e2bde3353594e9ac18edc93e5165  linuxptp-1.8.tgz
diff --git a/package/ptp4l/ptp4l.mk b/package/ptp4l/ptp4l.mk
new file mode 100644
index 0000000..49d083d
--- /dev/null
+++ b/package/ptp4l/ptp4l.mk
@@ -0,0 +1,37 @@
+################################################################################
+#
+# ptp4l
+#
+################################################################################
+
+PTP4L_VERSION = 1.8
+PTP4L_SOURCE = linuxptp-$(PTP4L_VERSION).tgz
+PTP4L_SITE = http://sourceforge.net/projects/linuxptp/files/v$(PTP4L_VERSION)
+PTP4L_LICENSE = GPLv2
+PTP4L_LICENSE_FILES = COPYING
+PTP4L_CFLAGS = $(TARGET_CFLAGS)
+
+
+define PTP4L_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) KBUILD_OUTPUT=$(TARGET_DIR) CC=$(TARGET_CC) EXTRA_CFLAGS="$(PTP4L_CFLAGS)" -C $(@D) all
+endef
+
+define PTP4L_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) prefix=$(TARGET_DIR)/usr $(TARGET_CONFIGURE_OPTS) -C $(@D) install
+endef
+
+define PTP4L_INSTALL_INIT_SYSV
+	$(INSTALL) -m 755 -D $(@D)/package/ptp4l/S65ptp4l \
+		$(TARGET_DIR)/etc/init.d/S65ptp4l
+endef
+
+define PTP4L_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 644 $(PTP4L_PKGDIR)/ptp4l.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/ptp4l.service
+	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
+	ln -sf ../../../../usr/lib/systemd/system/ptp4l.service \
+		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/ptp4l.service
+endef
+
+$(eval $(generic-package))
+
diff --git a/package/ptp4l/ptp4l.service b/package/ptp4l/ptp4l.service
new file mode 100644
index 0000000..ec6bbc5
--- /dev/null
+++ b/package/ptp4l/ptp4l.service
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
