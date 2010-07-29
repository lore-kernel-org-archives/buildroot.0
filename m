From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 29 Jul 2010 23:48:52 +0200
Subject: [Buildroot] [PATCH 09/19] dmalloc: pass -fPIC when compiling
In-Reply-To: <cover.1280440124.git.thomas.petazzoni@free-electrons.com>
References: <cover.1280440124.git.thomas.petazzoni@free-electrons.com>
Message-ID: <c19c6451413ed873eccf321e7f79cea1f78aa95d.1280440124.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is needed to avoid:

/home/test/mips-4.4/bin/mips-linux-gnu-ld --sysroot=/home/test/outputs/test-35/staging -shared --whole-archive -soname libdmallocxx.so -o libdmallocxx.so.t libdmallocxx.a
/home/test/mips-4.4/bin/mips-linux-gnu-ld: libdmalloc.a(arg_check.o): relocation R_MIPS_HI16 against `_dmalloc_flags' can not be used when making a shared object; recompile with -fPIC

It is fixed through a patch to Makefile.in instead of passing a CFLAGS
variable to ./configure environment in order to avoid cluttering the
configuration cache with incorrect values.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/dmalloc/dmalloc-5.4.3-add-fpic.patch |   60 ++++++++++++++++++++++++++
 1 files changed, 60 insertions(+), 0 deletions(-)
 create mode 100644 package/dmalloc/dmalloc-5.4.3-add-fpic.patch

diff --git a/package/dmalloc/dmalloc-5.4.3-add-fpic.patch b/package/dmalloc/dmalloc-5.4.3-add-fpic.patch
new file mode 100644
index 0000000..839d3ef
--- /dev/null
+++ b/package/dmalloc/dmalloc-5.4.3-add-fpic.patch
@@ -0,0 +1,60 @@
+Without -fPIC, dmalloc does not build with:
+
+/home/test/mips-4.4/bin/mips-linux-gnu-ld --sysroot=/home/test/outputs/test-35/staging -shared --whole-archive -soname libdmallocxx.so -o libdmallocxx.so.t libdmallocxx.a
+/home/test/mips-4.4/bin/mips-linux-gnu-ld: libdmalloc.a(arg_check.o): relocation R_MIPS_HI16 against `_dmalloc_flags' can not be used when making a shared object; recompile with -fPIC
+libdmalloc.a(arg_check.o): could not read symbols: Bad value
+
+This patch, taken from
+http://sources.gentoo.org/cgi-bin/viewvc.cgi/gentoo-x86/dev-libs/dmalloc/files/dmalloc-5.2.4-fpic.patch?hideattic=0&view=markup,
+fixes the problem by passing the -fPIC flag. It isn't passed through
+the ./configure environment in order to not clutter the configuration
+cache with incorrect values.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ Makefile.in |   10 +++++-----
+ 1 file changed, 5 insertions(+), 5 deletions(-)
+
+Index: dmalloc-5.4.3/Makefile.in
+===================================================================
+--- dmalloc-5.4.3.orig/Makefile.in
++++ dmalloc-5.4.3/Makefile.in
+@@ -319,17 +319,17 @@
+ # special _th versions of objects with the LOCK_THREADS variable defined to 1
+ chunk_th.o : $(srcdir)/chunk.c
+ 	rm -f $@
+-	$(CC) $(CFLAGS) $(CPPFLAGS) $(DEFS) $(INCS) -DLOCK_THREADS=1 \
++	$(CC) $(CFLAGS) -fPIC $(CPPFLAGS) $(DEFS) $(INCS) -DLOCK_THREADS=1 \
+ 		-c $(srcdir)/chunk.c -o ./$@
+ 
+ error_th.o : $(srcdir)/error.c
+ 	rm -f $@
+-	$(CC) $(CFLAGS) $(CPPFLAGS) $(DEFS) $(INCS) -DLOCK_THREADS=1 \
++	$(CC) $(CFLAGS) -fPIC $(CPPFLAGS) $(DEFS) $(INCS) -DLOCK_THREADS=1 \
+ 		-c $(srcdir)/error.c -o ./$@
+ 
+ malloc_th.o : $(srcdir)/malloc.c
+ 	rm -f $@
+-	$(CC) $(CFLAGS) $(CPPFLAGS) $(DEFS) $(INCS) -DLOCK_THREADS=1 \
++	$(CC) $(CFLAGS) -fPIC $(CPPFLAGS) $(DEFS) $(INCS) -DLOCK_THREADS=1 \
+ 		-c $(srcdir)/malloc.c -o ./$@
+ 
+ tests : $(TEST)
+@@ -355,7 +355,7 @@
+ 
+ .c.o :
+ 	rm -f $@
+-	$(CC) $(CFLAGS) $(CPPFLAGS) $(DEFS) $(INCS) -c $< -o ./$@
++	$(CC) $(CFLAGS) -fPIC $(CPPFLAGS) $(DEFS) $(INCS) -c $< -o ./$@
+ 
+ #
+ # .cc.o auto-target doesn't work on some systems. 
+@@ -363,7 +363,7 @@
+ #
+ dmallocc.o : $(srcdir)/dmallocc.cc
+ 	rm -f $@
+-	$(CXX) $(CFLAGS) $(CPPFLAGS) $(DEFS) $(INCS) -c $(srcdir)/dmallocc.cc \
++	$(CXX) $(CFLAGS) -fPIC $(CPPFLAGS) $(DEFS) $(INCS) -c $(srcdir)/dmallocc.cc \
+ 		-o ./$@
+ 
+ .texi.info :
-- 
1.7.0.4
