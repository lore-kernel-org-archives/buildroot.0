From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 16 Dec 2012 20:16:01 +0100
Subject: [Buildroot] [git commit] package/usbredir: new package
Message-ID: <20121216200125.F0E3A9A29B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=511d7317ad72fab84287f32c5a6872593d932d72
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Peter Korsgaard <jacmet@uclibc.org>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in            |    1 +
 package/usbredir/Config.in   |   29 +++++++++++++++++++++++++++++
 package/usbredir/usbredir.mk |   29 +++++++++++++++++++++++++++++
 3 files changed, 59 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 70a572b..1ed77e0 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -494,6 +494,7 @@ source "package/libupnp/Config.in"
 source "package/libvncserver/Config.in"
 source "package/nss-mdns/Config.in"
 source "package/ortp/Config.in"
+source "package/usbredir/Config.in"
 source "package/zeromq/Config.in"
 endmenu
 
diff --git a/package/usbredir/Config.in b/package/usbredir/Config.in
new file mode 100644
index 0000000..e2a7184
--- /dev/null
+++ b/package/usbredir/Config.in
@@ -0,0 +1,29 @@
+comment "usbredir needs a toolchain with threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
+
+config BR2_PACKAGE_USBREDIR
+	bool "usbredir"
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
+	select BR2_PACKAGE_LIBUSB
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
index 0000000..ac98472
--- /dev/null
+++ b/package/usbredir/usbredir.mk
@@ -0,0 +1,29 @@
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
+USBREDIR_DEPENDENCIES    = host-pkgconf libusb
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
