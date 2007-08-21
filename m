From: aldot at uclibc.org <aldot@uclibc.org>
Date: Tue, 21 Aug 2007 04:25:31 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot: package/hostap
	package/liblockfile pack etc...
Message-ID: <20070821112531.0775FA5D20@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-08-21 04:25:30 -0700 (Tue, 21 Aug 2007)
New Revision: 19612

Log:
- sed -i -e "/\-[[:space:]]*mkdir[[:space:]][[:space:]]*-p/s/-[[:space:]]*mkdir/mkdir/g"
  (want to know about errors if mkdir failed). Thanks to Cristian Ionescu-Idbohrn for pointing this out


Modified:
   trunk/buildroot/Makefile
   trunk/buildroot/package/hostap/hostap.mk
   trunk/buildroot/package/liblockfile/liblockfile.mk
   trunk/buildroot/package/libusb/libusb.mk
   trunk/buildroot/package/ltp-testsuite/ltp-testsuite.mk
   trunk/buildroot/package/ncurses/ncurses.mk
   trunk/buildroot/package/udev/udev.mk
   trunk/buildroot/package/xorg/xorg.mk
   trunk/buildroot/target/device/Sharp/LNode80/linux.mk
   trunk/buildroot/target/device/Soekris/net4521/linux.mk
   trunk/buildroot/target/device/Via/epia-mii/linux.mk
   trunk/buildroot/target/device/jp/q5/linux.mk
   trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk
   trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk
   trunk/buildroot/toolchain/sstrip/sstrip.mk


Changeset:
Modified: trunk/buildroot/Makefile
===================================================================
--- trunk/buildroot/Makefile	2007-08-21 11:18:25 UTC (rev 19611)
+++ trunk/buildroot/Makefile	2007-08-21 11:25:30 UTC (rev 19612)
@@ -321,7 +321,7 @@
 	fi
 
 menuconfig: $(CONFIG)/mconf
-	@-mkdir -p $(CONFIG)/buildroot-config
+	@mkdir -p $(CONFIG)/buildroot-config
 	@if ! KCONFIG_AUTOCONFIG=$(CONFIG)/buildroot-config/auto.conf \
 		KCONFIG_AUTOHEADER=$(CONFIG)/buildroot-config/autoconf.h \
 		$(CONFIG)/mconf $(CONFIG_CONFIG_IN); then \
@@ -329,39 +329,39 @@
 	fi
 
 config: $(CONFIG)/conf
-	@-mkdir -p $(CONFIG)/buildroot-config
+	@mkdir -p $(CONFIG)/buildroot-config
 	@KCONFIG_AUTOCONFIG=$(CONFIG)/buildroot-config/auto.conf \
 		KCONFIG_AUTOHEADER=$(CONFIG)/buildroot-config/autoconf.h \
 		$(CONFIG)/conf $(CONFIG_CONFIG_IN)
 
 oldconfig: $(CONFIG)/conf
-	@-mkdir -p $(CONFIG)/buildroot-config
+	@mkdir -p $(CONFIG)/buildroot-config
 	@KCONFIG_AUTOCONFIG=$(CONFIG)/buildroot-config/auto.conf \
 		KCONFIG_AUTOHEADER=$(CONFIG)/buildroot-config/autoconf.h \
 		$(CONFIG)/conf -o $(CONFIG_CONFIG_IN)
 
 randconfig: $(CONFIG)/conf
-	@-mkdir -p $(CONFIG)/buildroot-config
+	@mkdir -p $(CONFIG)/buildroot-config
 	@KCONFIG_AUTOCONFIG=$(CONFIG)/buildroot-config/auto.conf \
 		KCONFIG_AUTOHEADER=$(CONFIG)/buildroot-config/autoconf.h \
 		$(CONFIG)/conf -r $(CONFIG_CONFIG_IN)
 
 allyesconfig: $(CONFIG)/conf
 	cat $(CONFIG_DEFCONFIG) > .config
