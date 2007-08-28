From: aldot at uclibc.org <aldot@uclibc.org>
Date: Tue, 28 Aug 2007 14:42:46 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot: package/dbus package/jpeg
	package/modut etc...
Message-ID: <20070828214246.32934A455F@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-08-28 14:42:44 -0700 (Tue, 28 Aug 2007)
New Revision: 19723

Log:
- misc cleanups (Cristian Ionescu-Idbohrn)


Modified:
   trunk/buildroot/Config.in
   trunk/buildroot/package/dbus/dbus.mk
   trunk/buildroot/package/jpeg/jpeg.mk
   trunk/buildroot/package/modutils/modutils.mk
   trunk/buildroot/package/openntpd/openntpd.mk
   trunk/buildroot/package/tar/tar.mk
   trunk/buildroot/target/iso9660/iso9660.mk
   trunk/buildroot/toolchain/binutils/binutils.mk
   trunk/buildroot/toolchain/ccache/ccache.mk
   trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk
   trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk
   trunk/buildroot/toolchain/uClibc/uclibc.mk


Changeset:
Modified: trunk/buildroot/Config.in
===================================================================
--- trunk/buildroot/Config.in	2007-08-28 21:09:23 UTC (rev 19722)
+++ trunk/buildroot/Config.in	2007-08-28 21:42:44 UTC (rev 19723)
@@ -108,7 +108,7 @@
 	default ARM922T		if BR2_arm922t
 	default ARM926T		if BR2_arm926t
 	default ARM10T		if BR2_arm10t
-	default ARM1136JF_S 	if BR2_arm1136jf_s
+	default ARM1136JF_S	if BR2_arm1136jf_s
 	default ARM1176JZ_S	if BR2_arm1176jz_s
 	default ARM1176JZF_S	if BR2_arm1176jzf_s
 	default ARM_SA110	if BR2_sa110
@@ -396,11 +396,11 @@
 config BR2_ENDIAN
 	string
 	default "LITTLE" if BR2_arm || BR2_cris || BR2_i386 || BR2_mipsel || \
-	                    BR2_sh3 || BR2_sh4 || BR2_x86_64 || BR2_nios2 || \
+			    BR2_sh3 || BR2_sh4 || BR2_x86_64 || BR2_nios2 || \
 			    BR2_sh64
 	default "BIG"    if BR2_alpha || BR2_armeb || BR2_avr32 || BR2_m68k || BR2_mips || \
-	                    BR2_powerpc || BR2_sh2a_nofpueb || BR2_sh2eb || \
-	                    BR2_sh3eb || BR2_sh4eb || BR2_sparc
+			    BR2_powerpc || BR2_sh2a_nofpueb || BR2_sh2eb || \
+			    BR2_sh3eb || BR2_sh4eb || BR2_sparc
 
 config BR2_GCC_TARGET_TUNE
 	string
@@ -635,7 +635,7 @@
 	  environment variable, then this overrides this configuration item.
 
 source	"target/device/Mirrors.in"
-	  
+
 config BR2_STAGING_DIR
 	string "Toolchain and header file location?"
 	default "$(BUILD_DIR)/staging_dir"
@@ -665,7 +665,7 @@
 	  Add a custom string to the end of the build directories.
 
 	  build_ARCH -> build_ARCH_[SUFFIX]
-	  toolchain_build_ARCH -> toolchain_build_ARCH_[SUFFIX] 
+	  toolchain_build_ARCH -> toolchain_build_ARCH_[SUFFIX]
 
 config BR2_GNU_BUILD_SUFFIX
 	string "GNU build hostname suffix"
@@ -785,5 +785,3 @@
 source "package/Config.in"
 
 source "target/Config.in"
-
-

Modified: trunk/buildroot/package/dbus/dbus.mk
===================================================================
--- trunk/buildroot/package/dbus/dbus.mk	2007-08-28 21:09:23 UTC (rev 19722)
+++ trunk/buildroot/package/dbus/dbus.mk	2007-08-28 21:42:44 UTC (rev 19723)
@@ -57,7 +57,7 @@
 	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(DBUS_DIR)/dbus install
 
 $(TARGET_DIR)/$(DBUS_TARGET_BINARY): $(STAGING_DIR)/usr/lib/libdbus-1.so
-	-mkdir $(TARGET_DIR)/var/run/dbus $(TARGET_DIR)/etc/init.d
+	mkdir -p $(TARGET_DIR)/var/run/dbus $(TARGET_DIR)/etc/init.d
 	$(MAKE) DESTDIR=$(TARGET_DIR) -C $(DBUS_DIR)/dbus install
 	rm -rf $(TARGET_DIR)/usr/lib/dbus-1.0
 	rm -f $(TARGET_DIR)/usr/lib/libdbus-1.la \

Modified: trunk/buildroot/package/jpeg/jpeg.mk
===================================================================
--- trunk/buildroot/package/jpeg/jpeg.mk	2007-08-28 21:09:23 UTC (rev 19722)
+++ trunk/buildroot/package/jpeg/jpeg.mk	2007-08-28 21:42:44 UTC (rev 19723)
@@ -55,8 +55,8 @@
 		--datadir=/usr/share \
 		--localstatedir=/var \
 		--includedir=/usr/include \
