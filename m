From: Lars Munch <lars@segv.dk>
Date: Tue, 12 Dec 2006 13:45:48 +0100
Subject: [Buildroot] [PATCH] fix libcgi building
Message-ID: <20061212124548.GA25794@tuxedo.home.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all

The attached patch fixes af few issues with libcgi:

* Remove bogus tab in libcgi.mk that prevented the library from being build
* Added headerfiles to STAGING_DIR in usr/include/libcgi so that we
  can actually use the library with the toolchain
* Added patch that fixes up the makefile.in and fixes a few bugs in libcgi

Most of the patch has been taken from the debian package.

Please apply.

-- Lars Munch
-------------- next part --------------
Index: buildroot/package/libcgi/libcgi.mk
===================================================================
--- buildroot/package/libcgi/libcgi.mk	(revision 16845)
+++ buildroot/package/libcgi/libcgi.mk	(working copy)
@@ -15,6 +15,7 @@
 
 $(LIBCGI_DIR)/.source: $(DL_DIR)/$(LIBCGI_SOURCE)
 	$(ZCAT) $(DL_DIR)/$(LIBCGI_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
+	toolchain/patch-kernel.sh $(LIBCGI_DIR) package/libcgi/ libcgi\*.patch
 	touch $(LIBCGI_DIR)/.source
 
 $(LIBCGI_DIR)/.configured: $(LIBCGI_DIR)/.source
@@ -25,7 +26,7 @@
 			--target=$(GNU_TARGET_NAME) \
 			--host=$(GNU_TARGET_NAME) \
 			--build=$(GNU_HOST_NAME) \
-			--prefix=/usr \
+			--prefix=$(STAGING_DIR) \
 			--sysconfdir=/etc \
 	);
 	touch $(LIBCGI_DIR)/.configured;
@@ -33,9 +34,13 @@
 $(LIBCGI_DIR)/$(LIBCGI_LIBRARY): $(LIBCGI_DIR)/.configured
 	$(MAKE) CC=$(TARGET_CC) -C $(LIBCGI_DIR)
 
-$(TARGET_DIR)/$(LIBCGI_TARGET_LIBRARY): $(LIBCGI_DIR)/$(LIBCGI_LIBRARY)
-	cp $(LIBCGI_DIR)/src/libcgi.so $(TARGET_DIR)/usr/lib/
+$(STAGING_DIR)/lib/libcgi.so: $(LIBCGI_DIR)/$(LIBCGI_LIBRARY)
+	$(MAKE) -C $(LIBCGI_DIR) install
+	touch -c $(STAGING_DIR)/lib/libcgi.so
 
+$(TARGET_DIR)/$(LIBCGI_TARGET_LIBRARY): $(STAGING_DIR)/lib/libcgi.so
+	cp -dpf $(STAGING_DIR)/lib/libcgi.so* $(TARGET_DIR)/usr/lib/
+
 libcgi: uclibc $(TARGET_DIR)/$(LIBCGI_TARGET_LIBRARY)
 
 libcgi-source: $(DL_DIR)/$(LIBCGI_SOURCE)
@@ -54,6 +59,6 @@
 #
 #############################################################
 ifeq ($(strip $(BR2_PACKAGE_LIBCGI)),y)
-	TARGETS+=libcgi
+TARGETS+=libcgi
 endif
 
