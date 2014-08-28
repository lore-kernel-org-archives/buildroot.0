From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 28 Aug 2014 08:47:51 +0200
Subject: [Buildroot] [git commit branch/next] new package: phidgetwebservice
Message-ID: <20140828064828.60B7D9D537@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=51b1ee249a62a5f875b5729b4ba20a58c0b20f40
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Jonathan Ben-Avraham <yba@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in                              |    1 +
 package/phidgetwebservice/Config.in            |   19 +++++++++++++++++++
 package/phidgetwebservice/phidgetwebservice.mk |   14 ++++++++++++++
 3 files changed, 34 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 2a4d994..883dd66 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1040,6 +1040,7 @@ endif
 	source "package/openswan/Config.in"
 	source "package/openvpn/Config.in"
 	source "package/p910nd/Config.in"
+	source "package/phidgetwebservice/Config.in"
 	source "package/portmap/Config.in"
 	source "package/pppd/Config.in"
 	source "package/pptp-linux/Config.in"
diff --git a/package/phidgetwebservice/Config.in b/package/phidgetwebservice/Config.in
new file mode 100644
index 0000000..7bb6f33
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
