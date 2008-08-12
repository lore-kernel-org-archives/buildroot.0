From: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>
Date: Tue, 12 Aug 2008 14:03:31 +0200
Subject: [Buildroot] [PATCH v2 1/1] openssl: convert to
	Makefile.autotools.in and bump version to 0.9.8g
Message-ID: <1218542611-21908-1-git-send-email-hans-christian.egtvedt@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch converts building of OpenSSL to use Makefile.autotools.in and bumps
the version to 0.9.8g. The patches are updated to reflect this version upgrade.
A architecture specific patch for AVR32 is also introduced which optimizes DES
and AES by using assembler.

Signed-off-by: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>
---
I stripped out the rather large AVR32 optimization patch, that patch can be
grabbed from
http://www.atmel.no/~hcegtvedt/patches/openssl-0.9.8g-avr32-asm-optimizations.patch.avr32

 package/openssl/Config.in                          |   16 +-
 package/openssl/openssl-0.9.7m.patch.avr32         |   11 -
 ...enssl-0.9.8g-add-avr32-to-configure.patch.avr32 |   12 +
 .../openssl/openssl-0.9.8g-do-not-build-docs.patch |   13 +
 package/openssl/openssl-nodocs.patch               |   13 -
 package/openssl/openssl.mk                         |  124 +-
 package/openssl/openssl.patch                      |  250 -
 8 files changed, 6374 insertions(+), 366 deletions(-)
 delete mode 100644 package/openssl/openssl-0.9.7m.patch.avr32
 create mode 100644 package/openssl/openssl-0.9.8g-add-avr32-to-configure.patch.avr32
 create mode 100644 package/openssl/openssl-0.9.8g-do-not-build-docs.patch
 delete mode 100644 package/openssl/openssl-nodocs.patch
 delete mode 100644 package/openssl/openssl.patch

diff --git a/package/openssl/Config.in b/package/openssl/Config.in
index f5a82ad..bc8dc74 100644
--- a/package/openssl/Config.in
+++ b/package/openssl/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_OPENSSL
 	bool "openssl"
+	select BR2_PACKAGE_ZLIB
 	help
 	  A collaborative effort to develop a robust, commercial-grade, fully 
 	  featured, and Open Source toolkit implementing the Secure Sockets 
@@ -8,8 +9,17 @@ config BR2_PACKAGE_OPENSSL
 
 	  http://www.openssl.org/
 
-config BR2_PACKAGE_OPENSSL_TARGET_HEADERS
-	bool "openssl headers in target"
+config BR2_PACKAGE_OPENSSL_BIN
+	bool "openssl binary"
 	depends on BR2_PACKAGE_OPENSSL
+	default no
 	help
-	  Put openssl headers in the target.
+	  Install the openssl binary to the target file system. This is a
+	  command line tool for doing various crypthographic stuff.
+
+config BR2_PACKAGE_OPENSSL_ENGINES
+	bool "openssl additional engines"
+	depends on BR2_PACKAGE_OPENSSL
+	default no
+	help 
+	  Install additional encryption engine libraries.
diff --git a/package/openssl/openssl-0.9.7m.patch.avr32 b/package/openssl/openssl-0.9.7m.patch.avr32
deleted file mode 100644
index 20dc1fc..0000000
--- a/package/openssl/openssl-0.9.7m.patch.avr32
+++ /dev/null
@@ -1,11 +0,0 @@
-diff -urN openssl-0.9.7m-0rig/Configure openssl-0.9.7m/Configure
---- openssl-0.9.7m-0rig/Configure	2008-07-05 08:59:46.000000000 +0200
-+++ openssl-0.9.7m/Configure	2008-07-05 09:05:10.000000000 +0200
-@@ -396,6 +396,7 @@
- "linux-alpha-ev5","gcc:-DTERMIO -O3 -mcpu=ev5 -fomit-frame-pointer -Wall::-D_REENTRANT::-ldl:SIXTY_FOUR_BIT_LONG RC4_CHUNK DES_RISC1 DES_UNROLL:${alpha_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
- "linux-arm","gcc:-DL_ENDIAN -DTERMIO -O3 -fomit-frame-pointer -Wall::-D_REENTRANT::-ldl:BN_LLONG DES_RISC1::::::::::dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
- "linux-armeb","gcc:-DB_ENDIAN -DTERMIO -O3 -fomit-frame-pointer -Wall::-D_REENTRANT::-ldl:BN_LLONG DES_RISC1::::::::::dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
-+"linux-avr32","gcc:-DTERMIO -O3 -fomit-frame-pointer -Wall::-D_REENTRANT::-ldl:BN_LLONG DES_RISC1::::::::::dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
- "linux-freebsd-alpha","gcc:-DTERMIOS -O -fomit-frame-pointer::(unknown):::SIXTY_FOUR_BIT_LONG RC4_CHUNK DES_INT DES_PTR DES_RISC2::::::::::dlfcn:bsd-gcc-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
- "linux-freebsd-i386",  "gcc:-DTERMIOS -DL_ENDIAN -fomit-frame-pointer -O3 -m486 -Wall::-pthread -D_REENTRANT -D_THREAD_SAFE -D_THREADSAFE:::BN_LLONG ${x86_gcc_des} ${x86_gcc_opts}:${x86_elf_asm}:dlfcn:bsd-gcc-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
- "linux-hppa","gcc:-DB_ENDIAN -DTERMIO -O2 -Wall::-D_REENTRANT::-ldl:BN_LLONG MD2_CHAR RC4_INDEX::::::::::dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
diff --git a/package/openssl/openssl-0.9.8g-add-avr32-to-configure.patch.avr32 b/package/openssl/openssl-0.9.8g-add-avr32-to-configure.patch.avr32
new file mode 100644
index 0000000..f983aa7
--- /dev/null
+++ b/package/openssl/openssl-0.9.8g-add-avr32-to-configure.patch.avr32
@@ -0,0 +1,12 @@
+Index: openssl-0.9.8g/Configure
+===================================================================
+--- openssl-0.9.8g.orig/Configure	2008-08-08 13:33:59.000000000 +0200
++++ openssl-0.9.8g/Configure	2008-08-08 13:36:29.000000000 +0200
+@@ -322,6 +322,7 @@
+ "linux-ia32-icc",	"icc:-DL_ENDIAN -DTERMIO -O2 -no_cpprt::-D_REENTRANT::-ldl:BN_LLONG ${x86_gcc_des} ${x86_gcc_opts}:${x86_elf_asm}:dlfcn:linux-shared:-KPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
+ "linux-elf",	"gcc:-DL_ENDIAN -DTERMIO -O3 -fomit-frame-pointer -Wall::-D_REENTRANT::-ldl:BN_LLONG ${x86_gcc_des} ${x86_gcc_opts}:${x86_elf_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
+ "linux-aout",	"gcc:-DL_ENDIAN -DTERMIO -O3 -fomit-frame-pointer -march=i486 -Wall::(unknown):::BN_LLONG ${x86_gcc_des} ${x86_gcc_opts}:${x86_out_asm}",
++"linux-avr32",	"avr32-linux-gcc:-DB_ENDIAN -DTERMIO -O3 -fomit-frame-pointer -Wall::-D_REENTRANT::-ldl:BN_LLONG BF_PTR:${avr32_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
+ ####
+ "linux-generic64","gcc:-DTERMIO -O3 -Wall::-D_REENTRANT::-ldl:SIXTY_FOUR_BIT_LONG RC4_CHAR RC4_CHUNK DES_INT DES_UNROLL BF_PTR:${no_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
+ "linux-ppc64",	"gcc:-m64 -DB_ENDIAN -DTERMIO -O3 -Wall::-D_REENTRANT::-ldl:SIXTY_FOUR_BIT_LONG RC4_CHAR RC4_CHUNK DES_RISC1 DES_UNROLL::linux_ppc64.o::::::::::dlfcn:linux-shared:-fPIC:-m64:.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
diff --git a/package/openssl/openssl-0.9.8g-do-not-build-docs.patch b/package/openssl/openssl-0.9.8g-do-not-build-docs.patch
new file mode 100644
index 0000000..135a9d3
--- /dev/null
+++ b/package/openssl/openssl-0.9.8g-do-not-build-docs.patch
@@ -0,0 +1,13 @@
+Dont waste time building manpages if we're not going to use em.
+
+--- openssl/Makefile.org
++++ openssl/Makefile.org
+@@ -792,7 +792,7 @@
+ dist_pem_h:
+ 	(cd crypto/pem; $(MAKE) CC='${CC}' SDIRS='${SDIRS}' CFLAG='${CFLAG}' pem.h; $(MAKE) clean)
+ 
+-install: all install_docs install_sw
++install: all install_sw
+ 
+ install_sw:
+ 	@$(PERL) $(TOP)/util/mkdir-p.pl $(INSTALL_PREFIX)$(INSTALLTOP)/bin \
diff --git a/package/openssl/openssl-nodocs.patch b/package/openssl/openssl-nodocs.patch
deleted file mode 100644
index 135a9d3..0000000
--- a/package/openssl/openssl-nodocs.patch
+++ /dev/null
@@ -1,13 +0,0 @@
-Dont waste time building manpages if we're not going to use em.
-
---- openssl/Makefile.org
-+++ openssl/Makefile.org
-@@ -792,7 +792,7 @@
- dist_pem_h:
- 	(cd crypto/pem; $(MAKE) CC='${CC}' SDIRS='${SDIRS}' CFLAG='${CFLAG}' pem.h; $(MAKE) clean)
- 
--install: all install_docs install_sw
-+install: all install_sw
- 
- install_sw:
- 	@$(PERL) $(TOP)/util/mkdir-p.pl $(INSTALL_PREFIX)$(INSTALLTOP)/bin \
diff --git a/package/openssl/openssl.mk b/package/openssl/openssl.mk
index 01cddb9..14ae03f 100644
--- a/package/openssl/openssl.mk
+++ b/package/openssl/openssl.mk
@@ -3,13 +3,8 @@
 # openssl
 #
 #############################################################
-
-# TARGETS
-OPENSSL_VERSION:=0.9.7m
+OPENSSL_VERSION:=0.9.8g
 OPENSSL_SITE:=http://www.openssl.org/source
-OPENSSL_SOURCE:=openssl-$(OPENSSL_VERSION).tar.gz
-OPENSSL_CAT:=$(ZCAT)
-OPENSSL_DIR:=$(BUILD_DIR)/openssl-$(OPENSSL_VERSION)
 
 OPENSSL_TARGET_ARCH:=
 ifeq ($(BR2_i386),y)
@@ -24,95 +19,46 @@ ifeq ($(OPENSSL_TARGET_ARCH),)
 OPENSSL_TARGET_ARCH:=$(ARCH)
 endif
 
-$(DL_DIR)/$(OPENSSL_SOURCE):
-	$(WGET) -P $(DL_DIR) $(OPENSSL_SITE)/$(OPENSSL_SOURCE)
-
-openssl-unpack: $(OPENSSL_DIR)/.unpacked
-$(OPENSSL_DIR)/.unpacked: $(DL_DIR)/$(OPENSSL_SOURCE)
-	$(OPENSSL_CAT) $(DL_DIR)/$(OPENSSL_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(OPENSSL_DIR) package/openssl/ openssl\*.patch
-	toolchain/patch-kernel.sh $(OPENSSL_DIR) package/openssl/ openssl\*.patch.$(ARCH)
-	# sigh... we have to resort to this just to set a gcc flag.
-	# grumble.. and of course make sure to escape any '/' in CFLAGS
-ifeq ($(BR2_avr32),)
-	$(SED) 's,/CFLAG=,/CFLAG= $(TARGET_SOFT_FLOAT) ,g' \
-		$(OPENSSL_DIR)/Configure
-endif
-	$(SED) '/CFLAG=/s,/;, $(shell echo '$(TARGET_CFLAGS)' | sed -e 's/\//\\\\\//g')/;,' \
-		$(OPENSSL_DIR)/Configure
-	touch $@
+OPENSSL_INSTALL_STAGING = YES
+OPENSSL_INSTALL_STAGING_OPT = INSTALL_PREFIX=$(STAGING_DIR) install
 
-$(OPENSSL_DIR)/Makefile: $(OPENSSL_DIR)/.unpacked
-	(cd $(OPENSSL_DIR); \
-	CFLAGS="-DOPENSSL_NO_KRB5 -DOPENSSL_NO_IDEA -DOPENSSL_NO_MDC2 -DOPENSSL_NO_RC5 $(TARGET_CFLAGS)" \
-	PATH=$(TARGET_PATH) \
-	./Configure linux-$(OPENSSL_TARGET_ARCH) --prefix=/ \
-		--openssldir=/lib/ssl -L$(STAGING_DIR)/lib -ldl \
-		-I$(STAGING_DIR)/usr/include $(OPENSSL_OPTS) threads \
-		shared no-idea no-mdc2 no-rc5)
+OPENSSL_INSTALL_TARGET_OPT = INSTALL_PREFIX=$(TARGET_DIR) install
 
-# --openssldir=/usr/lib/ssl results in files in /usr/usr/lib...
+OPENSSL_DEPENDENCIES = zlib
 
-$(OPENSSL_DIR)/apps/openssl: $(OPENSSL_DIR)/Makefile
-	$(MAKE1) CC=$(TARGET_CC) -C $(OPENSSL_DIR) all build-shared
-	# Work around openssl build bug to link libssl.so with libcrypto.so.
-	-rm $(OPENSSL_DIR)/libssl.so.*.*.*
-	$(MAKE1) CC=$(TARGET_CC) -C $(OPENSSL_DIR) do_linux-shared
+$(eval $(call AUTOTARGETS,package,openssl))
 
-$(STAGING_DIR)/usr/lib/libcrypto.a: $(OPENSSL_DIR)/apps/openssl
-	$(MAKE) CC=$(TARGET_CC) INSTALL_PREFIX=$(STAGING_DIR)/usr -C $(OPENSSL_DIR) install
-	cp -fa $(OPENSSL_DIR)/libcrypto.so* $(STAGING_DIR)/usr/lib/
-	chmod a-x $(STAGING_DIR)/usr/lib/libcrypto.so.0.9.7
-	(cd $(STAGING_DIR)/usr/lib; \
-	 ln -fs libcrypto.so.0.9.7 libcrypto.so; \
-	 ln -fs libcrypto.so.0.9.7 libcrypto.so.0; \
-	)
-	cp -fa $(OPENSSL_DIR)/libssl.so* $(STAGING_DIR)/usr/lib/
-	chmod a-x $(STAGING_DIR)/usr/lib/libssl.so.0.9.7
-	(cd $(STAGING_DIR)/usr/lib; \
-	 ln -fs libssl.so.0.9.7 libssl.so; \
-	 ln -fs libssl.so.0.9.7 libssl.so.0; \
+$(OPENSSL_TARGET_CONFIGURE):
+	(cd $(OPENSSL_DIR); \
+		$(TARGET_CONFIGURE_ARGS) \
+		$(TARGET_CONFIGURE_OPTS) \
+		./Configure \
+			linux-$(OPENSSL_TARGET_ARCH) \
+			--prefix=/usr \
+			--openssldir=/usr/lib/ssl \
+			threads \
+			shared \
+			no-idea \
+			no-mdc2 \
+			no-rc5 \
+			zlib-dynamic \
 	)
-	touch -c $@
-
-$(TARGET_DIR)/usr/lib/libcrypto.so.0.9.7: $(STAGING_DIR)/usr/lib/libcrypto.a
-	mkdir -p $(TARGET_DIR)/usr/lib
-	cp -fa $(STAGING_DIR)/usr/lib/libcrypto.so* $(TARGET_DIR)/usr/lib/
-	cp -fa $(STAGING_DIR)/usr/lib/libssl.so* $(TARGET_DIR)/usr/lib/
-	#cp -fa $(STAGING_DIR)/bin/openssl $(TARGET_DIR)/bin/
-	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libssl.so.0.9.7
-	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libcrypto.so.0.9.7
-
-$(TARGET_DIR)/usr/lib/libssl.a: $(STAGING_DIR)/usr/lib/libcrypto.a
-	mkdir -p $(TARGET_DIR)/usr/include
-	cp -a $(STAGING_DIR)/usr/include/openssl $(TARGET_DIR)/usr/include/
-	cp -dpf $(STAGING_DIR)/usr/lib/libssl.a $(TARGET_DIR)/usr/lib/
-	cp -dpf $(STAGING_DIR)/usr/lib/libcrypto.a $(TARGET_DIR)/usr/lib/
-	touch -c $@
-
-openssl-headers: $(TARGET_DIR)/usr/lib/libssl.a
-
-openssl: uclibc $(TARGET_DIR)/usr/lib/libcrypto.so.0.9.7
-
-openssl-source: $(DL_DIR)/$(OPENSSL_SOURCE)
+	touch $@
 
-openssl-clean:
-	-$(MAKE) -C $(OPENSSL_DIR) clean
-	rm -f $(STAGING_DIR)/usr/bin/openssl $(TARGET_DIR)/usr/bin/openssl
-	-rm -f $(STAGING_DIR)/usr/lib/libcrypto.so* $(TARGET_DIR)/usr/lib/libcrypto.so*
-	-rm -f $(STAGING_DIR)/usr/lib/libssl.so* $(TARGET_DIR)/usr/lib/libssl.so*
-	rm -rf $(STAGING_DIR)/usr/include/openssl $(TARGET_DIR)/usr/include/openssl
+$(OPENSSL_TARGET_BUILD):
+	$(MAKE1) CC=$(TARGET_CC) -C $(OPENSSL_DIR) all build-shared
+	$(MAKE1) CC=$(TARGET_CC) -C $(OPENSSL_DIR) do_linux-shared
+	touch $@
 
-openssl-dirclean:
-	rm -rf $(OPENSSL_DIR)
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(strip $(BR2_PACKAGE_OPENSSL)),y)
-TARGETS+=openssl
+$(OPENSSL_HOOK_POST_INSTALL):
+	$(if $(BR2_HAVE_INCLUDES),,rm -rf $(TARGET_DIR)/usr/lib/ssl)
+ifeq ($(BR2_PACKAGE_OPENSSL_BIN),y)
+	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/bin/openssl
+else
+	rm -f $(TARGET_DIR)/usr/bin/c_rehash
+	rm -f $(TARGET_DIR)/usr/bin/openssl
 endif
-ifeq ($(strip $(BR2_PACKAGE_OPENSSL_TARGET_HEADERS)),y)
-TARGETS+=openssl-headers
+ifneq ($(BR2_PACKAGE_OPENSSL_ENGINES),y)
+	rm -rf $(TARGET_DIR)/usr/lib/engines
 endif
+	touch $@
diff --git a/package/openssl/openssl.patch b/package/openssl/openssl.patch
deleted file mode 100644
index 7a35632..0000000
--- a/package/openssl/openssl.patch
+++ /dev/null
@@ -1,250 +0,0 @@
-diff -ruN openssl-0.9.7m.orig/Configure openssl-0.9.7m/Configure
---- openssl-0.9.7m.orig/Configure	2007-02-22 17:30:49.000000000 -0500
-+++ openssl-0.9.7m/Configure	2007-07-23 21:10:15.000000000 -0400
-@@ -1,4 +1,4 @@
--:
-+#!/usr/bin/perl
- eval 'exec perl -S $0 ${1+"$@"}'
-     if $running_under_some_shell;
- ##
-@@ -390,6 +390,41 @@
- # assembler versions -- currently defunct:
- ##"OpenBSD-alpha","gcc:-DTERMIOS -O3 -fomit-frame-pointer:::(unknown):SIXTY_FOUR_BIT_LONG DES_INT DES_PTR DES_RISC2:${alpha_asm}",
- 
-+# Sane Linux configuration values, stolen from the Debian package....
-+"linux-alpha","gcc:-DTERMIO -O3 -fomit-frame-pointer -Wall::-D_REENTRANT::-ldl:SIXTY_FOUR_BIT_LONG RC4_CHUNK DES_RISC1 DES_UNROLL:${alpha_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
-+"linux-alpha-ev4","gcc:-DTERMIO -O3 -mcpu=ev4 -fomit-frame-pointer -Wall::-D_REENTRANT::-ldl:SIXTY_FOUR_BIT_LONG RC4_CHUNK DES_RISC1 DES_UNROLL:${alpha_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
-+"linux-alpha-ev5","gcc:-DTERMIO -O3 -mcpu=ev5 -fomit-frame-pointer -Wall::-D_REENTRANT::-ldl:SIXTY_FOUR_BIT_LONG RC4_CHUNK DES_RISC1 DES_UNROLL:${alpha_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
-+"linux-arm","gcc:-DL_ENDIAN -DTERMIO -O3 -fomit-frame-pointer -Wall::-D_REENTRANT::-ldl:BN_LLONG DES_RISC1::::::::::dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
-+"linux-armeb","gcc:-DB_ENDIAN -DTERMIO -O3 -fomit-frame-pointer -Wall::-D_REENTRANT::-ldl:BN_LLONG DES_RISC1::::::::::dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
-+"linux-freebsd-alpha","gcc:-DTERMIOS -O -fomit-frame-pointer::(unknown):::SIXTY_FOUR_BIT_LONG RC4_CHUNK DES_INT DES_PTR DES_RISC2::::::::::dlfcn:bsd-gcc-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
-+"linux-freebsd-i386",  "gcc:-DTERMIOS -DL_ENDIAN -fomit-frame-pointer -O3 -m486 -Wall::-pthread -D_REENTRANT -D_THREAD_SAFE -D_THREADSAFE:::BN_LLONG ${x86_gcc_des} ${x86_gcc_opts}:${x86_elf_asm}:dlfcn:bsd-gcc-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
-+"linux-hppa","gcc:-DB_ENDIAN -DTERMIO -O2 -Wall::-D_REENTRANT::-ldl:BN_LLONG MD2_CHAR RC4_INDEX::::::::::dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
-+"linux-hurd-i386","gcc:-DL_ENDIAN -DTERMIOS -O3 -fomit-frame-pointer -m486 -Wall::-D_REENTRANT::-ldl:BN_LLONG ${x86_gcc_des} ${x86_gcc_opts}:${x86_elf_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
-+"linux-ia64","gcc:-DTERMIO -O3 -fomit-frame-pointer -Wall::-D_REENTRANT::-ldl:SIXTY_FOUR_BIT_LONG RC4_CHUNK RC4_CHAR:asm/ia64.o:::::::::dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
-+#"linux-i386","gcc:-DL_ENDIAN -DTERMIO -O3 -fomit-frame-pointer -m486 -Wall::-D_REENTRANT::-ldl:BN_LLONG ${x86_gcc_des} ${x86_gcc_opts}::::::::::dlfcn:linux-shared:-fPIC",
-+"linux-i386","gcc:-DL_ENDIAN -DTERMIO -O3 -fomit-frame-pointer -Wall::-D_REENTRANT::-ldl:BN_LLONG ${x86_gcc_des} ${x86_gcc_opts}::::::::::dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
-+"linux-i386-i486","gcc:-DL_ENDIAN -DTERMIO -O3 -march=i486 -mcpu=i486 -fomit-frame-pointer -Wall::-D_REENTRANT::-ldl:BN_LLONG ${x86_gcc_des} ${x86_gcc_opts}:${x86_elf_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
-+"linux-i386-i586","gcc:-DL_ENDIAN -DTERMIO -O3 -march=i586 -mcpu=i586 -fomit-frame-pointer -Wall::-D_REENTRANT::-ldl:BN_LLONG ${x86_gcc_des} ${x86_gcc_opts}:${x86_elf_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
-+"linux-i386-i686/cmov","gcc:-DL_ENDIAN -DTERMIO -O3 -march=i686 -mcpu=i686 -fomit-frame-pointer -Wall::-D_REENTRANT::-ldl:BN_LLONG ${x86_gcc_des} ${x86_gcc_opts}:${x86_elf_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
-+"linux-m68k","gcc:-DB_ENDIAN -DTERMIO -O2 -Wall::-D_REENTRANT::-ldl:BN_LLONG MD2_CHAR RC4_INDEX::::::::::dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
-+"linux-mips",   "gcc:-DB_ENDIAN -DTERMIO -O3 -fomit-frame-pointer -Wall::-D_REENTRANT::-ldl:BN_LLONG::::::::::dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
-+"linux-mipsel",   "gcc:-DL_ENDIAN -DTERMIO -O3 -fomit-frame-pointer -Wall::-D_REENTRANT::-ldl:BN_LLONG::::::::::dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
-+"linux-netbsd-i386",	"gcc:-DL_ENDIAN -DTERMIOS -O3 -fomit-frame-pointer -m486 -Wall::(unknown):::BN_LLONG ${x86_gcc_des} ${x86_gcc_opts}::::::::::dlfcn:bsd-gcc-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
-+"linux-netbsd-m68k",	"gcc:-DB_ENDIAN -DTERMIOS -O3 -fomit-frame-pointer -Wall::(unknown):::BN_LLONG MD2_CHAR RC4_INDEX DES_UNROLL::::::::::dlfcn:bsd-gcc-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
-+"linux-netbsd-sparc",	"gcc:-DB_ENDIAN -DTERMIOS -O3 -fomit-frame-pointer -mv8 -Wall::(unknown):::BN_LLONG MD2_CHAR RC4_INDEX DES_UNROLL::::::::::dlfcn:bsd-gcc-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
-+"linux-openbsd-alpha","gcc:-DTERMIOS -O3 -fomit-frame-pointer::(unknown):::SIXTY_FOUR_BIT_LONG DES_INT DES_PTR DES_RISC2::::::::::dlfcn:bsd-gcc-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
-+"linux-openbsd-i386",  "gcc:-DL_ENDIAN -DTERMIOS -O3 -fomit-frame-pointer -m486::(unknown):::BN_LLONG ${x86_gcc_des} ${x86_gcc_opts}:${x86_out_asm}:dlfcn:bsd-gcc-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
-+"linux-openbsd-mips","gcc:-O2 -DL_ENDIAN::(unknown)::BN_LLONG MD2_CHAR RC4_INDEX RC4_CHAR DES_UNROLL DES_RISC2 DES_PTR BF_PTR:::::::::::dlfcn:bsd-gcc-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
-+"linux-powerpc","gcc:-DB_ENDIAN -DTERMIO -O3 -fomit-frame-pointer -Wall::-D_REENTRANT::-ldl:BN_LLONG DES_UNROLL DES_RISC2 DES_PTR MD2_CHAR RC4_INDEX::::::::::dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
-+"linux-s390","gcc:-DB_ENDIAN -DTERMIO -O3 -fomit-frame-pointer -Wall::-D_REENTRANT::-ldl:BN_LLONG::::::::::dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)", 
-+"linux-sh3",   "gcc:-DL_ENDIAN -DTERMIO -O3 -fomit-frame-pointer -Wall::-D_REENTRANT::-ldl:BN_LLONG::::::::::dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
-+"linux-sh4",   "gcc:-DL_ENDIAN -DTERMIO -O3 -fomit-frame-pointer -Wall::-D_REENTRANT::-ldl:BN_LLONG::::::::::dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
-+"linux-sh3eb",   "gcc:-DB_ENDIAN -DTERMIO -O3 -fomit-frame-pointer -Wall::-D_REENTRANT::-ldl:BN_LLONG::::::::::dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
-+"linux-sh4eb",   "gcc:-DB_ENDIAN -DTERMIO -O3 -fomit-frame-pointer -Wall::-D_REENTRANT::-ldl:BN_LLONG::::::::::dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
-+"linux-sparc","gcc:-DB_ENDIAN -DTERMIO -O3 -fomit-frame-pointer -Wall::-D_REENTRANT::-ldl:BN_LLONG RC4_CHAR RC4_CHUNK DES_UNROLL BF_PTR::::::::::dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
-+"linux-sparc-v8","gcc:-DB_ENDIAN -DTERMIO -O3 -mcpu=v8 -fomit-frame-pointer -Wall -DBN_DIV2W::-D_REENTRANT::-ldl:BN_LLONG RC4_CHAR RC4_CHUNK DES_UNROLL BF_PTR:asm/sparcv8.o:::::::::dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
-+"linux-sparc-v9","gcc:-DB_ENDIAN -DTERMIO -O3 -mcpu=v9 -Wa,-Av8plus -fomit-frame-pointer -Wall -DULTRASPARC -DBN_DIV2W::-D_REENTRANT::-ldl:BN_LLONG RC4_CHAR RC4_CHUNK DES_UNROLL BF_PTR:asm/sparcv8plus.o:::asm/md5-sparcv8plus.o::::::dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
-+"linux-cris",	"gcc:-DL_ENDIAN -DTERMIO -O3 -fomit-frame-pointer -Wall::-D_REENTRANT::-ldl:BN_LLONG::::::::::dlfcn:linux-shared:-fpic::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
- # The intel boxes :-), It would be worth seeing if bsdi-gcc can use the
- # bn86-elf.o file file since it is hand tweaked assembler.
- "linux-elf",	"gcc:-DL_ENDIAN -DTERMIO -O3 -fomit-frame-pointer -m486 -Wall::-D_REENTRANT::-ldl:BN_LLONG ${x86_gcc_des} ${x86_gcc_opts}:${x86_elf_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
-@@ -437,6 +472,7 @@
- # ARM comes in both little- and big-endian flavors. The following line is
- # endian neutral, but ./config is free to throw in -D[BL]_ENDIAN...
- "linux-elf-arm","gcc:-DTERMIO -O3 -fomit-frame-pointer -Wall::-D_REENTRANT::-ldl:BN_LLONG::::::::::dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
-+"linux-elf-armeb","gcc:-DB_ENDIAN -DTERMIO -O3 -fomit-frame-pointer -Wall::-D_REENTRANT::-ldl:BN_LLONG::::::::::dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
- 
- # SCO/Caldera targets.
- #
-diff -ruN openssl-0.9.7m.orig/crypto/md5/asm/md5-sparcv9.S openssl-0.9.7m/crypto/md5/asm/md5-sparcv9.S
---- openssl-0.9.7m.orig/crypto/md5/asm/md5-sparcv9.S	2003-05-29 18:22:34.000000000 -0400
-+++ openssl-0.9.7m/crypto/md5/asm/md5-sparcv9.S	2007-07-23 21:09:34.000000000 -0400
-@@ -74,14 +74,14 @@
- #define Dval	R8
- 
- #if defined(MD5_BLOCK_DATA_ORDER)
--# if defined(OPENSSL_SYSNAME_ULTRASPARC)
-+/*# if defined(OPENSSL_SYSNAME_ULTRASPARC)*/
- #  define	LOAD			lda
- #  define	X(i)			[%i1+i*4]%asi
- #  define	md5_block		md5_block_asm_data_order_aligned
- #  define	ASI_PRIMARY_LITTLE	0x88
--# else
-+/*# else
- #  error "MD5_BLOCK_DATA_ORDER is supported only on UltraSPARC!"
--# endif
-+# endif*/
- #else
- # define	LOAD			ld
- # define	X(i)			[%i1+i*4]
-diff -ruN openssl-0.9.7m.orig/include/openssl/opensslconf.h openssl-0.9.7m/include/openssl/opensslconf.h
---- openssl-0.9.7m.orig/include/openssl/opensslconf.h	2007-02-23 07:52:32.000000000 -0500
-+++ openssl-0.9.7m/include/openssl/opensslconf.h	2007-07-23 21:09:34.000000000 -0400
-@@ -4,17 +4,38 @@
- /* OpenSSL was configured with the following options: */
- #ifndef OPENSSL_DOING_MAKEDEPEND
- 
-+#ifndef OPENSSL_NO_IDEA
-+# define OPENSSL_NO_IDEA
-+#endif
-+#ifndef OPENSSL_NO_MDC2
-+# define OPENSSL_NO_MDC2
-+#endif
-+#ifndef OPENSSL_NO_RC5
-+# define OPENSSL_NO_RC5
-+#endif
- #ifndef OPENSSL_NO_KRB5
- # define OPENSSL_NO_KRB5
- #endif
- 
- #endif /* OPENSSL_DOING_MAKEDEPEND */
-+#ifndef OPENSSL_THREADS
-+# define OPENSSL_THREADS
-+#endif
- 
- /* The OPENSSL_NO_* macros are also defined as NO_* if the application
-    asks for it.  This is a transient feature that is provided for those
-    who haven't had the time to do the appropriate changes in their
-    applications.  */
- #ifdef OPENSSL_ALGORITHM_DEFINES
-+# if defined(OPENSSL_NO_IDEA) && !defined(NO_IDEA)
-+#  define NO_IDEA
-+# endif
-+# if defined(OPENSSL_NO_MDC2) && !defined(NO_MDC2)
-+#  define NO_MDC2
-+# endif
-+# if defined(OPENSSL_NO_RC5) && !defined(NO_RC5)
-+#  define NO_RC5
-+# endif
- # if defined(OPENSSL_NO_KRB5) && !defined(NO_KRB5)
- #  define NO_KRB5
- # endif
-@@ -27,7 +48,7 @@
- 
- #if !(defined(VMS) || defined(__VMS)) /* VMS uses logical names instead */
- #if defined(HEADER_CRYPTLIB_H) && !defined(OPENSSLDIR)
--#define OPENSSLDIR "/usr/local/ssl"
-+#define OPENSSLDIR "/usr/lib/ssl"
- #endif
- #endif
- 
-@@ -79,7 +100,7 @@
- 
- #if defined(HEADER_BN_H) && !defined(CONFIG_HEADER_BN_H)
- #define CONFIG_HEADER_BN_H
--#undef BN_LLONG
-+#define BN_LLONG
- 
- /* Should we define BN_DIV2W here? */
- 
-@@ -98,7 +119,7 @@
- #define CONFIG_HEADER_RC4_LOCL_H
- /* if this is defined data[i] is used instead of *data, this is a %20
-  * speedup on x86 */
--#undef RC4_INDEX
-+#define RC4_INDEX
- #endif
- 
- #if defined(HEADER_BF_LOCL_H) && !defined(CONFIG_HEADER_BF_LOCL_H)
-@@ -112,14 +133,14 @@
- /* the following is tweaked from a config script, that is why it is a
-  * protected undef/define */
- #ifndef DES_PTR
--#undef DES_PTR
-+#define DES_PTR
- #endif
- 
- /* This helps C compiler generate the correct code for multiple functional
-  * units.  It reduces register dependancies at the expense of 2 more
-  * registers */
- #ifndef DES_RISC1
--#undef DES_RISC1
-+#define DES_RISC1
- #endif
- 
- #ifndef DES_RISC2
-@@ -133,7 +154,7 @@
- /* Unroll the inner loop, this sometimes helps, sometimes hinders.
-  * Very mucy CPU dependant */
- #ifndef DES_UNROLL
--#undef DES_UNROLL
-+#define DES_UNROLL
- #endif
- 
- /* These default values were supplied by
-diff -ruN openssl-0.9.7m.orig/ssl/ssl_algs.c openssl-0.9.7m/ssl/ssl_algs.c
---- openssl-0.9.7m.orig/ssl/ssl_algs.c	2001-02-20 03:11:58.000000000 -0500
-+++ openssl-0.9.7m/ssl/ssl_algs.c	2007-07-23 21:09:34.000000000 -0400
-@@ -109,3 +109,8 @@
- 	return(1);
- 	}
- 
-+#undef SSLeay_add_ssl_algorithms
-+int SSLeay_add_ssl_algorithms(void)
-+    {
-+         return SSL_library_init();
-+    }
-diff -ruN openssl-0.9.7m.orig/tools/c_rehash.in openssl-0.9.7m/tools/c_rehash.in
---- openssl-0.9.7m.orig/tools/c_rehash.in	2002-10-11 16:35:45.000000000 -0400
-+++ openssl-0.9.7m/tools/c_rehash.in	2007-07-23 21:09:34.000000000 -0400
-@@ -1,4 +1,4 @@
--#!/usr/local/bin/perl
-+#!/usr/bin/perl
- 
- 
- # Perl c_rehash script, scan all files in a directory
-diff -ruN openssl-0.9.7m.orig/util/clean-depend.pl openssl-0.9.7m/util/clean-depend.pl
---- openssl-0.9.7m.orig/util/clean-depend.pl	2001-10-10 04:27:28.000000000 -0400
-+++ openssl-0.9.7m/util/clean-depend.pl	2007-07-23 21:09:34.000000000 -0400
-@@ -1,4 +1,4 @@
--#!/usr/local/bin/perl -w
-+#!/usr/bin/perl
- # Clean the dependency list in a makefile of standard includes...
- # Written by Ben Laurie <ben@algroup.co.uk> 19 Jan 1999
- 
-diff -ruN openssl-0.9.7m.orig/util/mkdef.pl openssl-0.9.7m/util/mkdef.pl
---- openssl-0.9.7m.orig/util/mkdef.pl	2006-02-04 18:05:40.000000000 -0500
-+++ openssl-0.9.7m/util/mkdef.pl	2007-07-23 21:09:34.000000000 -0400
-@@ -1,4 +1,4 @@
--#!/usr/local/bin/perl -w
-+#!/usr/bin/perl
- #
- # generate a .def file
- #
-diff -ruN openssl-0.9.7m.orig/util/mkerr.pl openssl-0.9.7m/util/mkerr.pl
---- openssl-0.9.7m.orig/util/mkerr.pl	2006-11-21 14:19:09.000000000 -0500
-+++ openssl-0.9.7m/util/mkerr.pl	2007-07-23 21:09:34.000000000 -0400
-@@ -1,4 +1,4 @@
--#!/usr/local/bin/perl -w
-+#!/usr/bin/perl
- 
- my $config = "crypto/err/openssl.ec";
- my $debug = 0;
-diff -ruN openssl-0.9.7m.orig/util/mkstack.pl openssl-0.9.7m/util/mkstack.pl
---- openssl-0.9.7m.orig/util/mkstack.pl	2004-10-04 12:27:36.000000000 -0400
-+++ openssl-0.9.7m/util/mkstack.pl	2007-07-23 21:09:34.000000000 -0400
-@@ -1,4 +1,4 @@
--#!/usr/local/bin/perl -w
-+#!/usr/bin/perl
- 
- # This is a utility that searches out "DECLARE_STACK_OF()"
- # declarations in .h and .c files, and updates/creates/replaces
-diff -ruN openssl-0.9.7m.orig/util/pod2man.pl openssl-0.9.7m/util/pod2man.pl
---- openssl-0.9.7m.orig/util/pod2man.pl	2005-06-18 00:27:11.000000000 -0400
-+++ openssl-0.9.7m/util/pod2man.pl	2007-07-23 21:09:34.000000000 -0400
-@@ -1,4 +1,4 @@
--: #!/usr/bin/perl-5.005
-+#!/usr/bin/perl
-     eval 'exec /usr/bin/perl -S $0 ${1+"$@"}'
- 	if $running_under_some_shell;
- 
-diff -ruN openssl-0.9.7m.orig/util/selftest.pl openssl-0.9.7m/util/selftest.pl
---- openssl-0.9.7m.orig/util/selftest.pl	2005-06-20 16:45:44.000000000 -0400
-+++ openssl-0.9.7m/util/selftest.pl	2007-07-23 21:09:34.000000000 -0400
-@@ -1,4 +1,4 @@
--#!/usr/local/bin/perl -w
-+#!/usr/bin/perl
- #
- # Run the test suite and generate a report
- #
-- 
1.5.4.3
