From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Mon, 10 Feb 2020 13:03:53 +0100
Subject: [Buildroot] [PATCH] package/nfs-utils: bump version to 2.4.3
Message-ID: <20200210120353.49600-1-giulio.benetti@benettiengineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump to version 2.4.3 of nfs-utils. All patches have been upstreamed, so
drop them all. It must be used rpcgen build by host-nfs-utils, to do
this let's pass its path to --with-rpcgen= instead of 'internal'.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 .../0001-Patch-taken-from-Gentoo.patch        | 60 ----------------
 ...tch-legacy-index-in-favour-of-strchr.patch | 72 -------------------
 ...e-script-find-getrpcbynumber-in-libt.patch | 46 ------------
 ...ntd-Add-check-for-struct-file_handle.patch | 46 ------------
 ...tils-add-missing-include-of-stdint.h.patch | 33 ---------
 ...de-sys-sysmacros.h-where-appropriate.patch | 50 -------------
 package/nfs-utils/nfs-utils.hash              |  4 +-
 package/nfs-utils/nfs-utils.mk                |  5 +-
 8 files changed, 5 insertions(+), 311 deletions(-)
 delete mode 100644 package/nfs-utils/0001-Patch-taken-from-Gentoo.patch
 delete mode 100644 package/nfs-utils/0002-Switch-legacy-index-in-favour-of-strchr.patch
 delete mode 100644 package/nfs-utils/0003-Let-the-configure-script-find-getrpcbynumber-in-libt.patch
 delete mode 100644 package/nfs-utils/0004-mountd-Add-check-for-struct-file_handle.patch
 delete mode 100644 package/nfs-utils/0005-nfs-utils-add-missing-include-of-stdint.h.patch
 delete mode 100644 package/nfs-utils/0006-Include-sys-sysmacros.h-where-appropriate.patch

