From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 10 Nov 2012 22:42:42 +0100
Subject: [Buildroot] =?utf-8?q?=5BPATCH_05/11=5D_nfs-utils=3A_reformat_pat?=
	=?utf-8?q?ch_set_as_git_patches?=
In-Reply-To: <cover.1352583641.git.thomas.petazzoni@free-electrons.com>
References: <cover.1352583641.git.thomas.petazzoni@free-electrons.com>
Message-ID: <d86142f877a476239ab6c3cf49f09cebb6f285f6.1352583641.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As we will need to add more patches to nfs-utils, we need a correct
ordering when applying patches. Therefore, reformat the patches to use
a git format and git naming.

The nfs-utils-dont-mix-flags.patch is no longer needed as it was
patching Makefile.in files that were being regenerated due to the
package having _AUTORECONF = YES. The Makefile.in are properly
regenerated thanks to the nfs-utils-0002-Patch-taken-from-Gentoo.patch
patch.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...-AM_CONDITIONAL-in-conditional-execution.patch} |    9 +-
 ...> nfs-utils-0002-Patch-taken-from-Gentoo.patch} |   22 +-
 ...-Switch-legacy-index-in-favour-of-strchr.patch} |   44 ++-
 ... => nfs-utils-0004-fix-build-with-uClibc.patch} |   16 +-
 package/nfs-utils/nfs-utils-dont-mix-flags.patch   |  288 --------------------
 5 files changed, 63 insertions(+), 316 deletions(-)
 rename package/nfs-utils/{nfs-utils-conditionals.patch => nfs-utils-0001-build-avoid-AM_CONDITIONAL-in-conditional-execution.patch} (89%)
 rename package/nfs-utils/{nfs-utils-cross-build.patch => nfs-utils-0002-Patch-taken-from-Gentoo.patch} (69%)
 rename package/nfs-utils/{nfs-utils-susv3-legacy.patch => nfs-utils-0003-Switch-legacy-index-in-favour-of-strchr.patch} (50%)
 rename package/nfs-utils/{nfs-utils-uclibc-libio.h.patch => nfs-utils-0004-fix-build-with-uClibc.patch} (56%)
 delete mode 100644 package/nfs-utils/nfs-utils-dont-mix-flags.patch

diff --git a/package/nfs-utils/nfs-utils-conditionals.patch b/package/nfs-utils/nfs-utils-0001-build-avoid-AM_CONDITIONAL-in-conditional-execution.patch
similarity index 89%
rename from package/nfs-utils/nfs-utils-conditionals.patch
rename to package/nfs-utils/nfs-utils-0001-build-avoid-AM_CONDITIONAL-in-conditional-execution.patch
index a2342b3..ba9ad42 100644
--- a/package/nfs-utils/nfs-utils-conditionals.patch
+++ b/package/nfs-utils/nfs-utils-0001-build-avoid-AM_CONDITIONAL-in-conditional-execution.patch
@@ -1,8 +1,7 @@
-From 869d37a16d1e409cedd95b03cea29a6db65f9276 Mon Sep 17 00:00:00 2001
+From 2a44ed7558f981e15db58dcda799ff7cd3827a6e Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Diego=20Elio=20Petten=C3=B2?= <flameeyes@flameeyes.eu>
 Date: Thu, 17 May 2012 16:26:44 -0700
-Subject: [nfs-utils PATCH] build: avoid AM_CONDITIONAL in conditional
- execution.
+Subject: [PATCH] build: avoid AM_CONDITIONAL in conditional execution.
 MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
 Content-Transfer-Encoding: 8bit
@@ -20,7 +19,7 @@ Signed-off-by: Diego Elio Petten? <flameeyes@flameeyes.eu>
 ---
  aclocal/libsqlite3.m4 |    1 -
  configure.ac          |    3 +--
- 2 files changed, 1 insertions(+), 3 deletions(-)
+ 2 files changed, 1 insertion(+), 3 deletions(-)
 
 diff --git a/aclocal/libsqlite3.m4 b/aclocal/libsqlite3.m4
 index 73d1e46..8c38993 100644
@@ -54,5 +53,5 @@ index 9ba53e2..b408f1b 100644
  
  
 -- 
-1.7.8.6
+1.7.9.5
 
diff --git a/package/nfs-utils/nfs-utils-cross-build.patch b/package/nfs-utils/nfs-utils-0002-Patch-taken-from-Gentoo.patch
similarity index 69%
rename from package/nfs-utils/nfs-utils-cross-build.patch
rename to package/nfs-utils/nfs-utils-0002-Patch-taken-from-Gentoo.patch
index 43928bf..e310c49 100644
--- a/package/nfs-utils/nfs-utils-cross-build.patch
+++ b/package/nfs-utils/nfs-utils-0002-Patch-taken-from-Gentoo.patch
@@ -1,7 +1,17 @@
-Patch taken from Gentoo.
+From 971389625c9602085d399d8ae7fc42b75efcfb7c Mon Sep 17 00:00:00 2001
+From: Gustavo Zacarias <gustavo@zacarias.com.ar>
+Date: Sat, 10 Nov 2012 18:56:12 +0100
+Subject: [PATCH] Patch taken from Gentoo
 
 Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+---
+ tools/locktest/Makefile.am |    7 +++----
+ tools/rpcdebug/Makefile.am |    7 +++----
+ tools/rpcgen/Makefile.am   |    8 +++-----
+ 3 files changed, 9 insertions(+), 13 deletions(-)
 
+diff --git a/tools/locktest/Makefile.am b/tools/locktest/Makefile.am
+index 3156815..efe6fcd 100644
 --- a/tools/locktest/Makefile.am
 +++ b/tools/locktest/Makefile.am
 @@ -1,12 +1,11 @@
@@ -20,6 +30,8 @@ Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 -testlk_LDFLAGS=$(LDFLAGS_FOR_BUILD)
  
  MAINTAINERCLEANFILES = Makefile.in
+diff --git a/tools/rpcdebug/Makefile.am b/tools/rpcdebug/Makefile.am
+index 39b70c9..0056597 100644
 --- a/tools/rpcdebug/Makefile.am
 +++ b/tools/rpcdebug/Makefile.am
 @@ -1,15 +1,14 @@
@@ -41,6 +53,8 @@ Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 -rpcdebug_LDFLAGS=$(LDFLAGS_FOR_BUILD)
  
  MAINTAINERCLEANFILES = Makefile.in
+diff --git a/tools/rpcgen/Makefile.am b/tools/rpcgen/Makefile.am
+index 8a9ec89..5a5b4d3 100644
 --- a/tools/rpcgen/Makefile.am
 +++ b/tools/rpcgen/Makefile.am
 @@ -1,7 +1,9 @@
@@ -54,7 +68,7 @@ Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
  
  noinst_PROGRAMS = rpcgen
  rpcgen_SOURCES = rpc_clntout.c rpc_cout.c rpc_hout.c rpc_main.c \
-@@ -9,10 +11,6 @@
+@@ -9,10 +11,6 @@ rpcgen_SOURCES = rpc_clntout.c rpc_cout.c rpc_hout.c rpc_main.c \
  		 rpc_util.c rpc_sample.c rpc_output.h rpc_parse.h \
  		 rpc_scan.h rpc_util.h
  
@@ -65,4 +79,6 @@ Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
  
  MAINTAINERCLEANFILES = Makefile.in
  
- EXTRA_DIST = rpcgen.new.1
+-- 
+1.7.9.5
+
diff --git a/package/nfs-utils/nfs-utils-susv3-legacy.patch b/package/nfs-utils/nfs-utils-0003-Switch-legacy-index-in-favour-of-strchr.patch
similarity index 50%
rename from package/nfs-utils/nfs-utils-susv3-legacy.patch
rename to package/nfs-utils/nfs-utils-0003-Switch-legacy-index-in-favour-of-strchr.patch
index 66dd181..82a6c43 100644
--- a/package/nfs-utils/nfs-utils-susv3-legacy.patch
+++ b/package/nfs-utils/nfs-utils-0003-Switch-legacy-index-in-favour-of-strchr.patch
@@ -1,11 +1,20 @@
-Switch legacy index() in favour of strchr()
-Updated for 1.2.6 from the previous patch by Frederik Pasch.
+From 636e78e4c9bc8be174805bde2f3ae7f940dc3d0e Mon Sep 17 00:00:00 2001
+From: Gustavo Zacarias <gustavo@zacarias.com.ar>
+Date: Sat, 10 Nov 2012 18:58:15 +0100
+Subject: [PATCH] Switch legacy index() in favour of strchr() Updated for
+ 1.2.6 from the previous patch by Frederik Pasch.
 
 Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+---
