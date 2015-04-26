From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Apr 2015 19:24:30 +0200
Subject: [Buildroot] [git commit] package/libsrtp: bump version to 1.5.2
Message-ID: <20150426172513.E4C99807F7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=697e624745842f374740f26ea86a702f4ea9650e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Removed patches applied upstream:
https://github.com/cisco/libsrtp/commit/cae277e4377acc90ef787d09ed0d82968bbe809a
https://github.com/cisco/libsrtp/commit/b5fad5f893c7f323a8f8e1c512fa48cf6cdb1c8d

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...-for-building-on-cross-compiling-the-shar.patch |  139 --------------------
 ...checks-for-libz-and-libdl-when-OpenSSL-is.patch |   33 -----
 package/libsrtp/libsrtp.mk                         |    3 +-
 3 files changed, 1 insertions(+), 174 deletions(-)

diff --git a/package/libsrtp/0001-Add-support-for-building-on-cross-compiling-the-shar.patch b/package/libsrtp/0001-Add-support-for-building-on-cross-compiling-the-shar.patch
deleted file mode 100644
index a2df70b..0000000
--- a/package/libsrtp/0001-Add-support-for-building-on-cross-compiling-the-shar.patch
+++ /dev/null
@@ -1,139 +0,0 @@
-From 8e1dadbcb7ec6be1c568550e97a9e3ce565758bf Mon Sep 17 00:00:00 2001
-From: Nirbheek Chauhan <nirbheek@centricular.com>
-Date: Wed, 5 Nov 2014 18:35:14 +0530
-Subject: [PATCH] Add support for building on/cross-compiling the shared
- library for Windows and OS X
-
-Also ensure that the shared library is versioned, and an implib is created on
-Windows.
-
-Commit backported from upstream.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- Makefile.in | 53 ++++++++++++++++++++++++++++++++++++++++-------------
- 1 file changed, 40 insertions(+), 13 deletions(-)
-
-diff --git a/Makefile.in b/Makefile.in
-index 5a7fc21..5ca4453 100644
---- a/Makefile.in
-+++ b/Makefile.in
-@@ -17,7 +17,7 @@
- USE_OPENSSL = @USE_OPENSSL@
- HAVE_PKG_CONFIG = @HAVE_PKG_CONFIG@
- 
--.PHONY: all test build_table_apps
-+.PHONY: all shared_library test build_table_apps
- 
- all: test 
- 
-@@ -43,10 +43,10 @@ endif
- CC	= @CC@
- INCDIR	= -Icrypto/include -I$(srcdir)/include -I$(srcdir)/crypto/include
- DEFS	= @DEFS@
--CPPFLAGS= @CPPFLAGS@
-+CPPFLAGS= -fPIC @CPPFLAGS@
- CFLAGS	= @CFLAGS@
- LIBS	= @LIBS@
--LDFLAGS	= @LDFLAGS@ -L.
-+LDFLAGS	= -L. @LDFLAGS@
- COMPILE = $(CC) $(DEFS) $(INCDIR) $(CPPFLAGS) $(CFLAGS)
- SRTPLIB	= -lsrtp
- 
-@@ -75,12 +75,33 @@ prefix = @prefix@
- exec_prefix = @exec_prefix@
- includedir = @includedir@
- libdir = @libdir@
-+bindir = @bindir@
- 
- ifeq (1, $(HAVE_PKG_CONFIG))
- pkgconfigdir = $(libdir)/pkgconfig
- pkgconfig_DATA = libsrtp.pc
- endif
- 
-+SHAREDLIBVERSION = 1
-+ifeq (linux,$(findstring linux, at host@))
-+SHAREDLIB_DIR = $(libdir)
-+SHAREDLIB_LDFLAGS = -shared -Wl,-soname,$@
-+SHAREDLIBSUFFIXNOVER = so
-+SHAREDLIBSUFFIX = $(SHAREDLIBSUFFIXNOVER).$(SHAREDLIBVERSION)
-+else ifeq (mingw,$(findstring mingw, at host@))
-+SHAREDLIB_DIR = $(bindir)
-+SHAREDLIB_LDFLAGS = -shared -Wl,--out-implib,libsrtp.dll.a
-+SHAREDLIBVERSION =
-+SHAREDLIBSUFFIXNOVER = dll
-+SHAREDLIBSUFFIX = $(SHAREDLIBSUFFIXNOVER)
-+else ifeq (darwin,$(findstring darwin, at host@))
-+SHAREDLIB_DIR = $(libdir)
-+SHAREDLIB_LDFLAGS = -dynamiclib -twolevel_namespace -undefined dynamic_lookup \
-+        -fno-common -headerpad_max_install_names -install_name $(libdir)/$@
-+SHAREDLIBSUFFIXNOVER = dylib
-+SHAREDLIBSUFFIX = $(SHAREDLIBVERSION).$(SHAREDLIBSUFFIXNOVER)
-+endif
-+
- # implicit rules for object files and test apps
- 
- %.o: %.c
-@@ -121,9 +142,14 @@ libsrtp.a: $(srtpobj) $(cryptobj) $(gdoi)
- 	ar cr libsrtp.a $^
- 	$(RANLIB) libsrtp.a
- 
--libsrtp.so: $(srtpobj) $(cryptobj) $(gdoi) 
--	$(CC) -shared -Wl,-soname,libsrtp.so \
--	    -o libsrtp.so $^ $(LDFLAGS)
-+libsrtp.$(SHAREDLIBSUFFIX): $(srtpobj) $(cryptobj) $(gdoi)
-+	$(CC) -shared -o $@ $(SHAREDLIB_LDFLAGS) \
-+                $^ $(LDFLAGS) $(LIBS)
-+	if [ -n "$(SHAREDLIBVERSION)" ]; then \
-+		ln -sfn $@ libsrtp.$(SHAREDLIBSUFFIXNOVER); \
-+	fi
-+
-+shared_library: libsrtp.$(SHAREDLIBSUFFIX)
- 
- # libcryptomath.a contains general-purpose routines that are used to
- # generate tables and verify cryptoalgorithm implementations - this
-@@ -212,16 +238,18 @@ libsrtpdoc:
- .PHONY: clean superclean distclean install
- 
- install:
--	@if [ -r $(DESTDIR)$(includedir)/srtp/srtp.h ]; then \
--	   echo "you should run 'make uninstall' first"; exit 1;  \
--	fi
- 	$(INSTALL) -d $(DESTDIR)$(includedir)/srtp
- 	$(INSTALL) -d $(DESTDIR)$(libdir)
-+	$(INSTALL) -d $(DESTDIR)$(bindir)
- 	cp $(srcdir)/include/*.h $(DESTDIR)$(includedir)/srtp  
- 	cp $(srcdir)/crypto/include/*.h $(DESTDIR)$(includedir)/srtp
- 	if [ "$(srcdir)" != "." ]; then cp crypto/include/*.h $(DESTDIR)$(includedir)/srtp; fi
- 	if [ -f libsrtp.a ]; then cp libsrtp.a $(DESTDIR)$(libdir)/; fi
--	if [ -f libsrtp.so ]; then cp libsrtp.so $(DESTDIR)$(libdir)/; fi
-+	if [ -f libsrtp.dll.a ]; then cp libsrtp.dll.a $(DESTDIR)$(libdir)/; fi
-+	if [ -f libsrtp.$(SHAREDLIBSUFFIX) ]; then \
-+		cp libsrtp.$(SHAREDLIBSUFFIX) $(DESTDIR)$(SHAREDLIB_DIR)/; \
-+		cp libsrtp.$(SHAREDLIBSUFFIXNOVER) $(DESTDIR)$(SHAREDLIB_DIR)/; \
-+	fi
- 	if [ "$(pkgconfig_DATA)" != "" ]; then \
- 		$(INSTALL) -d $(DESTDIR)$(pkgconfigdir); \
- 		cp $(srcdir)/$(pkgconfig_DATA) $(DESTDIR)$(pkgconfigdir)/; \
-@@ -229,8 +257,7 @@ install:
- 
- uninstall:
- 	rm -f $(DESTDIR)$(includedir)/srtp/*.h
--	rm -f $(DESTDIR)$(libdir)/libsrtp.a
--	rm -f $(DESTDIR)$(libdir)/libsrtp.so
-+	rm -f $(DESTDIR)$(libdir)/libsrtp.*
- 	-rmdir $(DESTDIR)$(includedir)/srtp
- 	if [ "$(pkgconfig_DATA)" != "" ]; then \
- 		rm -f $(DESTDIR)$(pkgconfigdir)/$(pkgconfig_DATA); \
-@@ -238,7 +265,7 @@ uninstall:
- 
- clean:
- 	rm -rf $(cryptobj) $(srtpobj) $(cryptomath) TAGS \
--        libcryptomath.a libsrtp.a libsrtp.so core *.core test/core
-+        libcryptomath.a libsrtp.* core *.core test/core
- 	for a in * */* */*/*; do			\
-               if [ -f "$$a~" ] ; then rm -f $$a~; fi;	\
-         done;
--- 
-2.1.0
-
diff --git a/package/libsrtp/0002-A-autoconf-checks-for-libz-and-libdl-when-OpenSSL-is.patch b/package/libsrtp/0002-A-autoconf-checks-for-libz-and-libdl-when-OpenSSL-is.patch
deleted file mode 100644
index acb2c9a..0000000
--- a/package/libsrtp/0002-A-autoconf-checks-for-libz-and-libdl-when-OpenSSL-is.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 3107a0161bf30f7e3e0c356c3d040d99634fbf5b Mon Sep 17 00:00:00 2001
-From: jfigus <foleyj@cisco.com>
-Date: Thu, 26 Feb 2015 12:25:08 -0500
-Subject: [PATCH] A autoconf checks for libz and libdl when OpenSSL is enabled
- to allow for static linking of OpenSSL (via CFLAGS=-static).
-
-[Romain:
-  Drop the configure part of the patch since Buildroot
-  use AUTORECONF in libsrtp.mk]
-
-Signed-off-by: Romain Naour <romain.naour@openwide.fr>
----
- configure.in | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/configure.in b/configure.in
-index ee30daf..71df46b 100644
---- a/configure.in
-+++ b/configure.in
-@@ -147,6 +147,10 @@ if test "$enable_openssl" = "yes"; then
-    LDFLAGS="$LDFLAGS $(pkg-config --libs openssl)";
-    CFLAGS="$CFLAGS $(pkg-config --cflags openssl)";
- 
-+   AC_CHECK_LIB([dl], [dlopen], [],
-+             [AC_MSG_FAILURE([can't find libdl])])
-+   AC_CHECK_LIB([z], [inflate], [],
-+             [AC_MSG_FAILURE([can't find libz])])
-    AC_CHECK_LIB([crypto], [EVP_EncryptInit], [],
-              [AC_MSG_FAILURE([can't find openssl >1.0.1 crypto lib])])
-    AC_CHECK_LIB([crypto], [EVP_aes_128_ctr], [],
--- 
-1.9.3
-
diff --git a/package/libsrtp/libsrtp.mk b/package/libsrtp/libsrtp.mk
index e5cf47b..bcf344f 100644
--- a/package/libsrtp/libsrtp.mk
+++ b/package/libsrtp/libsrtp.mk
@@ -4,9 +4,8 @@
 #
 ################################################################################
 
-LIBSRTP_VERSION = v1.5.0
+LIBSRTP_VERSION = v1.5.2
 LIBSRTP_SITE = $(call github,cisco,libsrtp,$(LIBSRTP_VERSION))
-LIBSRTP_AUTORECONF = YES
 LIBSRTP_INSTALL_STAGING = YES
 LIBSRTP_LICENSE = BSD-3c
 LIBSRTP_LICENSE_FILES = LICENSE
