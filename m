From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 30 May 2012 21:44:42 +0200
Subject: [Buildroot] [git commit branch/next] nfs-utils: bump to version
	1.2.6
Message-ID: <20120530195816.9238E96E05@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2105ecbd86d04e446effa11108f6bd755ed5f19a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Bump nfs-utils to version 1.2.6
Portmap or rpcbind (which we don't have) is required so select it.
Remove nfsiostat if there's no target python.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/nfs-utils/Config.in                        |    1 +
 .../nfs-utils/nfs-utils-1.2.3-susv3-legacy.patch   |   54 ----------------
 package/nfs-utils/nfs-utils-conditionals.patch     |   58 +++++++++++++++++
 package/nfs-utils/nfs-utils-cross-build.patch      |   68 ++++++++++++++++++++
 ...-flags.patch => nfs-utils-dont-mix-flags.patch} |    0
 package/nfs-utils/nfs-utils-susv3-legacy.patch     |   59 +++++++++++++++++
 ...ibio.h.patch => nfs-utils-uclibc-libio.h.patch} |    0
 package/nfs-utils/nfs-utils.mk                     |   14 ++++-
 8 files changed, 198 insertions(+), 56 deletions(-)

diff --git a/package/nfs-utils/Config.in b/package/nfs-utils/Config.in
index 774395b..67d25a7 100644
--- a/package/nfs-utils/Config.in
+++ b/package/nfs-utils/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_NFS_UTILS
 	bool "nfs-utils"
 	depends on BR2_INET_RPC
 	depends on BR2_LARGEFILE
+	select BR2_PACKAGE_PORTMAP
 	help
 	  The NFS Linux kernel server.
 	  Warning: We do not force largefile support on here on purpose.
