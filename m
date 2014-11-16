From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 16 Nov 2014 15:00:45 +0100
Subject: [Buildroot] [PATCH 1/2] package/openssl: Enable parallel build
Message-ID: <1416146446-27060-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Patch taken from Gentoo, tested 50+ times on buildroot with make -j80.

Comparison of compile duration:

make -j1
real    1m24.464s
user    1m8.620s
sys     0m9.661s

make -j80
real    0m27.774s
user    1m34.234s
sys     0m13.441s

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/openssl/openssl-005-parallel-build.patch |  363 ++++++++++++++++++++++
 package/openssl/openssl.mk                       |   10 +-
 2 files changed, 368 insertions(+), 5 deletions(-)
 create mode 100644 package/openssl/openssl-005-parallel-build.patch

diff --git a/package/openssl/openssl-005-parallel-build.patch b/package/openssl/openssl-005-parallel-build.patch
new file mode 100644
index 0000000..8ac8402
--- /dev/null
+++ b/package/openssl/openssl-005-parallel-build.patch
@@ -0,0 +1,363 @@
+Fix parallel build
+
+Downloaded from
+http://sources.gentoo.org/cgi-bin/viewvc.cgi/gentoo-x86/dev-libs/openssl/files/openssl-1.0.1-parallel-build.patch?view=markup
+and adjusted to 001-do-not-build-docs.patch
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+
+http://rt.openssl.org/Ticket/Display.html?id=2084
+
+--- a/Makefile.org
++++ b/Makefile.org
+@@ -247,17 +247,17 @@
+ build_libs: build_crypto build_ssl build_engines
+ 
+ build_crypto:
+-	@dir=crypto; target=all; $(BUILD_ONE_CMD)
++	+ at dir=crypto; target=all; $(BUILD_ONE_CMD)
+-build_ssl:
++build_ssl: build_crypto
+-	@dir=ssl; target=all; $(BUILD_ONE_CMD)
++	+ at dir=ssl; target=all; $(BUILD_ONE_CMD)
+-build_engines:
++build_engines: build_crypto
+-	@dir=engines; target=all; $(BUILD_ONE_CMD)
++	+ at dir=engines; target=all; $(BUILD_ONE_CMD)
+-build_apps:
++build_apps: build_libs
+-	@dir=apps; target=all; $(BUILD_ONE_CMD)
++	+ at dir=apps; target=all; $(BUILD_ONE_CMD)
+-build_tests:
++build_tests: build_libs
+-	@dir=test; target=all; $(BUILD_ONE_CMD)
++	+ at dir=test; target=all; $(BUILD_ONE_CMD)
+-build_tools:
++build_tools: build_libs
+-	@dir=tools; target=all; $(BUILD_ONE_CMD)
++	+ at dir=tools; target=all; $(BUILD_ONE_CMD)
+ 
+ all_testapps: build_libs build_testapps
+ build_testapps:
+@@ -497,9 +497,9 @@
+ dist_pem_h:
+ 	(cd crypto/pem; $(MAKE) -e $(BUILDENV) pem.h; $(MAKE) clean)
+ 
+-install: all install_sw
++install: install_sw
+ 
+-install_sw:
++install_dirs:
+ 	@$(PERL) $(TOP)/util/mkdir-p.pl $(INSTALL_PREFIX)$(INSTALLTOP)/bin \
+ 		$(INSTALL_PREFIX)$(INSTALLTOP)/$(LIBDIR) \
+ 		$(INSTALL_PREFIX)$(INSTALLTOP)/$(LIBDIR)/engines \
+@@ -508,6 +508,13 @@
+ 		$(INSTALL_PREFIX)$(OPENSSLDIR)/misc \
+ 		$(INSTALL_PREFIX)$(OPENSSLDIR)/certs \
+ 		$(INSTALL_PREFIX)$(OPENSSLDIR)/private
++	@$(PERL) $(TOP)/util/mkdir-p.pl \
++		$(INSTALL_PREFIX)$(MANDIR)/man1 \
++		$(INSTALL_PREFIX)$(MANDIR)/man3 \
++		$(INSTALL_PREFIX)$(MANDIR)/man5 \
++		$(INSTALL_PREFIX)$(MANDIR)/man7
++
++install_sw: install_dirs
+ 	@set -e; headerlist="$(EXHEADER)"; for i in $$headerlist;\
+ 	do \
+ 	(cp $$i $(INSTALL_PREFIX)$(INSTALLTOP)/include/openssl/$$i; \
+@@ -511,7 +511,7 @@
+ 	(cp $$i $(INSTALL_PREFIX)$(INSTALLTOP)/include/openssl/$$i; \
+ 	chmod 644 $(INSTALL_PREFIX)$(INSTALLTOP)/include/openssl/$$i ); \
+ 	done;
+-	@set -e; target=install; $(RECURSIVE_BUILD_CMD)
++	+ at set -e; target=install; $(RECURSIVE_BUILD_CMD)
+ 	@set -e; liblist="$(LIBS)"; for i in $$liblist ;\
+ 	do \
+ 		if [ -f "$$i" ]; then \
+@@ -593,12 +600,7 @@
+ 		done; \
+ 	done
+ 
+-install_docs:
+-	@$(PERL) $(TOP)/util/mkdir-p.pl \
+-		$(INSTALL_PREFIX)$(MANDIR)/man1 \
+-		$(INSTALL_PREFIX)$(MANDIR)/man3 \
+-		$(INSTALL_PREFIX)$(MANDIR)/man5 \
+-		$(INSTALL_PREFIX)$(MANDIR)/man7
++install_docs: install_dirs
+ 	@pod2man="`cd ./util; ./pod2mantest $(PERL)`"; \
+ 	here="`pwd`"; \
+ 	filecase=; \
+--- a/Makefile.shared
++++ b/Makefile.shared
+@@ -105,6 +105,7 @@ LINK_SO=	\
+     SHAREDFLAGS="$${SHAREDFLAGS:-$(CFLAGS) $(SHARED_LDFLAGS)}"; \
+     LIBPATH=`for x in $$LIBDEPS; do echo $$x; done | sed -e 's/^ *-L//;t' -e d | uniq`; \
+     LIBPATH=`echo $$LIBPATH | sed -e 's/ /:/g'`; \
++    [ -e $$SHLIB$$SHLIB_SOVER$$SHLIB_SUFFIX ] && exit 0; \
+     LD_LIBRARY_PATH=$$LIBPATH:$$LD_LIBRARY_PATH \
+     $${SHAREDCMD} $${SHAREDFLAGS} \
+ 	-o $$SHLIB$$SHLIB_SOVER$$SHLIB_SUFFIX \
+@@ -122,6 +124,7 @@ SYMLINK_SO=	\
+ 			done; \
+ 		fi; \
+ 		if [ -n "$$SHLIB_SOVER" ]; then \
++			[ -e "$$SHLIB$$SHLIB_SUFFIX" ] || \
+ 			( $(SET_X); rm -f $$SHLIB$$SHLIB_SUFFIX; \
+ 			  ln -s $$prev $$SHLIB$$SHLIB_SUFFIX ); \
+ 		fi; \
+--- a/crypto/Makefile
++++ b/crypto/Makefile
+@@ -85,11 +85,11 @@
+ 	@if [ -z "$(THIS)" ]; then $(MAKE) -f $(TOP)/Makefile reflect THIS=$@; fi
+ 
+ subdirs:
+-	@target=all; $(RECURSIVE_MAKE)
++	+ at target=all; $(RECURSIVE_MAKE)
+ 
+ files:
+ 	$(PERL) $(TOP)/util/files.pl Makefile >> $(TOP)/MINFO
+-	@target=files; $(RECURSIVE_MAKE)
++	+ at target=files; $(RECURSIVE_MAKE)
+ 
+ links:
+ 	@$(PERL) $(TOP)/util/mklink.pl ../include/openssl $(EXHEADER)
+@@ -100,7 +100,7 @@
+ # lib: $(LIB): are splitted to avoid end-less loop
+ lib:	$(LIB)
+ 	@touch lib
+-$(LIB):	$(LIBOBJ)
++$(LIB):	$(LIBOBJ) | subdirs
+ 	$(AR) $(LIB) $(LIBOBJ)
+ 	$(RANLIB) $(LIB) || echo Never mind.
+ 
+@@ -110,7 +110,7 @@
+ 	fi
+ 
+ libs:
+-	@target=lib; $(RECURSIVE_MAKE)
++	+ at target=lib; $(RECURSIVE_MAKE)
+ 
+ install:
+ 	@[ -n "$(INSTALLTOP)" ] # should be set by top Makefile...
+@@ -119,7 +119,7 @@
+ 	(cp $$i $(INSTALL_PREFIX)$(INSTALLTOP)/include/openssl/$$i; \
+ 	chmod 644 $(INSTALL_PREFIX)$(INSTALLTOP)/include/openssl/$$i ); \
+ 	done;
+-	@target=install; $(RECURSIVE_MAKE)
++	+ at target=install; $(RECURSIVE_MAKE)
+ 
+ lint:
+ 	@target=lint; $(RECURSIVE_MAKE)
+--- a/engines/Makefile
++++ b/engines/Makefile
+@@ -72,7 +72,7 @@
+ 
+ all:	lib subdirs
+ 
+-lib:	$(LIBOBJ)
++lib:	$(LIBOBJ) | subdirs
+ 	@if [ -n "$(SHARED_LIBS)" ]; then \
+ 		set -e; \
+ 		for l in $(LIBNAMES); do \
+@@ -89,7 +89,7 @@
+ 
+ subdirs:
+ 	echo $(EDIRS)
+-	@target=all; $(RECURSIVE_MAKE)
++	+ at target=all; $(RECURSIVE_MAKE)
+ 
+ files:
+ 	$(PERL) $(TOP)/util/files.pl Makefile >> $(TOP)/MINFO
+@@ -128,7 +128,7 @@
+ 			  mv -f $(INSTALL_PREFIX)$(INSTALLTOP)/$(LIBDIR)/engines/$$pfx$$l$$sfx.new $(INSTALL_PREFIX)$(INSTALLTOP)/$(LIBDIR)/engines/$$pfx$$l$$sfx ); \
+ 		done; \
+ 	fi
+-	@target=install; $(RECURSIVE_MAKE)
++	+ at target=install; $(RECURSIVE_MAKE)
+ 
+ tags:
+ 	ctags $(SRC)
+--- a/test/Makefile
++++ b/test/Makefile
+@@ -123,7 +123,7 @@
+ tags:
+ 	ctags $(SRC)
+ 
+-tests:	exe apps $(TESTS)
++tests:	exe $(TESTS)
+ 
+ apps:
+ 	@(cd ..; $(MAKE) DIRS=apps all)
+@@ -365,109 +365,109 @@
+ 		link_app.$${shlib_target}
+ 
+ $(RSATEST)$(EXE_EXT): $(RSATEST).o $(DLIBCRYPTO)
+-	@target=$(RSATEST); $(BUILD_CMD)
++	+ at target=$(RSATEST); $(BUILD_CMD)
+ 
+ $(BNTEST)$(EXE_EXT): $(BNTEST).o $(DLIBCRYPTO)
+-	@target=$(BNTEST); $(BUILD_CMD)
++	+ at target=$(BNTEST); $(BUILD_CMD)
+ 
+ $(ECTEST)$(EXE_EXT): $(ECTEST).o $(DLIBCRYPTO)
+-	@target=$(ECTEST); $(BUILD_CMD)
++	+ at target=$(ECTEST); $(BUILD_CMD)
+ 
+ $(EXPTEST)$(EXE_EXT): $(EXPTEST).o $(DLIBCRYPTO)
+-	@target=$(EXPTEST); $(BUILD_CMD)
++	+ at target=$(EXPTEST); $(BUILD_CMD)
+ 
+ $(IDEATEST)$(EXE_EXT): $(IDEATEST).o $(DLIBCRYPTO)
+-	@target=$(IDEATEST); $(BUILD_CMD)
++	+ at target=$(IDEATEST); $(BUILD_CMD)
+ 
+ $(MD2TEST)$(EXE_EXT): $(MD2TEST).o $(DLIBCRYPTO)
+-	@target=$(MD2TEST); $(BUILD_CMD)
++	+ at target=$(MD2TEST); $(BUILD_CMD)
+ 
+ $(SHATEST)$(EXE_EXT): $(SHATEST).o $(DLIBCRYPTO)
+-	@target=$(SHATEST); $(BUILD_CMD)
++	+ at target=$(SHATEST); $(BUILD_CMD)
+ 
+ $(SHA1TEST)$(EXE_EXT): $(SHA1TEST).o $(DLIBCRYPTO)
+-	@target=$(SHA1TEST); $(BUILD_CMD)
++	+ at target=$(SHA1TEST); $(BUILD_CMD)
+ 
+ $(SHA256TEST)$(EXE_EXT): $(SHA256TEST).o $(DLIBCRYPTO)
+-	@target=$(SHA256TEST); $(BUILD_CMD)
++	+ at target=$(SHA256TEST); $(BUILD_CMD)
+ 
+ $(SHA512TEST)$(EXE_EXT): $(SHA512TEST).o $(DLIBCRYPTO)
+-	@target=$(SHA512TEST); $(BUILD_CMD)
++	+ at target=$(SHA512TEST); $(BUILD_CMD)
+ 
+ $(RMDTEST)$(EXE_EXT): $(RMDTEST).o $(DLIBCRYPTO)
+-	@target=$(RMDTEST); $(BUILD_CMD)
++	+ at target=$(RMDTEST); $(BUILD_CMD)
+ 
+ $(MDC2TEST)$(EXE_EXT): $(MDC2TEST).o $(DLIBCRYPTO)
+-	@target=$(MDC2TEST); $(BUILD_CMD)
++	+ at target=$(MDC2TEST); $(BUILD_CMD)
+ 
+ $(MD4TEST)$(EXE_EXT): $(MD4TEST).o $(DLIBCRYPTO)
+-	@target=$(MD4TEST); $(BUILD_CMD)
++	+ at target=$(MD4TEST); $(BUILD_CMD)
+ 
+ $(MD5TEST)$(EXE_EXT): $(MD5TEST).o $(DLIBCRYPTO)
+-	@target=$(MD5TEST); $(BUILD_CMD)
++	+ at target=$(MD5TEST); $(BUILD_CMD)
+ 
+ $(HMACTEST)$(EXE_EXT): $(HMACTEST).o $(DLIBCRYPTO)
+-	@target=$(HMACTEST); $(BUILD_CMD)
++	+ at target=$(HMACTEST); $(BUILD_CMD)
+ 
+ $(WPTEST)$(EXE_EXT): $(WPTEST).o $(DLIBCRYPTO)
+-	@target=$(WPTEST); $(BUILD_CMD)
++	+ at target=$(WPTEST); $(BUILD_CMD)
+ 
+ $(RC2TEST)$(EXE_EXT): $(RC2TEST).o $(DLIBCRYPTO)
+-	@target=$(RC2TEST); $(BUILD_CMD)
++	+ at target=$(RC2TEST); $(BUILD_CMD)
+ 
+ $(BFTEST)$(EXE_EXT): $(BFTEST).o $(DLIBCRYPTO)
+-	@target=$(BFTEST); $(BUILD_CMD)
++	+ at target=$(BFTEST); $(BUILD_CMD)
+ 
+ $(CASTTEST)$(EXE_EXT): $(CASTTEST).o $(DLIBCRYPTO)
+-	@target=$(CASTTEST); $(BUILD_CMD)
++	+ at target=$(CASTTEST); $(BUILD_CMD)
+ 
+ $(RC4TEST)$(EXE_EXT): $(RC4TEST).o $(DLIBCRYPTO)
+-	@target=$(RC4TEST); $(BUILD_CMD)
++	+ at target=$(RC4TEST); $(BUILD_CMD)
+ 
+ $(RC5TEST)$(EXE_EXT): $(RC5TEST).o $(DLIBCRYPTO)
+-	@target=$(RC5TEST); $(BUILD_CMD)
++	+ at target=$(RC5TEST); $(BUILD_CMD)
+ 
+ $(DESTEST)$(EXE_EXT): $(DESTEST).o $(DLIBCRYPTO)
+-	@target=$(DESTEST); $(BUILD_CMD)
++	+ at target=$(DESTEST); $(BUILD_CMD)
+ 
+ $(RANDTEST)$(EXE_EXT): $(RANDTEST).o $(DLIBCRYPTO)
+-	@target=$(RANDTEST); $(BUILD_CMD)
++	+ at target=$(RANDTEST); $(BUILD_CMD)
+ 
+ $(DHTEST)$(EXE_EXT): $(DHTEST).o $(DLIBCRYPTO)
+-	@target=$(DHTEST); $(BUILD_CMD)
++	+ at target=$(DHTEST); $(BUILD_CMD)
+ 
+ $(DSATEST)$(EXE_EXT): $(DSATEST).o $(DLIBCRYPTO)
+-	@target=$(DSATEST); $(BUILD_CMD)
++	+ at target=$(DSATEST); $(BUILD_CMD)
+ 
+ $(METHTEST)$(EXE_EXT): $(METHTEST).o $(DLIBCRYPTO)
+-	@target=$(METHTEST); $(BUILD_CMD)
++	+ at target=$(METHTEST); $(BUILD_CMD)
+ 
+ $(SSLTEST)$(EXE_EXT): $(SSLTEST).o $(DLIBSSL) $(DLIBCRYPTO)
+-	@target=$(SSLTEST); $(FIPS_BUILD_CMD)
++	+ at target=$(SSLTEST); $(FIPS_BUILD_CMD)
+ 
+ $(ENGINETEST)$(EXE_EXT): $(ENGINETEST).o $(DLIBCRYPTO)
+-	@target=$(ENGINETEST); $(BUILD_CMD)
++	+ at target=$(ENGINETEST); $(BUILD_CMD)
+ 
+ $(EVPTEST)$(EXE_EXT): $(EVPTEST).o $(DLIBCRYPTO)
+-	@target=$(EVPTEST); $(BUILD_CMD)
++	+ at target=$(EVPTEST); $(BUILD_CMD)
+ 
+ $(ECDSATEST)$(EXE_EXT): $(ECDSATEST).o $(DLIBCRYPTO)
+-	@target=$(ECDSATEST); $(BUILD_CMD)
++	+ at target=$(ECDSATEST); $(BUILD_CMD)
+ 
+ $(ECDHTEST)$(EXE_EXT): $(ECDHTEST).o $(DLIBCRYPTO)
+-	@target=$(ECDHTEST); $(BUILD_CMD)
++	+ at target=$(ECDHTEST); $(BUILD_CMD)
+ 
+ $(IGETEST)$(EXE_EXT): $(IGETEST).o $(DLIBCRYPTO)
+-	@target=$(IGETEST); $(BUILD_CMD)
++	+ at target=$(IGETEST); $(BUILD_CMD)
+ 
+ $(JPAKETEST)$(EXE_EXT): $(JPAKETEST).o $(DLIBCRYPTO)
+-	@target=$(JPAKETEST); $(BUILD_CMD)
++	+ at target=$(JPAKETEST); $(BUILD_CMD)
+ 
+ $(ASN1TEST)$(EXE_EXT): $(ASN1TEST).o $(DLIBCRYPTO)
+-	@target=$(ASN1TEST); $(BUILD_CMD)
++	+ at target=$(ASN1TEST); $(BUILD_CMD)
+ 
+ $(SRPTEST)$(EXE_EXT): $(SRPTEST).o $(DLIBCRYPTO)
+-	@target=$(SRPTEST); $(BUILD_CMD)
++	+ at target=$(SRPTEST); $(BUILD_CMD)
+ 
+ #$(AESTEST).o: $(AESTEST).c
+ #	$(CC) -c $(CFLAGS) -DINTERMEDIATE_VALUE_KAT -DTRACE_KAT_MCT $(AESTEST).c
+@@ -480,7 +480,7 @@
+ #	fi
+ 
+ dummytest$(EXE_EXT): dummytest.o $(DLIBCRYPTO)
+-	@target=dummytest; $(BUILD_CMD)
++	+ at target=dummytest; $(BUILD_CMD)
+ 
+ # DO NOT DELETE THIS LINE -- make depend depends on it.
+ 
+--- a/crypto/objects/Makefile
++++ b/crypto/objects/Makefile
+@@ -44,11 +44,11 @@ obj_dat.h: obj_dat.pl obj_mac.h
+ # objects.pl both reads and writes obj_mac.num
+ obj_mac.h: objects.pl objects.txt obj_mac.num
+ 	$(PERL) objects.pl objects.txt obj_mac.num obj_mac.h
+-	@sleep 1; touch obj_mac.h; sleep 1
+ 
+-obj_xref.h: objxref.pl obj_xref.txt obj_mac.num
++# This doesn't really need obj_mac.h, but since that rule reads & writes
++# obj_mac.num, we can't run in parallel with it.
++obj_xref.h: objxref.pl obj_xref.txt obj_mac.num obj_mac.h
+ 	$(PERL) objxref.pl obj_mac.num obj_xref.txt > obj_xref.h
+-	@sleep 1; touch obj_xref.h; sleep 1
+ 
+ files:
+ 	$(PERL) $(TOP)/util/files.pl Makefile >> $(TOP)/MINFO
diff --git a/package/openssl/openssl.mk b/package/openssl/openssl.mk
index 7e30cad..47b6414 100644
--- a/package/openssl/openssl.mk
+++ b/package/openssl/openssl.mk
@@ -95,23 +95,23 @@ define OPENSSL_CONFIGURE_CMDS
 endef
 
 define HOST_OPENSSL_BUILD_CMDS
-	$(MAKE1) -C $(@D)
+	$(MAKE) -C $(@D)
 endef
 
 define OPENSSL_BUILD_CMDS
-	$(MAKE1) -C $(@D)
+	$(MAKE) -C $(@D)
 endef
 
 define OPENSSL_INSTALL_STAGING_CMDS
-	$(MAKE1) -C $(@D) INSTALL_PREFIX=$(STAGING_DIR) install
+	$(MAKE) -C $(@D) INSTALL_PREFIX=$(STAGING_DIR) install
 endef
 
 define HOST_OPENSSL_INSTALL_CMDS
-	$(MAKE1) -C $(@D) install
+	$(MAKE) -C $(@D) install
 endef
 
 define OPENSSL_INSTALL_TARGET_CMDS
-	$(MAKE1) -C $(@D) INSTALL_PREFIX=$(TARGET_DIR) install
+	$(MAKE) -C $(@D) INSTALL_PREFIX=$(TARGET_DIR) install
 	rm -rf $(TARGET_DIR)/usr/lib/ssl
 	rm -f $(TARGET_DIR)/usr/bin/c_rehash
 endef
-- 
1.7.10.4
