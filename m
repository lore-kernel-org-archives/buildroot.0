From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Oct 2017 18:17:02 +0100
Subject: [Buildroot] [git commit] boinc: new package
Message-ID: <20171029171518.3D2D881190@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6820ce4862c53129c30eaa73e906d6ba9f4734e3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Open-source software for volunteer computing and grid computing.

Use the idle time on your computer to cure diseases, study global
warming, discover pulsars, and do many other types of scientific
research.

https://boinc.berkeley.edu

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[Bernd:
- bumped to version 7.8.3
- removed patches which where applied upstream
- added myself to DEVELOPERS as well]
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 DEVELOPERS                         |  2 ++
 package/Config.in                  |  1 +
 package/boinc/Config.in            | 22 +++++++++++++++
 package/boinc/S99boinc-client      | 37 +++++++++++++++++++++++++
 package/boinc/boinc-client.service | 10 +++++++
 package/boinc/boinc.hash           |  2 ++
 package/boinc/boinc.mk             | 56 ++++++++++++++++++++++++++++++++++++++
 7 files changed, 130 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index f0f83b0..2741505 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -201,6 +201,7 @@ F:	package/apr/
 F:	package/apr-util/
 F:	package/bcg729/
 F:	package/bluez-tools/
+F:	package/boinc/
 F:	package/clamav/
 F:	package/dovecot/
 F:	package/dovecot-pigeonhole/
@@ -584,6 +585,7 @@ F:	package/alljoyn/
 F:	package/alljoyn-base/
 F:	package/alljoyn-tcl/
 F:	package/alljoyn-tcl-base/
+F:	package/boinc/
 F:	package/gtksourceview/
 F:	package/gssdp/
 F:	package/gupnp/
diff --git a/package/Config.in b/package/Config.in
index 55fe801..62f498e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1607,6 +1607,7 @@ menu "Networking applications"
 	source "package/bluez5_utils/Config.in"
 	source "package/bmon/Config.in"
 	source "package/boa/Config.in"
+	source "package/boinc/Config.in"
 	source "package/bridge-utils/Config.in"
 	source "package/bwm-ng/Config.in"
 	source "package/c-icap/Config.in"
diff --git a/package/boinc/Config.in b/package/boinc/Config.in
new file mode 100644
index 0000000..5239019
--- /dev/null
+++ b/package/boinc/Config.in
@@ -0,0 +1,22 @@
+config BR2_PACKAGE_BOINC
+	bool "boinc"
+	depends on BR2_USE_MMU # fork()
+	depends on !BR2_STATIC_LIBS # dlfcn.h
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_INSTALL_LIBSTDCPP
+	select BR2_PACKAGE_LIBCURL
+	select BR2_PACKAGE_OPENSSL
+	help
+	  Open-source software for volunteer computing and grid
+	  computing.
+
+	  Use the idle time on your computer to cure diseases, study
+	  global warming, discover pulsars, and do many other types of
+	  scientific research.
+
+	  https://boinc.berkeley.edu
+
+comment "boinc needs a toolchain w/ dynamic library, C++, threads"
+	depends on BR2_USE_MMU
+	depends on BR2_STATIC_LIBS || !BR2_INSTALL_LIBSTDCPP \
+		|| !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/boinc/S99boinc-client b/package/boinc/S99boinc-client
new file mode 100644
index 0000000..f4b2a2c
--- /dev/null
+++ b/package/boinc/S99boinc-client
@@ -0,0 +1,37 @@
+#!/bin/sh
+
+NAME=boinc_client
+PIDFILE=/var/run/$NAME.pid
+DAEMON=/usr/bin/$NAME
+
+start() {
+	printf "Starting $NAME: "
+	start-stop-daemon -S -q -m -b -p $PIDFILE --exec $DAEMON
+	[ $? = 0 ] && echo "OK" || echo "FAIL"
+}
+stop() {
+	printf "Stopping $NAME: "
+	start-stop-daemon -K -q -p $PIDFILE
+	[ $? = 0 ] && echo "OK" || echo "FAIL"
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
+	echo "Usage: $0 {start|stop|restart|reload}"
+	exit 1
+esac
+
+exit $?
diff --git a/package/boinc/boinc-client.service b/package/boinc/boinc-client.service
new file mode 100644
index 0000000..9de940e
--- /dev/null
+++ b/package/boinc/boinc-client.service
@@ -0,0 +1,10 @@
+[Unit]
+Description=BOINC client
+After=network.target
+
+[Service]
+ExecStart=/usr/bin/boinc_client
+Restart=always
+
+[Install]
+WantedBy=multi-user.target
diff --git a/package/boinc/boinc.hash b/package/boinc/boinc.hash
new file mode 100644
index 0000000..292c327
--- /dev/null
+++ b/package/boinc/boinc.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256 e3d5b190ec6cdc3512005469fab90203af110cd9a7880654c5d0b4d4e55f3c17  boinc-7.8.3.tar.gz
diff --git a/package/boinc/boinc.mk b/package/boinc/boinc.mk
new file mode 100644
index 0000000..01fa66a
--- /dev/null
+++ b/package/boinc/boinc.mk
@@ -0,0 +1,56 @@
+################################################################################
+#
+# boinc
+#
+################################################################################
+
+BOINC_VERSION_MAJOR = 7.8
+BOINC_VERSION = $(BOINC_VERSION_MAJOR).3
+# client_release can be used to build the Client and Manager but not the Server
+# part. The Server currently has no versioning (see
+# https://github.com/BOINC/boinc/pull/1798).
+BOINC_SITE = \
+	$(call github,BOINC,boinc,client_release/$(BOINC_VERSION_MAJOR)/$(BOINC_VERSION))
+BOINC_LICENSE = LGPL-3.0+
+BOINC_LICENSE_FILES = COPYING COPYING.LESSER
+BOINC_DEPENDENCIES = host-pkgconf libcurl openssl
+BOINC_AUTORECONF = YES
+BOINC_CONF_OPTS = \
+	--disable-apps \
+	--disable-boinczip \
+	--disable-manager \
+	--disable-server \
+	--enable-client \
+	--enable-dynamic-client-linkage \
+	--enable-libraries \
+	--with-pkg-config=$(PKG_CONFIG_HOST_BINARY) \
+	--with-libcurl=$(STAGING_DIR)/usr
+
+ifeq ($(BR2_PACKAGE_LIBFCGI),y)
+BOINC_DEPENDENCIES += libfcgi
+BOINC_CONF_OPTS += --enable-fcgi
+else
+BOINC_CONF_OPTS += --disable-fcgi
+endif
+
+# Remove boinc-client because it is incompatible with buildroot
+define BOINC_REMOVE_UNNEEDED_FILE
+	$(RM) $(TARGET_DIR)/etc/init.d/boinc-client
+endef
+
+BOINC_POST_INSTALL_TARGET_HOOKS += BOINC_REMOVE_UNNEEDED_FILE
+
+define BOINC_INSTALL_INIT_SYSV
+	 $(INSTALL) -D -m 0755 package/boinc/S99boinc-client \
+		$(TARGET_DIR)/etc/init.d/S99boinc-client
+endef
+
+define BOINC_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 644 package/boinc/boinc-client.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/boinc-client.service
+	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
+	ln -sf ../../../../usr/lib/systemd/system/boinc-client.service \
+		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/boinc-client.service
+endef
+
+$(eval $(autotools-package))