diff --git a/package/nfs-utils/0001-Patch-taken-from-Gentoo.patch b/package/nfs-utils/0001-Patch-taken-from-Gentoo.patch
deleted file mode 100644
index 47bf9db40d..0000000000
--- a/package/nfs-utils/0001-Patch-taken-from-Gentoo.patch
+++ /dev/null
@@ -1,60 +0,0 @@
-From 5796ca01e33596d4102dd714349c908fecc331c0 Mon Sep 17 00:00:00 2001
-From: Gustavo Zacarias <gustavo@zacarias.com.ar>
-Date: Sat, 10 Nov 2012 18:56:12 +0100
-Subject: [PATCH] Patch taken from Gentoo
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
----
- tools/locktest/Makefile.am | 7 +++----
- tools/rpcgen/Makefile.am   | 8 +++-----
- 2 files changed, 6 insertions(+), 9 deletions(-)
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
-2.1.0
-
diff --git a/package/nfs-utils/0002-Switch-legacy-index-in-favour-of-strchr.patch b/package/nfs-utils/0002-Switch-legacy-index-in-favour-of-strchr.patch
deleted file mode 100644
index 655d534253..0000000000
--- a/package/nfs-utils/0002-Switch-legacy-index-in-favour-of-strchr.patch
+++ /dev/null
@@ -1,72 +0,0 @@
-From a1d45736286939b822fcc7b9c74843f6f90a747e Mon Sep 17 00:00:00 2001
-From: Gustavo Zacarias <gustavo@zacarias.com.ar>
-Date: Sat, 10 Nov 2012 18:58:15 +0100
-Subject: [PATCH] Switch legacy index() in favour of strchr() Updated for 1.2.6
- from the previous patch by Frederik Pasch.
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
----
- support/nfs/nfs_mntent.c | 6 +++---
- utils/mount/error.c      | 2 +-
- utils/mountd/fsloc.c     | 2 +-
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
-index e06f598..7bd1d27 100644
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
-2.1.0
diff --git a/package/nfs-utils/0003-Let-the-configure-script-find-getrpcbynumber-in-libt.patch b/package/nfs-utils/0003-Let-the-configure-script-find-getrpcbynumber-in-libt.patch
deleted file mode 100644
index dca44f6dbf..0000000000
--- a/package/nfs-utils/0003-Let-the-configure-script-find-getrpcbynumber-in-libt.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From 87f88b28ac01b6449463f00b660fe7416d7f9a55 Mon Sep 17 00:00:00 2001
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
- configure.ac | 14 +++++++++++++-
- 1 file changed, 13 insertions(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index 8e427e3..6e42c96 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -433,11 +433,23 @@ AC_FUNC_STAT
- AC_FUNC_VPRINTF
- AC_CHECK_FUNCS([alarm atexit dup2 fdatasync ftruncate getcwd \
-                gethostbyaddr gethostbyname gethostname getmntent \
--               getnameinfo getrpcbyname getrpcbynumber getrpcbynumber_r getifaddrs \
-+               getnameinfo getrpcbyname getifaddrs \
-                gettimeofday hasmntopt inet_ntoa innetgr memset mkdir pathconf \
-                ppoll realpath rmdir select socket strcasecmp strchr strdup \
-                strerror strrchr strtol strtoul sigprocmask name_to_handle_at])
-
-+save_CFLAGS=$CFLAGS
-+save_LIBS=$LIBS
-+CFLAGS="$CFLAGS $AM_CPPFLAGS"
-+LIBS="$LIBS $LIBTIRPC"
-+AC_CHECK_FUNCS([getrpcbynumber getrpcbynumber_r])
-+CFLAGS=$save_CFLAGS
-+LIBS=$save_LIBS
-+
-+if test "$ac_cv_func_getrpcbynumber_r" != "yes" -a "$ac_cv_func_getrpcbynumber" != "yes"; then
-+   AC_MSG_ERROR([Neither getrpcbynumber_r nor getrpcbynumber are available])
-+fi
-+
- dnl *************************************************************
- dnl Check for data sizes
- dnl *************************************************************
---
-2.1.0
-
diff --git a/package/nfs-utils/0004-mountd-Add-check-for-struct-file_handle.patch b/package/nfs-utils/0004-mountd-Add-check-for-struct-file_handle.patch
deleted file mode 100644
index 7aca266977..0000000000
--- a/package/nfs-utils/0004-mountd-Add-check-for-struct-file_handle.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From 3c23b3ea7f5069e8fd4d5758704cd968504f1079 Mon Sep 17 00:00:00 2001
-From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
-Date: Tue, 2 Feb 2016 10:07:22 +0100
-Subject: [PATCH] mountd: Add check for 'struct file_handle'
-
-The code to check if name_to_handle_at() is implemented generates only a
-warning but with some toolchain it doesn't fail to link (the function must be
-implemented somewhere).
-However the "struct file_handle" type is not available.
-
-So, this patch adds a check for this struct.
-
-Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
----
- configure.ac         | 1 +
- utils/mountd/cache.c | 2 +-
- 2 files changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index 25d2ba4..913a86f 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -425,6 +425,7 @@ AC_TYPE_PID_T
- AC_TYPE_SIZE_T
- AC_HEADER_TIME
- AC_STRUCT_TM
-+AC_CHECK_TYPES([struct file_handle])
- 
- dnl *************************************************************
- dnl Check for functions
-diff --git a/utils/mountd/cache.c b/utils/mountd/cache.c
-index 7847446..dc64f6d 100644
---- a/utils/mountd/cache.c
-+++ b/utils/mountd/cache.c
-@@ -424,7 +424,7 @@ static int same_path(char *child, char *parent, int len)
- 	if (count_slashes(p) != count_slashes(parent))
- 		return 0;
- 
--#if HAVE_NAME_TO_HANDLE_AT
-+#if defined(HAVE_NAME_TO_HANDLE_AT) && defined(HAVE_STRUCT_FILE_HANDLE)
- 	struct {
- 		struct file_handle fh;
- 		unsigned char handle[128];
--- 
-2.7.0
-
diff --git a/package/nfs-utils/0005-nfs-utils-add-missing-include-of-stdint.h.patch b/package/nfs-utils/0005-nfs-utils-add-missing-include-of-stdint.h.patch
deleted file mode 100644
index a6214350ca..0000000000
--- a/package/nfs-utils/0005-nfs-utils-add-missing-include-of-stdint.h.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From b3ff26fa182b34b6faa1317f18a9dac4c7963334 Mon Sep 17 00:00:00 2001
-From: Matt Weber <matthew.weber@rockwellcollins.com>
-Date: Mon, 2 Oct 2017 09:57:15 -0500
-Subject: [PATCH] nfs-utils: add missing include of stdint.h
-
-Glibc bump to 2.26 exposed this missing header when building
-with the following combination using an i386 internal toolchain.
-gcc5.4.0
-bin2.28.1
-linux4.1.43
-
-Upstream: https://bugzilla.linux-nfs.org/show_bug.cgi?id=312
-
-Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
----
- support/nsm/rpc.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/support/nsm/rpc.c b/support/nsm/rpc.c
-index 4e5f40e..d91c6ea 100644
---- a/support/nsm/rpc.c
-+++ b/support/nsm/rpc.c
-@@ -40,6 +40,7 @@
- 
- #include <time.h>
- #include <stdbool.h>
-+#include <stdint.h>
- #include <string.h>
- #include <unistd.h>
- #include <fcntl.h>
--- 
-1.9.1
-
diff --git a/package/nfs-utils/0006-Include-sys-sysmacros.h-where-appropriate.patch b/package/nfs-utils/0006-Include-sys-sysmacros.h-where-appropriate.patch
deleted file mode 100644
index a593ca3b6f..0000000000
--- a/package/nfs-utils/0006-Include-sys-sysmacros.h-where-appropriate.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From e3918d70b0b4a1d0f5421318e542ec807833da3f Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-Date: Fri, 2 Nov 2018 10:45:21 +0100
-Subject: [PATCH] Include <sys/sysmacros.h> where appropriate
-
-Since glibc 2.28, the major() and minor() macros need to explicitly
-include <sys/sysmacros.h>.
-
-Patch initially contributed by
-Timothy Pearson <tpearson@raptorengineering.com>.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- support/nfs/nfsexport.c | 4 ++++
- utils/mountd/cache.c    | 4 ++++
- 2 files changed, 8 insertions(+)
-
-diff --git a/support/nfs/nfsexport.c b/support/nfs/nfsexport.c
-index afd7c90..a7cbc14 100644
---- a/support/nfs/nfsexport.c
-+++ b/support/nfs/nfsexport.c
-@@ -17,6 +17,10 @@
- #include <unistd.h>
- #include <fcntl.h>
- 
-+#ifdef __GLIBC__
-+#include <sys/sysmacros.h>
-+#endif
-+
- #include "nfslib.h"
- #include "misc.h"
- 
-diff --git a/utils/mountd/cache.c b/utils/mountd/cache.c
-index 179ea18..61f9b14 100644
---- a/utils/mountd/cache.c
-+++ b/utils/mountd/cache.c
-@@ -36,6 +36,10 @@
- #include "blkid/blkid.h"
- #endif
- 
-+#ifdef __GLIBC__
-+#include <sys/sysmacros.h>
-+#endif
-+
- /*
-  * Invoked by RPC service loop
-  */
--- 
-2.14.4
-
diff --git a/package/nfs-utils/nfs-utils.hash b/package/nfs-utils/nfs-utils.hash
index 74503c65bb..a30013af93 100644
--- a/package/nfs-utils/nfs-utils.hash
+++ b/package/nfs-utils/nfs-utils.hash
@@ -1,4 +1,4 @@
-# From https://www.kernel.org/pub/linux/utils/nfs-utils/1.3.4/sha256sums.asc
-sha256 b42a5bc0a8d80d04650030ceb9a11f08f4acfbcb1ee297f657fb94e339c45975  nfs-utils-1.3.4.tar.xz
+# From https://www.kernel.org/pub/linux/utils/nfs-utils/2.4.3/sha256sums.asc
+sha256 af65fce5dd8370cff9ead67baac5a6cd69c376dcadfef264dc2c78c904f26599  nfs-utils-2.4.3.tar.xz
 # Locally computed
 sha256 576540abf5e95029ad4ad90e32071385a5e95b2c30708c706116f3eb87b9a3de  COPYING
diff --git a/package/nfs-utils/nfs-utils.mk b/package/nfs-utils/nfs-utils.mk
index a3484286d1..399bfc5539 100644
--- a/package/nfs-utils/nfs-utils.mk
+++ b/package/nfs-utils/nfs-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NFS_UTILS_VERSION = 1.3.4
+NFS_UTILS_VERSION = 2.4.3
 NFS_UTILS_SOURCE = nfs-utils-$(NFS_UTILS_VERSION).tar.xz
 NFS_UTILS_SITE = https://www.kernel.org/pub/linux/utils/nfs-utils/$(NFS_UTILS_VERSION)
 NFS_UTILS_LICENSE = GPL-2.0+
@@ -23,7 +23,8 @@ NFS_UTILS_CONF_OPTS = \
 	--enable-ipv6 \
 	--without-tcp-wrappers \
 	--with-statedir=/run/nfs \
-	--with-rpcgen=internal
+	--with-rpcgen=$(HOST_DIR)/bin/rpcgen
+
 
 HOST_NFS_UTILS_CONF_OPTS = \
 	--disable-nfsv4 \
-- 
2.20.1
