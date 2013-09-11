From: Clayton Shotwell <clshotwe@rockwellcollins.com>
Date: Wed, 11 Sep 2013 16:59:23 -0500
Subject: [Buildroot] [PATCH v2 03/17] ustr: new package
In-Reply-To: <1378936777-28308-1-git-send-email-clshotwe@rockwellcollins.com>
References: <1378936777-28308-1-git-send-email-clshotwe@rockwellcollins.com>
Message-ID: <1378936777-28308-4-git-send-email-clshotwe@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Clayton Shotwell <clshotwe@rockwellcollins.com>
---
Changes v1 -> v2:
  - General cleanup to the mk file to conform to the standard format.
  - Fixed the patch naming to avoid using the version number.
  - Cleaned up the patch to include a signed-off-by line.
  - Added a check to only build static libraries if selected.

 package/Config.in                                  |    1 +
 package/ustr/Config.in                             |    6 +
 .../ustr/ustr-0001-crossCompileModifications.patch |  144 ++++++++++++++++++++
 package/ustr/ustr.mk                               |   55 ++++++++
 4 files changed, 206 insertions(+), 0 deletions(-)
 create mode 100644 package/ustr/Config.in
 create mode 100644 package/ustr/ustr-0001-crossCompileModifications.patch
 create mode 100644 package/ustr/ustr.mk

diff --git a/package/Config.in b/package/Config.in
index 315652c..0527a6a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -707,6 +707,7 @@ source "package/pcre/Config.in"
 source "package/popt/Config.in"
 source "package/readline/Config.in"
 source "package/slang/Config.in"
+source "package/ustr/Config.in"
 endmenu
 
 menu "JSON/XML"
