From: aduskett at gmail.com <aduskett@gmail.com>
Date: Mon, 30 Mar 2020 16:46:14 -0700
Subject: [Buildroot] [PATCH 3/5] package/python-slip-dbus: new package
In-Reply-To: <20200330234616.1665466-1-aduskett@gmail.com>
References: <20200330234616.1665466-1-aduskett@gmail.com>
Message-ID: <20200330234616.1665466-3-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

A dbus.service.Object derivative that ends
itself after a certain time without being used and/or if there
are no clients anymore on the message bus, as well as
convenience functions and decorators for integrating a dbus
service with PolicyKit.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 DEVELOPERS                                    |  1 +
 package/Config.in                             |  1 +
 package/python-slip-dbus/Config.in            | 29 +++++++++++++++++++
 .../python-slip-dbus/python-slip-dbus.hash    |  3 ++
 package/python-slip-dbus/python-slip-dbus.mk  | 20 +++++++++++++
 5 files changed, 54 insertions(+)
 create mode 100644 package/python-slip-dbus/Config.in
 create mode 100644 package/python-slip-dbus/python-slip-dbus.hash
 create mode 100644 package/python-slip-dbus/python-slip-dbus.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index f1bf5c263c..64f0333fbb 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -73,6 +73,7 @@ F:	package/python-nested-dict/
 F:	package/python-pbr/
 F:	package/python-pip/
 F:	package/python-psycopg2/
+F:	package/python-slip-dbus/
 F:	package/python-smmap2/
 F:	package/python-sqlalchemy/
 F:	package/python-sqlparse/
diff --git a/package/Config.in b/package/Config.in
index 4aaf2d93f8..e6c5bb11c6 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1143,6 +1143,7 @@ menu "External python modules"
 	source "package/python-singledispatch/Config.in"
 	source "package/python-sip/Config.in"
 	source "package/python-six/Config.in"
+	source "package/python-slip-dbus/Config.in"
 	source "package/python-slob/Config.in"
 	source "package/python-smbus-cffi/Config.in"
 	source "package/python-smmap2/Config.in"
diff --git a/package/python-slip-dbus/Config.in b/package/python-slip-dbus/Config.in
new file mode 100644
index 0000000000..98bc762055
--- /dev/null
+++ b/package/python-slip-dbus/Config.in
@@ -0,0 +1,29 @@
+config BR2_PACKAGE_PYTHON_SLIP_DBUS
+	bool "python-slip-dbus"
+	depends on BR2_PACKAGE_DBUS # runtime
+	depends on BR2_USE_MMU # libglib2, gobject-introspection
+	depends on BR2_PACKAGE_HOST_QEMU_ARCH_SUPPORTS # gobject-introspection
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # gobject-introspection
+	depends on BR2_TOOLCHAIN_USES_GLIBC # gobject-introspection
+	depends on BR2_PACKAGE_PYTHON3 # gobject-introspection
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
+comment "python-slip-dbus needs python3"
+	depends on !BR2_PACKAGE_PYTHON3
+
+comment "python-slip-dbus needs a glibc toolchain, gcc >= 4.9"
+	depends on BR2_USE_MMU
+	depends on BR2_PACKAGE_DBUS && BR2_PACKAGE_HOST_QEMU_ARCH_SUPPORTS
+	depends on !BR2_TOOLCHAIN_USES_GLIBC || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
diff --git a/package/python-slip-dbus/python-slip-dbus.hash b/package/python-slip-dbus/python-slip-dbus.hash
new file mode 100644
index 0000000000..8a88533169
--- /dev/null
+++ b/package/python-slip-dbus/python-slip-dbus.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  7a52ebe49945cd27d06a1172042a55eb5c79cfda49b742153fa076d1d9bd99a1  python-slip-0.6.5.tar.gz
+sha256  1ca3e8f71b7de618968e7ea9fe47822d9e704dc476aef8544033abedec355225  COPYING
diff --git a/package/python-slip-dbus/python-slip-dbus.mk b/package/python-slip-dbus/python-slip-dbus.mk
new file mode 100644
index 0000000000..20b587fd5c
--- /dev/null
+++ b/package/python-slip-dbus/python-slip-dbus.mk
@@ -0,0 +1,20 @@
+################################################################################
+#
+# python-slip-dbus
+#
+################################################################################
+
+PYTHON_SLIP_DBUS_VERSION = 0.6.5
+PYTHON_SLIP_DBUS_SOURCE = python-slip-$(PYTHON_SLIP_DBUS_VERSION).tar.gz
+PYTHON_SLIP_DBUS_SITE = https://github.com/nphilipp/python-slip/archive
+PYTHON_SLIP_DBUS_LICENSE = GPL-2.0+
+PYTHON_SLIP_DBUS_LICENSE_FILES = COPYING
+PYTHON_SLIP_DBUS_SETUP_TYPE = distutils
+PYTHON_SLIP_DBUS_DEPENDENCIES = python-gobject
+
+define PYTHON_SLIP_DBUS_APPEND_VERSION
+	cd $(@D); sed -e 's/@VERSION@/$(PYTHON_SLIP_DBUS_VERSION)/g' setup.py.in > setup.py
+endef
+PYTHON_SLIP_DBUS_PRE_CONFIGURE_HOOKS += PYTHON_SLIP_DBUS_APPEND_VERSION
+
+$(eval $(python-package))
-- 
2.25.1
