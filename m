From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 29 Oct 2009 22:59:22 +0100
Subject: [Buildroot] [git commit master] Add new usb_modeswitch package
Message-ID: <20091029220027.8323A7757D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=bdf41d6c8c59146511a5553845cd2358ff524fe0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #511.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                                            |    1 +
 package/Config.in                                  |    1 +
 package/usb_modeswitch/Config.in                   |    8 +++++
 .../usb_modeswitch/usb_modeswitch-nostrip.patch    |   11 ++++++++
 package/usb_modeswitch/usb_modeswitch.mk           |   28 ++++++++++++++++++++
 5 files changed, 49 insertions(+), 0 deletions(-)
 create mode 100644 package/usb_modeswitch/Config.in
 create mode 100644 package/usb_modeswitch/usb_modeswitch-nostrip.patch
 create mode 100644 package/usb_modeswitch/usb_modeswitch.mk

diff --git a/CHANGES b/CHANGES
index d3af70a..2f9f81b 100644
--- a/CHANGES
+++ b/CHANGES
@@ -21,6 +21,7 @@
 	#303: add gvfs package
 	#477: Add sdl_sound package
 	#487: Make kismet package sexier
+	#511: New package usb_modeswitch
 	#527: misc fixes for dnsmasq package
 	#565: libevent: Bump version and clean up makefile
 	#587: Use iptables multipurpose binaries and bump to 1.4.4
diff --git a/package/Config.in b/package/Config.in
index 6afa211..84492a8 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -270,6 +270,7 @@ if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 # mdev
 source "package/udev/Config.in"
 endif
+source "package/usb_modeswitch/Config.in"
 source "package/usbmount/Config.in"
 source "package/usbutils/Config.in"
 source "package/wipe/Config.in"
diff --git a/package/usb_modeswitch/Config.in b/package/usb_modeswitch/Config.in
new file mode 100644
index 0000000..41cd3a0
--- /dev/null
+++ b/package/usb_modeswitch/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_USB_MODESWITCH
+	bool "usb_modeswitch"
+	select BR2_PACKAGE_LIBUSB
+	help
+	  USB mode switcher.
+	  Used to switch mode on multiple-function devices
+
+	  http://www.draisberghof.de/usb_modeswitch/
diff --git a/package/usb_modeswitch/usb_modeswitch-nostrip.patch b/package/usb_modeswitch/usb_modeswitch-nostrip.patch
new file mode 100644
index 0000000..3bb8e8d
--- /dev/null
+++ b/package/usb_modeswitch/usb_modeswitch-nostrip.patch
@@ -0,0 +1,11 @@
+diff -Nura usb_modeswitch-1.0.1/Makefile usb_modeswitch-1.0.1.nostrip/Makefile
+--- usb_modeswitch-1.0.1/Makefile	2009-04-15 16:15:17.000000000 -0300
++++ usb_modeswitch-1.0.1.nostrip/Makefile	2009-06-10 10:02:05.000000000 -0300
+@@ -13,7 +13,6 @@
+ all:        $(PROG)
+ $(PROG):    $(OBJS)
+ 	      $(CC) $(CCFLAGS) -o $(PROG) $(OBJS)
+-	      $(STRIP) $(PROG)
+ 
+ clean:
+ 	      $(RM) ./usb_modeswitch
diff --git a/package/usb_modeswitch/usb_modeswitch.mk b/package/usb_modeswitch/usb_modeswitch.mk
new file mode 100644
index 0000000..fc5d2f6
--- /dev/null
+++ b/package/usb_modeswitch/usb_modeswitch.mk
@@ -0,0 +1,28 @@
+#############################################################
+#
+# usb_modeswitch
+#
+#############################################################
+
+USB_MODESWITCH_VERSION = 1.0.5
+USB_MODESWITCH_SOURCE = usb_modeswitch-$(USB_MODESWITCH_VERSION).tar.bz2
+USB_MODESWITCH_SITE = http://www.draisberghof.de/usb_modeswitch
+USB_MODESWITCH_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
+USB_MODESWITCH_DEPENDENCIES = libusb
+USB_MODESWITCH_MAKE_OPT = CC="$(TARGET_CC)" OPTS="$(TARGET_CFLAGS)"
+
+$(eval $(call AUTOTARGETS,package,usb_modeswitch))
+
+$(USB_MODESWITCH_TARGET_CONFIGURE):
+	rm -f $(USB_MODESWITCH_DIR)/usb_modeswitch
+	touch $@
+
+$(USB_MODESWITCH_HOOK_POST_INSTALL):
+	chmod a-x $(TARGET_DIR)/etc/usb_modeswitch.conf
+	touch $@
+
+$(USB_MODESWITCH_TARGET_UNINSTALL):
+	$(call MESSAGE,"Uninstalling")
+	rm -f $(TARGET_DIR)/usr/sbin/usb_modeswitch
+	rm -f $(TARGET_DIR)/etc/usb_modeswitch.conf
+	rm -f $(USB_MODESWITCH_TARGET_INSTALL_TARGET) $(USB_MODESWITCH_HOOK_POST_INSTALL)
-- 
1.6.3.3
