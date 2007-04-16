From: aldot at uclibc.org <aldot@uclibc.org>
Date: Mon, 16 Apr 2007 11:51:22 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package: bash libelf
	libsysfs ltrace m4 ncurses o etc...
Message-ID: <20070416185122.8E44E485A4@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-04-16 11:51:20 -0700 (Mon, 16 Apr 2007)
New Revision: 18457

Log:
- install some more stuff that goes into staging_dir into the proper place.
  First hunk of fixes for bug #1290


Modified:
   trunk/buildroot/package/bash/bash.mk
   trunk/buildroot/package/libelf/libelf.mk
   trunk/buildroot/package/libsysfs/libsysfs.mk
   trunk/buildroot/package/ltrace/ltrace.mk
   trunk/buildroot/package/m4/m4.mk
   trunk/buildroot/package/ncurses/ncurses.mk
   trunk/buildroot/package/openssh/openssh.mk
   trunk/buildroot/package/openssl/openssl.mk
   trunk/buildroot/package/readline/readline.mk
   trunk/buildroot/package/zlib/zlib.mk


Changeset:
Modified: trunk/buildroot/package/bash/bash.mk
===================================================================
--- trunk/buildroot/package/bash/bash.mk	2007-04-16 18:25:46 UTC (rev 18456)
+++ trunk/buildroot/package/bash/bash.mk	2007-04-16 18:51:20 UTC (rev 18457)
@@ -65,6 +65,7 @@
 $(TARGET_DIR)/$(BASH_TARGET_BINARY): $(BASH_DIR)/$(BASH_BINARY)
 	$(MAKE1) DESTDIR=$(TARGET_DIR) CC=$(TARGET_CC) -C $(BASH_DIR) install
 	rm -f $(TARGET_DIR)/bin/bash*
+	-mkdir $(TARGET_DIR)/bin
 	mv $(TARGET_DIR)/usr/bin/bash* $(TARGET_DIR)/bin/
 	(cd $(TARGET_DIR)/bin; /bin/ln -fs bash sh)
 	rm -rf $(TARGET_DIR)/share/locale $(TARGET_DIR)/usr/info \

Modified: trunk/buildroot/package/libelf/libelf.mk
===================================================================
--- trunk/buildroot/package/libelf/libelf.mk	2007-04-16 18:25:46 UTC (rev 18456)
+++ trunk/buildroot/package/libelf/libelf.mk	2007-04-16 18:51:20 UTC (rev 18457)
@@ -43,7 +43,7 @@
 $(LIBELF_DIR)/lib/libelf.so.$(LIBELF_VER): $(LIBELF_DIR)/.configured
 	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(LIBELF_DIR)
 
-$(STAGING_DIR)/usr/lib/libelf.a: $(LIBELF_DIR)/lib/libelf.so.$(LIBELF_VER)
+$(STAGING_DIR)/usr/lib/libelf.a $(STAGING_DIR)/usr/lib/libelf.so.$(LIBELF_VER): $(LIBELF_DIR)/lib/libelf.so.$(LIBELF_VER)
 	$(MAKE1) $(TARGET_CONFIGURE_OPTS) \
 		instroot=$(STAGING_DIR) -C $(LIBELF_DIR) install
 

