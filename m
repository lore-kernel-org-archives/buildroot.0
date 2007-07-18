From: sjhill at uclibc.org <sjhill@uclibc.org>
Date: Wed, 18 Jul 2007 11:07:22 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot: package/config
	target/initramfs target/ etc...
Message-ID: <20070718180722.F2518A65B0@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: sjhill
Date: 2007-07-18 11:07:19 -0700 (Wed, 18 Jul 2007)
New Revision: 19153

Log:
Fix INITRAMFS target that was broken. Get rid of config stuff out of the top-level directory. Finally fix Linux kernel module building such that modules are built and installed first followed by rest of packages. This allows for packages to build external Linux kernel modules.


Modified:
   trunk/buildroot/Makefile
   trunk/buildroot/package/config/Makefile
   trunk/buildroot/target/initramfs/initramfs.mk
   trunk/buildroot/target/linux/Makefile.in


Changeset:
Modified: trunk/buildroot/Makefile
===================================================================
--- trunk/buildroot/Makefile	2007-07-18 03:16:05 UTC (rev 19152)
+++ trunk/buildroot/Makefile	2007-07-18 18:07:19 UTC (rev 19153)
@@ -187,6 +187,9 @@
 # each selected package to TARGETS if that package was selected
 # in the .config file.
 include toolchain/*/*.mk
+ifeq ($(BR2_PACKAGE_LINUX),y)
+TARGETS+=linux26-modules
+endif
 include package/*/*.mk
 
 # target stuff is last so it can override anything else
@@ -309,47 +312,47 @@
 	fi
 
 menuconfig: $(CONFIG)/mconf
-	@-mkdir -p include/config
-	@KCONFIG_AUTOCONFIG=include/config/auto.conf \
-		KCONFIG_AUTOHEADER=include/autoconf.h \
+	@-mkdir -p $(CONFIG)/buildroot-config
+	@KCONFIG_AUTOCONFIG=$(CONFIG)/buildroot-config/auto.conf \
+		KCONFIG_AUTOHEADER=$(CONFIG)/buildroot-config/autoconf.h \
 		$(CONFIG)/mconf $(CONFIG_CONFIG_IN)
 
 config: $(CONFIG)/conf
-	@-mkdir -p include/config
-	@KCONFIG_AUTOCONFIG=include/config/auto.conf \
-		KCONFIG_AUTOHEADER=include/autoconf.h \
+	@-mkdir -p $(CONFIG)/buildroot-config
+	@KCONFIG_AUTOCONFIG=$(CONFIG)/buildroot-config/auto.conf \
+		KCONFIG_AUTOHEADER=$(CONFIG)/buildroot-config/autoconf.h \
 		$(CONFIG)/conf $(CONFIG_CONFIG_IN)
 
 oldconfig: $(CONFIG)/conf
-	@-mkdir -p include/config
-	@KCONFIG_AUTOCONFIG=include/config/auto.conf \
-		KCONFIG_AUTOHEADER=include/autoconf.h \
+	@-mkdir -p $(CONFIG)/buildroot-config
+	@KCONFIG_AUTOCONFIG=$(CONFIG)/buildroot-config/auto.conf \
+		KCONFIG_AUTOHEADER=$(CONFIG)/buildroot-config/autoconf.h \
 		$(CONFIG)/conf -o $(CONFIG_CONFIG_IN)
 
 randconfig: $(CONFIG)/conf
-	@-mkdir -p include/config
-	@KCONFIG_AUTOCONFIG=include/config/auto.conf \
-		KCONFIG_AUTOHEADER=include/autoconf.h \
+	@-mkdir -p $(CONFIG)/buildroot-config
+	@KCONFIG_AUTOCONFIG=$(CONFIG)/buildroot-config/auto.conf \
+		KCONFIG_AUTOHEADER=$(CONFIG)/buildroot-config/autoconf.h \
 		$(CONFIG)/conf -r $(CONFIG_CONFIG_IN)
 
 allyesconfig: $(CONFIG)/conf
 	cat $(CONFIG_DEFCONFIG) > .config
-	@-mkdir -p include/config
-	@KCONFIG_AUTOCONFIG=include/config/auto.conf \
-		KCONFIG_AUTOHEADER=include/autoconf.h \
+	@-mkdir -p $(CONFIG)/buildroot-config
+	@KCONFIG_AUTOCONFIG=$(CONFIG)/buildroot-config/auto.conf \
+		KCONFIG_AUTOHEADER=$(CONFIG)/buildroot-config/autoconf.h \
 		$(CONFIG)/conf -y $(CONFIG_CONFIG_IN)
 	#sed -i -e "s/^CONFIG_DEBUG.*/# CONFIG_DEBUG is not set/" .config
 
 allnoconfig: $(CONFIG)/conf
-	@-mkdir -p include/config
-	@KCONFIG_AUTOCONFIG=include/config/auto.conf \
-		KCONFIG_AUTOHEADER=include/autoconf.h \
+	@-mkdir -p $(CONFIG)/buildroot-config
+	@KCONFIG_AUTOCONFIG=$(CONFIG)/buildroot-config/auto.conf \
+		KCONFIG_AUTOHEADER=$(CONFIG)/buildroot-config/autoconf.h \
 		$(CONFIG)/conf -n $(CONFIG_CONFIG_IN)
 
 defconfig: $(CONFIG)/conf
