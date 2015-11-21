From: Ryan Barnett <ryanbarnett3@gmail.com>
Date: Fri, 20 Nov 2015 19:45:05 -0600
Subject: [Buildroot] [PATCH v2 2/2] ustr: use Debian patches to compile w/
	GCC 5.x
In-Reply-To: <1448070305-10768-1-git-send-email-ryanbarnett3@gmail.com>
References: <1448070305-10768-1-git-send-email-ryanbarnett3@gmail.com>
Message-ID: <1448070305-10768-2-git-send-email-ryanbarnett3@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

To fix issues with compiling with GCC 5.x, switch to utilizing the
Debian patches for cross compiling. Debian has been maintaining
patches for the ustr package since it appears that the ustr project
hasn't been active since 2008.

The Debian patches switch from a makefile based build to autotools
based build. This also means that the patch that was being carried
for cross compiling is no longer needed.

There is only one dependancy for this package - libsemange - which
still builds fine with these patches applied.

Fixes:
  http://autobuild.buildroot.net/results/150/150fa803fc3b65f75dce2847907ee768fc94c7a7
  http://autobuild.buildroot.net/results/fc9/fc97e1ac52d40ced6a5f9cd980d7f448c98e5c78
  ...and many more

Signed-off-by: Ryan Barnett <ryanbarnett3@gmail.com>
CC: Arnout Vandecappelle <arnout@mind.be>
---
Change from v1 -> v2:
 - Utilize the debian tar with patches
 - Update comments to make it clear that autotools is being used
   to build instead of generic make. (suggested by Arnout)
---
 .../ustr/0001-cross-compile-modifications.patch    | 144 ---------------------
 package/ustr/ustr.hash                             |   2 +
 package/ustr/ustr.mk                               |  45 +------
 3 files changed, 7 insertions(+), 184 deletions(-)
 delete mode 100644 package/ustr/0001-cross-compile-modifications.patch

