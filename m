From: aldot at uclibc.org <aldot@uclibc.org>
Date: Sun, 21 Jan 2007 13:32:50 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot: package/ipsec-tools
	package/libevent pac etc...
Message-ID: <20070121213250.73BC64858A@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-01-21 13:32:49 -0800 (Sun, 21 Jan 2007)
New Revision: 17442

Log:
- remove some hardcoded occurances of "make" and use the proper variable instead


Modified:
   trunk/buildroot/package/ipsec-tools/ipsec-tools.mk
   trunk/buildroot/package/libevent/libevent.mk
   trunk/buildroot/package/libfloat/libfloat.mk
   trunk/buildroot/package/libusb/libusb.mk
   trunk/buildroot/package/microperl/microperl.mk
   trunk/buildroot/package/python/python.mk
   trunk/buildroot/package/usbutils/usbutils.mk
   trunk/buildroot/target/powerpc/yaboot/yaboot.mk
   trunk/buildroot/target/x86/syslinux/syslinux.mk


Changeset:
Modified: trunk/buildroot/package/ipsec-tools/ipsec-tools.mk
===================================================================
--- trunk/buildroot/package/ipsec-tools/ipsec-tools.mk	2007-01-21 21:11:56 UTC (rev 17441)
+++ trunk/buildroot/package/ipsec-tools/ipsec-tools.mk	2007-01-21 21:32:49 UTC (rev 17442)
@@ -137,8 +137,8 @@
 ipsec-tools-uninstall:
 
 ipsec-tools-clean:
-	make -C $(IPSEC_TOOLS_DIR) DESTDIR=$(TARGET_DIR) uninstall
-	make -C $(IPSEC_TOOLS_DIR) clean
+	$(MAKE) -C $(IPSEC_TOOLS_DIR) DESTDIR=$(TARGET_DIR) uninstall
+	$(MAKE) -C $(IPSEC_TOOLS_DIR) clean
 ifeq ($(strip $(BR2_PACKAGE_IPSEC_TOOLS_LIBS)), y)
 	-rm -f $(STAGING_DIR)/lib/libipsec.a
 	-rm -f $(STAGING_DIR)/lib/libipsec.la

Modified: trunk/buildroot/package/libevent/libevent.mk
===================================================================
--- trunk/buildroot/package/libevent/libevent.mk	2007-01-21 21:11:56 UTC (rev 17441)
+++ trunk/buildroot/package/libevent/libevent.mk	2007-01-21 21:32:49 UTC (rev 17442)
@@ -40,10 +40,10 @@
 	$(TARGET_CONFIGURE_OPTS) $(MAKE) CC=$(TARGET_CC) -C $(LIBEVENT_DIR)
 
 $(STAGING_DIR)/$(LIBEVENT_TARGET_BINARY): $(LIBEVENT_DIR)/$(LIBEVENT_BINARY)
-	make -C $(LIBEVENT_DIR) DESTDIR=$(STAGING_DIR) install
+	$(MAKE) -C $(LIBEVENT_DIR) DESTDIR=$(STAGING_DIR) install
 
 $(TARGET_DIR)/$(LIBEVENT_TARGET_BINARY): $(STAGING_DIR)/$(LIBEVENT_TARGET_BINARY)
-	make -C $(LIBEVENT_DIR) DESTDIR=$(TARGET_DIR) install
+	$(MAKE) -C $(LIBEVENT_DIR) DESTDIR=$(TARGET_DIR) install
 	rm -f $(TARGET_DIR)/usr/lib/libevent*.la $(TARGET_DIR)/usr/include/ev*
 	rm -f $(TARGET_DIR)/usr/man/man3/ev*.3
 	rmdir -p --ignore-fail-on-non-empty $(TARGET_DIR)/usr/man/man3