-		--mandir=/usr/man \
-		--infodir=/usr/info \
+		--mandir=/usr/share/man \
+		--infodir=/usr/share/info \
 		--enable-shared \
 		--enable-static \
 		--without-x \

Modified: trunk/buildroot/package/modutils/modutils.mk
===================================================================
--- trunk/buildroot/package/modutils/modutils.mk	2007-08-28 21:09:23 UTC (rev 19722)
+++ trunk/buildroot/package/modutils/modutils.mk	2007-08-28 21:42:44 UTC (rev 19723)
@@ -40,7 +40,7 @@
 		--prefix=/ \
 		--sysconfdir=/etc \
 	)
-	touch $(MODUTILS_DIR1)/.configured
+	touch $@
 
 $(MODUTILS_DIR1)/.build: $(MODUTILS_DIR1)/.configured
 	$(MAKE1) CC=$(TARGET_CC) -C $(MODUTILS_DIR1)
@@ -98,7 +98,7 @@
 	$(MODUTILS_CAT) $(DL_DIR)/$(MODUTILS_SOURCE) | tar -C $(TOOL_BUILD_DIR) -xvf -
 	toolchain/patch-kernel.sh $(MODUTILS_DIR2) \
 		package/modutils \*.patch
-	touch $(MODUTILS_DIR2)/.source
+	touch $@
 
 $(MODUTILS_DIR2)/.configured: $(MODUTILS_DIR2)/.source
 	(cd $(MODUTILS_DIR2); \
@@ -109,16 +109,16 @@
 		--prefix=/ \
 		--sysconfdir=/etc \
 	)
-	touch $(MODUTILS_DIR2)/.configured
+	touch $@
 
 $(MODUTILS_DIR2)/$(MODUTILS_BINARY): $(MODUTILS_DIR2)/.configured
 	$(MAKE1) -C $(MODUTILS_DIR2)
-	touch -c $(MODUTILS_DIR2)/$(MODUTILS_BINARY)
+	touch -c $@
 
 $(STAGING_DIR)/bin/$(GNU_TARGET_NAME)-depmod: $(MODUTILS_DIR2)/$(MODUTILS_BINARY)
 	mkdir -p $(STAGING_DIR)/bin
 	cp $(MODUTILS_DIR2)/$(MODUTILS_BINARY) $(STAGING_DIR)/bin/$(GNU_TARGET_NAME)-depmod
-	touch -c $(STAGING_DIR)/bin/$(GNU_TARGET_NAME)-depmod
+	touch -c $@
 
 cross-depmod: uclibc $(STAGING_DIR)/bin/$(GNU_TARGET_NAME)-depmod
 

Modified: trunk/buildroot/package/openntpd/openntpd.mk
===================================================================
--- trunk/buildroot/package/openntpd/openntpd.mk	2007-08-28 21:09:23 UTC (rev 19722)
+++ trunk/buildroot/package/openntpd/openntpd.mk	2007-08-28 21:42:44 UTC (rev 19723)
@@ -78,4 +78,3 @@
 ifeq ($(strip $(BR2_PACKAGE_OPENNTPD)),y)
 TARGETS+=ntpd
 endif
-

