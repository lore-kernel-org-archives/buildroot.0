From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Tue, 28 Jun 2016 20:16:00 -0300
Subject: [Buildroot] [PATCH v2] nodm: new package
In-Reply-To: <1466487119-7267-1-git-send-email-ezequiel@vanguardiasur.com.ar>
References: <1466487119-7267-1-git-send-email-ezequiel@vanguardiasur.com.ar>
Message-ID: <20160628231600.21907-1-ezequiel@vanguardiasur.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
--
Changes from v1:
  * Add missing select BR2_PACKAGE_XLIB_LIBX11
  * Add upstream URL to Config.in
  * Use upstream instead of debian to get the sources.
  * Get rid of deprecated NODM_XINIT
  * Use /etc/default/nodm.conf
  * Cosmetic changes

 package/Config.in      |  1 +
 package/nodm/Config.in | 15 +++++++++++++++
 package/nodm/S90nodm   | 49 +++++++++++++++++++++++++++++++++++++++++++++++++
 package/nodm/nodm.hash |  2 ++
 package/nodm/nodm.mk   | 28 ++++++++++++++++++++++++++++
 package/nodm/nodm.pam  | 14 ++++++++++++++
 6 files changed, 109 insertions(+)
 create mode 100644 package/nodm/Config.in
 create mode 100644 package/nodm/S90nodm
 create mode 100644 package/nodm/nodm.hash
 create mode 100644 package/nodm/nodm.mk
 create mode 100644 package/nodm/nodm.pam

diff --git a/package/Config.in b/package/Config.in
index a2a02a8c5e35..1d28efff7f52 100644
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
index 000000000000..3e71f2dd603d
--- /dev/null
+++ b/package/nodm/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_NODM
+	bool "nodm"
+	depends on BR2_PACKAGE_XORG7
+	select BR2_PACKAGE_XLIB_LIBX11
+	select BR2_PACKAGE_LINUX_PAM
+	help
+	  nodm is a minimal display manager that simply logs in
+	  as a given user and starts an X session, without asking
+	  for username or password.
+
+	  For those cases where automatic login is needed (and
+	  does not imply a security issue), nodm is simple to setup,
+	  lightweight, and it should do exactly the right thing.
+
+	  https://github.com/spanezz/nodm/
diff --git a/package/nodm/S90nodm b/package/nodm/S90nodm
new file mode 100644
index 000000000000..a546b3e5d3cf
--- /dev/null
+++ b/package/nodm/S90nodm
@@ -0,0 +1,49 @@
+#!/bin/sh
+#
+# Starts nodm
+#
+
+NODM_FIRST_VT=7
+NODM_XSESSION=/etc/X11/Xsession
+NODM_OPTIONS=
+NODM_X_OPTIONS="-nolisten tcp"
+NODM_USER=root
+NODM_MIN_SESSION_TIME=60
+NODM_X_TIMEOUT=300
+
+[ -r /etc/default/nodm.conf ] && . /etc/default/nodm.conf
+
+export NODM_XSESSION NODM_X_OPTIONS NODM_USER NODM_MIN_SESSION_TIME NODM_FIRST_VT NODM_X_TIMEOUT
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
diff --git a/package/nodm/nodm.hash b/package/nodm/nodm.hash
new file mode 100644
index 000000000000..682206527928
--- /dev/null
+++ b/package/nodm/nodm.hash
@@ -0,0 +1,2 @@
+# locally calculated
+sha256  840939d27d3d9b02ad09e1cffce24729bcdeee6cea6b3f0037d8ae76b49feecd  0.12-1.tar.gz
diff --git a/package/nodm/nodm.mk b/package/nodm/nodm.mk
new file mode 100644
index 000000000000..246c73e104a8
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
+NODM_SITE = $(call github,spanezz,nodm,debian)
+NODM_SOURCE = $(NODM_VERSION)-1.tar.gz
+NODM_LICENSE = GPLv2+
+NODM_LICENSE_FILES = COPYING
+NODM_AUTORECONF = YES
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
2.9.0
