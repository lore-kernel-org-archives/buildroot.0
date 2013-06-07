From: Patrick Ziegler <patrick.ziegler@fh-kl.de>
Date: Fri, 7 Jun 2013 15:20:14 +0200
Subject: [Buildroot] [PATCH] usb_modeswitch: bump to version 1.2.6
Message-ID: <51B1DE0E.8040804@fh-kl.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

drop patch applied upstream

Signed-off-by: Patrick Ziegler <patrick.ziegler@fh-kl.de>
---
 .../usb_modeswitch/usb_modeswitch-makefile.patch   | 31 ----------------------
 package/usb_modeswitch/usb_modeswitch.mk           |  9 ++-----
 2 files changed, 2 insertions(+), 38 deletions(-)
 delete mode 100644 package/usb_modeswitch/usb_modeswitch-makefile.patch

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
index 92ca163..7507a33 100644
--- a/package/usb_modeswitch/usb_modeswitch.mk
+++ b/package/usb_modeswitch/usb_modeswitch.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-USB_MODESWITCH_VERSION = 1.2.5
+USB_MODESWITCH_VERSION = 1.2.6
 USB_MODESWITCH_SOURCE = usb-modeswitch-$(USB_MODESWITCH_VERSION).tar.bz2
 USB_MODESWITCH_SITE = http://www.draisberghof.de/usb_modeswitch
 USB_MODESWITCH_DEPENDENCIES = libusb-compat
@@ -25,12 +25,7 @@ define USB_MODESWITCH_CLEAN_CMDS
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
-- 
1.8.1.2



-- 
Dipl.-Inf. (FH) Patrick Ziegler

University Of Applied Sciences
Kaiserslautern

Amerikastrasse 1
D-66482 Zweibruecken
Germany

Phone:  +49 631 3724 5526
Mail:   patrick.ziegler at fh-kl.de
PGP KeyID 0xB4796B8C

http://www.fh-kl.de
http://www.fh-kl.de/fachbereiche/imst/iuk-knowhow.html
