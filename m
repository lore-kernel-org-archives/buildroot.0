From: David Skok <blanco.ether@gmail.com>
Date: Mon, 24 Jun 2013 14:39:04 -0400
Subject: [Buildroot] [PATCH 1/1] Add package ola (open lighting architecture)
Message-ID: <CALy4uEW6MVou2S4Lq1oLHfJR96ziqxiud2ULotK-jTRVPcsofA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Dave Skok <blanco.ether@gmail.com>
---
 package/Config.in     |    1 +
 package/ola/Config.in |  162 +++++++++++++++++++++++++++++++++++++++++++++++
 package/ola/ola.mk    |  168 +++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 331 insertions(+)
 create mode 100644 package/ola/Config.in
 create mode 100644 package/ola/ola.mk

diff --git a/package/Config.in b/package/Config.in
index 0eb6a9c..9deffde 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -674,6 +674,7 @@ source "package/empty/Config.in"
 source "package/googlefontdirectory/Config.in"
 source "package/mcrypt/Config.in"
 source "package/mobile-broadband-provider-info/Config.in"
+source "package/ola/Config.in"
 source "package/shared-mime-info/Config.in"
 source "package/snowball-init/Config.in"
 source "package/sound-theme-borealis/Config.in"
diff --git a/package/ola/Config.in b/package/ola/Config.in
new file mode 100644
index 0000000..41fdefb
--- /dev/null
+++ b/package/ola/Config.in
@@ -0,0 +1,162 @@
+config BR2_PACKAGE_OLA
+	bool "open lighting architecture"
+        select BR2_PACKAGE_PROTOBUF
+	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
+	help
+	  Open Lighting Architecture provides applications
+          with a mechanism to send and receive DMX512 & RDM
+          commands using hardware devices and DMX over IP protocols.
+
+	  http://www.opendmx.net/index.php/OLA
+
+comment "OLA requires a toolchain with C++ support enabled"
+	depends on !BR2_INSTALL_LIBSTDCPP
+
+comment "OLA functionality desired may require a USB driver"
+	depends on !BR2_PACKAGE_LIBFTDI && !BR2_PACKAGE_LIBUSB
+
+if BR2_PACKAGE_OLA
+
+choice
+
+prompt "Version"
+
+config BR2_PACKAGE_OLA_RELEASE
+	bool "Release"
+	help
+	  OLA release version.
+
+config BR2_PACKAGE_OLA_GIT_VER
+	bool "Git"
+	help
+	  OLA from git.
+
+endchoice
+
+config BR2_PACKAGE_OLA_RELEASE_VER
+	string "release version"
+	default 0.8.31
+	depends on BR2_PACKAGE_OLA_RELEASE
+	help
+	  OLA version
+
+menu "OLA Bindings and Interface"
+
+config BR2_PACKAGE_OLA_WEB
+	bool "http interface"
+        select BR2_PACKAGE_LIBMICROHTTPD
+	help
+	  Build OLA with browser interface.
+
+config BR2_PACKAGE_OLA_SLP
+	bool "slp tools"
+	help
+	  Build OLA with slp tools.
+
+config BR2_PACKAGE_OLA_BINDING_PYTHON
+	bool "python bindings"
+        select BR2_PACKAGE_PYTHON
+	select BR2_PACKAGE_PYTHON_PROTOBUF
+	help
+	  Build OLA with support for the Python language.
+
+endmenu
+
+
+menu "Tests and Examples"
+
+config BR2_PACKAGE_OLA_EXAMPLES
+	bool "examples"
+	select BR2_PACKAGE_NCURSES
+	help
+	  Build OLA examples.
+
+config BR2_PACKAGE_OLA_RDM_TESTS
+	bool "rdm tests"
+	depends on BR2_PACKAGE_OLA_BINDING_PYTHON
+	help
+	  Build OLA RDM tests.
+
+endmenu
+
+menu "OLA Plugin selections"
+
+config BR2_PACKAGE_OLA_PLUGIN_ARTNET
+	bool "artnet"
+        default y
+	help
+	  Build Artnet plugin for OLA.
+
+config BR2_PACKAGE_OLA_PLUGIN_DUMMY
+	bool "dummy"
+        default y
+	help
+	  Build Dummy plugin for OLA.
+
+config BR2_PACKAGE_OLA_PLUGIN_E131
+	bool "acn E131"
+        default y
+	help
+	  Build ACN E131 plugin for OLA.
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
+config BR2_PACKAGE_OLA_PLUGIN_OPENDMX
+	bool "DMX4Linux"
+	help
+	  Build DMX4Linux plugin for OLA.
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
+config BR2_PACKAGE_OLA_PLUGIN_KARATE
+	bool "karate"
+	help
+	  Build Karate plugin for OLA.
+
+config BR2_PACKAGE_OLA_PLUGIN_SPI
+	bool "spi"
+	help
+	  Build SPI plugin for OLA.
+
+config BR2_PACKAGE_OLA_PLUGIN_STAGEPROFI
+	bool "stageprofi"
+	depends on BR2_PACKAGE_LIBFTDI || BR2_PACKAGE_LIBUSB
+	help
+	  Build StageProfi plugin for OLA.
+
+config BR2_PACKAGE_OLA_PLUGIN_USBPRO
+	bool "usbpro"
+	depends on BR2_PACKAGE_LIBFTDI || BR2_PACKAGE_LIBUSB
+	help
+	  Build UsbPro plugin for OLA.
+
+config BR2_PACKAGE_OLA_PLUGIN_OSC
+	bool "osc"
+	select BR2_PACKAGE_LIBLO
+	help
+	  Build Open sound control plugin for OLA.
+
+endmenu
+
+endif
diff --git a/package/ola/ola.mk b/package/ola/ola.mk
new file mode 100644
index 0000000..3fb5ace
--- /dev/null
+++ b/package/ola/ola.mk
@@ -0,0 +1,168 @@
+#############################################################
+#
+# ola - open lighting architecture
+#
+# Open Lighting Architecture provides applications
+# with a mechanism to send and receive DMX512 & RDM
+# commands using hardware devices and DMX over IP protocols.
+#
+#############################################################
+
+ifeq ($(BR2_PACKAGE_OLA_RELEASE),y)
+OLA_VERSION = $(call qstrip,$(BR2_PACKAGE_OLA_RELEASE_VER))
+OLA_SOURCE = ola-${OLA_VERSION}.tar.gz
+OLA_SITE = https://open-lighting.googlecode.com/files
+else
+OLA_VERSION = master
+OLA_SITE = https://code.google.com/p/open-lighting/
+OLA_SITE_METHOD = git
+endif
+
+OLA_AUTORECONF = YES
+OLA_LICENSE = LGPLv2.1+
+OLA_LICENSE_FILES = LICENSE COPYING.LGPLv2.1
+
+# util-linux provides uuid lib
+OLA_DEPENDENCIES += protobuf util-linux
+
+OLA_CONF_OPT = --prefix=/usr
+OLA_CONF_OPT += --disable-gcov
+OLA_CONF_OPT += --disable-tcmalloc
+OLA_CONF_OPT += --disable-unittests
+OLA_CONF_OPT += --disable-root-check
+OLA_CONF_OPT += --disable-java-libs
+
+# sets where to find python libs built for target and required by ola
+OLA_CONF_ENV =
PYTHONPATH=$(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages
+OLA_MAKE_ENV =
PYTHONPATH=$(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages
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
+ifeq ($(BR2_PACKAGE_OLA_BINDING_PYTHON),y)
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
+ifeq ($(BR2_PACKAGE_OLA_PLUGIN_ARTNET),y)
+OLA_CONF_OPT += --enable-artnet
+else
+OLA_CONF_OPT += --disable-artnet
+endif
+
+ifeq ($(BR2_PACKAGE_OLA_PLUGIN_DUMMY),y)
+OLA_CONF_OPT += --enable-dummy
+else
+OLA_CONF_OPT += --disable-dummy
+endif
+
+ifeq ($(BR2_PACKAGE_OLA_PLUGIN_E131),y)
+OLA_CONF_OPT += --enable-e131
+else
+OLA_CONF_OPT += --disable-e131
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
+ifeq ($(BR2_PACKAGE_OLA_PLUGIN_OPENDMX),y)
+OLA_CONF_OPT += --enable-opendmx
+else
+OLA_CONF_OPT += --disable-opendmx
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
+ifeq ($(BR2_PACKAGE_OLA_PLUGIN_KARATE),y)
+OLA_CONF_OPT += --enable-karate
+else
+OLA_CONF_OPT += --disable-karate
+endif
+
+ifeq ($(BR2_PACKAGE_OLA_PLUGIN_SPI),y)
+OLA_CONF_OPT += --enable-spi
+else
+OLA_CONF_OPT += --disable-spi
+endif
+
+ifeq ($(BR2_PACKAGE_OLA_PLUGIN_STAGEPROFI),y)
+OLA_CONF_OPT += --enable-stageprofi
+else
+OLA_CONF_OPT += --disable-stageprofi
+endif
+
+ifeq ($(BR2_PACKAGE_OLA_PLUGIN_USBPRO),y)
+OLA_CONF_OPT += --enable-usbpro
+else
+OLA_CONF_OPT += --disable-usbpro
+endif
+
+ifeq ($(BR2_PACKAGE_OLA_PLUGIN_OSC),y)
+OLA_CONF_OPT += --enable-osc
+OLA_DEPENDENCIES += liblo
+else
+OLA_CONF_OPT += --disable-osc
+endif
+
+$(eval $(autotools-package))
+
+
+
+
+
-- 
1.7.9.5
