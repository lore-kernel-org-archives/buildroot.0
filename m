From: Aleksander Morgado <aleksander@aleksander.es>
Date: Tue,  5 Sep 2017 12:03:27 +0200
Subject: [Buildroot] [PATCH] libqmi: udev and qmi-over-mbim are optional
Message-ID: <20170905100327.21421-1-aleksander@aleksander.es>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Don't always build without udev, as qmi-firmware-update would be very
very limited in that case. Instead, make it optional: if there is udev
support in the setup, require libgudev and configure using --with-udev
explicitly; otherwise just --without-udev.

Also, add the qmi-over-mbim feature as optional, and require libmbim
if we're building with it enabled.

Signed-off-by: Aleksander Morgado <aleksander@aleksander.es>
---
 package/libqmi/Config.in | 18 ++++++++++++++++++
 package/libqmi/libqmi.mk | 18 ++++++++++++++++--
 2 files changed, 34 insertions(+), 2 deletions(-)

diff --git a/package/libqmi/Config.in b/package/libqmi/Config.in
index f1d111b7c..a536650b5 100644
--- a/package/libqmi/Config.in
+++ b/package/libqmi/Config.in
@@ -10,6 +10,24 @@ config BR2_PACKAGE_LIBQMI
 
 	  http://www.freedesktop.org/wiki/Software/libqmi/
 
+if BR2_PACKAGE_LIBQMI
+
+config BR2_PACKAGE_LIBQMI_UDEV
+	bool "qmi-firmware-update udev support"
+	depends on BR2_PACKAGE_HAS_UDEV
+	select BR2_PACKAGE_LIBGUDEV
+	help
+	  This option enables udev support in the qmi-firmware-update tool
+
+config BR2_PACKAGE_LIBQMI_MBIM_QMUX
+	bool "QMI-over-MBIM support"
+	select BR2_PACKAGE_LIBMBIM
+	help
+	  This option enables support to use the QMI protocol over MBIM
+	  for modems with MBIM_SERVICE_QMI capabilities
+
+endif
+
 comment "libqmi needs a toolchain w/ wchar, threads"
 	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libqmi/libqmi.mk b/package/libqmi/libqmi.mk
index 917265f4b..129fd0fb6 100644
--- a/package/libqmi/libqmi.mk
+++ b/package/libqmi/libqmi.mk
@@ -15,7 +15,21 @@ LIBQMI_AUTORECONF = YES
 
 LIBQMI_DEPENDENCIES = libglib2
 
-# we don't want -Werror and disable gudev Gobject bindings
-LIBQMI_CONF_OPTS = --enable-more-warnings=no --without-udev
+# we don't want -Werror
+LIBQMI_CONF_OPTS = --enable-more-warnings=no
+
+ifeq ($(BR2_PACKAGE_LIBQMI_UDEV),y)
+LIBQMI_DEPENDENCIES += libgudev
+LIBQMI_CONF_OPTS += --with-udev
+else
+LIBQMI_CONF_OPTS += --without-udev
+endif
+
+ifeq ($(BR2_PACKAGE_LIBQMI_MBIM_QMUX),y)
+LIBQMI_DEPENDENCIES += libmbim
+LIBQMI_CONF_OPTS += --enable-mbim-qmux
+else
+LIBQMI_CONF_OPTS += --disable-mbim-qmux
+endif
 
 $(eval $(autotools-package))
-- 
2.13.1
