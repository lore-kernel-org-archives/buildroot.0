From: aduskett at gmail.com <aduskett@gmail.com>
Date: Mon, 30 Mar 2020 16:46:15 -0700
Subject: [Buildroot] [PATCH 4/5] package/firewalld: new package
In-Reply-To: <20200330234616.1665466-1-aduskett@gmail.com>
References: <20200330234616.1665466-1-aduskett@gmail.com>
Message-ID: <20200330234616.1665466-4-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

Firewalld provides a dynamically managed firewall with support for network or
firewall zones to define the trust level of network connections or interfaces.
It has support for IPv4, IPv6 firewall settings and for ethernet bridges and
a separation of runtime and permanent configuration options.

It also provides an interface for services or applications to add iptables and
ebtables rules directly.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 DEVELOPERS                                    |  1 +
 package/Config.in                             |  1 +
 ...on-to-disable-building-documentation.patch | 90 +++++++++++++++++++
 package/firewalld/Config.in                   | 42 +++++++++
 package/firewalld/firewalld.hash              |  3 +
 package/firewalld/firewalld.init              | 52 +++++++++++
 package/firewalld/firewalld.mk                | 79 ++++++++++++++++
 7 files changed, 268 insertions(+)
 create mode 100644 package/firewalld/0001-Add-an-option-to-disable-building-documentation.patch
 create mode 100644 package/firewalld/Config.in
 create mode 100644 package/firewalld/firewalld.hash
 create mode 100644 package/firewalld/firewalld.init
 create mode 100644 package/firewalld/firewalld.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 64f0333fbb..240ceb6533 100644
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
index e6c5bb11c6..dbe084711c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2016,6 +2016,7 @@ menu "Networking applications"
 	source "package/fail2ban/Config.in"
 	source "package/fastd/Config.in"
 	source "package/fcgiwrap/Config.in"
+	source "package/firewalld/Config.in"
 	source "package/flannel/Config.in"
 	source "package/fmc/Config.in"
 	source "package/fping/Config.in"
