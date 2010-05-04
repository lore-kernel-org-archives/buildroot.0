From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 4 May 2010 21:47:17 +0200
Subject: [Buildroot] [git commit master] usb_modeswitch: Bump to version
	1.1.2
Message-ID: <20100504194806.281588D3F4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=63b866640957c0e42467914effa7cdc2451e7900
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

And correct kconfig dependency.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                                            |    7 ++++-
 package/usb_modeswitch/Config.in                   |    1 +
 .../usb_modeswitch-1.0.7-build-system-fix.patch    |   29 --------------------
 .../usb_modeswitch/usb_modeswitch-makefile.patch   |   23 +++++++++++++++
 package/usb_modeswitch/usb_modeswitch.mk           |   17 +++++++-----
 5 files changed, 40 insertions(+), 37 deletions(-)
 delete mode 100644 package/usb_modeswitch/usb_modeswitch-1.0.7-build-system-fix.patch
 create mode 100644 package/usb_modeswitch/usb_modeswitch-makefile.patch

diff --git a/CHANGES b/CHANGES
index fa0317c..2d2b9e2 100644
--- a/CHANGES
+++ b/CHANGES
@@ -2,7 +2,12 @@
 
 	Fixes all over the tree.
 
-	Updated/fixed packages: mplayer, xdriver_xf86-video-openchrome
+	Updated/fixed packages: mplayer, xdriver_xf86-video-openchrome,
+	usb_modeswitch
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#985: Bump usb_modeswitch package to 1.1.0
 
 2010.05-rc1, Released May 3rd, 2010:
 
diff --git a/package/usb_modeswitch/Config.in b/package/usb_modeswitch/Config.in
index f9fa76e..ae10a55 100644
--- a/package/usb_modeswitch/Config.in
+++ b/package/usb_modeswitch/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_USB_MODESWITCH
 	bool "usb_modeswitch"
+	select BR2_PACKAGE_LIBUSB
 	select BR2_PACKAGE_LIBUSB_COMPAT
 	help
 	  USB mode switcher.
diff --git a/package/usb_modeswitch/usb_modeswitch-1.0.7-build-system-fix.patch b/package/usb_modeswitch/usb_modeswitch-1.0.7-build-system-fix.patch
deleted file mode 100644
index 71dbc7a..0000000
--- a/package/usb_modeswitch/usb_modeswitch-1.0.7-build-system-fix.patch
+++ /dev/null
@@ -1,29 +0,0 @@
----
- Makefile |    7 +++----
- 1 file changed, 3 insertions(+), 4 deletions(-)
-
-Index: usb_modeswitch-1.0.7/Makefile
-===================================================================
---- usb_modeswitch-1.0.7.orig/Makefile
-+++ usb_modeswitch-1.0.7/Makefile
-@@ -1,8 +1,8 @@
- PROG        = usb_modeswitch
- VERS        = 1.0.7
- STRIP	    = strip
--CC          = gcc
--CCFLAGS     = -l usb -Wall
-+CC          ?= gcc
-+CFLAGS      += -l usb -Wall
- RM          = /bin/rm -f
- OBJS        = usb_modeswitch.c
- PREFIX	    = $(DESTDIR)/usr
-@@ -12,8 +12,7 @@
- .PHONY:     clean
- all:        $(PROG)
- $(PROG):    $(OBJS)
--	      $(CC) $(CCFLAGS) -o $(PROG) $(OBJS)
--	      $(STRIP) $(PROG)
-+	      $(CC) $(CFLAGS) -o $(PROG) $(OBJS)
- 
- clean:
- 	      $(RM) ./usb_modeswitch
diff --git a/package/usb_modeswitch/usb_modeswitch-makefile.patch b/package/usb_modeswitch/usb_modeswitch-makefile.patch
new file mode 100644
index 0000000..918200b
--- /dev/null
+++ b/package/usb_modeswitch/usb_modeswitch-makefile.patch
@@ -0,0 +1,23 @@
+diff -Nura usb-modeswitch-1.1.2.orig/Makefile usb-modeswitch-1.1.2/Makefile
+--- usb-modeswitch-1.1.2.orig/Makefile	2010-04-17 15:27:11.000000000 -0300
++++ usb-modeswitch-1.1.2/Makefile	2010-04-22 15:05:32.363471807 -0300
+@@ -1,6 +1,6 @@
+ PROG        = usb_modeswitch
+ VERS        = 1.1.2
+-CC          = gcc
++CC          ?= gcc
+ CFLAGS      += -Wall -l usb
+ RM          = /bin/rm -f
+ OBJS        = usb_modeswitch.c
+@@ -23,8 +23,9 @@
+ install: all
+ 	install -d $(SBINDIR)
+ 	install --mode=755 usb_modeswitch $(SBINDIR)/usb_modeswitch
+-	install --mode=755 usb_modeswitch.tcl $(UDEVDIR)/usb_modeswitch
+-	install --mode=644 usb_modeswitch.conf $(ETCDIR)/usb_modeswitch.conf
++	#install --mode=755 usb_modeswitch.tcl $(UDEVDIR)/usb_modeswitch
++	#install --mode=644 usb_modeswitch.conf $(ETCDIR)/usb_modeswitch.conf
++	install -d $(MANDIR)
+ 	install --mode=644 usb_modeswitch.1 $(MANDIR)/usb_modeswitch.1
+ 
+ 
diff --git a/package/usb_modeswitch/usb_modeswitch.mk b/package/usb_modeswitch/usb_modeswitch.mk
index d84ccc2..620c5d0 100644
--- a/package/usb_modeswitch/usb_modeswitch.mk
+++ b/package/usb_modeswitch/usb_modeswitch.mk
@@ -4,23 +4,26 @@
 #
 #############################################################
 
-USB_MODESWITCH_VERSION = 1.0.7
-USB_MODESWITCH_SOURCE = usb_modeswitch-$(USB_MODESWITCH_VERSION).tar.bz2
+USB_MODESWITCH_VERSION = 1.1.2
+USB_MODESWITCH_SOURCE = usb-modeswitch-$(USB_MODESWITCH_VERSION).tar.bz2
 USB_MODESWITCH_SITE = http://www.draisberghof.de/usb_modeswitch
 USB_MODESWITCH_DEPENDENCIES = libusb-compat
 
 define USB_MODESWITCH_BUILD_CMDS
- rm $(@D)/usb_modeswitch
- $(TARGET_CONFIGURE_OPTS) $(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
+	$(TARGET_CONFIGURE_OPTS) $(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
 endef
 
 define USB_MODESWITCH_INSTALL_TARGET_CMDS
- $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
+	$(INSTALL) -D $(@D)/usb_modeswitch.setup -m 0644 \
+		$(TARGET_DIR)/etc/usb_modeswitch.setup
 endef
 
 define USB_MODESWITCH_CLEAN_CMDS
- rm -f $(TARGET_DIR)/usr/sbin/usb_modeswitch
- rm -f $(TARGET_DIR)/etc/usb_modeswitch.conf
+	rm -f $(TARGET_DIR)/usr/sbin/usb_modeswitch
+	rm -f $(TARGET_DIR)/etc/usb_modeswitch.setup
+	rm -f $(TARGET_DIR)/usr/share/man/man1/usb_modeswitch.1
 endef
 
 $(eval $(call GENTARGETS,package,usb_modeswitch))
+
-- 
1.6.3.3
