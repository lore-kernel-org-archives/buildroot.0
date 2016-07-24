From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 24 Jul 2016 15:13:51 +0200
Subject: [Buildroot] [git commit] igd2-for-linux: new package
Message-ID: <20160724131402.0210C818D2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=58230882982926afd6b1000b056caf4c231fe828
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is The Linux UPnP Internet Gateway Device 2. It is
modified from the original Linux UPnP Internet Gateway Device
[http://linux-igd.sourceforge.net/] according to UPnP
InternetGatewayDevice:2 specifications.

It implements the UPnP Internet Gateway Device version 2
specification (IGDv2) and allows UPnP aware clients, such as
MSN Messenger, Azureus or Miranda to work properly from behind
a NAT firewall.

Please edit /etc/upnpd.conf before using upnpd!

https://github.com/ffontaine/igd2-for-linux

Signed-off-by: Fabrice Fontaine <fabrice.fontaine@orange.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                          |  1 +
 package/igd2-for-linux/Config.in           | 25 +++++++++++
 package/igd2-for-linux/S99upnpd            | 67 ++++++++++++++++++++++++++++++
 package/igd2-for-linux/igd2-for-linux.hash |  2 +
 package/igd2-for-linux/igd2-for-linux.mk   | 48 +++++++++++++++++++++
 package/igd2-for-linux/upnpd.service       | 22 ++++++++++
 6 files changed, 165 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index e341722..72c0be3 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1453,6 +1453,7 @@ menu "Networking applications"
 	source "package/ifplugd/Config.in"
 	source "package/iftop/Config.in"
 	source "package/ifupdown/Config.in"
+	source "package/igd2-for-linux/Config.in"
 	source "package/igh-ethercat/Config.in"
 	source "package/igmpproxy/Config.in"
 	source "package/inadyn/Config.in"
diff --git a/package/igd2-for-linux/Config.in b/package/igd2-for-linux/Config.in
new file mode 100644
index 0000000..157cc6f
--- /dev/null
+++ b/package/igd2-for-linux/Config.in
@@ -0,0 +1,25 @@
+config BR2_PACKAGE_IGD2_FOR_LINUX
+	bool "igd2-for-linux"
+	depends on BR2_USE_MMU # fork()
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_WCHAR
+	select BR2_PACKAGE_IPTABLES # runtime
+	select BR2_PACKAGE_LIBUPNP
+	help
+	  This is The Linux UPnP Internet Gateway Device 2. It is
+	  modified from the original Linux UPnP Internet Gateway Device
+	  [http://linux-igd.sourceforge.net/] according to UPnP
+	  InternetGatewayDevice:2 specifications.
+
+	  It implements the UPnP Internet Gateway Device version 2
+	  specification (IGDv2) and allows UPnP aware clients, such as
+	  MSN Messenger, Azureus or Miranda to work properly from behind
+	  a NAT firewall.
+
+	  Please edit /etc/upnpd.conf before using upnpd!
+
+	  https://github.com/ffontaine/igd2-for-linux
+
+comment "igd2-for-linux needs a toolchain w/ threads, wchar"
+	depends on BR2_USE_MMU
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
diff --git a/package/igd2-for-linux/S99upnpd b/package/igd2-for-linux/S99upnpd
new file mode 100644
index 0000000..c023fa4
--- /dev/null
+++ b/package/igd2-for-linux/S99upnpd
@@ -0,0 +1,67 @@
+#!/bin/sh
+
+NAME=upnpd
+PIDFILE=/var/run/$NAME.pid
+DAEMON=/usr/sbin/$NAME
+CFGFILE=/etc/default/$NAME
+
+LAN=eth0
+WAN=eth0
+
+# For the UPnP library to function correctly, networking must be configured
+# properly for multicasting as described in
+# https://sourceforge.net/p/pupnp/code/ci/master/tree/README.
+# Without this addition, device advertisements and control point searches will
+# not function.
+# However, the route has to be configured once for all UPnP applications
+# (igd2-for-linux, ushare, ...) so do not manage UPnP route by default
+MANAGE_UPNP_MULTICAST_ROUTE_ON_LAN=0
+
+# Read configuration variable file if it is present
+if [ -f $CFGFILE ]; then
+	. $CFGFILE
+fi
+
+DAEMON_ARGS="-f $WAN $LAN"
+
+start() {
+	if [ $MANAGE_UPNP_MULTICAST_ROUTE_ON_LAN != 0 ]; then
+		printf "Add UPnP multicast route on $LAN\n"
+		route add -net 239.0.0.0 netmask 255.0.0.0 $LAN
+	fi
+	printf "Starting $NAME: "
+	start-stop-daemon -S -q -m -b -p $PIDFILE --exec $DAEMON -- $DAEMON_ARGS
+	[ $? = 0 ] && echo "OK" || echo "FAIL"
+}
+
+stop() {
+	printf "Stopping $NAME: "
+	start-stop-daemon -K -q -p $PIDFILE
+	[ $? = 0 ] && echo "OK" || echo "FAIL"
+	if [ $MANAGE_UPNP_MULTICAST_ROUTE_ON_LAN != 0 ]; then
+		printf "Remove UPnP multicast route on $LAN\n"
+		route del -net 239.0.0.0 netmask 255.0.0.0 $LAN
+	fi
+}
+
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
diff --git a/package/igd2-for-linux/igd2-for-linux.hash b/package/igd2-for-linux/igd2-for-linux.hash
new file mode 100644
index 0000000..a46fe5f
--- /dev/null
+++ b/package/igd2-for-linux/igd2-for-linux.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256	a8edc4c14aa104dcffa79d1f3057b8b9c5cef0f8f43901f61e306120a4efe01f	igd2-for-linux-v1.1.tar.gz
diff --git a/package/igd2-for-linux/igd2-for-linux.mk b/package/igd2-for-linux/igd2-for-linux.mk
new file mode 100644
index 0000000..8b63c04
--- /dev/null
+++ b/package/igd2-for-linux/igd2-for-linux.mk
@@ -0,0 +1,48 @@
+################################################################################
+#
+# igd2-for-linux
+#
+################################################################################
+
+IGD2_FOR_LINUX_VERSION = v1.1
+IGD2_FOR_LINUX_SITE = $(call github,ffontaine,igd2-for-linux,$(IGD2_FOR_LINUX_VERSION))
+
+IGD2_FOR_LINUX_LICENSE = GPLv2
+IGD2_FOR_LINUX_LICENSE_FILES = linuxigd2/doc/LICENSE
+
+IGD2_FOR_LINUX_DEPENDENCIES = libupnp
+
+IGD2_FOR_LINUX_BUILD_DIR = $(@D)/linuxigd2
+IGD2_FOR_LINUX_CONF_DIR = $(IGD2_FOR_LINUX_BUILD_DIR)/configs
+
+define IGD2_FOR_LINUX_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(IGD2_FOR_LINUX_BUILD_DIR) \
+		$(TARGET_CONFIGURE_OPTS) \
+		LIBUPNP_PREFIX="$(STAGING_DIR)/usr" \
+		all
+endef
+
+define IGD2_FOR_LINUX_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(IGD2_FOR_LINUX_BUILD_DIR)/bin/upnpd \
+		$(TARGET_DIR)/usr/sbin/upnpd
+	$(INSTALL) -D -m 0644 $(IGD2_FOR_LINUX_CONF_DIR)/upnpd.conf \
+		$(TARGET_DIR)/etc/upnpd.conf
+	mkdir -p $(TARGET_DIR)/etc/linuxigd/
+	cp -dpfr $(IGD2_FOR_LINUX_CONF_DIR)/*.{xml,png} \
+		$(TARGET_DIR)/etc/linuxigd/
+endef
+
+define IGD2_FOR_LINUX_INSTALL_INIT_SYSV
+	$(INSTALL) -D -m 0755 package/igd2-for-linux/S99upnpd \
+		$(TARGET_DIR)/etc/init.d/S99upnpd
+endef
+
+define IGD2_FOR_LINUX_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 0644 package/igd2-for-linux/upnpd.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/upnpd.service
+	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
+	ln -sf ../../../../usr/lib/systemd/system/upnpd.service \
+		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/upnpd.service
+endef
+
+$(eval $(generic-package))
diff --git a/package/igd2-for-linux/upnpd.service b/package/igd2-for-linux/upnpd.service
new file mode 100644
index 0000000..91a5b4c
--- /dev/null
+++ b/package/igd2-for-linux/upnpd.service
@@ -0,0 +1,22 @@
+[Unit]
+Description=UPnP Internet Gateway Device version 2 daemon
+After=network.target
+
+[Service]
+Environment="LAN=eth0"
+Environment="WAN=eth0"
+EnvironmentFile=/etc/default/upnpd
+# For the UPnP library to function correctly, networking must be configured
+# properly for multicasting as described in 
+# https://sourceforge.net/p/pupnp/code/ci/master/tree/README.
+# Without this addition, device advertisements and control point searches will
+# not function.
+# However, the route has to be configured once for all UPnP applications
+# (igd2-for-linux, ushare, ...) so do not manage UPnP route by default
+#ExecStartPre=/sbin/route add -net 239.0.0.0 netmask 255.0.0.0 $LAN
+#ExecStopPost=/sbin/route del -net 239.0.0.0 netmask 255.0.0.0 $LAN
+ExecStart=/usr/sbin/upnpd -f $WAN $LAN
+Restart=always
+
+[Install]
+WantedBy=multi-user.target
