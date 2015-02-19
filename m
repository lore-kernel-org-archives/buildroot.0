From: julien.boibessot at free.fr <julien.boibessot@free.fr>
Date: Thu, 19 Feb 2015 10:52:26 +0100
Subject: [Buildroot] [PATCH] xc3sprog: new package
Message-ID: <1424339546-12050-1-git-send-email-julien.boibessot@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Julien Boibessot <julien.boibessot@armadeus.com>

These tools can be useful on Host during development and on target
for BR based production testbench for example.
Both usage were tested at Armadeus Systems.

Signed-off-by: Julien Boibessot <julien.boibessot@armadeus.com>
---
 package/Config.in               |    1 +
 package/Config.in.host          |    1 +
 package/xc3sprog/Config.in      |   19 +++++++++++++++++++
 package/xc3sprog/Config.in.host |   12 ++++++++++++
 package/xc3sprog/xc3sprog.mk    |   15 +++++++++++++++
 5 files changed, 48 insertions(+)
 create mode 100644 package/xc3sprog/Config.in
 create mode 100644 package/xc3sprog/Config.in.host
 create mode 100644 package/xc3sprog/xc3sprog.mk

diff --git a/package/Config.in b/package/Config.in
index d19b37f..9316d17 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -391,6 +391,7 @@ endif
 	source "package/usbutils/Config.in"
 	source "package/w_scan/Config.in"
 	source "package/wipe/Config.in"
+	source "package/xc3sprog/Config.in"
 	source "package/xorriso/Config.in"
 endmenu
 
diff --git a/package/Config.in.host b/package/Config.in.host
index 94981ad..11351b0 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -25,5 +25,6 @@ menu "Host utilities"
 	source "package/sunxi-tools/Config.in.host"
 	source "package/uboot-tools/Config.in.host"
 	source "package/util-linux/Config.in.host"
+	source "package/xc3sprog/Config.in.host"
 
 endmenu
diff --git a/package/xc3sprog/Config.in b/package/xc3sprog/Config.in
new file mode 100644
index 0000000..41ed939
--- /dev/null
+++ b/package/xc3sprog/Config.in
@@ -0,0 +1,19 @@
+config BR2_PACKAGE_XC3SPROG
+	bool "xc3sprog"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libftdi
+	depends on BR2_USE_WCHAR # FILE
+	select BR2_PACKAGE_LIBFTDI
+	help
+	  xc3sprog is a suite of utilities for programming Xilinx FPGAs, CPLDs,
+	  and EEPROMs with the Xilinx Parallel Cable and other JTAG adapters
+	  under Linux (xc3sprog, xc2c_warp, readdna, bitparse, jedecparse,
+	  srecparse, detectchain).
+
+	  xc3sprog depends on libftdi and so will auto-select it.
+
+	  http://xc3sprog.sourceforge.net/
+
+comment "xc3sprog needs a toolchain w/ C++, threads, wchar"
+	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_TOOLCHAIN_HAS_THREADS \
+		&& BR2_USE_WCHAR)
diff --git a/package/xc3sprog/Config.in.host b/package/xc3sprog/Config.in.host
new file mode 100644
index 0000000..29a8b78
--- /dev/null
+++ b/package/xc3sprog/Config.in.host
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_HOST_XC3SPROG
+	bool "host xc3sprog"
+	select BR2_PACKAGE_HOST_LIBFTDI
+	help
+	  xc3sprog is a suite of utilities for programming Xilinx FPGAs, CPLDs,
+	  and EEPROMs with the Xilinx Parallel Cable and other JTAG adapters
+	  under Linux (xc3sprog, xc2c_warp, readdna, bitparse, jedecparse,
+	  srecparse, detectchain).
+
+	  xc3sprog depends on libftdi and so will auto-select it.
+
+	  http://xc3sprog.sourceforge.net/
diff --git a/package/xc3sprog/xc3sprog.mk b/package/xc3sprog/xc3sprog.mk
new file mode 100644
index 0000000..1dcfeb3
--- /dev/null
+++ b/package/xc3sprog/xc3sprog.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# xc3sprog
+#
+################################################################################
+
+XC3SPROG_VERSION = 772
+XC3SPROG_SITE = https://svn.code.sf.net/p/xc3sprog/code/trunk
+XC3SPROG_SITE_METHOD = svn
+X3CSPROG_LICENSE = GPLv2+
+X3CSPROG_LICENSE_FILES = COPYING
+X3CSPROG_DEPENDENCIES = libftdi host-pkgconf
+
+$(eval $(cmake-package))
+$(eval $(host-cmake-package))
-- 
1.7.9.5
