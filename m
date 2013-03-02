From: Olivier Schonken <olivier.schonken@gmail.com>
Date: Sat,  2 Mar 2013 19:02:49 +0200
Subject: [Buildroot] [PATCH 1/1] Added package HPLIP for printing to HP
	printers
Message-ID: <1362243769-8714-1-git-send-email-olivier.schonken@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

HPLIP (Hewlett-Packard Linux Imaging & Printing) is an HP-developed solution for printing, scanning, and faxing with HP inkjet and laser based printers in Linux.

Signed-off-by: Olivier Schonken <olivier.schonken@gmail.com>
---
 package/cups/Config.in             |    1 +
 package/hplip/Config.in            |   13 ++++++
 package/hplip/hplip-fix-make.patch |   80 ++++++++++++++++++++++++++++++++++++
 package/hplip/hplip.mk             |   52 +++++++++++++++++++++++
 4 files changed, 146 insertions(+)
 create mode 100644 package/hplip/Config.in
 create mode 100644 package/hplip/hplip-fix-make.patch
 create mode 100644 package/hplip/hplip.mk

diff --git a/package/cups/Config.in b/package/cups/Config.in
index dc1c2ed..7b703ff 100644
--- a/package/cups/Config.in
+++ b/package/cups/Config.in
@@ -18,4 +18,5 @@ config BR2_PACKAGE_CUPS_PDFTOPS
 comment "pdftops support requires a toolchain with C++ support enabled"
 	depends on !BR2_INSTALL_LIBSTDCPP
 
+source "package/hplip/Config.in"
 endif
