From: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
Date: Thu,  7 May 2020 18:17:20 +0200
Subject: [Buildroot] [PATCH] package/uhd: new package
Message-ID: <20200507161720.444799-1-gwenj@trabucayre.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>

Universal Software Radio Peripheral (USRP) Hardware Driver

This patch is a subset of all options.

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
---
 DEVELOPERS                                    |  1 +
 package/Config.in                             |  1 +
 ...add-boost-unit_test_framework-requir.patch | 40 ++++++++
 package/uhd/Config.in                         | 75 +++++++++++++++
 package/uhd/uhd.hash                          |  4 +
 package/uhd/uhd.mk                            | 94 +++++++++++++++++++
 6 files changed, 215 insertions(+)
 create mode 100644 package/uhd/0001-host-CMakeLists-add-boost-unit_test_framework-requir.patch
 create mode 100644 package/uhd/Config.in
 create mode 100644 package/uhd/uhd.hash
 create mode 100644 package/uhd/uhd.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index e427ab15d4..97abe3d61b 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1103,6 +1103,7 @@ F:	package/python-cheetah/
 F:	package/python-markdown/
 F:	package/python-remi/
 F:	package/python-sip/
+F:	package/uhd/
 
 N:	Heiko Thiery <heiko.thiery@gmail.com>
 F:	package/libnetconf2/
diff --git a/package/Config.in b/package/Config.in
index c12676d859..a21625b8d2 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1522,6 +1522,7 @@ menu "Hardware handling"
 	source "package/owfs/Config.in"
 	source "package/pcsc-lite/Config.in"
 	source "package/tslib/Config.in"
+	source "package/uhd/Config.in"
 	source "package/urg/Config.in"
 	source "package/wiringpi/Config.in"
 endmenu
