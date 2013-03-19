From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 19 Mar 2013 13:07:39 +0100
Subject: [Buildroot] [git commit] Added package HPLIP for printing to HP
	printers
Message-ID: <20130319121031.EF25A9B19C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=aeb1bbabe38be3a7ed88879484ca2ce292953709
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

HPLIP (Hewlett-Packard Linux Imaging & Printing) is an HP-developed solution
for printing, scanning, and faxing with HP inkjet and laser based printers
in Linux.

[Peter: fix Config.in white space]
Signed-off-by: Olivier Schonken <olivier.schonken@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in                  |    1 +
 package/hplip/Config.in            |   17 ++++++++
 package/hplip/hplip-fix-make.patch |   74 ++++++++++++++++++++++++++++++++++++
 package/hplip/hplip.mk             |   53 +++++++++++++++++++++++++
 4 files changed, 145 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index fec5020..e12228f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -640,6 +640,7 @@ source "package/connman/Config.in"
 source "package/ctorrent/Config.in"
 source "package/conntrack-tools/Config.in"
 source "package/cups/Config.in"
+source "package/hplip/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/dhcp/Config.in"
 endif
diff --git a/package/hplip/Config.in b/package/hplip/Config.in
new file mode 100644
index 0000000..5bcd63b
--- /dev/null
+++ b/package/hplip/Config.in
@@ -0,0 +1,17 @@
+config BR2_PACKAGE_HPLIP
+	bool "hplip"
+	depends on BR2_PACKAGE_CUPS
+	select BR2_PACKAGE_LIBUSB
+	select BR2_PACKAGE_JPEG
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
+comment "hplip requires a toolchain with C++ support enabled"
+	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/hplip/hplip-fix-make.patch b/package/hplip/hplip-fix-make.patch
new file mode 100644
index 0000000..b26277d
--- /dev/null
+++ b/package/hplip/hplip-fix-make.patch
@@ -0,0 +1,74 @@
+From 6019d012246578ae1a191d3510284e7b894fb528 Mon Sep 17 00:00:00 2001
+From: Olivier Schonken <olivier.schonken@gmail.com>
+Date: Sat, 2 Mar 2013 18:01:03 +0200
+Subject: [PATCH] Changed Makefile.am to allow cross-compilation of HPLIP
+
+Signed-off-by: Olivier Schonken <olivier.schonken@gmail.com>
+---
+ Makefile.am |   28 ++++++++++++++--------------
+ 1 file changed, 14 insertions(+), 14 deletions(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 16ea902..b22f46a 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -72,7 +72,7 @@ libhpmud_la_SOURCES = io/hpmud/hpmud.c io/hpmud/mlc.c io/hpmud/model.c io/hpmud/
+ 	  io/hpmud/hpmud.h io/hpmud/hpmudi.h io/hpmud/list.h io/hpmud/mlc.h io/hpmud/pml.h io/hpmud/dot4.c \
+ 	  io/hpmud/dot4.h io/hpmud/jd.c io/hpmud/jd.h io/hpmud/pp.c io/hpmud/pp.h io/hpmud/musb.h io/hpmud/musb_libusb01.c
+ else
+-libhpmud_la_CFLAGS = -I/usr/include/libusb-1.0 -DMUDNAME=\"$(MUDNAME)\" -DCONFDIR=\"$(hplip_confdir)\"
++libhpmud_la_CFLAGS = -I$(includedir)/libusb-1.0 -DMUDNAME=\"$(MUDNAME)\" -DCONFDIR=\"$(hplip_confdir)\"
+ libhpmud_la_SOURCES = io/hpmud/hpmud.c io/hpmud/mlc.c io/hpmud/model.c io/hpmud/pml.c \
+ 	  io/hpmud/hpmud.h io/hpmud/hpmudi.h io/hpmud/list.h io/hpmud/mlc.h io/hpmud/pml.h io/hpmud/dot4.c \
+ 	  io/hpmud/dot4.h io/hpmud/jd.c io/hpmud/jd.h io/hpmud/pp.c io/hpmud/pp.h io/hpmud/musb.h io/hpmud/musb.c
+@@ -292,7 +292,7 @@ hpmudext_la_LIBADD = libhpmud.la
+ if LIBUSB01_BUILD
+ hpmudext_la_CFLAGS = -I$(PYTHONINCLUDEDIR)
+ else
+-hpmudext_la_CFLAGS =-I/usr/include/libusb-1.0 -I$(PYTHONINCLUDEDIR)
++hpmudext_la_CFLAGS =-I$(includedir)/libusb-1.0 -I$(PYTHONINCLUDEDIR)
+ endif
+ 
+ # ui (qt3)
+@@ -564,26 +564,26 @@ endif
+ 
+ install-dist_hplip_LogDATA:
+ if FULL_BUILD
+-	test -z "$(DESTDIR)$(hplip_Logdir)" || mkdir -p $(DESTDIR)$(hplip_Logdir)
+-	chgrp "lp" -R $(DESTDIR)$(hplip_Logdir)
+-	chmod 775 $(DESTDIR)$(hplip_Logdir)
++#	test -z "$(DESTDIR)$(hplip_Logdir)" || mkdir -p $(DESTDIR)$(hplip_Logdir)
++#	chgrp "lp" -R $(DESTDIR)$(hplip_Logdir)
++#	chmod 775 $(DESTDIR)$(hplip_Logdir)
+ endif	#FULL_BUILD
+ if HPLIP_BUILD
+-	test -z "$(DESTDIR)$(hplip_Logdir)" || mkdir -p $(DESTDIR)$(hplip_Logdir)
+-	chgrp "lp" -R $(DESTDIR)$(hplip_Logdir)
+-	chmod 775 $(DESTDIR)$(hplip_Logdir)
++#	test -z "$(DESTDIR)$(hplip_Logdir)" || mkdir -p $(DESTDIR)$(hplip_Logdir)
++#	chgrp "lp" -R $(DESTDIR)$(hplip_Logdir)
++#	chmod 775 $(DESTDIR)$(hplip_Logdir)
+ endif	#FULL_BUILD
+ 
+ install-dist_hplip_tmpDATA:
+ if FULL_BUILD
+-	test -z "$(DESTDIR)$(hplip_tmpdir)" || mkdir -p $(DESTDIR)$(hplip_tmpdir)
+-	chgrp "lp" -R $(DESTDIR)$(hplip_tmpdir)
+-	chmod 1775 $(DESTDIR)$(hplip_tmpdir)
++#	test -z "$(DESTDIR)$(hplip_tmpdir)" || mkdir -p $(DESTDIR)$(hplip_tmpdir)
++#	chgrp "lp" -R $(DESTDIR)$(hplip_tmpdir)
++#	chmod 1775 $(DESTDIR)$(hplip_tmpdir)
+ endif	#FULL_BUILD
+ if HPLIP_BUILD
+-	test -z "$(DESTDIR)$(hplip_tmpdir)" || mkdir -p $(DESTDIR)$(hplip_tmpdir)
+-	chgrp "lp" -R $(DESTDIR)$(hplip_tmpdir)
+-	chmod 1775 $(DESTDIR)$(hplip_tmpdir)
++#	test -z "$(DESTDIR)$(hplip_tmpdir)" || mkdir -p $(DESTDIR)$(hplip_tmpdir)
++#	chgrp "lp" -R $(DESTDIR)$(hplip_tmpdir)
++#	chmod 1775 $(DESTDIR)$(hplip_tmpdir)
+ endif	#FULL_BUILD
+ 
+ install-dist_cronDATA:$(dist_cron_DATA)
+-- 
+1.7.10.4
+
diff --git a/package/hplip/hplip.mk b/package/hplip/hplip.mk
new file mode 100644
index 0000000..6944f50
--- /dev/null
+++ b/package/hplip/hplip.mk
@@ -0,0 +1,53 @@
+#############################################################
+#
+# hplip
+#
+#############################################################
+
+HPLIP_VERSION = 3.13.3
+HPLIP_SITE = http://downloads.sourceforge.net/hplip/hplip
+HPLIP_AUTORECONF = YES
+HPLIP_DEPENDENCIES = cups libusb jpeg
+HPLIP_LICENSE = GPLv2 BSD-3c MIT
+HPLIP_LICENSE_FILES = COPYING
+
+HPLIP_CONF_OPT = \
+	--disable-qt4 \
+	--disable-scan-build \
+	--disable-gui-build \
+	--disable-doc-build \
+	--disable-network-build \
+	--enable-hpcups-install \
+	--disable-hpijs-install \
+	--enable-cups-ppd-install \
+	--enable-cups-drv-install \
+	--disable-foomatic-ppd-install \
+	--disable-foomatic-drv-install \
+	--disable-foomatic-rip-hplip-install \
+	--enable-new-hpcups \
+	--enable-lite-build \
+	--with-sysroot=$(STAGING_DIR) \
+	--includedir=$(STAGING_DIR)/usr/include
+
+ifeq ($(BR2_PACKAGE_DBUS),y)
+	HPLIP_CONF_OPT += --enable-dbus-build
+	HPLIP_DEPENDENCIES += dbus
+else
+	HPLIP_CONF_OPT += --disable-dbus-build
+endif
+
+define HPLIP_POST_INSTALL_TARGET_FIXUP
+	mkdir -p $(TARGET_DIR)/usr/share/hplip/data/models
+	cp $(@D)/data/models/* $(TARGET_DIR)/usr/share/hplip/data/models
+endef
+HPLIP_POST_INSTALL_TARGET_HOOKS += HPLIP_POST_INSTALL_TARGET_FIXUP
+
+define HPLIP_PRE_CONFIGURE_FIXUP
+	touch $(@D)/AUTHORS
+	touch $(@D)/ChangeLog
+	touch $(@D)/NEWS
+	touch $(@D)/README
+endef
+HPLIP_PRE_CONFIGURE_HOOKS += HPLIP_PRE_CONFIGURE_FIXUP
+
+$(eval $(autotools-package))
