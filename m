From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Tue, 21 Jun 2016 02:31:59 -0300
Subject: [Buildroot] [PATCH] nodm: new package
Message-ID: <1466487119-7267-1-git-send-email-ezequiel@vanguardiasur.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
---
I don't have much experience with PAM, so feel free to suggest
a better PAM file.

Tested on Minnowboard Turbot, using the minnowboard_max-graphical defconfig.

 package/Config.in      |  1 +
 package/nodm/Config.in | 14 ++++++++++++++
 package/nodm/S90nodm   | 51 ++++++++++++++++++++++++++++++++++++++++++++++++++
 package/nodm/nodm.hash |  1 +
 package/nodm/nodm.mk   | 28 +++++++++++++++++++++++++++
 package/nodm/nodm.pam  | 14 ++++++++++++++
 6 files changed, 109 insertions(+)
 create mode 100644 package/nodm/Config.in
 create mode 100644 package/nodm/S90nodm
 create mode 100644 package/nodm/nodm.hash
 create mode 100644 package/nodm/nodm.mk
 create mode 100644 package/nodm/nodm.pam

diff --git a/package/Config.in b/package/Config.in
index ce71afb7816a..0f5d1c07dc7d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -307,6 +307,7 @@ comment "X applications"
 	source "package/gtkperf/Config.in"
 	source "package/leafpad/Config.in"
 	source "package/midori/Config.in"
+	source "package/nodm/Config.in"
 	source "package/pcmanfm/Config.in"
 	source "package/qt-webkit-kiosk/Config.in"
 	source "package/rdesktop/Config.in"
diff --git a/package/nodm/Config.in b/package/nodm/Config.in
new file mode 100644
index 000000000000..e6231076b1ee
--- /dev/null
+++ b/package/nodm/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_NODM
+	bool "nodm"
+	depends on BR2_PACKAGE_XORG7
+	select BR2_PACKAGE_LINUX_PAM
+
+	help
+	  nodm is a minimal display manager that simply logs in
+	  as a given user and starts an X session, without asking
+	  for username or password.
+
+	  For those cases where automatic login is needed (and
+	  does not imply a security issue), nodm is simple to setup,
+	  lightweight, and it should do exactly the right thing.
+
diff --git a/package/nodm/S90nodm b/package/nodm/S90nodm
new file mode 100644
index 000000000000..66bb0ca8565b
--- /dev/null
+++ b/package/nodm/S90nodm
@@ -0,0 +1,51 @@
+#!/bin/sh
+#
+# Starts nodm
+#
+
+NODM_XINIT=/usr/bin/xinit
+NODM_FIRST_VT=7
+NODM_XSESSION=/etc/X11/Xsession
+NODM_OPTIONS=
+NODM_X_OPTIONS="-nolisten tcp"
+NODM_USER=root
+NODM_MIN_SESSION_TIME=60
+NODM_X_TIMEOUT=300
+
+[ -r /etc/nodm.conf ] && . /etc/nodm.conf
+
+export NODM_XINIT NODM_XSESSION NODM_X_OPTIONS NODM_USER NODM_MIN_SESSION_TIME NODM_FIRST_VT NODM_X_TIMEOUT
+
+start() {
+	printf "Starting nodm: "
+	start-stop-daemon -S -q -p /var/run/nodm.pid --exec /usr/sbin/nodm -b -m -S -- ${NODM_OPTIONS}
+	[ $? = 0 ] && echo "OK" || echo "FAIL"
+}
+stop() {
+	printf "Stopping nodm: "
+	start-stop-daemon -K -q -p /var/run/nodm.pid
+	[ $? = 0 ] && echo "OK" || echo "FAIL"
+}
+restart() {
+	stop
+	sleep 1
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
diff --git a/package/nodm/nodm.hash b/package/nodm/nodm.hash
new file mode 100644
index 000000000000..84de255946db
--- /dev/null
+++ b/package/nodm/nodm.hash
@@ -0,0 +1 @@
+sha256	77a002928e832eb6737fb92ad6b3477fce68167b4bc86eba5586868cc1337524	nodm_0.12-1.tar.gz
diff --git a/package/nodm/nodm.mk b/package/nodm/nodm.mk
new file mode 100644
index 000000000000..0cad9c623960
--- /dev/null
+++ b/package/nodm/nodm.mk
@@ -0,0 +1,28 @@
+################################################################################
+#
+# nodm
+#
+################################################################################
+
+NODM_VERSION = 0.12
+NODM_SOURCE = nodm_$(NODM_VERSION)-1.tar.gz
+NODM_SITE = http://http.debian.net/debian/pool/main/n/nodm
+NODM_LICENSE = GPLv2+
+NODM_LICENSE_FILES = COPYING
+NODM_AUTORECONF=YES
+
+NODM_DEPENDENCIES = xlib_libX11 linux-pam
+
+define NODM_INSTALL_PAM
+	$(INSTALL) -D -m 0644 package/nodm/nodm.pam \
+		$(TARGET_DIR)/etc/pam.d/nodm
+endef
+
+NODM_POST_INSTALL_TARGET_HOOKS += NODM_INSTALL_PAM
+
+define NODM_INSTALL_INIT_SYSV
+	$(INSTALL) -D -m 0755 package/nodm/S90nodm \
+		$(TARGET_DIR)/etc/init.d/S90nodm
+endef
+
+$(eval $(autotools-package))
diff --git a/package/nodm/nodm.pam b/package/nodm/nodm.pam
new file mode 100644
index 000000000000..f2cf43217a23
--- /dev/null
+++ b/package/nodm/nodm.pam
@@ -0,0 +1,14 @@
+# Log service and allow promiscuously
+#
+auth		required	pam_warn.so
+auth		required	pam_unix.so
+
+account		required	pam_warn.so
+account		required	pam_permit.so
+
+password	required	pam_warn.so
+password	required	pam_permit.so
+
+session		required	pam_warn.so
+session		required	pam_permit.so
+session		required	pam_env.so
-- 
2.7.0
