From: Dave Skok <blanco.ether@gmail.com>
Date: Mon, 26 Aug 2013 10:02:17 -0400
Subject: [Buildroot] [PATCH 1/1] ola: new package
Message-ID: <1377525737-14420-1-git-send-email-blanco.ether@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Dave Skok <blanco.ether@gmail.com>
---
 package/Config.in     |   1 +
 package/ola/Config.in | 136 ++++++++++++++++++++++++++++++++++++++++++++++
 package/ola/ola.mk    | 146 ++++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 283 insertions(+)
 create mode 100644 package/ola/Config.in
 create mode 100644 package/ola/ola.mk

diff --git a/package/Config.in b/package/Config.in
index 7069d77..fb52411 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -277,6 +277,7 @@ source "package/minicom/Config.in"
 source "package/nanocom/Config.in"
 source "package/neard/Config.in"
 source "package/ofono/Config.in"
+source "package/ola/Config.in"
 source "package/on2-8170-modules/Config.in"
 source "package/open2300/Config.in"
 source "package/openocd/Config.in"
diff --git a/package/ola/Config.in b/package/ola/Config.in
new file mode 100644
index 0000000..050f29b
--- /dev/null
+++ b/package/ola/Config.in
@@ -0,0 +1,136 @@
+config BR2_PACKAGE_OLA
+	bool "ola (open lighting architecture)"
+	select BR2_PACKAGE_PROTOBUF
+	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
+	select BR2_PACKAGE_UTIL_LINUX
+	depends on BR2_INSTALL_LIBSTDCPP # protobuf
+	depends on BR2_LARGEFILE # util-linux
+	depends on BR2_USE_WCHAR # util-linux
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	help
+	  Open Lighting Architecture provides applications 
+	  with a mechanism to send and receive DMX512 & RDM 
+	  commands using hardware devices and DMX over IP protocols.
+
+	  http://www.opendmx.net/index.php/OLA
+
+comment "ola requires a toolchain with C++, thread, largefile and wchar support"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_LARGEFILE || !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
+
+if BR2_PACKAGE_OLA
+
+menu "bindings and interface"
+
+config BR2_PACKAGE_OLA_WEB
+	bool "http interface"
+	select BR2_PACKAGE_LIBMICROHTTPD
+	help
+	  Build OLA with browser interface.
+
+config BR2_PACKAGE_OLA_PYTHON_BINDINGS
+	bool "python bindings"
+	select BR2_PACKAGE_PYTHON
+	select BR2_PACKAGE_PYTHON_PROTOBUF
+	depends on BR2_USE_MMU
+	help
+	  Build OLA with support for the Python language.
+
+config BR2_PACKAGE_OLA_SLP
+	bool "slp tools"
+	help
+	  Build OLA with slp tools.
+
+endmenu
+
+menu "tests and examples"
+
+config BR2_PACKAGE_OLA_EXAMPLES
+	bool "examples"
+	select BR2_PACKAGE_NCURSES
+	help
+	  Build OLA examples.
+
+config BR2_PACKAGE_OLA_RDM_TESTS
+	bool "rdm tests"
+	select BR2_PACKAGE_OLA_PYTHON_BINDINGS
+	select BR2_PACKAGE_PYTHON
+	select BR2_PACKAGE_PYTHON_PROTOBUF
+	depends on BR2_USE_MMU
+	help
+	  Build OLA RDM tests.
+
+endmenu
+
+menu "plugin selections"
+
+config BR2_PACKAGE_OLA_PLUGIN_E131
+	bool "acn E131"
+	help
+	  Build ACN E131 plugin for OLA.
+
+config BR2_PACKAGE_OLA_PLUGIN_ARTNET
+	bool "artnet"
+	help
+	  Build Artnet plugin for OLA.
+
+config BR2_PACKAGE_OLA_PLUGIN_OPENDMX
+	bool "DMX4Linux"
+	help
+	  Build DMX4Linux plugin for OLA.
+
+config BR2_PACKAGE_OLA_PLUGIN_DUMMY
+	bool "dummy"
+	help
+	  Build Dummy plugin for OLA.
+
+config BR2_PACKAGE_OLA_PLUGIN_ESPNET
+	bool "espnet"
+	help
+	  Build EspNet plugin for OLA.
+
+config BR2_PACKAGE_OLA_PLUGIN_KINET
+	bool "kinet"
+	help
+	  Build KiNet plugin for OLA.
+
+config BR2_PACKAGE_OLA_PLUGIN_MILINT
+	bool "Milford Instruments"
+	help
+	  Build Milford Instruments 1-463 plugin for OLA.
+
+config BR2_PACKAGE_OLA_PLUGIN_OSC
+	bool "osc"
+	select BR2_PACKAGE_LIBLO
+	help
+	  Build Open Sound Control plugin for OLA.
+
+config BR2_PACKAGE_OLA_PLUGIN_PATHPORT
+	bool "pathport"
+	help
+	  Build Pathport plugin for OLA.
+
+config BR2_PACKAGE_OLA_PLUGIN_SANDNET
+	bool "sandnet"
+	help
+	  Build SandNet plugin for OLA.
+
+config BR2_PACKAGE_OLA_PLUGIN_SHOWNET
+	bool "shownet"
+	help
+	  Build ShowNet plugin for OLA.
+
+config BR2_PACKAGE_OLA_PLUGIN_STAGEPROFI
+	bool "stageprofi"
+	select BR2_PACKAGE_LIBUSB
+	help
+	  Build StageProfi plugin for OLA.
+
+config BR2_PACKAGE_OLA_PLUGIN_USBPRO
+	bool "usbpro"
+	select BR2_PACKAGE_LIBUSB
+	help
+	  Build UsbPro plugin for OLA.
+
+endmenu
+
+endif
diff --git a/package/ola/ola.mk b/package/ola/ola.mk
new file mode 100644
index 0000000..55386b1
--- /dev/null
+++ b/package/ola/ola.mk
@@ -0,0 +1,146 @@
+################################################################################
+#
+# ola
+#
+################################################################################
+
+OLA_VERSION = 0.8.31
+OLA_SITE = https://open-lighting.googlecode.com/files
+
+OLA_LICENSE = LGPLv2.1+ (libola, libolacommon, Python bindings), GPLv2+ (libolaserver, olad, Python examples and tests)
+OLA_LICENSE_FILES = LICENCE GPL LGPL
+OLA_INSTALL_STAGING = YES
+
+# util-linux provides uuid lib
+OLA_DEPENDENCIES = protobuf util-linux
+
+OLA_CONF_OPT = \
+	--disable-gcov \
+	--disable-tcmalloc \
+	--disable-unittests \
+	--disable-root-check \
+	--disable-java-libs
+
+# sets where to find python libs built for target and required by ola
+OLA_CONF_ENV = PYTHONPATH=$(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages
+OLA_MAKE_ENV = PYTHONPATH=$(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages
+
+## OLA Bindings and Interface selections
+
+ifeq ($(BR2_PACKAGE_OLA_WEB),y)
+OLA_CONF_OPT += --enable-http
+OLA_DEPENDENCIES += libmicrohttpd
+else
+OLA_CONF_OPT += --disable-http
+endif
+
+ifeq ($(BR2_PACKAGE_OLA_SLP),y)
+OLA_CONF_OPT += --enable-slp
+else
+OLA_CONF_OPT += --disable-slp
+endif
+
+ifeq ($(BR2_PACKAGE_OLA_PYTHON_BINDINGS),y)
+OLA_CONF_OPT += --enable-python-libs
+OLA_DEPENDENCIES += python python-protobuf
+else
+OLA_CONF_OPT += --disable-python-libs
+endif
+
+## OLA Examples and Tests
+
+ifeq ($(BR2_PACKAGE_OLA_EXAMPLES),y)
+OLA_CONF_OPT += --enable-examples
+OLA_DEPENDENCIES += ncurses
+else
+OLA_CONF_OPT += --disable-examples
+endif
+
+ifeq ($(BR2_PACKAGE_OLA_RDM_TESTS),y)
+OLA_CONF_OPT += --enable-rdm-tests
+else
+OLA_CONF_OPT += --disable-rdm-tests
+endif
+
+## OLA Plugin selections
+
+ifeq ($(BR2_PACKAGE_OLA_PLUGIN_E131),y)
+OLA_CONF_OPT += --enable-e131
+else
+OLA_CONF_OPT += --disable-e131
+endif
+
+ifeq ($(BR2_PACKAGE_OLA_PLUGIN_ARTNET),y)
+OLA_CONF_OPT += --enable-artnet
+else
+OLA_CONF_OPT += --disable-artnet
+endif
+
+ifeq ($(BR2_PACKAGE_OLA_PLUGIN_OPENDMX),y)
+OLA_CONF_OPT += --enable-opendmx
+else
+OLA_CONF_OPT += --disable-opendmx
+endif
+
+ifeq ($(BR2_PACKAGE_OLA_PLUGIN_DUMMY),y)
+OLA_CONF_OPT += --enable-dummy
+else
+OLA_CONF_OPT += --disable-dummy
+endif
+
+ifeq ($(BR2_PACKAGE_OLA_PLUGIN_ESPNET),y)
+OLA_CONF_OPT += --enable-espnet
+else
+OLA_CONF_OPT += --disable-espnet
+endif
+
+ifeq ($(BR2_PACKAGE_OLA_PLUGIN_KINET),y)
+OLA_CONF_OPT += --enable-kinet
+else
+OLA_CONF_OPT += --disable-kinet
+endif
+
+ifeq ($(BR2_PACKAGE_OLA_PLUGIN_OSC),y)
+OLA_CONF_OPT += --enable-osc
+OLA_DEPENDENCIES += liblo
+else
+OLA_CONF_OPT += --disable-osc
+endif
+
+ifeq ($(BR2_PACKAGE_OLA_PLUGIN_MILINT),y)
+OLA_CONF_OPT += --enable-milinst
+else
+OLA_CONF_OPT += --disable-milinst
+endif
+
+ifeq ($(BR2_PACKAGE_OLA_PLUGIN_PATHPORT),y)
+OLA_CONF_OPT += --enable-pathport
+else
+OLA_CONF_OPT += --disable-pathport
+endif
+
+ifeq ($(BR2_PACKAGE_OLA_PLUGIN_SANDNET),y)
+OLA_CONF_OPT += --enable-sandnet
+else
+OLA_CONF_OPT += --disable-sandnet
+endif
+
+ifeq ($(BR2_PACKAGE_OLA_PLUGIN_SHOWNET),y)
+OLA_CONF_OPT += --enable-shownet
+else
+OLA_CONF_OPT += --disable-shownet
+endif
+
+ifeq ($(BR2_PACKAGE_OLA_PLUGIN_STAGEPROFI),y)
+OLA_CONF_OPT += --enable-stageprofi --enable-libusb
+else
+OLA_CONF_OPT += --disable-stageprofi
+endif
+
+ifeq ($(BR2_PACKAGE_OLA_PLUGIN_USBPRO),y)
+OLA_CONF_OPT += --enable-usbpro --enable-libusb
+else
+OLA_CONF_OPT += --disable-usbpro
+endif
+
+$(eval $(autotools-package))
-- 
1.8.3.4
