From: Jonathan Ben-Avraham <yba@tkos.co.il>
Date: Wed, 27 Aug 2014 13:18:30 +0300
Subject: [Buildroot] [PATCH 2/2 v2] new package: phidgetwebservice
In-Reply-To: <1409134710-3694-1-git-send-email-yba@tkos.co.il>
References: <1409134710-3694-1-git-send-email-yba@tkos.co.il>
Message-ID: <1409134710-3694-2-git-send-email-yba@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Jonathan Ben-Avraham <yba@tkos.co.il>
---
 package/Config.in                              |    1 +
 package/phidgetwebservice/Config.in            |   19 +++++++++++++++++++
 package/phidgetwebservice/phidgetwebservice.mk |   14 ++++++++++++++
 3 files changed, 34 insertions(+)
 create mode 100644 package/phidgetwebservice/Config.in
 create mode 100644 package/phidgetwebservice/phidgetwebservice.mk

diff --git a/package/Config.in b/package/Config.in
index 1088f5a..692fd58 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1039,6 +1039,7 @@ endif
 	source "package/openswan/Config.in"
 	source "package/openvpn/Config.in"
 	source "package/p910nd/Config.in"
+	source "package/phidgetwebservice/Config.in"
 	source "package/portmap/Config.in"
 	source "package/pppd/Config.in"
 	source "package/pptp-linux/Config.in"
diff --git a/package/phidgetwebservice/Config.in b/package/phidgetwebservice/Config.in
new file mode 100644
index 0000000..daf22c7
--- /dev/null
+++ b/package/phidgetwebservice/Config.in
@@ -0,0 +1,19 @@
+config BR2_PACKAGE_PHIDGETWEBSERVICE
+	bool "phidgetwebservice"
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb, libphidget
+	select BR2_PACKAGE_LIBPHIDGET
+	help
+          phidgetwebservice (the Phidget WebService) provides an HTTP
+	  front-end to the libphidget device control API. This provides
+	  an alternative to the libphidget C linkage interface for
+	  controlling locally attached Phidgets USB devices and it also
+	  allows you to control Phidget USB devices remotely when the host
+	  running the phidgetwebservice has an exposed network interface.
+ 
+	  The phidgetwebservice client program uses the libphidget HTTP
+	  functions to send commands to the phidgetwebservice.
+
+	  http://phidgets.com/
+
+comment "phidgetwebservice needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/phidgetwebservice/phidgetwebservice.mk b/package/phidgetwebservice/phidgetwebservice.mk
new file mode 100644
index 0000000..64dfca4
--- /dev/null
+++ b/package/phidgetwebservice/phidgetwebservice.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# phidgetwebservice
+#
+################################################################################
+
+PHIDGETWEBSERVICE_VERSION = 2.1.8.20140319
+PHIDGETWEBSERVICE_SOURCE = phidgetwebservice_$(PHIDGETWEBSERVICE_VERSION).tar.gz
+PHIDGETWEBSERVICE_SITE = http://www.phidgets.com/downloads/libraries/
+PHIDGETWEBSERVICE_DEPENDENCIES = libphidget
+PHIDGETWEBSERVICE_LICENSE = LGPLv3
+PHIDGETWEBSERVICE_LICENSE_FILES = COPYING
+
+$(eval $(autotools-package))
-- 
1.7.10.4
