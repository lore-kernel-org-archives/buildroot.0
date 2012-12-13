From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 13 Dec 2012 22:47:03 +0100
Subject: [Buildroot] [PATCH 03/20] package/usbredir: new package
In-Reply-To: <cover.1355435224.git.yann.morin.1998@free.fr>
References: <cover.1355435224.git.yann.morin.1998@free.fr>
Message-ID: <b6f27b8d9306f0a01bd003e2c9bdc1f5c5e87128.1355435224.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
---
 package/Config.in            |    1 +
 package/usbredir/Config.in   |   28 ++++++++++++++++++++++++++++
 package/usbredir/usbredir.mk |   31 +++++++++++++++++++++++++++++++
 3 files changed, 60 insertions(+), 0 deletions(-)
 create mode 100644 package/usbredir/Config.in
 create mode 100644 package/usbredir/usbredir.mk

diff --git a/package/Config.in b/package/Config.in
index 8edadf9..9d68581 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -492,6 +492,7 @@ source "package/libupnp/Config.in"
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
index 0000000..70b50c3
--- /dev/null
+++ b/package/usbredir/usbredir.mk
@@ -0,0 +1,31 @@
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
+USBREDIR_DEPENDENCIES    += host-pkgconf
+
+ifeq ($(BR2_PACKAGE_USBREDIR_SERVER),y)
+
+USBREDIR_LICENSE         += (for the library), GPLv2+ (for the server)
+USBREDIR_LICENSE_FILES   += COPYING
+
+else # BR2_PACKAGE_USBREDIR_SERVER != y
+
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
