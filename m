From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 21 Jun 2017 22:39:43 +0200
Subject: [Buildroot] [git commit] xr819-xradio: new package
Message-ID: <20170621203945.6851D81E75@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=681c1614be392a0400c737353c9b7cb187ec687d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch adds xradio wireless driver for SDIO WiFi chip XR819.
The out-of-tree driver is sourced from fifteenhex's work
on github https://github.com/fifteenhex/xradio

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
[Thomas: add entry in DEVELOPERS file.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 DEVELOPERS                             |  3 +++
 package/Config.in                      |  1 +
 package/xr819-xradio/Config.in         | 10 ++++++++++
 package/xr819-xradio/xr819-xradio.hash |  2 ++
 package/xr819-xradio/xr819-xradio.mk   | 13 +++++++++++++
 5 files changed, 29 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 5729351..1b1cefe 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1487,6 +1487,9 @@ F:	package/libbson/
 F:	package/lua-resty-http/
 F:	package/mpir/
 
+N:	Sergey Matyukevich <geomatsi@gmail.com>
+F:	package/xr819-xradio/
+
 N:	Sergio Prado <sergio.prado@e-labworks.com>
 F:	package/libgdiplus/
 F:	package/mongodb/
diff --git a/package/Config.in b/package/Config.in
index d2b3119..95068fd 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -505,6 +505,7 @@ endmenu
 	source "package/wf111/Config.in"
 	source "package/wipe/Config.in"
 	source "package/xorriso/Config.in"
+	source "package/xr819-xradio/Config.in"
 endmenu
 
 menu "Interpreter languages and scripting"
diff --git a/package/xr819-xradio/Config.in b/package/xr819-xradio/Config.in
new file mode 100644
index 0000000..9d7fa4b
--- /dev/null
+++ b/package/xr819-xradio/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_XR819_XRADIO
+	bool "xr819-xradio"
+	depends on BR2_LINUX_KERNEL
+	help
+	  Wireless driver for SDIO WiFi chip XR819
+
+	  https://github.com/fifteenhex/xradio
+
+comment "xr819-xradio driver needs a Linux kernel to be built"
+	depends on !BR2_LINUX_KERNEL
diff --git a/package/xr819-xradio/xr819-xradio.hash b/package/xr819-xradio/xr819-xradio.hash
new file mode 100644
index 0000000..bdb0f96
--- /dev/null
+++ b/package/xr819-xradio/xr819-xradio.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 5e9f59942b3880768b4812ab6db395bd1fa6d423cae9c09504baa416f064a10d xr819-xradio-014dfdd203102c5fd2370a73ec4ae3e6dd4e9ded.tar.gz
diff --git a/package/xr819-xradio/xr819-xradio.mk b/package/xr819-xradio/xr819-xradio.mk
new file mode 100644
index 0000000..dfe2ee6
--- /dev/null
+++ b/package/xr819-xradio/xr819-xradio.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# xr819-xradio
+#
+################################################################################
+
+XR819_XRADIO_VERSION = 014dfdd203102c5fd2370a73ec4ae3e6dd4e9ded
+XR819_XRADIO_SITE = $(call github,fifteenhex,xradio,$(XR819_XRADIO_VERSION))
+XR819_XRADIO_LICENSE = GPL-2.0
+XR819_XRADIO_LICENSE_FILES = LICENSE
+
+$(eval $(kernel-module))
+$(eval $(generic-package))
