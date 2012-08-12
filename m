From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Aug 2012 19:00:29 +0200
Subject: [Buildroot] [git commit branch/next] usb_modeswitch: update to 1.2.4
Message-ID: <20120812172412.BE2AE97176@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1fc66acff88caf18e0649e5482a5a55eae633eee
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This patch updates usb_modeswitch to version 1.2.4. The
usb_modeswitch.mk needed to be modified for usb_modeswitch to compile.
Also added extra remove section for the added help scripts and files.

[thomas.petazzoni at free-electrons.com:
  bumped further to 1.2.4 instead of 1.2.3, adjusted the patch accordingly
  use TARGET_CONFIGURE_OPTS instead of passing CC, LD manually
  add license information.]

Signed-off-by: J.C. Woltz <jwoltz@gmail.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../usb_modeswitch/usb_modeswitch-makefile.patch   |   50 +++++++++++--------
 package/usb_modeswitch/usb_modeswitch.mk           |   23 ++++++---
 2 files changed, 44 insertions(+), 29 deletions(-)

diff --git a/package/usb_modeswitch/usb_modeswitch-makefile.patch b/package/usb_modeswitch/usb_modeswitch-makefile.patch
index 918200b..b792741 100644
--- a/package/usb_modeswitch/usb_modeswitch-makefile.patch
+++ b/package/usb_modeswitch/usb_modeswitch-makefile.patch
@@ -1,23 +1,31 @@
-diff -Nura usb-modeswitch-1.1.2.orig/Makefile usb-modeswitch-1.1.2/Makefile
---- usb-modeswitch-1.1.2.orig/Makefile	2010-04-17 15:27:11.000000000 -0300
-+++ usb-modeswitch-1.1.2/Makefile	2010-04-22 15:05:32.363471807 -0300
-@@ -1,6 +1,6 @@
- PROG        = usb_modeswitch
- VERS        = 1.1.2
--CC          = gcc
-+CC          ?= gcc
- CFLAGS      += -Wall -l usb
- RM          = /bin/rm -f
- OBJS        = usb_modeswitch.c
-@@ -23,8 +23,9 @@
- install: all
- 	install -d $(SBINDIR)
- 	install --mode=755 usb_modeswitch $(SBINDIR)/usb_modeswitch
--	install --mode=755 usb_modeswitch.tcl $(UDEVDIR)/usb_modeswitch
--	install --mode=644 usb_modeswitch.conf $(ETCDIR)/usb_modeswitch.conf
-+	#install --mode=755 usb_modeswitch.tcl $(UDEVDIR)/usb_modeswitch
-+	#install --mode=644 usb_modeswitch.conf $(ETCDIR)/usb_modeswitch.conf
-+	install -d $(MANDIR)
- 	install --mode=644 usb_modeswitch.1 $(MANDIR)/usb_modeswitch.1
+Removed the -s from the install command. Without this, usb_modeswitch would
+fail to install.
+
+Signed-off-by: J.C. Woltz <jwoltz@gmail.com>
+
+Index: b/Makefile
+===================================================================
+--- a/Makefile
++++ b/Makefile
+@@ -46,7 +46,7 @@
+ 	cd jim && $(MAKE) distclean
  
+ install-common: all
+-	install -D -s --mode=755 usb_modeswitch $(SBINDIR)/usb_modeswitch
++	install -D --mode=755 usb_modeswitch $(SBINDIR)/usb_modeswitch
+ 	install -D --mode=755 usb_modeswitch.sh $(UDEVDIR)/usb_modeswitch
+ 	install -D --mode=644 usb_modeswitch.conf $(ETCDIR)/usb_modeswitch.conf
+ 	install -D --mode=644 usb_modeswitch.1 $(MANDIR)/usb_modeswitch.1
+@@ -67,10 +67,10 @@
+ install: install-common install-script
  
+ install-shared: dispatcher-dynamic install-common
+-	install -D -s --mode=755 usb_modeswitch_dispatcher $(SBINDIR)/usb_modeswitch_dispatcher
++	install -D --mode=755 usb_modeswitch_dispatcher $(SBINDIR)/usb_modeswitch_dispatcher
+ 
+ install-static: dispatcher-static install-common
+-	install -D -s --mode=755 usb_modeswitch_dispatcher $(SBINDIR)/usb_modeswitch_dispatcher
++	install -D --mode=755 usb_modeswitch_dispatcher $(SBINDIR)/usb_modeswitch_dispatcher
+ 
+ uninstall:
+ 	$(RM) $(SBINDIR)/usb_modeswitch
diff --git a/package/usb_modeswitch/usb_modeswitch.mk b/package/usb_modeswitch/usb_modeswitch.mk
index 5f20f30..c517991 100644
--- a/package/usb_modeswitch/usb_modeswitch.mk
+++ b/package/usb_modeswitch/usb_modeswitch.mk
@@ -4,26 +4,33 @@
 #
 #############################################################
 
-USB_MODESWITCH_VERSION = 1.1.2
+USB_MODESWITCH_VERSION = 1.2.4
 USB_MODESWITCH_SOURCE = usb-modeswitch-$(USB_MODESWITCH_VERSION).tar.bz2
 USB_MODESWITCH_SITE = http://www.draisberghof.de/usb_modeswitch
 USB_MODESWITCH_DEPENDENCIES = libusb-compat
+USB_MODESWITCH_LICENSE = GPLv2+
+USB_MODESWITCH_LICENSE_FILES = COPYING
 
 define USB_MODESWITCH_BUILD_CMDS
-	$(TARGET_CONFIGURE_OPTS) $(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
+	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
 endef
 
 define USB_MODESWITCH_INSTALL_TARGET_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
-	$(INSTALL) -D $(@D)/usb_modeswitch.setup -m 0644 \
-		$(TARGET_DIR)/etc/usb_modeswitch.setup
 endef
 
+
 define USB_MODESWITCH_CLEAN_CMDS
-	rm -f $(TARGET_DIR)/usr/sbin/usb_modeswitch
-	rm -f $(TARGET_DIR)/etc/usb_modeswitch.setup
-	rm -f $(TARGET_DIR)/usr/share/man/man1/usb_modeswitch.1
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) clean
 endef
 
-$(eval $(generic-package))
+define USB_MODESWITCH_UNINSTALL_CMDS
+	$(RM) -f $(TARGET_DIR)/usr/sbin/usb_modeswitch
+	$(RM) -f $(TARGET_DIR)/lib/udev/usb_modeswitch
+	$(RM) -f $(TARGET_DIR)/etc/usb_modeswitch.setup
+	$(RM) -f $(TARGET_DIR)/usr/share/man/man1/usb_modeswitch.1
+	$(RM) -rf $(TARGET_DIR)/var/lib/usb_modeswitch
+	$(RM) -f $(TARGET_DIR)/usr/sbin/usb_modeswitch_dispatcher
+endef
 
+$(eval $(generic-package))