Modified: trunk/buildroot/package/tar/tar.mk
===================================================================
--- trunk/buildroot/package/tar/tar.mk	2007-08-28 21:09:23 UTC (rev 19722)
+++ trunk/buildroot/package/tar/tar.mk	2007-08-28 21:42:44 UTC (rev 19723)
@@ -19,7 +19,7 @@
 $(GNUTAR_DIR)/.unpacked: $(DL_DIR)/$(GNUTAR_SOURCE)
 	$(GNUTAR_CAT) $(DL_DIR)/$(GNUTAR_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 	toolchain/patch-kernel.sh $(GNUTAR_DIR) package/tar/ tar\*.patch
-	touch $(GNUTAR_DIR)/.unpacked
+	touch $@
 
 $(GNUTAR_DIR)/.configured: $(GNUTAR_DIR)/.unpacked
 	(cd $(GNUTAR_DIR); rm -rf config.cache; \
@@ -45,7 +45,7 @@
 		$(DISABLE_NLS) \
 		$(DISABLE_LARGEFILE) \
 	)
-	touch $(GNUTAR_DIR)/.configured
+	touch $@
 
 $(GNUTAR_DIR)/$(GNUTAR_BINARY): $(GNUTAR_DIR)/.configured
 	$(MAKE) -C $(GNUTAR_DIR)
@@ -53,12 +53,15 @@
 # This stuff is needed to work around GNU make deficiencies
 tar-target_binary: $(GNUTAR_DIR)/$(GNUTAR_BINARY)
 	@if [ -L $(TARGET_DIR)/$(GNUTAR_TARGET_BINARY) ]; then \
-		rm -f $(TARGET_DIR)/$(GNUTAR_TARGET_BINARY); fi
+		rm -f $(TARGET_DIR)/$(GNUTAR_TARGET_BINARY); \
+	fi
 	@if [ ! -f $(GNUTAR_DIR)/$(GNUTAR_BINARY) -o $(TARGET_DIR)/$(GNUTAR_TARGET_BINARY) \
 	-ot $(GNUTAR_DIR)/$(GNUTAR_BINARY) ]; then \
-	    set -x; \
-	    rm -f $(TARGET_DIR)/$(GNUTAR_TARGET_BINARY); \
-	    cp -a $(GNUTAR_DIR)/$(GNUTAR_BINARY) $(TARGET_DIR)/$(GNUTAR_TARGET_BINARY); fi
+		set -x; \
+		rm -f $(TARGET_DIR)/$(GNUTAR_TARGET_BINARY); \
+		cp -a $(GNUTAR_DIR)/$(GNUTAR_BINARY) \
+			$(TARGET_DIR)/$(GNUTAR_TARGET_BINARY); \
+	fi
 
 tar: uclibc tar-target_binary
 

Modified: trunk/buildroot/target/iso9660/iso9660.mk
===================================================================
--- trunk/buildroot/target/iso9660/iso9660.mk	2007-08-28 21:09:23 UTC (rev 19722)
+++ trunk/buildroot/target/iso9660/iso9660.mk	2007-08-28 21:42:44 UTC (rev 19723)
@@ -17,12 +17,12 @@
 $(MKISOFS_DIR)/.unpacked: $(DL_DIR)/$(MKISOFS_SOURCE)
 	$(MKISOFS_CAT) $(DL_DIR)/$(MKISOFS_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 	toolchain/patch-kernel.sh $(MKISOFS_DIR) target/iso9660/ \*.patch
-	touch $(MKISOFS_DIR)/.unpacked
+	touch $@
 
 $(MKISOFS_DIR)/.configured: $(MKISOFS_DIR)/.unpacked
 	(cd $(MKISOFS_DIR); rm -rf config.cache; \
-	)
-	touch $(MKISOFS_DIR)/.configured
+	);
+	touch $@
 
 $(MKISOFS_TARGET): $(MKISOFS_DIR)/.configured
 	$(MAKE) -C $(MKISOFS_DIR)

Modified: trunk/buildroot/toolchain/binutils/binutils.mk
===================================================================
--- trunk/buildroot/toolchain/binutils/binutils.mk	2007-08-28 21:09:23 UTC (rev 19722)
+++ trunk/buildroot/toolchain/binutils/binutils.mk	2007-08-28 21:42:44 UTC (rev 19723)
@@ -112,7 +112,8 @@
 		$(MULTILIB) \
 		--disable-werror \
 		$(SOFT_FLOAT_CONFIG_OPTION) \
-		$(EXTRA_BINUTILS_CONFIG_OPTIONS))
+		$(EXTRA_BINUTILS_CONFIG_OPTIONS) \
+	)
 	touch $@
 
 $(BINUTILS_DIR1)/binutils/objdump: $(BINUTILS_DIR1)/.configured
