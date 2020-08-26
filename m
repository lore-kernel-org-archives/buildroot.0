From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 26 Aug 2020 23:03:40 +0200
Subject: [Buildroot] [git commit branch/next] package/frr: new package
Message-ID: <20200826210201.E4D1080FB4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=26d82d006ba15777d19892b327bde343d82a9ff5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

FRR is free software that implements and manages various IPv4 and IPv6
routing protocols. It runs on nearly all distributions of Linux and
BSD as well as Solaris and supports all modern CPU architectures.

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

Some not-needed features were disabled to minimize package
dependencies:

    - POSIX capabilities
    - RPKi

Signed-off-by: Vadim Kochan <vadim4j@gmail.com>
[Thomas:
 - select bash instead of depending on it
 - switch to version 7.4, since 7.3 was not building (it's using
   TRUE/FALSE, which are not standard, and this was fixed in 7.4)
 - use the github macro to define FRR_SITE
 - use host-python3 instead of host-python]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS            |  1 +
 package/Config.in     |  1 +
 package/frr/Config.in | 25 +++++++++++++++++++
 package/frr/S50frr    | 46 +++++++++++++++++++++++++++++++++++
 package/frr/frr.hash  |  3 +++
 package/frr/frr.mk    | 66 +++++++++++++++++++++++++++++++++++++++++++++++++++
 6 files changed, 142 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index e7569e6eb2..81391e5666 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2592,6 +2592,7 @@ F:	package/tstools/
 
 N:	Vadim Kochan <vadim4j@gmail.com>
 F:	package/brcm-patchram-plus/
+F:	package/frr/
 F:	package/gettext-tiny/
 F:	package/tinyssh/
 
diff --git a/package/Config.in b/package/Config.in
index 81ee3273f8..1a886a3597 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2055,6 +2055,7 @@ menu "Networking applications"
 	source "package/fping/Config.in"
 	source "package/freeswitch/Config.in"
 	source "package/freeswitch-mod-bcg729/Config.in"
+	source "package/frr/Config.in"
 	source "package/gerbera/Config.in"
 	source "package/gesftpserver/Config.in"
 	source "package/gloox/Config.in"
diff --git a/package/frr/Config.in b/package/frr/Config.in
new file mode 100644
index 0000000000..911913292f
--- /dev/null
+++ b/package/frr/Config.in
@@ -0,0 +1,25 @@
+config BR2_PACKAGE_FRR
+	bool "frr"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_STATIC_LIBS # libyang
+	depends on BR2_USE_MMU # fork()
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # json-c
+	select BR2_PACKAGE_BASH
+	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS # bash
+	select BR2_PACKAGE_C_ARES
+	select BR2_PACKAGE_LIBYANG
+	select BR2_PACKAGE_LIBNL
+	select BR2_PACKAGE_READLINE
+	select BR2_PACKAGE_JSON_C
+	help
+	  The FRRouting Protocol Suite.
+
+	  FRR is free software that implements and manages various
+	  IPv4 and IPv6 routing protocols.
+
+	  https://frrouting.org
+
+comment "frr needs a toolchain w/ threads, dynamic library"
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
+	depends on BR2_USE_MMU
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
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
index 0000000000..1c8c27ec4e
--- /dev/null
+++ b/package/frr/frr.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256 3c8204fda1c9b178d8446562579bbbc49d134b98f3ad02aa56f68724a2f9e40a  frr-7.4.tar.gz
+sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/frr/frr.mk b/package/frr/frr.mk
new file mode 100644
index 0000000000..a77afb52e4
--- /dev/null
+++ b/package/frr/frr.mk
@@ -0,0 +1,66 @@
+################################################################################
+#
+# frr
+#
+################################################################################
+
+FRR_VERSION = 7.4
+FRR_SITE = $(call github,FRRouting,frr,frr-$(FRR_VERSION))
+FRR_LICENSE = GPL-2.0
+FRR_LICENSE_FILES = COPYING
+FRR_AUTORECONF = YES
+
+FRR_DEPENDENCIES = host-frr readline json-c \
+	libyang libnl c-ares
+
+HOST_FRR_DEPENDENCIES = host-flex host-bison host-python3
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
+	$(foreach f,daemons daemons.conf frr.conf vtysh.conf support_bundle_commands.conf,\
+		$(INSTALL) -D -m 0640 $(@D)/tools/etc/frr/$(f) \
+			$(TARGET_DIR)/etc/frr/$(f)
+	)
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
