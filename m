From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 7 Jan 2015 22:56:54 +0100
Subject: [Buildroot] [git commit] dmalloc: bump version to 5.5.2
Message-ID: <20150107215705.0C493807B3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=db7b7fe0ee196046c051dee09f8bd1429d29c928
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/dmalloc/0001-add-fpic.patch           |   16 ++++-----
 package/dmalloc/0002-mips.patch               |   10 +++---
 package/dmalloc/0003-fix-parallel-build.patch |   12 +++---
 package/dmalloc/0004-fix-shlibs.patch         |   46 +++++++++++++++++++++++++
 package/dmalloc/dmalloc.mk                    |    2 +-
 5 files changed, 65 insertions(+), 21 deletions(-)

diff --git a/package/dmalloc/0001-add-fpic.patch b/package/dmalloc/0001-add-fpic.patch
index 839d3ef..230a9e1 100644
--- a/package/dmalloc/0001-add-fpic.patch
+++ b/package/dmalloc/0001-add-fpic.patch
@@ -15,11 +15,9 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
  Makefile.in |   10 +++++-----
  1 file changed, 5 insertions(+), 5 deletions(-)
 
-Index: dmalloc-5.4.3/Makefile.in
-===================================================================
---- dmalloc-5.4.3.orig/Makefile.in
-+++ dmalloc-5.4.3/Makefile.in
-@@ -319,17 +319,17 @@
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -318,17 +318,17 @@
  # special _th versions of objects with the LOCK_THREADS variable defined to 1
  chunk_th.o : $(srcdir)/chunk.c
  	rm -f $@
@@ -39,8 +37,8 @@ Index: dmalloc-5.4.3/Makefile.in
 +	$(CC) $(CFLAGS) -fPIC $(CPPFLAGS) $(DEFS) $(INCS) -DLOCK_THREADS=1 \
  		-c $(srcdir)/malloc.c -o ./$@
  
- tests : $(TEST)
-@@ -355,7 +355,7 @@
+ tests : $(TEST) $(TEST_FC)
+@@ -360,7 +360,7 @@
  
  .c.o :
  	rm -f $@
@@ -49,7 +47,7 @@ Index: dmalloc-5.4.3/Makefile.in
  
  #
  # .cc.o auto-target doesn't work on some systems. 
-@@ -363,7 +363,7 @@
+@@ -368,7 +368,7 @@
  #
  dmallocc.o : $(srcdir)/dmallocc.cc
  	rm -f $@
@@ -57,4 +55,4 @@ Index: dmalloc-5.4.3/Makefile.in
 +	$(CXX) $(CFLAGS) -fPIC $(CPPFLAGS) $(DEFS) $(INCS) -c $(srcdir)/dmallocc.cc \
  		-o ./$@
  
- .texi.info :
+ #
diff --git a/package/dmalloc/0002-mips.patch b/package/dmalloc/0002-mips.patch
index 66721fd..3e6b00e 100644
--- a/package/dmalloc/0002-mips.patch
+++ b/package/dmalloc/0002-mips.patch
@@ -1,6 +1,6 @@
---- dmalloc/configure	2006-09-01 18:28:51.000000000 -0700
-+++ dmalloc-mips/configure	2006-09-01 18:49:07.000000000 -0700
-@@ -6114,7 +6114,7 @@
+--- a/configure
++++ b/configure
+@@ -7107,7 +7107,7 @@
  echo $ECHO_N "checking return.h macros work... $ECHO_C" >&6
  if test "$cross_compiling" = yes; then
     cat >>confdefs.h <<\_ACEOF
@@ -9,8 +9,8 @@
  _ACEOF
   echo "$as_me:$LINENO: result: no" >&5
  echo "${ECHO_T}no" >&6
---- dmalloc/return.h	2004-10-19 07:51:21.000000000 -0700
-+++ dmalloc-mips/return.h	2006-09-08 21:52:43.000000000 -0700
+--- a/return.h
++++ b/return.h
 @@ -106,26 +106,16 @@
  /*************************************/
  
diff --git a/package/dmalloc/0003-fix-parallel-build.patch b/package/dmalloc/0003-fix-parallel-build.patch
index d6bb6e5..c521a11 100644
--- a/package/dmalloc/0003-fix-parallel-build.patch
+++ b/package/dmalloc/0003-fix-parallel-build.patch
@@ -8,11 +8,11 @@ Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
 
 --- a/Makefile.in
 +++ b/Makefile.in