diff --git a/package/firewalld/0001-Add-an-option-to-disable-building-documentation.patch b/package/firewalld/0001-Add-an-option-to-disable-building-documentation.patch
new file mode 100644
index 0000000000..150a74a4a5
--- /dev/null
+++ b/package/firewalld/0001-Add-an-option-to-disable-building-documentation.patch
@@ -0,0 +1,90 @@
+From 1627f1046515e93f7acb34fbfededecf9e1b16a7 Mon Sep 17 00:00:00 2001
+From: Adam Duskett <Aduskett@gmail.com>
+Date: Sun, 29 Mar 2020 16:28:06 -0700
+Subject: [PATCH] improvement: build: add an option to disable building
+ documentation
+
+For embedded applications such as Buildroot or Yocto, the man pages may not be
+desired or even capable of being built.
+
+On line 45 of configure.ac there is the line:
+JH_CHECK_XML_CATALOG([http://docbook.sourceforge.net/release/xsl/current/manpages/docbook.xsl], [DocBook XSL Stylesheets])
+
+There are three issues with this:
+  - It requires building the xml-catalog package.
+  - It automatically defaults to the host systems xml-catalog
+    instead of the cross environments.
+  - It isn't necessary to have a functioning firewalld.
+
+Create a new option: --disable-docs. By default, build the documentation, but
+if a user passes --disable-docs documentation will no longer be built as
+desired.
+
+Upstream-Status: Merged
+See: https://github.com/firewalld/firewalld/pull/596
+
+Signed-off-by: Adam Duskett <aduskett@gmail.com>
+---
+ configure.ac             | 7 ++++++-
+ doc/man/man1/Makefile.am | 2 ++
+ doc/man/man5/Makefile.am | 2 ++
+ doc/xml/Makefile.am      | 2 ++
+ 4 files changed, 12 insertions(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 0758c69d..84f48037 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -42,7 +42,12 @@ GLIB_GSETTINGS
+ 
+ #############################################################
+ 
+-JH_CHECK_XML_CATALOG([http://docbook.sourceforge.net/release/xsl/current/manpages/docbook.xsl], [DocBook XSL Stylesheets])
++AC_ARG_ENABLE([docs],
++    [AS_HELP_STRING([--disable-docs], [Disable building documentation])])
++AM_CONDITIONAL([ENABLE_DOCS], [test x$enable_docs != xno])
++AM_COND_IF([ENABLE_DOCS], [
++    JH_CHECK_XML_CATALOG([http://docbook.sourceforge.net/release/xsl/current/manpages/docbook.xsl], [DocBook XSL Stylesheets])
++])
+ 
+ #############################################################
+ 
+diff --git a/doc/man/man1/Makefile.am b/doc/man/man1/Makefile.am
+index 23343490..78c42fdc 100644
+--- a/doc/man/man1/Makefile.am
++++ b/doc/man/man1/Makefile.am
+@@ -1,3 +1,5 @@
++if ENABLE_DOCS
+ EXTRA_DIST = $(man_MANS)
+ 
+ man_MANS = firewall*.1
++endif
+diff --git a/doc/man/man5/Makefile.am b/doc/man/man5/Makefile.am
+index 6ba37a9b..2ed35461 100644
+--- a/doc/man/man5/Makefile.am
++++ b/doc/man/man5/Makefile.am
+@@ -1,3 +1,5 @@
++if ENABLE_DOCS
+ EXTRA_DIST = $(man_MANS)
+ 
+ man_MANS = firewall*.5
++endif
+diff --git a/doc/xml/Makefile.am b/doc/xml/Makefile.am
+index d0313e3e..44a32528 100644
+--- a/doc/xml/Makefile.am
++++ b/doc/xml/Makefile.am
+@@ -1,5 +1,6 @@
+ XSLTPROC = xsltproc
+ 
++if ENABLE_DOCS
+ EXTRA_DIST = $(HTMLS:../html/%.html=%.xml) \
+ 	authors.xml notes.xml seealso.xml errorcodes.xml \
+ 	transform-man.xsl.in transform-html.xsl.in \
+@@ -27,6 +28,7 @@ man5_MANS = \
+ 	../man/man5/firewalld.service.5 \
+ 	../man/man5/firewalld.zone.5 \
+ 	../man/man5/firewalld.zones.5
++endif
+ 
+ CLEAN_FILES = *~ errorcodes.xml
+ DISTCLEANFILES = $(man_MANS) $(HTMLS) transform-*.xsl \
diff --git a/package/firewalld/Config.in b/package/firewalld/Config.in
new file mode 100644
index 0000000000..2b74655b1a
--- /dev/null
+++ b/package/firewalld/Config.in
@@ -0,0 +1,42 @@
+config BR2_PACKAGE_FIREWALLD
+	bool "firewalld"
+	depends on BR2_USE_MMU # ebtables, gobject-introspection
+	depends on BR2_USE_WCHAR # dbus-python, gettext
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12 # nftables
+	depends on BR2_PACKAGE_HOST_QEMU_ARCH_SUPPORTS # gobject-introspection
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # gobject-introspection
+	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus-python
+	depends on BR2_TOOLCHAIN_USES_GLIBC # gobject-introspection
+	depends on BR2_PACKAGE_DBUS # dbus-python
+	depends on BR2_PACKAGE_PYTHON3 # gobject-introspection
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
+comment "firewalld needs python3"
+	depends on !BR2_PACKAGE_PYTHON3
+
+comment "firewalld needs a glibc toolchain w/ wchar, threads, gcc >= 4.9"
+	depends on BR2_USE_MMU || !BR2_USE_WCHAR
+	depends on BR2_PACKAGE_DBUS && BR2_PACKAGE_HOST_QEMU_ARCH_SUPPORTS
+	depends on !BR2_TOOLCHAIN_USES_GLIBC || \
+		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
diff --git a/package/firewalld/firewalld.hash b/package/firewalld/firewalld.hash
new file mode 100644
index 0000000000..ed4ac54a67
--- /dev/null
+++ b/package/firewalld/firewalld.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256 cfdf40890bca18892d1695bd902ede695cb2a61e1fcf809a2f8c394ca788a31e firewalld-v0.8.1.tar.gz
+sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 COPYING
diff --git a/package/firewalld/firewalld.init b/package/firewalld/firewalld.init
new file mode 100644
index 0000000000..72c9f7a31a
--- /dev/null
+++ b/package/firewalld/firewalld.init
@@ -0,0 +1,52 @@
+#!/bin/sh
+
+firewalld=/usr/sbin/firewalld
+pidfile=/var/run/firewalld.pid
+
+start() {
+  printf "Starting firewalld: "
+  start-stop-daemon -S -q --exec $firewalld
+  [ $? = 0 ] && echo "OK" || echo "FAIL"
+}
+stop() {
+  printf "Stopping firewalld: "
+  start-stop-daemon --stop --quiet --pidfile $pidfile
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
+
+case "$1" in
+    start)
+      start
+      ;;
+    stop)
+      stop
+      ;;
+    restart)
+      restart
+      ;;
+    reload)
+      reload
+      ;;
+    status)
+      status
+      ;;
+    *)
+      echo "Usage: $0 {start|stop|restart|reload|status}"
+      exit 1
+esac
diff --git a/package/firewalld/firewalld.mk b/package/firewalld/firewalld.mk
new file mode 100644
index 0000000000..e028a01c84
--- /dev/null
+++ b/package/firewalld/firewalld.mk
@@ -0,0 +1,79 @@
+################################################################################
+#
+# firewalld
+#
+################################################################################
+
+FIREWALLD_VERSION = v0.8.1
+FIREWALLD_SITE = $(call github,firewalld,firewalld,$(FIREWALLD_VERSION))
+FIREWALLD_LICENSE = GPL-2.0
+FIREWALLD_LICENSE_FILES = COPYING
+FIREWALLD_AUTORECONF = YES
+FIREWALLD_DEPENDENCIES = \
+	host-intltool \
+	host-libglib2 \
+	host-libxml2 \
+	host-libxslt \
+	dbus-python \
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
+define FIREWALLD_RUN_AUTOGEN
+	cd $(@D) && $(HOST_DIR)/bin/intltoolize --force
+endef
+FIREWALLD_PRE_CONFIGURE_HOOKS += FIREWALLD_RUN_AUTOGEN
+
+# iptables, ip6tables, ebtables, and ipset *should* be unnecessary
+# when the nftables backend is available, because nftables supersedes all of
+# them. However we still need to build and install iptables and ip6tables
+# because application relying on direct passthrough rules (IE docker) will
+# break.
+# /etc/sysconfig/firewalld is a Red Hat-ism, only referenced by
+# the Red Hat-specific init script which isn't used.
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
+
+# Firewalld hard codes the python shebangs to the full path of the
+# python-interpreter. IE: #!/home/buildroot/output/host/bin/python.
+# Force the proper python path.
+FIREWALLD_CONF_ENV += PYTHON="/usr/bin/env python$(PYTHON3_VERSION_MAJOR)"
+
+ifeq ($(BR2_PACKAGE_SYSTEMD),y)
+FIREWALLD_CONF_OPTS += --with-systemd-unitdir=/usr/lib/systemd/system
+else
+FIREWALLD_CONF_OPTS += --disable-systemd
+endif
+
+define FIREWALLD_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 0644 $(FIREWALLD_PKGDIR)/firewalld.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/firewalld.service
+endef
+
+define FIREWALLD_INSTALL_INIT_SYSV
+	$(INSTALL) -m 0755 -D $(FIREWALLD_PKGDIR)/firewalld.init \
+		$(TARGET_DIR)/etc/init.d/S41firewalld
+endef
+
+$(eval $(autotools-package))
-- 
2.25.1
