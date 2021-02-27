From: guillaume.bressaix at gmail.com <guillaume.bressaix@gmail.com>
Date: Sat, 27 Feb 2021 11:09:59 +0100
Subject: [Buildroot] [PATCH] package/pybind11: new package
Message-ID: <20210227100959.28281-1-guillaume.bressaix@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Guillaume W. Bres" <guillaume.bressaix@gmail.com>

Pybind11 is a lightweight header-only library that exposes C++
types in Python and vice versa, mainly to create Python
bindings of existing C++ code.

Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>
---

Warning!!: this new package and its internal
BR2_PACKAGE_PYBIND11_WITH_PYTHON option
intends to replace package/python-pybind which is totally broken
since upgrade to v2.6.1 in ->next.

The python build now requires a previous cmake build:
	+ python-pybind only is not possible and will not build
	by itself

	+ python setup.py requires cmake to install
	within $(@D) a couple files (in $(@D)/pybind11 exactly)
	to properly work. See my message in BR digest 17/02:
	<CAJe0E3eQxAZHAe2DN4Qp9k_0czYGsR639+=bSUaEdyaKm0Keuw@mail.gmail.com>
	cc to Thomas, Gwen & Peter, entitled:
	"Python-pybind we need to discuss this package"

	=> If this package is merged, package/python-pybind is deprecated

	=> package/python-pybind v2.6.1+ in ->next must be removed,
	python-build by itself cannot work anymore

Pybind11 is a host only package

Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>
---
 DEVELOPERS                     |  1 +
 package/pybind11/Config.in     | 25 ++++++++++++++++++++
 package/pybind11/pybind11.hash |  3 +++
 package/pybind11/pybind11.mk   | 42 ++++++++++++++++++++++++++++++++++
 4 files changed, 71 insertions(+)
 create mode 100644 package/pybind11/Config.in
 create mode 100644 package/pybind11/pybind11.hash
 create mode 100644 package/pybind11/pybind11.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index b019fe04d5..98e8b329ed 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1057,6 +1057,7 @@ N:	Guillaume William Brs <guillaume.bressaix@gmail.com>
 F:	package/libnids/
 F:	package/liquid-dsp/
 F:	package/pixiewps/
+F:	package/pybind11/
 F:	package/python-pybind/
 F:	package/reaver/
 
diff --git a/package/pybind11/Config.in b/package/pybind11/Config.in
new file mode 100644
index 0000000000..883bf8cc09
--- /dev/null
+++ b/package/pybind11/Config.in
@@ -0,0 +1,25 @@
+comment "pybind11 needs a toolchain w/ C++, wchar"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR
+
+config BR2_PACKAGE_PYBIND11
+	bool "pybind11"
+	depends on BR2_INSTALL_LIBSTDCPP # boost
+	depends on BR2_USE_WCHAR # boost
+	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # boost-thread
+	select BR2_PACKAGE_BOOST
+	help
+	  Pybind11 is a lightweight header-only library that exposes C++
+	  types in Python and vice versa, mainly to create Python
+	  bindings of existing C++ code.
+
+	  http://pybind11.readthedocs.org/en/master
+
+if BR2_PACKAGE_PYBIND11
+
+config BR2_PACKAGE_PYBIND11_WITH_PYTHON
+	bool "pybind11-python"
+	depends on BR2_PACKAGE_PYTHON3
+	help
+	  Activate support for python-pybind
+
+endif
diff --git a/package/pybind11/pybind11.hash b/package/pybind11/pybind11.hash
new file mode 100644
index 0000000000..e703519a22
--- /dev/null
+++ b/package/pybind11/pybind11.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256 8ff2fff22df038f5cd02cea8af56622bc67f5b64534f1b83b9f133b8366acff2  pybind11-2.6.2.tar.gz
+sha256 83965b843b98f670d3a85bd041ed4b372c8ec50d7b4a5995a83ac697ba675dcb  LICENSE
diff --git a/package/pybind11/pybind11.mk b/package/pybind11/pybind11.mk
new file mode 100644
index 0000000000..c8d69e1dd4
--- /dev/null
+++ b/package/pybind11/pybind11.mk
@@ -0,0 +1,42 @@
+################################################################################
+#
+# pybind11
+#
+################################################################################
+
+PYBIND11_VERSION = 2.6.2
+PYBIND11_SITE = $(call github,pybind,pybind11,v$(PYBIND11_VERSION))
+PYBIND11_LICENSE = BSD-3-Clause
+PYBIND11_LICENSE_FILES = LICENSE
+PYBIND11_INSTALL_STAGING = YES
+PYBIND11_SUPPORTS_IN_SOURCE_BUILD = YES
+
+HOST_PYBIND11_CONF_OPTS = \
+	-DBUILD_DOCS=OFF \
+	-DDOWNLOAD_EIGEN=OFF \
+	-DPYTHON=$(TARGET_DIR)/usr/bin/python \
+	-DPYTHON_PREFIX=$(STAGING_DIR)/usr
+
+# pybind11-python support activation
+# this requires the cmake build installed within $(@D)
+ifeq ($(BR2_PACKAGE_PYBIND11_WITH_PYTHON),y)
+
+HOST_PYBIND11_DEPENDENCIES += host-python3
+
+HOST_PYBIND11_CONF_OPTS += -DCMAKE_INSTALL_PREFIX=$(@D)/pybind11
+
+define PYBIND11_PYTHON_BUILD
+	cd $(@D) && $(HOST_DIR)/bin/python setup.py install
+endef
+
+HOST_PYBIND11_POST_INSTALL_HOOKS += PYBIND11_PYTHON_BUILD
+
+else
+
+HOST_PYBIND11_CONF_OPTS += \
+	-DPYBIND_FINDPYTHON=OFF \
+	-DPYBIND11_NOPYTHON=ON
+
+endif
+
+$(eval $(host-cmake-package))
-- 
2.20.1
