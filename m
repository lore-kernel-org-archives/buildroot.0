From: sonic.adi at gmail.com <sonic.adi@gmail.com>
Date: Mon, 30 Dec 2013 18:35:53 +0800
Subject: [Buildroot] [PATCH] package: libpng: don't append prefix to symbol
	names in the version script file
Message-ID: <1388399753-11513-1-git-send-email-Sonic.adi@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Sonic Zhang <sonic.zhang@analog.com>

Even if Blackfin GNU toolchain add prefix '_' to all symbols,
symbol prefix is not accepted in the link flag --version-script.
Don't append prefix in the symbols in the version script file.

Signed-off-by: Sonic Zhang <sonic.zhang@analog.com>
---
 .../libpng/libpng-02-ingore-symbol-prefix.patch    |   26 ++++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 package/libpng/libpng-02-ingore-symbol-prefix.patch

diff --git a/package/libpng/libpng-02-ingore-symbol-prefix.patch b/package/libpng/libpng-02-ingore-symbol-prefix.patch
new file mode 100644
index 0000000..7f2cfff
--- /dev/null
+++ b/package/libpng/libpng-02-ingore-symbol-prefix.patch
@@ -0,0 +1,26 @@
+Even if Blackfin GNU toolchain add prefix '_' to all symbols,
+symbol prefix is not accepted in the link flag --version-script.
+Don't append prefix in the symbols in the version script file.
+
+--- libpng-1.6.8/Makefile.am	2013-12-30 18:23:08.261797417 +0800
++++ libpng-1.6.8.bak/Makefile.am	2013-12-30 18:22:15.565795726 +0800
+@@ -225,7 +225,7 @@
+ # interfering with the symbol file format.
+ SYMBOL_CFLAGS = -DPNGLIB_LIBNAME='PNG at PNGLIB_MAJOR@@PNGLIB_MINOR at _0'\
+ 		-DPNGLIB_VERSION='@PNGLIB_VERSION@'\
+-		-DSYMBOL_PREFIX='$(SYMBOL_PREFIX)'\
++		-DSYMBOL_PREFIX=''\
+ 		-DPNG_NO_USE_READ_MACROS -DPNG_BUILDING_SYMBOL_TABLE
+ 
+ if DO_PNG_PREFIX
+--- libpng-1.6.8/Makefile.in	2013-12-30 18:23:08.261797417 +0800
++++ libpng-1.6.8.bak/Makefile.in	2013-12-30 18:22:09.853794547 +0800
+@@ -698,7 +698,7 @@
+ # interfering with the symbol file format.
+ SYMBOL_CFLAGS = -DPNGLIB_LIBNAME='PNG at PNGLIB_MAJOR@@PNGLIB_MINOR at _0' \
+ 	-DPNGLIB_VERSION='@PNGLIB_VERSION@' \
+-	-DSYMBOL_PREFIX='$(SYMBOL_PREFIX)' -DPNG_NO_USE_READ_MACROS \
++	-DSYMBOL_PREFIX='' -DPNG_NO_USE_READ_MACROS \
+ 	-DPNG_BUILDING_SYMBOL_TABLE $(am__append_5)
+ all: $(BUILT_SOURCES) config.h
+ 	$(MAKE) $(AM_MAKEFLAGS) all-am
-- 
1.7.9.5