diff --git a/package/ustr/0001-cross-compile-modifications.patch b/package/ustr/0001-cross-compile-modifications.patch
deleted file mode 100644
index ab75b44..0000000
--- a/package/ustr/0001-cross-compile-modifications.patch
+++ /dev/null
@@ -1,144 +0,0 @@
-Changes are to allow ustr version 1.0.4 to cross compile in buildroot.
-
-Signed-off-by Clayton Shotwell <clshotwe@rockwellcollins.com>
-
-diff -urN a/ustr-compiler.h b/ustr-compiler.h
---- a/ustr-compiler.h	2008-02-15 14:12:28.000000000 -0600
-+++ b/ustr-compiler.h	2012-06-15 11:04:55.000000000 -0500
-@@ -13,10 +13,10 @@
- 
- /* We assume this is enough,
-  * C99 specifies that va_copy() exists and is a macro */
--#ifdef va_copy
-+#if defined va_copy
- # define USTR_CONF_HAVE_VA_COPY 1
- # define USTR__VA_COPY(x, y)   va_copy(x, y)
--#elif __va_copy
-+#elif defined __va_copy
- # define USTR_CONF_HAVE_VA_COPY 1
- # define USTR__VA_COPY(x, y) __va_copy(x, y)
- #else
-diff -urN a/Makefile b/Makefile
---- a/Makefile	2008-03-05 21:38:00.000000000 -0600
-+++ b/Makefile	2013-09-10 16:54:45.916874387 -0500
-@@ -8,8 +8,8 @@
- VERS_ESONAME =1
- VERS_ESO     =$(VERS_ESONAME).0.4
- 
--DESTDIR =
--prefix=/usr
-+DESTDIR ?= 
-+prefix ?= /usr
- datadir=$(prefix)/share
- libdir=$(prefix)/lib
- libexecdir=$(prefix)/libexec
-@@ -18,7 +18,7 @@
- SHRDIR=$(datadir)/ustr-$(VERS_FULL)
- DOCSHRDIR=$(datadir)/doc/ustr-devel-$(VERS_FULL)
- EXAMDIR=$(SHRDIR)/examples
--mandir=$(datadir)/doc/man
-+mandir=$(datadir)/man
- MBINDIR=$(libexecdir)/ustr-$(VERS_FULL)
- 
- ###############################################################################
-@@ -28,12 +28,12 @@
- ###############################################################################
- HIDE=@
- 
--CC = cc
--AR = ar
--RANLIB = ranlib
--LDCONFIG = /sbin/ldconfig
-+CC ?= cc
-+AR ?= ar
-+RANLIB ?= ranlib
- 
--CFLAGS  = -O2 -g
-+CFLAGS ?= -O2 -g
-+LDFLAGS ?= 
- 
- # Debug versions...
- WARNS = -W -Wall -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wcast-align -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wmissing-prototypes -Wmissing-declarations -Wnested-externs -Wno-format-zero-length -Wformat-nonliteral -Wformat-security # -Wfloat-equal -- no floats
-@@ -376,7 +376,7 @@
- all-shared: all $(LIB_SHARED)
- 		$(HIDE)echo Done shared
- 
--install: all-shared ustr.pc ustr-debug.pc
-+install: all ustr.pc ustr-debug.pc
- 		$(HIDE)echo Making directories
- 		install -d $(DESTDIR)$(libdir)
- 		install -d $(DESTDIR)$(includedir)
-@@ -389,16 +389,6 @@
- 		install -d $(DESTDIR)$(libdir)/pkgconfig
- 		$(HIDE)echo Installing files
- 		install -m 644 -t $(DESTDIR)$(libdir) $(LIB_STATIC)
--		install -m 755 -t $(DESTDIR)$(libdir) $(LIB_SHARED)
--		-rm -f $(DESTDIR)$(libdir)/$(OPT_LIB_SHARED_NAME)
--		ln -s $(OPT_LIB_SHARED) $(DESTDIR)$(libdir)/$(OPT_LIB_SHARED_NAME)
--		-rm -f $(DESTDIR)$(libdir)/$(OPT_LIB_SHAREDEV)
--		ln -s $(OPT_LIB_SHARED_NAME) $(DESTDIR)$(libdir)/$(OPT_LIB_SHAREDEV)
--		-rm -f $(DESTDIR)$(libdir)/$(DBG_LIB_SHARED_NAME)
--		ln -s $(DBG_LIB_SHARED) $(DESTDIR)$(libdir)/$(DBG_LIB_SHARED_NAME)
--		-rm -f $(DESTDIR)$(libdir)/$(DBG_LIB_SHAREDEV)
--		ln -s $(DBG_LIB_SHARED_NAME) $(DESTDIR)$(libdir)/$(DBG_LIB_SHAREDEV)
--		$(LDCONFIG) -n $(DESTDIR)$(libdir)
- 		install -pm 644 -t $(DESTDIR)$(includedir) $(SRC_HDRS)
- 		install -pm 644 -t $(DESTDIR)$(SHRDIR) $(SRC_SRCS)
- 		install -pm 644 -t $(DESTDIR)$(SHRDIR) $(XSRC_SRCS)
-@@ -409,13 +399,24 @@
- 		install -m 755 -t $(DESTDIR)$(bindir) ustr-import
- 		install -pm 644 -t $(DESTDIR)$(libdir)/pkgconfig ustr.pc ustr-debug.pc
- 
-+install-shared: all-shared install
-+		$(HIDE)echo Installing files
-+		install -m 755 -t $(DESTDIR)$(libdir) $(LIB_SHARED)
-+		-rm -f $(DESTDIR)$(libdir)/$(OPT_LIB_SHARED_NAME)
-+		ln -s $(OPT_LIB_SHARED) $(DESTDIR)$(libdir)/$(OPT_LIB_SHARED_NAME)
-+		-rm -f $(DESTDIR)$(libdir)/$(OPT_LIB_SHAREDEV)
-+		ln -s $(OPT_LIB_SHARED_NAME) $(DESTDIR)$(libdir)/$(OPT_LIB_SHAREDEV)
-+		-rm -f $(DESTDIR)$(libdir)/$(DBG_LIB_SHARED_NAME)
-+		ln -s $(DBG_LIB_SHARED) $(DESTDIR)$(libdir)/$(DBG_LIB_SHARED_NAME)
-+		-rm -f $(DESTDIR)$(libdir)/$(DBG_LIB_SHAREDEV)
-+		ln -s $(DBG_LIB_SHARED_NAME) $(DESTDIR)$(libdir)/$(DBG_LIB_SHAREDEV)
-+
- ustr-import-multilib: ustr-import-multilib.in
- 		sed -e 's, at INCLUDEDIR@,$(includedir),g' -e 's, at MBINDIR@,$(MBINDIR),g' < $< > $@
- 
- install-multilib-linux: install autoconf_64b ustr-import-multilib
- 		install -d $(DESTDIR)$(MBINDIR)
--		$(HIDE)mlib=`./autoconf_64b`; \
--                   if test "x$$mlib" = "x1"; then mlib=64; else mlib=32; fi; \
-+		$(HIDE))if test "`echo "__SIZEOF_SIZE_T__" | $(CC) -E -x c - | tail -n 1`" = 8; then mlib=64; else mlib=32; fi; \
-                    mv -f $(DESTDIR)$(includedir)/ustr-conf-debug.h \
-                          $(DESTDIR)$(includedir)/ustr-conf-debug-$$mlib.h; \
-                    mv -f $(DESTDIR)$(includedir)/ustr-conf.h \
-@@ -451,7 +452,8 @@
- 
- ustr-import: ustr-import.in autoconf_64b autoconf_vsnprintf
- 		$(HIDE)echo Creating $@
--		$(HIDE)sz64=`./autoconf_64b`; vsnp=`./autoconf_vsnprintf`; \
-+		$(HIDE)if test "`echo "__SIZEOF_SIZE_T__" | $(CC) -E -x c - | tail -n 1`" = 8; then sz64=1; else sz64=0; fi; \
-+		if test "`./autoconf_vsnprintf`" = 0; then vsnp=0; else vsnp=1; fi; \
- 		sed -e 's, at INCLUDEDIR@,$(includedir),g' -e 's, at SHRDIR@,$(SHRDIR),g' -e 's, at VERS@,$(VERS),g'  -e 's, at VERS_FULL@,$(VERS_FULL),g' -e "s, at HAVE_64bit_SIZE_MAX@,$$sz64,g" -e "s, at HAVE_RETARDED_VSNPRINTF@,$$vsnp,g" < $< > $@
- 		$(HIDE)chmod 755 $@
- 
-@@ -485,7 +487,8 @@
- ustr-conf.h: ustr-conf.h.in autoconf_64b autoconf_vsnprintf
- 		$(HIDE)echo Creating $@
- 		$(HIDE)have_stdint_h=0; dbg1=0; dbg2=0; \
--                sz64=`./autoconf_64b`; vsnp=`./autoconf_vsnprintf`; \
-+                if test "`echo "__SIZEOF_SIZE_T__" | $(CC) -E -x c - | tail -n 1`" = 8; then sz64=1; else sz64=0; fi; \
-+                if test "`./autoconf_vsnprintf`" = 0; then vsnp=0; else vsnp=1; fi; \
-                 if test -f "/usr/include/stdint.h"; then have_stdint_h=1; fi; \
-                 if test -f "$(prefix)/include/stdint.h"; then have_stdint_h=1; fi; \
-                 if test -f "$(includedir)/stdint.h"; then have_stdint_h=1; fi; \
-@@ -494,7 +497,8 @@
- ustr-conf-debug.h: ustr-conf.h.in autoconf_64b autoconf_vsnprintf
- 		$(HIDE)echo Creating $@
- 		$(HIDE)have_stdint_h=0; dbg1=1; dbg2=1; \
--                sz64=`./autoconf_64b`; vsnp=`./autoconf_vsnprintf`; \
-+                if test "`echo "__SIZEOF_SIZE_T__" | $(CC) -E -x c - | tail -n 1`" = 8; then sz64=1; else sz64=0; fi; \
-+                if test "`./autoconf_vsnprintf`" = 0; then vsnp=0; else vsnp=1; fi; \
-                 if test -f "/usr/include/stdint.h"; then have_stdint_h=1; fi; \
-                 if test -f "$(prefix)/include/stdint.h"; then have_stdint_h=1; fi; \
-                 if test -f "$(includedir)/stdint.h"; then have_stdint_h=1; fi; \
diff --git a/package/ustr/ustr.hash b/package/ustr/ustr.hash
index 2288bcf..214d37a 100644
--- a/package/ustr/ustr.hash
+++ b/package/ustr/ustr.hash
@@ -1,2 +1,4 @@
 # Locally computed
 sha256 3daf6eae9f78de1e872c0b2b83cce35515b94d4bb8a074e48f331fd99e1fc2c4 ustr-1.0.4.tar.bz2
