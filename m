From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 24 Oct 2012 23:25:31 +0200
Subject: [Buildroot] [PATCH 05/47] package/usbredir: new package
In-Reply-To: <1351113973-17237-1-git-send-email-yann.morin.1998@free.fr>
References: <1351113973-17237-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <1351113973-17237-6-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/Config.in            |    1 +
 package/usbredir/Config.in   |   28 ++++++++++++++++++++++++++++
 package/usbredir/usbredir.mk |   34 ++++++++++++++++++++++++++++++++++
 3 files changed, 63 insertions(+), 0 deletions(-)
 create mode 100644 package/usbredir/Config.in
 create mode 100644 package/usbredir/usbredir.mk

diff --git a/package/Config.in b/package/Config.in
index 2c5ad8c..55bb0b2 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -461,6 +461,7 @@ source "package/libupnp/Config.in"
 source "package/libvncserver/Config.in"
 source "package/nss-mdns/Config.in"
 source "package/ortp/Config.in"
+source "package/usbredir/Config.in"
 source "package/zeromq/Config.in"
 endmenu
 
diff --git a/package/usbredir/Config.in b/package/usbredir/Config.in
new file mode 100644
index 0000000..8d8ac5a
--- /dev/null
+++ b/package/usbredir/Config.in
@@ -0,0 +1,28 @@
+comment "usbredir requires libusb"
+	depends on !BR2_PACKAGE_LIBUSB
+
+config BR2_PACKAGE_USBREDIR
+	bool "usbredir"
+	depends on BR2_PACKAGE_LIBUSB
+	help
+	  usbredir is the name of a network protocol for sending usb device
+	  traffic over a network connection. It is also the name of the
+	  software package offering a parsing library, a usbredirhost library
+	  and several utilities implementing this protocol.
+	  
+	  Note: only the library is installed, not the utilities. Say 'y'
+	  below if you want the server too.
+	  
+	  http://www.spice-space.org/page/UsbRedir
+
+if BR2_PACKAGE_USBREDIR
+
+config BR2_PACKAGE_USBREDIR_SERVER
+	bool "usbredirserver on target"
+	help
+	  If you want to serve usbredir requests on your target, say 'y'
+	  here to have the usbredir server on the target.
+	  
+	  Note: the server is not required to use the library.
+
+endif
diff --git a/package/usbredir/usbredir.mk b/package/usbredir/usbredir.mk
new file mode 100644
index 0000000..43b47eb
--- /dev/null
+++ b/package/usbredir/usbredir.mk
@@ -0,0 +1,34 @@
+#############################################################
+#
+# usbredir
+#
+#############################################################
+
+USBREDIR_VERSION         = 0.4.3
+USBREDIR_SOURCE          = usbredir-$(USBREDIR_VERSION).tar.bz2
+USBREDIR_SITE            = http://spice-space.org/download/usbredir
+USBREDIR_LICENSE         = LGPLv2.1+
+USBREDIR_LICENSE_FILES   = COPYING.LIB
+USBREDIR_INSTALL_STAGING = YES
+USBREDIR_DEPENDENCIES    = libusb
+
+USBREDIR_DEPENDENCIES    += host-pkg-config
+
+ifeq ($(BR2_PACKAGE_USBREDIR_SERVER),y)
+
+USBREDIR_LICENSE         += GPLv2+
+USBREDIR_LICENSE_FILES   += COPYING
+
+else # BR2_PACKAGE_USBREDIR_SERVER != y
+
+# It's much easier to remove unwanted files after-the-fact, rather than trying
+# to install only what we want. Sad-and-dull life, but life nonetheless...
+# Note: do not forget to update the license, above, if you keep the server.
+define USBREDIR_POST_INSTALL_TARGET_RM_SERVER
+	rm -f $(TARGET_DIR)/usr/sbin/usbredirserver
+endef
+USBREDIR_POST_INSTALL_TARGET_HOOKS += USBREDIR_POST_INSTALL_TARGET_RM_SERVER
+
+endif # BR2_PACKAGE_USBREDIR_SERVER
+
+$(eval $(autotools-package))
-- 
1.7.2.5