diff --git a/package/ustr/Config.in b/package/ustr/Config.in
new file mode 100644
index 0000000..62db57d
--- /dev/null
+++ b/package/ustr/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_USTR
+	bool "ustr"
+	help
+	  A small, safe string library.
+	  
+	  http://www.and.org/ustr/
diff --git a/package/ustr/ustr-0001-crossCompileModifications.patch b/package/ustr/ustr-0001-crossCompileModifications.patch
new file mode 100644
index 0000000..cdf17c5
--- /dev/null
+++ b/package/ustr/ustr-0001-crossCompileModifications.patch
@@ -0,0 +1,144 @@
+Changes are to allow ustr verion 1.0.4 to cross compile in buildroot.
+
+Signed-off-by Clayton Shotwell <clshotwe@rockwellcollins.com>
+
+diff -urN a/ustr-compiler.h b/ustr-compiler.h
+--- a/ustr-compiler.h	2008-02-15 14:12:28.000000000 -0600
++++ b/ustr-compiler.h	2012-06-15 11:04:55.000000000 -0500
+@@ -13,10 +13,10 @@
+ 
+ /* We assume this is enough,
+  * C99 specifies that va_copy() exists and is a macro */
+-#ifdef va_copy
++#if defined va_copy
+ # define USTR_CONF_HAVE_VA_COPY 1
+ # define USTR__VA_COPY(x, y)   va_copy(x, y)
+-#elif __va_copy
++#elif defined __va_copy
+ # define USTR_CONF_HAVE_VA_COPY 1
+ # define USTR__VA_COPY(x, y) __va_copy(x, y)
+ #else
+diff -urN a/Makefile b/Makefile
+--- a/Makefile	2008-03-05 21:38:00.000000000 -0600
++++ b/Makefile	2013-09-10 16:54:45.916874387 -0500
+@@ -8,8 +8,8 @@
+ VERS_ESONAME =1
+ VERS_ESO     =$(VERS_ESONAME).0.4
+ 
+-DESTDIR =
+-prefix=/usr
++DESTDIR ?= 
++prefix ?= /usr
+ datadir=$(prefix)/share
+ libdir=$(prefix)/lib
+ libexecdir=$(prefix)/libexec
+@@ -18,7 +18,7 @@
+ SHRDIR=$(datadir)/ustr-$(VERS_FULL)
+ DOCSHRDIR=$(datadir)/doc/ustr-devel-$(VERS_FULL)
+ EXAMDIR=$(SHRDIR)/examples
+-mandir=$(datadir)/doc/man
++mandir=$(datadir)/man
+ MBINDIR=$(libexecdir)/ustr-$(VERS_FULL)
+ 
+ ###############################################################################
+@@ -28,12 +28,12 @@
+ ###############################################################################
+ HIDE=@
+ 
+-CC = cc
+-AR = ar
+-RANLIB = ranlib
+-LDCONFIG = /sbin/ldconfig
++CC ?= cc
++AR ?= ar
++RANLIB ?= ranlib
+ 
+-CFLAGS  = -O2 -g
++CFLAGS ?= -O2 -g
++LDFLAGS ?= 
+ 
+ # Debug versions...
+ WARNS = -W -Wall -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wcast-align -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wmissing-prototypes -Wmissing-declarations -Wnested-externs -Wno-format-zero-length -Wformat-nonliteral -Wformat-security # -Wfloat-equal -- no floats
+@@ -376,7 +376,7 @@
+ all-shared: all $(LIB_SHARED)
+ 		$(HIDE)echo Done shared
+ 
+-install: all-shared ustr.pc ustr-debug.pc
++install: all ustr.pc ustr-debug.pc
+ 		$(HIDE)echo Making directories
+ 		install -d $(DESTDIR)$(libdir)
+ 		install -d $(DESTDIR)$(includedir)
+@@ -389,16 +389,6 @@
+ 		install -d $(DESTDIR)$(libdir)/pkgconfig
+ 		$(HIDE)echo Installing files
+ 		install -m 644 -t $(DESTDIR)$(libdir) $(LIB_STATIC)
+-		install -m 755 -t $(DESTDIR)$(libdir) $(LIB_SHARED)
+-		-rm -f $(DESTDIR)$(libdir)/$(OPT_LIB_SHARED_NAME)
+-		ln -s $(OPT_LIB_SHARED) $(DESTDIR)$(libdir)/$(OPT_LIB_SHARED_NAME)
+-		-rm -f $(DESTDIR)$(libdir)/$(OPT_LIB_SHAREDEV)
+-		ln -s $(OPT_LIB_SHARED_NAME) $(DESTDIR)$(libdir)/$(OPT_LIB_SHAREDEV)
+-		-rm -f $(DESTDIR)$(libdir)/$(DBG_LIB_SHARED_NAME)
+-		ln -s $(DBG_LIB_SHARED) $(DESTDIR)$(libdir)/$(DBG_LIB_SHARED_NAME)
+-		-rm -f $(DESTDIR)$(libdir)/$(DBG_LIB_SHAREDEV)
+-		ln -s $(DBG_LIB_SHARED_NAME) $(DESTDIR)$(libdir)/$(DBG_LIB_SHAREDEV)
+-		$(LDCONFIG) -n $(DESTDIR)$(libdir)
+ 		install -pm 644 -t $(DESTDIR)$(includedir) $(SRC_HDRS)
+ 		install -pm 644 -t $(DESTDIR)$(SHRDIR) $(SRC_SRCS)
+ 		install -pm 644 -t $(DESTDIR)$(SHRDIR) $(XSRC_SRCS)
+@@ -409,13 +399,24 @@
+ 		install -m 755 -t $(DESTDIR)$(bindir) ustr-import
+ 		install -pm 644 -t $(DESTDIR)$(libdir)/pkgconfig ustr.pc ustr-debug.pc
+ 
++install-shared: all-shared install
++		$(HIDE)echo Installing files
++		install -m 755 -t $(DESTDIR)$(libdir) $(LIB_SHARED)
++		-rm -f $(DESTDIR)$(libdir)/$(OPT_LIB_SHARED_NAME)
++		ln -s $(OPT_LIB_SHARED) $(DESTDIR)$(libdir)/$(OPT_LIB_SHARED_NAME)
++		-rm -f $(DESTDIR)$(libdir)/$(OPT_LIB_SHAREDEV)
++		ln -s $(OPT_LIB_SHARED_NAME) $(DESTDIR)$(libdir)/$(OPT_LIB_SHAREDEV)
++		-rm -f $(DESTDIR)$(libdir)/$(DBG_LIB_SHARED_NAME)
++		ln -s $(DBG_LIB_SHARED) $(DESTDIR)$(libdir)/$(DBG_LIB_SHARED_NAME)
++		-rm -f $(DESTDIR)$(libdir)/$(DBG_LIB_SHAREDEV)
++		ln -s $(DBG_LIB_SHARED_NAME) $(DESTDIR)$(libdir)/$(DBG_LIB_SHAREDEV)
++
+ ustr-import-multilib: ustr-import-multilib.in
+ 		sed -e 's, at INCLUDEDIR@,$(includedir),g' -e 's, at MBINDIR@,$(MBINDIR),g' < $< > $@
+ 
+ install-multilib-linux: install autoconf_64b ustr-import-multilib
+ 		install -d $(DESTDIR)$(MBINDIR)
+-		$(HIDE)mlib=`./autoconf_64b`; \
+-                   if test "x$$mlib" = "x1"; then mlib=64; else mlib=32; fi; \
++		$(HIDE))if test "`echo "__SIZEOF_SIZE_T__" | $(CC) -E -x c - | tail -n 1`" = 8; then mlib=64; else mlib=32; fi; \
+                    mv -f $(DESTDIR)$(includedir)/ustr-conf-debug.h \
+                          $(DESTDIR)$(includedir)/ustr-conf-debug-$$mlib.h; \
+                    mv -f $(DESTDIR)$(includedir)/ustr-conf.h \
+@@ -451,7 +452,8 @@
+ 
+ ustr-import: ustr-import.in autoconf_64b autoconf_vsnprintf
+ 		$(HIDE)echo Creating $@
+-		$(HIDE)sz64=`./autoconf_64b`; vsnp=`./autoconf_vsnprintf`; \
++		$(HIDE)if test "`echo "__SIZEOF_SIZE_T__" | $(CC) -E -x c - | tail -n 1`" = 8; then sz64=1; else sz64=0; fi; \
++		if test "`./autoconf_vsnprintf`" = 0; then vsnp=0; else vsnp=1; fi; \
+ 		sed -e 's, at INCLUDEDIR@,$(includedir),g' -e 's, at SHRDIR@,$(SHRDIR),g' -e 's, at VERS@,$(VERS),g'  -e 's, at VERS_FULL@,$(VERS_FULL),g' -e "s, at HAVE_64bit_SIZE_MAX@,$$sz64,g" -e "s, at HAVE_RETARDED_VSNPRINTF@,$$vsnp,g" < $< > $@
+ 		$(HIDE)chmod 755 $@
+ 
+@@ -485,7 +487,8 @@
+ ustr-conf.h: ustr-conf.h.in autoconf_64b autoconf_vsnprintf
+ 		$(HIDE)echo Creating $@
+ 		$(HIDE)have_stdint_h=0; dbg1=0; dbg2=0; \
+-                sz64=`./autoconf_64b`; vsnp=`./autoconf_vsnprintf`; \
++                if test "`echo "__SIZEOF_SIZE_T__" | $(CC) -E -x c - | tail -n 1`" = 8; then sz64=1; else sz64=0; fi; \
++                if test "`./autoconf_vsnprintf`" = 0; then vsnp=0; else vsnp=1; fi; \
+                 if test -f "/usr/include/stdint.h"; then have_stdint_h=1; fi; \
+                 if test -f "$(prefix)/include/stdint.h"; then have_stdint_h=1; fi; \
+                 if test -f "$(includedir)/stdint.h"; then have_stdint_h=1; fi; \
+@@ -494,7 +497,8 @@
+ ustr-conf-debug.h: ustr-conf.h.in autoconf_64b autoconf_vsnprintf
+ 		$(HIDE)echo Creating $@
+ 		$(HIDE)have_stdint_h=0; dbg1=1; dbg2=1; \
+-                sz64=`./autoconf_64b`; vsnp=`./autoconf_vsnprintf`; \
++                if test "`echo "__SIZEOF_SIZE_T__" | $(CC) -E -x c - | tail -n 1`" = 8; then sz64=1; else sz64=0; fi; \
++                if test "`./autoconf_vsnprintf`" = 0; then vsnp=0; else vsnp=1; fi; \
+                 if test -f "/usr/include/stdint.h"; then have_stdint_h=1; fi; \
+                 if test -f "$(prefix)/include/stdint.h"; then have_stdint_h=1; fi; \
+                 if test -f "$(includedir)/stdint.h"; then have_stdint_h=1; fi; \
diff --git a/package/ustr/ustr.mk b/package/ustr/ustr.mk
new file mode 100644
index 0000000..f4a3b71
--- /dev/null
+++ b/package/ustr/ustr.mk
@@ -0,0 +1,55 @@
+################################################################################
+#
+# ustr
+#
+################################################################################
+
+USTR_VERSION = 1.0.4
+USTR_SOURCE = ustr-$(USTR_VERSION).tar.bz2
+USTR_SITE = http://www.and.org/ustr/$(USTR_VERSION)/
+USTR_LICENSE = BSD-2c MIT LGPLv2+
+USTR_LICENSE_FILES = LICENCE LICENSE_BSD LICENSE_LGPL LICENSE_MIT
+
+USTR_INSTALL_STAGING = YES
+
+ifeq ($(BR2_PREFER_STATIC_LIB),y)
+	USTR_BUILD_CMD = all
+	USTR_INSTALL_CMD = install
+else
+	USTR_BUILD_CMD = all all-shared
+	USTR_INSTALL_CMD = install install-shared
+endif
+
+define USTR_BUILD_CMDS
+	$(MAKE) -C $(@D) $(USTR_BUILD_CMD) $(TARGET_CONFIGURE_OPTS)
+endef
+
+define USTR_INSTALL_STAGING_CMDS
+	$(MAKE) -C $(@D) $(USTR_INSTALL_CMD) $(TARGET_CONFIGURE_OPTS) \
+		DESTDIR=$(STAGING_DIR)
+endef
+
+define USTR_INSTALL_TARGET_CMDS
+	$(MAKE) -C $(@D) $(USTR_INSTALL_CMD) $(TARGET_CONFIGURE_OPTS) \
+		DESTDIR=$(TARGET_DIR)
+endef
+
+define USTR_CLEAN_CMDS
+	$(MAKE) -C $(@D) clean
+endef
+
+define HOST_USTR_BUILD_CMDS
+	$(MAKE) -C $(@D) $(USTR_BUILD_CMD) $(HOST_CONFIGURE_OPTS)
+endef
+
+define HOST_USTR_INSTALL_CMDS
+	$(MAKE) -C $(@D) $(USTR_INSTALL_CMD) $(HOST_CONFIGURE_OPTS) \
+		DESTDIR=$(HOST_DIR)
+endef
+
+define HOST_USTR_CLEAN_CMDS
+	$(MAKE) -C $(@D) clean
+endef
+
+$(eval $(generic-package))
+$(eval $(host-generic-package))
-- 
1.7.1
