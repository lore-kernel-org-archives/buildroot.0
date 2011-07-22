From: Yegor Yefremov <yegor_sub1@visionsystems.de>
Date: Fri, 22 Jul 2011 16:58:19 +0200
Subject: [Buildroot] [PATCH 3/3]  usbmount fixes
In-Reply-To: <4E298ED8.5000901@visionsystems.de>
References: <4E298D06.4050107@visionsystems.de>
 <4E298E70.50200@visionsystems.de> <4E298ED8.5000901@visionsystems.de>
Message-ID: <4E29900B.6040502@visionsystems.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- create mounting points
- fix dependencies
- fix udev rules
- fix fs type detection

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/usbmount/Config.in                           |    2 +
 package/usbmount/usbmount-fstype-detection-fix.patch |   25 +++++++++++++++++++
 package/usbmount/usbmount-rules-fix.patch            |   19 ++++++++++++++
 package/usbmount/usbmount.mk                         |   24 +++++++++++++++---
 4 files changed, 66 insertions(+), 4 deletions(-)

Index: b/package/usbmount/Config.in
===================================================================
--- a/package/usbmount/Config.in
+++ b/package/usbmount/Config.in
@@ -2,6 +2,8 @@
 	bool "usbmount"
 	select BR2_PACKAGE_UDEV
 	select BR2_PACKAGE_LOCKFILE_PROGS
+	select BR2_PACKAGE_UTIL_LINUX
+	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
 	help
 	  The usbmount package automatically mounts USB mass storage devices
 	  when they are plugged in, and unmounts them when they are removed.
Index: b/package/usbmount/usbmount-fstype-detection-fix.patch
===================================================================
--- /dev/null
+++ b/package/usbmount/usbmount-fstype-detection-fix.patch
@@ -0,0 +1,25 @@
+newer blkid version shows two parameter with TYPE within:
+
+/dev/sda1: VERSION="0.0" TYPE="ext2" USAGE="filesystem" PART_ENTRY_SCHEME="dos"
+PART_ENTRY_TYPE="0xc" PART_ENTRY_FLAGS="0x80" PART_ENTRY_NUMBER="1"
+
+change regular expression to take " TYPE" only
+
+Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
+---
+ usbmount |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+Index: b/usbmount
+===================================================================
+--- a/usbmount
++++ b/usbmount
+@@ -88,7 +88,7 @@
+     #   FIXME: improvement: implement mounting by label (notice that labels
+     #   can contain spaces, which makes things a little bit less comfortable).
+     DEVINFO=$(/sbin/blkid -p $DEVNAME)
+-    FSTYPE=$(echo "$DEVINFO" | sed 's/.*TYPE="\([^"]*\)".*/\1/g; s/[[:blank:]]*//g;')
++    FSTYPE=$(echo "$DEVINFO" | sed 's/.* TYPE="\([^"]*\)".*/\1/g; s/[[:blank:]]*//g;')
+     UUID=$(echo "$DEVINFO"   | sed 's/.*UUID="\([^"]*\)".*/\1/g; s/[[:blank:]]*//g;')
+     USAGE=$(echo "$DEVINFO"  | sed 's/.*USAGE="\([^"]*\)".*/\1/g; s/[[:blank:]]*//g;')
+
Index: b/package/usbmount/usbmount.mk
===================================================================
--- a/package/usbmount/usbmount.mk
+++ b/package/usbmount/usbmount.mk
@@ -6,20 +6,36 @@
 USBMOUNT_VERSION = 0.0.21
 USBMOUNT_SOURCE = usbmount_$(USBMOUNT_VERSION).tar.gz
 USBMOUNT_SITE = $(BR2_DEBIAN_MIRROR)/debian/pool/main/u/usbmount
-USBMOUNT_DEPENDENCIES = udev lockfile-progs
+USBMOUNT_DEPENDENCIES = udev lockfile-progs util-linux
 
 define USBMOUNT_INSTALL_TARGET_CMDS
 	$(INSTALL) -m 0755 -D $(@D)/usbmount $(TARGET_DIR)/usr/share/usbmount/usbmount
+
+	$(INSTALL) -m 0755 -D $(@D)/00_create_model_symlink 	\
+		$(TARGET_DIR)/etc/usbmount/usbmount.d/00_create_model_symlink
+	$(INSTALL) -m 0755 -D $(@D)/00_remove_model_symlink 	\
+		$(TARGET_DIR)/etc/usbmount/usbmount.d/00_remove_model_symlink
+
 	$(INSTALL) -m 0644 -D $(@D)/usbmount.rules $(TARGET_DIR)/lib/udev/rules.d/usbmount.rules
 	@if [ ! -f $(TARGET_DIR)/etc/usbmount/usbmount.conf ]; then \
 	        $(INSTALL) -m 0644 -D $(@D)/usbmount.conf $(TARGET_DIR)/etc/usbmount/usbmount.conf; \
 	fi
+
+	mkdir -p $(TARGET_DIR)/media
+	mkdir -p $(TARGET_DIR)/media/usb0
+	mkdir -p $(TARGET_DIR)/media/usb1
+	mkdir -p $(TARGET_DIR)/media/usb2
+	mkdir -p $(TARGET_DIR)/media/usb3
+	mkdir -p $(TARGET_DIR)/media/usb4
+	mkdir -p $(TARGET_DIR)/media/usb5
+	mkdir -p $(TARGET_DIR)/media/usb6
 endef
 
 define USBMOUNT_UNINSTALL_TARGET_CMDS
-	rm -rf $(TARGET_DIR)/etc/usbmount \
-	       $(TARGET_DIR)/usr/share/usbmount/usbmount \
-	       $(TARGET_DIR)/lib/udev/rules.d/usbmount.rules
+	rm -rf $(TARGET_DIR)/etc/usbmount			\
+		$(TARGET_DIR)/usr/share/usbmount/usbmount	\
+		$(TARGET_DIR)/lib/udev/rules.d/usbmount.rules	\
+		$(TARGET_DIR)/media
 endef
 
 $(eval $(call GENTARGETS,package,usbmount))
Index: b/package/usbmount/usbmount-rules-fix.patch
===================================================================
--- /dev/null
+++ b/package/usbmount/usbmount-rules-fix.patch
@@ -0,0 +1,19 @@
+Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
+---
+ usbmount.rules |    4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+Index: b/usbmount.rules
+===================================================================
+--- a/usbmount.rules
++++ b/usbmount.rules
+@@ -1,7 +1,7 @@
+ # Rules for USBmount -*- conf -*-
+
+ KERNEL=="sd*", DRIVERS=="sbp2",		ACTION=="add",	RUN+="/usr/share/usbmount/usbmount add"
+-KERNEL=="sd*", SUBSYSTEMS=="usb",	ACTION=="add",	RUN+="/usr/share/usbmount/usbmount add"
+-KERNEL=="ub*", SUBSYSTEMS=="usb",	ACTION=="add",	RUN+="/usr/share/usbmount/usbmount add"
++KERNEL=="sd*", SUBSYSTEM=="block",	ACTION=="add",	RUN+="/usr/share/usbmount/usbmount add"
++KERNEL=="ub*", SUBSYSTEM=="block",	ACTION=="add",	RUN+="/usr/share/usbmount/usbmount add"
+ KERNEL=="sd*",				ACTION=="remove",	RUN+="/usr/share/usbmount/usbmount remove"
+ KERNEL=="ub*",				ACTION=="remove",	RUN+="/usr/share/usbmount/usbmount remove"