-	@-mkdir -p include/config
-	@KCONFIG_AUTOCONFIG=include/config/auto.conf \
-		KCONFIG_AUTOHEADER=include/autoconf.h \
+	@-mkdir -p $(CONFIG)/buildroot-config
+	@KCONFIG_AUTOCONFIG=$(CONFIG)/buildroot-config/auto.conf \
+		KCONFIG_AUTOHEADER=$(CONFIG)/buildroot-config/autoconf.h \
 		$(CONFIG)/conf -d $(CONFIG_CONFIG_IN)
 
 # check if download URLs are outdated 

Modified: trunk/buildroot/package/config/Makefile
===================================================================
--- trunk/buildroot/package/config/Makefile	2007-07-18 03:16:05 UTC (rev 19152)
+++ trunk/buildroot/package/config/Makefile	2007-07-18 18:07:19 UTC (rev 19153)
@@ -34,6 +34,7 @@
 	$(Q)rm -f $(lxdialog) $(conf-objs) $(mconf-objs) $(kxgettext-objs) \
 		$(hostprogs-y) $(qconf-cxxobjs) $(qconf-objs) $(gconf-objs) \
 		mconf .depend
+	$(Q)rm -rf buildroot-config
 
 FORCE:
 .PHONY: FORCE clean distclean

Modified: trunk/buildroot/target/initramfs/initramfs.mk
===================================================================
--- trunk/buildroot/target/initramfs/initramfs.mk	2007-07-18 03:16:05 UTC (rev 19152)
+++ trunk/buildroot/target/initramfs/initramfs.mk	2007-07-18 18:07:19 UTC (rev 19153)
@@ -13,6 +13,8 @@
 endif
 
 $(INITRAMFS_TARGET) initramfs: host-fakeroot makedevs
+	rm -f $(TARGET_DIR)/init
+	ln -s sbin/init $(TARGET_DIR)/init
 	-find $(TARGET_DIR) -type f -perm +111 | xargs $(STRIP) 2>/dev/null || true;
 	rm -rf $(TARGET_DIR)/usr/man
 	rm -rf $(TARGET_DIR)/usr/info

Modified: trunk/buildroot/target/linux/Makefile.in
===================================================================
--- trunk/buildroot/target/linux/Makefile.in	2007-07-18 03:16:05 UTC (rev 19152)
+++ trunk/buildroot/target/linux/Makefile.in	2007-07-18 18:07:19 UTC (rev 19153)
@@ -131,12 +131,7 @@
 	cp -dpf $(LINUX26_DIR)/$(LINUX26_BINLOC) $(LINUX26_KERNEL)
 	touch -c $@
 
-$(TARGET_DIR)/boot/$(LINUX26_FORMAT): $(LINUX26_KERNEL)
-	[ -d $(TARGET_DIR)/boot/ ] || mkdir $(TARGET_DIR)/boot
-	cp -dpf $(LINUX26_DIR)/$(LINUX26_BINLOC) $(LINUX26_DIR)/System.map $(TARGET_DIR)/boot/
-	touch -c $@
-
-linux26-modules $(TARGET_DIR)/lib/modules/$(LINUX26_VERSION)/modules.dep: $(LINUX26_DIR)/.depend_done
+$(TARGET_DIR)/lib/modules/$(LINUX26_VERSION)/modules.dep: $(LINUX26_DIR)/.configured
 	rm -rf $(TARGET_DIR)/lib/modules/$(LINUX26_VERSION)
 	rm -f $(TARGET_DIR)/sbin/cardmgr
 	$(MAKE) $(LINUX26_MAKE_FLAGS) -C $(LINUX26_DIR) modules
@@ -145,6 +140,7 @@
 		INSTALL_MOD_PATH=$(TARGET_DIR) modules_install
 	rm -f $(TARGET_DIR)/lib/modules/$(LINUX26_VERSION)/build
 	rm -f $(TARGET_DIR)/lib/modules/$(LINUX26_VERSION)/source
+	$(STAGING_DIR)/bin/$(GNU_TARGET_NAME)-depmod26 -b $(TARGET_DIR) $(LINUX_HEADERS_VERSION)
 	touch -c $@
 
 linux26-menuconfig: $(LINUX26_DIR)/.patched host-sed
@@ -152,8 +148,13 @@
 	$(MAKE) $(LINUX26_MAKE_FLAGS) -C $(LINUX26_DIR) menuconfig
 	-[ -f $(LINUX26_DIR)/.config ] && touch $(LINUX26_DIR)/.configured
 
-linux26: cross-depmod26 $(TARGET_DIR)/lib/modules/$(LINUX26_VERSION)/modules.dep $(INITRAMFS_TARGET) $(TARGET_DIR)/boot/$(LINUX26_FORMAT)
+linux26: $(INITRAMFS_TARGET) $(LINUX26_KERNEL)
 
+$(LINUX26_DIR)/.modules_installed: $(TARGET_DIR)/lib/modules/$(LINUX26_VERSION)/modules.dep
+	touch $@
+
+linux26-modules: cross-depmod26 $(LINUX26_DIR)/.modules_installed
+
 linux26-source: $(DL_DIR)/$(LINUX26_SOURCE)
 
 # This has been renamed so we do _NOT_ by default run this on 'make clean'
