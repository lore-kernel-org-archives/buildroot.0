From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 13 Aug 2012 01:53:54 +0200
Subject: [Buildroot] [PATCH 06/36] package/usbredir: new package
In-Reply-To: <1344815664-28138-1-git-send-email-yann.morin.1998@free.fr>
References: <1344815664-28138-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <1344815664-28138-6-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/Config.in            |    1 +
 package/usbredir/Config.in   |   15 +++++++++++++++
 package/usbredir/usbredir.mk |   26 ++++++++++++++++++++++++++
 3 files changed, 42 insertions(+), 0 deletions(-)
 create mode 100644 package/usbredir/Config.in
 create mode 100644 package/usbredir/usbredir.mk

diff --git a/package/Config.in b/package/Config.in
index ef411e3..4264d48 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -438,6 +438,7 @@ source "package/libupnp/Config.in"
 source "package/libvncserver/Config.in"
 source "package/nss-mdns/Config.in"
 source "package/ortp/Config.in"
+source "package/usbredir/Config.in"
 source "package/zeromq/Config.in"
 endmenu
 
diff --git a/package/usbredir/Config.in b/package/usbredir/Config.in
new file mode 100644
index 0000000..5d9560a
--- /dev/null
+++ b/package/usbredir/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_USBREDIR
+	bool "usbredir"
+	depends on BR2_PACKAGE_LIBUSB
+	help
+	  usbredir is the name of a network protocol for sending usb device
+	  traffic over a network connection. It is also the name of the
+	  software package offering a parsing library, a usbredirhost library
+	  and several utilities implementing this protocol.
+	  
+	  Note: currently, only the library is installed, not the utilities.
+	  
+	  http://www.spice-space.org/page/UsbRedir
+
+comment "usbredir requires libusb"
+	depends on !BR2_PACKAGE_LIBUSB
diff --git a/package/usbredir/usbredir.mk b/package/usbredir/usbredir.mk
new file mode 100644
index 0000000..a70a60b
--- /dev/null
+++ b/package/usbredir/usbredir.mk
@@ -0,0 +1,26 @@
+#-----------------------------------------------------------------------------
+# Package description
+
+USBREDIR_VERSION         = 0.4.3
+USBREDIR_SOURCE          = usbredir-$(USBREDIR_VERSION).tar.bz2
+USBREDIR_SITE            = http://spice-space.org/download/usbredir
+USBREDIR_LICENSE         = LGPLv2.1+
+USBREDIR_LICENSE_FILES   = COPYING.LIB
+# Note: the executables are GPLv2+, but we do not use them
+USBREDIR_INSTALL_STAGING = YES
+USBREDIR_DEPENDENCIES    = libusb
+
+#----------------------------------------------------------------------------
+# Package build process
+
+USBREDIR_DEPENDENCIES += host-pkg-config
+
+# It's much easier to remove unwanted files after-the-fact, rather than trying
+# to install only what we want. Sad-and-dull life, but life nonetheless...
+# Note: do not ofrget to update the license, above, if you keep the server.
+define USBREDIR_POST_INSTALL_TARGET_RM_SERVER
+	rm -f $(TARGET_DIR)/usr/sbin/usbredirserver
+endef
+USBREDIR_POST_INSTALL_TARGET_HOOKS += USBREDIR_POST_INSTALL_TARGET_RM_SERVER
+
+$(eval $(autotools-package))
-- 
1.7.2.5