+ support/nfs/nfs_mntent.c |    6 +++---
+ utils/mount/error.c      |    2 +-
+ utils/mountd/fsloc.c     |    2 +-
+ 3 files changed, 5 insertions(+), 5 deletions(-)
 
-diff -Nura nfs-utils-1.2.6.orig/support/nfs/nfs_mntent.c nfs-utils-1.2.6/support/nfs/nfs_mntent.c
---- nfs-utils-1.2.6.orig/support/nfs/nfs_mntent.c	2012-05-29 10:06:37.901255998 -0300
-+++ nfs-utils-1.2.6/support/nfs/nfs_mntent.c	2012-05-29 10:06:45.726312410 -0300
+diff --git a/support/nfs/nfs_mntent.c b/support/nfs/nfs_mntent.c
+index a2118a2..7496ed6 100644
+--- a/support/nfs/nfs_mntent.c
++++ b/support/nfs/nfs_mntent.c
 @@ -9,7 +9,7 @@
   */
  
@@ -15,7 +24,7 @@ diff -Nura nfs-utils-1.2.6.orig/support/nfs/nfs_mntent.c nfs-utils-1.2.6/support
  #include <ctype.h>		/* for isdigit */
  #include <sys/stat.h>		/* for umask */
  #include <unistd.h>		/* for ftruncate */
