From: =?UTF-8?q?Stefan=20Fr=C3=B6berg?= <stefan.froberg@petroprogram.com>
Date: Thu, 20 Dec 2012 01:43:43 +0200
Subject: [Buildroot] [PATCH 05/12] elfutils: new package
In-Reply-To: <1355960630-25089-1-git-send-email-stefan.froberg@petroprogram.com>
References: <y>
 <1355960630-25089-1-git-send-email-stefan.froberg@petroprogram.com>
Message-ID: <1355960630-25089-5-git-send-email-stefan.froberg@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch will instruct elfutils to link against libintl (for gettext stuff), 
libargp (for nonstandard commandline processing stuff) and libgnu.a
(for fts.h and obstack-printf)

Signed-off-by: Stefan Fr?berg <stefan.froberg@petroprogram.com>
---
 package/elfutils/elfutils.002-uclibc-fixes.patch |   80 ++++++++++++++++++++++
 1 files changed, 80 insertions(+), 0 deletions(-)
 create mode 100644 package/elfutils/elfutils.002-uclibc-fixes.patch

diff --git a/package/elfutils/elfutils.002-uclibc-fixes.patch b/package/elfutils/elfutils.002-uclibc-fixes.patch
new file mode 100644
index 0000000..e27d384
--- /dev/null
+++ b/package/elfutils/elfutils.002-uclibc-fixes.patch
@@ -0,0 +1,80 @@
+diff -Naur elfutils-0.155.org/libasm/Makefile.am elfutils-0.155/libasm/Makefile.am
+--- elfutils-0.155.org/libasm/Makefile.am	2012-12-18 22:04:45.067735341 +0200
++++ elfutils-0.155/libasm/Makefile.am	2012-12-18 22:07:01.998138485 +0200
+@@ -68,7 +68,7 @@
+ 	$(LINK) -shared -o $@ -Wl,--whole-archive,$<,--no-whole-archive \
+ 		-Wl,--version-script,$(srcdir)/libasm.map,--no-undefined \
+ 		-Wl,--soname,$@.$(VERSION) \
+-		../libebl/libebl.a ../libelf/libelf.so  $(libasm_so_LDLIBS)
++		../libebl/libebl.a ../libelf/libelf.so  $(libasm_so_LDLIBS) -lintl
+ 	if readelf -d $@ | fgrep -q TEXTREL; then exit 1; fi
+ 	ln -fs $@ $@.$(VERSION)
+ 
+diff -Naur elfutils-0.155.org/libdw/Makefile.am elfutils-0.155/libdw/Makefile.am
+--- elfutils-0.155.org/libdw/Makefile.am	2012-12-18 22:04:45.122742332 +0200
++++ elfutils-0.155/libdw/Makefile.am	2012-12-18 22:11:15.806396209 +0200
+@@ -111,7 +111,7 @@
+ 		-Wl,--enable-new-dtags,-rpath,$(pkglibdir) \
+ 		-Wl,--version-script,$<,--no-undefined \
+ 		-Wl,--whole-archive $(filter-out $<,$^) -Wl,--no-whole-archive\
+-		-ldl $(zip_LIBS)
++		-ldl $(zip_LIBS) -lintl -largp
+ 	if readelf -d $@ | fgrep -q TEXTREL; then exit 1; fi
+ 	ln -fs $@ $@.$(VERSION)
+ 
+diff -Naur elfutils-0.155.org/libelf/Makefile.am elfutils-0.155/libelf/Makefile.am
+--- elfutils-0.155.org/libelf/Makefile.am	2012-12-18 22:04:45.108740552 +0200
++++ elfutils-0.155/libelf/Makefile.am	2012-12-18 22:05:51.070123897 +0200
+@@ -105,7 +105,7 @@
+ libelf.so: libelf_pic.a libelf.map
+ 	$(LINK) -shared -o $@ -Wl,--whole-archive,$<,--no-whole-archive \
+ 		-Wl,--version-script,$(srcdir)/libelf.map,--no-undefined \
+-		-Wl,--soname,$@.$(VERSION),-z,defs,-z,relro $(libelf_so_LDLIBS)
++		-Wl,--soname,$@.$(VERSION),-z,defs,-z,relro $(libelf_so_LDLIBS) -lintl
+ 	if readelf -d $@ | fgrep -q TEXTREL; then exit 1; fi
+ 	ln -fs $@ $@.$(VERSION)
+ 
+diff -Naur elfutils-0.155.org/src/Makefile.am elfutils-0.155/src/Makefile.am
+--- elfutils-0.155.org/src/Makefile.am	2012-12-18 22:25:29.358878353 +0200
++++ elfutils-0.155/src/Makefile.am	2012-12-18 22:26:46.181642119 +0200
+@@ -99,26 +99,26 @@
+ # Buggy old compilers.
+ readelf_no_Werror = yes
+ 
+-readelf_LDADD = $(libdw) $(libebl) $(libelf) $(libeu) $(libmudflap) -ldl
+-nm_LDADD = $(libdw) $(libebl) $(libelf) $(libeu) $(libmudflap) $(libgnu) -ldl \
++readelf_LDADD = $(libdw) $(libebl) $(libelf) $(libeu) $(libmudflap) -ldl -lintl -largp
++nm_LDADD = $(libdw) $(libebl) $(libelf) $(libeu) $(libmudflap) $(libgnu) -ldl -lintl -largp \
+ 	   $(demanglelib)
+-size_LDADD = $(libelf) $(libeu) $(libmudflap)
+-strip_LDADD = $(libebl) $(libelf) $(libeu) $(libmudflap) -ldl
+-ld_LDADD = $(libebl) $(libelf) $(libeu) $(libmudflap) -ldl
++size_LDADD = $(libelf) $(libeu) $(libmudflap) -lintl -largp
++strip_LDADD = $(libebl) $(libelf) $(libeu) $(libmudflap) -ldl -lintl -largp
++ld_LDADD = $(libebl) $(libelf) $(libeu) $(libmudflap) -ldl -lintl -largp
+ if NATIVE_LD
+ # -ldl is always needed for libebl.
+ ld_LDADD += libld_elf.a
+ endif
+ ld_LDFLAGS = -rdynamic
+-elflint_LDADD  = $(libebl) $(libelf) $(libeu) $(libmudflap) -ldl
+-findtextrel_LDADD = $(libdw) $(libelf) $(libmudflap)
+-addr2line_LDADD = $(libdw) $(libelf) $(libmudflap)
+-elfcmp_LDADD = $(libebl) $(libelf) $(libmudflap) -ldl
+-objdump_LDADD  = $(libasm) $(libebl) $(libelf) $(libeu) $(libmudflap) -ldl
+-ranlib_LDADD = libar.a $(libelf) $(libeu) $(libmudflap)
+-strings_LDADD = $(libelf) $(libeu) $(libmudflap)
+-ar_LDADD = libar.a $(libelf) $(libeu) $(libmudflap)
+-unstrip_LDADD = $(libebl) $(libelf) $(libdw) $(libeu) $(libmudflap) -ldl
++elflint_LDADD  = $(libebl) $(libelf) $(libeu) $(libmudflap) -ldl -lintl -largp
++findtextrel_LDADD = $(libdw) $(libelf) $(libmudflap) -lintl -largp
++addr2line_LDADD = $(libdw) $(libelf) $(libmudflap) -lintl -largp
++elfcmp_LDADD = $(libebl) $(libelf) $(libmudflap) -ldl -lintl -largp
++objdump_LDADD  = $(libasm) $(libebl) $(libelf) $(libeu) $(libmudflap) -ldl -lintl -largp
++ranlib_LDADD = libar.a $(libelf) $(libeu) $(libmudflap) -lintl -largp
++strings_LDADD = $(libelf) $(libeu) $(libmudflap) -lintl -largp
++ar_LDADD = libar.a $(libelf) $(libeu) $(libmudflap) -lintl -largp
++unstrip_LDADD = $(libebl) $(libelf) $(libdw) $(libeu) $(libmudflap) -ldl -lintl -largp
+ 
+ ldlex.o: ldscript.c
+ ldlex_no_Werror = yes
-- 
1.7.7.6