Index: buildroot/package/libcgi/libcgi.patch
===================================================================
--- buildroot/package/libcgi/libcgi.patch	(revision 0)
+++ buildroot/package/libcgi/libcgi.patch	(revision 0)
@@ -0,0 +1,109 @@
+--- libcgi-1.0.orig/src/cgi.c
++++ libcgi-1.0/src/cgi.c
+@@ -336,7 +336,7 @@
+ 	hextable['b'] = 11;
+ 	hextable['c'] = 12;
+ 	hextable['d'] = 13;
+-	hextable['e'] = 13;
++	hextable['e'] = 14;
+ 	hextable['f'] = 15;
+ 	hextable['A'] = 10;
+ 	hextable['B'] = 11;
+--- libcgi-1.0.orig/src/string.c
++++ libcgi-1.0/src/string.c
+@@ -584,7 +584,7 @@
+ 
+ 	va_start(ptr, s);
+ 
+-	va_copy(bkp, str);
++	va_copy(bkp, ptr);
+ 	len = strlen(s);
+ 
+ 	while (*str) {
+--- libcgi-1.0.orig/Makefile.in
++++ libcgi-1.0/Makefile.in
+@@ -5,22 +5,27 @@
+ prefix = @prefix@
+ exec_prefix = @exec_prefix@
+ 
+-SHAREDOPT = -shared
++SHAREDOPT = -shared -fPIC,-Wl,-soname,libcgi.so.0
+ LIBDIR = $(prefix)/lib
+-INCDIR = $(prefix)/include
++INCDIR = $(prefix)/include/libcgi/
+ MANDIR	= $(prefix)/man/man3
+ SHELL = /bin/sh
+ EXTRA_LIBS = 
+ 
+ INCS =  -Isrc
+-FLAGS = -Wall -fpic
++FLAGS = -Wall -D_REENTRANT
+ 
+ OBJS = src/error.o src/cgi.o src/session.o src/base64.o src/md5.o \
+ 	src/string.o src/general.o src/list.o src/cookie.o
++SHOBJS=$(OBJS:.o=.sh.o)
+ 
+-.c.o: $(CC) $(FLAGS) -c $<
++%.o: %.c
++	$(CC) $(FLAGS) -c $*.c -o $@
+ 
+-all: $(OBJS) src/libcgi.so
++%.sh.o: %.c
++	$(CC) $(FLAGS) -fPIC -c $*.c -o $@
++
++all: src/libcgi.so src/libcgi.a
+ 
+ 	@echo ""
+ 	@echo ""
+@@ -48,14 +53,15 @@
+ src/libcgi.a: $(OBJS)
+ 	$(AR) rc src/libcgi.a $(OBJS)
+ 
+-src/libcgi.so: src/libcgi.a
+-	$(CC) $(SHAREDOPT) -o src/libcgi.so $(OBJS) $(EXTRA_LIBS)
++src/libcgi.so: $(SHOBJS)
++	$(CC) $(SHAREDOPT) -o src/libcgi.so $(SHOBJS) $(EXTRA_LIBS)
+ 
+ install:
+-	cp src/libcgi.a $(LIBDIR)
+-	cp src/libcgi.so $(LIBDIR)
+-	cp src/cgi.h $(INCDIR)
+-	cp src/session.h $(INCDIR)
++	cp src/libcgi.a $(DESTDIR)/$(LIBDIR)
++	cp src/libcgi.so $(DESTDIR)/$(LIBDIR)
++	[ -d $(DESTDIR)/$(INCDIR) ] || mkdir $(DESTDIR)/$(INCDIR)
++	cp src/cgi.h $(DESTDIR)/$(INCDIR)
++	cp src/session.h $(DESTDIR)/$(INCDIR)
+ 
+ 
+ src/error.o: src/error.c src/error.h
+@@ -69,8 +75,9 @@
+ src/list.o: src/list.c
+ 
+ clean:
+-	find src/ -name *.*o -exec rm -f {} \;
++	find src/ -name *.o -exec rm -f {} \;
+ 	find src/ -name *.a -exec rm -f {} \;
++	find src/ -name *.so -exec rm -f {} \;
+ 
+ uninstall: clean
+ 	rm -f $(LIBDIR)/libcgi.*
+@@ -78,11 +85,11 @@
+ 	rm -f $(INCDIR)/session.h
+ 	rm -f $(MANDIR)/libcgi*
+ 
+-install_man:
+-	cp doc/man/man3/libcgi_base64.3 $(MANDIR)
+-	cp doc/man/man3/libcgi_cgi.3 $(MANDIR)
+-	cp doc/man/man3/libcgi_general.3 $(MANDIR)
+-	cp doc/man/man3/libcgi_string.3 $(MANDIR)
+-	cp doc/man/man3/libcgi_session.3 $(MANDIR)
+-	cp doc/man/man3/libcgi_cookie.3 $(MANDIR)
++#install_man:
++#	cp doc/man/man3/libcgi_base64.3 $(MANDIR)
++#	cp doc/man/man3/libcgi_cgi.3 $(MANDIR)
++#	cp doc/man/man3/libcgi_general.3 $(MANDIR)
++#	cp doc/man/man3/libcgi_string.3 $(MANDIR)
++#	cp doc/man/man3/libcgi_session.3 $(MANDIR)
++#	cp doc/man/man3/libcgi_cookie.3 $(MANDIR)
+ 
