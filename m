From: aduskett at gmail.com <aduskett@gmail.com>
Date: Thu,  7 May 2020 16:14:54 -0700
Subject: [Buildroot] [PATCH/next v4 2/5] package/python-slip-dbus: new
 package
In-Reply-To: <20200507231457.2093052-1-aduskett@gmail.com>
References: <20200507231457.2093052-1-aduskett@gmail.com>
Message-ID: <20200507231457.2093052-2-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

This package provides a dbus.service.Object derivative that ends
itself after a certain time without being used and/or if there
are no clients anymore on the message bus.

The package also provides a set of convenience functions and decorators for
integrating a dbus service with PolicyKit.

Firewalld depends on this package.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
Changes v1 -> v2:
  - Combine dependency comment (Yann)
  - Add a more detailed commit message. (Yann)
  - Add an explination for the PYTHON_SLIP_DBUS_APPEND_VERSION hook. (Yann)

Changes v3 -> v4:
  - Clean up sed logic (Yann)
  - Switch to using the tar.bz2 package from github (Yann)
  - Add a missing dependency on wchar (Yann)

 DEVELOPERS                                    |  1 +
 package/Config.in                             |  1 +
 package/python-slip-dbus/Config.in            | 28 +++++++++++++++++++
 .../python-slip-dbus/python-slip-dbus.hash    |  3 ++
 package/python-slip-dbus/python-slip-dbus.mk  | 23 +++++++++++++++
 5 files changed, 56 insertions(+)
 create mode 100644 package/python-slip-dbus/Config.in
 create mode 100644 package/python-slip-dbus/python-slip-dbus.hash
 create mode 100644 package/python-slip-dbus/python-slip-dbus.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index e427ab15d4..906dfb92b3 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -75,6 +75,7 @@ F:	package/python-nested-dict/
 F:	package/python-pbr/
 F:	package/python-pip/
 F:	package/python-psycopg2/
+F:	package/python-slip-dbus/
 F:	package/python-smmap2/
 F:	package/python-sqlalchemy/
 F:	package/python-sqlparse/
diff --git a/package/Config.in b/package/Config.in
index c12676d859..206a73f168 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1151,6 +1151,7 @@ menu "External python modules"
 	source "package/python-singledispatch/Config.in"
 	source "package/python-sip/Config.in"
 	source "package/python-six/Config.in"
+	source "package/python-slip-dbus/Config.in"
 	source "package/python-slob/Config.in"
 	source "package/python-smbus-cffi/Config.in"
 	source "package/python-smmap2/Config.in"
diff --git a/package/python-slip-dbus/Config.in b/package/python-slip-dbus/Config.in
new file mode 100644
index 0000000000..25854f2708
--- /dev/null
+++ b/package/python-slip-dbus/Config.in
@@ -0,0 +1,28 @@
+config BR2_PACKAGE_PYTHON_SLIP_DBUS
+	bool "python-slip-dbus"
+	depends on BR2_USE_MMU # libglib2, gobject-introspection
+	depends on BR2_USE_WCHAR # dbus-python
+	depends on BR2_PACKAGE_HOST_QEMU_ARCH_SUPPORTS # gobject-introspection
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # gobject-introspection
+	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus, dbus-python, python3
+	depends on BR2_TOOLCHAIN_USES_GLIBC # gobject-introspection
+	depends on BR2_PACKAGE_PYTHON3 # gobject-introspection, python-gobject
+	select BR2_PACKAGE_DBUS # runtime
+	select BR2_PACKAGE_DBUS_PYTHON # runtime
+	select BR2_PACKAGE_PYTHON_DECORATOR  # runtime
+	select BR2_PACKAGE_PYTHON_GOBJECT  # runtime
+	select BR2_PACKAGE_PYTHON_SIX # runtime
+	help
+	  A dbus.service.Object derivative that ends
+	  itself after a certain time without being used and/or if there
+	  are no clients anymore on the message bus, as well as
+	  convenience functions and decorators for integrating a dbus
+	  service with PolicyKit.
+
+	  https://github.com/nphilipp/python-slip
+
+comment "python-slip-dbus needs python3, and a glibc toolchain w/ gcc >= 4.9, wchar, threads"
+	depends on BR2_USE_MMU
+	depends on BR2_PACKAGE_HOST_QEMU_ARCH_SUPPORTS
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || !BR2_TOOLCHAIN_USES_GLIBC \
+		|| !BR2_TOOLCHAIN_HAS_THREADS || !BR2_PACKAGE_PYTHON3
diff --git a/package/python-slip-dbus/python-slip-dbus.hash b/package/python-slip-dbus/python-slip-dbus.hash
new file mode 100644
index 0000000000..2dd3658396
--- /dev/null
+++ b/package/python-slip-dbus/python-slip-dbus.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  c726c086f0dd93a0ac7a0176f383a12af91b6657b78a301e3f5b25d9f8d4d10b  python-slip-0.6.5.tar.bz2
+sha256  1ca3e8f71b7de618968e7ea9fe47822d9e704dc476aef8544033abedec355225  COPYING
diff --git a/package/python-slip-dbus/python-slip-dbus.mk b/package/python-slip-dbus/python-slip-dbus.mk
new file mode 100644
index 0000000000..a587c351aa
--- /dev/null
+++ b/package/python-slip-dbus/python-slip-dbus.mk
@@ -0,0 +1,23 @@
+################################################################################
+#
+# python-slip-dbus
+#
+################################################################################
+
+PYTHON_SLIP_DBUS_VERSION = 0.6.5
+PYTHON_SLIP_DBUS_SOURCE = python-slip-$(PYTHON_SLIP_DBUS_VERSION).tar.bz2
+PYTHON_SLIP_DBUS_SITE = https://github.com/nphilipp/python-slip/releases/download/python-slip-$(PYTHON_SLIP_DBUS_VERSION)
+PYTHON_SLIP_DBUS_LICENSE = GPL-2.0+
+PYTHON_SLIP_DBUS_LICENSE_FILES = COPYING
+PYTHON_SLIP_DBUS_SETUP_TYPE = distutils
+PYTHON_SLIP_DBUS_DEPENDENCIES = python-gobject
+
+# Python-slip-dbus only packages a setup.py.in file with a @VERSION@ variable,
+# so we must create the file ourselves and sed the appropriate version number.
+define PYTHON_SLIP_DBUS_APPEND_VERSION
+	sed -e 's/@VERSION@/$(PYTHON_SLIP_DBUS_VERSION)/g' \
+		$(@D)/setup.py.in >$(@D)/setup.py
+endef
+PYTHON_SLIP_DBUS_PRE_CONFIGURE_HOOKS += PYTHON_SLIP_DBUS_APPEND_VERSION
+
+$(eval $(python-package))
-- 
2.26.2