-	@-mkdir -p $(CONFIG)/buildroot-config
+	@mkdir -p $(CONFIG)/buildroot-config
 	@KCONFIG_AUTOCONFIG=$(CONFIG)/buildroot-config/auto.conf \
 		KCONFIG_AUTOHEADER=$(CONFIG)/buildroot-config/autoconf.h \
 		$(CONFIG)/conf -y $(CONFIG_CONFIG_IN)
 	#sed -i -e "s/^CONFIG_DEBUG.*/# CONFIG_DEBUG is not set/" .config
 
 allnoconfig: $(CONFIG)/conf
-	@-mkdir -p $(CONFIG)/buildroot-config
+	@mkdir -p $(CONFIG)/buildroot-config
 	@KCONFIG_AUTOCONFIG=$(CONFIG)/buildroot-config/auto.conf \
 		KCONFIG_AUTOHEADER=$(CONFIG)/buildroot-config/autoconf.h \
 		$(CONFIG)/conf -n $(CONFIG_CONFIG_IN)
 
 defconfig: $(CONFIG)/conf
-	@-mkdir -p $(CONFIG)/buildroot-config
+	@mkdir -p $(CONFIG)/buildroot-config
 	@KCONFIG_AUTOCONFIG=$(CONFIG)/buildroot-config/auto.conf \
 		KCONFIG_AUTOHEADER=$(CONFIG)/buildroot-config/autoconf.h \
 		$(CONFIG)/conf -d $(CONFIG_CONFIG_IN)

Modified: trunk/buildroot/package/hostap/hostap.mk
===================================================================
--- trunk/buildroot/package/hostap/hostap.mk	2007-08-21 11:18:25 UTC (rev 19611)
+++ trunk/buildroot/package/hostap/hostap.mk	2007-08-21 11:25:30 UTC (rev 19612)
@@ -31,9 +31,9 @@
 $(TARGET_DIR)//usr/bin/hostap_crypt_conf: $(HOSTAP_DIR)/utils/hostap_crypt_conf
 	# Make the dir
 	-rm -rf $(HOSTAP_TARGET_MODULE_DIR)
-	-mkdir -p $(HOSTAP_TARGET_MODULE_DIR)
+	mkdir -p $(HOSTAP_TARGET_MODULE_DIR)
 	# Copy the pcmcia-cs conf file
-	-mkdir -p $(TARGET_DIR)/etc/pcmcia
+	mkdir -p $(TARGET_DIR)/etc/pcmcia
 	cp -af $(HOSTAP_DIR)/driver/etc/hostap_cs.conf $(TARGET_DIR)/etc/pcmcia/
 	# Copy The Utils
 	cp -af $(HOSTAP_DIR)/utils/hostap_crypt_conf $(TARGET_DIR)/usr/bin/

Modified: trunk/buildroot/package/liblockfile/liblockfile.mk
===================================================================
--- trunk/buildroot/package/liblockfile/liblockfile.mk	2007-08-21 11:18:25 UTC (rev 19611)
+++ trunk/buildroot/package/liblockfile/liblockfile.mk	2007-08-21 11:25:30 UTC (rev 19612)
@@ -39,7 +39,7 @@
 	cp -dpf $(LIBLOCKFILE_DIR)/liblockfile.a $(STAGING_DIR)/lib
 
 $(TARGET_DIR)/usr/lib/$(LIBLOCKFILE_BINARY): $(STAGING_DIR)/lib/$(LIBLOCKFILE_BINARY)
-	-mkdir -p $(TARGET_DIR)/usr/lib
+	mkdir -p $(TARGET_DIR)/usr/lib
 	cp -a $(STAGING_DIR)/lib/liblockfile.so* $(TARGET_DIR)/usr/lib
 	$(STRIP) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/$(LIBLOCKFILE_BINARY)
 

