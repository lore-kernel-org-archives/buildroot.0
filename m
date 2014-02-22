From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Feb 2014 22:12:00 +0100
Subject: [Buildroot] [PATCH] libcgi: fix build failure on pure static
	library builds
Message-ID: <1393103520-9012-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libcgi always builds both the shared and static library, which doesn't
work on architecture that don't support shared library at all, such as
Blackfin with the FLAT format. libcgi uses autoconf, but not automake,
and the Makefile is not of the highest possible quality, so this
commit fixes the problem by introducing a "STATIC" variable that can
be set from the environment. When set to a non-empty value, the
Makefile assumes it should only build the static version of the
library.

Note that this package is in desperate need of some care: there is one
single patch that mixes several changes together, it doesn't have a
description or a Signed-off-by line, and there is now a github project
for libcgi at https://github.com/rafaelsteil/libcgi/ that has the same
fixes.

However, for the purpose of the master branch, we're doing the most
minimal fix possible, by just adding this STATIC variable.

Fixes:

  http://autobuild.buildroot.net/results/625/625105bcaf26345f422b225787fc19611b65cd57/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libcgi/libcgi.mk    |  3 ++-
 package/libcgi/libcgi.patch | 39 ++++++++++++++++++++++++++-------------
 2 files changed, 28 insertions(+), 14 deletions(-)

diff --git a/package/libcgi/libcgi.mk b/package/libcgi/libcgi.mk
index 40a9f32..f46a1fa 100644
--- a/package/libcgi/libcgi.mk
+++ b/package/libcgi/libcgi.mk
@@ -8,7 +8,8 @@ LIBCGI_VERSION = 1.0
 LIBCGI_SITE = http://downloads.sourceforge.net/project/libcgi/libcgi/$(LIBCGI_VERSION)
 LIBCGI_INSTALL_STAGING = YES
 # use cross CC/AR rather than host
-LIBCGI_MAKE_ENV = CC="$(TARGET_CC) $(TARGET_CFLAGS)" AR="$(TARGET_AR)"
+LIBCGI_MAKE_ENV = CC="$(TARGET_CC) $(TARGET_CFLAGS)" AR="$(TARGET_AR)" \
+	$(if $(BR2_PREFER_STATIC_LIB),STATIC=1)
 LIBCGI_LICENSE = LGPLv2.1+
 
 $(eval $(autotools-package))
diff --git a/package/libcgi/libcgi.patch b/package/libcgi/libcgi.patch
index 12a7b10..b576178 100644
--- a/package/libcgi/libcgi.patch
+++ b/package/libcgi/libcgi.patch
@@ -1,5 +1,7 @@
---- libcgi-1.0.orig/src/cgi.c
-+++ libcgi-1.0/src/cgi.c
+Index: b/src/cgi.c
+===================================================================
+--- a/src/cgi.c
++++ b/src/cgi.c
 @@ -336,7 +336,7 @@
  	hextable['b'] = 11;
  	hextable['c'] = 12;
@@ -9,8 +11,10 @@
  	hextable['f'] = 15;
  	hextable['A'] = 10;
  	hextable['B'] = 11;
---- libcgi-1.0.orig/src/string.c
-+++ libcgi-1.0/src/string.c
+Index: b/src/string.c
+===================================================================
+--- a/src/string.c
++++ b/src/string.c
 @@ -584,7 +584,7 @@
  
  	va_start(ptr, s);
@@ -20,9 +24,11 @@
  	len = strlen(s);
  
  	while (*str) {
---- libcgi-1.0.orig/Makefile.in
-+++ libcgi-1.0/Makefile.in
-@@ -5,22 +5,27 @@
+Index: b/Makefile.in
+===================================================================
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -5,22 +5,32 @@
  prefix = @prefix@
  exec_prefix = @exec_prefix@
  
@@ -44,18 +50,23 @@
 +SHOBJS=$(OBJS:.o=.sh.o)
  
 -.c.o: $(CC) $(FLAGS) -c $<
-+%.o: %.c
-+	$(CC) $(FLAGS) -c $*.c -o $@
++ALL_TARGETS = src/libcgi.a
++ifeq ($(STATIC),)
++ALL_TARGETS += src/libcgi.so
++endif
  
 -all: $(OBJS) src/libcgi.so
++%.o: %.c
++	$(CC) $(FLAGS) -c $*.c -o $@
++
 +%.sh.o: %.c
 +	$(CC) $(FLAGS) -fPIC -c $*.c -o $@
 +
-+all: src/libcgi.so src/libcgi.a
++all: $(ALL_TARGETS)
  
  	@echo ""
  	@echo ""
-@@ -48,14 +53,15 @@
+@@ -48,14 +58,17 @@
  src/libcgi.a: $(OBJS)
  	$(AR) rc src/libcgi.a $(OBJS)
  
@@ -70,14 +81,16 @@
 -	cp src/cgi.h $(INCDIR)
 -	cp src/session.h $(INCDIR)
 +	cp src/libcgi.a $(DESTDIR)/$(LIBDIR)
++ifeq ($(STATIC),)
 +	cp src/libcgi.so $(DESTDIR)/$(LIBDIR)
++endif
 +	[ -d $(DESTDIR)/$(INCDIR) ] || mkdir -p $(DESTDIR)/$(INCDIR)
 +	cp src/cgi.h $(DESTDIR)/$(INCDIR)
 +	cp src/session.h $(DESTDIR)/$(INCDIR)
  
  
  src/error.o: src/error.c src/error.h
-@@ -69,8 +75,9 @@
+@@ -69,8 +82,9 @@
  src/list.o: src/list.c
  
  clean:
@@ -88,7 +101,7 @@
  
  uninstall: clean
  	rm -f $(LIBDIR)/libcgi.*
-@@ -78,11 +85,11 @@
+@@ -78,11 +92,11 @@
  	rm -f $(INCDIR)/session.h
  	rm -f $(MANDIR)/libcgi*
  
-- 
1.8.3.2