-@@ -399,6 +399,7 @@
- compat.o: compat.c dmalloc.h conf.h settings.h compat.h dmalloc_loc.h
- dmalloc.o: dmalloc.c dmalloc_argv.h conf.h settings.h dmalloc.h \
-  compat.h debug_tok.h dmalloc_loc.h env.h error_val.h version.h
+@@ -401,6 +401,7 @@
+ compat.o: compat.c conf.h settings.h dmalloc.h compat.h dmalloc_loc.h
+ dmalloc.o: dmalloc.c conf.h settings.h dmalloc_argv.h dmalloc.h compat.h \
+   debug_tok.h dmalloc_loc.h env.h error_val.h version.h
 +dmallocc.o: dmallocc.cc dmalloc.h return.h conf.h settings.h
  dmalloc_argv.o: dmalloc_argv.c conf.h settings.h dmalloc_argv.h \
-  dmalloc_argv_loc.h compat.h
- dmalloc_rand.o: dmalloc_rand.c conf.h settings.h dmalloc_rand.h
+   dmalloc_argv_loc.h compat.h
+ dmalloc_fc_t.o: dmalloc_fc_t.c conf.h settings.h dmalloc.h dmalloc_argv.h \
diff --git a/package/dmalloc/0004-fix-shlibs.patch b/package/dmalloc/0004-fix-shlibs.patch
new file mode 100644
index 0000000..a99d926
--- /dev/null
+++ b/package/dmalloc/0004-fix-shlibs.patch
@@ -0,0 +1,46 @@
+Fix shared library rules
+
+dmalloc uses ld -shared --whole-archive -o lib.so lib.a,
+but for some reason lists regular objects in addition
+to the archive, ending up with two copies of each symbol.
+
+Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
+
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -257,7 +257,7 @@ shlib : $(BUILD_SL)
+ # via: http://256.com/gray/email.html
+ $(LIB_SL) : $(LIBRARY)
+ 	rm -f $@ $@.t
+-	@shlinkargs@ $(LIBRARY) $(OBJS) $(NORMAL_OBJS)
++	@shlinkargs@ $(LIBRARY)
+ 	mv $@.t $@
+ 
+ $(LIBRARY) : $(OBJS) $(NORMAL_OBJS)
+@@ -270,7 +270,7 @@ $(LIB_TH) : $(OBJS) $(THREAD_OBJS)
+ 
+ $(LIB_TH_SL) : $(LIB_TH)
+ 	rm -f $@ $@.t
+-	@shlinkargs@ $(LIB_TH) $(OBJS) $(THREAD_OBJS)
++	@shlinkargs@ $(LIB_TH)
+ 	mv $@.t $@
+ 
+ $(LIB_CXX) : $(OBJS) $(NORMAL_OBJS) $(CXX_OBJS)
+@@ -279,7 +279,7 @@ $(LIB_CXX) : $(OBJS) $(NORMAL_OBJS) $(CXX_OBJS)
+ 
+ $(LIB_CXX_SL) : $(LIB_CXX)
+ 	rm -f $@ $@.t
+-	@shlinkargs@ $(LIB_CXX) $(OBJS) $(NORMAL_OBJS) $(CXX_OBJS)
++	@shlinkargs@ $(LIB_CXX)
+ 	mv $@.t $@
+ 
+ $(LIB_TH_CXX) : $(OBJS) $(THREAD_OBJS) $(CXX_OBJS)
+@@ -288,7 +288,7 @@ $(LIB_TH_CXX) : $(OBJS) $(THREAD_OBJS) $(CXX_OBJS)
+ 
+ $(LIB_TH_CXX_SL) : $(LIB_TH_CXX)
+ 	rm -f $@ $@.t
+-	@shlinkargs@ $(LIB_TH_CXX) $(OBJS) $(THREAD_OBJS) $(CXX_OBJS)
++	@shlinkargs@ $(LIB_TH_CXX)
+ 	mv $@.t $@
+ 
+ threadssl : $(LIB_TH_SL)
diff --git a/package/dmalloc/dmalloc.mk b/package/dmalloc/dmalloc.mk
index c095f43..581ec40 100644
--- a/package/dmalloc/dmalloc.mk
+++ b/package/dmalloc/dmalloc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DMALLOC_VERSION = 5.4.3
+DMALLOC_VERSION = 5.5.2
 DMALLOC_SOURCE = dmalloc-$(DMALLOC_VERSION).tgz
 DMALLOC_SITE = http://dmalloc.com/releases
 