diff --git a/package/uhd/0001-host-CMakeLists-add-boost-unit_test_framework-requir.patch b/package/uhd/0001-host-CMakeLists-add-boost-unit_test_framework-requir.patch
new file mode 100644
index 0000000000..a79b650bed
--- /dev/null
+++ b/package/uhd/0001-host-CMakeLists-add-boost-unit_test_framework-requir.patch
@@ -0,0 +1,40 @@
+From 881705ec581ab7cd61c8e4fe134db8854a83ec4e Mon Sep 17 00:00:00 2001
+From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
+Date: Tue, 28 Apr 2020 16:56:29 +0200
+Subject: [PATCH] host: CMakeLists: add boost unit_test_framework required only
+ when ENABLE_TESTS=ON
+
+By default, boost unit_test_framework is always required, but only use
+when ENABLE_TESTS=ON.
+This PR suppress unit_test_framework to the default list and append
+UHD_BOOST_REQUIRED_COMPONENTS when this library is needed
+
+[backported from https://github.com/EttusResearch/uhd/pull/341]
+Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
+---
+ host/CMakeLists.txt | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/host/CMakeLists.txt b/host/CMakeLists.txt
+index 8f72ece76..a7731ffbd 100644
+--- a/host/CMakeLists.txt
++++ b/host/CMakeLists.txt
+@@ -291,10 +291,14 @@ set(UHD_BOOST_REQUIRED_COMPONENTS
+     filesystem
+     program_options
+     system
+-    unit_test_framework
+     serialization
+     thread
+ )
++
++if(ENABLE_TESTS)
++    list(APPEND UHD_BOOST_REQUIRED_COMPONENTS unit_test_framework)
++endif(ENABLE_TESTS)
++
+ include(UHDBoost)
+ 
+ include_directories(${Boost_INCLUDE_DIRS})
+-- 
+2.26.2
+
diff --git a/package/uhd/Config.in b/package/uhd/Config.in
new file mode 100644
index 0000000000..a9664a4f90
--- /dev/null
+++ b/package/uhd/Config.in
@@ -0,0 +1,75 @@
+comment "uhd needs a toolchain w/ C++, NPTL, wchar, dynamic library"
+	depends on BR2_USE_MMU
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
+		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS
+
+config BR2_PACKAGE_UHD
+	bool "uhd"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on !BR2_STATIC_LIBS
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
+	depends on BR2_USE_MMU # use fork()
+	depends on BR2_USE_WCHAR # boost
+	select BR2_PACKAGE_BOOST
+	select BR2_PACKAGE_BOOST_CHRONO
+	select BR2_PACKAGE_BOOST_DATE_TIME
+	select BR2_PACKAGE_BOOST_FILESYSTEM
+	select BR2_PACKAGE_BOOST_PROGRAM_OPTIONS
+	select BR2_PACKAGE_BOOST_REGEX
+	select BR2_PACKAGE_BOOST_SERIALIZATION
+	select BR2_PACKAGE_BOOST_SYSTEM
+	select BR2_PACKAGE_BOOST_THREAD
+	select BR2_PACKAGE_BOOST_ATOMIC
+	help
+	  Universal Software Radio Peripheral (USRP) Hardware Driver
+
+	  https://kb.etthus.com
+
+if BR2_PACKAGE_UHD
+
+config BR2_PACKAGE_UHD_B100
+	bool "b100 support"
+	select BR2_PACKAGE_UHD_USB
+	help
+	  enable B100 support
+
+config BR2_PACKAGE_UHD_B200
+	bool "b200 support"
+	select BR2_PACKAGE_UHD_USB
+	help
+	  enable B200 support
+
+config BR2_PACKAGE_UHD_E300
+	bool "E300 support"
+	select BR2_PACKAGE_UHD_MPMD
+	help
+	  enable E300 support
+
+config BR2_PACKAGE_UHD_E320
+	bool "E320 support"
+	select BR2_PACKAGE_UHD_MPMD
+	help
+	  enable E320 support
+
+config BR2_PACKAGE_UHD_EXAMPLES
+	bool "uhd-examples"
+	help
+	  Examples
+
+config BR2_PACKAGE_UHD_MPMD
+	bool "MPMD support"
+	help
+	  enable MPMD support
+
+config BR2_PACKAGE_UHD_RFNOC
+	bool "RFNoC support"
+	help
+	  enable RFNoC support
+
+config BR2_PACKAGE_UHD_USB
+	bool "USB support"
+	select BR2_PACKAGE_LIBUSB
+	help
+	  enable UHD USB support
+
+endif
diff --git a/package/uhd/uhd.hash b/package/uhd/uhd.hash
new file mode 100644
index 0000000000..cfd1f3f641
--- /dev/null
+++ b/package/uhd/uhd.hash
@@ -0,0 +1,4 @@
+# Locally calculated:
+sha256  eed4a77d75faafff56be78985950039f8d9d1eb9fcbd58b8862e481dd49825cd  uhd-3.15.0.0.tar.gz
+sha256  8fc99820c2419d0de6bbbd319ff935d54960b37b716d0b4bb1c75de493f3e1fd  LICENSE.md
+sha256  70bf7e79c8cd73a81f97ce81745ea0719a617eebe299a61868165daeae71fff2  host/LICENSE
diff --git a/package/uhd/uhd.mk b/package/uhd/uhd.mk
new file mode 100644
index 0000000000..74faf5d48c
--- /dev/null
+++ b/package/uhd/uhd.mk
@@ -0,0 +1,94 @@
+################################################################################
+#
+# uhd
+#
+################################################################################
+
+UHD_VERSION = 3.15.0.0
+UHD_SITE = $(call github,EttusResearch,uhd,v$(UHD_VERSION))
+UHD_LICENSE = GPL-3.0+
+UHD_LICENSE_FILES = LICENSE.md output/LICENSE
+
+UHD_SUPPORTS_IN_SOURCE_BUILD = NO
+UHD_SUBDIR = host
+UHD_INSTALL_STAGING = YES
+
+UHD_DEPENDENCIES = \
+	boost \
+	$(if $(BR2_PACKAGE_PYTHON),host-python,host-python3) \
+	$(if $(BR2_PACKAGE_PYTHON),host-python-mako,host-python3-mako)
+
+UHD_CONF_OPTS = \
+	-DPYTHON_EXECUTABLE=$(HOST_DIR)/bin/python \
+	-DRUNTIME_PYTHON_EXECUTABLE=/usr/bin/python \
+	-DENABLE_C_API=ON \
+	-DENABLE_DOXYGEN=OFF \
+	-DENABLE_DPKD=OFF \
+	-DENABLE_LIBUHD=ON \
+	-DENABLE_N230=OFF \
+	-DENABLE_N300=OFF \
+	-DENABLE_N320=OFF \
+	-DENABLE_MANUAL=OFF \
+	-DENABLE_MAN_PAGES=OFF \
+	-DENABLE_OCTOCLOCK=OFF \
+	-DENABLE_PYTHON_API=OFF \
+	-DENABLE_TESTS=OFF \
+	-DENABLE_USRP1=OFF \
+	-DENABLE_USRP2=OFF \
+	-DENABLE_UTILS=OFF \
+	-DENABLE_X300=OFF
+
+ifeq ($(BR2_PACKAGE_ORC),y)
+UHD_DEPENDENCIES += orc
+endif
+
+ifeq ($(BR2_PACKAGE_UHD_B100),y)
+UHD_CONF_OPTS += -DENABLE_B100=ON
+else
+UHD_CONF_OPTS += -DENABLE_B100=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_UHD_B200),y)
+UHD_CONF_OPTS += -DENABLE_B200=ON
+else
+UHD_CONF_OPTS += -DENABLE_B200=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_UHD_E300),y)
+UHD_CONF_OPTS += -DENABLE_E300=ON
+else
+UHD_CONF_OPTS += -DENABLE_E300=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_UHD_E320),y)
+UHD_CONF_OPTS += -DENABLE_E320=ON
+else
+UHD_CONF_OPTS += -DENABLE_E320=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_UHD_EXAMPLES),y)
+UHD_CONF_OPTS += -DENABLE_EXAMPLES=ON
+else
+UHD_CONF_OPTS += -DENABLE_EXAMPLES=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_UHD_MPMD),y)
+UHD_CONF_OPTS += -DENABLE_MPMD=ON
+else
+UHD_CONF_OPTS += -DENABLE_MPMD=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_UHD_RFNOC),y)
+UHD_CONF_OPTS += -DENABLE_RFNOC=ON
+else
+UHD_CONF_OPTS += -DENABLE_RFNOC=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_UHD_USB),y)
+UHD_DEPENDENCIES += libusb
+UHD_CONF_OPTS += -DENABLE_USB=ON
+else
+UHD_CONF_OPTS += -DENABLE_USB=OFF
+endif
+
+$(eval $(cmake-package))
-- 
2.26.2
