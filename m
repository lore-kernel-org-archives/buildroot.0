From: aduskett at gmail.com <aduskett@gmail.com>
Date: Wed, 15 Jul 2020 10:51:28 -0700
Subject: [Buildroot] [PATCH v5 2/4] package/firewalld: new package
In-Reply-To: <20200715175130.591273-1-aduskett@gmail.com>
References: <20200715175130.591273-1-aduskett@gmail.com>
Message-ID: <20200715175130.591273-2-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

Firewalld provides a dynamically managed firewall with
support for network or firewall zones to define the trust level of network
connections or interfaces.

Items of note:

 - Iptables is set as a requirement because many applications such as Docker
   require direct-passthrough rules which firewalld does not support.

 - Setting PYTHON="/usr/bin/env python$(PYTHON3_VERSION_MAJOR)" prevents
   Firewalld from setting the shebang in the installed python files to the
   full path to the python interpreter used when building.

 - The bundled provided SYSV init file has several bashisms and requires
   /etc/init.d/functions which buildroot doesn't provide. So instead, a more
   simple init.d file is provided in the package directory, which does not
   require bash.

 - Firewalld >= 0.6.0 requires a linux kernel version of 4.18 or later.
   Because Buildroot does not have a mechanism to detect what version a user
   is compiling if the kernel is external, there is no way to prevent a user
   with an external kernel older than 4.18 to select this package.

   As such, there is a note in the Config.in help text that notifies users of
   the kernel version requirement. See
   https://firewalld.org/2018/07/firewalld-0-6-0-release for more details.

 - As of this writing, firewalld does indeed require nftables, even if a user
   specifies iptables, ipset, or ebtables as the firewalld backend. There is
   an issue for this limitation here:
   https://github.com/firewalld/firewalld/issues/563

   As such, until a future release resolves this issue, Firewalld must select
   nftables and requires kernel 4.18 or later. In the future, it may be
   possible to add support for different backends without requiring nftables,
   which would then support older kernel versions.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
Changes v1 -> v2:
  - Select DBUS (Yann)
  - Add some extra comments in the Makefile (Yann)
  - Add a more detailed commit message. (Yann)
  - Move dependency lines (Yann)
  - Combine dependency message (Yann)
  - Cleanup init file (Yann)
  - Install the systemd file.
  - Bump version from 0.8.1 to 0.8.2.
  - Drop upstream patch.

Changes v2 -> v3:
  - Fix subject line.

Changes v3 -> v4:
  - Add an explination about nftables in the commit message.
  - Add a note that firewalld requires kernel 4.18 in the Config.in
  - Add a better explination as to why Jansson is needed in the Config.in
  - Remove selecting ebtables and ipset from the Config.in (Yann)
  - Use the release tar.gz instead of the the github helper macro (Yann)
  - Remove ebtables and ipset from firewalld.mk (Yann)
  - Remove the FIREWALLD_RUN_AUTOGEN macro thanks to the above tar.gz (Yann)
  - Remove the call --with-nft=/usr/sbin/nft as the nft binary is no longer
    used, in favor of the native nft JSON interface.
  - Add a check for NLS and set --enable-nls if BR2_SYSTEM_ENABLE_NLS is set.
  - Add a call to --enable-systemd if systemd is selected (Yann)

Changes v4 -> v5:
  - Bump firewalld version to 0.8.3

 DEVELOPERS                       |  1 +
 package/Config.in                |  1 +
 package/firewalld/Config.in      | 40 ++++++++++++++++
 package/firewalld/S41firewalld   | 40 ++++++++++++++++
 package/firewalld/firewalld.hash |  3 ++
 package/firewalld/firewalld.mk   | 81 ++++++++++++++++++++++++++++++++
 6 files changed, 166 insertions(+)
 create mode 100644 package/firewalld/Config.in
 create mode 100644 package/firewalld/S41firewalld
 create mode 100644 package/firewalld/firewalld.hash
 create mode 100644 package/firewalld/firewalld.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 774166d5ec..d96c016997 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -31,6 +31,7 @@ F:	package/audit/
 F:	package/busybox/
 F:	package/checkpolicy/
 F:	package/cppdb/