+# From http://debian.gtisc.gatech.edu/debian/pool/main/u/ustr/ustr_1.0.4-5.dsc
+sha256 a21e78acf82dcccef2893932ef7b85852419bfd9b18382e63c34e7710c1d7762 ustr_1.0.4-5.debian.tar.xz
diff --git a/package/ustr/ustr.mk b/package/ustr/ustr.mk
index 3144c0b..83e69e6 100644
--- a/package/ustr/ustr.mk
+++ b/package/ustr/ustr.mk
@@ -9,46 +9,11 @@ USTR_SOURCE = ustr-$(USTR_VERSION).tar.bz2
 USTR_SITE = http://www.and.org/ustr/$(USTR_VERSION)
 USTR_LICENSE = BSD-2c MIT LGPLv2+
 USTR_LICENSE_FILES = LICENSE LICENSE_BSD LICENSE_LGPL LICENSE_MIT
+USTR_AUTORECONF = YES
+USTR_PATCH = \
+	http://http.debian.net/debian/pool/main/u/ustr/ustr_$(USTR_VERSION)-5.debian.tar.xz
 
 USTR_INSTALL_STAGING = YES
 
-ifeq ($(BR2_STATIC_LIBS),y)
-USTR_BUILD_TARGETS = all
-USTR_INSTALL_TARGETS = install
-else ifeq ($(BR2_SHARED_LIBS),y)
-USTR_BUILD_TARGETS = all-shared
-USTR_INSTALL_TARGETS = install-shared
-else
-USTR_BUILD_TARGETS = all all-shared
-USTR_INSTALL_TARGETS = all install-shared
-endif
-
-define USTR_BUILD_CMDS
-	$(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS) $(USTR_BUILD_TARGETS)
-endef
-
-define USTR_INSTALL_STAGING_CMDS
-	$(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS) DESTDIR=$(STAGING_DIR) \
-		$(USTR_INSTALL_TARGETS)
-	$(RM) -f $(STAGING_DIR)/usr/lib/libustr-debug*
-	$(RM) -f $(STAGING_DIR)/usr/lib/pkgconfig/libustr-debug.pc
-endef
-
-define USTR_INSTALL_TARGET_CMDS
-	$(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS) DESTDIR=$(TARGET_DIR) \
-		$(USTR_INSTALL_TARGETS)
-	$(RM) -f $(TARGET_DIR)/usr/lib/libustr-debug*
-	$(RM) -rf $(TARGET_DIR)/usr/share/ustr-$(USTR_VERSION)
-endef
-
-define HOST_USTR_BUILD_CMDS
-	$(MAKE) -C $(@D) $(HOST_CONFIGURE_OPTS) all-shared
-endef
-
-define HOST_USTR_INSTALL_CMDS
-	$(MAKE) -C $(@D) $(HOST_CONFIGURE_OPTS) DESTDIR=$(HOST_DIR) \
-		install-shared
-endef
-
-$(eval $(generic-package))
-$(eval $(host-generic-package))
+$(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
1.9.1