Modified: trunk/buildroot/package/libusb/libusb.mk
===================================================================
--- trunk/buildroot/package/libusb/libusb.mk	2007-08-21 11:18:25 UTC (rev 19611)
+++ trunk/buildroot/package/libusb/libusb.mk	2007-08-21 11:25:30 UTC (rev 19612)
@@ -40,7 +40,7 @@
 	$(MAKE) -C $(LIBUSB_DIR) DESTDIR=$(STAGING_DIR) install
 
 $(TARGET_DIR)/$(LIBUSB_BINARY): $(STAGING_DIR)/lib/libusb.so
-	-mkdir -p $(TARGET_DIR)/usr/lib
+	mkdir -p $(TARGET_DIR)/usr/lib
 	cp -a $(STAGING_DIR)/lib/libusb* $(TARGET_DIR)/usr/lib
 	rm -f $(TARGET_DIR)/usr/lib/*.a $(TARGET_DIR)/usr/lib/*.la
 

Modified: trunk/buildroot/package/ltp-testsuite/ltp-testsuite.mk
===================================================================
--- trunk/buildroot/package/ltp-testsuite/ltp-testsuite.mk	2007-08-21 11:18:25 UTC (rev 19611)
+++ trunk/buildroot/package/ltp-testsuite/ltp-testsuite.mk	2007-08-21 11:25:30 UTC (rev 19612)
@@ -33,7 +33,7 @@
 ltp-testsuite-source: $(DL_DIR)/$(LTP_TESTSUITE_SOURCE)
 
 $(LTP_TESTSUITE_DIR)/Makefile: $(DL_DIR)/$(LTP_TESTSUITE_SOURCE)
-	-mkdir -p $(LTP_TESTSUITE_ROOT)
+	mkdir -p $(LTP_TESTSUITE_ROOT)
 	$(LTP_TESTSUITE_CAT) $(DL_DIR)/$(LTP_TESTSUITE_SOURCE) | tar -C $(LTP_TESTSUITE_ROOT) $(TAR_OPTIONS) -
 	toolchain/patch-kernel.sh $(LTP_TESTSUITE_DIR) package/ltp-testsuite/ $(LTP_PATCHES)
 	touch -c $@

Modified: trunk/buildroot/package/ncurses/ncurses.mk
===================================================================
--- trunk/buildroot/package/ncurses/ncurses.mk	2007-08-21 11:18:25 UTC (rev 19611)
+++ trunk/buildroot/package/ncurses/ncurses.mk	2007-08-21 11:25:30 UTC (rev 19612)
@@ -122,7 +122,7 @@
 	touch -c $@
 
 $(TARGET_DIR)/usr/lib/libncurses.a: $(STAGING_DIR)/lib/libncurses.a
-	-mkdir -p $(TARGET_DIR)/usr/include
+	mkdir -p $(TARGET_DIR)/usr/include
 	cp -dpf $(NCURSES_DIR)/include/curses.h $(TARGET_DIR)/usr/include/ncurses.h
 	cp -dpf $(NCURSES_DIR)/include/ncurses_dll.h $(TARGET_DIR)/usr/include/ncurses_dll.h
 	cp -dpf $(NCURSES_DIR)/include/term.h $(TARGET_DIR)/usr/include/

Modified: trunk/buildroot/package/udev/udev.mk
===================================================================
--- trunk/buildroot/package/udev/udev.mk	2007-08-21 11:18:25 UTC (rev 19611)
+++ trunk/buildroot/package/udev/udev.mk	2007-08-21 11:25:30 UTC (rev 19612)
@@ -40,7 +40,7 @@
 	touch -c $@
 
 $(TARGET_DIR)/$(UDEV_TARGET_BINARY): $(UDEV_DIR)/$(UDEV_BINARY)
-	-mkdir -p $(TARGET_DIR)/sys
+	mkdir -p $(TARGET_DIR)/sys
 	$(MAKE) $(TARGET_CONFIGURE_OPTS) \
 		DESTDIR=$(TARGET_DIR) \
 		CFLAGS="$(BR2_UDEV_CFLAGS)" \

Modified: trunk/buildroot/package/xorg/xorg.mk
===================================================================
--- trunk/buildroot/package/xorg/xorg.mk	2007-08-21 11:18:25 UTC (rev 19611)
+++ trunk/buildroot/package/xorg/xorg.mk	2007-08-21 11:25:30 UTC (rev 19612)
@@ -108,7 +108,7 @@
 	touch -c $(XORG_XSERVER)
 
 $(STAGING_DIR)$(TARGET_LIBX)/libX11.so.6.2: $(XORG_XSERVER)
-	-mkdir -p $(STAGING_DIR)/usr/X11R6
+	mkdir -p $(STAGING_DIR)/usr/X11R6
 	ln -fs ../../include $(STAGING_DIR)/usr/X11R6/include
 	ln -fs ../../lib $(STAGING_DIR)$(TARGET_LIBX)
 	( cd $(XORG_DIR); $(MAKE) \
@@ -121,7 +121,7 @@
 	touch -c $(STAGING_DIR)$(TARGET_LIBX)/libX11.so.6.2
 
 $(TARGET_XSERVER): $(XORG_XSERVER)
-	-mkdir -p $(XORG_BINX)
+	mkdir -p $(XORG_BINX)
 	for file in $(XORG_APPS) ; do \
 		cp -f $(XORG_DIR)/programs/$$file $(XORG_BINX) ; \
 		chmod a+x $(XORG_PROGS)/$$file ; \
@@ -187,7 +187,7 @@
 	touch -c $(XORG_LIBX)/X11/fonts/ttf-dejavu/DejaVuSansMono.ttf
 
 $(XORG_LIBX)/libX11.so.6.2: $(TARGET_XSERVER) $(XORG_LIBX)/X11/fonts/ttf-dejavu/DejaVuSansMono.ttf
-	-mkdir -p $(XORG_LIBX)
+	mkdir -p $(XORG_LIBX)
 	set -e; for dirs in $(XORG_LIBS) ; do \
 		file=`find $(XORG_LDIR)/$$dirs -type f -iname "*$$dirs.so*"` ; \
 		$(STRIP) $(STRIP_STRIP_UNNEEDED) $$file ; \

Modified: trunk/buildroot/target/device/Sharp/LNode80/linux.mk
===================================================================
--- trunk/buildroot/target/device/Sharp/LNode80/linux.mk	2007-08-21 11:18:25 UTC (rev 19611)
+++ trunk/buildroot/target/device/Sharp/LNode80/linux.mk	2007-08-21 11:25:30 UTC (rev 19612)
@@ -56,11 +56,11 @@
 
 
 $(DL_DIR)/$(LINUX_SOURCE):
-	-mkdir -p $(DL_DIR)
+	mkdir -p $(DL_DIR)
 	$(WGET) -P $(DL_DIR) $(LINUX_SITE)/$(LINUX_SOURCE)
 
 $(LINUX_DIR)/.unpacked: $(DL_DIR)/$(LINUX_SOURCE)
-	-mkdir -p $(TOOL_BUILD_DIR)
+	mkdir -p $(TOOL_BUILD_DIR)
 	-(cd $(TOOL_BUILD_DIR); ln -snf $(LINUX_DIR) linux)
 	$(LINUX_CAT) $(DL_DIR)/$(LINUX_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 ifneq ($(DOWNLOAD_LINUX_VERSION),$(LINUX_VERSION))

Modified: trunk/buildroot/target/device/Soekris/net4521/linux.mk
===================================================================
--- trunk/buildroot/target/device/Soekris/net4521/linux.mk	2007-08-21 11:18:25 UTC (rev 19611)
+++ trunk/buildroot/target/device/Soekris/net4521/linux.mk	2007-08-21 11:25:30 UTC (rev 19612)
@@ -57,11 +57,11 @@
 
 
 $(DL_DIR)/$(LINUX_SOURCE):
-	-mkdir -p $(DL_DIR)
+	mkdir -p $(DL_DIR)
 	$(WGET) -P $(DL_DIR) $(LINUX_SITE)/$(LINUX_SOURCE)
 
 $(LINUX_DIR)/.unpacked: $(DL_DIR)/$(LINUX_SOURCE)
-	-mkdir -p $(TOOL_BUILD_DIR)
+	mkdir -p $(TOOL_BUILD_DIR)
 	-(cd $(TOOL_BUILD_DIR); ln -snf $(LINUX_DIR) linux)
 	$(LINUX_CAT) $(DL_DIR)/$(LINUX_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 ifneq ($(DOWNLOAD_LINUX_VERSION),$(LINUX_VERSION))

Modified: trunk/buildroot/target/device/Via/epia-mii/linux.mk
===================================================================
--- trunk/buildroot/target/device/Via/epia-mii/linux.mk	2007-08-21 11:18:25 UTC (rev 19611)
+++ trunk/buildroot/target/device/Via/epia-mii/linux.mk	2007-08-21 11:25:30 UTC (rev 19612)
@@ -45,11 +45,11 @@
 LINUX_SOURCE_DIR=$(LINUX_DIR)
 
 $(DL_DIR)/$(LINUX_SOURCE):
-	-mkdir -p $(DL_DIR)
+	mkdir -p $(DL_DIR)
 	$(WGET) -P $(DL_DIR) $(LINUX_SITE)/$(LINUX_SOURCE)
 
 $(LINUX_DIR)/.unpacked: $(DL_DIR)/$(LINUX_SOURCE)
-	-mkdir -p $(TOOL_BUILD_DIR)
+	mkdir -p $(TOOL_BUILD_DIR)
 	-(cd $(TOOL_BUILD_DIR); ln -sf $(LINUX_DIR) linux)
 	$(LINUX_CAT) $(DL_DIR)/$(LINUX_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 ifneq ($(DOWNLOAD_LINUX_VERSION),$(LINUX_VERSION))

Modified: trunk/buildroot/target/device/jp/q5/linux.mk
===================================================================
--- trunk/buildroot/target/device/jp/q5/linux.mk	2007-08-21 11:18:25 UTC (rev 19611)
+++ trunk/buildroot/target/device/jp/q5/linux.mk	2007-08-21 11:25:30 UTC (rev 19612)
@@ -55,11 +55,11 @@
 LINUX_SOURCE_DIR=$(LINUX_DIR)
 
 $(DL_DIR)/$(LINUX_SOURCE):
-	-mkdir -p $(DL_DIR)
+	mkdir -p $(DL_DIR)
 	$(WGET) -P $(DL_DIR) $(LINUX_SITE)/$(LINUX_SOURCE)
 
 $(LINUX_DIR)/.unpacked: $(DL_DIR)/$(LINUX_SOURCE)
-	-mkdir -p $(TOOL_BUILD_DIR)
+	mkdir -p $(TOOL_BUILD_DIR)
 	-(cd $(TOOL_BUILD_DIR); ln -snf $(LINUX_DIR) linux)
 	$(LINUX_CAT) $(DL_DIR)/$(LINUX_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 ifneq ($(DOWNLOAD_LINUX_VERSION),$(LINUX_VERSION))

Modified: trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk
===================================================================
--- trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk	2007-08-21 11:18:25 UTC (rev 19611)
+++ trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk	2007-08-21 11:25:30 UTC (rev 19612)
@@ -167,7 +167,7 @@
 # the step or libgcc will not build...
 
 $(GCC_BUILD_DIR1)/.configured: $(GCC_DIR)/.patched
-	-mkdir -p $(GCC_BUILD_DIR1)
+	mkdir -p $(GCC_BUILD_DIR1)
 	(cd $(GCC_BUILD_DIR1); PATH=$(TARGET_PATH) \
 		CC="$(HOSTCC)" \
 		$(GCC_DIR)/configure \
@@ -223,7 +223,7 @@
 comma:=,
 GCC_BUILD_DIR2:=$(TOOL_BUILD_DIR)/gcc-$(GCC_VERSION)-final
 $(GCC_BUILD_DIR2)/.configured: $(GCC_DIR)/.patched $(GCC_STAGING_PREREQ)
-	-mkdir -p $(GCC_BUILD_DIR2)
+	mkdir -p $(GCC_BUILD_DIR2)
 	# Important!  Required for limits.h to be fixed.
 	ln -snf ../include $(STAGING_DIR)/usr/$(REAL_GNU_TARGET_NAME)/sys-include
 	#-rmdir $(STAGING_DIR)/usr/$(REAL_GNU_TARGET_NAME)/lib
@@ -327,7 +327,7 @@
 	-cp -dpf $(STAGING_DIR)/lib/libgcj.so* $(TARGET_DIR)/usr/lib/
 	-cp -dpf $(STAGING_DIR)/lib/lib-org-w3c-dom.so* $(TARGET_DIR)/usr/lib/
 	-cp -dpf $(STAGING_DIR)/lib/lib-org-xml-sax.so* $(TARGET_DIR)/usr/lib/
-	-mkdir -p $(TARGET_DIR)/usr/lib/security
+	mkdir -p $(TARGET_DIR)/usr/lib/security
 	-cp -dpf $(STAGING_DIR)/usr/lib/security/libgcj.security $(TARGET_DIR)/usr/lib/security/
 	-cp -dpf $(STAGING_DIR)/usr/lib/security/classpath.security $(TARGET_DIR)/usr/lib/security/
 endif

Modified: trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk
===================================================================
--- trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk	2007-08-21 11:18:25 UTC (rev 19611)
+++ trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk	2007-08-21 11:25:30 UTC (rev 19612)
@@ -349,7 +349,7 @@
 	-cp -dpf $(STAGING_DIR)/lib/libgcj.so* $(TARGET_DIR)/lib/
 	-cp -dpf $(STAGING_DIR)/lib/lib-org-w3c-dom.so* $(TARGET_DIR)/lib/
 	-cp -dpf $(STAGING_DIR)/lib/lib-org-xml-sax.so* $(TARGET_DIR)/lib/
-	-mkdir -p $(TARGET_DIR)/usr/lib/security
+	mkdir -p $(TARGET_DIR)/usr/lib/security
 	-cp -dpf $(STAGING_DIR)/usr/lib/security/libgcj.security $(TARGET_DIR)/usr/lib/security/
 	-cp -dpf $(STAGING_DIR)/usr/lib/security/classpath.security $(TARGET_DIR)/usr/lib/security/
 endif

Modified: trunk/buildroot/toolchain/sstrip/sstrip.mk
===================================================================
--- trunk/buildroot/toolchain/sstrip/sstrip.mk	2007-08-21 11:18:25 UTC (rev 19611)
+++ trunk/buildroot/toolchain/sstrip/sstrip.mk	2007-08-21 11:25:30 UTC (rev 19612)
@@ -15,7 +15,7 @@
 SSTRIP_HOST:=$(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-sstrip
 
 $(SSTRIP_HOST): $(SSTRIP_SOURCE_FILE)
-	-mkdir -p $(@D) $(STAGING_DIR)/usr/$(REAL_GNU_TARGET_NAME)/bin
+	mkdir -p $(@D) $(STAGING_DIR)/usr/$(REAL_GNU_TARGET_NAME)/bin
 	$(HOSTCC) $(CFLAGS_FOR_BUILD) $(SSTRIP_SOURCE_FILE) -o $(SSTRIP_HOST)
 	ln -snf ../../bin/$(REAL_GNU_TARGET_NAME)-sstrip \
 		$(STAGING_DIR)/usr/$(REAL_GNU_TARGET_NAME)/bin/sstrip
