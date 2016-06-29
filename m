From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 29 Jun 2016 14:48:02 +0200
Subject: [Buildroot] [git commit] nodm: new package
Message-ID: <20160629124945.9BFD68197C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=952e2a787a8601b04c9955eabc20cf25fc0c5c81
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: propagate linux-pam dependencies/comment,
	needs wordexp.h, not available on uClibc,
	use /etc/default/nodm for config override,
	correct github/site/source handling,
	disable help2man]
Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in      |  1 +
 package/nodm/Config.in | 25 +++++++++++++++++++++++++
 package/nodm/S90nodm   | 49 +++++++++++++++++++++++++++++++++++++++++++++++++
 package/nodm/nodm.hash |  2 ++
 package/nodm/nodm.mk   | 34 ++++++++++++++++++++++++++++++++++
 package/nodm/nodm.pam  | 14 ++++++++++++++
 6 files changed, 125 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index e5ddc3e..4c39b12 100644
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
index 0000000..b8629a2
--- /dev/null
+++ b/package/nodm/Config.in
@@ -0,0 +1,25 @@
+config BR2_PACKAGE_NODM
+	bool "nodm"
+	depends on BR2_PACKAGE_XORG7
+	depends on (BR2_ENABLE_LOCALE && BR2_USE_WCHAR) # linux-pam
+	depends on !BR2_STATIC_LIBS # linux-pam
+	depends on !BR2_TOOLCHAIN_USES_MUSL # linux-pam
+	depends on !BR2_TOOLCHAIN_USES_UCLIBC # needs wordexp.h
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
+
+comment "nodm needs a glibc toolchain w/ wchar, locale, dynamic library"
+	depends on BR2_PACKAGE_XORG7
+	depends on !(BR2_ENABLE_LOCALE && BR2_USE_WCHAR) \
+		|| BR2_STATIC_LIBS || BR2_TOOLCHAIN_USES_MUSL \
+		|| BR2_TOOLCHAIN_USES_UCLIBC
diff --git a/package/nodm/S90nodm b/package/nodm/S90nodm
new file mode 100755
index 0000000..a966e83
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
+[ -r /etc/default/nodm ] && . /etc/default/nodm
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
index 0000000..e11e875
--- /dev/null
+++ b/package/nodm/nodm.hash
@@ -0,0 +1,2 @@
+# locally calculated
+sha256  840939d27d3d9b02ad09e1cffce24729bcdeee6cea6b3f0037d8ae76b49feecd  nodm-0.12-1.tar.gz
diff --git a/package/nodm/nodm.mk b/package/nodm/nodm.mk
new file mode 100644
index 0000000..da6bc85
--- /dev/null
+++ b/package/nodm/nodm.mk
@@ -0,0 +1,34 @@
+################################################################################
+#
+# nodm
+#
+################################################################################
+
+NODM_VERSION = 0.12-1
+NODM_SITE = $(call github,spanezz,nodm,debian/$(NODM_VERSION))
+NODM_LICENSE = GPLv2+
+NODM_LICENSE_FILES = COPYING
+NODM_AUTORECONF = YES
+
+NODM_DEPENDENCIES = xlib_libX11 linux-pam
+
+# help2man doesn't work when cross compiling
+define NODM_DISABLE_HELP2MAN
+	$(SED) 's/help2man/true/' $(@D)/Makefile.am
+endef
+
+NODM_POST_PATCH_HOOKS += NODM_DISABLE_HELP2MAN
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
index 0000000..f2cf432
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
