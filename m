From: Vadim Kochan <vadim4j@gmail.com>
Date: Mon, 24 Feb 2020 19:26:52 +0200
Subject: [Buildroot] [PATCH 3/3] package/frr: new package
In-Reply-To: <20200224172652.30932-1-vadim4j@gmail.com>
References: <20200224172652.30932-1-vadim4j@gmail.com>
Message-ID: <20200224172652.30932-4-vadim4j@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

FRR is free software that implements and manages various IPv4 and IPv6
routing protocols. It runs on nearly all distributions of Linux and BSD
as well as Solaris and supports all modern CPU architectures.

FRR currently supports the following protocols:

    BGP
    OSPFv2
    OSPFv3
    RIPv1
    RIPv2
    RIPng
    IS-IS
    PIM-SM/MSDP
    LDP
    BFD
    Babel
    PBR
    OpenFabric
    VRRP
    EIGRP (alpha)
    NHRP (alpha)

Signed-off-by: Vadim Kochan <vadim4j@gmail.com>
---
 DEVELOPERS            |   1 +
 package/Config.in     |   1 +
 package/frr/Config.in |  23 +++++++++
 package/frr/S50frr    |  38 +++++++++++++++
 package/frr/frr.hash  |   2 +
 package/frr/frr.mk    | 105 ++++++++++++++++++++++++++++++++++++++++++
 6 files changed, 170 insertions(+)
 create mode 100644 package/frr/Config.in
 create mode 100644 package/frr/S50frr
 create mode 100644 package/frr/frr.hash
 create mode 100644 package/frr/frr.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index e07236937b..ef6592afa0 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2480,6 +2480,7 @@ F:	package/brcm-patchram-plus/
 F:	package/gettext-tiny/
 F:	package/tinyssh/
 F:	package/rtrlib/
+F:	package/frr/
 
 N:	Valentin Korenblit <valentinkorenblit@gmail.com>
 F:	package/clang/
diff --git a/package/Config.in b/package/Config.in
index 60bf9aac10..51dc3480f4 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1999,6 +1999,7 @@ menu "Networking applications"
 	source "package/fping/Config.in"
 	source "package/freeswitch/Config.in"
 	source "package/freeswitch-mod-bcg729/Config.in"
+	source "package/frr/Config.in"
 	source "package/gerbera/Config.in"
 	source "package/gesftpserver/Config.in"
 	source "package/glorytun/Config.in"
