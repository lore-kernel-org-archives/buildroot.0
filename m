From: J.C. Woltz <jwoltz@gmail.com>
Date: Sat, 17 Mar 2012 21:30:34 -0400
Subject: [Buildroot] [PATCH v5 1/2] usb_modeswitch: update to 1.2.3
In-Reply-To: <1332034235-17423-1-git-send-email-jwoltz@gmail.com>
References: <1332034235-17423-1-git-send-email-jwoltz@gmail.com>
Message-ID: <1332034235-17423-2-git-send-email-jwoltz@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch updates usb_modeswitch to version 1.2.3.
The usb_modeswitch.mk needed to be modified for usb_modeswitch to compile.
Also added extra remove section for the added help scripts and files.

Signed-off-by: J.C. Woltz <jwoltz@gmail.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
replace TARGET_MAKE_ENV and add USB_MODESWITCH_UNINSTALL_CMDS
as recommended by Arnout Vandecappelle

Other version information has been lost

version 5:
added explanation to patch
 .../usb_modeswitch/usb_modeswitch-makefile.patch   |   43 ++++++++++----------
 package/usb_modeswitch/usb_modeswitch.mk           |   20 ++++++---
 2 files changed, 35 insertions(+), 28 deletions(-)

diff --git a/package/usb_modeswitch/usb_modeswitch-makefile.patch b/package/usb_modeswitch/usb_modeswitch-makefile.patch
index 918200b..55b0b3d 100644
--- a/package/usb_modeswitch/usb_modeswitch-makefile.patch
+++ b/package/usb_modeswitch/usb_modeswitch-makefile.patch
@@ -1,23 +1,24 @@
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
+Removed the -s from the install command. Without this, usb_modeswitch woulc
+fail to install. 
+
+Signed-off-by: J.C. Woltz <jwoltz@gmail.com>
+--- usb_modeswitch-1.2.3.orig/Makefile.orig	2012-02-06 14:00:15.000000000 -0500
++++ usb_modeswitch-1.2.3/Makefile	2012-02-06 14:01:13.000000000 -0500
+@@ -46,7 +46,7 @@
+ 	cd jim && $(MAKE) distclean
  
+ install-common:
+-	install -D -s --mode=755 usb_modeswitch $(SBINDIR)/usb_modeswitch
++	install -D --mode=755 usb_modeswitch $(SBINDIR)/usb_modeswitch
+ 	install -D --mode=755 usb_modeswitch.sh $(UDEVDIR)/usb_modeswitch
+ 	install -D --mode=644 usb_modeswitch.conf $(ETCDIR)/usb_modeswitch.conf
+ 	install -D --mode=644 usb_modeswitch.1 $(MANDIR)/usb_modeswitch.1
+@@ -65,7 +65,7 @@
+ 	install -D --mode=755 usb_modeswitch_dispatcher $(SBINDIR)/usb_modeswitch_dispatcher
+ 
+ install-binary:
+-	install -D -s --mode=755 usb_modeswitch_dispatcher $(SBINDIR)/usb_modeswitch_dispatcher
++	install -D --mode=755 usb_modeswitch_dispatcher $(SBINDIR)/usb_modeswitch_dispatcher
+ 
+ install: all install-common install-script
  
diff --git a/package/usb_modeswitch/usb_modeswitch.mk b/package/usb_modeswitch/usb_modeswitch.mk
index 7b982d8..c8b24db 100644
--- a/package/usb_modeswitch/usb_modeswitch.mk
+++ b/package/usb_modeswitch/usb_modeswitch.mk
@@ -4,25 +4,31 @@
 #
 #############################################################
 
-USB_MODESWITCH_VERSION = 1.1.2
+USB_MODESWITCH_VERSION = 1.2.3
 USB_MODESWITCH_SOURCE = usb-modeswitch-$(USB_MODESWITCH_VERSION).tar.bz2
 USB_MODESWITCH_SITE = http://www.draisberghof.de/usb_modeswitch
 USB_MODESWITCH_DEPENDENCIES = libusb-compat
 
 define USB_MODESWITCH_BUILD_CMDS
-	$(TARGET_CONFIGURE_OPTS) $(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
+	$(TARGET_MAKE_ENV) $(MAKE) CC="$(TARGET_CC)" LD="$(TARGET_LD)" -C $(@D)
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
+endef
+
+define USB_MODESWITCH_UNINSTALL_CMDS
+	$(RM) -f $(TARGET_DIR)/usr/sbin/usb_modeswitch
+	$(RM) -f $(TARGET_DIR)/lib/udev/usb_modeswitch
+	$(RM) -f $(TARGET_DIR)/etc/usb_modeswitch.setup
+	$(RM) -f $(TARGET_DIR)/usr/share/man/man1/usb_modeswitch.1
+	$(RM) -rf $(TARGET_DIR)/var/lib/usb_modeswitch
+	$(RM) -f $(TARGET_DIR)/usr/sbin/usb_modeswitch_dispatcher
 endef
 
 $(eval $(call GENTARGETS))
-- 
1.7.5.4