diff --git a/package/hplip/Config.in b/package/hplip/Config.in
new file mode 100644
index 0000000..b0d802a
--- /dev/null
+++ b/package/hplip/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_HPLIP
+	bool "hplip"
+	select BR2_PACKAGE_LIBUSB
+	help
+	  HP Linux Imaging and Printing (HPLIP)
+	  HPLIP is an HP-developed solution for printing, scanning, and faxing
+	  with HP inkjet and laser based printers in Linux. The HPLIP project 
+	  provides printing support for 2,211 printer models, including 
+	  Deskjet, Officejet, Photosmart, PSC (Print Scan Copy), Business 
+	  Inkjet, LaserJet, Edgeline MFP, and LaserJet MFP. 
+	  
+	  http://hplipopensource.com/
+
diff --git a/package/hplip/hplip-fix-make.patch b/package/hplip/hplip-fix-make.patch
new file mode 100644
index 0000000..339e58e
--- /dev/null
+++ b/package/hplip/hplip-fix-make.patch
@@ -0,0 +1,80 @@
+From 1e03ca316a3784290b489470b16c34b7f44a0c75 Mon Sep 17 00:00:00 2001
+From: Olivier Schonken <olivier.schonken@gmail.com>
+Date: Sat, 2 Mar 2013 18:01:03 +0200
+Subject: [PATCH] Changed Makefile.am and Makefile.in to allow
+ cross-compilation of HPLIP
+
+Signed-off-by: Olivier Schonken <olivier.schonken@gmail.com>
+---
+ Makefile.am |    4 ++--
+ Makefile.in |   16 ++--------------
+ 2 files changed, 4 insertions(+), 16 deletions(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 16ea902..00ec8da 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -72,7 +72,7 @@ libhpmud_la_SOURCES = io/hpmud/hpmud.c io/hpmud/mlc.c io/hpmud/model.c io/hpmud/
+ 	  io/hpmud/hpmud.h io/hpmud/hpmudi.h io/hpmud/list.h io/hpmud/mlc.h io/hpmud/pml.h io/hpmud/dot4.c \
+ 	  io/hpmud/dot4.h io/hpmud/jd.c io/hpmud/jd.h io/hpmud/pp.c io/hpmud/pp.h io/hpmud/musb.h io/hpmud/musb_libusb01.c
+ else
+-libhpmud_la_CFLAGS = -I/usr/include/libusb-1.0 -DMUDNAME=\"$(MUDNAME)\" -DCONFDIR=\"$(hplip_confdir)\"
++libhpmud_la_CFLAGS = -I$(includedir)/usr/include/libusb-1.0 -DMUDNAME=\"$(MUDNAME)\" -DCONFDIR=\"$(hplip_confdir)\"
+ libhpmud_la_SOURCES = io/hpmud/hpmud.c io/hpmud/mlc.c io/hpmud/model.c io/hpmud/pml.c \
+ 	  io/hpmud/hpmud.h io/hpmud/hpmudi.h io/hpmud/list.h io/hpmud/mlc.h io/hpmud/pml.h io/hpmud/dot4.c \
+ 	  io/hpmud/dot4.h io/hpmud/jd.c io/hpmud/jd.h io/hpmud/pp.c io/hpmud/pp.h io/hpmud/musb.h io/hpmud/musb.c
+@@ -292,7 +292,7 @@ hpmudext_la_LIBADD = libhpmud.la
+ if LIBUSB01_BUILD
+ hpmudext_la_CFLAGS = -I$(PYTHONINCLUDEDIR)
+ else
+-hpmudext_la_CFLAGS =-I/usr/include/libusb-1.0 -I$(PYTHONINCLUDEDIR)
++hpmudext_la_CFLAGS =-I$(includedir)/usr/include/libusb-1.0 -I$(PYTHONINCLUDEDIR)
+ endif
+ 
+ # ui (qt3)
+diff --git a/Makefile.in b/Makefile.in
+index e8e6142..5d9c331 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -4314,7 +4314,7 @@ cups_drv = prnt/drv/hpcups.drv
+ 
+ # hpmud library
+ @HPLIP_BUILD_TRUE at MUDNAME = hpmud
+- at HPLIP_BUILD_TRUE@@LIBUSB01_BUILD_FALSE at libhpmud_la_CFLAGS = -I/usr/include/libusb-1.0 -DMUDNAME=\"$(MUDNAME)\" -DCONFDIR=\"$(hplip_confdir)\"
++ at HPLIP_BUILD_TRUE@@LIBUSB01_BUILD_FALSE at libhpmud_la_CFLAGS = -I$(includedir)/usr/include/libusb-1.0 -DMUDNAME=\"$(MUDNAME)\" -DCONFDIR=\"$(hplip_confdir)\"
+ @HPLIP_BUILD_TRUE@@LIBUSB01_BUILD_TRUE at libhpmud_la_CFLAGS = -DMUDNAME=\"$(MUDNAME)\" -DCONFDIR=\"$(hplip_confdir)\"
+ @HPLIP_BUILD_TRUE@@LIBUSB01_BUILD_FALSE at libhpmud_la_SOURCES = io/hpmud/hpmud.c io/hpmud/mlc.c io/hpmud/model.c io/hpmud/pml.c \
+ @HPLIP_BUILD_TRUE@@LIBUSB01_BUILD_FALSE@	  io/hpmud/hpmud.h io/hpmud/hpmudi.h io/hpmud/list.h io/hpmud/mlc.h io/hpmud/pml.h io/hpmud/dot4.c \
+@@ -4504,7 +4504,7 @@ cups_drv = prnt/drv/hpcups.drv
+ @FULL_BUILD_TRUE@@HPLIP_BUILD_TRUE at hpmudext_la_LDFLAGS = -module -avoid-version
+ @FULL_BUILD_TRUE@@HPLIP_BUILD_TRUE at hpmudext_la_SOURCES = io/mudext/hpmudext.c
+ @FULL_BUILD_TRUE@@HPLIP_BUILD_TRUE at hpmudext_la_LIBADD = libhpmud.la
+- at FULL_BUILD_TRUE@@HPLIP_BUILD_TRUE@@LIBUSB01_BUILD_FALSE at hpmudext_la_CFLAGS = -I/usr/include/libusb-1.0 -I$(PYTHONINCLUDEDIR)
++ at FULL_BUILD_TRUE@@HPLIP_BUILD_TRUE@@LIBUSB01_BUILD_FALSE at hpmudext_la_CFLAGS = -I$(includedir)/usr/include/libusb-1.0 -I$(PYTHONINCLUDEDIR)
+ @FULL_BUILD_TRUE@@HPLIP_BUILD_TRUE@@LIBUSB01_BUILD_TRUE at hpmudext_la_CFLAGS = -I$(PYTHONINCLUDEDIR)
+ 
+ # ui (qt3)
+@@ -8865,20 +8865,8 @@ uninstall-am: uninstall-binPROGRAMS uninstall-cupsdrv2DATA \
+ 
+ 
+ install-dist_hplip_LogDATA:
+- at FULL_BUILD_TRUE@	test -z "$(DESTDIR)$(hplip_Logdir)" || mkdir -p $(DESTDIR)$(hplip_Logdir)
+- at FULL_BUILD_TRUE@	chgrp "lp" -R $(DESTDIR)$(hplip_Logdir)
+- at FULL_BUILD_TRUE@	chmod 777 $(DESTDIR)$(hplip_Logdir)
+- at HPLIP_BUILD_TRUE@	test -z "$(DESTDIR)$(hplip_Logdir)" || mkdir -p $(DESTDIR)$(hplip_Logdir)
+- at HPLIP_BUILD_TRUE@	chgrp "lp" -R $(DESTDIR)$(hplip_Logdir)
+- at HPLIP_BUILD_TRUE@	chmod 777 $(DESTDIR)$(hplip_Logdir)
+ 
+ install-dist_hplip_tmpDATA:
+- at FULL_BUILD_TRUE@	test -z "$(DESTDIR)$(hplip_tmpdir)" || mkdir -p $(DESTDIR)$(hplip_tmpdir)
+- at FULL_BUILD_TRUE@	chgrp "lp" -R $(DESTDIR)$(hplip_tmpdir)
+- at FULL_BUILD_TRUE@	chmod 1777 $(DESTDIR)$(hplip_tmpdir)
+- at HPLIP_BUILD_TRUE@	test -z "$(DESTDIR)$(hplip_tmpdir)" || mkdir -p $(DESTDIR)$(hplip_tmpdir)
+- at HPLIP_BUILD_TRUE@	chgrp "lp" -R $(DESTDIR)$(hplip_tmpdir)
+- at HPLIP_BUILD_TRUE@	chmod 1777 $(DESTDIR)$(hplip_tmpdir)
+ 
+ install-dist_cronDATA:$(dist_cron_DATA)
+ 	test -z "$(DESTDIR)$(crondir)" || $(MKDIR_P) "$(DESTDIR)$(crondir)"; \
+-- 
+1.7.10.4
+
diff --git a/package/hplip/hplip.mk b/package/hplip/hplip.mk
new file mode 100644
index 0000000..03fb514
--- /dev/null
+++ b/package/hplip/hplip.mk
@@ -0,0 +1,52 @@
+#############################################################
+#
+# hplip
+#
+#############################################################
+HPLIP_VERSION = 3.12.11
+HPLIP_SITE = http://prdownloads.sourceforge.net/hplip/hplip/
+HPLIP_SOURCE = hplip-$(HPLIP_VERSION).tar.gz
+HPLIP_INSTALL_STAGING = NO
+HPLIP_LIBTOOL_PATCH = YES 
+HPLIP_AUTORECONF = NO
+
+#HPLIP_CONF_ENV += \
+#	ac_cv_prog_ac_ct_STRIP=arm-none-linux-gnueabi-strip
+
+HPLIP_CONF_OPT =           --disable-qt4 \
+                           --disable-scan-build \
+                           --disable-gui-build \
+                           --disable-doc-build \
+                           --disable-network-build \
+                           --enable-hpcups-install \
+                           --disable-hpijs-install \
+                           --enable-cups-ppd-install \
+                           --enable-cups-drv-install \
+                           --disable-foomatic-ppd-install \
+                           --disable-foomatic-drv-install \
+                           --disable-foomatic-rip-hplip-install \
+                           --enable-new-hpcups \
+                           --enable-lite-build \
+                           --with-sysroot=$(STAGING_DIR) \
+			   --includedir=$(STAGING_DIR)
+
+ifeq ($(BR2_PACKAGE_DBUS),y)
+             HPLIP_CONF_OPT += --enable-dbus-build 
+endif
+   
+ifeq ($(BR2_PREFER_STATIC_LIB),y)
+             HPLIP_CONF_OPT += --disable-shared 
+else
+             HPLIP_CONF_OPT += --enable-shared 
+endif
+
+HPLIP_DEPENDENCIES = cups libusb
+
+
+define HPLIP_POST_INSTALL_TARGET_FIXUP
+	mkdir -p $(TARGET_DIR)/usr/share/hplip/data/models
+        cp $(@D)/data/models/* $(TARGET_DIR)/usr/share/hplip/data/models
+endef
+HPLIP_POST_INSTALL_TARGET_HOOKS += HPLIP_POST_INSTALL_TARGET_FIXUP
+
+$(eval $(autotools-package))
-- 
1.7.10.4
