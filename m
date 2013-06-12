From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 12 Jun 2013 22:41:34 +0200
Subject: [Buildroot] [git commit] usb_modeswitch_data: bump to version
	20130610
Message-ID: <20130612210545.A4C629AD50@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4eb64b232c6d211edf35fc7f8a2e8bb578bbb960
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove 'usb_modeswitch_data-fix-parallel-install.patch' because it was merged
upstream.

Remove dependency on Tcl because the dispatcher script has been moved to
usb_modeswitch package.

Signed-off-by: Patrick Ziegler <patrick.ziegler@fh-kl.de>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/usb_modeswitch_data/Config.in              |    3 ---
 .../usb_modeswitch_data-fix-parallel-install.patch |   17 -----------------
 .../usb_modeswitch_data-makefile.patch             |   17 +++++++++--------
 package/usb_modeswitch_data/usb_modeswitch_data.mk |    2 +-
 4 files changed, 10 insertions(+), 29 deletions(-)

diff --git a/package/usb_modeswitch_data/Config.in b/package/usb_modeswitch_data/Config.in
index 8698bb6..6df408f 100644
--- a/package/usb_modeswitch_data/Config.in
+++ b/package/usb_modeswitch_data/Config.in
@@ -1,9 +1,6 @@
 config BR2_PACKAGE_USB_MODESWITCH_DATA
 	bool "usb_modeswitch_data"
 	select BR2_PACKAGE_USB_MODESWITCH
-	# tcl is a runtime dependency
-	select BR2_PACKAGE_TCL
-	select BR2_PACKAGE_TCL_TCLSH
 	help
 	  USB mode switch data
 	  Contains udev rules and events to allow usb_modeswitch to
diff --git a/package/usb_modeswitch_data/usb_modeswitch_data-fix-parallel-install.patch b/package/usb_modeswitch_data/usb_modeswitch_data-fix-parallel-install.patch
deleted file mode 100644
index ba30499..0000000
--- a/package/usb_modeswitch_data/usb_modeswitch_data-fix-parallel-install.patch
+++ /dev/null
@@ -1,17 +0,0 @@
-Properly create the directory before creating it so that parallel
-install work fine.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-
-Index: b/Makefile
-===================================================================
---- a/Makefile
-+++ b/Makefile
-@@ -22,6 +22,7 @@
- 	install -D --mode=644 40-usb_modeswitch.rules $(RULESDIR)/40-usb_modeswitch.rules
- 
- db-install:
-+	install -d $(PREFIX)/share/usb_modeswitch
- 	install --mode=644 -t $(PREFIX)/share/usb_modeswitch ./usb_modeswitch.d/*
- 
- db-install-packed:
diff --git a/package/usb_modeswitch_data/usb_modeswitch_data-makefile.patch b/package/usb_modeswitch_data/usb_modeswitch_data-makefile.patch
index 769e514..28441fe 100644
--- a/package/usb_modeswitch_data/usb_modeswitch_data-makefile.patch
+++ b/package/usb_modeswitch_data/usb_modeswitch_data-makefile.patch
@@ -2,21 +2,22 @@ Fixed Makefile install sections to not reload udev rules. In a
 cross-compiler environment, it is not wanted to reload the host udev rules.
 
 Signed-off-by: J.C. Woltz <jwoltz@gmail.com>
---- usb_modeswitch_data-20120120.orig/Makefile	2012-01-20 17:25:32.000000000 -0500
-+++ usb_modeswitch_data-20120120/Makefile	2012-02-06 14:20:47.000000000 -0500
-@@ -12,9 +12,9 @@
- 
+Signed-off-by: Patrick Ziegler <patrick.ziegler@fh-kl.de>
+--- a/Makefile	2013-06-10 22:32:53.000000000 +0200
++++ b/Makefile	2013-06-11 10:38:03.181161401 +0200
+@@ -13,9 +13,9 @@
  clean:
+ 	$(RM) 40-usb_modeswitch.rules
  
--install: files-install db-install rules-reload
-+install: files-install db-install
+-install: all files-install db-install rules-reload
++install: all files-install db-install
  
 -install-packed: files-install db-install-packed rules-reload
 +install-packed: files-install db-install-packed
  
- files-install:
+ files-install: 
  	install -d $(PREFIX)/share/usb_modeswitch
-@@ -50,7 +50,7 @@
+@@ -54,7 +54,7 @@
  		fi \
  	fi
  
diff --git a/package/usb_modeswitch_data/usb_modeswitch_data.mk b/package/usb_modeswitch_data/usb_modeswitch_data.mk
index cb9754f..a9ce006 100644
--- a/package/usb_modeswitch_data/usb_modeswitch_data.mk
+++ b/package/usb_modeswitch_data/usb_modeswitch_data.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-USB_MODESWITCH_DATA_VERSION = 20121109
+USB_MODESWITCH_DATA_VERSION = 20130610
 USB_MODESWITCH_DATA_SOURCE = usb-modeswitch-data-$(USB_MODESWITCH_DATA_VERSION).tar.bz2
 USB_MODESWITCH_DATA_SITE = http://www.draisberghof.de/usb_modeswitch
 USB_MODESWITCH_DATA_DEPENDENCIES = usb_modeswitch
