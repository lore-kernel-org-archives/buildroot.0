From: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
Date: Mon,  2 Nov 2020 14:54:49 +0100
Subject: [Buildroot] [PATCH 1/2] package/uhd: add missing support
Message-ID: <20201102135451.1753136-1-gwenj@trabucayre.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>

Complete uhd package with the rest of USRP, octoclock and python support.

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
---
 package/uhd/Config.in | 63 +++++++++++++++++++++++++++++++++++++++
 package/uhd/uhd.mk    | 68 ++++++++++++++++++++++++++++++++++++-------
 2 files changed, 121 insertions(+), 10 deletions(-)

diff --git a/package/uhd/Config.in b/package/uhd/Config.in
index 32cb4cf89d..2b30ab5161 100644
--- a/package/uhd/Config.in
+++ b/package/uhd/Config.in
@@ -65,6 +65,43 @@ config BR2_PACKAGE_UHD_MPMD
 	help
 	  enable MPMD support
 
+config BR2_PACKAGE_UHD_N230
+	bool "N230 support"
+	help
+	  enable N230 support
+
+config BR2_PACKAGE_UHD_N300
+	bool "N300 support"
+	select BR2_PACKAGE_UHD_MPMD
+	help
+	  enable N300 support
+
+config BR2_PACKAGE_UHD_N320
+	bool "N320 support"
+	select BR2_PACKAGE_UHD_MPMD
+	help
+	  enable N320 support
+
+config BR2_PACKAGE_UHD_OCTOCLOCK
+	bool "OctoClock support"
+	help
+	  enable OctoClock support
+
+comment "uhd python API needs python3 and a toolchain w/ glibc or musl"
+	depends on !BR2_PACKAGE_PYTHON3
+	depends on !BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
+	depends on !(BR2_TOOLCHAIN_USES_GLIBC && BR2_TOOLCHAIN_USES_MUSL) # python-numpy
+
+config BR2_PACKAGE_UHD_PYTHON
+	bool "python API support"
+	depends on BR2_PACKAGE_PYTHON3
+	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
+	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL # python-numpy
+	select BR2_PACKAGE_PYTHON_NUMPY
+	select BR2_PACKAGE_PYTHON_REQUESTS
+	help
+	  enable python API support
+
 config BR2_PACKAGE_UHD_RFNOC
 	bool "RFNoC support"
 	help
@@ -76,4 +113,30 @@ config BR2_PACKAGE_UHD_USB
 	help
 	  enable UHD USB support
 
+config BR2_PACKAGE_UHD_USRP1
+	bool "USRP1 support"
+	select BR2_PACKAGE_UHD_USB
+	help
+	  enable USRP1 support
+
+config BR2_PACKAGE_UHD_USRP2
+	bool "USRP2 support"
+	help
+	  enable USRP2 support
+
+comment "uhd utils depends on python API support"
+	depends on !BR2_PACKAGE_UHD_PYTHON
+
+config BR2_PACKAGE_UHD_UTILS
+	bool "uhd-utils"
+	depends on BR2_PACKAGE_UHD_PYTHON
+	select BR2_PACKAGE_PYTHON_SIX
+	help
+	  uhd-utils
+
+config BR2_PACKAGE_UHD_X300
+	bool "X300 support"
+	help
+	  enable X300 support
+
 endif
diff --git a/package/uhd/uhd.mk b/package/uhd/uhd.mk
index adb7579019..ad96b427cc 100644
--- a/package/uhd/uhd.mk
+++ b/package/uhd/uhd.mk
@@ -25,18 +25,9 @@ UHD_CONF_OPTS = \
 	-DENABLE_DOXYGEN=OFF \
 	-DENABLE_DPKD=OFF \
 	-DENABLE_LIBUHD=ON \
-	-DENABLE_N230=OFF \
-	-DENABLE_N300=OFF \
-	-DENABLE_N320=OFF \
 	-DENABLE_MANUAL=OFF \
 	-DENABLE_MAN_PAGES=OFF \
-	-DENABLE_OCTOCLOCK=OFF \
-	-DENABLE_PYTHON_API=OFF \
-	-DENABLE_TESTS=OFF \
-	-DENABLE_USRP1=OFF \
-	-DENABLE_USRP2=OFF \
-	-DENABLE_UTILS=OFF \
-	-DENABLE_X300=OFF
+	-DENABLE_TESTS=OFF
 
 # As soon as architecture is ARM, uhd will try to use NEON.
 # But not all ARM cores have NEON support.
@@ -89,12 +80,44 @@ else
 UHD_CONF_OPTS += -DENABLE_MPMD=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_UHD_N230),y)
+UHD_CONF_OPTS += -DENABLE_N230=ON
+else
+UHD_CONF_OPTS += -DENABLE_N230=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_UHD_N300),y)
+UHD_CONF_OPTS += -DENABLE_N300=ON
+else
+UHD_CONF_OPTS += -DENABLE_N300=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_UHD_N320),y)
+UHD_CONF_OPTS += -DENABLE_N320=ON
+else
+UHD_CONF_OPTS += -DENABLE_N320=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_UHD_OCTOCLOCK),y)
+UHD_CONF_OPTS += -DENABLE_OCTOCLOCK=ON
+else
+UHD_CONF_OPTS += -DENABLE_OCTOCLOCK=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_UHD_RFNOC),y)
 UHD_CONF_OPTS += -DENABLE_RFNOC=ON
 else
 UHD_CONF_OPTS += -DENABLE_RFNOC=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_UHD_PYTHON),y)
+UHD_DEPENDENCIES += host-python-numpy host-python3-requests \
+	python-numpy python-requests
+UHD_CONF_OPTS += -DENABLE_PYTHON_API=ON
+else
+UHD_CONF_OPTS += -DENABLE_PYTHON_API=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_UHD_USB),y)
 UHD_DEPENDENCIES += libusb
 UHD_CONF_OPTS += -DENABLE_USB=ON
@@ -102,4 +125,29 @@ else
 UHD_CONF_OPTS += -DENABLE_USB=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_UHD_USRP1),y)
+UHD_CONF_OPTS += -DENABLE_USRP1=ON
+else
+UHD_CONF_OPTS += -DENABLE_USRP1=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_UHD_USRP2),y)
+UHD_CONF_OPTS += -DENABLE_USRP2=ON
+else
+UHD_CONF_OPTS += -DENABLE_USRP2=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_UHD_UTILS),y)
+UHD_DEPENDENCIES += python-six
+UHD_CONF_OPTS += -DENABLE_UTILS=ON
+else
+UHD_CONF_OPTS += -DENABLE_UTILS=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_UHD_X300),y)
+UHD_CONF_OPTS += -DENABLE_X300=ON
+else
+UHD_CONF_OPTS += -DENABLE_X300=OFF
+endif
+
 $(eval $(cmake-package))
-- 
2.20.1