diff --git a/package/frr/Config.in b/package/frr/Config.in
new file mode 100644
index 0000000000..01673eb837
--- /dev/null
+++ b/package/frr/Config.in
@@ -0,0 +1,23 @@
+config BR2_PACKAGE_FRR
+	bool "frr"
+	depends on BR2_USE_MMU # fork()
+	depends on BR2_PACKAGE_BASH # init
+	select BR2_PACKAGE_RTRLIB
+	select BR2_PACKAGE_READLINE
+	select BR2_PACKAGE_JSON_C
+	select BR2_PACKAGE_LIBYANG
+	select BR2_PACKAGE_LIBCAP
+	select BR2_PACKAGE_LIBNL
+	select BR2_PACKAGE_NCURSES
+	select BR2_PACKAGE_NETSNMP
+	select BR2_PACKAGE_C_ARES
+	help
+	  The FRRouting Protocol Suite.
+
+	  FRR is free software that implements and manages various IPv4 and
+	  IPv6 routing protocols.
+
+	  https://frrouting.org
+
+comment "frr requires BASH for init service"
+	depends on !BR2_PACKAGE_BASH
diff --git a/package/frr/S50frr b/package/frr/S50frr
new file mode 100644
index 0000000000..dec7d82a88
--- /dev/null
+++ b/package/frr/S50frr
@@ -0,0 +1,38 @@
+#!/bin/sh
+#
+# Starts frr.
+#
+
+start() {
+	printf "Starting frr: "
+	start-stop-daemon -S -q -b \
+		--exec /usr/sbin/frrinit.sh -- start
+	[ $? = 0 ] && echo "OK" || echo "FAIL"
+}
+stop() {
+	printf "Stopping frr: "
+	/usr/sbin/frrinit.sh stop
+	start-stop-daemon -K -q -p /run/frr.pid
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
+	echo "Usage: $0 {start|stop|restart}"
+	exit 1
+esac
+
+exit $?
diff --git a/package/frr/frr.hash b/package/frr/frr.hash
new file mode 100644
index 0000000000..7d9ff7ea04
--- /dev/null
+++ b/package/frr/frr.hash
@@ -0,0 +1,2 @@
+sha256 c209ed66a0331221649b8c21dc8c6704ce1696e2017ef4d48f8c2ac6b1fa01b7  frr-7.3.tar.gz
+sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/frr/frr.mk b/package/frr/frr.mk
new file mode 100644
index 0000000000..c53e9bb4b0
--- /dev/null
+++ b/package/frr/frr.mk
@@ -0,0 +1,105 @@
+################################################################################
+#
+# frr
+#
+################################################################################
+
+FRR_VERSION = 7.3
+FRR_SOURCE = frr-$(FRR_VERSION).tar.gz
+FRR_SITE = https://github.com/FRRouting/frr/archive
+FRR_LICENSE = GPL-2.0
+FRR_LICENSE_FILES = COPYING
+
+FRR_DEPENDENCIES = rtrlib readline json-c libyang libcap libnl \
+		   ncurses host-frr c-ares
+
+HOST_FRR_DEPENDENCIES = host-flex host-bison host-python
+
+FRR_CONF_OPTS = --with-clippy=$(HOST_DIR)/bin/clippy \
+		--sysconfdir=/etc/frr \
+		--localstatedir=/var/run/frr \
+		--with-moduledir=/usr/lib/frr/modules \
+		--enable-configfile-mask=0640 \
+		--enable-logfile-mask=0640 \
+		--enable-multipath=256 \
+		--disable-ospfclient \
+		--enable-shell-access \
+		--enable-user=frr \
+		--enable-group=frr \
+		--enable-vty-group=frrvty \
+		--disable-exampledir \
+		--enable-rpki \
+		--enable-fpm
+
+HOST_FRR_CONF_OPTS = --enable-clippy-only
+
+define FRR_RUN_BOOTSTRAP
+	(cd $(@D) && PATH=$(BR_PATH) ./bootstrap.sh)
+endef
+FRR_PRE_CONFIGURE_HOOKS += FRR_RUN_BOOTSTRAP
+HOST_FRR_PRE_CONFIGURE_HOOKS += FRR_RUN_BOOTSTRAP
+
+define HOST_FRR_INSTALL_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/lib/clippy $(HOST_DIR)/bin/clippy
+endef
+
+
+# for some reason the normal 'install' target fails
+FRR_INSTALL_TARGET_OPTS = DESTDIR="$(TARGET_DIR)" libdir="/usr/lib" \
+			  install-binPROGRAMS \
+			  install-sbinPROGRAMS \
+			  install-sbinSCRIPTS \
+			  installdirs
+
+define FRR_INSTALL_CONFIG_FILES
+	(cd $(@D) && PATH=$(BR_PATH) ./bootstrap.sh)
+	$(INSTALL) -d -m 0755 $(TARGET_DIR)/var/log/frr
+	$(INSTALL) -d -m 0755 $(TARGET_DIR)/var/run/frr
+
+	$(INSTALL) -d -m 0755 $(TARGET_DIR)/etc/frr
+	$(INSTALL) -D -m 0644 $(@D)/tools/etc/frr/daemons $(TARGET_DIR)/etc/frr/daemons
+	$(INSTALL) -D -m 0644 $(@D)/tools/etc/frr/daemons.conf $(TARGET_DIR)/etc/frr/daemons.conf
+	$(INSTALL) -D -m 0644 $(@D)/tools/etc/frr/frr.conf $(TARGET_DIR)/etc/frr/frr.conf
+	$(INSTALL) -D -m 0644 $(@D)/tools/etc/frr/vtysh.conf $(TARGET_DIR)/etc/frr/vtysh.conf
+	$(INSTALL) -D -m 0644 $(@D)/tools/etc/frr/support_bundle_commands.conf $(TARGET_DIR)/etc/frr/support_bundle_commands.conf
+
+	$(INSTALL) -m 0644 /dev/null $(TARGET_DIR)/etc/frr/zebra.conf
+	$(INSTALL) -m 0644 /dev/null $(TARGET_DIR)/etc/frr/bgpd.conf
+	$(INSTALL) -m 0644 /dev/null $(TARGET_DIR)/etc/frr/ospfd.conf
+	$(INSTALL) -m 0644 /dev/null $(TARGET_DIR)/etc/frr/ospf6d.conf
+	$(INSTALL) -m 0644 /dev/null $(TARGET_DIR)/etc/frr/isisd.conf
+	$(INSTALL) -m 0644 /dev/null $(TARGET_DIR)/etc/frr/ripd.conf
+	$(INSTALL) -m 0644 /dev/null $(TARGET_DIR)/etc/frr/ripngd.conf
+	$(INSTALL) -m 0644 /dev/null $(TARGET_DIR)/etc/frr/pimd.conf
+	$(INSTALL) -m 0644 /dev/null $(TARGET_DIR)/etc/frr/ldpd.conf
+	$(INSTALL) -m 0644 /dev/null $(TARGET_DIR)/etc/frr/nhrpd.conf
+endef
+FRR_POST_INSTALL_TARGET_HOOKS += FRR_INSTALL_CONFIG_FILES
+
+define FRR_PERMISSIONS
+	/var/log/frr d 755 frr frr - - - - -
+	/var/run/frr d 755 frr frr - - - - -
+	/etc/frr/zebra.conf f 644 frr frr - - - - -
+	/etc/frr/bgpd.conf f 644 frr frr - - - - -
+	/etc/frr/ospfd.conf f 644 frr frr - - - - -
+	/etc/frr/ospf6d.conf f 644 frr frr - - - - -
+	/etc/frr/isisd.conf f 644 frr frr - - - - -
+	/etc/frr/ripd.conf f 644 frr frr - - - - -
+	/etc/frr/ripngd.conf f 644 frr frr - - - - -
+	/etc/frr/pimd.conf f 644 frr frr - - - - -
+	/etc/frr/ldpd.conf f 644 frr frr - - - - -
+	/etc/frr/nhrpd.conf f 644 frr frr - - - - -
+	/etc/frr/vtysh.conf f 644 frr frrvty - - - - -
+endef
+
+define FRR_USERS
+	frr -1 frr -1 * /var/run/frr - frrvty FRR user priv
+endef
+
+define FRR_INSTALL_INIT_SYSV
+	$(INSTALL) -D -m 755 $(FRR_PKGDIR)/S50frr \
+		$(TARGET_DIR)/etc/init.d/S50frr
+endef
+
+$(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
2.17.1
