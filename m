From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 8 Apr 2010 11:37:12 +0200
Subject: [Buildroot] [git commit master] usb_modeswitch: use GENTARGETS
	instead of AUTOTARGETS
Message-ID: <20100408094037.0CE059994D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=6caec6f3b3aecf41c3a051ffa4b5d9a2e41775ca
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

usb_modeswitch build system is just a simple Makefile, so the
GENTARGETS infrastructure is more appropriate than the AUTOTARGETS
infrastructure. The build system is slightly fixed through a small
patch, that replaces the previous "nostrip" patch.

The latest version of usb_modeswitch is 1.1.1, but it now relies on
udev and requires TCL to operate. Someone actually using
usb_modeswitch would probably be at a better place to do this version
bump.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../usb_modeswitch-1.0.7-build-system-fix.patch    |   29 ++++++++++++++++++++
 .../usb_modeswitch/usb_modeswitch-nostrip.patch    |   11 -------
 package/usb_modeswitch/usb_modeswitch.mk           |   26 ++++++++---------
 3 files changed, 41 insertions(+), 25 deletions(-)
 create mode 100644 package/usb_modeswitch/usb_modeswitch-1.0.7-build-system-fix.patch
 delete mode 100644 package/usb_modeswitch/usb_modeswitch-nostrip.patch

diff --git a/package/usb_modeswitch/usb_modeswitch-1.0.7-build-system-fix.patch b/package/usb_modeswitch/usb_modeswitch-1.0.7-build-system-fix.patch
new file mode 100644
index 0000000..71dbc7a
--- /dev/null
+++ b/package/usb_modeswitch/usb_modeswitch-1.0.7-build-system-fix.patch
@@ -0,0 +1,29 @@
+---
+ Makefile |    7 +++----
+ 1 file changed, 3 insertions(+), 4 deletions(-)
+
+Index: usb_modeswitch-1.0.7/Makefile
+===================================================================
+--- usb_modeswitch-1.0.7.orig/Makefile
++++ usb_modeswitch-1.0.7/Makefile
+@@ -1,8 +1,8 @@
+ PROG        = usb_modeswitch
+ VERS        = 1.0.7
+ STRIP	    = strip
+-CC          = gcc
+-CCFLAGS     = -l usb -Wall
++CC          ?= gcc
++CFLAGS      += -l usb -Wall
+ RM          = /bin/rm -f
+ OBJS        = usb_modeswitch.c
+ PREFIX	    = $(DESTDIR)/usr
+@@ -12,8 +12,7 @@
+ .PHONY:     clean
+ all:        $(PROG)
+ $(PROG):    $(OBJS)
+-	      $(CC) $(CCFLAGS) -o $(PROG) $(OBJS)
+-	      $(STRIP) $(PROG)
++	      $(CC) $(CFLAGS) -o $(PROG) $(OBJS)
+ 
+ clean:
+ 	      $(RM) ./usb_modeswitch
diff --git a/package/usb_modeswitch/usb_modeswitch-nostrip.patch b/package/usb_modeswitch/usb_modeswitch-nostrip.patch
deleted file mode 100644
index 3bb8e8d..0000000
--- a/package/usb_modeswitch/usb_modeswitch-nostrip.patch
+++ /dev/null
@@ -1,11 +0,0 @@
-diff -Nura usb_modeswitch-1.0.1/Makefile usb_modeswitch-1.0.1.nostrip/Makefile
---- usb_modeswitch-1.0.1/Makefile	2009-04-15 16:15:17.000000000 -0300
-+++ usb_modeswitch-1.0.1.nostrip/Makefile	2009-06-10 10:02:05.000000000 -0300
-@@ -13,7 +13,6 @@
- all:        $(PROG)
- $(PROG):    $(OBJS)
- 	      $(CC) $(CCFLAGS) -o $(PROG) $(OBJS)
--	      $(STRIP) $(PROG)
- 
- clean:
- 	      $(RM) ./usb_modeswitch
diff --git a/package/usb_modeswitch/usb_modeswitch.mk b/package/usb_modeswitch/usb_modeswitch.mk
index 377bc3b..d84ccc2 100644
--- a/package/usb_modeswitch/usb_modeswitch.mk
+++ b/package/usb_modeswitch/usb_modeswitch.mk
@@ -7,22 +7,20 @@
 USB_MODESWITCH_VERSION = 1.0.7
 USB_MODESWITCH_SOURCE = usb_modeswitch-$(USB_MODESWITCH_VERSION).tar.bz2
 USB_MODESWITCH_SITE = http://www.draisberghof.de/usb_modeswitch
-USB_MODESWITCH_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
 USB_MODESWITCH_DEPENDENCIES = libusb-compat
-USB_MODESWITCH_MAKE_OPT = CC="$(TARGET_CC)" OPTS="$(TARGET_CFLAGS)"
 
-$(eval $(call AUTOTARGETS,package,usb_modeswitch))
+define USB_MODESWITCH_BUILD_CMDS
+ rm $(@D)/usb_modeswitch
+ $(TARGET_CONFIGURE_OPTS) $(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
+endef
 
-$(USB_MODESWITCH_TARGET_CONFIGURE):
-	rm -f $(USB_MODESWITCH_DIR)/usb_modeswitch
-	touch $@
+define USB_MODESWITCH_INSTALL_TARGET_CMDS
+ $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
+endef
 
-$(USB_MODESWITCH_HOOK_POST_INSTALL):
-	chmod a-x $(TARGET_DIR)/etc/usb_modeswitch.conf
-	touch $@
+define USB_MODESWITCH_CLEAN_CMDS
+ rm -f $(TARGET_DIR)/usr/sbin/usb_modeswitch
+ rm -f $(TARGET_DIR)/etc/usb_modeswitch.conf
+endef
 
-$(USB_MODESWITCH_TARGET_UNINSTALL):
-	$(call MESSAGE,"Uninstalling")
-	rm -f $(TARGET_DIR)/usr/sbin/usb_modeswitch
-	rm -f $(TARGET_DIR)/etc/usb_modeswitch.conf
-	rm -f $(USB_MODESWITCH_TARGET_INSTALL_TARGET) $(USB_MODESWITCH_HOOK_POST_INSTALL)
+$(eval $(call GENTARGETS,package,usb_modeswitch))
-- 
1.6.3.3
