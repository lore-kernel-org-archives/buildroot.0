From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun,  4 Oct 2020 17:50:04 +0200
Subject: [Buildroot] [PATCH v3, 2/2] package/kismet: add python tools support
In-Reply-To: <20201004155004.1374536-1-fontaine.fabrice@gmail.com>
References: <20201004155004.1374536-1-fontaine.fabrice@gmail.com>
Message-ID: <20201004155004.1374536-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/kismet/Config.in | 28 ++++++++++++++++++++++++++++
 package/kismet/kismet.mk | 11 ++++++++++-
 2 files changed, 38 insertions(+), 1 deletion(-)

diff --git a/package/kismet/Config.in b/package/kismet/Config.in
index 8c4c63d9ed..4ef84731da 100644
--- a/package/kismet/Config.in
+++ b/package/kismet/Config.in
@@ -26,6 +26,34 @@ config BR2_PACKAGE_KISMET
 
 if BR2_PACKAGE_KISMET
 
+config BR2_PACKAGE_KISMET_PYTHON_TOOLS
+	bool "Install python tools"
+	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS # protobuf
+	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS # python-numpy
+	depends on BR2_PACKAGE_PYTHON3
+	depends on !BR2_STATIC_LIBS # protobuf
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # protobuf
+	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL # python-numpy
+	select BR2_PACKAGE_PROTOBUF
+	select BR2_PACKAGE_PYTHON_NUMPY # runtime for RTLAMR and RTLADSB
+	select BR2_PACKAGE_PYTHON_PROTOBUF # runtime
+	select BR2_PACKAGE_PYTHON_SERIAL # runtime for Freaklabs Zigbee
+	select BR2_PACKAGE_PYTHON_SETUPTOOLS
+	help
+	  Enable Python and Python-related tools (RTL_433, RTLAMR,
+	  RTLADSB and Freaklabs Zigbee)
+
+comment "python tools needs python3"
+	depends on !BR2_PACKAGE_PYTHON3
+	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
+
+comment "python tools needs a glibc or musl toolchain w/ dynamic library, gcc >= 4.8"
+	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
+	depends on !(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL)
+
 config BR2_PACKAGE_KISMET_SERVER
 	bool "Install server"
 	default y
diff --git a/package/kismet/kismet.mk b/package/kismet/kismet.mk
index 99adf6afaf..723ce9c02b 100644
--- a/package/kismet/kismet.mk
+++ b/package/kismet/kismet.mk
@@ -17,7 +17,7 @@ KISMET_DEPENDENCIES = \
 	zlib
 KISMET_LICENSE = GPL-2.0+
 KISMET_LICENSE_FILES = LICENSE
-KISMET_CONF_OPTS = --disable-debuglibs --disable-python-tools
+KISMET_CONF_OPTS = --disable-debuglibs
 
 KISMET_CXXFLAGS = $(TARGET_CXXFLAGS)
 
@@ -55,6 +55,15 @@ else
 KISMET_CONF_OPTS += --disable-pcre
 endif
 
+ifeq ($(BR2_PACKAGE_KISMET_PYTHON_TOOLS),y)
+KISMET_DEPENDENCIES += python3 python-setuptools
+KISMET_CONF_OPTS += \
+	--enable-python-tools \
+	--with-python-interpreter=$(HOST_DIR)/bin/python$(PYTHON3_VERSION_MAJOR)
+else
+KISMET_CONF_OPTS += --disable-python-tools
+endif
+
 KISMET_INSTALL_TARGET_OPTS += \
 	DESTDIR=$(TARGET_DIR) \
 	INSTUSR=$(shell id -u) \
-- 
2.28.0
