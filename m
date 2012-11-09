From: spdawson at gmail.com <spdawson@gmail.com>
Date: Fri,  9 Nov 2012 11:05:05 +0000
Subject: [Buildroot] [PATCH 2/2] neardal: new package
In-Reply-To: <1352459105-13590-1-git-send-email-spdawson@gmail.com>
References: <1352459105-13590-1-git-send-email-spdawson@gmail.com>
Message-ID: <1352459105-13590-3-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 package/Config.in          |    1 +
 package/neardal/Config.in  |   11 +++++++++++
 package/neardal/neardal.mk |   16 ++++++++++++++++
 3 files changed, 28 insertions(+)
 create mode 100644 package/neardal/Config.in
 create mode 100644 package/neardal/neardal.mk

diff --git a/package/Config.in b/package/Config.in
index ffc08ab..965830d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -418,6 +418,7 @@ source "package/libusb/Config.in"
 source "package/libusb-compat/Config.in"
 source "package/libv4l/Config.in"
 source "package/mtdev/Config.in"
+source "package/neardal/Config.in"
 source "package/pcsc-lite/Config.in"
 endmenu
 
diff --git a/package/neardal/Config.in b/package/neardal/Config.in
new file mode 100644
index 0000000..258a223
--- /dev/null
+++ b/package/neardal/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_NEARDAL
+	bool "neardal"
+	depends on BR2_PACKAGE_NEARD
+	select BR2_PACKAGE_DBUS_GLIB
+	help
+	  Provides a simple C API to exchange data with the neard NFC manager daemon.
+
+	  https://github.com/connectivity/neardal
+
+comment "neardal requires neard"
+	depends on !BR2_PACKAGE_NEARD
diff --git a/package/neardal/neardal.mk b/package/neardal/neardal.mk
new file mode 100644
index 0000000..3479afd
--- /dev/null
+++ b/package/neardal/neardal.mk
@@ -0,0 +1,16 @@
+#############################################################
+#
+# neardal
+#
+#############################################################
+NEARDAL_VERSION = 0.7
+NEARDAL_SITE = http://github.com/connectivity/neardal/tarball/$(NEARDAL_VERSION)
+NEARDAL_SOURCE = connectivity-neardal-$(NEARDAL_VERSION).tar.gz
+NEARDAL_INSTALL_STAGING = YES
+NEARDAL_LICENSE = GPLv2
+NEARDAL_LICENSE_FILES = COPYING
+
+NEARDAL_DEPENDENCIES = neard dbus-glib
+NEARDAL_AUTORECONF = YES
+
+$(eval $(autotools-package))
-- 
1.7.10.4