diff --git a/package/nfs-utils/nfs-utils-1.2.3-susv3-legacy.patch b/package/nfs-utils/nfs-utils-1.2.3-susv3-legacy.patch
deleted file mode 100644
index 3504e2d..0000000
--- a/package/nfs-utils/nfs-utils-1.2.3-susv3-legacy.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-Use the strchr() function instead of the legacy index() function.
-
-Signed-off-by: Frederik Pasch <fpasch@googlemail.com>
---- 1/utils/mountd/fsloc.c
-+++ 2/utils/mountd/fsloc.c
-@@ -126,7 +126,7 @@
- 	struct servers *rv=NULL;
- 
- 	xlog(L_NOTICE, "method_list(%s)\n", data);
--	for (ptr--, listsize=1; ptr; ptr=index(ptr, ':'), listsize++)
-+	for (ptr--, listsize=1; ptr; ptr=strchr(ptr, ':'), listsize++)
- 		ptr++;
- 	list = malloc(listsize * sizeof(char *));
- 	copy = strdup(data);
---- 1/support/nfs/nfs_mntent.c
-+++ 2/support/nfs/nfs_mntent.c
-@@ -9,7 +9,7 @@
-  */
- 
- #include <stdio.h>
--#include <string.h>		/* for index */
-+#include <string.h>		/* for strchr */
- #include <ctype.h>		/* for isdigit */
- #include <sys/stat.h>		/* for umask */
- 
-@@ -163,7 +163,7 @@
- 			return NULL;
- 
- 		mfp->mntent_lineno++;
--		s = index (buf, '\n');
-+		s = strchr (buf, '\n');
- 		if (s == NULL) {
- 			/* Missing final newline?  Otherwise extremely */
- 			/* long line - assume file was corrupted */
-@@ -171,7 +171,7 @@
- 				fprintf(stderr, _("[mntent]: warning: no final "
- 					"newline at the end of %s\n"),
- 					mfp->mntent_file);
--				s = index (buf, 0);
-+				s = strchr (buf, 0);
- 			} else {
- 				mfp->mntent_errs = 1;
- 				goto err;
---- 1/utils/mount/error.c
-+++ 2/utils/mount/error.c
-@@ -62,7 +62,7 @@
- 	char *tmp;
- 
- 	if (estr) {
--		if ((ptr = index(estr, ':')))
-+		if ((ptr = strchr(estr, ':')))
- 			estr = ++ptr;
- 
- 		tmp = &errbuf[spos];
diff --git a/package/nfs-utils/nfs-utils-conditionals.patch b/package/nfs-utils/nfs-utils-conditionals.patch
new file mode 100644
index 0000000..a2342b3
--- /dev/null
+++ b/package/nfs-utils/nfs-utils-conditionals.patch
@@ -0,0 +1,58 @@
+From 869d37a16d1e409cedd95b03cea29a6db65f9276 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Diego=20Elio=20Petten=C3=B2?= <flameeyes@flameeyes.eu>
+Date: Thu, 17 May 2012 16:26:44 -0700
+Subject: [nfs-utils PATCH] build: avoid AM_CONDITIONAL in conditional
+ execution.
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Automake does not support conditional AM_CONDITIONAL calls; what that
+means is that you always have to execute AM_CONDITIONAL one way or the
+other. Both the libsqlite3.m4 file and the nfsdcld conditionals are
+executed only when NFSv4 is enabled, which breaks building with
+--disable-nfsv4.
+
+Remove the SQLite3 conditional altogether as it's never used, and move
+the nfsdcld conditional outside of the conditional code.
+
+Signed-off-by: Diego Elio Petten?? <flameeyes@flameeyes.eu>
+---
+ aclocal/libsqlite3.m4 |    1 -
+ configure.ac          |    3 +--
+ 2 files changed, 1 insertions(+), 3 deletions(-)
+
+diff --git a/aclocal/libsqlite3.m4 b/aclocal/libsqlite3.m4
+index 73d1e46..8c38993 100644
+--- a/aclocal/libsqlite3.m4
++++ b/aclocal/libsqlite3.m4
+@@ -29,5 +29,4 @@ AC_DEFUN([AC_SQLITE3_VERS], [
+     LIBS="$saved_LIBS"])
+ 
+   AC_MSG_RESULT($libsqlite3_cv_is_recent)
+-  AM_CONDITIONAL(CONFIG_SQLITE3, [test "$libsqlite3_cv_is_recent" = "yes"])
+ ])dnl
+diff --git a/configure.ac b/configure.ac
+index 9ba53e2..b408f1b 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -278,8 +278,6 @@ if test "$enable_nfsv4" = yes; then
+ 	fi
+   fi
+ 
+-  AM_CONDITIONAL(CONFIG_NFSDCLD, [test "$enable_nfsdcld" = "yes" ])
+-
+   dnl librpcsecgss already has a dependency on libgssapi,
+   dnl but we need to make sure we get the right version
+   if test "$enable_gss" = yes; then
+@@ -293,6 +291,7 @@ if test "$enable_nfsv41" = yes; then
+ fi
+ 
+ dnl enable nfsidmap when its support by libnfsidmap
++AM_CONDITIONAL(CONFIG_NFSDCLD, [test "$enable_nfsdcld" = "yes" ])
+ AM_CONDITIONAL(CONFIG_NFSIDMAP, [test "$ac_cv_header_keyutils_h$ac_cv_lib_nfsidmap_nfs4_owner_to_uid" = "yesyes"])
+ 
+ 
+-- 
+1.7.8.6
+
diff --git a/package/nfs-utils/nfs-utils-cross-build.patch b/package/nfs-utils/nfs-utils-cross-build.patch
new file mode 100644
index 0000000..43928bf
--- /dev/null
+++ b/package/nfs-utils/nfs-utils-cross-build.patch
@@ -0,0 +1,68 @@
+Patch taken from Gentoo.
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
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
+--- a/tools/rpcdebug/Makefile.am
++++ b/tools/rpcdebug/Makefile.am
+@@ -1,15 +1,14 @@
+ ## Process this file with automake to produce Makefile.in
+ 
+ CC=$(CC_FOR_BUILD)
+-LIBTOOL = @LIBTOOL@ --tag=CC
++CFLAGS=$(CFLAGS_FOR_BUILD)
++CPPFLAGS=$(CPPFLAGS_FOR_BUILD)
++LDFLAGS=$(LDFLAGS_FOR_BUILD)
+ 
+ man8_MANS = rpcdebug.man
+ EXTRA_DIST = $(man8_MANS)
+ 
+ sbin_PROGRAMS = rpcdebug
+ rpcdebug_SOURCES = rpcdebug.c
+-rpcdebug_CFLAGS=$(CFLAGS_FOR_BUILD)
+-rpcdebug_CPPFLAGS=$(CPPFLAGS_FOR_BUILD) -I$(top_srcdir)/support/include
+-rpcdebug_LDFLAGS=$(LDFLAGS_FOR_BUILD)
+ 
+ MAINTAINERCLEANFILES = Makefile.in
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
+@@ -9,10 +11,6 @@
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
+ EXTRA_DIST = rpcgen.new.1
diff --git a/package/nfs-utils/nfs-utils-1.2.3-dont-mix-flags.patch b/package/nfs-utils/nfs-utils-dont-mix-flags.patch
similarity index 100%
rename from package/nfs-utils/nfs-utils-1.2.3-dont-mix-flags.patch
rename to package/nfs-utils/nfs-utils-dont-mix-flags.patch
diff --git a/package/nfs-utils/nfs-utils-susv3-legacy.patch b/package/nfs-utils/nfs-utils-susv3-legacy.patch
new file mode 100644
index 0000000..66dd181
--- /dev/null
+++ b/package/nfs-utils/nfs-utils-susv3-legacy.patch
@@ -0,0 +1,59 @@
+Switch legacy index() in favour of strchr()
+Updated for 1.2.6 from the previous patch by Frederik Pasch.
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+diff -Nura nfs-utils-1.2.6.orig/support/nfs/nfs_mntent.c nfs-utils-1.2.6/support/nfs/nfs_mntent.c
+--- nfs-utils-1.2.6.orig/support/nfs/nfs_mntent.c	2012-05-29 10:06:37.901255998 -0300
++++ nfs-utils-1.2.6/support/nfs/nfs_mntent.c	2012-05-29 10:06:45.726312410 -0300
+@@ -9,7 +9,7 @@
+  */
+ 
+ #include <stdio.h>
+-#include <string.h>		/* for index */
++#include <string.h>		/* for strchr */
+ #include <ctype.h>		/* for isdigit */
+ #include <sys/stat.h>		/* for umask */
+ #include <unistd.h>		/* for ftruncate */
+@@ -172,7 +172,7 @@
+ 			return NULL;
+ 
+ 		mfp->mntent_lineno++;
+-		s = index (buf, '\n');
++		s = strchr (buf, '\n');
+ 		if (s == NULL) {
+ 			/* Missing final newline?  Otherwise extremely */
+ 			/* long line - assume file was corrupted */
+@@ -180,7 +180,7 @@
+ 				fprintf(stderr, _("[mntent]: warning: no final "
+ 					"newline at the end of %s\n"),
+ 					mfp->mntent_file);
+-				s = index (buf, 0);
++				s = strchr (buf, 0);
+ 			} else {
+ 				mfp->mntent_errs = 1;
+ 				goto err;
+diff -Nura nfs-utils-1.2.6.orig/utils/mount/error.c nfs-utils-1.2.6/utils/mount/error.c
+--- nfs-utils-1.2.6.orig/utils/mount/error.c	2012-05-29 10:06:37.946256325 -0300
++++ nfs-utils-1.2.6/utils/mount/error.c	2012-05-29 10:06:45.727312416 -0300
+@@ -62,7 +62,7 @@
+ 	char *tmp;
+ 
+ 	if (estr) {
+-		if ((ptr = index(estr, ':')))
++		if ((ptr = strchr(estr, ':')))
+ 			estr = ++ptr;
+ 
+ 		tmp = &errbuf[spos];
+diff -Nura nfs-utils-1.2.6.orig/utils/mountd/fsloc.c nfs-utils-1.2.6/utils/mountd/fsloc.c
+--- nfs-utils-1.2.6.orig/utils/mountd/fsloc.c	2012-05-29 10:06:37.911256072 -0300
++++ nfs-utils-1.2.6/utils/mountd/fsloc.c	2012-05-29 10:07:11.140322564 -0300
+@@ -127,7 +127,7 @@
+ 	bool v6esc = false;
+ 
+ 	xlog(L_NOTICE, "method_list(%s)", data);
+-	for (ptr--, listsize=1; ptr; ptr=index(ptr, ':'), listsize++)
++	for (ptr--, listsize=1; ptr; ptr=strchr(ptr, ':'), listsize++)
+ 		ptr++;
+ 	list = malloc(listsize * sizeof(char *));
+ 	copy = strdup(data);
diff --git a/package/nfs-utils/nfs-utils-1.2.3-uclibc-libio.h.patch b/package/nfs-utils/nfs-utils-uclibc-libio.h.patch
similarity index 100%
rename from package/nfs-utils/nfs-utils-1.2.3-uclibc-libio.h.patch
rename to package/nfs-utils/nfs-utils-uclibc-libio.h.patch
diff --git a/package/nfs-utils/nfs-utils.mk b/package/nfs-utils/nfs-utils.mk
index 557e7e8..87c136c 100644
--- a/package/nfs-utils/nfs-utils.mk
+++ b/package/nfs-utils/nfs-utils.mk
@@ -3,14 +3,17 @@
 # nfs-utils
 #
 #############################################################
-NFS_UTILS_VERSION = 1.2.3
+
+NFS_UTILS_VERSION = 1.2.6
 NFS_UTILS_SOURCE = nfs-utils-$(NFS_UTILS_VERSION).tar.bz2
-NFS_UTILS_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/nfs/
+NFS_UTILS_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/project/nfs/nfs-utils/$(NFS_UTILS_VERSION)
+NFS_UTILS_AUTORECONF = YES
 
 NFS_UTILS_CONF_ENV = knfsd_cv_bsd_signals=no
 
 NFS_UTILS_CONF_OPT = \
 		--disable-nfsv4 \
+		--disable-nfsv41 \
 		--disable-gss \
 		--disable-tirpc \
 		--disable-uuid \
@@ -28,6 +31,13 @@ define NFS_UTILS_INSTALL_FIXUP
 	rm -f $(NFS_UTILS_TARGETS_)
 endef
 
+define NFS_UTILS_REMOVE_NFSIOSTAT
+	rm -f $(TARGET_DIR)/usr/sbin/nfsiostat
+endef
+
 NFS_UTILS_POST_INSTALL_TARGET_HOOKS += NFS_UTILS_INSTALL_FIXUP
 
+# nfsiostat is interpreted python, so remove it unless it's in the target
+NFS_UTILS_POST_INSTALL_TARGET_HOOKS += $(if $(BR2_PACKAGE_PYTHON),,NFS_UTILS_REMOVE_NFSIOSTAT)
+
 $(eval $(call AUTOTARGETS))
