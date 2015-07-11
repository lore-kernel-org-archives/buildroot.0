From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sat, 11 Jul 2015 16:48:21 +0200
Subject: [Buildroot] [PATCH 3/3] nfs-utils: Bump version
In-Reply-To: <1436626101-3598-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1436626101-3598-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <1436626101-3598-3-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

    - Refresh the patches (Thanks to Thomas Petazzoni's work)
    - Change source of the package to git repository (and remove the
      hash, sourceforce is clearly not a platform which can be trusted
      nowadays)
    - Rework the startup script to accomodate new rpc.statd

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 .../nfs-utils/0001-Patch-taken-from-Gentoo.patch   |  60 ++++++++++++
 ...d-AM_CONDITIONAL-in-conditional-execution.patch |  57 ------------
 .../nfs-utils/0002-Patch-taken-from-Gentoo.patch   |  84 -----------------
 ...2-Switch-legacy-index-in-favour-of-strchr.patch |  72 +++++++++++++++
 ...figure-script-find-getrpcbynumber-in-libt.patch |  46 ++++++++++
 ...3-Switch-legacy-index-in-favour-of-strchr.patch |  73 ---------------
 package/nfs-utils/0004-fix-build-with-uClibc.patch |  31 -------
 ...-of-getrpcbynumber-when-getrpcbynumber_r-.patch |  70 --------------
 ...figure-script-find-getrpcbynumber-in-libt.patch |  38 --------
 .../0007-sockaddr-h-needs-stddef-h-for-NULL.patch  |  19 ----
 package/nfs-utils/0008-tirpc-with-pkgconfig.patch  | 102 ---------------------
 package/nfs-utils/S60nfs                           |   3 +-
 package/nfs-utils/nfs-utils.hash                   |   2 -
 package/nfs-utils/nfs-utils.mk                     |   5 +-
 14 files changed, 181 insertions(+), 481 deletions(-)
 create mode 100644 package/nfs-utils/0001-Patch-taken-from-Gentoo.patch
 delete mode 100644 package/nfs-utils/0001-build-avoid-AM_CONDITIONAL-in-conditional-execution.patch
 delete mode 100644 package/nfs-utils/0002-Patch-taken-from-Gentoo.patch
 create mode 100644 package/nfs-utils/0002-Switch-legacy-index-in-favour-of-strchr.patch
 create mode 100644 package/nfs-utils/0003-Let-the-configure-script-find-getrpcbynumber-in-libt.patch
 delete mode 100644 package/nfs-utils/0003-Switch-legacy-index-in-favour-of-strchr.patch
 delete mode 100644 package/nfs-utils/0004-fix-build-with-uClibc.patch
 delete mode 100644 package/nfs-utils/0005-Allow-usage-of-getrpcbynumber-when-getrpcbynumber_r-.patch
 delete mode 100644 package/nfs-utils/0006-Let-the-configure-script-find-getrpcbynumber-in-libt.patch
 delete mode 100644 package/nfs-utils/0007-sockaddr-h-needs-stddef-h-for-NULL.patch
 delete mode 100644 package/nfs-utils/0008-tirpc-with-pkgconfig.patch
 delete mode 100644 package/nfs-utils/nfs-utils.hash

diff --git a/package/nfs-utils/0001-Patch-taken-from-Gentoo.patch b/package/nfs-utils/0001-Patch-taken-from-Gentoo.patch
new file mode 100644
index 0000000..47bf9db
--- /dev/null
+++ b/package/nfs-utils/0001-Patch-taken-from-Gentoo.patch
@@ -0,0 +1,60 @@
+From 5796ca01e33596d4102dd714349c908fecc331c0 Mon Sep 17 00:00:00 2001
+From: Gustavo Zacarias <gustavo@zacarias.com.ar>
+Date: Sat, 10 Nov 2012 18:56:12 +0100
+Subject: [PATCH] Patch taken from Gentoo
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+---
+ tools/locktest/Makefile.am | 7 +++----
+ tools/rpcgen/Makefile.am   | 8 +++-----
+ 2 files changed, 6 insertions(+), 9 deletions(-)
+
+diff --git a/tools/locktest/Makefile.am b/tools/locktest/Makefile.am
+index 3156815..efe6fcd 100644
+--- a/tools/locktest/Makefile.am
++++ b/tools/locktest/Makefile.am
+@@ -1,12 +1,11 @@
+ ## Process this file with automake to produce Makefile.in
+
+ CC=$(CC_FOR_BUILD)
+-LIBTOOL = @LIBTOOL@ --tag=CC
++CFLAGS=$(CFLAGS_FOR_BUILD)
++CPPFLAGS=$(CPPFLAGS_FOR_BUILD)
++LDFLAGS=$(LDFLAGS_FOR_BUILD)
+
+ noinst_PROGRAMS = testlk
+ testlk_SOURCES = testlk.c
+-testlk_CFLAGS=$(CFLAGS_FOR_BUILD)
+-testlk_CPPFLAGS=$(CPPFLAGS_FOR_BUILD)
+-testlk_LDFLAGS=$(LDFLAGS_FOR_BUILD)
+
+ MAINTAINERCLEANFILES = Makefile.in
+diff --git a/tools/rpcgen/Makefile.am b/tools/rpcgen/Makefile.am
+index 8a9ec89..5a5b4d3 100644
+--- a/tools/rpcgen/Makefile.am
++++ b/tools/rpcgen/Makefile.am
+@@ -1,7 +1,9 @@
+ ## Process this file with automake to produce Makefile.in
+
+ CC=$(CC_FOR_BUILD)
+-LIBTOOL = @LIBTOOL@ --tag=CC
++CFLAGS=$(CFLAGS_FOR_BUILD)
++CPPFLAGS=$(CPPFLAGS_FOR_BUILD)
++LDFLAGS=$(LDFLAGS_FOR_BUILD)
+
+ noinst_PROGRAMS = rpcgen
+ rpcgen_SOURCES = rpc_clntout.c rpc_cout.c rpc_hout.c rpc_main.c \
+@@ -9,10 +11,6 @@ rpcgen_SOURCES = rpc_clntout.c rpc_cout.c rpc_hout.c rpc_main.c \
+ 		 rpc_util.c rpc_sample.c rpc_output.h rpc_parse.h \
+ 		 rpc_scan.h rpc_util.h
+
+-rpcgen_CFLAGS=$(CFLAGS_FOR_BUILD)
+-rpcgen_CPPLAGS=$(CPPFLAGS_FOR_BUILD)
+-rpcgen_LDFLAGS=$(LDFLAGS_FOR_BUILD)
+-rpcgen_LDADD=$(LIBTIRPC)
+
+ MAINTAINERCLEANFILES = Makefile.in
+
+--
+2.1.0
+
diff --git a/package/nfs-utils/0001-build-avoid-AM_CONDITIONAL-in-conditional-execution.patch b/package/nfs-utils/0001-build-avoid-AM_CONDITIONAL-in-conditional-execution.patch
deleted file mode 100644
index ba9ad42..0000000
--- a/package/nfs-utils/0001-build-avoid-AM_CONDITIONAL-in-conditional-execution.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-From 2a44ed7558f981e15db58dcda799ff7cd3827a6e Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Diego=20Elio=20Petten=C3=B2?= <flameeyes@flameeyes.eu>
-Date: Thu, 17 May 2012 16:26:44 -0700
-Subject: [PATCH] build: avoid AM_CONDITIONAL in conditional execution.
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Automake does not support conditional AM_CONDITIONAL calls; what that
-means is that you always have to execute AM_CONDITIONAL one way or the
-other. Both the libsqlite3.m4 file and the nfsdcld conditionals are
-executed only when NFSv4 is enabled, which breaks building with
---disable-nfsv4.
-
-Remove the SQLite3 conditional altogether as it's never used, and move
-the nfsdcld conditional outside of the conditional code.
-
-Signed-off-by: Diego Elio Petten? <flameeyes@flameeyes.eu>
----
- aclocal/libsqlite3.m4 |    1 -
- configure.ac          |    3 +--
- 2 files changed, 1 insertion(+), 3 deletions(-)
-
-diff --git a/aclocal/libsqlite3.m4 b/aclocal/libsqlite3.m4
-index 73d1e46..8c38993 100644
---- a/aclocal/libsqlite3.m4
-+++ b/aclocal/libsqlite3.m4
-@@ -29,5 +29,4 @@ AC_DEFUN([AC_SQLITE3_VERS], [
-     LIBS="$saved_LIBS"])
- 
-   AC_MSG_RESULT($libsqlite3_cv_is_recent)
--  AM_CONDITIONAL(CONFIG_SQLITE3, [test "$libsqlite3_cv_is_recent" = "yes"])
- ])dnl
-diff --git a/configure.ac b/configure.ac
-index 9ba53e2..b408f1b 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -278,8 +278,6 @@ if test "$enable_nfsv4" = yes; then
- 	fi
-   fi
- 
--  AM_CONDITIONAL(CONFIG_NFSDCLD, [test "$enable_nfsdcld" = "yes" ])
--
-   dnl librpcsecgss already has a dependency on libgssapi,
-   dnl but we need to make sure we get the right version
-   if test "$enable_gss" = yes; then
-@@ -293,6 +291,7 @@ if test "$enable_nfsv41" = yes; then
- fi
- 
- dnl enable nfsidmap when its support by libnfsidmap
-+AM_CONDITIONAL(CONFIG_NFSDCLD, [test "$enable_nfsdcld" = "yes" ])
- AM_CONDITIONAL(CONFIG_NFSIDMAP, [test "$ac_cv_header_keyutils_h$ac_cv_lib_nfsidmap_nfs4_owner_to_uid" = "yesyes"])
- 
- 
--- 
-1.7.9.5
-
diff --git a/package/nfs-utils/0002-Patch-taken-from-Gentoo.patch b/package/nfs-utils/0002-Patch-taken-from-Gentoo.patch
deleted file mode 100644
index e310c49..0000000
--- a/package/nfs-utils/0002-Patch-taken-from-Gentoo.patch
+++ /dev/null
@@ -1,84 +0,0 @@
-From 971389625c9602085d399d8ae7fc42b75efcfb7c Mon Sep 17 00:00:00 2001
-From: Gustavo Zacarias <gustavo@zacarias.com.ar>
-Date: Sat, 10 Nov 2012 18:56:12 +0100
-Subject: [PATCH] Patch taken from Gentoo
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
----
- tools/locktest/Makefile.am |    7 +++----
- tools/rpcdebug/Makefile.am |    7 +++----
- tools/rpcgen/Makefile.am   |    8 +++-----
- 3 files changed, 9 insertions(+), 13 deletions(-)
-
-diff --git a/tools/locktest/Makefile.am b/tools/locktest/Makefile.am
-index 3156815..efe6fcd 100644
---- a/tools/locktest/Makefile.am
-+++ b/tools/locktest/Makefile.am
-@@ -1,12 +1,11 @@
- ## Process this file with automake to produce Makefile.in
- 
- CC=$(CC_FOR_BUILD)
--LIBTOOL = @LIBTOOL@ --tag=CC
-+CFLAGS=$(CFLAGS_FOR_BUILD)
-+CPPFLAGS=$(CPPFLAGS_FOR_BUILD)
-+LDFLAGS=$(LDFLAGS_FOR_BUILD)
- 
- noinst_PROGRAMS = testlk
- testlk_SOURCES = testlk.c
--testlk_CFLAGS=$(CFLAGS_FOR_BUILD)
--testlk_CPPFLAGS=$(CPPFLAGS_FOR_BUILD)
--testlk_LDFLAGS=$(LDFLAGS_FOR_BUILD)
- 
- MAINTAINERCLEANFILES = Makefile.in
-diff --git a/tools/rpcdebug/Makefile.am b/tools/rpcdebug/Makefile.am
-index 39b70c9..0056597 100644
---- a/tools/rpcdebug/Makefile.am
-+++ b/tools/rpcdebug/Makefile.am
-@@ -1,15 +1,14 @@
- ## Process this file with automake to produce Makefile.in
- 
- CC=$(CC_FOR_BUILD)
--LIBTOOL = @LIBTOOL@ --tag=CC
-+CFLAGS=$(CFLAGS_FOR_BUILD)
-+CPPFLAGS=$(CPPFLAGS_FOR_BUILD)
-+LDFLAGS=$(LDFLAGS_FOR_BUILD)
- 
- man8_MANS = rpcdebug.man
- EXTRA_DIST = $(man8_MANS)
- 
- sbin_PROGRAMS = rpcdebug
- rpcdebug_SOURCES = rpcdebug.c
--rpcdebug_CFLAGS=$(CFLAGS_FOR_BUILD)
--rpcdebug_CPPFLAGS=$(CPPFLAGS_FOR_BUILD) -I$(top_srcdir)/support/include
--rpcdebug_LDFLAGS=$(LDFLAGS_FOR_BUILD)
- 
- MAINTAINERCLEANFILES = Makefile.in
-diff --git a/tools/rpcgen/Makefile.am b/tools/rpcgen/Makefile.am
-index 8a9ec89..5a5b4d3 100644
---- a/tools/rpcgen/Makefile.am
-+++ b/tools/rpcgen/Makefile.am
-@@ -1,7 +1,9 @@
- ## Process this file with automake to produce Makefile.in
- 
- CC=$(CC_FOR_BUILD)
--LIBTOOL = @LIBTOOL@ --tag=CC
-+CFLAGS=$(CFLAGS_FOR_BUILD)
-+CPPFLAGS=$(CPPFLAGS_FOR_BUILD)
-+LDFLAGS=$(LDFLAGS_FOR_BUILD)
- 
- noinst_PROGRAMS = rpcgen
- rpcgen_SOURCES = rpc_clntout.c rpc_cout.c rpc_hout.c rpc_main.c \
-@@ -9,10 +11,6 @@ rpcgen_SOURCES = rpc_clntout.c rpc_cout.c rpc_hout.c rpc_main.c \
- 		 rpc_util.c rpc_sample.c rpc_output.h rpc_parse.h \
- 		 rpc_scan.h rpc_util.h
- 
--rpcgen_CFLAGS=$(CFLAGS_FOR_BUILD)
--rpcgen_CPPLAGS=$(CPPFLAGS_FOR_BUILD)
--rpcgen_LDFLAGS=$(LDFLAGS_FOR_BUILD)
--rpcgen_LDADD=$(LIBTIRPC)
- 
- MAINTAINERCLEANFILES = Makefile.in
- 
--- 
-1.7.9.5
-
diff --git a/package/nfs-utils/0002-Switch-legacy-index-in-favour-of-strchr.patch b/package/nfs-utils/0002-Switch-legacy-index-in-favour-of-strchr.patch
new file mode 100644
index 0000000..655d534
--- /dev/null
+++ b/package/nfs-utils/0002-Switch-legacy-index-in-favour-of-strchr.patch
@@ -0,0 +1,72 @@
+From a1d45736286939b822fcc7b9c74843f6f90a747e Mon Sep 17 00:00:00 2001
+From: Gustavo Zacarias <gustavo@zacarias.com.ar>
+Date: Sat, 10 Nov 2012 18:58:15 +0100
+Subject: [PATCH] Switch legacy index() in favour of strchr() Updated for 1.2.6
+ from the previous patch by Frederik Pasch.
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+---
+ support/nfs/nfs_mntent.c | 6 +++---
+ utils/mount/error.c      | 2 +-
+ utils/mountd/fsloc.c     | 2 +-
+ 3 files changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/support/nfs/nfs_mntent.c b/support/nfs/nfs_mntent.c
+index a2118a2..7496ed6 100644
+--- a/support/nfs/nfs_mntent.c
++++ b/support/nfs/nfs_mntent.c
+@@ -9,7 +9,7 @@
+  */
+
+ #include <stdio.h>
+-#include <string.h>		/* for index */
++#include <string.h>		/* for strchr */
+ #include <ctype.h>		/* for isdigit */
+ #include <sys/stat.h>		/* for umask */
+ #include <unistd.h>		/* for ftruncate */
+@@ -172,7 +172,7 @@ nfs_getmntent (mntFILE *mfp) {
+ 			return NULL;
+
+ 		mfp->mntent_lineno++;
+-		s = index (buf, '\n');
++		s = strchr (buf, '\n');
+ 		if (s == NULL) {
+ 			/* Missing final newline?  Otherwise extremely */
+ 			/* long line - assume file was corrupted */
+@@ -180,7 +180,7 @@ nfs_getmntent (mntFILE *mfp) {
+ 				fprintf(stderr, _("[mntent]: warning: no final "
+ 					"newline at the end of %s\n"),
+ 					mfp->mntent_file);
+-				s = index (buf, 0);
++				s = strchr (buf, 0);
+ 			} else {
+ 				mfp->mntent_errs = 1;
+ 				goto err;
+diff --git a/utils/mount/error.c b/utils/mount/error.c
+index e06f598..7bd1d27 100644
+--- a/utils/mount/error.c
++++ b/utils/mount/error.c
+@@ -62,7 +62,7 @@ static int rpc_strerror(int spos)
+ 	char *tmp;
+
+ 	if (estr) {
+-		if ((ptr = index(estr, ':')))
++		if ((ptr = strchr(estr, ':')))
+ 			estr = ++ptr;
+
+ 		tmp = &errbuf[spos];
+diff --git a/utils/mountd/fsloc.c b/utils/mountd/fsloc.c
+index bc737d1..ddbe92f 100644
+--- a/utils/mountd/fsloc.c
++++ b/utils/mountd/fsloc.c
+@@ -127,7 +127,7 @@ static struct servers *method_list(char *data)
+ 	bool v6esc = false;
+
+ 	xlog(L_NOTICE, "method_list(%s)", data);
+-	for (ptr--, listsize=1; ptr; ptr=index(ptr, ':'), listsize++)
++	for (ptr--, listsize=1; ptr; ptr=strchr(ptr, ':'), listsize++)
+ 		ptr++;
+ 	list = malloc(listsize * sizeof(char *));
+ 	copy = strdup(data);
+--
+2.1.0
diff --git a/package/nfs-utils/0003-Let-the-configure-script-find-getrpcbynumber-in-libt.patch b/package/nfs-utils/0003-Let-the-configure-script-find-getrpcbynumber-in-libt.patch
new file mode 100644
index 0000000..dca44f6
--- /dev/null
+++ b/package/nfs-utils/0003-Let-the-configure-script-find-getrpcbynumber-in-libt.patch
@@ -0,0 +1,46 @@
+From 87f88b28ac01b6449463f00b660fe7416d7f9a55 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Sat, 10 Nov 2012 18:53:03 +0100
+Subject: [PATCH] Let the configure script find getrpcbynumber in libtirpc
+
+The getrpcbynumber() function may not be available in the C library,
+but only in the libtirpc library. Take this into account when checking
+for the existence of getrpcbynumber() and getrpcbynumber_r().
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ configure.ac | 14 +++++++++++++-
+ 1 file changed, 13 insertions(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 8e427e3..6e42c96 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -433,11 +433,23 @@ AC_FUNC_STAT
+ AC_FUNC_VPRINTF
+ AC_CHECK_FUNCS([alarm atexit dup2 fdatasync ftruncate getcwd \
+                gethostbyaddr gethostbyname gethostname getmntent \
+-               getnameinfo getrpcbyname getrpcbynumber getrpcbynumber_r getifaddrs \
++               getnameinfo getrpcbyname getifaddrs \
+                gettimeofday hasmntopt inet_ntoa innetgr memset mkdir pathconf \
+                ppoll realpath rmdir select socket strcasecmp strchr strdup \
+                strerror strrchr strtol strtoul sigprocmask name_to_handle_at])
+
++save_CFLAGS=$CFLAGS
++save_LIBS=$LIBS
++CFLAGS="$CFLAGS $AM_CPPFLAGS"
++LIBS="$LIBS $LIBTIRPC"
++AC_CHECK_FUNCS([getrpcbynumber getrpcbynumber_r])
++CFLAGS=$save_CFLAGS
++LIBS=$save_LIBS
++
++if test "$ac_cv_func_getrpcbynumber_r" != "yes" -a "$ac_cv_func_getrpcbynumber" != "yes"; then
++   AC_MSG_ERROR([Neither getrpcbynumber_r nor getrpcbynumber are available])
++fi
++
+ dnl *************************************************************
+ dnl Check for data sizes
+ dnl *************************************************************
+--
+2.1.0
+
diff --git a/package/nfs-utils/0003-Switch-legacy-index-in-favour-of-strchr.patch b/package/nfs-utils/0003-Switch-legacy-index-in-favour-of-strchr.patch
deleted file mode 100644
index 82a6c43..0000000
--- a/package/nfs-utils/0003-Switch-legacy-index-in-favour-of-strchr.patch
+++ /dev/null
@@ -1,73 +0,0 @@
-From 636e78e4c9bc8be174805bde2f3ae7f940dc3d0e Mon Sep 17 00:00:00 2001
-From: Gustavo Zacarias <gustavo@zacarias.com.ar>
-Date: Sat, 10 Nov 2012 18:58:15 +0100
-Subject: [PATCH] Switch legacy index() in favour of strchr() Updated for
- 1.2.6 from the previous patch by Frederik Pasch.
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
----
- support/nfs/nfs_mntent.c |    6 +++---
- utils/mount/error.c      |    2 +-
- utils/mountd/fsloc.c     |    2 +-
- 3 files changed, 5 insertions(+), 5 deletions(-)
-
-diff --git a/support/nfs/nfs_mntent.c b/support/nfs/nfs_mntent.c
-index a2118a2..7496ed6 100644
---- a/support/nfs/nfs_mntent.c
-+++ b/support/nfs/nfs_mntent.c
-@@ -9,7 +9,7 @@
-  */
- 
- #include <stdio.h>
--#include <string.h>		/* for index */
-+#include <string.h>		/* for strchr */
- #include <ctype.h>		/* for isdigit */
- #include <sys/stat.h>		/* for umask */
- #include <unistd.h>		/* for ftruncate */
-@@ -172,7 +172,7 @@ nfs_getmntent (mntFILE *mfp) {
- 			return NULL;
- 
- 		mfp->mntent_lineno++;
--		s = index (buf, '\n');
-+		s = strchr (buf, '\n');
- 		if (s == NULL) {
- 			/* Missing final newline?  Otherwise extremely */
- 			/* long line - assume file was corrupted */
-@@ -180,7 +180,7 @@ nfs_getmntent (mntFILE *mfp) {
- 				fprintf(stderr, _("[mntent]: warning: no final "
- 					"newline at the end of %s\n"),
- 					mfp->mntent_file);
--				s = index (buf, 0);
-+				s = strchr (buf, 0);
- 			} else {
- 				mfp->mntent_errs = 1;
- 				goto err;
-diff --git a/utils/mount/error.c b/utils/mount/error.c
-index 83ad1d2..428deef 100644
---- a/utils/mount/error.c
-+++ b/utils/mount/error.c
-@@ -62,7 +62,7 @@ static int rpc_strerror(int spos)
- 	char *tmp;
- 
- 	if (estr) {
--		if ((ptr = index(estr, ':')))
-+		if ((ptr = strchr(estr, ':')))
- 			estr = ++ptr;
- 
- 		tmp = &errbuf[spos];
-diff --git a/utils/mountd/fsloc.c b/utils/mountd/fsloc.c
-index bc737d1..ddbe92f 100644
---- a/utils/mountd/fsloc.c
-+++ b/utils/mountd/fsloc.c
-@@ -127,7 +127,7 @@ static struct servers *method_list(char *data)
- 	bool v6esc = false;
- 
- 	xlog(L_NOTICE, "method_list(%s)", data);
--	for (ptr--, listsize=1; ptr; ptr=index(ptr, ':'), listsize++)
-+	for (ptr--, listsize=1; ptr; ptr=strchr(ptr, ':'), listsize++)
- 		ptr++;
- 	list = malloc(listsize * sizeof(char *));
- 	copy = strdup(data);
--- 
-1.7.9.5
-
diff --git a/package/nfs-utils/0004-fix-build-with-uClibc.patch b/package/nfs-utils/0004-fix-build-with-uClibc.patch
deleted file mode 100644
index 23da28f..0000000
--- a/package/nfs-utils/0004-fix-build-with-uClibc.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From ff82d4c89d6ca771dea06bbaa06ddf3fed760402 Mon Sep 17 00:00:00 2001
-From: Peter Korsgaard <jacmet@sunsite.dk>
-Date: Sat, 10 Nov 2012 18:58:48 +0100
-Subject: [PATCH] fix build with uClibc
-
-uClibc doesn't have/need libio.h, so don't include it from sockaddr.h
-
-Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
----
- support/include/sockaddr.h |    5 ++++-
- 1 file changed, 4 insertions(+), 1 deletion(-)
-
-diff --git a/support/include/sockaddr.h b/support/include/sockaddr.h
-index 9af2543..5eef2ec 100644
---- a/support/include/sockaddr.h
-+++ b/support/include/sockaddr.h
-@@ -20,7 +20,10 @@
- #ifndef NFS_UTILS_SOCKADDR_H
- #define NFS_UTILS_SOCKADDR_H
- 
--#include <libio.h>
-+/* uClibc doesn't have/need libio.h */
-+#ifndef __UCLIBC__
-+#include <libio.h> 
-+#endif
- #include <stdbool.h>
- #include <sys/socket.h>
- #include <netinet/in.h>
--- 
-1.7.9.5
-
diff --git a/package/nfs-utils/0005-Allow-usage-of-getrpcbynumber-when-getrpcbynumber_r-.patch b/package/nfs-utils/0005-Allow-usage-of-getrpcbynumber-when-getrpcbynumber_r-.patch
deleted file mode 100644
index 7c9f3c3..0000000
--- a/package/nfs-utils/0005-Allow-usage-of-getrpcbynumber-when-getrpcbynumber_r-.patch
+++ /dev/null
@@ -1,70 +0,0 @@
-From a4c15a4f9f49fd2ae5eee7eef54c67f4842952b2 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Sat, 10 Nov 2012 18:42:28 +0100
-Subject: [PATCH] Allow usage of getrpcbynumber() when getrpcbynumber_r() is
- not available
-
-getrpcbynumber_r() is not implemented by libtirpc at the moment, only
-the non-reentrant getrpcbynumber() is available. Since nfs-utils seems
-to only be using getrpcbynumber_r() is a non multithreaded context,
-using getrpcbynumber() should work just as well.
-
-We also take this opportunity to adjust the autoconf checks to verify
-whether any of getrpcbynumber() or getrpcbynumber_r() is available,
-and error out if none of them is available.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- configure.ac             |    8 ++++----
- support/nfs/svc_socket.c |    6 ++++++
- 2 files changed, 10 insertions(+), 4 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index b408f1b..41216c9 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -246,9 +246,6 @@ AC_CHECK_FUNC([connect], ,
- AC_CHECK_FUNC([getaddrinfo], ,
-               [AC_MSG_ERROR([Function 'getaddrinfo' not found.])])
- 
--AC_CHECK_FUNC([getrpcbynumber], ,
--              [AC_MSG_ERROR([Function 'getrpcbynumber' not found.])])
--
- AC_CHECK_FUNC([getservbyname], ,
-               [AC_MSG_ERROR([Function 'getservbyname' not found.])])
- 
-@@ -393,8 +390,11 @@ AC_CHECK_FUNCS([alarm atexit dup2 fdatasync ftruncate getcwd \
-                getnameinfo getrpcbyname getifaddrs \
-                gettimeofday hasmntopt inet_ntoa innetgr memset mkdir pathconf \
-                realpath rmdir select socket strcasecmp strchr strdup \
--               strerror strrchr strtol strtoul sigprocmask])
-+               strerror strrchr strtol strtoul sigprocmask getrpcbynumber getrpcbynumber_r])
- 
-+if test "$ac_cv_func_getrpcbynumber_r" != "yes" -a "$ac_cv_func_getrpcbynumber" != "yes"; then
-+   AC_MSG_ERROR([Neither getrpcbynumber_r nor getrpcbynumber are available])
-+fi
- 
- dnl *************************************************************
- dnl Check for data sizes
-diff --git a/support/nfs/svc_socket.c b/support/nfs/svc_socket.c
-index f56f310..61ccf5b 100644
---- a/support/nfs/svc_socket.c
-+++ b/support/nfs/svc_socket.c
-@@ -42,8 +42,14 @@ int getservport(u_long number, const char *proto)
- 	struct servent servbuf, *servp = NULL;
- 	int ret;
- 
-+#if HAVE_GETRPCBYNUMBER_R
- 	ret = getrpcbynumber_r(number, &rpcbuf, rpcdata, sizeof rpcdata,
- 				&rpcp);
-+#else
-+	rpcp = getrpcbynumber(number);
-+	ret = 0;
-+#endif
-+
- 	if (ret == 0 && rpcp != NULL) {
- 		/* First try name.  */
- 		ret = getservbyname_r(rpcp->r_name, proto, &servbuf, servdata,
--- 
-1.7.9.5
-
diff --git a/package/nfs-utils/0006-Let-the-configure-script-find-getrpcbynumber-in-libt.patch b/package/nfs-utils/0006-Let-the-configure-script-find-getrpcbynumber-in-libt.patch
deleted file mode 100644
index 1ca17b7..0000000
--- a/package/nfs-utils/0006-Let-the-configure-script-find-getrpcbynumber-in-libt.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 7ea7814a8b87a0faa50fb9f4a486bfd7a376f3fc Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Sat, 10 Nov 2012 18:53:03 +0100
-Subject: [PATCH] Let the configure script find getrpcbynumber in libtirpc
-
-The getrpcbynumber() function may not be available in the C library,
-but only in the libtirpc library. Take this into account when checking
-for the existence of getrpcbynumber() and getrpcbynumber_r().
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- configure.ac |   10 +++++++++-
- 1 file changed, 9 insertions(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index 41216c9..1bbecfa 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -390,7 +390,15 @@ AC_CHECK_FUNCS([alarm atexit dup2 fdatasync ftruncate getcwd \
-                getnameinfo getrpcbyname getifaddrs \
-                gettimeofday hasmntopt inet_ntoa innetgr memset mkdir pathconf \
-                realpath rmdir select socket strcasecmp strchr strdup \
--               strerror strrchr strtol strtoul sigprocmask getrpcbynumber getrpcbynumber_r])
-+               strerror strrchr strtol strtoul sigprocmask])
-+
-+save_CFLAGS=$CFLAGS
-+save_LIBS=$LIBS
-+CFLAGS="$CFLAGS $AM_CPPFLAGS"
-+LIBS="$LIBS $LIBTIRPC"
-+AC_CHECK_FUNCS([getrpcbynumber getrpcbynumber_r])
-+CFLAGS=$save_CFLAGS
-+LIBS=$save_LIBS
- 
- if test "$ac_cv_func_getrpcbynumber_r" != "yes" -a "$ac_cv_func_getrpcbynumber" != "yes"; then
-    AC_MSG_ERROR([Neither getrpcbynumber_r nor getrpcbynumber are available])
--- 
-1.7.9.5
-
diff --git a/package/nfs-utils/0007-sockaddr-h-needs-stddef-h-for-NULL.patch b/package/nfs-utils/0007-sockaddr-h-needs-stddef-h-for-NULL.patch
deleted file mode 100644
index 8fcf1dd..0000000
--- a/package/nfs-utils/0007-sockaddr-h-needs-stddef-h-for-NULL.patch
+++ /dev/null
@@ -1,19 +0,0 @@
-[PATCH] sockaddr.h: needs stddef.h for NULL
-
-Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
----
- support/include/sockaddr.h |    1 +
- 1 file changed, 1 insertion(+)
-
-Index: nfs-utils-1.2.6/support/include/sockaddr.h
-===================================================================
---- nfs-utils-1.2.6.orig/support/include/sockaddr.h
-+++ nfs-utils-1.2.6/support/include/sockaddr.h
-@@ -25,6 +25,7 @@
- #include <libio.h> 
- #endif
- #include <stdbool.h>
-+#include <stddef.h>
- #include <sys/socket.h>
- #include <netinet/in.h>
- 
diff --git a/package/nfs-utils/0008-tirpc-with-pkgconfig.patch b/package/nfs-utils/0008-tirpc-with-pkgconfig.patch
deleted file mode 100644
index 712f710..0000000
--- a/package/nfs-utils/0008-tirpc-with-pkgconfig.patch
+++ /dev/null
@@ -1,102 +0,0 @@
-From 1ecd1f2008bfab7bb3cd6ada135c980414a7f1ba Mon Sep 17 00:00:00 2001
-From: "Yann E. MORIN" <yann.morin.1998@free.fr>
-Date: Sun, 23 Nov 2014 15:53:56 +0100
-Subject: [PATCH] configure: use pkg-config to find libtirpc
-
-Currently, we use a custom function to find libtirpc's headers and
-libraries. This works fine for shared linking.
-
-But for static linking, this forgets to link with -lpthread, which is
-required by libtirpc.
-
-A recent patch was sent to libtirpc to add that missing -lpthread in its
-Libs.private section of its .pc file. Thus, pkg-config will soon be able
-to return the appropriate libraries.
-
-So, use pkg-config to find libtirpc.
-
-And for older libtirpc versions, there is no change in behaviour: we're
-still missing the -lpthread. But once libtirpc has been fixed, we'll
-automatically get that missing library for free! :-)
-
-Remove the --with-libirpcinclude flag as it is no longer needed: pkg-config
-will provide us with the -I and -L flags, now.
-
-Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
-Cc: Steve Dickson <steved@redhat.com>
-
----
-Patch sent upstream:
-    http://article.gmane.org/gmane.linux.nfs/67708
----
- aclocal/libtirpc.m4 | 68 ++++++++++-------------------------------------------
- 1 file changed, 13 insertions(+), 55 deletions(-)
-
-diff --git a/aclocal/libtirpc.m4 b/aclocal/libtirpc.m4
-index b823364..4a19c1a 100644
---- a/aclocal/libtirpc.m4
-+++ b/aclocal/libtirpc.m4
-@@ -2,50 +2,19 @@ dnl Checks for TI-RPC library and headers
- dnl
- AC_DEFUN([AC_LIBTIRPC], [
- 
--  AC_ARG_WITH([tirpcinclude],
--              [AC_HELP_STRING([--with-tirpcinclude=DIR],
--                              [use TI-RPC headers in DIR])],
--              [tirpc_header_dir=$withval],
--              [tirpc_header_dir=/usr/include/tirpc])
--
--  dnl if --enable-tirpc was specifed, the following components
--  dnl must be present, and we set up HAVE_ macros for them.
--
--  if test "$enable_tirpc" != "no"; then
--
--    dnl look for the library
--    AC_CHECK_LIB([tirpc], [clnt_tli_create], [:],
--                 [if test "$enable_tirpc" = "yes"; then
--			AC_MSG_ERROR([libtirpc not found.])
--		  else
--			AC_MSG_WARN([libtirpc not found. TIRPC disabled!])
--			enable_tirpc="no"
--		  fi])
--  fi
--
--  if test "$enable_tirpc" != "no"; then
--    dnl also must have the headers installed where we expect
--    dnl look for headers; add -I compiler option if found
--    AC_CHECK_HEADERS([${tirpc_header_dir}/netconfig.h],
--    		      AC_SUBST([AM_CPPFLAGS], ["-I${tirpc_header_dir}"]),
--		      [if test "$enable_tirpc" = "yes"; then
--			 AC_MSG_ERROR([libtirpc headers not found.])
--		       else
--			 AC_MSG_WARN([libtirpc headers not found. TIRPC disabled!])
--			 enable_tirpc="no"
--		       fi])
--
--  fi
--
--  dnl now set $LIBTIRPC accordingly
--  if test "$enable_tirpc" != "no"; then
--    AC_DEFINE([HAVE_LIBTIRPC], 1,
--              [Define to 1 if you have and wish to use libtirpc.])
--    LIBTIRPC="-ltirpc"
--  else
--    LIBTIRPC=""
--  fi
--
-+  PKG_PROG_PKG_CONFIG([0.9.0])
-+  AS_IF(
-+    [test "$enable_tirpc" != "no"],
-+    [PKG_CHECK_MODULES([TIRPC], [libtirpc >= 0.2.4],
-+                       [LIBTIRPC="${TIRPC_LIBS}"
-+                        AM_CPPFLAGS="${AM_CPPFLAGS} ${TIRPC_CFLAGS}"
-+                        AC_DEFINE([HAVE_LIBTIRPC], [1],
-+                                  [Define to 1 if you have and wish to use libtirpc.])],
-+                       [AS_IF([test "$enable_tirpc" = "yes"],
-+                              [AC_MSG_ERROR([libtirpc not found.])],
-+                              [LIBTIRPC=""])])])
-+
-+  AC_SUBST([AM_CPPFLAGS])
-   AC_SUBST(LIBTIRPC)
- 
- ])dnl
diff --git a/package/nfs-utils/S60nfs b/package/nfs-utils/S60nfs
index 91410ee..37e68f8 100755
--- a/package/nfs-utils/S60nfs
+++ b/package/nfs-utils/S60nfs
@@ -15,13 +15,12 @@ touch /run/nfs/rmtab
 start() {
 	# Start daemons.
 	echo -n "Starting NFS statd: "
-	rpc.statd
+	rpc.statd -F
 	touch /var/lock/subsys/nfslock
 	echo "done"
 
 	echo -n "Starting NFS services: "
 	/usr/sbin/exportfs -r
-	rpc.statd
 	echo "done"
 
 	echo -n "Starting NFS daemon: "
diff --git a/package/nfs-utils/nfs-utils.hash b/package/nfs-utils/nfs-utils.hash
deleted file mode 100644
index e36c9d0..0000000
--- a/package/nfs-utils/nfs-utils.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# Locally computed:
-sha256  70267288500408495085b7c54a667c4e8cfde5882f3193da095fc7dad2da0b83  nfs-utils-1.2.6.tar.bz2
diff --git a/package/nfs-utils/nfs-utils.mk b/package/nfs-utils/nfs-utils.mk
index 115a133..09f4aef 100644
--- a/package/nfs-utils/nfs-utils.mk
+++ b/package/nfs-utils/nfs-utils.mk
@@ -4,9 +4,8 @@
 #
 ################################################################################
 
-NFS_UTILS_VERSION = 1.2.6
-NFS_UTILS_SOURCE = nfs-utils-$(NFS_UTILS_VERSION).tar.bz2
-NFS_UTILS_SITE = http://downloads.sourceforge.net/project/nfs/nfs-utils/$(NFS_UTILS_VERSION)
+NFS_UTILS_VERSION = nfs-utils-1-3-2
+NFS_UTILS_SITE = git://git.linux-nfs.org/projects/steved/nfs-utils.git
 NFS_UTILS_LICENSE = GPLv2+
 NFS_UTILS_LICENSE_FILES = COPYING
 NFS_UTILS_AUTORECONF = YES
-- 
2.1.4
