From: spdawson at gmail.com <spdawson@gmail.com>
Date: Wed,  5 Dec 2012 18:40:23 +0000
Subject: [Buildroot] [PATCH v5] neardal: new package
Message-ID: <1354732823-5974-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 v5: Resend
 v4: Incorporate Arnout Vandecappelle's suggested improvements
 v3: Remove spurious dependency on neard, add Arnout Vandecappelle's acks
 v2: (No v2, bumped entire patch series to v3)

 package/Config.in          |    1 +
 package/neardal/Config.in  |   12 ++++++++++++
 package/neardal/neardal.mk |   16 ++++++++++++++++
 3 files changed, 29 insertions(+)
 create mode 100644 package/neardal/Config.in
 create mode 100644 package/neardal/neardal.mk

diff --git a/package/Config.in b/package/Config.in
index 4bc5cf3..2cb9b8e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -424,6 +424,7 @@ source "package/libusb/Config.in"
 source "package/libusb-compat/Config.in"
 source "package/libv4l/Config.in"
 source "package/mtdev/Config.in"
+source "package/neardal/Config.in"
 source "package/pcsc-lite/Config.in"
 endmenu
 
diff --git a/package/neardal/Config.in b/package/neardal/Config.in
new file mode 100644
index 0000000..990b302
--- /dev/null
+++ b/package/neardal/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_NEARDAL
+	bool "neardal"
+	depends on BR2_USE_WCHAR # glib2
+	select BR2_PACKAGE_DBUS
+	select BR2_PACKAGE_DBUS_GLIB
+	help
+	  Provides a simple C API to exchange data with the neard NFC manager daemon.
+
+	  https://github.com/connectivity/neardal
+
+comment "neardal requires a toolchain with WCHAR support"
+	depends on !BR2_USE_WCHAR
diff --git a/package/neardal/neardal.mk b/package/neardal/neardal.mk
new file mode 100644
index 0000000..f898df5
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
+NEARDAL_DEPENDENCIES = dbus-glib
+NEARDAL_AUTORECONF = YES
+
+$(eval $(autotools-package))
-- 
1.7.10.4
