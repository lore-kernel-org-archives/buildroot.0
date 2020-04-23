From: aduskett at gmail.com <aduskett@gmail.com>
Date: Thu, 23 Apr 2020 10:33:02 -0700
Subject: [Buildroot] [PATCH v3 2/2] package/firewalld: new package
In-Reply-To: <20200423173302.280424-1-aduskett@gmail.com>
References: <20200423173302.280424-1-aduskett@gmail.com>
Message-ID: <20200423173302.280424-2-aduskett@gmail.com>
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

 - Setting FIREWALLD_AUTORECONF=YES results in the following error:
   "error: cannot find input file: `po/Makefile.in.in'" As such, a manual call
   to autogen.sh is necessary with PATH=$(BR_PATH) set to ensure the script
   uses the host intltoolize binary.

 - Setting PYTHON="/usr/bin/env python$(PYTHON3_VERSION_MAJOR)" prevents
   Firewalld from setting the shebang in the installed python files to the full
   path to the python interpreter used when building.

 - The bundled provided SYSV init file has several bashisms and requires
   /etc/init.d/functions which buildroot doesn't provide. So instead, we
   provide a more simple init.d file in the package directory, which does not
   require bash.

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

 DEVELOPERS                       |  1 +
 package/Config.in                |  1 +
 package/firewalld/Config.in      | 39 +++++++++++++++
 package/firewalld/S41firewalld   | 40 +++++++++++++++
 package/firewalld/firewalld.hash |  3 ++
 package/firewalld/firewalld.mk   | 85 ++++++++++++++++++++++++++++++++
 6 files changed, 169 insertions(+)
 create mode 100644 package/firewalld/Config.in
 create mode 100644 package/firewalld/S41firewalld
 create mode 100644 package/firewalld/firewalld.hash
 create mode 100644 package/firewalld/firewalld.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index e0ab2f61bf..58d9a6200d 100644
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
index 918052bc38..07b4b5d863 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2029,6 +2029,7 @@ menu "Networking applications"
 	source "package/fail2ban/Config.in"
 	source "package/fastd/Config.in"
 	source "package/fcgiwrap/Config.in"
+	source "package/firewalld/Config.in"
 	source "package/flannel/Config.in"
 	source "package/fmc/Config.in"
 	source "package/fping/Config.in"
diff --git a/package/firewalld/Config.in b/package/firewalld/Config.in
new file mode 100644
index 0000000000..517bca7822
--- /dev/null
+++ b/package/firewalld/Config.in
@@ -0,0 +1,39 @@
+config BR2_PACKAGE_FIREWALLD
+	bool "firewalld"
+	depends on BR2_USE_MMU # ebtables, gobject-introspection
+	depends on BR2_PACKAGE_HOST_QEMU_ARCH_SUPPORTS # gobject-introspection
+	depends on BR2_USE_WCHAR # dbus-python, gettext
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12 # nftables
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # gobject-introspection
+	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus-python
+	depends on BR2_TOOLCHAIN_USES_GLIBC # gobject-introspection
+	depends on BR2_PACKAGE_PYTHON3 # gobject-introspection
+	select BR2_PACKAGE_DBUS # dbus-python
+	select BR2_PACKAGE_DBUS_PYTHON
+	select BR2_PACKAGE_EBTABLES
+	select BR2_PACKAGE_GETTEXT
+	select BR2_PACKAGE_GOBJECT_INTROSPECTION
+	select BR2_PACKAGE_IPSET
+	select BR2_PACKAGE_IPTABLES
+	select BR2_PACKAGE_JANSSON # Runtime
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
index 0000000000..93cf67ccea
--- /dev/null
+++ b/package/firewalld/firewalld.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  769c57d5c49218821ad30639a3f802831f9618899e403a811802c56e30f93c79  firewalld-v0.8.2.tar.gz
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/firewalld/firewalld.mk b/package/firewalld/firewalld.mk
new file mode 100644
index 0000000000..aedc250be1
--- /dev/null
+++ b/package/firewalld/firewalld.mk
@@ -0,0 +1,84 @@
+################################################################################
+#
+# firewalld
+#
+################################################################################
+
+FIREWALLD_VERSION = v0.8.2
+FIREWALLD_SITE = $(call github,firewalld,firewalld,$(FIREWALLD_VERSION))
+FIREWALLD_LICENSE = GPL-2.0
+FIREWALLD_LICENSE_FILES = COPYING
+
+FIREWALLD_DEPENDENCIES = \
+	host-intltool \
+	host-libglib2 \
+	host-libxml2 \
+	host-libxslt \
+	dbus-python \
+	ebtables \
+	gettext \
+	gobject-introspection \
+	ipset \
+	iptables \
+	jansson \
+	nftables \
+	python3 \
+	python-decorator \
+	python-gobject \
+	python-six \
+	python-slip-dbus
+
+# configure is missing but firewalld is not compatible with our autoreconf
+# mechanism so we have to do it manually instead of using
+# FIREWALLD_AUTORECONF = YES
+define FIREWALLD_RUN_AUTOGEN
+	cd $(@D) && PATH=$(BR_PATH) ./autogen.sh
+endef
+FIREWALLD_PRE_CONFIGURE_HOOKS += FIREWALLD_RUN_AUTOGEN
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
+# /etc/sysconfig/firewalld is a Red Hat-ism, only referenced by
+# the Red Hat-specific init script which isn't used, so we set
+# --disable-sysconfig.
+FIREWALLD_CONF_OPTS += \
+	--disable-rpmmacros \
+	--disable-sysconfig \
+	--with-ip6tables-restore=/usr/sbin/ip6tables-restore \
+	--with-ip6tables=/usr/sbin/ip6tables \
+	--with-iptables-restore=/usr/sbin/iptables-restore \
+	--with-iptables=/usr/sbin/iptables \
+	--with-nft=/usr/sbin/nft \
+	--without-ebtables \
+	--without-ebtables-restore \
+	--without-ipset \
+	--without-xml-catalog
+
+ifeq ($(BR2_PACKAGE_SYSTEMD),y)
+FIREWALLD_DEPENDENCIES += systemd
+FIREWALLD_CONF_OPTS += --with-systemd-unitdir=/usr/lib/systemd/system
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
2.25.3
