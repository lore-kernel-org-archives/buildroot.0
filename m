From: Clayton Shotwell <clshotwe@rockwellcollins.com>
Date: Wed, 4 Sep 2013 18:09:42 -0500
Subject: [Buildroot] [PATCH 03/17] ustr: new package
In-Reply-To: <1378336196-27403-1-git-send-email-clshotwe@rockwellcollins.com>
References: <1378336196-27403-1-git-send-email-clshotwe@rockwellcollins.com>
Message-ID: <1378336196-27403-4-git-send-email-clshotwe@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Clayton Shotwell <clshotwe@rockwellcollins.com>
---
 package/Config.in                                  |    1 +
 package/ustr/Config.in                             |    6 +
 .../ustr-1.0.4-crossCompileModifications.patch     |  104 ++++++++++++++++++++
 package/ustr/ustr.mk                               |   68 +++++++++++++
 4 files changed, 179 insertions(+), 0 deletions(-)
 create mode 100644 package/ustr/Config.in
 create mode 100644 package/ustr/ustr-1.0.4-crossCompileModifications.patch
 create mode 100644 package/ustr/ustr.mk

diff --git a/package/Config.in b/package/Config.in
index bf68827..fa70e84 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -677,6 +677,7 @@ source "package/pcre/Config.in"
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
diff --git a/package/ustr/ustr-1.0.4-crossCompileModifications.patch b/package/ustr/ustr-1.0.4-crossCompileModifications.patch
new file mode 100644
index 0000000..aad9b81
--- /dev/null
+++ b/package/ustr/ustr-1.0.4-crossCompileModifications.patch
@@ -0,0 +1,104 @@
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
+--- a/Makefile	2008-03-05 21:38:00.000000000 -0600
++++ b/Makefile	2013-07-11 08:42:42.630440683 -0500
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
+@@ -398,7 +398,6 @@
+ 		ln -s $(DBG_LIB_SHARED) $(DESTDIR)$(libdir)/$(DBG_LIB_SHARED_NAME)
+ 		-rm -f $(DESTDIR)$(libdir)/$(DBG_LIB_SHAREDEV)
+ 		ln -s $(DBG_LIB_SHARED_NAME) $(DESTDIR)$(libdir)/$(DBG_LIB_SHAREDEV)
+-		$(LDCONFIG) -n $(DESTDIR)$(libdir)
+ 		install -pm 644 -t $(DESTDIR)$(includedir) $(SRC_HDRS)
+ 		install -pm 644 -t $(DESTDIR)$(SHRDIR) $(SRC_SRCS)
+ 		install -pm 644 -t $(DESTDIR)$(SHRDIR) $(XSRC_SRCS)
+@@ -414,8 +413,7 @@
+ 
+ install-multilib-linux: install autoconf_64b ustr-import-multilib
+ 		install -d $(DESTDIR)$(MBINDIR)
+-		$(HIDE)mlib=`./autoconf_64b`; \
+-                   if test "x$$mlib" = "x1"; then mlib=64; else mlib=32; fi; \
++		$(HIDE))if test "`echo "__SIZEOF_SIZE_T__" | $(CC) -E -x c - | tail -n 1`" = 8; then mlib=64; else mlib=32; fi; \
+                    mv -f $(DESTDIR)$(includedir)/ustr-conf-debug.h \
+                          $(DESTDIR)$(includedir)/ustr-conf-debug-$$mlib.h; \
+                    mv -f $(DESTDIR)$(includedir)/ustr-conf.h \
+@@ -451,7 +449,8 @@
+ 
+ ustr-import: ustr-import.in autoconf_64b autoconf_vsnprintf
+ 		$(HIDE)echo Creating $@
+-		$(HIDE)sz64=`./autoconf_64b`; vsnp=`./autoconf_vsnprintf`; \
++		$(HIDE)if test "`echo "__SIZEOF_SIZE_T__" | $(CC) -E -x c - | tail -n 1`" = 8; then sz64=1; else sz64=0; fi; \
++		if test "`./autoconf_vsnprintf`" = 0; then vsnp=0; else vsnp=1; fi; \
+ 		sed -e 's, at INCLUDEDIR@,$(includedir),g' -e 's, at SHRDIR@,$(SHRDIR),g' -e 's, at VERS@,$(VERS),g'  -e 's, at VERS_FULL@,$(VERS_FULL),g' -e "s, at HAVE_64bit_SIZE_MAX@,$$sz64,g" -e "s, at HAVE_RETARDED_VSNPRINTF@,$$vsnp,g" < $< > $@
+ 		$(HIDE)chmod 755 $@
+ 
+@@ -485,7 +484,8 @@
+ ustr-conf.h: ustr-conf.h.in autoconf_64b autoconf_vsnprintf
+ 		$(HIDE)echo Creating $@
+ 		$(HIDE)have_stdint_h=0; dbg1=0; dbg2=0; \
+-                sz64=`./autoconf_64b`; vsnp=`./autoconf_vsnprintf`; \
++                if test "`echo "__SIZEOF_SIZE_T__" | $(CC) -E -x c - | tail -n 1`" = 8; then sz64=1; else sz64=0; fi; \
++                if test "`./autoconf_vsnprintf`" = 0; then vsnp=0; else vsnp=1; fi; \
+                 if test -f "/usr/include/stdint.h"; then have_stdint_h=1; fi; \
+                 if test -f "$(prefix)/include/stdint.h"; then have_stdint_h=1; fi; \
+                 if test -f "$(includedir)/stdint.h"; then have_stdint_h=1; fi; \
+@@ -494,7 +494,8 @@
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
index 0000000..46b8bb4
--- /dev/null
+++ b/package/ustr/ustr.mk
@@ -0,0 +1,68 @@
+#############################################################
+#
+# ustr
+#
+#############################################################
+USTR_VERSION = 1.0.4
+USTR_SOURCE = ustr-$(USTR_VERSION).tar.bz2
+USTR_SITE = http://www.and.org/ustr/$(USTR_VERSION)/
+USTR_LICENSE = BSD-2c MIT LGPLv2+
+USTR_LICENSE_FILES = LICENCE LICENSE_BSD LICENSE_LGPL LICENSE_MIT
+
+##############################
+# Target Section
+##############################
+USTR_INSTALL_STAGING = YES
+USTR_INSTALL_TARGET = YES
+
+USTR_MAKE_CMDS = $(TARGET_CONFIGURE_OPTS)
+
+define USTR_BUILD_CMDS
+	$(MAKE) -C $(@D) all $(USTR_MAKE_CMDS) DESTDIR=$(STAGING_DIR)
+	$(MAKE) -C $(@D) all-shared $(USTR_MAKE_CMDS) DESTDIR=$(STAGING_DIR)
+endef
+
+define USTR_INSTALL_STAGING_CMDS
+	$(MAKE) -C $(@D) install $(USTR_MAKE_CMDS) DESTDIR=$(STAGING_DIR)
+endef
+
+define USTR_INSTALL_TARGET_CMDS
+	$(MAKE) -C $(@D) install $(USTR_MAKE_CMDS) DESTDIR=$(TARGET_DIR)
+endef
+
+define USTR_CLEAN_CMDS
+	$(MAKE) -C $(@D) clean
+endef
+
+define USTR_UNINSTALL_STAGING_CMDS
+	rm -rf $(addprefix $(TARGET_DIR),/usr/lib/libustr* /usr/lib/pkgconfig/ustr* \
+		/usr/bin/ustr* /usr/include/ustr* /usr/include/ \
+		/usr/share/doc/ustr-$(USTR_VERSION) /usr/share/ustr-$(USTR_VERSION) \
+		/usr/share/man/man1/ustr* /usr/share/man/man3/ustr*)
+endef
+
+define USTR_UNINSTALL_TARGET_CMDS
+	rm -rf $(addprefix $(TARGET_DIR),/usr/lib/libustr* /usr/lib/pkgconfig/ustr* \
+		/usr/bin/ustr* /usr/include/ustr*)
+endef
+
+##############################
+# Host Section
+##############################
+HOST_USTR_MAKE_CMDS = $(HOST_CONFIGURE_OPTS)
+
+define HOST_USTR_BUILD_CMDS
+	$(MAKE) -C $(@D) all $(HOST_USTR_MAKE_CMDS) DESTDIR=$(HOST_DIR)
+	$(MAKE) -C $(@D) all-shared $(HOST_USTR_MAKE_CMDS) DESTDIR=$(HOST_DIR)
+endef
+
+define HOST_USTR_INSTALL_CMDS
+	$(MAKE) -C $(@D) install $(HOST_USTR_MAKE_CMDS) DESTDIR=$(HOST_DIR)
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
