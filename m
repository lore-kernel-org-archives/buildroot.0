From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 22 Jul 2012 15:28:36 +0200
Subject: [Buildroot] [PATCH 08/11] libpng: fix host-libpng build on system
	on which zlib.h is missing.
In-Reply-To: <1342963719-1810-1-git-send-email-s.martin49@gmail.com>
References: <1342963719-1810-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1342963719-1810-9-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch ensures libpng.sym is generated using the same zlib.h as the one
used for building binaries.

As a side effect, this patch fix host-libpng build on freshly installed
debian-based systems, on which zlib development data may be not installed.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>

 create mode 100644 package/libpng/libpng-fix-build-if-zlib-h-is-missing-on-the-host.patch

diff --git a/package/libpng/libpng-fix-build-if-zlib-h-is-missing-on-the-host.patch b/package/libpng/libpng-fix-build-if-zlib-h-is-missing-on-the-host.patch
new file mode 100644
index 0000000..4e22498
--- /dev/null
+++ b/package/libpng/libpng-fix-build-if-zlib-h-is-missing-on-the-host.patch
@@ -0,0 +1,47 @@
+This patch ensure that '$(O)/host/usr/include' is added to the command generating
+libpng.sym.
+
+This allows building host-libpng on a system missing zlib development data, which
+are provided by '$(O)/host/usr/include' though.
+
+This avoid the following error occurs:
+
+/usr/bin/cpp -DPNG_CONFIGURE_LIBPNG  -DPNG_BUILDSYMS ./png.h | \
+		/bin/sed -n -e \
+		's|^.*PNG_FUNCTION_EXPORT[ 	]*\(['_abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789']*\).*$|\1|p' \
+		-e 's|^.*PNG_DATA_EXPORT[ 	]*\(['_abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789']*\).*$|\1|p' \
+			>libpng.sym.new
+./png.h:421:18: fatal error: zlib.h: No such file or directory
+[...]
+libtool: link: /usr/bin/gcc -shared  .libs/libpng14_la-png.o .libs/libpng14_la-pngset.o .libs/libpng14_la-pngget.o .libs/libpng14_la-pngrutil.o .libs/libpng14_la-pngtrans.o .libs/libpng14_la-pngwutil.o .libs/libpng14_la-pngread.o .libs/libpng14_la-pngrio.o .libs/libpng14_la-pngwio.o .libs/libpng14_la-pngwrite.o .libs/libpng14_la-pngrtran.o .libs/libpng14_la-pngwtran.o .libs/libpng14_la-pngmem.o .libs/libpng14_la-pngerror.o .libs/libpng14_la-pngpread.o   -L/opt/buildroot/output/host/lib -L/opt/buildroot/output/host/usr/lib -lz -lm  -Wl,--version-script=libpng.vers -Wl,-rpath -Wl,/opt/buildroot/output/host/usr/lib   -Wl,-soname -Wl,libpng14.so.14 -o .libs/libpng14.so.14.11.0
+/usr/bin/ld:libpng.vers:2: syntax error in VERSION script
+collect2: ld returned 1 exit status
+make[2]: *** [libpng14.la] Error 1
+
+Signed-off-by: Samuel Martin <s.martin49@gmail.com>
+
+---
+diff -purN host-libpng-1.4.11.orig/Makefile.am host-libpng-1.4.11/Makefile.am
+--- host-libpng-1.4.11.orig/Makefile.am	2012-07-22 01:06:18.692261599 +0000
++++ host-libpng-1.4.11/Makefile.am	2012-07-22 01:11:59.350414529 +0000
+@@ -95,7 +95,7 @@ $(PNGLIB_BASENAME)-config: libpng-config
+ 
+ libpng.sym: png.h pngconf.h
+ 	rm -f $@ $@.new
+-	$(CPP) @LIBPNG_DEFINES@ $(CPPFLAGS) -DPNG_BUILDSYMS $(srcdir)/png.h | \
++	$(CPP) @LIBPNG_DEFINES@ $(CPPFLAGS) $(CFLAGS) -DPNG_BUILDSYMS $(srcdir)/png.h | \
+ 		$(SED) -n -e \
+ 		's|^.*PNG_FUNCTION_EXPORT[ 	]*\([$(AN)]*\).*$$|$(SYMBOL_PREFIX)\1|p' \
+ 		-e 's|^.*PNG_DATA_EXPORT[ 	]*\([$(AN)]*\).*$$|$(SYMBOL_PREFIX)\1|p' \
+diff -purN host-libpng-1.4.11.orig/Makefile.in host-libpng-1.4.11/Makefile.in
+--- host-libpng-1.4.11.orig/Makefile.in	2012-07-22 01:06:18.692261599 +0000
++++ host-libpng-1.4.11/Makefile.in	2012-07-22 01:12:38.093537811 +0000
+@@ -1214,7 +1214,7 @@ $(PNGLIB_BASENAME)-config: libpng-config
+ 
+ libpng.sym: png.h pngconf.h
+ 	rm -f $@ $@.new
+-	$(CPP) @LIBPNG_DEFINES@ $(CPPFLAGS) -DPNG_BUILDSYMS $(srcdir)/png.h | \
++	$(CPP) @LIBPNG_DEFINES@ $(CPPFLAGS) $(CFLAGS) -DPNG_BUILDSYMS $(srcdir)/png.h | \
+ 		$(SED) -n -e \
+ 		's|^.*PNG_FUNCTION_EXPORT[ 	]*\([$(AN)]*\).*$$|$(SYMBOL_PREFIX)\1|p' \
+ 		-e 's|^.*PNG_DATA_EXPORT[ 	]*\([$(AN)]*\).*$$|$(SYMBOL_PREFIX)\1|p' \
diff --git a/package/libpng/libpng.mk b/package/libpng/libpng.mk
index dd295c6..7b17e72 100644
--- a/package/libpng/libpng.mk
+++ b/package/libpng/libpng.mk
@@ -30,5 +30,7 @@ ifneq ($(BR2_HAVE_DEVFILES),y)
 LIBPNG_POST_INSTALL_TARGET_HOOKS += LIBPNG_REMOVE_CONFIG_SCRIPTS
 endif
 
+HOST_LIBPNG_AUTORECONF = YES
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
1.7.11.2