-@@ -172,7 +172,7 @@
+@@ -172,7 +172,7 @@ nfs_getmntent (mntFILE *mfp) {
  			return NULL;
  
  		mfp->mntent_lineno++;
@@ -24,7 +33,7 @@ diff -Nura nfs-utils-1.2.6.orig/support/nfs/nfs_mntent.c nfs-utils-1.2.6/support
  		if (s == NULL) {
  			/* Missing final newline?  Otherwise extremely */
  			/* long line - assume file was corrupted */
-@@ -180,7 +180,7 @@
+@@ -180,7 +180,7 @@ nfs_getmntent (mntFILE *mfp) {
  				fprintf(stderr, _("[mntent]: warning: no final "
  					"newline at the end of %s\n"),
  					mfp->mntent_file);
@@ -33,10 +42,11 @@ diff -Nura nfs-utils-1.2.6.orig/support/nfs/nfs_mntent.c nfs-utils-1.2.6/support
  			} else {
  				mfp->mntent_errs = 1;
  				goto err;
-diff -Nura nfs-utils-1.2.6.orig/utils/mount/error.c nfs-utils-1.2.6/utils/mount/error.c
---- nfs-utils-1.2.6.orig/utils/mount/error.c	2012-05-29 10:06:37.946256325 -0300
-+++ nfs-utils-1.2.6/utils/mount/error.c	2012-05-29 10:06:45.727312416 -0300
-@@ -62,7 +62,7 @@
+diff --git a/utils/mount/error.c b/utils/mount/error.c
+index 83ad1d2..428deef 100644
+--- a/utils/mount/error.c
++++ b/utils/mount/error.c
+@@ -62,7 +62,7 @@ static int rpc_strerror(int spos)
  	char *tmp;
  
  	if (estr) {
@@ -45,10 +55,11 @@ diff -Nura nfs-utils-1.2.6.orig/utils/mount/error.c nfs-utils-1.2.6/utils/mount/
  			estr = ++ptr;
  
  		tmp = &errbuf[spos];
-diff -Nura nfs-utils-1.2.6.orig/utils/mountd/fsloc.c nfs-utils-1.2.6/utils/mountd/fsloc.c
---- nfs-utils-1.2.6.orig/utils/mountd/fsloc.c	2012-05-29 10:06:37.911256072 -0300
-+++ nfs-utils-1.2.6/utils/mountd/fsloc.c	2012-05-29 10:07:11.140322564 -0300
-@@ -127,7 +127,7 @@
+diff --git a/utils/mountd/fsloc.c b/utils/mountd/fsloc.c
+index bc737d1..ddbe92f 100644
+--- a/utils/mountd/fsloc.c
++++ b/utils/mountd/fsloc.c
+@@ -127,7 +127,7 @@ static struct servers *method_list(char *data)
  	bool v6esc = false;
  
  	xlog(L_NOTICE, "method_list(%s)", data);
@@ -57,3 +68,6 @@ diff -Nura nfs-utils-1.2.6.orig/utils/mountd/fsloc.c nfs-utils-1.2.6/utils/mount
  		ptr++;
  	list = malloc(listsize * sizeof(char *));
  	copy = strdup(data);
+-- 
+1.7.9.5
+
diff --git a/package/nfs-utils/nfs-utils-uclibc-libio.h.patch b/package/nfs-utils/nfs-utils-0004-fix-build-with-uClibc.patch
similarity index 56%
rename from package/nfs-utils/nfs-utils-uclibc-libio.h.patch
rename to package/nfs-utils/nfs-utils-0004-fix-build-with-uClibc.patch
index 589b96f..23da28f 100644
--- a/package/nfs-utils/nfs-utils-uclibc-libio.h.patch
+++ b/package/nfs-utils/nfs-utils-0004-fix-build-with-uClibc.patch
@@ -1,4 +1,7 @@
-[PATCH] fix build with uClibc
+From ff82d4c89d6ca771dea06bbaa06ddf3fed760402 Mon Sep 17 00:00:00 2001
+From: Peter Korsgaard <jacmet@sunsite.dk>
+Date: Sat, 10 Nov 2012 18:58:48 +0100
+Subject: [PATCH] fix build with uClibc
 
 uClibc doesn't have/need libio.h, so don't include it from sockaddr.h
 
@@ -7,10 +10,10 @@ Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
  support/include/sockaddr.h |    5 ++++-
  1 file changed, 4 insertions(+), 1 deletion(-)
 
-Index: nfs-utils-1.2.3/support/include/sockaddr.h
-===================================================================
---- nfs-utils-1.2.3.orig/support/include/sockaddr.h
-+++ nfs-utils-1.2.3/support/include/sockaddr.h
+diff --git a/support/include/sockaddr.h b/support/include/sockaddr.h
+index 9af2543..5eef2ec 100644
+--- a/support/include/sockaddr.h
++++ b/support/include/sockaddr.h
 @@ -20,7 +20,10 @@
  #ifndef NFS_UTILS_SOCKADDR_H
  #define NFS_UTILS_SOCKADDR_H
@@ -23,3 +26,6 @@ Index: nfs-utils-1.2.3/support/include/sockaddr.h
  #include <stdbool.h>
  #include <sys/socket.h>
  #include <netinet/in.h>
+-- 
+1.7.9.5
+
diff --git a/package/nfs-utils/nfs-utils-dont-mix-flags.patch b/package/nfs-utils/nfs-utils-dont-mix-flags.patch
deleted file mode 100644
index b5ef5c7..0000000
--- a/package/nfs-utils/nfs-utils-dont-mix-flags.patch
+++ /dev/null
@@ -1,288 +0,0 @@
-[PATCH] don't mix build/target compiler/linker flags
-
-Build tools should only use CFLAGS_FOR_BUILD / LDFLAGS_FOR_BUILD, and
-not the normal CFLAGS / LDFLAGS (which are used for target builds).
-
-Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
----
- tools/locktest/Makefile.in |   12 +++---
- tools/rpcdebug/Makefile.in |   12 +++---
- tools/rpcgen/Makefile.in   |   84 ++++++++++++++++++++++-----------------------
- 3 files changed, 54 insertions(+), 54 deletions(-)
-
-Index: nfs-utils-1.2.3/tools/locktest/Makefile.in
-===================================================================
---- nfs-utils-1.2.3.orig/tools/locktest/Makefile.in
-+++ nfs-utils-1.2.3/tools/locktest/Makefile.in
-@@ -67,8 +67,8 @@
- testlk_OBJECTS = $(am_testlk_OBJECTS)
- testlk_LDADD = $(LDADD)
- testlk_LINK = $(LIBTOOL) --tag=CC $(AM_LIBTOOLFLAGS) $(LIBTOOLFLAGS) \
--	--mode=link $(CCLD) $(testlk_CFLAGS) $(CFLAGS) \
--	$(testlk_LDFLAGS) $(LDFLAGS) -o $@
-+	--mode=link $(CCLD) $(testlk_CFLAGS) \
-+	$(testlk_LDFLAGS) -o $@
- DEFAULT_INCLUDES = -I. at am__isrc@ -I$(top_builddir)/support/include
- depcomp = $(SHELL) $(top_srcdir)/depcomp
- am__depfiles_maybe = depfiles
-@@ -330,18 +330,18 @@
- @am__fastdepCC_FALSE@	$(LTCOMPILE) -c -o $@ $<
- 
- testlk-testlk.o: testlk.c
-- at am__fastdepCC_TRUE@	$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(testlk_CPPFLAGS) $(CPPFLAGS) $(testlk_CFLAGS) $(CFLAGS) -MT testlk-testlk.o -MD -MP -MF $(DEPDIR)/testlk-testlk.Tpo -c -o testlk-testlk.o `test -f 'testlk.c' || echo '$(srcdir)/'`testlk.c
-+ at am__fastdepCC_TRUE@	$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(testlk_CPPFLAGS) $(CPPFLAGS) $(testlk_CFLAGS) -MT testlk-testlk.o -MD -MP -MF $(DEPDIR)/testlk-testlk.Tpo -c -o testlk-testlk.o `test -f 'testlk.c' || echo '$(srcdir)/'`testlk.c
- @am__fastdepCC_TRUE@	$(am__mv) $(DEPDIR)/testlk-testlk.Tpo $(DEPDIR)/testlk-testlk.Po
- @AMDEP_TRUE@@am__fastdepCC_FALSE@	source='testlk.c' object='testlk-testlk.o' libtool=no @AMDEPBACKSLASH@
- @AMDEP_TRUE@@am__fastdepCC_FALSE@	DEPDIR=$(DEPDIR) $(CCDEPMODE) $(depcomp) @AMDEPBACKSLASH@
-- at am__fastdepCC_FALSE@	$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(testlk_CPPFLAGS) $(CPPFLAGS) $(testlk_CFLAGS) $(CFLAGS) -c -o testlk-testlk.o `test -f 'testlk.c' || echo '$(srcdir)/'`testlk.c
-+ at am__fastdepCC_FALSE@	$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(testlk_CPPFLAGS) $(CPPFLAGS) $(testlk_CFLAGS) -c -o testlk-testlk.o `test -f 'testlk.c' || echo '$(srcdir)/'`testlk.c
- 
- testlk-testlk.obj: testlk.c
-- at am__fastdepCC_TRUE@	$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(testlk_CPPFLAGS) $(CPPFLAGS) $(testlk_CFLAGS) $(CFLAGS) -MT testlk-testlk.obj -MD -MP -MF $(DEPDIR)/testlk-testlk.Tpo -c -o testlk-testlk.obj `if test -f 'testlk.c'; then $(CYGPATH_W) 'testlk.c'; else $(CYGPATH_W) '$(srcdir)/testlk.c'; fi`
-+ at am__fastdepCC_TRUE@	$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(testlk_CPPFLAGS) $(CPPFLAGS) $(testlk_CFLAGS) -MT testlk-testlk.obj -MD -MP -MF $(DEPDIR)/testlk-testlk.Tpo -c -o testlk-testlk.obj `if test -f 'testlk.c'; then $(CYGPATH_W) 'testlk.c'; else $(CYGPATH_W) '$(srcdir)/testlk.c'; fi`
- @am__fastdepCC_TRUE@	$(am__mv) $(DEPDIR)/testlk-testlk.Tpo $(DEPDIR)/testlk-testlk.Po
- @AMDEP_TRUE@@am__fastdepCC_FALSE@	source='testlk.c' object='testlk-testlk.obj' libtool=no @AMDEPBACKSLASH@
- @AMDEP_TRUE@@am__fastdepCC_FALSE@	DEPDIR=$(DEPDIR) $(CCDEPMODE) $(depcomp) @AMDEPBACKSLASH@
-- at am__fastdepCC_FALSE@	$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(testlk_CPPFLAGS) $(CPPFLAGS) $(testlk_CFLAGS) $(CFLAGS) -c -o testlk-testlk.obj `if test -f 'testlk.c'; then $(CYGPATH_W) 'testlk.c'; else $(CYGPATH_W) '$(srcdir)/testlk.c'; fi`
-+ at am__fastdepCC_FALSE@	$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(testlk_CPPFLAGS) $(CPPFLAGS) $(testlk_CFLAGS) -c -o testlk-testlk.obj `if test -f 'testlk.c'; then $(CYGPATH_W) 'testlk.c'; else $(CYGPATH_W) '$(srcdir)/testlk.c'; fi`
- 
- mostlyclean-libtool:
- 	-rm -f *.lo
-Index: nfs-utils-1.2.3/tools/rpcdebug/Makefile.in
-===================================================================
---- nfs-utils-1.2.3.orig/tools/rpcdebug/Makefile.in
-+++ nfs-utils-1.2.3/tools/rpcdebug/Makefile.in
-@@ -68,8 +68,8 @@
- rpcdebug_OBJECTS = $(am_rpcdebug_OBJECTS)
- rpcdebug_LDADD = $(LDADD)
- rpcdebug_LINK = $(LIBTOOL) --tag=CC $(AM_LIBTOOLFLAGS) $(LIBTOOLFLAGS) \
--	--mode=link $(CCLD) $(rpcdebug_CFLAGS) $(CFLAGS) \
--	$(rpcdebug_LDFLAGS) $(LDFLAGS) -o $@
-+	--mode=link $(CCLD) $(rpcdebug_CFLAGS) \
-+	$(rpcdebug_LDFLAGS) -o $@
- DEFAULT_INCLUDES = -I. at am__isrc@ -I$(top_builddir)/support/include
- depcomp = $(SHELL) $(top_srcdir)/depcomp
- am__depfiles_maybe = depfiles
-@@ -391,18 +391,18 @@
- @am__fastdepCC_FALSE@	$(LTCOMPILE) -c -o $@ $<
- 
- rpcdebug-rpcdebug.o: rpcdebug.c
-- at am__fastdepCC_TRUE@	$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(rpcdebug_CPPFLAGS) $(CPPFLAGS) $(rpcdebug_CFLAGS) $(CFLAGS) -MT rpcdebug-rpcdebug.o -MD -MP -MF $(DEPDIR)/rpcdebug-rpcdebug.Tpo -c -o rpcdebug-rpcdebug.o `test -f 'rpcdebug.c' || echo '$(srcdir)/'`rpcdebug.c
-+ at am__fastdepCC_TRUE@	$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(rpcdebug_CPPFLAGS) $(CPPFLAGS) $(rpcdebug_CFLAGS) -MT rpcdebug-rpcdebug.o -MD -MP -MF $(DEPDIR)/rpcdebug-rpcdebug.Tpo -c -o rpcdebug-rpcdebug.o `test -f 'rpcdebug.c' || echo '$(srcdir)/'`rpcdebug.c
- @am__fastdepCC_TRUE@	$(am__mv) $(DEPDIR)/rpcdebug-rpcdebug.Tpo $(DEPDIR)/rpcdebug-rpcdebug.Po
- @AMDEP_TRUE@@am__fastdepCC_FALSE@	source='rpcdebug.c' object='rpcdebug-rpcdebug.o' libtool=no @AMDEPBACKSLASH@
- @AMDEP_TRUE@@am__fastdepCC_FALSE@	DEPDIR=$(DEPDIR) $(CCDEPMODE) $(depcomp) @AMDEPBACKSLASH@
-- at am__fastdepCC_FALSE@	$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(rpcdebug_CPPFLAGS) $(CPPFLAGS) $(rpcdebug_CFLAGS) $(CFLAGS) -c -o rpcdebug-rpcdebug.o `test -f 'rpcdebug.c' || echo '$(srcdir)/'`rpcdebug.c
-+ at am__fastdepCC_FALSE@	$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(rpcdebug_CPPFLAGS) $(CPPFLAGS) $(rpcdebug_CFLAGS) -c -o rpcdebug-rpcdebug.o `test -f 'rpcdebug.c' || echo '$(srcdir)/'`rpcdebug.c
- 
- rpcdebug-rpcdebug.obj: rpcdebug.c
-- at am__fastdepCC_TRUE@	$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(rpcdebug_CPPFLAGS) $(CPPFLAGS) $(rpcdebug_CFLAGS) $(CFLAGS) -MT rpcdebug-rpcdebug.obj -MD -MP -MF $(DEPDIR)/rpcdebug-rpcdebug.Tpo -c -o rpcdebug-rpcdebug.obj `if test -f 'rpcdebug.c'; then $(CYGPATH_W) 'rpcdebug.c'; else $(CYGPATH_W) '$(srcdir)/rpcdebug.c'; fi`
-+ at am__fastdepCC_TRUE@	$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(rpcdebug_CPPFLAGS) $(CPPFLAGS) $(rpcdebug_CFLAGS) -MT rpcdebug-rpcdebug.obj -MD -MP -MF $(DEPDIR)/rpcdebug-rpcdebug.Tpo -c -o rpcdebug-rpcdebug.obj `if test -f 'rpcdebug.c'; then $(CYGPATH_W) 'rpcdebug.c'; else $(CYGPATH_W) '$(srcdir)/rpcdebug.c'; fi`
- @am__fastdepCC_TRUE@	$(am__mv) $(DEPDIR)/rpcdebug-rpcdebug.Tpo $(DEPDIR)/rpcdebug-rpcdebug.Po
- @AMDEP_TRUE@@am__fastdepCC_FALSE@	source='rpcdebug.c' object='rpcdebug-rpcdebug.obj' libtool=no @AMDEPBACKSLASH@
- @AMDEP_TRUE@@am__fastdepCC_FALSE@	DEPDIR=$(DEPDIR) $(CCDEPMODE) $(depcomp) @AMDEPBACKSLASH@
-- at am__fastdepCC_FALSE@	$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(rpcdebug_CPPFLAGS) $(CPPFLAGS) $(rpcdebug_CFLAGS) $(CFLAGS) -c -o rpcdebug-rpcdebug.obj `if test -f 'rpcdebug.c'; then $(CYGPATH_W) 'rpcdebug.c'; else $(CYGPATH_W) '$(srcdir)/rpcdebug.c'; fi`
-+ at am__fastdepCC_FALSE@	$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(rpcdebug_CPPFLAGS) $(CPPFLAGS) $(rpcdebug_CFLAGS) -c -o rpcdebug-rpcdebug.obj `if test -f 'rpcdebug.c'; then $(CYGPATH_W) 'rpcdebug.c'; else $(CYGPATH_W) '$(srcdir)/rpcdebug.c'; fi`
- 
- mostlyclean-libtool:
- 	-rm -f *.lo
-Index: nfs-utils-1.2.3/tools/rpcgen/Makefile.in
-===================================================================
---- nfs-utils-1.2.3.orig/tools/rpcgen/Makefile.in
-+++ nfs-utils-1.2.3/tools/rpcgen/Makefile.in
-@@ -72,8 +72,8 @@
- rpcgen_OBJECTS = $(am_rpcgen_OBJECTS)
- rpcgen_LDADD = $(LDADD)
- rpcgen_LINK = $(LIBTOOL) --tag=CC $(AM_LIBTOOLFLAGS) $(LIBTOOLFLAGS) \
--	--mode=link $(CCLD) $(rpcgen_CFLAGS) $(CFLAGS) \
--	$(rpcgen_LDFLAGS) $(LDFLAGS) -o $@
-+	--mode=link $(CCLD) $(rpcgen_CFLAGS) \
-+	$(rpcgen_LDFLAGS) -o $@
- DEFAULT_INCLUDES = -I. at am__isrc@ -I$(top_builddir)/support/include
- depcomp = $(SHELL) $(top_srcdir)/depcomp
- am__depfiles_maybe = depfiles
-@@ -349,144 +349,144 @@
- @am__fastdepCC_FALSE@	$(LTCOMPILE) -c -o $@ $<
- 
- rpcgen-rpc_clntout.o: rpc_clntout.c
-- at am__fastdepCC_TRUE@	$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(rpcgen_CFLAGS) $(CFLAGS) -MT rpcgen-rpc_clntout.o -MD -MP -MF $(DEPDIR)/rpcgen-rpc_clntout.Tpo -c -o rpcgen-rpc_clntout.o `test -f 'rpc_clntout.c' || echo '$(srcdir)/'`rpc_clntout.c
-+ at am__fastdepCC_TRUE@	$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(rpcgen_CFLAGS) -MT rpcgen-rpc_clntout.o -MD -MP -MF $(DEPDIR)/rpcgen-rpc_clntout.Tpo -c -o rpcgen-rpc_clntout.o `test -f 'rpc_clntout.c' || echo '$(srcdir)/'`rpc_clntout.c
- @am__fastdepCC_TRUE@	$(am__mv) $(DEPDIR)/rpcgen-rpc_clntout.Tpo $(DEPDIR)/rpcgen-rpc_clntout.Po
- @AMDEP_TRUE@@am__fastdepCC_FALSE@	source='rpc_clntout.c' object='rpcgen-rpc_clntout.o' libtool=no @AMDEPBACKSLASH@
- @AMDEP_TRUE@@am__fastdepCC_FALSE@	DEPDIR=$(DEPDIR) $(CCDEPMODE) $(depcomp) @AMDEPBACKSLASH@
-- at am__fastdepCC_FALSE@	$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(rpcgen_CFLAGS) $(CFLAGS) -c -o rpcgen-rpc_clntout.o `test -f 'rpc_clntout.c' || echo '$(srcdir)/'`rpc_clntout.c
-+ at am__fastdepCC_FALSE@	$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(rpcgen_CFLAGS) -c -o rpcgen-rpc_clntout.o `test -f 'rpc_clntout.c' || echo '$(srcdir)/'`rpc_clntout.c
- 
- rpcgen-rpc_clntout.obj: rpc_clntout.c
-- at am__fastdepCC_TRUE@	$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(rpcgen_CFLAGS) $(CFLAGS) -MT rpcgen-rpc_clntout.obj -MD -MP -MF $(DEPDIR)/rpcgen-rpc_clntout.Tpo -c -o rpcgen-rpc_clntout.obj `if test -f 'rpc_clntout.c'; then $(CYGPATH_W) 'rpc_clntout.c'; else $(CYGPATH_W) '$(srcdir)/rpc_clntout.c'; fi`
-+ at am__fastdepCC_TRUE@	$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(rpcgen_CFLAGS) -MT rpcgen-rpc_clntout.obj -MD -MP -MF $(DEPDIR)/rpcgen-rpc_clntout.Tpo -c -o rpcgen-rpc_clntout.obj `if test -f 'rpc_clntout.c'; then $(CYGPATH_W) 'rpc_clntout.c'; else $(CYGPATH_W) '$(srcdir)/rpc_clntout.c'; fi`
- @am__fastdepCC_TRUE@	$(am__mv) $(DEPDIR)/rpcgen-rpc_clntout.Tpo $(DEPDIR)/rpcgen-rpc_clntout.Po
- @AMDEP_TRUE@@am__fastdepCC_FALSE@	source='rpc_clntout.c' object='rpcgen-rpc_clntout.obj' libtool=no @AMDEPBACKSLASH@
- @AMDEP_TRUE@@am__fastdepCC_FALSE@	DEPDIR=$(DEPDIR) $(CCDEPMODE) $(depcomp) @AMDEPBACKSLASH@
-- at am__fastdepCC_FALSE@	$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(rpcgen_CFLAGS) $(CFLAGS) -c -o rpcgen-rpc_clntout.obj `if test -f 'rpc_clntout.c'; then $(CYGPATH_W) 'rpc_clntout.c'; else $(CYGPATH_W) '$(srcdir)/rpc_clntout.c'; fi`
-+ at am__fastdepCC_FALSE@	$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(rpcgen_CFLAGS) -c -o rpcgen-rpc_clntout.obj `if test -f 'rpc_clntout.c'; then $(CYGPATH_W) 'rpc_clntout.c'; else $(CYGPATH_W) '$(srcdir)/rpc_clntout.c'; fi`
- 
- rpcgen-rpc_cout.o: rpc_cout.c
-- at am__fastdepCC_TRUE@	$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(rpcgen_CFLAGS) $(CFLAGS) -MT rpcgen-rpc_cout.o -MD -MP -MF $(DEPDIR)/rpcgen-rpc_cout.Tpo -c -o rpcgen-rpc_cout.o `test -f 'rpc_cout.c' || echo '$(srcdir)/'`rpc_cout.c
-+ at am__fastdepCC_TRUE@	$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(rpcgen_CFLAGS) -MT rpcgen-rpc_cout.o -MD -MP -MF $(DEPDIR)/rpcgen-rpc_cout.Tpo -c -o rpcgen-rpc_cout.o `test -f 'rpc_cout.c' || echo '$(srcdir)/'`rpc_cout.c
- @am__fastdepCC_TRUE@	$(am__mv) $(DEPDIR)/rpcgen-rpc_cout.Tpo $(DEPDIR)/rpcgen-rpc_cout.Po
- @AMDEP_TRUE@@am__fastdepCC_FALSE@	source='rpc_cout.c' object='rpcgen-rpc_cout.o' libtool=no @AMDEPBACKSLASH@
- @AMDEP_TRUE@@am__fastdepCC_FALSE@	DEPDIR=$(DEPDIR) $(CCDEPMODE) $(depcomp) @AMDEPBACKSLASH@
-- at am__fastdepCC_FALSE@	$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(rpcgen_CFLAGS) $(CFLAGS) -c -o rpcgen-rpc_cout.o `test -f 'rpc_cout.c' || echo '$(srcdir)/'`rpc_cout.c
-+ at am__fastdepCC_FALSE@	$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(rpcgen_CFLAGS) -c -o rpcgen-rpc_cout.o `test -f 'rpc_cout.c' || echo '$(srcdir)/'`rpc_cout.c
- 
- rpcgen-rpc_cout.obj: rpc_cout.c
-- at am__fastdepCC_TRUE@	$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(rpcgen_CFLAGS) $(CFLAGS) -MT rpcgen-rpc_cout.obj -MD -MP -MF $(DEPDIR)/rpcgen-rpc_cout.Tpo -c -o rpcgen-rpc_cout.obj `if test -f 'rpc_cout.c'; then $(CYGPATH_W) 'rpc_cout.c'; else $(CYGPATH_W) '$(srcdir)/rpc_cout.c'; fi`
-+ at am__fastdepCC_TRUE@	$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(rpcgen_CFLAGS) -MT rpcgen-rpc_cout.obj -MD -MP -MF $(DEPDIR)/rpcgen-rpc_cout.Tpo -c -o rpcgen-rpc_cout.obj `if test -f 'rpc_cout.c'; then $(CYGPATH_W) 'rpc_cout.c'; else $(CYGPATH_W) '$(srcdir)/rpc_cout.c'; fi`
- @am__fastdepCC_TRUE@	$(am__mv) $(DEPDIR)/rpcgen-rpc_cout.Tpo $(DEPDIR)/rpcgen-rpc_cout.Po
- @AMDEP_TRUE@@am__fastdepCC_FALSE@	source='rpc_cout.c' object='rpcgen-rpc_cout.obj' libtool=no @AMDEPBACKSLASH@
- @AMDEP_TRUE@@am__fastdepCC_FALSE@	DEPDIR=$(DEPDIR) $(CCDEPMODE) $(depcomp) @AMDEPBACKSLASH@
-- at am__fastdepCC_FALSE@	$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(rpcgen_CFLAGS) $(CFLAGS) -c -o rpcgen-rpc_cout.obj `if test -f 'rpc_cout.c'; then $(CYGPATH_W) 'rpc_cout.c'; else $(CYGPATH_W) '$(srcdir)/rpc_cout.c'; fi`
-+ at am__fastdepCC_FALSE@	$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(rpcgen_CFLAGS) -c -o rpcgen-rpc_cout.obj `if test -f 'rpc_cout.c'; then $(CYGPATH_W) 'rpc_cout.c'; else $(CYGPATH_W) '$(srcdir)/rpc_cout.c'; fi`
- 
- rpcgen-rpc_hout.o: rpc_hout.c
-- at am__fastdepCC_TRUE@	$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(rpcgen_CFLAGS) $(CFLAGS) -MT rpcgen-rpc_hout.o -MD -MP -MF $(DEPDIR)/rpcgen-rpc_hout.Tpo -c -o rpcgen-rpc_hout.o `test -f 'rpc_hout.c' || echo '$(srcdir)/'`rpc_hout.c
-+ at am__fastdepCC_TRUE@	$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(rpcgen_CFLAGS) -MT rpcgen-rpc_hout.o -MD -MP -MF $(DEPDIR)/rpcgen-rpc_hout.Tpo -c -o rpcgen-rpc_hout.o `test -f 'rpc_hout.c' || echo '$(srcdir)/'`rpc_hout.c
- @am__fastdepCC_TRUE@	$(am__mv) $(DEPDIR)/rpcgen-rpc_hout.Tpo $(DEPDIR)/rpcgen-rpc_hout.Po
- @AMDEP_TRUE@@am__fastdepCC_FALSE@	source='rpc_hout.c' object='rpcgen-rpc_hout.o' libtool=no @AMDEPBACKSLASH@
- @AMDEP_TRUE@@am__fastdepCC_FALSE@	DEPDIR=$(DEPDIR) $(CCDEPMODE) $(depcomp) @AMDEPBACKSLASH@
-- at am__fastdepCC_FALSE@	$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(rpcgen_CFLAGS) $(CFLAGS) -c -o rpcgen-rpc_hout.o `test -f 'rpc_hout.c' || echo '$(srcdir)/'`rpc_hout.c
-+ at am__fastdepCC_FALSE@	$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(rpcgen_CFLAGS) -c -o rpcgen-rpc_hout.o `test -f 'rpc_hout.c' || echo '$(srcdir)/'`rpc_hout.c
- 
- rpcgen-rpc_hout.obj: rpc_hout.c
-- at am__fastdepCC_TRUE@	$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(rpcgen_CFLAGS) $(CFLAGS) -MT rpcgen-rpc_hout.obj -MD -MP -MF $(DEPDIR)/rpcgen-rpc_hout.Tpo -c -o rpcgen-rpc_hout.obj `if test -f 'rpc_hout.c'; then $(CYGPATH_W) 'rpc_hout.c'; else $(CYGPATH_W) '$(srcdir)/rpc_hout.c'; fi`
-+ at am__fastdepCC_TRUE@	$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(rpcgen_CFLAGS) -MT rpcgen-rpc_hout.obj -MD -MP -MF $(DEPDIR)/rpcgen-rpc_hout.Tpo -c -o rpcgen-rpc_hout.obj `if test -f 'rpc_hout.c'; then $(CYGPATH_W) 'rpc_hout.c'; else $(CYGPATH_W) '$(srcdir)/rpc_hout.c'; fi`
- @am__fastdepCC_TRUE@	$(am__mv) $(DEPDIR)/rpcgen-rpc_hout.Tpo $(DEPDIR)/rpcgen-rpc_hout.Po
- @AMDEP_TRUE@@am__fastdepCC_FALSE@	source='rpc_hout.c' object='rpcgen-rpc_hout.obj' libtool=no @AMDEPBACKSLASH@
- @AMDEP_TRUE@@am__fastdepCC_FALSE@	DEPDIR=$(DEPDIR) $(CCDEPMODE) $(depcomp) @AMDEPBACKSLASH@
-- at am__fastdepCC_FALSE@	$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(rpcgen_CFLAGS) $(CFLAGS) -c -o rpcgen-rpc_hout.obj `if test -f 'rpc_hout.c'; then $(CYGPATH_W) 'rpc_hout.c'; else $(CYGPATH_W) '$(srcdir)/rpc_hout.c'; fi`
-+ at am__fastdepCC_FALSE@	$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(rpcgen_CFLAGS) -c -o rpcgen-rpc_hout.obj `if test -f 'rpc_hout.c'; then $(CYGPATH_W) 'rpc_hout.c'; else $(CYGPATH_W) '$(srcdir)/rpc_hout.c'; fi`
- 
- rpcgen-rpc_main.o: rpc_main.c
-- at am__fastdepCC_TRUE@	$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(rpcgen_CFLAGS) $(CFLAGS) -MT rpcgen-rpc_main.o -MD -MP -MF $(DEPDIR)/rpcgen-rpc_main.Tpo -c -o rpcgen-rpc_main.o `test -f 'rpc_main.c' || echo '$(srcdir)/'`rpc_main.c
-+ at am__fastdepCC_TRUE@	$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(rpcgen_CFLAGS) -MT rpcgen-rpc_main.o -MD -MP -MF $(DEPDIR)/rpcgen-rpc_main.Tpo -c -o rpcgen-rpc_main.o `test -f 'rpc_main.c' || echo '$(srcdir)/'`rpc_main.c
- @am__fastdepCC_TRUE@	$(am__mv) $(DEPDIR)/rpcgen-rpc_main.Tpo $(DEPDIR)/rpcgen-rpc_main.Po
- @AMDEP_TRUE@@am__fastdepCC_FALSE@	source='rpc_main.c' object='rpcgen-rpc_main.o' libtool=no @AMDEPBACKSLASH@
- @AMDEP_TRUE@@am__fastdepCC_FALSE@	DEPDIR=$(DEPDIR) $(CCDEPMODE) $(depcomp) @AMDEPBACKSLASH@
-- at am__fastdepCC_FALSE@	$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(rpcgen_CFLAGS) $(CFLAGS) -c -o rpcgen-rpc_main.o `test -f 'rpc_main.c' || echo '$(srcdir)/'`rpc_main.c
-+ at am__fastdepCC_FALSE@	$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(rpcgen_CFLAGS) -c -o rpcgen-rpc_main.o `test -f 'rpc_main.c' || echo '$(srcdir)/'`rpc_main.c
- 
- rpcgen-rpc_main.obj: rpc_main.c
-- at am__fastdepCC_TRUE@	$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(rpcgen_CFLAGS) $(CFLAGS) -MT rpcgen-rpc_main.obj -MD -MP -MF $(DEPDIR)/rpcgen-rpc_main.Tpo -c -o rpcgen-rpc_main.obj `if test -f 'rpc_main.c'; then $(CYGPATH_W) 'rpc_main.c'; else $(CYGPATH_W) '$(srcdir)/rpc_main.c'; fi`
-+ at am__fastdepCC_TRUE@	$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(rpcgen_CFLAGS) -MT rpcgen-rpc_main.obj -MD -MP -MF $(DEPDIR)/rpcgen-rpc_main.Tpo -c -o rpcgen-rpc_main.obj `if test -f 'rpc_main.c'; then $(CYGPATH_W) 'rpc_main.c'; else $(CYGPATH_W) '$(srcdir)/rpc_main.c'; fi`
- @am__fastdepCC_TRUE@	$(am__mv) $(DEPDIR)/rpcgen-rpc_main.Tpo $(DEPDIR)/rpcgen-rpc_main.Po
- @AMDEP_TRUE@@am__fastdepCC_FALSE@	source='rpc_main.c' object='rpcgen-rpc_main.obj' libtool=no @AMDEPBACKSLASH@
- @AMDEP_TRUE@@am__fastdepCC_FALSE@	DEPDIR=$(DEPDIR) $(CCDEPMODE) $(depcomp) @AMDEPBACKSLASH@
-- at am__fastdepCC_FALSE@	$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(rpcgen_CFLAGS) $(CFLAGS) -c -o rpcgen-rpc_main.obj `if test -f 'rpc_main.c'; then $(CYGPATH_W) 'rpc_main.c'; else $(CYGPATH_W) '$(srcdir)/rpc_main.c'; fi`
-+ at am__fastdepCC_FALSE@	$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(rpcgen_CFLAGS) -c -o rpcgen-rpc_main.obj `if test -f 'rpc_main.c'; then $(CYGPATH_W) 'rpc_main.c'; else $(CYGPATH_W) '$(srcdir)/rpc_main.c'; fi`
- 
- rpcgen-rpc_parse.o: rpc_parse.c
-- at am__fastdepCC_TRUE@	$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(rpcgen_CFLAGS) $(CFLAGS) -MT rpcgen-rpc_parse.o -MD -MP -MF $(DEPDIR)/rpcgen-rpc_parse.Tpo -c -o rpcgen-rpc_parse.o `test -f 'rpc_parse.c' || echo '$(srcdir)/'`rpc_parse.c
-+ at am__fastdepCC_TRUE@	$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(rpcgen_CFLAGS) -MT rpcgen-rpc_parse.o -MD -MP -MF $(DEPDIR)/rpcgen-rpc_parse.Tpo -c -o rpcgen-rpc_parse.o `test -f 'rpc_parse.c' || echo '$(srcdir)/'`rpc_parse.c
- @am__fastdepCC_TRUE@	$(am__mv) $(DEPDIR)/rpcgen-rpc_parse.Tpo $(DEPDIR)/rpcgen-rpc_parse.Po
- @AMDEP_TRUE@@am__fastdepCC_FALSE@	source='rpc_parse.c' object='rpcgen-rpc_parse.o' libtool=no @AMDEPBACKSLASH@
- @AMDEP_TRUE@@am__fastdepCC_FALSE@	DEPDIR=$(DEPDIR) $(CCDEPMODE) $(depcomp) @AMDEPBACKSLASH@
-- at am__fastdepCC_FALSE@	$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(rpcgen_CFLAGS) $(CFLAGS) -c -o rpcgen-rpc_parse.o `test -f 'rpc_parse.c' || echo '$(srcdir)/'`rpc_parse.c
-+ at am__fastdepCC_FALSE@	$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(rpcgen_CFLAGS) -c -o rpcgen-rpc_parse.o `test -f 'rpc_parse.c' || echo '$(srcdir)/'`rpc_parse.c
- 
- rpcgen-rpc_parse.obj: rpc_parse.c
-- at am__fastdepCC_TRUE@	$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(rpcgen_CFLAGS) $(CFLAGS) -MT rpcgen-rpc_parse.obj -MD -MP -MF $(DEPDIR)/rpcgen-rpc_parse.Tpo -c -o rpcgen-rpc_parse.obj `if test -f 'rpc_parse.c'; then $(CYGPATH_W) 'rpc_parse.c'; else $(CYGPATH_W) '$(srcdir)/rpc_parse.c'; fi`
-+ at am__fastdepCC_TRUE@	$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(rpcgen_CFLAGS) -MT rpcgen-rpc_parse.obj -MD -MP -MF $(DEPDIR)/rpcgen-rpc_parse.Tpo -c -o rpcgen-rpc_parse.obj `if test -f 'rpc_parse.c'; then $(CYGPATH_W) 'rpc_parse.c'; else $(CYGPATH_W) '$(srcdir)/rpc_parse.c'; fi`
- @am__fastdepCC_TRUE@	$(am__mv) $(DEPDIR)/rpcgen-rpc_parse.Tpo $(DEPDIR)/rpcgen-rpc_parse.Po
- @AMDEP_TRUE@@am__fastdepCC_FALSE@	source='rpc_parse.c' object='rpcgen-rpc_parse.obj' libtool=no @AMDEPBACKSLASH@
- @AMDEP_TRUE@@am__fastdepCC_FALSE@	DEPDIR=$(DEPDIR) $(CCDEPMODE) $(depcomp) @AMDEPBACKSLASH@
-- at am__fastdepCC_FALSE@	$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(rpcgen_CFLAGS) $(CFLAGS) -c -o rpcgen-rpc_parse.obj `if test -f 'rpc_parse.c'; then $(CYGPATH_W) 'rpc_parse.c'; else $(CYGPATH_W) '$(srcdir)/rpc_parse.c'; fi`
-+ at am__fastdepCC_FALSE@	$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(rpcgen_CFLAGS) -c -o rpcgen-rpc_parse.obj `if test -f 'rpc_parse.c'; then $(CYGPATH_W) 'rpc_parse.c'; else $(CYGPATH_W) '$(srcdir)/rpc_parse.c'; fi`
- 
- rpcgen-rpc_scan.o: rpc_scan.c
-- at am__fastdepCC_TRUE@	$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(rpcgen_CFLAGS) $(CFLAGS) -MT rpcgen-rpc_scan.o -MD -MP -MF $(DEPDIR)/rpcgen-rpc_scan.Tpo -c -o rpcgen-rpc_scan.o `test -f 'rpc_scan.c' || echo '$(srcdir)/'`rpc_scan.c
-+ at am__fastdepCC_TRUE@	$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(rpcgen_CFLAGS) -MT rpcgen-rpc_scan.o -MD -MP -MF $(DEPDIR)/rpcgen-rpc_scan.Tpo -c -o rpcgen-rpc_scan.o `test -f 'rpc_scan.c' || echo '$(srcdir)/'`rpc_scan.c
- @am__fastdepCC_TRUE@	$(am__mv) $(DEPDIR)/rpcgen-rpc_scan.Tpo $(DEPDIR)/rpcgen-rpc_scan.Po
- @AMDEP_TRUE@@am__fastdepCC_FALSE@	source='rpc_scan.c' object='rpcgen-rpc_scan.o' libtool=no @AMDEPBACKSLASH@
- @AMDEP_TRUE@@am__fastdepCC_FALSE@	DEPDIR=$(DEPDIR) $(CCDEPMODE) $(depcomp) @AMDEPBACKSLASH@
-- at am__fastdepCC_FALSE@	$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(rpcgen_CFLAGS) $(CFLAGS) -c -o rpcgen-rpc_scan.o `test -f 'rpc_scan.c' || echo '$(srcdir)/'`rpc_scan.c
-+ at am__fastdepCC_FALSE@	$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(rpcgen_CFLAGS) -c -o rpcgen-rpc_scan.o `test -f 'rpc_scan.c' || echo '$(srcdir)/'`rpc_scan.c
- 
- rpcgen-rpc_scan.obj: rpc_scan.c
-- at am__fastdepCC_TRUE@	$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(rpcgen_CFLAGS) $(CFLAGS) -MT rpcgen-rpc_scan.obj -MD -MP -MF $(DEPDIR)/rpcgen-rpc_scan.Tpo -c -o rpcgen-rpc_scan.obj `if test -f 'rpc_scan.c'; then $(CYGPATH_W) 'rpc_scan.c'; else $(CYGPATH_W) '$(srcdir)/rpc_scan.c'; fi`
-+ at am__fastdepCC_TRUE@	$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(rpcgen_CFLAGS) -MT rpcgen-rpc_scan.obj -MD -MP -MF $(DEPDIR)/rpcgen-rpc_scan.Tpo -c -o rpcgen-rpc_scan.obj `if test -f 'rpc_scan.c'; then $(CYGPATH_W) 'rpc_scan.c'; else $(CYGPATH_W) '$(srcdir)/rpc_scan.c'; fi`
- @am__fastdepCC_TRUE@	$(am__mv) $(DEPDIR)/rpcgen-rpc_scan.Tpo $(DEPDIR)/rpcgen-rpc_scan.Po
- @AMDEP_TRUE@@am__fastdepCC_FALSE@	source='rpc_scan.c' object='rpcgen-rpc_scan.obj' libtool=no @AMDEPBACKSLASH@
- @AMDEP_TRUE@@am__fastdepCC_FALSE@	DEPDIR=$(DEPDIR) $(CCDEPMODE) $(depcomp) @AMDEPBACKSLASH@
-- at am__fastdepCC_FALSE@	$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(rpcgen_CFLAGS) $(CFLAGS) -c -o rpcgen-rpc_scan.obj `if test -f 'rpc_scan.c'; then $(CYGPATH_W) 'rpc_scan.c'; else $(CYGPATH_W) '$(srcdir)/rpc_scan.c'; fi`
-+ at am__fastdepCC_FALSE@	$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(rpcgen_CFLAGS) -c -o rpcgen-rpc_scan.obj `if test -f 'rpc_scan.c'; then $(CYGPATH_W) 'rpc_scan.c'; else $(CYGPATH_W) '$(srcdir)/rpc_scan.c'; fi`
- 
- rpcgen-rpc_svcout.o: rpc_svcout.c
-- at am__fastdepCC_TRUE@	$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(rpcgen_CFLAGS) $(CFLAGS) -MT rpcgen-rpc_svcout.o -MD -MP -MF $(DEPDIR)/rpcgen-rpc_svcout.Tpo -c -o rpcgen-rpc_svcout.o `test -f 'rpc_svcout.c' || echo '$(srcdir)/'`rpc_svcout.c
-+ at am__fastdepCC_TRUE@	$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(rpcgen_CFLAGS) -MT rpcgen-rpc_svcout.o -MD -MP -MF $(DEPDIR)/rpcgen-rpc_svcout.Tpo -c -o rpcgen-rpc_svcout.o `test -f 'rpc_svcout.c' || echo '$(srcdir)/'`rpc_svcout.c
- @am__fastdepCC_TRUE@	$(am__mv) $(DEPDIR)/rpcgen-rpc_svcout.Tpo $(DEPDIR)/rpcgen-rpc_svcout.Po
- @AMDEP_TRUE@@am__fastdepCC_FALSE@	source='rpc_svcout.c' object='rpcgen-rpc_svcout.o' libtool=no @AMDEPBACKSLASH@
- @AMDEP_TRUE@@am__fastdepCC_FALSE@	DEPDIR=$(DEPDIR) $(CCDEPMODE) $(depcomp) @AMDEPBACKSLASH@
-- at am__fastdepCC_FALSE@	$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(rpcgen_CFLAGS) $(CFLAGS) -c -o rpcgen-rpc_svcout.o `test -f 'rpc_svcout.c' || echo '$(srcdir)/'`rpc_svcout.c
-+ at am__fastdepCC_FALSE@	$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(rpcgen_CFLAGS) -c -o rpcgen-rpc_svcout.o `test -f 'rpc_svcout.c' || echo '$(srcdir)/'`rpc_svcout.c
- 
- rpcgen-rpc_svcout.obj: rpc_svcout.c
-- at am__fastdepCC_TRUE@	$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(rpcgen_CFLAGS) $(CFLAGS) -MT rpcgen-rpc_svcout.obj -MD -MP -MF $(DEPDIR)/rpcgen-rpc_svcout.Tpo -c -o rpcgen-rpc_svcout.obj `if test -f 'rpc_svcout.c'; then $(CYGPATH_W) 'rpc_svcout.c'; else $(CYGPATH_W) '$(srcdir)/rpc_svcout.c'; fi`
-+ at am__fastdepCC_TRUE@	$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(rpcgen_CFLAGS) -MT rpcgen-rpc_svcout.obj -MD -MP -MF $(DEPDIR)/rpcgen-rpc_svcout.Tpo -c -o rpcgen-rpc_svcout.obj `if test -f 'rpc_svcout.c'; then $(CYGPATH_W) 'rpc_svcout.c'; else $(CYGPATH_W) '$(srcdir)/rpc_svcout.c'; fi`
- @am__fastdepCC_TRUE@	$(am__mv) $(DEPDIR)/rpcgen-rpc_svcout.Tpo $(DEPDIR)/rpcgen-rpc_svcout.Po
- @AMDEP_TRUE@@am__fastdepCC_FALSE@	source='rpc_svcout.c' object='rpcgen-rpc_svcout.obj' libtool=no @AMDEPBACKSLASH@
- @AMDEP_TRUE@@am__fastdepCC_FALSE@	DEPDIR=$(DEPDIR) $(CCDEPMODE) $(depcomp) @AMDEPBACKSLASH@
-- at am__fastdepCC_FALSE@	$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(rpcgen_CFLAGS) $(CFLAGS) -c -o rpcgen-rpc_svcout.obj `if test -f 'rpc_svcout.c'; then $(CYGPATH_W) 'rpc_svcout.c'; else $(CYGPATH_W) '$(srcdir)/rpc_svcout.c'; fi`
-+ at am__fastdepCC_FALSE@	$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(rpcgen_CFLAGS) -c -o rpcgen-rpc_svcout.obj `if test -f 'rpc_svcout.c'; then $(CYGPATH_W) 'rpc_svcout.c'; else $(CYGPATH_W) '$(srcdir)/rpc_svcout.c'; fi`
- 
- rpcgen-rpc_tblout.o: rpc_tblout.c
-- at am__fastdepCC_TRUE@	$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(rpcgen_CFLAGS) $(CFLAGS) -MT rpcgen-rpc_tblout.o -MD -MP -MF $(DEPDIR)/rpcgen-rpc_tblout.Tpo -c -o rpcgen-rpc_tblout.o `test -f 'rpc_tblout.c' || echo '$(srcdir)/'`rpc_tblout.c
-+ at am__fastdepCC_TRUE@	$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(rpcgen_CFLAGS) -MT rpcgen-rpc_tblout.o -MD -MP -MF $(DEPDIR)/rpcgen-rpc_tblout.Tpo -c -o rpcgen-rpc_tblout.o `test -f 'rpc_tblout.c' || echo '$(srcdir)/'`rpc_tblout.c
- @am__fastdepCC_TRUE@	$(am__mv) $(DEPDIR)/rpcgen-rpc_tblout.Tpo $(DEPDIR)/rpcgen-rpc_tblout.Po
- @AMDEP_TRUE@@am__fastdepCC_FALSE@	source='rpc_tblout.c' object='rpcgen-rpc_tblout.o' libtool=no @AMDEPBACKSLASH@
- @AMDEP_TRUE@@am__fastdepCC_FALSE@	DEPDIR=$(DEPDIR) $(CCDEPMODE) $(depcomp) @AMDEPBACKSLASH@
-- at am__fastdepCC_FALSE@	$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(rpcgen_CFLAGS) $(CFLAGS) -c -o rpcgen-rpc_tblout.o `test -f 'rpc_tblout.c' || echo '$(srcdir)/'`rpc_tblout.c
-+ at am__fastdepCC_FALSE@	$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(rpcgen_CFLAGS) -c -o rpcgen-rpc_tblout.o `test -f 'rpc_tblout.c' || echo '$(srcdir)/'`rpc_tblout.c
- 
- rpcgen-rpc_tblout.obj: rpc_tblout.c
-- at am__fastdepCC_TRUE@	$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(rpcgen_CFLAGS) $(CFLAGS) -MT rpcgen-rpc_tblout.obj -MD -MP -MF $(DEPDIR)/rpcgen-rpc_tblout.Tpo -c -o rpcgen-rpc_tblout.obj `if test -f 'rpc_tblout.c'; then $(CYGPATH_W) 'rpc_tblout.c'; else $(CYGPATH_W) '$(srcdir)/rpc_tblout.c'; fi`
-+ at am__fastdepCC_TRUE@	$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(rpcgen_CFLAGS) -MT rpcgen-rpc_tblout.obj -MD -MP -MF $(DEPDIR)/rpcgen-rpc_tblout.Tpo -c -o rpcgen-rpc_tblout.obj `if test -f 'rpc_tblout.c'; then $(CYGPATH_W) 'rpc_tblout.c'; else $(CYGPATH_W) '$(srcdir)/rpc_tblout.c'; fi`
- @am__fastdepCC_TRUE@	$(am__mv) $(DEPDIR)/rpcgen-rpc_tblout.Tpo $(DEPDIR)/rpcgen-rpc_tblout.Po
- @AMDEP_TRUE@@am__fastdepCC_FALSE@	source='rpc_tblout.c' object='rpcgen-rpc_tblout.obj' libtool=no @AMDEPBACKSLASH@
- @AMDEP_TRUE@@am__fastdepCC_FALSE@	DEPDIR=$(DEPDIR) $(CCDEPMODE) $(depcomp) @AMDEPBACKSLASH@
-- at am__fastdepCC_FALSE@	$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(rpcgen_CFLAGS) $(CFLAGS) -c -o rpcgen-rpc_tblout.obj `if test -f 'rpc_tblout.c'; then $(CYGPATH_W) 'rpc_tblout.c'; else $(CYGPATH_W) '$(srcdir)/rpc_tblout.c'; fi`
-+ at am__fastdepCC_FALSE@	$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(rpcgen_CFLAGS) -c -o rpcgen-rpc_tblout.obj `if test -f 'rpc_tblout.c'; then $(CYGPATH_W) 'rpc_tblout.c'; else $(CYGPATH_W) '$(srcdir)/rpc_tblout.c'; fi`
- 
- rpcgen-rpc_util.o: rpc_util.c
-- at am__fastdepCC_TRUE@	$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(rpcgen_CFLAGS) $(CFLAGS) -MT rpcgen-rpc_util.o -MD -MP -MF $(DEPDIR)/rpcgen-rpc_util.Tpo -c -o rpcgen-rpc_util.o `test -f 'rpc_util.c' || echo '$(srcdir)/'`rpc_util.c
-+ at am__fastdepCC_TRUE@	$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(rpcgen_CFLAGS) -MT rpcgen-rpc_util.o -MD -MP -MF $(DEPDIR)/rpcgen-rpc_util.Tpo -c -o rpcgen-rpc_util.o `test -f 'rpc_util.c' || echo '$(srcdir)/'`rpc_util.c
- @am__fastdepCC_TRUE@	$(am__mv) $(DEPDIR)/rpcgen-rpc_util.Tpo $(DEPDIR)/rpcgen-rpc_util.Po
- @AMDEP_TRUE@@am__fastdepCC_FALSE@	source='rpc_util.c' object='rpcgen-rpc_util.o' libtool=no @AMDEPBACKSLASH@
- @AMDEP_TRUE@@am__fastdepCC_FALSE@	DEPDIR=$(DEPDIR) $(CCDEPMODE) $(depcomp) @AMDEPBACKSLASH@
-- at am__fastdepCC_FALSE@	$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(rpcgen_CFLAGS) $(CFLAGS) -c -o rpcgen-rpc_util.o `test -f 'rpc_util.c' || echo '$(srcdir)/'`rpc_util.c
-+ at am__fastdepCC_FALSE@	$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(rpcgen_CFLAGS) -c -o rpcgen-rpc_util.o `test -f 'rpc_util.c' || echo '$(srcdir)/'`rpc_util.c
- 
- rpcgen-rpc_util.obj: rpc_util.c
-- at am__fastdepCC_TRUE@	$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(rpcgen_CFLAGS) $(CFLAGS) -MT rpcgen-rpc_util.obj -MD -MP -MF $(DEPDIR)/rpcgen-rpc_util.Tpo -c -o rpcgen-rpc_util.obj `if test -f 'rpc_util.c'; then $(CYGPATH_W) 'rpc_util.c'; else $(CYGPATH_W) '$(srcdir)/rpc_util.c'; fi`
-+ at am__fastdepCC_TRUE@	$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(rpcgen_CFLAGS) -MT rpcgen-rpc_util.obj -MD -MP -MF $(DEPDIR)/rpcgen-rpc_util.Tpo -c -o rpcgen-rpc_util.obj `if test -f 'rpc_util.c'; then $(CYGPATH_W) 'rpc_util.c'; else $(CYGPATH_W) '$(srcdir)/rpc_util.c'; fi`
- @am__fastdepCC_TRUE@	$(am__mv) $(DEPDIR)/rpcgen-rpc_util.Tpo $(DEPDIR)/rpcgen-rpc_util.Po
- @AMDEP_TRUE@@am__fastdepCC_FALSE@	source='rpc_util.c' object='rpcgen-rpc_util.obj' libtool=no @AMDEPBACKSLASH@
- @AMDEP_TRUE@@am__fastdepCC_FALSE@	DEPDIR=$(DEPDIR) $(CCDEPMODE) $(depcomp) @AMDEPBACKSLASH@
-- at am__fastdepCC_FALSE@	$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(rpcgen_CFLAGS) $(CFLAGS) -c -o rpcgen-rpc_util.obj `if test -f 'rpc_util.c'; then $(CYGPATH_W) 'rpc_util.c'; else $(CYGPATH_W) '$(srcdir)/rpc_util.c'; fi`
-+ at am__fastdepCC_FALSE@	$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(rpcgen_CFLAGS) -c -o rpcgen-rpc_util.obj `if test -f 'rpc_util.c'; then $(CYGPATH_W) 'rpc_util.c'; else $(CYGPATH_W) '$(srcdir)/rpc_util.c'; fi`
- 
- rpcgen-rpc_sample.o: rpc_sample.c
-- at am__fastdepCC_TRUE@	$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(rpcgen_CFLAGS) $(CFLAGS) -MT rpcgen-rpc_sample.o -MD -MP -MF $(DEPDIR)/rpcgen-rpc_sample.Tpo -c -o rpcgen-rpc_sample.o `test -f 'rpc_sample.c' || echo '$(srcdir)/'`rpc_sample.c
-+ at am__fastdepCC_TRUE@	$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(rpcgen_CFLAGS) -MT rpcgen-rpc_sample.o -MD -MP -MF $(DEPDIR)/rpcgen-rpc_sample.Tpo -c -o rpcgen-rpc_sample.o `test -f 'rpc_sample.c' || echo '$(srcdir)/'`rpc_sample.c
- @am__fastdepCC_TRUE@	$(am__mv) $(DEPDIR)/rpcgen-rpc_sample.Tpo $(DEPDIR)/rpcgen-rpc_sample.Po
- @AMDEP_TRUE@@am__fastdepCC_FALSE@	source='rpc_sample.c' object='rpcgen-rpc_sample.o' libtool=no @AMDEPBACKSLASH@
- @AMDEP_TRUE@@am__fastdepCC_FALSE@	DEPDIR=$(DEPDIR) $(CCDEPMODE) $(depcomp) @AMDEPBACKSLASH@
-- at am__fastdepCC_FALSE@	$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(rpcgen_CFLAGS) $(CFLAGS) -c -o rpcgen-rpc_sample.o `test -f 'rpc_sample.c' || echo '$(srcdir)/'`rpc_sample.c
-+ at am__fastdepCC_FALSE@	$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(rpcgen_CFLAGS) -c -o rpcgen-rpc_sample.o `test -f 'rpc_sample.c' || echo '$(srcdir)/'`rpc_sample.c
- 
- rpcgen-rpc_sample.obj: rpc_sample.c
-- at am__fastdepCC_TRUE@	$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(rpcgen_CFLAGS) $(CFLAGS) -MT rpcgen-rpc_sample.obj -MD -MP -MF $(DEPDIR)/rpcgen-rpc_sample.Tpo -c -o rpcgen-rpc_sample.obj `if test -f 'rpc_sample.c'; then $(CYGPATH_W) 'rpc_sample.c'; else $(CYGPATH_W) '$(srcdir)/rpc_sample.c'; fi`
-+ at am__fastdepCC_TRUE@	$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(rpcgen_CFLAGS) -MT rpcgen-rpc_sample.obj -MD -MP -MF $(DEPDIR)/rpcgen-rpc_sample.Tpo -c -o rpcgen-rpc_sample.obj `if test -f 'rpc_sample.c'; then $(CYGPATH_W) 'rpc_sample.c'; else $(CYGPATH_W) '$(srcdir)/rpc_sample.c'; fi`
- @am__fastdepCC_TRUE@	$(am__mv) $(DEPDIR)/rpcgen-rpc_sample.Tpo $(DEPDIR)/rpcgen-rpc_sample.Po
- @AMDEP_TRUE@@am__fastdepCC_FALSE@	source='rpc_sample.c' object='rpcgen-rpc_sample.obj' libtool=no @AMDEPBACKSLASH@
- @AMDEP_TRUE@@am__fastdepCC_FALSE@	DEPDIR=$(DEPDIR) $(CCDEPMODE) $(depcomp) @AMDEPBACKSLASH@
-- at am__fastdepCC_FALSE@	$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(rpcgen_CFLAGS) $(CFLAGS) -c -o rpcgen-rpc_sample.obj `if test -f 'rpc_sample.c'; then $(CYGPATH_W) 'rpc_sample.c'; else $(CYGPATH_W) '$(srcdir)/rpc_sample.c'; fi`
-+@am__fastdepCC_FALSE@	$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(rpcgen_CFLAGS) -c -o rpcgen-rpc_sample.obj `if test -f 'rpc_sample.c'; then $(CYGPATH_W) 'rpc_sample.c'; else $(CYGPATH_W) '$(srcdir)/rpc_sample.c'; fi`
- 
- mostlyclean-libtool:
- 	-rm -f *.lo
-- 
1.7.9.5
