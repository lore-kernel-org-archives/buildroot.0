From: Carlos Santos <casantos@datacom.ind.br>
Date: Wed, 13 Sep 2017 23:24:25 -0300
Subject: [Buildroot] [RFC v0] libvirt: new package
Message-ID: <20170914022425.3009-1-casantos@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Libvirt is collection of software that provides a convenient way to
manage virtual machines and other virtualization functionality, such as
storage and network interface management. These software pieces include
an API library, a daemon (libvirtd), and a command line utility (virsh).

http://libvirt.org/

---
v0: primitive package, for experimental purposes only
---
 package/Config.in            |  1 +
 package/libvirt/Config.in    | 22 ++++++++++++++++++++++
 package/libvirt/libvirt.hash |  2 ++
 package/libvirt/libvirt.mk   | 25 +++++++++++++++++++++++++
 4 files changed, 50 insertions(+)
 create mode 100644 package/libvirt/Config.in
 create mode 100644 package/libvirt/libvirt.hash
 create mode 100644 package/libvirt/libvirt.mk

diff --git a/package/Config.in b/package/Config.in
index 48d1381921..d4e40a6326 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1888,6 +1888,7 @@ menu "System tools"
 	source "package/keyutils/Config.in"
 	source "package/kmod/Config.in"
 	source "package/kvmtool/Config.in"
+	source "package/libvirt/Config.in"
 	source "package/lxc/Config.in"
 	source "package/monit/Config.in"
 	source "package/ncdu/Config.in"
diff --git a/package/libvirt/Config.in b/package/libvirt/Config.in
new file mode 100644
index 0000000000..c8792eaa14
--- /dev/null
+++ b/package/libvirt/Config.in
@@ -0,0 +1,22 @@
+config BR2_PACKAGE_LIBVIRT
+	bool "libvirt"
+	depends on !BR2_STATIC_LIBS # libnl, lvm2
+	depends on BR2_USE_MMU # needs fork()
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libnl, libtirpc
+	select BR2_PACKAGE_LIBNL
+	select BR2_PACKAGE_LIBTIRPC
+	select BR2_PACKAGE_LIBXML2
+	select BR2_PACKAGE_LVM2
+	select BR2_PACKAGE_YAJL
+	help
+	  Libvirt is collection of software that provides a convenient
+	  way to manage virtual machines and other virtualization
+	  functionality, such as storage and network interface
+	  management. These software pieces include an API library, a
+	  daemon (libvirtd), and a command line utility (virsh).
+
+	  http://libvirt.org/
+
+comment "libvirt needs a glibc or uClibc toolchain w/ threads, dynamic library"
+        depends on BR2_USE_MMU
+        depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS || BR2_TOOLCHAIN_USES_MUSL
diff --git a/package/libvirt/libvirt.hash b/package/libvirt/libvirt.hash
new file mode 100644
index 0000000000..389a3c1670
--- /dev/null
+++ b/package/libvirt/libvirt.hash
@@ -0,0 +1,2 @@
+# locally computed
+sha256 4e7bcb209eeef99f026484293abc733e30ed06dabcdde62c4c3e95f71b2b67ba  libvirt-3.7.0.tar.xz
diff --git a/package/libvirt/libvirt.mk b/package/libvirt/libvirt.mk
new file mode 100644
index 0000000000..78f100a9c2
--- /dev/null
+++ b/package/libvirt/libvirt.mk
@@ -0,0 +1,25 @@
+################################################################################
+#
+# libvirt
+#
+################################################################################
+
+LIBVIRT_VERSION = 3.7.0
+LIBVIRT_SITE = http://libvirt.org/sources
+LIBVIRT_SOURCE = libvirt-$(LIBVIRT_VERSION).tar.xz
+LIBVIRT_LICENSE = LGPL-2.1+
+LIBVIRT_LICENSE_FILES = COPYING
+# LIBVIRT_INSTALL_STAGING = YES
+LIBVIRT_DEPENDENCIES = libnl libtirpc libxml2 lvm2 yajl
+LIBVIRT_CONF_ENV += \
+	CFLAGS="$(TARGET_CFLAGS) `$(PKG_CONFIG_HOST_BINARY) --cflags libtirpc`" \
+	LIBS="`$(PKG_CONFIG_HOST_BINARY) --libs libtirpc`"
+
+LIBVIRT_CONF_OPTS = \
+	--disable-debug \
+	--with-gnu-ld \
+	--without-dtrace \
+	--without-vmware \
+	--without-vbox
+
+$(eval $(autotools-package))
-- 
2.13.5
