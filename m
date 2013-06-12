From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 12 Jun 2013 22:50:17 +0200
Subject: [Buildroot] [git commit] usb_modeswitch: bump to version 1.2.6
Message-ID: <20130612210545.F27E09AC69@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d3e4db4e34927bff16c2ef06033304a068f46292
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove 'usb_modeswitch-makefile.patch' because it was merged upstream.

This package contains a dispatcher (wrapper) that can be installed as Tcl
script or as binary without further dependency.  If Tcl is selected and the
binary interpreter is installed (BR2_PACKAGE_TCL &&
!BR2_PACKAGE_TCL_SHLIB_ONLY) the dispatcher will be installed as Tcl script
otherwise as binary.

Signed-off-by: Patrick Ziegler <patrick.ziegler@fh-kl.de>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../usb_modeswitch/usb_modeswitch-makefile.patch   |   31 --------------------
 package/usb_modeswitch/usb_modeswitch.mk           |   26 +++++++++++------
 2 files changed, 17 insertions(+), 40 deletions(-)

diff --git a/package/usb_modeswitch/usb_modeswitch-makefile.patch b/package/usb_modeswitch/usb_modeswitch-makefile.patch
deleted file mode 100644
index b792741..0000000
--- a/package/usb_modeswitch/usb_modeswitch-makefile.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-Removed the -s from the install command. Without this, usb_modeswitch would
-fail to install.
-
-Signed-off-by: J.C. Woltz <jwoltz@gmail.com>
-
-Index: b/Makefile
-===================================================================
---- a/Makefile
-+++ b/Makefile
-@@ -46,7 +46,7 @@
- 	cd jim && $(MAKE) distclean
- 
- install-common: all
--	install -D -s --mode=755 usb_modeswitch $(SBINDIR)/usb_modeswitch
-+	install -D --mode=755 usb_modeswitch $(SBINDIR)/usb_modeswitch
- 	install -D --mode=755 usb_modeswitch.sh $(UDEVDIR)/usb_modeswitch
- 	install -D --mode=644 usb_modeswitch.conf $(ETCDIR)/usb_modeswitch.conf
- 	install -D --mode=644 usb_modeswitch.1 $(MANDIR)/usb_modeswitch.1
-@@ -67,10 +67,10 @@
- install: install-common install-script
- 
- install-shared: dispatcher-dynamic install-common
--	install -D -s --mode=755 usb_modeswitch_dispatcher $(SBINDIR)/usb_modeswitch_dispatcher
-+	install -D --mode=755 usb_modeswitch_dispatcher $(SBINDIR)/usb_modeswitch_dispatcher
- 
- install-static: dispatcher-static install-common
--	install -D -s --mode=755 usb_modeswitch_dispatcher $(SBINDIR)/usb_modeswitch_dispatcher
-+	install -D --mode=755 usb_modeswitch_dispatcher $(SBINDIR)/usb_modeswitch_dispatcher
- 
- uninstall:
- 	$(RM) $(SBINDIR)/usb_modeswitch
diff --git a/package/usb_modeswitch/usb_modeswitch.mk b/package/usb_modeswitch/usb_modeswitch.mk
index 92ca163..fe54b50 100644
--- a/package/usb_modeswitch/usb_modeswitch.mk
+++ b/package/usb_modeswitch/usb_modeswitch.mk
@@ -4,19 +4,32 @@
 #
 ################################################################################
 
-USB_MODESWITCH_VERSION = 1.2.5
+USB_MODESWITCH_VERSION = 1.2.6
 USB_MODESWITCH_SOURCE = usb-modeswitch-$(USB_MODESWITCH_VERSION).tar.bz2
 USB_MODESWITCH_SITE = http://www.draisberghof.de/usb_modeswitch
 USB_MODESWITCH_DEPENDENCIES = libusb-compat
 USB_MODESWITCH_LICENSE = GPLv2+
 USB_MODESWITCH_LICENSE_FILES = COPYING
 
+USB_MODESWITCH_BUILD_TARGETS = static
+USB_MODESWITCH_INSTALL_TARGETS = install-static
+
+ifeq ($(BR2_PACKAGE_TCL)$(BR2_PACKAGE_TCL_SHLIB_ONLY),y)
+	USB_MODESWITCH_DEPENDENCIES += tcl
+	USB_MODESWITCH_BUILD_TARGETS = script
+	USB_MODESWITCH_INSTALL_TARGETS = install-script
+endif
+
 define USB_MODESWITCH_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
+	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
+		CFLAGS="$(TARGET_CFLAGS) -D_GNU_SOURCE -Wall -I." \
+		-C $(@D) $(USB_MODESWITCH_BUILD_TARGETS)
 endef
 
 define USB_MODESWITCH_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
+	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
+		DESTDIR=$(TARGET_DIR) \
+		-C $(@D) $(USB_MODESWITCH_INSTALL_TARGETS)
 endef
 
 
@@ -25,12 +38,7 @@ define USB_MODESWITCH_CLEAN_CMDS
 endef
 
 define USB_MODESWITCH_UNINSTALL_CMDS
-	$(RM) -f $(TARGET_DIR)/usr/sbin/usb_modeswitch
-	$(RM) -f $(TARGET_DIR)/lib/udev/usb_modeswitch
-	$(RM) -f $(TARGET_DIR)/etc/usb_modeswitch.setup
-	$(RM) -f $(TARGET_DIR)/usr/share/man/man1/usb_modeswitch.1
-	$(RM) -rf $(TARGET_DIR)/var/lib/usb_modeswitch
-	$(RM) -f $(TARGET_DIR)/usr/sbin/usb_modeswitch_dispatcher
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) uninstall
 endef
 
 $(eval $(generic-package))