Modified: trunk/buildroot/package/libsysfs/libsysfs.mk
===================================================================
--- trunk/buildroot/package/libsysfs/libsysfs.mk	2007-04-16 18:25:46 UTC (rev 18456)
+++ trunk/buildroot/package/libsysfs/libsysfs.mk	2007-04-16 18:51:20 UTC (rev 18457)
@@ -34,10 +34,11 @@
 
 $(LIBSYSFS_DIR)/.unpacked: $(DL_DIR)/$(LIBSYSFS_SOURCE)
 	$(LIBSYSFS_CAT) $(DL_DIR)/$(LIBSYSFS_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	touch $(LIBSYSFS_DIR)/.unpacked
+	$(CONFIG_UPDATE) $(@D)
+	touch $@
 
 $(LIBSYSFS_DIR)/.configured: $(LIBSYSFS_DIR)/.unpacked
-	(cd $(LIBSYSFS_DIR); \
+	(cd $(LIBSYSFS_DIR); rm -rf config.cache ; \
 	$(TARGET_CONFIGURE_OPTS) \
 	CFLAGS="$(TARGET_CFLAGS) " \
 	LDFLAGS="$(TARGET_LDFLAGS)" \
@@ -45,25 +46,28 @@
 	--target=$(GNU_TARGET_NAME) \
 	--host=$(GNU_TARGET_NAME) \
 	--build=$(GNU_HOST_NAME) \
-	--prefix=/ );
-	touch $(LIBSYSFS_DIR)/.configured
+	--prefix=/usr \
+	--sysconfdir=/etc \
+	);
+	touch $@
 
 $(LIBSYSFS_DIR)/.compiled: $(LIBSYSFS_DIR)/.configured
 	$(MAKE) -C $(LIBSYSFS_DIR)
-	touch $(LIBSYSFS_DIR)/.compiled
+	touch $@
 
-$(STAGING_DIR)/lib/libsysfs.so: $(LIBSYSFS_DIR)/.compiled
+$(STAGING_DIR)/usr/lib/libsysfs.so: $(LIBSYSFS_DIR)/.compiled
 	$(MAKE) -C $(LIBSYSFS_DIR) DESTDIR=$(STAGING_DIR) install
-	touch -c $(STAGING_DIR)/lib/libsysfs.so
+	touch -c $@
 
-$(TARGET_DIR)/usr/lib/libsysfs.so: $(STAGING_DIR)/lib/libsysfs.so
-	cp -dpf $(STAGING_DIR)/lib/libsysfs.so* $(TARGET_DIR)/usr/lib/
+$(TARGET_DIR)/usr/lib/libsysfs.so: $(STAGING_DIR)/usr/lib/libsysfs.so
+	cp -dpf $(STAGING_DIR)/usr/lib/libsysfs.so* $(TARGET_DIR)/usr/lib/
 	-$(STRIP) --strip-unneeded $(TARGET_DIR)/usr/lib/libsysfs.so
 
 libsysfs: uclibc $(TARGET_DIR)/usr/lib/libsysfs.so
 
 libsysfs-clean:
 	-$(MAKE) -C $(LIBSYSFS_DIR) clean
+	-$(MAKE) -C $(LIBSYSFS_DIR) DESTDIR=$(STAGING_DIR) uninstall
 	rm -f $(TARGET_DIR)/usr/lib/libsysfs.so*
 
 libsysfs-dirclean:

Modified: trunk/buildroot/package/ltrace/ltrace.mk
===================================================================
--- trunk/buildroot/package/ltrace/ltrace.mk	2007-04-16 18:25:46 UTC (rev 18456)
+++ trunk/buildroot/package/ltrace/ltrace.mk	2007-04-16 18:51:20 UTC (rev 18457)
@@ -3,14 +3,15 @@
 # ltrace
 #
 #############################################################
-LTRACE_SOURCE=ltrace_0.3.36.orig.tar.gz
-LTRACE_SOURCE2=ltrace_0.3.36-2.diff.gz
+LTRACE_VERSION=0.4
+LTRACE_SOURCE=ltrace_$(LTRACE_VERSION).orig.tar.gz
+#LTRACE_PATCH=ltrace_$(LTRACE_VERSION)-1.diff.gz
 LTRACE_SITE=http://ftp.debian.org/debian/pool/main/l/ltrace
-LTRACE_DIR=$(BUILD_DIR)/ltrace-0.3.36
+LTRACE_DIR=$(BUILD_DIR)/ltrace-$(LTRACE_VERSION)
 LTRACE_BINARY=ltrace
 LTRACE_TARGET_BINARY=usr/bin/ltrace
 
-LTRACE_ARCH:=$(ARCH)
+LTRACE_ARCH:=$(KERNEL_ARCH)
 ifeq ("$(strip $(ARCH))","armeb")
 LTRACE_ARCH:=arm
 endif
@@ -18,15 +19,26 @@
 $(DL_DIR)/$(LTRACE_SOURCE):
 	$(WGET) -P $(DL_DIR) $(LTRACE_SITE)/$(LTRACE_SOURCE)
 
-$(DL_DIR)/$(LTRACE_SOURCE2):
-	$(WGET) -P $(DL_DIR) $(LTRACE_SITE)/$(LTRACE_SOURCE2)
+ifneq ($(LTRACE_PATCH),)
+LTRACE_SOURCE2:=$(DL_DIR)/$(LTRACE_PATCH)
+$(LTRACE_SOURCE2):
+	$(WGET) -P $(DL_DIR) $(LTRACE_SITE)/$(LTRACE_PATCH)
 
-$(LTRACE_DIR)/.source: $(DL_DIR)/$(LTRACE_SOURCE) $(DL_DIR)/$(LTRACE_SOURCE2)
+else
+LTRACE_SOURCE2:=
+endif
+
+$(LTRACE_DIR)/.patched: $(DL_DIR)/$(LTRACE_SOURCE) $(LTRACE_SOURCE2)
 	$(ZCAT) $(DL_DIR)/$(LTRACE_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	$(ZCAT) $(DL_DIR)/$(LTRACE_SOURCE2) | patch -p1 -d $(LTRACE_DIR)
-	touch $(LTRACE_DIR)/.source
+ifneq ($(LTRACE_PATCH),)
+	$(ZCAT) $(LTRACE_SOURCE2) | patch -p1 -d $(LTRACE_DIR)
+endif
+	toolchain/patch-kernel.sh $(LTRACE_DIR) package/ltrace ltrace\*.patch
+	$(CONFIG_UPDATE) $(@D)
+	chmod +x $(LTRACE_DIR)/configure
+	touch $@
 
-$(LTRACE_DIR)/.configured: $(LTRACE_DIR)/.source
+$(LTRACE_DIR)/.configured: $(LTRACE_DIR)/.patched
 	(cd $(LTRACE_DIR); \
 		$(TARGET_CONFIGURE_OPTS) \
 		CFLAGS="$(TARGET_CFLAGS)" \
@@ -37,8 +49,9 @@
 		--build=$(GNU_HOST_NAME) \
 		--prefix=/usr \
 		--sysconfdir=/etc \
+		$(DISABLE_LARGEFILE) \
 	);
-	touch $(LTRACE_DIR)/.configured;
+	touch $@
 
 $(LTRACE_DIR)/$(LTRACE_BINARY): $(LTRACE_DIR)/.configured
 	$(MAKE) CC=$(TARGET_CC) LD=$(TARGET_CROSS)ld ARCH=$(LTRACE_ARCH) \
@@ -51,7 +64,7 @@
 
 ltrace: uclibc libelf $(TARGET_DIR)/$(LTRACE_TARGET_BINARY)
 
-ltrace-source: $(DL_DIR)/$(LTRACE_SOURCE)
+ltrace-source: $(DL_DIR)/$(LTRACE_SOURCE) $(LTRACE_SOURCE2)
 
 ltrace-clean:
 	$(MAKE) prefix=$(TARGET_DIR)/usr -C $(LTRACE_DIR) uninstall

Modified: trunk/buildroot/package/m4/m4.mk
===================================================================
--- trunk/buildroot/package/m4/m4.mk	2007-04-16 18:25:46 UTC (rev 18456)
+++ trunk/buildroot/package/m4/m4.mk	2007-04-16 18:51:20 UTC (rev 18457)
@@ -3,7 +3,7 @@
 # m4
 #
 #############################################################
-M4_VER:=1.4.8
+M4_VER:=1.4.9
 M4_SOURCE:=m4-$(M4_VER).tar.bz2
 M4_CAT:=$(BZCAT)
 M4_SITE:=http://ftp.gnu.org/pub/gnu/m4
@@ -11,6 +11,10 @@
 M4_BINARY:=m4
 M4_TARGET_BINARY:=usr/bin/m4
 
+ifeq ($(UCLIBC_HAS_REGEX),y)
+gl_cv_func_re_compile_pattern_working=gl_cv_func_re_compile_pattern_working=yes
+endif
+
 $(DL_DIR)/$(M4_SOURCE):
 	 $(WGET) -P $(DL_DIR) $(M4_SITE)/$(M4_SOURCE)
 
@@ -18,6 +22,8 @@
 
 $(M4_DIR)/.unpacked: $(DL_DIR)/$(M4_SOURCE)
 	$(M4_CAT) $(DL_DIR)/$(M4_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
+	toolchain/patch-kernel.sh $(M4_DIR) package/m4 m4\*.patch
+	$(CONFIG_UPDATE) $(@D)
 	touch $(M4_DIR)/.unpacked
 
 $(M4_DIR)/.configured: $(M4_DIR)/.unpacked
@@ -25,12 +31,15 @@
 		$(TARGET_CONFIGURE_OPTS) \
 		CFLAGS="$(TARGET_CFLAGS)" \
 		LDFLAGS="$(TARGET_LDFLAGS)" \
+		gl_cv_func_gettimeofday_clobber=no \
+		$(gl_cv_func_re_compile_pattern_working) \
 		./configure \
 		--target=$(GNU_TARGET_NAME) \
 		--host=$(GNU_TARGET_NAME) \
 		--build=$(GNU_HOST_NAME) \
 		--prefix=/usr \
 		--exec-prefix=/usr \
+		$(DISABLE_LARGEFILE) \
 	);
 	touch $(M4_DIR)/.configured
 

Modified: trunk/buildroot/package/ncurses/ncurses.mk
===================================================================
--- trunk/buildroot/package/ncurses/ncurses.mk	2007-04-16 18:25:46 UTC (rev 18456)
+++ trunk/buildroot/package/ncurses/ncurses.mk	2007-04-16 18:51:20 UTC (rev 18457)
@@ -32,16 +32,16 @@
 $(DL_DIR)/$(NCURSES_SOURCE):
 	$(WGET) -P $(DL_DIR) $(NCURSES_SITE)/$(NCURSES_SOURCE)
 
-$(NCURSES_DIR)/.dist: $(DL_DIR)/$(NCURSES_SOURCE)
+$(NCURSES_DIR)/.patched: $(DL_DIR)/$(NCURSES_SOURCE)
 	$(NCURSES_CAT) $(DL_DIR)/$(NCURSES_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 	#use the local tic and not whatever the build system was going to find.
 	$(SED) 's~\$$srcdir/shlib tic\$$suffix~/usr/bin/tic~' \
 		$(NCURSES_DIR)/misc/run_tic.in
 	toolchain/patch-kernel.sh $(NCURSES_DIR) package/ncurses/ ncurses\*.patch
 	$(CONFIG_UPDATE) $(NCURSES_DIR)
-	touch $(NCURSES_DIR)/.dist
+	touch $@
 
-$(NCURSES_DIR)/.configured: $(NCURSES_DIR)/.dist
+$(NCURSES_DIR)/.configured: $(NCURSES_DIR)/.patched
 	(cd $(NCURSES_DIR); rm -rf config.cache; \
 		BUILD_CC="$(HOSTCC)" \
 		$(TARGET_CONFIGURE_OPTS) \
@@ -72,7 +72,7 @@
 		--enable-echo --enable-const --enable-overwrite \
 		--enable-broken_linker \
 	);
-	touch $(NCURSES_DIR)/.configured
+	touch $@
 
 $(NCURSES_DIR)/lib/libncurses.so.$(NCURSES_VER): $(NCURSES_DIR)/.configured
 	$(MAKE1) DESTDIR=$(STAGING_DIR) -C $(NCURSES_DIR) \
@@ -80,7 +80,7 @@
 
 $(STAGING_DIR)/lib/libncurses.a: $(NCURSES_DIR)/lib/libncurses.so.$(NCURSES_VER)
 	$(MAKE1) \
-	    prefix=$(STAGING_DIR) \
+	    prefix=$(STAGING_DIR)/usr/ \
 	    exec_prefix=$(STAGING_DIR) \
 	    bindir=$(STAGING_DIR)/bin \
 	    sbindir=$(STAGING_DIR)/sbin \
@@ -89,14 +89,14 @@
 	    sysconfdir=$(STAGING_DIR)/etc \
 	    localstatedir=$(STAGING_DIR)/var \
 	    libdir=$(STAGING_DIR)/lib \
-	    infodir=$(STAGING_DIR)/info \
-	    mandir=$(STAGING_DIR)/man \
-	    includedir=$(STAGING_DIR)/include \
-	    gxx_include_dir=$(STAGING_DIR)/include/c++ \
+	    infodir=$(STAGING_DIR)/usr/info \
+	    mandir=$(STAGING_DIR)/usr/man \
+	    includedir=$(STAGING_DIR)/usr/include \
+	    gxx_include_dir=$(STAGING_DIR)/usr/include/c++ \
 	    ticdir=$(STAGING_DIR)/usr/share/terminfo \
-	    -C $(NCURSES_DIR) install;
-	    chmod a-x $(NCURSES_DIR)/lib/libncurses.so*
-	    touch -c $(STAGING_DIR)/lib/libncurses.a
+	    -C $(NCURSES_DIR) install
+	chmod a-x $(NCURSES_DIR)/lib/libncurses.so*
+	touch -c $@
 
 $(TARGET_DIR)/lib/libncurses.so.$(NCURSES_VER): $(STAGING_DIR)/lib/libncurses.a
 	cp -dpf $(NCURSES_DIR)/lib/libncurses.so* $(TARGET_DIR)/lib/
@@ -112,8 +112,8 @@
 	cp -dpf $(STAGING_DIR)/usr/share/terminfo/a/ansi $(TARGET_DIR)/usr/share/terminfo/a
 	mkdir -p $(TARGET_DIR)/usr/share/terminfo/l
 	cp -dpf $(STAGING_DIR)/usr/share/terminfo/l/linux $(TARGET_DIR)/usr/share/terminfo/l
-	-$(STRIP) --strip-unneeded $(TARGET_DIR)/lib/libncurses.so.$(NCURSES_VER)
-	touch -c $(TARGET_DIR)/lib/libncurses.so.$(NCURSES_VER)
+	-$(STRIP) --strip-unneeded $@
+	touch -c $@
 
 $(TARGET_DIR)/usr/lib/libncurses.a: $(STAGING_DIR)/lib/libncurses.a
 	-mkdir -p $(TARGET_DIR)/usr/include
@@ -124,14 +124,15 @@
 	cp -dpf $(NCURSES_DIR)/include/termcap.h $(TARGET_DIR)/usr/include/
 	cp -dpf $(NCURSES_DIR)/lib/libncurses.a $(TARGET_DIR)/usr/lib/
 	rm -f $(TARGET_DIR)/usr/lib/terminfo
-	(cd $(TARGET_DIR)/usr/lib; ln -fs ../share/terminfo)
-	(cd $(TARGET_DIR)/usr/lib; ln -fs libncurses.a libcurses.a)
-	(cd $(TARGET_DIR)/usr/lib; ln -fs libncurses.a libtermcap.a)
+	(cd $(TARGET_DIR)/usr/lib; ln -fs ../share/terminfo ; \
+	 ln -fs libncurses.a libcurses.a ; \
+	 ln -fs libncurses.a libtermcap.a ; \
+	)
 	(cd $(TARGET_DIR)/usr/include; ln -fs ncurses.h curses.h)
 	rm -f $(TARGET_DIR)/lib/libncurses.so
 	(cd $(TARGET_DIR)/usr/lib; ln -fs ../../lib/libncurses.so.$(NCURSES_VER) libncurses.so)
 	-$(STRIP) --strip-unneeded $(TARGET_DIR)/lib/libncurses.so.$(NCURSES_VER)
-	touch -c $(TARGET_DIR)/usr/lib/libncurses.a
+	touch -c $@
 
 ncurses: $(TARGET_DIR)/lib/libncurses.so.$(NCURSES_VER)
 
@@ -147,6 +148,7 @@
 
 ncurses-dirclean:
 	rm -rf $(NCURSES_DIR)
+
 #############################################################
 #
 # Toplevel Makefile options

Modified: trunk/buildroot/package/openssh/openssh.mk
===================================================================
--- trunk/buildroot/package/openssh/openssh.mk	2007-04-16 18:25:46 UTC (rev 18456)
+++ trunk/buildroot/package/openssh/openssh.mk	2007-04-16 18:51:20 UTC (rev 18457)
@@ -14,10 +14,11 @@
 $(OPENSSH_DIR)/.unpacked: $(DL_DIR)/$(OPENSSH_SOURCE)
 	$(ZCAT) $(DL_DIR)/$(OPENSSH_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 	toolchain/patch-kernel.sh $(OPENSSH_DIR) package/openssh/ openssh\*.patch
-	touch $(OPENSSH_DIR)/.unpacked
+	$(CONFIG_UPDATE) $(@D)
+	touch $@
 
 $(OPENSSH_DIR)/.configured: $(OPENSSH_DIR)/.unpacked
-	(cd $(OPENSSH_DIR); rm -rf config.cache; autoconf; \
+	(cd $(OPENSSH_DIR); rm -rf config.cache; autoconf ; \
 		$(TARGET_CONFIGURE_OPTS) \
 		LD=$(TARGET_CROSS)gcc \
 		CFLAGS="$(TARGET_CFLAGS)" \
@@ -37,14 +38,14 @@
 		--localstatedir=/var \
 		--mandir=/usr/man \
 		--infodir=/usr/info \
-		--includedir=$(STAGING_DIR)/include \
+		--includedir=$(STAGING_DIR)/usr/include \
 		--disable-lastlog --disable-utmp \
 		--disable-utmpx --disable-wtmp --disable-wtmpx \
 		--without-x \
 		$(DISABLE_NLS) \
 		$(DISABLE_LARGEFILE) \
 	);
-	touch $(OPENSSH_DIR)/.configured
+	touch $@
 
 $(OPENSSH_DIR)/ssh: $(OPENSSH_DIR)/.configured
 	$(MAKE) CC=$(TARGET_CC) -C $(OPENSSH_DIR)
@@ -73,6 +74,7 @@
 
 openssh-clean: 
 	$(MAKE) -C $(OPENSSH_DIR) clean
+	$(MAKE) CC=$(TARGET_CC) DESTDIR=$(TARGET_DIR) -C $(OPENSSH_DIR) uninstall
 
 openssh-dirclean: 
 	rm -rf $(OPENSSH_DIR)

Modified: trunk/buildroot/package/openssl/openssl.mk
===================================================================
--- trunk/buildroot/package/openssl/openssl.mk	2007-04-16 18:25:46 UTC (rev 18456)
+++ trunk/buildroot/package/openssl/openssl.mk	2007-04-16 18:51:20 UTC (rev 18457)
@@ -37,14 +37,15 @@
 		$(OPENSSL_DIR)/Configure
 	$(SED) '/CFLAG=/s,/;, $(shell echo '$(TARGET_CFLAGS)' | sed -e 's/\//\\\\\//g')/;,' \
 		$(OPENSSL_DIR)/Configure
-	touch $(OPENSSL_DIR)/.unpacked
+	touch $@
 
 $(OPENSSL_DIR)/Makefile: $(OPENSSL_DIR)/.unpacked
 	(cd $(OPENSSL_DIR); \
 	CFLAGS="-DOPENSSL_NO_KRB5 -DOPENSSL_NO_IDEA -DOPENSSL_NO_MDC2 -DOPENSSL_NO_RC5 $(TARGET_CFLAGS)" \
-	PATH=$(TARGET_PATH) ./Configure linux-$(OPENSSL_TARGET_ARCH) --prefix=/ \
+	PATH=$(TARGET_PATH) \
+	./Configure linux-$(OPENSSL_TARGET_ARCH) --prefix=/ \
 		--openssldir=/usr/lib/ssl -L$(STAGING_DIR)/lib -ldl \
-		-I$(STAGING_DIR)/include $(OPENSSL_OPTS) no-threads \
+		-I$(STAGING_DIR)/usr/include $(OPENSSL_OPTS) no-threads \
 		shared no-idea no-mdc2 no-rc5)
 
 $(OPENSSL_DIR)/apps/openssl: $(OPENSSL_DIR)/Makefile
@@ -53,31 +54,36 @@
 	-rm $(OPENSSL_DIR)/libssl.so.*.*.*
 	$(MAKE1) CC=$(TARGET_CC) -C $(OPENSSL_DIR) do_linux-shared
 
-$(STAGING_DIR)/lib/libcrypto.a: $(OPENSSL_DIR)/apps/openssl
-	$(MAKE) CC=$(TARGET_CC) INSTALL_PREFIX=$(STAGING_DIR) -C $(OPENSSL_DIR) install
-	cp -fa $(OPENSSL_DIR)/libcrypto.so* $(STAGING_DIR)/lib/
-	chmod a-x $(STAGING_DIR)/lib/libcrypto.so.0.9.7
-	(cd $(STAGING_DIR)/lib; ln -fs libcrypto.so.0.9.7 libcrypto.so)
-	(cd $(STAGING_DIR)/lib; ln -fs libcrypto.so.0.9.7 libcrypto.so.0)
-	cp -fa $(OPENSSL_DIR)/libssl.so* $(STAGING_DIR)/lib/
-	chmod a-x $(STAGING_DIR)/lib/libssl.so.0.9.7
-	(cd $(STAGING_DIR)/lib; ln -fs libssl.so.0.9.7 libssl.so)
-	(cd $(STAGING_DIR)/lib; ln -fs libssl.so.0.9.7 libssl.so.0)
+$(STAGING_DIR)/usr/lib/libcrypto.a: $(OPENSSL_DIR)/apps/openssl
+	$(MAKE) CC=$(TARGET_CC) INSTALL_PREFIX=$(STAGING_DIR)/usr -C $(OPENSSL_DIR) install
+	cp -fa $(OPENSSL_DIR)/libcrypto.so* $(STAGING_DIR)/usr/lib/
+	chmod a-x $(STAGING_DIR)/usr/lib/libcrypto.so.0.9.7
+	(cd $(STAGING_DIR)/usr/lib ; \
+	 ln -fs libcrypto.so.0.9.7 libcrypto.so ; \
+	 ln -fs libcrypto.so.0.9.7 libcrypto.so.0 ; \
+	)
+	cp -fa $(OPENSSL_DIR)/libssl.so* $(STAGING_DIR)/usr/lib/
+	chmod a-x $(STAGING_DIR)/usr/lib/libssl.so.0.9.7
+	(cd $(STAGING_DIR)/usr/lib ; \
+	 ln -fs libssl.so.0.9.7 libssl.so ; \
+	 ln -fs libssl.so.0.9.7 libssl.so.0 ; \
+	)
+	touch -c $@
 
-$(TARGET_DIR)/usr/lib/libcrypto.so.0.9.7: $(STAGING_DIR)/lib/libcrypto.a
+$(TARGET_DIR)/usr/lib/libcrypto.so.0.9.7: $(STAGING_DIR)/usr/lib/libcrypto.a
 	mkdir -p $(TARGET_DIR)/usr/lib
-	cp -fa $(STAGING_DIR)/lib/libcrypto.so* $(TARGET_DIR)/usr/lib/
-	cp -fa $(STAGING_DIR)/lib/libssl.so* $(TARGET_DIR)/usr/lib/
+	cp -fa $(STAGING_DIR)/usr/lib/libcrypto.so* $(TARGET_DIR)/usr/lib/
+	cp -fa $(STAGING_DIR)/usr/lib/libssl.so* $(TARGET_DIR)/usr/lib/
 	#cp -fa $(STAGING_DIR)/bin/openssl  $(TARGET_DIR)/bin/
 	-$(STRIP) --strip-unneeded $(TARGET_DIR)/usr/lib/libssl.so.0.9.7
 	-$(STRIP) --strip-unneeded $(TARGET_DIR)/usr/lib/libcrypto.so.0.9.7
 
-$(TARGET_DIR)/usr/lib/libssl.a: $(STAGING_DIR)/lib/libcrypto.a
+$(TARGET_DIR)/usr/lib/libssl.a: $(STAGING_DIR)/usr/lib/libcrypto.a
 	mkdir -p $(TARGET_DIR)/usr/include 
-	cp -a $(STAGING_DIR)/include/openssl $(TARGET_DIR)/usr/include/
-	cp -dpf $(STAGING_DIR)/lib/libssl.a $(TARGET_DIR)/usr/lib/
-	cp -dpf $(STAGING_DIR)/lib/libcrypto.a $(TARGET_DIR)/usr/lib/
-	touch -c $(TARGET_DIR)/usr/lib/libssl.a
+	cp -a $(STAGING_DIR)/usr/include/openssl $(TARGET_DIR)/usr/include/
+	cp -dpf $(STAGING_DIR)/usr/lib/libssl.a $(TARGET_DIR)/usr/lib/
+	cp -dpf $(STAGING_DIR)/usr/lib/libcrypto.a $(TARGET_DIR)/usr/lib/
+	touch -c $@
 
 openssl-headers: $(TARGET_DIR)/usr/lib/libssl.a
 
@@ -86,10 +92,11 @@
 openssl-source: $(DL_DIR)/$(OPENSSL_SOURCE)
 
 openssl-clean: 
-	rm -f $(STAGING_DIR)/bin/openssl  $(TARGET_DIR)/bin/openssl
-	rm -f $(STAGING_DIR)/lib/libcrypto.so* $(TARGET_DIR)/lib/libcrypto.so*
-	rm -f $(STAGING_DIR)/lib/libssl.so* $(TARGET_DIR)/lib/libssl.so*
 	$(MAKE) -C $(OPENSSL_DIR) clean
+	rm -f $(STAGING_DIR)/usr/bin/openssl  $(TARGET_DIR)/usr/bin/openssl
+	rm -f $(STAGING_DIR)/usr/lib/libcrypto.so* $(TARGET_DIR)/usr/lib/libcrypto.so*
+	rm -f $(STAGING_DIR)/usr/lib/libssl.so* $(TARGET_DIR)/usr/lib/libssl.so*
+	rm -rf $(STAGING_DIR)/usr/include/openssl $(TARGET_DIR)/usr/include/openssl
 
 openssl-dirclean: 
 	rm -rf $(OPENSSL_DIR)

Modified: trunk/buildroot/package/readline/readline.mk
===================================================================
--- trunk/buildroot/package/readline/readline.mk	2007-04-16 18:25:46 UTC (rev 18456)
+++ trunk/buildroot/package/readline/readline.mk	2007-04-16 18:51:20 UTC (rev 18457)
@@ -41,14 +41,14 @@
 		--sysconfdir=/etc \
 		--datadir=/usr/share \
 		--localstatedir=/var \
-		--includedir=/include \
+		--includedir=/usr/include \
 		--mandir=/usr/man \
 		--infodir=/usr/info \
 	);
 	touch $@
 
 $(READLINE_DIR)/$(READLINE_BINARY): $(READLINE_DIR)/.configured
-	$(MAKE)  -C $(READLINE_DIR)
+	$(MAKE) -C $(READLINE_DIR)
 	touch -c $@
 
 $(STAGING_DIR)/$(READLINE_TARGET_BINARY): $(READLINE_DIR)/.configured
@@ -56,7 +56,7 @@
 	touch -c $@
 
 # Install to Staging area
-$(STAGING_DIR)/include/readline/readline.h: $(READLINE_DIR)/$(READLINE_BINARY)
+$(STAGING_DIR)/usr/include/readline/readline.h: $(READLINE_DIR)/$(READLINE_BINARY)
 	BUILD_CC=$(TARGET_CC) HOSTCC="$(HOSTCC)" CC=$(TARGET_CC) \
 	$(MAKE1) DESTDIR=$(STAGING_DIR) -C $(READLINE_DIR) install
 	touch -c $@
@@ -64,16 +64,15 @@
 # Install to Target directory
 $(TARGET_DIR)/$(READLINE_TARGET_BINARY): $(READLINE_DIR)/$(READLINE_BINARY)
 	# make sure we don't end up with lib{readline,history}...old
-	$(MAKE1) DESTDIR=$(TARGET_DIR) includedir=/usr/include \
-		-C $(READLINE_DIR) uninstall
+	$(MAKE1) DESTDIR=$(TARGET_DIR) -C $(READLINE_DIR) uninstall
 	BUILD_CC=$(TARGET_CC) HOSTCC="$(HOSTCC)" CC=$(TARGET_CC) \
-	$(MAKE1) DESTDIR=$(TARGET_DIR) includedir=/usr/include \
+	$(MAKE1) DESTDIR=$(TARGET_DIR) \
 		-C $(READLINE_DIR) install-shared uninstall-doc
 
-readline: $(STAGING_DIR)/include/readline/readline.h
+readline: $(STAGING_DIR)/usr/include/readline/readline.h
 
 readline-clean:
-	$(MAKE) -C $(READLINE_DIR) uninstall
+	$(MAKE) -C $(READLINE_DIR) DESTDIR=$(STAGING_DIR) uninstall
 	-$(MAKE) -C $(READLINE_DIR) clean
 
 readline-dirclean:
@@ -82,8 +81,7 @@
 readline-target: $(TARGET_DIR)/$(READLINE_TARGET_BINARY)
 
 readline-target-clean:
-	$(MAKE1) DESTDIR=$(TARGET_DIR) includedir=/usr/include \
-		-C $(READLINE_DIR) uninstall
+	$(MAKE1) DESTDIR=$(TARGET_DIR) -C $(READLINE_DIR) uninstall
 
 ifeq ($(strip $(BR2_READLINE)),y)
 TARGETS+=readline

Modified: trunk/buildroot/package/zlib/zlib.mk
===================================================================
--- trunk/buildroot/package/zlib/zlib.mk	2007-04-16 18:25:46 UTC (rev 18456)
+++ trunk/buildroot/package/zlib/zlib.mk	2007-04-16 18:51:20 UTC (rev 18457)
@@ -16,13 +16,14 @@
 $(DL_DIR)/$(ZLIB_SOURCE):
 	$(WGET) -P $(DL_DIR) $(ZLIB_SITE)/$(ZLIB_SOURCE)
 
-$(ZLIB_DIR)/.source: $(DL_DIR)/$(ZLIB_SOURCE)
+$(ZLIB_DIR)/.patched: $(DL_DIR)/$(ZLIB_SOURCE)
 	$(ZLIB_CAT) $(DL_DIR)/$(ZLIB_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 	toolchain/patch-kernel.sh $(ZLIB_DIR) package/zlib/ zlib\*.patch
-	touch $(ZLIB_DIR)/.source
+	$(CONFIG_UPDATE) $(@D)
+	touch $@
 
-$(ZLIB_DIR)/.configured: $(ZLIB_DIR)/.source
-	(cd $(ZLIB_DIR); \
+$(ZLIB_DIR)/.configured: $(ZLIB_DIR)/.patched
+	(cd $(ZLIB_DIR); rm -rf config.cache ; \
 		$(TARGET_CONFIGURE_OPTS) \
 		CFLAGS="$(TARGET_CFLAGS) $(ZLIB_CFLAGS)" \
 		LDFLAGS="$(TARGET_LDFLAGS)" \
@@ -30,46 +31,47 @@
 		--shared \
 		--prefix=/usr \
 		--exec-prefix=$(STAGING_DIR)/usr/bin \
-		--libdir=$(STAGING_DIR)/lib \
-		--includedir=$(STAGING_DIR)/include \
+		--libdir=$(STAGING_DIR)/usr/lib \
+		--includedir=$(STAGING_DIR)/usr/include \
 	);
-	touch $(ZLIB_DIR)/.configured;
+	touch $@
 
 $(ZLIB_DIR)/libz.so.$(ZLIB_VER): $(ZLIB_DIR)/.configured
 	$(MAKE) -C $(ZLIB_DIR) all libz.a
 	touch -c $(ZLIB_DIR)/libz.so.$(ZLIB_VER)
 
-$(STAGING_DIR)/lib/libz.so.$(ZLIB_VER): $(ZLIB_DIR)/libz.so.$(ZLIB_VER)
-	cp -dpf $(ZLIB_DIR)/libz.a $(STAGING_DIR)/lib;
-	cp -dpf $(ZLIB_DIR)/zlib.h $(STAGING_DIR)/include;
-	cp -dpf $(ZLIB_DIR)/zconf.h $(STAGING_DIR)/include;
-	cp -dpf $(ZLIB_DIR)/libz.so* $(STAGING_DIR)/lib;
-	(cd $(STAGING_DIR)/lib; ln -fs libz.so.$(ZLIB_VER) libz.so.1);
-	chmod a-x $(STAGING_DIR)/lib/libz.so.$(ZLIB_VER)
-	touch -c $(STAGING_DIR)/lib/libz.so.$(ZLIB_VER)
+$(STAGING_DIR)/usr/lib/libz.so.$(ZLIB_VER): $(ZLIB_DIR)/libz.so.$(ZLIB_VER)
+	cp -dpf $(ZLIB_DIR)/libz.a $(STAGING_DIR)/usr/lib/
+	cp -dpf $(ZLIB_DIR)/zlib.h $(STAGING_DIR)/usr/include/
+	cp -dpf $(ZLIB_DIR)/zconf.h $(STAGING_DIR)/usr/include/
+	cp -dpf $(ZLIB_DIR)/libz.so* $(STAGING_DIR)/usr/lib/
+	ln -sf libz.so.$(ZLIB_VER) $(STAGING_DIR)/usr/lib/libz.so.1
+	chmod a-x $(STAGING_DIR)/usr/lib/libz.so.$(ZLIB_VER)
+	touch -c $@
 
-$(TARGET_DIR)/lib/libz.so.$(ZLIB_VER): $(STAGING_DIR)/lib/libz.so.$(ZLIB_VER)
-	cp -dpf $(STAGING_DIR)/lib/libz.so* $(TARGET_DIR)/lib;
-	-$(STRIP) --strip-unneeded $(TARGET_DIR)/lib/libz.so*
-	touch -c $(TARGET_DIR)/lib/libz.so.$(ZLIB_VER)
+$(TARGET_DIR)/usr/lib/libz.so.$(ZLIB_VER): $(STAGING_DIR)/usr/lib/libz.so.$(ZLIB_VER)
+	cp -dpf $(STAGING_DIR)/usr/lib/libz.so* $(TARGET_DIR)/usr/lib
+	-$(STRIP) --strip-unneeded $(TARGET_DIR)/usr/lib/libz.so*
+	touch -c $@
 
-$(TARGET_DIR)/usr/lib/libz.a: $(STAGING_DIR)/lib/libz.so.$(ZLIB_VER)
+$(TARGET_DIR)/usr/lib/libz.a: $(STAGING_DIR)/usr/lib/libz.so.$(ZLIB_VER)
 	mkdir -p $(TARGET_DIR)/usr/include
-	cp -dpf $(STAGING_DIR)/include/zlib.h $(TARGET_DIR)/usr/include/
-	cp -dpf $(STAGING_DIR)/include/zconf.h $(TARGET_DIR)/usr/include/
-	cp -dpf $(STAGING_DIR)/lib/libz.a $(TARGET_DIR)/usr/lib/
+	cp -dpf $(STAGING_DIR)/usr/include/zlib.h $(TARGET_DIR)/usr/include/
+	cp -dpf $(STAGING_DIR)/usr/include/zconf.h $(TARGET_DIR)/usr/include/
+	cp -dpf $(STAGING_DIR)/usr/lib/libz.a $(TARGET_DIR)/usr/lib/
 	rm -f $(TARGET_DIR)/lib/libz.so
-	(cd $(TARGET_DIR)/usr/lib; ln -fs ../../lib/libz.so.$(ZLIB_VER) libz.so)
-	touch -c $(TARGET_DIR)/usr/lib/libz.a
+	ln -sf libz.so.$(ZLIB_VER) $(TARGET_DIR)/usr/lib/libz.so
+	touch -c $@
 
 zlib-headers: $(TARGET_DIR)/usr/lib/libz.a
 
-zlib: uclibc $(TARGET_DIR)/lib/libz.so.$(ZLIB_VER)
+zlib: uclibc $(TARGET_DIR)/usr/lib/libz.so.$(ZLIB_VER)
 
 zlib-source: $(DL_DIR)/$(ZLIB_SOURCE)
 
 zlib-clean:
-	rm -f $(TARGET_DIR)/lib/libz.so*
+	rm -f $(TARGET_DIR)/usr/lib/libz.so* \
+		$(TARGET_DIR)/usr/include/z{lib,conf}.h
 	-$(MAKE) -C $(ZLIB_DIR) clean
 
 zlib-dirclean:
