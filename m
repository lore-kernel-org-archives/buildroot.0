From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sat,  5 Jul 2008 00:25:09 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/openssl
Message-ID: <20080705072509.8CEF53C65A@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2008-07-05 00:25:06 -0700 (Sat, 05 Jul 2008)
New Revision: 22646

Log:
Fix bug [1899] Add table entry to allow openssl to build for AVR32, disabled softfloat

Added:
   trunk/buildroot/package/openssl/openssl-0.9.7m.patch.avr32

Modified:
   trunk/buildroot/package/openssl/openssl.mk


Changeset:
Added: trunk/buildroot/package/openssl/openssl-0.9.7m.patch.avr32
===================================================================
--- trunk/buildroot/package/openssl/openssl-0.9.7m.patch.avr32	                        (rev 0)
+++ trunk/buildroot/package/openssl/openssl-0.9.7m.patch.avr32	2008-07-05 07:25:06 UTC (rev 22646)
@@ -0,0 +1,11 @@
+diff -urN openssl-0.9.7m-0rig/Configure openssl-0.9.7m/Configure
+--- openssl-0.9.7m-0rig/Configure	2008-07-05 08:59:46.000000000 +0200
++++ openssl-0.9.7m/Configure	2008-07-05 09:05:10.000000000 +0200
+@@ -396,6 +396,7 @@
+ "linux-alpha-ev5","gcc:-DTERMIO -O3 -mcpu=ev5 -fomit-frame-pointer -Wall::-D_REENTRANT::-ldl:SIXTY_FOUR_BIT_LONG RC4_CHUNK DES_RISC1 DES_UNROLL:${alpha_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
+ "linux-arm","gcc:-DL_ENDIAN -DTERMIO -O3 -fomit-frame-pointer -Wall::-D_REENTRANT::-ldl:BN_LLONG DES_RISC1::::::::::dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
+ "linux-armeb","gcc:-DB_ENDIAN -DTERMIO -O3 -fomit-frame-pointer -Wall::-D_REENTRANT::-ldl:BN_LLONG DES_RISC1::::::::::dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
++"linux-avr32","gcc:-DTERMIO -O3 -fomit-frame-pointer -Wall::-D_REENTRANT::-ldl:BN_LLONG DES_RISC1::::::::::dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
+ "linux-freebsd-alpha","gcc:-DTERMIOS -O -fomit-frame-pointer::(unknown):::SIXTY_FOUR_BIT_LONG RC4_CHUNK DES_INT DES_PTR DES_RISC2::::::::::dlfcn:bsd-gcc-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
+ "linux-freebsd-i386",  "gcc:-DTERMIOS -DL_ENDIAN -fomit-frame-pointer -O3 -m486 -Wall::-pthread -D_REENTRANT -D_THREAD_SAFE -D_THREADSAFE:::BN_LLONG ${x86_gcc_des} ${x86_gcc_opts}:${x86_elf_asm}:dlfcn:bsd-gcc-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
+ "linux-hppa","gcc:-DB_ENDIAN -DTERMIO -O2 -Wall::-D_REENTRANT::-ldl:BN_LLONG MD2_CHAR RC4_INDEX::::::::::dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",

Modified: trunk/buildroot/package/openssl/openssl.mk
===================================================================
--- trunk/buildroot/package/openssl/openssl.mk	2008-07-05 06:58:53 UTC (rev 22645)
+++ trunk/buildroot/package/openssl/openssl.mk	2008-07-05 07:25:06 UTC (rev 22646)
@@ -31,10 +31,13 @@
 $(OPENSSL_DIR)/.unpacked: $(DL_DIR)/$(OPENSSL_SOURCE)
 	$(OPENSSL_CAT) $(DL_DIR)/$(OPENSSL_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 	toolchain/patch-kernel.sh $(OPENSSL_DIR) package/openssl/ openssl\*.patch
+	toolchain/patch-kernel.sh $(OPENSSL_DIR) package/openssl/ openssl\*.patch.$(ARCH)
 	# sigh... we have to resort to this just to set a gcc flag.
 	# grumble.. and of course make sure to escape any '/' in CFLAGS
+ifeq ($(BR2_avr32),)
 	$(SED) 's,/CFLAG=,/CFLAG= $(TARGET_SOFT_FLOAT) ,g' \
 		$(OPENSSL_DIR)/Configure
+endif
 	$(SED) '/CFLAG=/s,/;, $(shell echo '$(TARGET_CFLAGS)' | sed -e 's/\//\\\\\//g')/;,' \
 		$(OPENSSL_DIR)/Configure
 	$(CONFIG_UPDATE) $(OPENSSL_DIR)