@@ -122,7 +123,7 @@
 # Unfortunatey, it isn't configureable.
 $(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-ld: $(BINUTILS_DIR1)/binutils/objdump
 	$(MAKE) -C $(BINUTILS_DIR1) $(BR2_SYSROOT_STAGING_DESTDIR) install
-	# tooldir=/usr build_tooldir=/usr install
+	#	tooldir=/usr build_tooldir=/usr install
 	#rm -f $(STAGING_DIR)/usr/bin/{ar,as,ld,nm,objdump,ranlib,strip}
 
 binutils: uclibc-configured $(BINUTILS_HOST_PREREQ) $(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-ld
@@ -133,7 +134,7 @@
 	rm -rf $(STAGING_DIR)/usr/bin/*{ar,as,ld,nm,objdump,ranlib,strip} \
 		$(STAGING_DIR)/usr/lib/{libiberty*,ldscripts}
 	-$(MAKE) -C $(BINUTILS_DIR1) DESTDIR=$(STAGING_DIR) \
-	 	tooldir=/usr build_tooldir=/usr uninstall
+		tooldir=/usr build_tooldir=/usr uninstall
 	-$(MAKE) -C $(BINUTILS_DIR1) clean
 
 binutils-dirclean:
@@ -161,7 +162,8 @@
 		$(MULTILIB) \
 		$(BINUTILS_TARGET_CONFIG_OPTIONS) \
 		--disable-werror \
-		$(SOFT_FLOAT_CONFIG_OPTION) )
+		$(SOFT_FLOAT_CONFIG_OPTION) \
+	)
 	touch $@
 
 $(BINUTILS_DIR2)/binutils/objdump: $(BINUTILS_DIR2)/.configured
@@ -173,7 +175,7 @@
 		tooldir=/usr build_tooldir=/usr \
 		-C $(BINUTILS_DIR2) install
 	#rm -rf $(TARGET_DIR)/share/locale $(TARGET_DIR)/usr/info \
-	# $(TARGET_DIR)/usr/man $(TARGET_DIR)/usr/share/doc
+	#	$(TARGET_DIR)/usr/man $(TARGET_DIR)/usr/share/doc
 	-$(STRIP) $(TARGET_DIR)/usr/$(REAL_GNU_TARGET_NAME)/bin/* > /dev/null 2>&1
 	-$(STRIP) $(TARGET_DIR)/usr/bin/* > /dev/null 2>&1
 
@@ -182,7 +184,8 @@
 binutils_target-clean:
 	(cd $(TARGET_DIR)/usr/bin; \
 		rm -f addr2line ar as gprof ld nm objcopy \
-		      objdump ranlib readelf size strings strip)
+		      objdump ranlib readelf size strings strip; \
+	)
 	rm -f $(TARGET_DIR)/bin/$(REAL_GNU_TARGET_NAME)*
 	-$(MAKE) -C $(BINUTILS_DIR2) clean
 

Modified: trunk/buildroot/toolchain/ccache/ccache.mk
===================================================================
--- trunk/buildroot/toolchain/ccache/ccache.mk	2007-08-28 21:09:23 UTC (rev 19722)
+++ trunk/buildroot/toolchain/ccache/ccache.mk	2007-08-28 21:42:44 UTC (rev 19723)
@@ -54,27 +54,34 @@
 	(cd $(STAGING_DIR)/usr/bin-ccache; \
 		ln -fs $(REAL_GNU_TARGET_NAME)-gcc $(GNU_TARGET_NAME)-gcc; \
 		ln -fs $(REAL_GNU_TARGET_NAME)-gcc $(GNU_TARGET_NAME)-cc; \
-		ln -fs $(REAL_GNU_TARGET_NAME)-gcc $(REAL_GNU_TARGET_NAME)-cc)
+		ln -fs $(REAL_GNU_TARGET_NAME)-gcc $(REAL_GNU_TARGET_NAME)-cc; \
+	)
 	[ -f $(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-gcc ] && \
-		mv $(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-gcc $(STAGING_DIR)/usr/bin-ccache/
+		mv $(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-gcc \
+			$(STAGING_DIR)/usr/bin-ccache/
 	(cd $(STAGING_DIR)/usr/bin; \
 		ln -fs ccache $(GNU_TARGET_NAME)-cc; \
 		ln -fs ccache $(GNU_TARGET_NAME)-gcc; \
 		ln -fs ccache $(REAL_GNU_TARGET_NAME)-cc; \
-		ln -fs ccache $(REAL_GNU_TARGET_NAME)-gcc)
+		ln -fs ccache $(REAL_GNU_TARGET_NAME)-gcc; \
+	)
 ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
 	[ -f $(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-c++ ] && \
-		mv $(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-c++ $(STAGING_DIR)/usr/bin-ccache/
+		mv $(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-c++ \
+			$(STAGING_DIR)/usr/bin-ccache/
 	[ -f $(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-g++ ] && \
-		mv $(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-g++ $(STAGING_DIR)/usr/bin-ccache/
+		mv $(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-g++ \
+			$(STAGING_DIR)/usr/bin-ccache/
 	(cd $(STAGING_DIR)/usr/bin; \
 		ln -fs ccache $(GNU_TARGET_NAME)-c++; \
 		ln -fs ccache $(GNU_TARGET_NAME)-g++;\
 		ln -fs ccache $(REAL_GNU_TARGET_NAME)-c++; \
-		ln -fs ccache $(REAL_GNU_TARGET_NAME)-g++)
+		ln -fs ccache $(REAL_GNU_TARGET_NAME)-g++; \
+	)
 	(cd $(STAGING_DIR)/usr/bin-ccache; \
 		ln -fs $(REAL_GNU_TARGET_NAME)-c++ $(GNU_TARGET_NAME)-c++; \
-		ln -fs $(REAL_GNU_TARGET_NAME)-g++ $(GNU_TARGET_NAME)-g++)
+		ln -fs $(REAL_GNU_TARGET_NAME)-g++ $(GNU_TARGET_NAME)-g++; \
+	)
 endif
 
 ccache: gcc $(STAGING_DIR)/$(CCACHE_TARGET_BINARY)
@@ -85,25 +92,33 @@
 	rm -rf $(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-cc
 	rm -rf $(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-gcc
 	if [ -f $(STAGING_DIR)/usr/bin-ccache/$(REAL_GNU_TARGET_NAME)-gcc ]; then \
-		mv $(STAGING_DIR)/usr/bin-ccache/$(REAL_GNU_TARGET_NAME)-gcc $(STAGING_DIR)/usr/bin/; \
+		mv $(STAGING_DIR)/usr/bin-ccache/$(REAL_GNU_TARGET_NAME)-gcc \
+			$(STAGING_DIR)/usr/bin/; \
 		(cd $(STAGING_DIR)/usr/bin; \
-		    ln -fs $(REAL_GNU_TARGET_NAME)-gcc $(REAL_GNU_TARGET_NAME)-cc; \
-		    ln -fs $(REAL_GNU_TARGET_NAME)-gcc $(GNU_TARGET_NAME)-cc; \
-		    ln -fs $(REAL_GNU_TARGET_NAME)-gcc $(GNU_TARGET_NAME)-gcc); \
+			ln -fs $(REAL_GNU_TARGET_NAME)-gcc \
+				$(REAL_GNU_TARGET_NAME)-cc; \
+			ln -fs $(REAL_GNU_TARGET_NAME)-gcc \
+				$(GNU_TARGET_NAME)-cc; \
+			ln -fs $(REAL_GNU_TARGET_NAME)-gcc \
+				$(GNU_TARGET_NAME)-gcc; \
+		); \
 	fi
 	if [ -f $(STAGING_DIR)/usr/bin-ccache/$(REAL_GNU_TARGET_NAME)-c++ ]; then \
 		rm -f $(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-c++; \
-		mv $(STAGING_DIR)/usr/bin-ccache/$(REAL_GNU_TARGET_NAME)-c++ $(STAGING_DIR)/usr/bin/; \
+		mv $(STAGING_DIR)/usr/bin-ccache/$(REAL_GNU_TARGET_NAME)-c++ \
+			$(STAGING_DIR)/usr/bin/; \
 	fi
 	if [ -f $(STAGING_DIR)/usr/bin-ccache/$(REAL_GNU_TARGET_NAME)-g++ ]; then \
 		rm -f $(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-g++; \
-		mv $(STAGING_DIR)/usr/bin-ccache/$(REAL_GNU_TARGET_NAME)-g++ $(STAGING_DIR)/usr/bin/; \
+		mv $(STAGING_DIR)/usr/bin-ccache/$(REAL_GNU_TARGET_NAME)-g++ \
+			$(STAGING_DIR)/usr/bin/; \
 	fi
 	rm -rf $(STAGING_DIR)/usr/bin-ccache/*
 	(cd $(STAGING_DIR)/usr/bin; \
 		ln -fs $(REAL_GNU_TARGET_NAME)-g++ $(GNU_TARGET_NAME)-c++; \
-		ln -fs $(REAL_GNU_TARGET_NAME)-g++ $(GNU_TARGET_NAME)-g++;\
-		ln -fs $(REAL_GNU_TARGET_NAME)-g++ $(REAL_GNU_TARGET_NAME)-c++)
+		ln -fs $(REAL_GNU_TARGET_NAME)-g++ $(GNU_TARGET_NAME)-g++; \
+		ln -fs $(REAL_GNU_TARGET_NAME)-g++ $(REAL_GNU_TARGET_NAME)-c++; \
+	)
 	-$(MAKE) -C $(CCACHE_DIR1) clean
 
 ccache-dirclean:
@@ -160,7 +175,8 @@
 		ln -fs /usr/bin/ccache cc; \
 		ln -fs /usr/bin/ccache gcc; \
 		ln -fs /usr/bin/ccache c++; \
-		ln -fs /usr/bin/ccache g++;)
+		ln -fs /usr/bin/ccache g++; \
+	)
 
 ccache_target: uclibc $(TARGET_DIR)/$(CCACHE_TARGET_BINARY)
 

Modified: trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk
===================================================================
--- trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk	2007-08-28 21:09:23 UTC (rev 19722)
+++ trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk	2007-08-28 21:42:44 UTC (rev 19723)
@@ -188,7 +188,8 @@
 		$(MULTILIB) \
 		$(SOFT_FLOAT_CONFIG_OPTION) \
 		$(GCC_WITH_ABI) $(GCC_WITH_ARCH) $(GCC_WITH_TUNE) \
-		$(EXTRA_GCC_CONFIG_OPTIONS))
+		$(EXTRA_GCC_CONFIG_OPTIONS) \
+	)
 	touch $@
 
 $(GCC_BUILD_DIR1)/.compiled: $(GCC_BUILD_DIR1)/.configured
@@ -250,7 +251,8 @@
 		$(GCC_WITH_ABI) $(GCC_WITH_ARCH) $(GCC_WITH_TUNE) \
 		$(GCC_USE_SJLJ_EXCEPTIONS) \
 		$(DISABLE_LARGEFILE) \
-		$(EXTRA_GCC_CONFIG_OPTIONS))
+		$(EXTRA_GCC_CONFIG_OPTIONS) \
+	)
 	touch $@
 
 $(GCC_BUILD_DIR2)/.compiled: $(GCC_BUILD_DIR2)/.configured
@@ -285,7 +287,7 @@
 		cd bin; \
 		for app in $(REAL_GNU_TARGET_NAME)-*; do \
 			ln -snf $${app} \
-		   	$(GNU_TARGET_NAME)$${app##$(REAL_GNU_TARGET_NAME)}; \
+			$(GNU_TARGET_NAME)$${app##$(REAL_GNU_TARGET_NAME)}; \
 		done; \
 	)
 	#
@@ -309,14 +311,15 @@
 	#
 	# Ok... that's enough of that.
 	#
-	-mkdir -p $(TARGET_DIR)/usr/lib $(TARGET_DIR)/usr/sbin
+	mkdir -p $(TARGET_DIR)/usr/lib $(TARGET_DIR)/usr/sbin
 	touch $@
 
 $(GCC_BUILD_DIR2)/.libs_installed: $(GCC_BUILD_DIR2)/.installed
 ifeq ($(BR2_GCC_SHARED_LIBGCC),y)
 	# These are in /lib, so...
 	rm -rf $(TARGET_DIR)/usr/lib/libgcc_s*.so*
-	cp -dpf $(STAGING_DIR)/usr/$(REAL_GNU_TARGET_NAME)/lib/libgcc_s* $(TARGET_DIR)/lib/
+	cp -dpf $(STAGING_DIR)/usr/$(REAL_GNU_TARGET_NAME)/lib/libgcc_s* \
+		$(TARGET_DIR)/lib/
 	-strip --strip-unneeded $(TARGET_DIR)/lib/libgcc_s*
 endif
 ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
@@ -328,8 +331,10 @@
 	cp -dpf $(STAGING_DIR)/lib/lib-org-w3c-dom.so* $(TARGET_DIR)/usr/lib/
 	cp -dpf $(STAGING_DIR)/lib/lib-org-xml-sax.so* $(TARGET_DIR)/usr/lib/
 	mkdir -p $(TARGET_DIR)/usr/lib/security
-	cp -dpf $(STAGING_DIR)/usr/lib/security/libgcj.security $(TARGET_DIR)/usr/lib/security/
-	cp -dpf $(STAGING_DIR)/usr/lib/security/classpath.security $(TARGET_DIR)/usr/lib/security/
+	cp -dpf $(STAGING_DIR)/usr/lib/security/libgcj.security \
+		$(TARGET_DIR)/usr/lib/security/
+	cp -dpf $(STAGING_DIR)/usr/lib/security/classpath.security \
+		$(TARGET_DIR)/usr/lib/security/
 endif
 	touch $@
 
@@ -342,8 +347,8 @@
 gcc-clean:
 	rm -rf $(GCC_BUILD_DIR2)
 	for prog in cpp gcc gcc-[0-9]* protoize unprotoize gcov gccbug cc; do \
-	    rm -f $(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-$$prog \
-	    rm -f $(STAGING_DIR)/usr/bin/$(GNU_TARGET_NAME)-$$prog; \
+		rm -f $(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-$$prog; \
+		rm -f $(STAGING_DIR)/usr/bin/$(GNU_TARGET_NAME)-$$prog; \
 	done
 
 gcc-dirclean: gcc_initial-dirclean
@@ -385,7 +390,8 @@
 		$(GCC_USE_SJLJ_EXCEPTIONS) \
 		$(DISABLE_LARGEFILE) \
 		$(EXTRA_GCC_CONFIG_OPTIONS) \
-		$(EXTRA_TARGET_GCC_CONFIG_OPTIONS))
+		$(EXTRA_TARGET_GCC_CONFIG_OPTIONS) \
+	)
 	touch $@
 
 $(GCC_BUILD_DIR3)/.compiled: $(GCC_BUILD_DIR3)/.configured
@@ -444,7 +450,7 @@
 	#
 	rm -f $(TARGET_DIR)/usr/lib/*.la*
 	#rm -rf $(TARGET_DIR)/share/locale $(TARGET_DIR)/usr/info \
-	# $(TARGET_DIR)/usr/man $(TARGET_DIR)/usr/share/doc
+	#	$(TARGET_DIR)/usr/man $(TARGET_DIR)/usr/share/doc
 	# Work around problem of missing syslimits.h
 	if [ ! -f $(TARGET_DIR)/usr/$(GCC_LIB_SUBDIR)/include/syslimits.h ]; then \
 		echo "warning: working around missing syslimits.h"; \

Modified: trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk
===================================================================
--- trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk	2007-08-28 21:09:23 UTC (rev 19722)
+++ trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk	2007-08-28 21:42:44 UTC (rev 19723)
@@ -70,8 +70,8 @@
 #
 #############################################################
 
-GCC_TARGET_PREREQ =
-GCC_STAGING_PREREQ= $(STAGING_DIR)/usr/lib/libc.a
+GCC_TARGET_PREREQ=
+GCC_STAGING_PREREQ=$(STAGING_DIR)/usr/lib/libc.a
 
 GCC_TARGET_LANGUAGES:=c
 
@@ -86,7 +86,7 @@
 GCC_CROSS_LANGUAGES:=$(GCC_CROSS_LANGUAGES),objc
 endif
 
-GCC_COMMON_PREREQ= $(wildcard $(BR2_DEPENDS_DIR)/br2/install/libstdcpp*)\
+GCC_COMMON_PREREQ=$(wildcard $(BR2_DEPENDS_DIR)/br2/install/libstdcpp*)\
 $(wildcard $(BR2_DEPENDS_DIR)/br2/install/libgcj*)\
 $(wildcard $(BR2_DEPENDS_DIR)/br2/install/objc*)\
 $(wildcard $(BR2_DEPENDS_DIR)/br2/install/fortran*)\
@@ -94,9 +94,9 @@
 $(wildcard $(BR2_DEPENDS_DIR)/br2/toolchain/sysroot*)\
 $(wildcard $(BR2_DEPENDS_DIR)/br2/use/sjlj/exceptions*)\
 $(wildcard $(BR2_DEPENDS_DIR)/br2/gcc/shared/libgcc*)
-GCC_TARGET_PREREQ += $(GCC_COMMON_PREREQ) \
+GCC_TARGET_PREREQ+=$(GCC_COMMON_PREREQ) \
 $(wildcard $(BR2_DEPENDS_DIR)/br2/extra/target/gcc/config/options*)
-GCC_STAGING_PREREQ+= $(GCC_COMMON_PREREQ) \
+GCC_STAGING_PREREQ+=$(GCC_COMMON_PREREQ) \
 $(wildcard $(BR2_DEPENDS_DIR)/br2/extra/gcc/config/options*)\
 $(wildcard $(BR2_DEPENDS_DIR)/br2/gcc/cross/*)
 
@@ -118,8 +118,8 @@
 
 ifeq ($(BR2_INSTALL_FORTRAN),y)
 GCC_TARGET_LANGUAGES:=$(GCC_TARGET_LANGUAGES),fortran
-#GCC_TARGET_PREREQ += $(TARGET_DIR)/usr/lib/libmpfr.so $(TARGET_DIR)/usr/lib/libgmp.so
-#GCC_STAGING_PREREQ+= $(TOOL_BUILD_DIR)/mpfr/lib/libmpfr.so
+#GCC_TARGET_PREREQ+=$(TARGET_DIR)/usr/lib/libmpfr.so $(TARGET_DIR)/usr/lib/libgmp.so
+#GCC_STAGING_PREREQ+=$(TOOL_BUILD_DIR)/mpfr/lib/libmpfr.so
 GCC_WITH_TARGET_GMP=--with-gmp="$(GMP_TARGET_DIR)"
 GCC_WITH_TARGET_MPFR=--with-mpfr="$(MPFR_TARGET_DIR)"
 endif
@@ -333,25 +333,29 @@
 	#
 	# Ok... that's enough of that.
 	#
-	-mkdir -p $(TARGET_DIR)/usr/lib $(TARGET_DIR)/usr/sbin
+	mkdir -p $(TARGET_DIR)/usr/lib $(TARGET_DIR)/usr/sbin
 	touch $@
 
 $(GCC_BUILD_DIR2)/.libs_installed: $(GCC_BUILD_DIR2)/.installed
 ifeq ($(BR2_GCC_SHARED_LIBGCC),y)
 	# These are in /lib, so...
 	rm -rf $(TARGET_DIR)/usr/lib/libgcc_s*.so*
-	cp -dpf $(STAGING_DIR)/usr/$(REAL_GNU_TARGET_NAME)/lib/libgcc_s* $(TARGET_DIR)/lib/
+	cp -dpf $(STAGING_DIR)/usr/$(REAL_GNU_TARGET_NAME)/lib/libgcc_s* \
+		$(TARGET_DIR)/lib/
 endif
 ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
-	cp -dpf $(STAGING_DIR)/usr/$(REAL_GNU_TARGET_NAME)/lib/libstdc++.so* $(TARGET_DIR)/usr/lib/
+	cp -dpf $(STAGING_DIR)/usr/$(REAL_GNU_TARGET_NAME)/lib/libstdc++.so* \
+		$(TARGET_DIR)/usr/lib/
 endif
 ifeq ($(BR2_INSTALL_LIBGCJ),y)
 	cp -dpf $(STAGING_DIR)/lib/libgcj.so* $(TARGET_DIR)/lib/
 	cp -dpf $(STAGING_DIR)/lib/lib-org-w3c-dom.so* $(TARGET_DIR)/lib/
 	cp -dpf $(STAGING_DIR)/lib/lib-org-xml-sax.so* $(TARGET_DIR)/lib/
 	mkdir -p $(TARGET_DIR)/usr/lib/security
-	cp -dpf $(STAGING_DIR)/usr/lib/security/libgcj.security $(TARGET_DIR)/usr/lib/security/
-	cp -dpf $(STAGING_DIR)/usr/lib/security/classpath.security $(TARGET_DIR)/usr/lib/security/
+	cp -dpf $(STAGING_DIR)/usr/lib/security/libgcj.security \
+		$(TARGET_DIR)/usr/lib/security/
+	cp -dpf $(STAGING_DIR)/usr/lib/security/classpath.security \
+		$(TARGET_DIR)/usr/lib/security/
 endif
 	touch $@
 
@@ -364,8 +368,8 @@
 gcc-clean:
 	rm -rf $(GCC_BUILD_DIR2)
 	for prog in cpp gcc gcc-[0-9]* protoize unprotoize gcov gccbug cc; do \
-	    rm -f $(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-$$prog \
-	    rm -f $(STAGING_DIR)/usr/bin/$(GNU_TARGET_NAME)-$$prog; \
+		rm -f $(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-$$prog; \
+		rm -f $(STAGING_DIR)/usr/bin/$(GNU_TARGET_NAME)-$$prog; \
 	done
 
 gcc-dirclean: gcc_initial-dirclean
@@ -465,7 +469,7 @@
 	#
 	rm -f $(TARGET_DIR)/usr/lib/*.la*
 	#rm -rf $(TARGET_DIR)/share/locale $(TARGET_DIR)/usr/info \
-	# $(TARGET_DIR)/usr/man $(TARGET_DIR)/usr/share/doc
+	#	$(TARGET_DIR)/usr/man $(TARGET_DIR)/usr/share/doc
 	# Work around problem of missing syslimits.h
 	if [ ! -f $(TARGET_DIR)/usr/$(GCC_LIB_SUBDIR)/include/syslimits.h ]; then \
 		echo "warning: working around missing syslimits.h"; \

Modified: trunk/buildroot/toolchain/uClibc/uclibc.mk
===================================================================
--- trunk/buildroot/toolchain/uClibc/uclibc.mk	2007-08-28 21:09:23 UTC (rev 19722)
+++ trunk/buildroot/toolchain/uClibc/uclibc.mk	2007-08-28 21:42:44 UTC (rev 19723)
@@ -320,16 +320,19 @@
 		RUNTIME_PREFIX=$(TOOL_BUILD_DIR)/uClibc_dev/ \
 		HOSTCC="$(HOSTCC)" \
 		pregen install_dev
-	# Install the kernel headers to the first stage gcc include dir if necessary
+	# Install the kernel headers to the first stage gcc include dir
+	# if necessary
 ifeq ($(LINUX_HEADERS_IS_KERNEL),y)
-	if [ ! -f $(TOOL_BUILD_DIR)/uClibc_dev/usr/include/linux/version.h ]; \
-	then \
-		cp -pLR $(LINUX_HEADERS_DIR)/include/* $(TOOL_BUILD_DIR)/uClibc_dev/usr/include/; \
+	if [ ! -f $(TOOL_BUILD_DIR)/uClibc_dev/usr/include/linux/version.h ]; then \
+		cp -pLR $(LINUX_HEADERS_DIR)/include/* \
+			$(TOOL_BUILD_DIR)/uClibc_dev/usr/include/; \
 	fi
 else
 	if [ ! -f $(STAGING_DIR)/usr/include/linux/version.h ]; then \
-		cp -pLR $(LINUX_HEADERS_DIR)/include/asm $(TOOL_BUILD_DIR)/uClibc_dev/usr/include/; \
-		cp -pLR $(LINUX_HEADERS_DIR)/include/linux $(TOOL_BUILD_DIR)/uClibc_dev/usr/include/; \
+		cp -pLR $(LINUX_HEADERS_DIR)/include/asm \
+			$(TOOL_BUILD_DIR)/uClibc_dev/usr/include/; \
+		cp -pLR $(LINUX_HEADERS_DIR)/include/linux \
+			$(TOOL_BUILD_DIR)/uClibc_dev/usr/include/; \
 		if [ -d $(LINUX_HEADERS_DIR)/include/asm-generic ]; then \
 			cp -pLR $(LINUX_HEADERS_DIR)/include/asm-generic \
 				$(TOOL_BUILD_DIR)/uClibc_dev/usr/include/; \
@@ -375,13 +378,16 @@
 	# Install the kernel headers to the staging dir if necessary
 ifeq ($(LINUX_HEADERS_IS_KERNEL),y)
 	if [ ! -f $(STAGING_DIR)/usr/include/linux/version.h ]; then \
-		cp -pLR $(LINUX_HEADERS_DIR)/include/* $(STAGING_DIR)/usr/include/; \
+		cp -pLR $(LINUX_HEADERS_DIR)/include/* \
+			$(STAGING_DIR)/usr/include/; \
 	fi
 else
 
 	if [ ! -f $(STAGING_DIR)/usr/include/linux/version.h ]; then \
-		cp -pLR $(LINUX_HEADERS_DIR)/include/asm $(STAGING_DIR)/usr/include/; \
-		cp -pLR $(LINUX_HEADERS_DIR)/include/linux $(STAGING_DIR)/usr/include/; \
+		cp -pLR $(LINUX_HEADERS_DIR)/include/asm \
+			$(STAGING_DIR)/usr/include/; \
+		cp -pLR $(LINUX_HEADERS_DIR)/include/linux \
+			$(STAGING_DIR)/usr/include/; \
 		if [ -d $(LINUX_HEADERS_DIR)/include/asm-generic ]; then \
 			cp -pLR $(LINUX_HEADERS_DIR)/include/asm-generic \
 				$(STAGING_DIR)/usr/include/; \
@@ -459,14 +465,16 @@
 		install_dev
 	# Install the kernel headers to the target dir if necessary
 ifeq ($(LINUX_HEADERS_IS_KERNEL),y)
-	if [ ! -f $(TARGET_DIR)/usr/include/linux/version.h ]; \
-	then \
-		cp -pLR $(LINUX_HEADERS_DIR)/include/* $(TARGET_DIR)/usr/include/; \
+	if [ ! -f $(TARGET_DIR)/usr/include/linux/version.h ]; then \
+		cp -pLR $(LINUX_HEADERS_DIR)/include/* \
+			$(TARGET_DIR)/usr/include/; \
 	fi
 else
 	if [ ! -f $(TARGET_DIR)/usr/include/linux/version.h ]; then \
-		cp -pLR $(LINUX_HEADERS_DIR)/include/asm $(TARGET_DIR)/usr/include/; \
-		cp -pLR $(LINUX_HEADERS_DIR)/include/linux $(TARGET_DIR)/usr/include/; \
+		cp -pLR $(LINUX_HEADERS_DIR)/include/asm \
+			$(TARGET_DIR)/usr/include/; \
+		cp -pLR $(LINUX_HEADERS_DIR)/include/linux \
+			$(TARGET_DIR)/usr/include/; \
 		if [ -d $(LINUX_HEADERS_DIR)/include/asm-generic ]; then \
 			cp -pLR $(LINUX_HEADERS_DIR)/include/asm-generic \
 				$(TARGET_DIR)/usr/include/; \
