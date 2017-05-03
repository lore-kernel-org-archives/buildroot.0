From: xlcwu <xlcwu.taiwan@gmail.com>
Date: Wed,  3 May 2017 04:21:04 +0000
Subject: [Buildroot] [PATCH v2] libcgi: bump to version 1.1
Message-ID: <1493785264-17179-1-git-send-email-xlcwu.taiwan@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

    1. Cleanup the libcgi package, 
       by using https://github.com/rafaelsteil/libcgi as an upstream.
    2. Remove old patch and use cmake to build new version.

Signed-off-by: xlcwu <xlcwu.taiwan@gmail.com>

Changes v1 -> v2:
  - Remove old patch
  - Cleanup libcgi.mk
  - Rewrite commit log and reformat it
---
 package/libcgi/0001-misc-fixes.patch | 122 -----------------------------------
 package/libcgi/libcgi.hash           |   2 +-
 package/libcgi/libcgi.mk             |  12 ++--
 3 files changed, 7 insertions(+), 129 deletions(-)
 delete mode 100644 package/libcgi/0001-misc-fixes.patch

diff --git a/package/libcgi/0001-misc-fixes.patch b/package/libcgi/0001-misc-fixes.patch
deleted file mode 100644
index b576178..0000000
--- a/package/libcgi/0001-misc-fixes.patch
+++ /dev/null
@@ -1,122 +0,0 @@
-Index: b/src/cgi.c
-===================================================================
---- a/src/cgi.c
-+++ b/src/cgi.c
-@@ -336,7 +336,7 @@
- 	hextable['b'] = 11;
- 	hextable['c'] = 12;
- 	hextable['d'] = 13;
--	hextable['e'] = 13;
-+	hextable['e'] = 14;
- 	hextable['f'] = 15;
- 	hextable['A'] = 10;
- 	hextable['B'] = 11;
-Index: b/src/string.c
-===================================================================
---- a/src/string.c
-+++ b/src/string.c
-@@ -584,7 +584,7 @@
- 
- 	va_start(ptr, s);
- 
--	va_copy(bkp, str);
-+	va_copy(bkp, ptr);
- 	len = strlen(s);
- 
- 	while (*str) {
-Index: b/Makefile.in
-===================================================================
---- a/Makefile.in
-+++ b/Makefile.in
-@@ -5,22 +5,32 @@
- prefix = @prefix@
- exec_prefix = @exec_prefix@
- 
--SHAREDOPT = -shared
-+SHAREDOPT = -shared -fPIC -Wl,-soname,libcgi.so.0
- LIBDIR = $(prefix)/lib
--INCDIR = $(prefix)/include
-+INCDIR = $(prefix)/include/libcgi/
- MANDIR	= $(prefix)/man/man3
- SHELL = /bin/sh
- EXTRA_LIBS = 
- 
- INCS =  -Isrc
--FLAGS = -Wall -fpic
-+FLAGS = -Wall -D_REENTRANT
- 
- OBJS = src/error.o src/cgi.o src/session.o src/base64.o src/md5.o \
- 	src/string.o src/general.o src/list.o src/cookie.o
-+SHOBJS=$(OBJS:.o=.sh.o)
- 
--.c.o: $(CC) $(FLAGS) -c $<
-+ALL_TARGETS = src/libcgi.a
-+ifeq ($(STATIC),)
-+ALL_TARGETS += src/libcgi.so
-+endif
- 
--all: $(OBJS) src/libcgi.so
-+%.o: %.c
-+	$(CC) $(FLAGS) -c $*.c -o $@
-+
-+%.sh.o: %.c
-+	$(CC) $(FLAGS) -fPIC -c $*.c -o $@
-+
-+all: $(ALL_TARGETS)
- 
- 	@echo ""
- 	@echo ""
-@@ -48,14 +58,17 @@
- src/libcgi.a: $(OBJS)
- 	$(AR) rc src/libcgi.a $(OBJS)
- 
--src/libcgi.so: src/libcgi.a
--	$(CC) $(SHAREDOPT) -o src/libcgi.so $(OBJS) $(EXTRA_LIBS)
-+src/libcgi.so: $(SHOBJS)
-+	$(CC) $(SHAREDOPT) -o src/libcgi.so $(SHOBJS) $(EXTRA_LIBS)
- 
- install:
--	cp src/libcgi.a $(LIBDIR)
--	cp src/libcgi.so $(LIBDIR)
--	cp src/cgi.h $(INCDIR)
--	cp src/session.h $(INCDIR)
-+	cp src/libcgi.a $(DESTDIR)/$(LIBDIR)
-+ifeq ($(STATIC),)
-+	cp src/libcgi.so $(DESTDIR)/$(LIBDIR)
-+endif
-+	[ -d $(DESTDIR)/$(INCDIR) ] || mkdir -p $(DESTDIR)/$(INCDIR)
-+	cp src/cgi.h $(DESTDIR)/$(INCDIR)
-+	cp src/session.h $(DESTDIR)/$(INCDIR)
- 
- 
- src/error.o: src/error.c src/error.h
-@@ -69,8 +82,9 @@
- src/list.o: src/list.c
- 
- clean:
--	find src/ -name *.*o -exec rm -f {} \;
-+	find src/ -name *.o -exec rm -f {} \;
- 	find src/ -name *.a -exec rm -f {} \;
-+	find src/ -name *.so -exec rm -f {} \;
- 
- uninstall: clean
- 	rm -f $(LIBDIR)/libcgi.*
-@@ -78,11 +92,11 @@
- 	rm -f $(INCDIR)/session.h
- 	rm -f $(MANDIR)/libcgi*
- 
--install_man:
--	cp doc/man/man3/libcgi_base64.3 $(MANDIR)
--	cp doc/man/man3/libcgi_cgi.3 $(MANDIR)
--	cp doc/man/man3/libcgi_general.3 $(MANDIR)
--	cp doc/man/man3/libcgi_string.3 $(MANDIR)
--	cp doc/man/man3/libcgi_session.3 $(MANDIR)
--	cp doc/man/man3/libcgi_cookie.3 $(MANDIR)
-+#install_man:
-+#	cp doc/man/man3/libcgi_base64.3 $(MANDIR)
-+#	cp doc/man/man3/libcgi_cgi.3 $(MANDIR)
-+#	cp doc/man/man3/libcgi_general.3 $(MANDIR)
-+#	cp doc/man/man3/libcgi_string.3 $(MANDIR)
-+#	cp doc/man/man3/libcgi_session.3 $(MANDIR)
-+#	cp doc/man/man3/libcgi_cookie.3 $(MANDIR)
- 
diff --git a/package/libcgi/libcgi.hash b/package/libcgi/libcgi.hash
index 6bd7c0c..1ac1440 100644
--- a/package/libcgi/libcgi.hash
+++ b/package/libcgi/libcgi.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256  861df39cc0195d43419c4c3de8dff4f42478db66c9ba0b0c1e994c99400e130c  libcgi-1.0.tar.gz
+sha256  128445f2f828e84905d51bd53d11e2e08c489df3a07225ff9f198c1318092fe6  libcgi-1.1.tar.gz
diff --git a/package/libcgi/libcgi.mk b/package/libcgi/libcgi.mk
index de2a1e4..66bb165 100644
--- a/package/libcgi/libcgi.mk
+++ b/package/libcgi/libcgi.mk
@@ -4,12 +4,12 @@
 #
 ################################################################################
 
-LIBCGI_VERSION = 1.0
-LIBCGI_SITE = http://downloads.sourceforge.net/project/libcgi/libcgi/$(LIBCGI_VERSION)
+LIBCGI_VERSION = 1.1
+LIBCGI_SITE = https://github.com/rafaelsteil/libcgi/releases/download/v$(LIBCGI_VERSION)
+
 LIBCGI_INSTALL_STAGING = YES
-# use cross CC/AR rather than host
-LIBCGI_MAKE_ENV = CC="$(TARGET_CC) $(TARGET_CFLAGS)" AR="$(TARGET_AR)" \
-	$(if $(BR2_STATIC_LIBS),STATIC=1)
 LIBCGI_LICENSE = LGPL-2.1+
 
-$(eval $(autotools-package))
+LIBCGI_SUPPORTS_IN_SOURCE_BUILD = NO
+
+$(eval $(cmake-package))
-- 
1.9.1
