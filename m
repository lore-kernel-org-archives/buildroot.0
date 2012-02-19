From: J.C. Woltz <jwoltz@gmail.com>
Date: Sun, 19 Feb 2012 12:49:54 -0500
Subject: [Buildroot] [PATCH v5 2/2] new program: usb_modeswitch_data
In-Reply-To: <1329673794-17158-1-git-send-email-jwoltz@gmail.com>
References: <1329673794-17158-1-git-send-email-jwoltz@gmail.com>
Message-ID: <1329673794-17158-3-git-send-email-jwoltz@gmail.com>
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
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
version 3:
Fix usb_modeswitch_data to depend usb_modeswitch
add $(TARGET_CONFIGURE_OPTS) to be consistent with usb_modeswitch

version 4:
fix error. change to $(TARGET_MAKE_ENV) from $(TARGET_CONFIGURE_OPTS)

updated to use "select" instead of "depends on" as recommended by
Arnout Vandecappelle
Added a select for TCL and BR2_PACKAGE_TCL_TCLSH
This depends on the patch submitted by:
Arnout Vandecappelle

version 5:
Added explanation to patch and a signoff line
This should be final. This includes all changes mentioned by others on the
mailing list.

 package/Config.in                                  |    1 +
 package/usb_modeswitch_data/Config.in              |   11 ++++++++
 .../usb_modeswitch_data-makefile.patch             |   27 ++++++++++++++++++++
 package/usb_modeswitch_data/usb_modeswitch_data.mk |   26 +++++++++++++++++++
 4 files changed, 65 insertions(+), 0 deletions(-)
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
index 0000000..d15e6e7
--- /dev/null
+++ b/package/usb_modeswitch_data/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_USB_MODESWITCH_DATA
+	select BR2_PACKAGE_USB_MODESWITCH
+	select BR2_PACKAGE_TCL
+	select BR2_PACKAGE_TCL_TCLSH
+	bool "usb_modeswitch_data"
+	help
+	  USB mode switch data
+	  Contains udev rules and events to allow usb_modeswitch to
+	  function automatically
+	  
+	  http://www.draisberghof.de/usb_modeswitch/
diff --git a/package/usb_modeswitch_data/usb_modeswitch_data-makefile.patch b/package/usb_modeswitch_data/usb_modeswitch_data-makefile.patch
new file mode 100644
index 0000000..769e514
--- /dev/null
+++ b/package/usb_modeswitch_data/usb_modeswitch_data-makefile.patch
@@ -0,0 +1,27 @@
+Fixed Makefile install sections to not reload udev rules. In a 
+cross-compiler environment, it is not wanted to reload the host udev rules.
+
+Signed-off-by: J.C. Woltz <jwoltz@gmail.com>
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
index 0000000..46f5b45
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
+	$(TARGET_MAKE_ENV) $(MAKE) CC="$(TARGET_CC)" LD="$(TARGET_LD)" -C $(@D)
+endef
+
+define USB_MODESWITCH_DATA_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
+endef
+
+
+define USB_MODESWITCH_DATA_CLEAN_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) clean
+endef
+
+$(eval $(call GENTARGETS))
+
-- 
1.7.5.4
