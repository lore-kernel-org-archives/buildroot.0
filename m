From: J.C. Woltz <jwoltz@gmail.com>
Date: Sun, 12 Feb 2012 14:09:53 -0500
Subject: [Buildroot] [PATCH v3-resend 2/2] new program: usb_modeswitch_data
In-Reply-To: <1329073793-524-1-git-send-email-jwoltz@gmail.com>
References: <1329073793-524-1-git-send-email-jwoltz@gmail.com>
Message-ID: <1329073793-524-2-git-send-email-jwoltz@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

usb_modeswitch_data provides udev rules for usb VID/PID combinations to
switch usb deices from their default mode into a more useable mode. The
default mode usually is a cdrom with installation software that is of
little use in an embedded linux situation

Signed-off-by: J.C. Woltz <jwoltz@gmail.com>

Fix usb_modeswitch_data to depend usb_modeswitch
add $(TARGET_CONFIGURE_OPTS) to be consistent with usb_modeswitch

Signed-off-by: J.C. Woltz <jwoltz@gmail.com>
---
 package/Config.in                                  |    1 +
 package/usb_modeswitch_data/Config.in              |    8 ++++++
 .../usb_modeswitch_data-makefile.patch             |   24 ++++++++++++++++++
 package/usb_modeswitch_data/usb_modeswitch_data.mk |   26 ++++++++++++++++++++
 4 files changed, 59 insertions(+), 0 deletions(-)
 create mode 100644 package/usb_modeswitch_data/Config.in
 create mode 100644 package/usb_modeswitch_data/usb_modeswitch_data-makefile.patch
 create mode 100644 package/usb_modeswitch_data/usb_modeswitch_data.mk

diff --git a/package/Config.in b/package/Config.in
index 8a7c9c4..172f7ab 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -220,6 +220,7 @@ source "package/uboot-tools/Config.in"
 source "package/udev/Config.in"
 source "package/unionfs/Config.in"
 source "package/usb_modeswitch/Config.in"
+source "package/usb_modeswitch_data/Config.in"
 source "package/usbmount/Config.in"
 source "package/usbutils/Config.in"
 source "package/wipe/Config.in"
diff --git a/package/usb_modeswitch_data/Config.in b/package/usb_modeswitch_data/Config.in
new file mode 100644
index 0000000..144b669
--- /dev/null
+++ b/package/usb_modeswitch_data/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_USB_MODESWITCH_DATA
+	depends on BR2_PACKAGE_USB_MODESWITCH
+	bool "usb_modeswitch_data"
+	help
+	  USB mode switch data
+	  Contains udev rules and other device data
+	  
+	  http://www.draisberghof.de/usb_modeswitch/
diff --git a/package/usb_modeswitch_data/usb_modeswitch_data-makefile.patch b/package/usb_modeswitch_data/usb_modeswitch_data-makefile.patch
new file mode 100644
index 0000000..024bc76
--- /dev/null
+++ b/package/usb_modeswitch_data/usb_modeswitch_data-makefile.patch
@@ -0,0 +1,24 @@
+diff -Nura usb_modeswitch_data-20120120.orig/Makefile usb_modeswitch_data-20120120/Makefile
+--- usb_modeswitch_data-20120120.orig/Makefile	2012-01-20 17:25:32.000000000 -0500
++++ usb_modeswitch_data-20120120/Makefile	2012-02-06 14:20:47.000000000 -0500
+@@ -12,9 +12,9 @@
+ 
+ clean:
+ 
+-install: files-install db-install rules-reload
++install: files-install db-install
+ 
+-install-packed: files-install db-install-packed rules-reload
++install-packed: files-install db-install-packed
+ 
+ files-install:
+ 	install -d $(PREFIX)/share/usb_modeswitch
+@@ -50,7 +50,7 @@
+ 		fi \
+ 	fi
+ 
+-uninstall: files-uninstall rules-reload
++uninstall: files-uninstall
+ 
+ files-uninstall:
+ 	$(RM) $(RULESDIR)/40-usb_modeswitch.rules
diff --git a/package/usb_modeswitch_data/usb_modeswitch_data.mk b/package/usb_modeswitch_data/usb_modeswitch_data.mk
new file mode 100644
index 0000000..b3a344e
--- /dev/null
+++ b/package/usb_modeswitch_data/usb_modeswitch_data.mk
@@ -0,0 +1,26 @@
+#############################################################
+#
+# usb_modeswitch_data
+#
+#############################################################
+
+USB_MODESWITCH_DATA_VERSION = 20120120
+USB_MODESWITCH_DATA_SOURCE = usb-modeswitch-data-$(USB_MODESWITCH_DATA_VERSION).tar.bz2
+USB_MODESWITCH_DATA_SITE = http://www.draisberghof.de/usb_modeswitch
+USB_MODESWITCH_DATA_DEPENDENCIES = usb_modeswitch
+
+define USB_MODESWITCH_DATA_BUILD_CMDS
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) CC="$(TARGET_CC)" LD="$(TARGET_LD)" -C $(@D)
+endef
+
+define USB_MODESWITCH_DATA_INSTALL_TARGET_CMDS
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
+endef
+
+
+define USB_MODESWITCH_DATA_CLEAN_CMDS
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) clean
+endef
+
+$(eval $(call GENTARGETS))
+
-- 
1.7.5.4
