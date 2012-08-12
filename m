From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Aug 2012 19:23:37 +0200
Subject: [Buildroot] [git commit branch/next] new package:
	usb_modeswitch_data
Message-ID: <20120812172412.CEA6297177@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=572ba0692c7a41b4e4b86009b9964e5045939fef
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

usb_modeswitch_data provides udev rules for usb VID/PID combinations to
switch usb deices from their default mode into a more useable mode. The
default mode usually is a cdrom with installation software that is of
little use in an embedded linux situation

Signed-off-by: J.C. Woltz <jwoltz@gmail.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                                  |    1 +
 package/usb_modeswitch_data/Config.in              |   12 +++++++++
 .../usb_modeswitch_data-makefile.patch             |   27 ++++++++++++++++++++
 package/usb_modeswitch_data/usb_modeswitch_data.mk |   24 +++++++++++++++++
 4 files changed, 64 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 3a05917..3f46d3a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -239,6 +239,7 @@ source "package/uboot-tools/Config.in"
 source "package/udev/Config.in"
 source "package/unionfs/Config.in"
 source "package/usb_modeswitch/Config.in"
+source "package/usb_modeswitch_data/Config.in"
 source "package/usbmount/Config.in"
 source "package/usbutils/Config.in"
 source "package/wipe/Config.in"
diff --git a/package/usb_modeswitch_data/Config.in b/package/usb_modeswitch_data/Config.in
new file mode 100644
index 0000000..8698bb6
--- /dev/null
+++ b/package/usb_modeswitch_data/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_USB_MODESWITCH_DATA
+	bool "usb_modeswitch_data"
+	select BR2_PACKAGE_USB_MODESWITCH
+	# tcl is a runtime dependency
+	select BR2_PACKAGE_TCL
+	select BR2_PACKAGE_TCL_TCLSH
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
index 0000000..d493144
--- /dev/null
+++ b/package/usb_modeswitch_data/usb_modeswitch_data.mk
@@ -0,0 +1,24 @@
+#############################################################
+#
+# usb_modeswitch_data
+#
+#############################################################
+
+USB_MODESWITCH_DATA_VERSION = 20120812
+USB_MODESWITCH_DATA_SOURCE = usb-modeswitch-data-$(USB_MODESWITCH_DATA_VERSION).tar.bz2
+USB_MODESWITCH_DATA_SITE = http://www.draisberghof.de/usb_modeswitch
+USB_MODESWITCH_DATA_DEPENDENCIES = usb_modeswitch
+USB_MODESWITCH_DATA_LICENSE = GPLv2+
+USB_MODESWITCH_DATA_LICENSE_FILES = COPYING
+
+# Nothing to build, it is a pure data package
+
+define USB_MODESWITCH_DATA_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
+endef
+
+define USB_MODESWITCH_DATA_CLEAN_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) clean
+endef
+
+$(eval $(generic-package))