+F:	package/firewalld/
 F:	package/gobject-introspection/
 F:	package/gstreamer1/gstreamer1/
 F:	package/gstreamer1/gstreamer1-mm/
diff --git a/package/Config.in b/package/Config.in
index 3911485ea3..3db3c7ba43 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2042,6 +2042,7 @@ menu "Networking applications"
 	source "package/fail2ban/Config.in"
 	source "package/fastd/Config.in"
 	source "package/fcgiwrap/Config.in"
+	source "package/firewalld/Config.in"
 	source "package/flannel/Config.in"
 	source "package/fmc/Config.in"
 	source "package/fping/Config.in"
diff --git a/package/firewalld/Config.in b/package/firewalld/Config.in
new file mode 100644
index 0000000000..b6a57c04ee
--- /dev/null
+++ b/package/firewalld/Config.in
@@ -0,0 +1,40 @@
+config BR2_PACKAGE_FIREWALLD
+	bool "firewalld"
+	depends on BR2_USE_MMU # gobject-introspection
+	depends on BR2_USE_WCHAR # dbus-python, gettext
+	depends on BR2_PACKAGE_HOST_QEMU_ARCH_SUPPORTS # gobject-introspection
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # gobject-introspection
+	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus-python
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12 # nftables
+	depends on BR2_TOOLCHAIN_USES_GLIBC # gobject-introspection
+	depends on BR2_PACKAGE_PYTHON3 # gobject-introspection
+	select BR2_PACKAGE_DBUS # dbus-python
+	select BR2_PACKAGE_DBUS_PYTHON
+	select BR2_PACKAGE_GETTEXT
+	select BR2_PACKAGE_GOBJECT_INTROSPECTION
+	select BR2_PACKAGE_IPTABLES
+	select BR2_PACKAGE_JANSSON # Uses the nftables json interface
+	select BR2_PACKAGE_NFTABLES
+	select BR2_PACKAGE_PYTHON_DECORATOR
+	select BR2_PACKAGE_PYTHON_GOBJECT
+	select BR2_PACKAGE_PYTHON_SIX
+	select BR2_PACKAGE_PYTHON_SLIP_DBUS
+	help
+	  Firewalld provides a dynamically managed firewall with
+	  support for network or firewall zones to define the trust
+	  level of network connections or interfaces. It has support
+	  for IPv4, IPv6 firewall settings and for ethernet bridges and
+	  a separation of runtime and permanent configuration options.
+	  It also provides an interface for services or applications to
+	  add ip*tables and ebtables rules directly.
+
+	  Note: Firewalld uses nftables as the backend as requires
+	  kernel version >= 4.18.
+
+	  https://github.com/firewalld/firewalld
+
+comment "firewalld needs python3, and a glibc toolchain w/ gcc >= 4.9, threads"
+	depends on BR2_USE_MMU
+	depends on BR2_PACKAGE_HOST_QEMU_ARCH_SUPPORTS
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || !BR2_TOOLCHAIN_USES_GLIBC \
+		|| !BR2_TOOLCHAIN_HAS_THREADS || !BR2_PACKAGE_PYTHON3
diff --git a/package/firewalld/S41firewalld b/package/firewalld/S41firewalld
new file mode 100644
index 0000000000..270435f1f8
--- /dev/null
+++ b/package/firewalld/S41firewalld
@@ -0,0 +1,40 @@
+#!/bin/sh
+
+firewalld=/usr/sbin/firewalld
+pidfile=/var/run/firewalld.pid
+
+start() {
+  printf "Starting firewalld: "
+  start-stop-daemon -S -q --exec ${firewalld}
+  [ $? = 0 ] && echo "OK" || echo "FAIL"
+}
+
+stop() {
+  printf "Stopping firewalld: "
+  start-stop-daemon --stop --quiet --pidfile ${pidfile}
+  [ $? = 0 ] && echo "OK" || echo "FAIL"
+}
+
+reload(){
+  printf "Reloading firewalld: "
+  firewall-cmd --reload
+  [ $? = 0 ] && echo "OK" || echo "FAIL"
+}
+
+restart() {
+  stop
+  start
+}
+
+status(){
+  firewall-cmd --state
+}
+
+case "${1}" in
+    start|stop|restart|reload|status)
+      ${1}
+      ;;
+    *)
+      echo "Usage: $0 {start|stop|restart|reload|status}"
+      exit 1
+esac
diff --git a/package/firewalld/firewalld.hash b/package/firewalld/firewalld.hash
new file mode 100644
index 0000000000..6384dd02df
--- /dev/null
+++ b/package/firewalld/firewalld.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  4ecb16d82c2825ccfb8f109e543c0492cf6ea8c43e2d0f59901bddcead037dc6  firewalld-0.8.3.tar.gz
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/firewalld/firewalld.mk b/package/firewalld/firewalld.mk
new file mode 100644
index 0000000000..9f5f21d1ad
--- /dev/null
+++ b/package/firewalld/firewalld.mk
@@ -0,0 +1,81 @@
+################################################################################
+#
+# firewalld
+#
+################################################################################
+
+FIREWALLD_VERSION = 0.8.3
+# Use the release tarball to avoid having to use autoreconf
+FIREWALLD_SITE = https://github.com/firewalld/firewalld/releases/download/v$(FIREWALLD_VERSION)
+FIREWALLD_LICENSE = GPL-2.0
+FIREWALLD_LICENSE_FILES = COPYING
+
+FIREWALLD_DEPENDENCIES = \
+	host-intltool \
+	host-libglib2 \
+	host-libxml2 \
+	host-libxslt \
+	dbus-python \
+	gettext \
+	gobject-introspection \
+	iptables \
+	jansson \
+	nftables \
+	python3 \
+	python-decorator \
+	python-gobject \
+	python-six \
+	python-slip-dbus
+
+# Firewalld hard codes the python shebangs to the full path of the
+# python-interpreter. IE: #!/home/buildroot/output/host/bin/python.
+# Force the proper python path.
+FIREWALLD_CONF_ENV += PYTHON="/usr/bin/env python$(PYTHON3_VERSION_MAJOR)"
+
+# iptables, ip6tables, ebtables, and ipset *should* be unnecessary
+# when the nftables backend is available, because nftables supersedes all of
+# them. However we still need to build and install iptables and ip6tables
+# because application relying on direct passthrough rules (IE docker) will
+# break.
+# /etc/sysconfig/firewalld is a RedHat-ism, only referenced by
+# the RedHat specific init script which isn't used, so we set
+# --disable-sysconfig.
+FIREWALLD_CONF_OPTS += \
+	--disable-nls \
+	--disable-rpmmacros \
+	--disable-sysconfig \
+	--with-ip6tables-restore=/usr/sbin/ip6tables-restore \
+	--with-ip6tables=/usr/sbin/ip6tables \
+	--with-iptables-restore=/usr/sbin/iptables-restore \
+	--with-iptables=/usr/sbin/iptables \
+	--without-ebtables \
+	--without-ebtables-restore \
+	--without-ipset \
+	--without-xml-catalog
+
+ifeq ($(BR2_SYSTEM_ENABLE_NLS),y)
+FIREWALLD_CONF_OPTS += --enable-nls
+endif
+
+ifeq ($(BR2_PACKAGE_SYSTEMD),y)
+FIREWALLD_DEPENDENCIES += systemd
+FIREWALLD_CONF_OPTS += \
+	--enable-systemd \
+	--with-systemd-unitdir=/usr/lib/systemd/system
+else
+FIREWALLD_CONF_OPTS += --disable-systemd
+endif
+
+define FIREWALLD_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 0644 $(@D)/config/firewalld.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/firewalld.service
+endef
+
+# The bundled sysvinit file requires /etc/init.d/functions which is not
+# provided by buildroot. As such, we provide our own firewalld init file.
+define FIREWALLD_INSTALL_INIT_SYSV
+	$(INSTALL) -D -m 0755 $(FIREWALLD_PKGDIR)/S41firewalld \
+		$(TARGET_DIR)/etc/init.d/S41firewalld
+endef
+
+$(eval $(autotools-package))
-- 
2.26.2
