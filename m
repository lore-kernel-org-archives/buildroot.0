From: Vadim Kochan <vadim4j@gmail.com>
Date: Tue, 25 Feb 2020 17:53:22 +0200
Subject: [Buildroot] [PATCH v3 2/2] package/frr: new package
In-Reply-To: <20200225155322.8440-1-vadim4j@gmail.com>
References: <20200225155322.8440-1-vadim4j@gmail.com>
Message-ID: <20200225155322.8440-3-vadim4j@gmail.com>
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

Some not-needed features were disabled to minimize package dependencies:

    - POSIX capabilities
    - RPKi

Signed-off-by: Vadim Kochan <vadim4j@gmail.com>
---
 DEVELOPERS            |  1 +
 package/Config.in     |  1 +
 package/frr/Config.in | 25 ++++++++++++++++
 package/frr/S50frr    | 46 +++++++++++++++++++++++++++++
 package/frr/frr.hash  |  2 ++
 package/frr/frr.mk    | 69 +++++++++++++++++++++++++++++++++++++++++++
 6 files changed, 144 insertions(+)
 create mode 100644 package/frr/Config.in
 create mode 100644 package/frr/S50frr
 create mode 100644 package/frr/frr.hash
 create mode 100644 package/frr/frr.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 7d3d1ca11a..95ea2254de 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2477,6 +2477,7 @@ F:	package/tstools/
 
 N:	Vadim Kochan <vadim4j@gmail.com>
 F:	package/brcm-patchram-plus/
+F:	package/frr/
 F:	package/gettext-tiny/
 F:	package/tinyssh/
 
diff --git a/package/Config.in b/package/Config.in
index dfa3f34b9d..3e6b51a745 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1998,6 +1998,7 @@ menu "Networking applications"
 	source "package/fping/Config.in"
 	source "package/freeswitch/Config.in"
 	source "package/freeswitch-mod-bcg729/Config.in"
+	source "package/frr/Config.in"
 	source "package/gerbera/Config.in"
 	source "package/gesftpserver/Config.in"
 	source "package/glorytun/Config.in"
diff --git a/package/frr/Config.in b/package/frr/Config.in
new file mode 100644
index 0000000000..c0c3bdd693
--- /dev/null
+++ b/package/frr/Config.in
@@ -0,0 +1,25 @@
+config BR2_PACKAGE_FRR
+	bool "frr"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_STATIC_LIBS # libyang
+	depends on BR2_USE_MMU # fork()
+	depends on BR2_PACKAGE_BASH # init
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # json-c
+	select BR2_PACKAGE_C_ARES
+	select BR2_PACKAGE_LIBYANG
+	select BR2_PACKAGE_LIBNL
+	select BR2_PACKAGE_READLINE
+	select BR2_PACKAGE_JSON_C
+	help
+	  The FRRouting Protocol Suite.
+
+	  FRR is free software that implements and manages various IPv4 and
+	  IPv6 routing protocols.
+
+	  https://frrouting.org
+
+comment "frr needs BASH, threads, dynamic library"
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
+	depends on BR2_USE_MMU
+	depends on !BR2_PACKAGE_BASH || !BR2_TOOLCHAIN_HAS_THREADS || \
+		BR2_STATIC_LIBS
diff --git a/package/frr/S50frr b/package/frr/S50frr
new file mode 100644
index 0000000000..0c128353e9
--- /dev/null
+++ b/package/frr/S50frr
@@ -0,0 +1,46 @@
+#!/bin/sh
+
+DAEMON="frr"
+
+[ -r "/etc/default/$DAEMON" ] && . "/etc/default/$DAEMON"
+
+start() {
+	install -m 755 -o frr -g frr -d /var/run/frr
+	install -m 755 -o frr -g frr -d /var/log/frr
+
+	printf 'Starting %s: ' "$DAEMON"
+	/usr/sbin/frrinit.sh start
+	status=$?
+	if [ "$status" -eq 0 ]; then
+		echo "OK"
+	else
+		echo "FAIL"
+	fi
+	return "$status"
+}
+
+stop() {
+	printf 'Stopping %s: ' "$DAEMON"
+	/usr/sbin/frrinit.sh stop
+	status=$?
+	if [ "$status" -eq 0 ]; then
+		echo "OK"
+	else
+		echo "FAIL"
+	fi
+	return "$status"
+}
+
+restart() {
+	stop
+	sleep 1
+	start
+}
+
+case "$1" in
+	start|stop|restart)
+		"$1";;
+	*)
+		echo "Usage: $0 {start|stop|restart}"
+		exit 1
+esac
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
index 0000000000..2add98542a
--- /dev/null
+++ b/package/frr/frr.mk
@@ -0,0 +1,69 @@
+################################################################################
+#
+# frr
+#
+################################################################################
+
+FRR_VERSION = 7.3
+FRR_SITE = https://github.com/FRRouting/frr/archive
+FRR_LICENSE = GPL-2.0
+FRR_LICENSE_FILES = COPYING
+FRR_AUTORECONF = YES
+
+FRR_DEPENDENCIES = host-frr readline json-c \
+	libyang libnl c-ares
+
+HOST_FRR_DEPENDENCIES = host-flex host-bison host-python
+
+FRR_CONF_OPTS = --with-clippy=$(HOST_DIR)/bin/clippy \
+	--sysconfdir=/etc/frr \
+	--localstatedir=/var/run/frr \
+	--with-moduledir=/usr/lib/frr/modules \
+	--enable-configfile-mask=0640 \
+	--enable-logfile-mask=0640 \
+	--enable-multipath=256 \
+	--disable-ospfclient \
+	--enable-shell-access \
+	--enable-user=frr \
+	--enable-group=frr \
+	--enable-vty-group=frrvty \
+	--disable-capabilities \
+	--enable-fpm
+
+HOST_FRR_CONF_OPTS = --enable-clippy-only
+
+define HOST_FRR_INSTALL_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/lib/clippy $(HOST_DIR)/bin/clippy
+endef
+
+define FRR_INSTALL_CONFIG_FILES
+	$(INSTALL) -d -m 0755 $(TARGET_DIR)/etc/frr
+
+	$(foreach f,daemons daemons.conf frr.conf vtysh.conf support_bundle_commands.conf,\
+		$(INSTALL) -D -m 0640 $(@D)/tools/etc/frr/$(f) \
+		$(TARGET_DIR)/etc/frr/$(f)
+	)
+
+	$(RM) $(TARGET_DIR)/etc/frr/*.sample
+endef
+FRR_POST_INSTALL_TARGET_HOOKS += FRR_INSTALL_CONFIG_FILES
+
+define FRR_PERMISSIONS
+	/etc/frr/daemons f 640 frr frr - - - - -
+	/etc/frr/daemons.conf f 640 frr frr - - - - -
+	/etc/frr/frr.conf f 640 frr frr - - - - -
+	/etc/frr/vtysh.conf f 640 frr frrvty - - - - -
+	/etc/frr/support_bundle_commands.conf f 640 frr frr
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