Modified: trunk/buildroot/package/libfloat/libfloat.mk
===================================================================
--- trunk/buildroot/package/libfloat/libfloat.mk	2007-01-21 21:11:56 UTC (rev 17441)
+++ trunk/buildroot/package/libfloat/libfloat.mk	2007-01-21 21:32:49 UTC (rev 17442)
@@ -29,7 +29,7 @@
 $(LIBFLOAT_DIR)/.unpacked: $(DL_DIR)/$(LIBFLOAT_SOURCE) $(DL_DIR)/$(LIBFLOAT_PATCH)
 	$(LIBFLOAT_CAT) $(DL_DIR)/$(LIBFLOAT_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 	# Remove the binary files distributed with the the package.
-	make -C $(LIBFLOAT_DIR) clean
+	$(MAKE) -C $(LIBFLOAT_DIR) clean
 	toolchain/patch-kernel.sh $(LIBFLOAT_DIR) $(DL_DIR) $(LIBFLOAT_PATCH)
 	toolchain/patch-kernel.sh $(LIBFLOAT_DIR) package/libfloat/ libfloat\*.patch
 	touch $(LIBFLOAT_DIR)/.unpacked
@@ -38,11 +38,11 @@
 	$(MAKE) CC=$(TARGET_CC) LD=$(TARGET_CROSS)ld -C $(LIBFLOAT_DIR)
 
 $(STAGING_DIR)/lib/libfloat.so: $(LIBFLOAT_DIR)/libfloat.so.1
-	cp -a $(LIBFLOAT_DIR)/libfloat.a $(STAGING_DIR)/lib/libfloat.a
-	cp -a $(LIBFLOAT_DIR)/libfloat.so.1 $(STAGING_DIR)/lib/libfloat.so.1
+	cp -dpf $(LIBFLOAT_DIR)/libfloat.a $(STAGING_DIR)/lib/libfloat.a
+	cp -dpf $(LIBFLOAT_DIR)/libfloat.so.1 $(STAGING_DIR)/lib/libfloat.so.1
 	(cd $(STAGING_DIR)/lib ; ln -snf libfloat.so.1 libfloat.so)
-	cp -a $(LIBFLOAT_DIR)/libfloat.a $(TARGET_DIR)/usr/lib/libfloat.a
-	cp -a $(LIBFLOAT_DIR)/libfloat.so.1 $(TARGET_DIR)/lib/libfloat.so.1
+	cp -dpf $(LIBFLOAT_DIR)/libfloat.a $(TARGET_DIR)/usr/lib/libfloat.a
+	cp -dpf $(LIBFLOAT_DIR)/libfloat.so.1 $(TARGET_DIR)/lib/libfloat.so.1
 	$(STRIP) $(TARGET_DIR)/lib/libfloat.so.1 > /dev/null 2>&1
 	(cd $(TARGET_DIR)/lib ; ln -snf libfloat.so.1 libfloat.so)
 	(cd $(TARGET_DIR)/usr/lib ; ln -snf /lib/libfloat.so libfloat.so)

Modified: trunk/buildroot/package/libusb/libusb.mk
===================================================================
--- trunk/buildroot/package/libusb/libusb.mk	2007-01-21 21:11:56 UTC (rev 17441)
+++ trunk/buildroot/package/libusb/libusb.mk	2007-01-21 21:32:49 UTC (rev 17442)
@@ -47,7 +47,7 @@
 	$(TARGET_CONFIGURE_OPTS) $(MAKE) CC=$(TARGET_CC) -C $(LIBUSB_DIR)
 
 $(TARGET_DIR)/$(LIBUSB_TARGET_BINARY): $(LIBUSB_DIR)/$(LIBUSB_BINARY)
-	make -C $(LIBUSB_DIR) DESTDIR=$(TARGET_DIR) install
+	$(MAKE) -C $(LIBUSB_DIR) DESTDIR=$(TARGET_DIR) install
 	rm -f $(TARGET_DIR)/usr/lib/libusb*.a $(TARGET_DIR)/usr/lib/libusb*.la
 
 libusb: uclibc $(TARGET_DIR)/$(LIBUSB_TARGET_BINARY)

Modified: trunk/buildroot/package/microperl/microperl.mk
===================================================================
--- trunk/buildroot/package/microperl/microperl.mk	2007-01-21 21:11:56 UTC (rev 17441)
+++ trunk/buildroot/package/microperl/microperl.mk	2007-01-21 21:32:49 UTC (rev 17442)
@@ -23,7 +23,7 @@
 
 $(MICROPERL_DIR)/.configured: $(MICROPERL_DIR)/.source
 	(cd $(MICROPERL_DIR) ; chmod u+w uconfig.h ; . ./uconfig.sh ; \
-	 make -f Makefile.micro regen_uconfig ; \
+	 $(MAKE) -f Makefile.micro regen_uconfig ; \
 	 $(SED) 's,PRIVLIB ".*,PRIVLIB "/$(MICROPERL_MODS_DIR)",' \
 		 -e 's,PRIVLIB_EXP ".*,PRIVLIB_EXP "$(MICROPERL_MODS_DIR)",' \
 		 -e 's,BIN ".*,BIN "/usr/bin",' \

Modified: trunk/buildroot/package/python/python.mk
===================================================================
--- trunk/buildroot/package/python/python.mk	2007-01-21 21:11:56 UTC (rev 17441)
+++ trunk/buildroot/package/python/python.mk	2007-01-21 21:32:49 UTC (rev 17442)
@@ -30,10 +30,10 @@
 		./configure \
 		--with-cxx=no \
 		$(DISABLE_NLS); \
-		make python Parser/pygen; \
+		$(MAKE) python Parser/pygen; \
 		mv python hostpython; \
 		mv Parser/pgen Parser/hostpgen; \
-		make distclean \
+		$(MAKE) distclean \
 	);
 	touch $(PYTHON_DIR)/.hostpython
 

Modified: trunk/buildroot/package/usbutils/usbutils.mk
===================================================================
--- trunk/buildroot/package/usbutils/usbutils.mk	2007-01-21 21:11:56 UTC (rev 17441)
+++ trunk/buildroot/package/usbutils/usbutils.mk	2007-01-21 21:32:49 UTC (rev 17442)
@@ -39,7 +39,7 @@
 	$(TARGET_CONFIGURE_OPTS) $(MAKE) CC=$(TARGET_CC) -C $(USBUTILS_DIR)
 
 $(TARGET_DIR)/$(USBUTILS_TARGET_BINARY): $(USBUTILS_DIR)/$(USBUTILS_BINARY)
-	make -C $(USBUTILS_DIR) DESTDIR=$(TARGET_DIR) install
+	$(MAKE) -C $(USBUTILS_DIR) DESTDIR=$(TARGET_DIR) install
 	rm -rf $(TARGET_DIR)/usr/man
 
 usbutils: uclibc libusb $(TARGET_DIR)/$(USBUTILS_TARGET_BINARY)

Modified: trunk/buildroot/target/powerpc/yaboot/yaboot.mk
===================================================================
--- trunk/buildroot/target/powerpc/yaboot/yaboot.mk	2007-01-21 21:11:56 UTC (rev 17441)
+++ trunk/buildroot/target/powerpc/yaboot/yaboot.mk	2007-01-21 21:32:49 UTC (rev 17442)
@@ -20,13 +20,13 @@
 	touch -c $(YABOOT_DIR)/Makefile
 
 $(YABOOT_DIR)/second/yaboot: $(YABOOT_DIR)/Makefile
-	make -C $(YABOOT_DIR) CROSS=$(TARGET_CROSS)
+	$(MAKE) -C $(YABOOT_DIR) CROSS=$(TARGET_CROSS)
 	touch -c $(YABOOT_DIR)/second/yaboot
 
 yaboot: $(YABOOT_DIR)/second/yaboot
 
 yaboot-clean:
-	make -C $(YABOOT_DIR) clean
+	$(MAKE) -C $(YABOOT_DIR) clean
 
 yaboot-dirclean:
 	rm -rf $(YABOOT_DIR)

Modified: trunk/buildroot/target/x86/syslinux/syslinux.mk
===================================================================
--- trunk/buildroot/target/x86/syslinux/syslinux.mk	2007-01-21 21:11:56 UTC (rev 17441)
+++ trunk/buildroot/target/x86/syslinux/syslinux.mk	2007-01-21 21:32:49 UTC (rev 17442)
@@ -46,7 +46,7 @@
 syslinux: $(SYSLINUX_DIR)/isolinux.bin
 
 syslinux-clean:
-	-make -C $(SYSLINUX_DIR) clean
+	-$(MAKE) -C $(SYSLINUX_DIR) clean
 
 syslinux-dirclean:
 	rm -rf $(SYSLINUX_DIR)
