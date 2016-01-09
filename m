From: Samuel Martin <s.martin49@gmail.com>
Date: Sat,  9 Jan 2016 21:59:23 +0100
Subject: [Buildroot] [PATCH v2 1/2] package/lttng-tools: bump to version
	2.7.1
Message-ID: <1452373164-14508-1-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also remove merged patches.
So, autoreconf is no longer needed.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>

---
changes v1->v2:
- no need to autoreconf (Baruch)
---
 .../0001-configure.ac-fix-static-build.patch       | 55 -------------
 ...dependency-on-glibc-2.12-caused-by-pthrea.patch | 56 -------------
 ...0003-tests-unit-fix-object-files-location.patch | 94 ----------------------
 package/lttng-tools/lttng-tools.hash               |  2 +-
 package/lttng-tools/lttng-tools.mk                 |  4 +-
 5 files changed, 2 insertions(+), 209 deletions(-)
 delete mode 100644 package/lttng-tools/0001-configure.ac-fix-static-build.patch
 delete mode 100644 package/lttng-tools/0002-Fix-Remove-dependency-on-glibc-2.12-caused-by-pthrea.patch
 delete mode 100644 package/lttng-tools/0003-tests-unit-fix-object-files-location.patch

diff --git a/package/lttng-tools/0001-configure.ac-fix-static-build.patch b/package/lttng-tools/0001-configure.ac-fix-static-build.patch
deleted file mode 100644
index ebff592..0000000
--- a/package/lttng-tools/0001-configure.ac-fix-static-build.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-Upstream status: Merged
-Fetched from: https://git.lttng.org/?p=lttng-tools.git;a=commit;h=e9cee23a2e92694ba1347fd1242026d4c19413a8
-From e9cee23a2e92694ba1347fd1242026d4c19413a8 Mon Sep 17 00:00:00 2001
-From: Samuel Martin <s.martin49@gmail.com>
-Date: Sun, 22 Nov 2015 23:38:00 +0100
-Subject: [PATCH] configure.ac: fix static build
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-For static build, some extra LDFLAGS may be needed.
-
-Using PKG_CHECK_MODULES instead of AC_CHECK_LIB for librairy detection
-allows to get all these flags. Then, the LIBS variable can be extended
-with everything that is needed.
-
-So, use PKG_CHECK_MODULES for popt and uuid detection; which both depend
-on libintl.
-
-This changes fixes build failures triggered with Buildroot, e.g.:
-  http://autobuild.buildroot.net/results/0f1/0f1e015a0c5a5ac2beeb5011d31a1e0058a32a0d/build-end.log
-
-Signed-off-by: Samuel Martin <s.martin49@gmail.com>
-Signed-off-by: J?r?mie Galarneau <jeremie.galarneau@efficios.com>
----
- configure.ac | 6 ++++--
- 1 file changed, 4 insertions(+), 2 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 2c451e9..978e3bc 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -218,15 +218,17 @@ AC_CHECK_LIB([pthread], [pthread_create], [],
- )
- 
- # Check libpopt
--AC_CHECK_LIB([popt], [poptGetContext], [],
-+PKG_CHECK_MODULES([POPT], [popt],
-+	[LIBS="$LIBS $POPT_LIBS"],
- 	[AC_MSG_ERROR([Cannot find libpopt. Use [LDFLAGS]=-Ldir to specify its location.])]
- )
- 
- AM_PATH_XML2(2.7.6, true, AC_MSG_ERROR(No supported version of libxml2 found.))
- 
- # Check for libuuid
--AC_CHECK_LIB([uuid], [uuid_generate],
-+PKG_CHECK_MODULES([UUID], [uuid],
- [
-+	LIBS="$LIBS $UUID_LIBS"
- 	AC_DEFINE_UNQUOTED([LTTNG_HAVE_LIBUUID], 1, [Has libuuid support.])
- 	have_libuuid=yes
- ],
--- 
-2.6.3
-
diff --git a/package/lttng-tools/0002-Fix-Remove-dependency-on-glibc-2.12-caused-by-pthrea.patch b/package/lttng-tools/0002-Fix-Remove-dependency-on-glibc-2.12-caused-by-pthrea.patch
deleted file mode 100644
index 6c0fee9..0000000
--- a/package/lttng-tools/0002-Fix-Remove-dependency-on-glibc-2.12-caused-by-pthrea.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-Upstream status: Merged
-Fetched from: https://git.lttng.org/?p=lttng-tools.git;a=commit;h=b8090274814e5f6a22cff0dd656e14769cc7a7df
-From b8090274814e5f6a22cff0dd656e14769cc7a7df Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?J=C3=A9r=C3=A9mie=20Galarneau?=
- <jeremie.galarneau@efficios.com>
-Date: Wed, 30 Sep 2015 16:48:12 -0400
-Subject: [PATCH] Fix: Remove dependency on glibc 2.12 caused by
- pthread_setname_np
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-prctl() can be used to set the same attribute set by
-pthread_setname_np, but doesn't introduce a dependency on a newer
-glibc. Using prctl(PR_SET_NAME) introduces a soft dependency on
-Linux 2.6.9. However, the worker won't fail to launch if the call
-fails as it is set out of convenience (debugger output).
-
-Signed-off-by: J?r?mie Galarneau <jeremie.galarneau@efficios.com>
-Signed-off-by: Samuel Martin <s.martin49@gmail.com>
----
- src/common/runas.c | 10 +++++-----
- 1 file changed, 5 insertions(+), 5 deletions(-)
-
-diff --git a/src/common/runas.c b/src/common/runas.c
-index 3826c61..bc7356b 100644
---- a/src/common/runas.c
-+++ b/src/common/runas.c
-@@ -31,6 +31,7 @@
- #include <sched.h>
- #include <sys/signal.h>
- #include <assert.h>
-+#include <sys/prctl.h>
- 
- #include <common/common.h>
- #include <common/utils.h>
-@@ -322,12 +323,11 @@ int run_as_worker(struct run_as_worker *worker)
- 	memset(worker->procname, 0, proc_orig_len);
- 	strncpy(worker->procname, DEFAULT_RUN_AS_WORKER_NAME, proc_orig_len);
- 
--	ret = pthread_setname_np(pthread_self(), DEFAULT_RUN_AS_WORKER_NAME);
-+	ret = prctl(PR_SET_NAME, DEFAULT_RUN_AS_WORKER_NAME, 0, 0, 0);
- 	if (ret) {
--		errno = ret;
--		ret = -1;
--		PERROR("pthread_setname_np");
--		return EXIT_FAILURE;
-+		/* Don't fail as this is not essential. */
-+		PERROR("prctl PR_SET_NAME");
-+		ret = 0;
- 	}
- 
- 	sendret.ret = 0;
--- 
-2.6.3
-
diff --git a/package/lttng-tools/0003-tests-unit-fix-object-files-location.patch b/package/lttng-tools/0003-tests-unit-fix-object-files-location.patch
deleted file mode 100644
index 9bfee4b..0000000
--- a/package/lttng-tools/0003-tests-unit-fix-object-files-location.patch
+++ /dev/null
@@ -1,94 +0,0 @@
-Upstream status: Merged
-Fetched from: https://git.lttng.org/?p=lttng-tools.git;a=commit;h=3622d7c3931685fab8d1b2e5585a369b78cefd12
-From 3622d7c3931685fab8d1b2e5585a369b78cefd12 Mon Sep 17 00:00:00 2001
-From: Samuel Martin <s.martin49@gmail.com>
-Date: Wed, 2 Dec 2015 00:36:45 +0100
-Subject: [PATCH] tests/unit: fix object files' location
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Referring to *.o files under a .libs/ directory is not recommended
-because this belongs to libtool's innards.
-
-Indeed, libtool decides to place the *.o files in an
-implementation-specific location:
-- PIC *.o files go into a .libs/ directory;
-- non-PIC *.o files are generated along side to their corresponding
-  source files.
-
-Using PIC objects to build executable is legit, thought it may
-introduce some minor overhead at runtime.
-
-However, hard-coding these PIC object files in the Makefile.am to build
-executables breaks the build in case of static only build.
-
-In this case, no PIC object files is generated, so the linker will not
-found some of the needed objects files.
-
-Changing these dependencies' path fixes the static build, keeping the
-shared one ok, though the non-PIC object files are now always built.
-
-Fixes #983.
-
-Fix tested on git master and v2.6 with no change needed.
-
-Signed-off-by: Samuel Martin <s.martin49@gmail.com>
-Signed-off-by: J?r?mie Galarneau <jeremie.galarneau@efficios.com>
----
- tests/unit/Makefile.am | 18 +++++++++---------
- 1 file changed, 9 insertions(+), 9 deletions(-)
-
-diff --git a/tests/unit/Makefile.am b/tests/unit/Makefile.am
-index c0c9c45..7bfe65a 100644
---- a/tests/unit/Makefile.am
-+++ b/tests/unit/Makefile.am
-@@ -34,9 +34,9 @@ SESSIONS=$(top_builddir)/src/bin/lttng-sessiond/session.o	\
- 	 $(top_builddir)/src/bin/lttng-sessiond/consumer.o \
- 	 $(top_builddir)/src/bin/lttng-sessiond/utils.o \
- 	 $(top_builddir)/src/bin/lttng-sessiond/snapshot.o \
--	 $(top_builddir)/src/common/.libs/uri.o \
--	 $(top_builddir)/src/common/.libs/utils.o \
--	 $(top_builddir)/src/common/.libs/error.o \
-+	 $(top_builddir)/src/common/uri.o \
-+	 $(top_builddir)/src/common/utils.o \
-+	 $(top_builddir)/src/common/error.o \
- 	 $(top_builddir)/src/common/health/libhealth.la \
- 	 $(top_builddir)/src/common/sessiond-comm/libsessiond-comm.la
- 
-@@ -60,8 +60,8 @@ UST_DATA_TRACE=$(top_builddir)/src/bin/lttng-sessiond/trace-ust.o \
- 		   $(top_builddir)/src/bin/lttng-sessiond/session.o \
- 		   $(top_builddir)/src/bin/lttng-sessiond/snapshot.o \
- 		   $(top_builddir)/src/bin/lttng-sessiond/agent.o \
--		   $(top_builddir)/src/common/.libs/uri.o \
--		   $(top_builddir)/src/common/.libs/utils.o \
-+		   $(top_builddir)/src/common/uri.o \
-+		   $(top_builddir)/src/common/utils.o \
- 		   $(top_builddir)/src/common/health/libhealth.la \
- 		   $(top_builddir)/src/common/sessiond-comm/libsessiond-comm.la
- 
-@@ -75,8 +75,8 @@ endif
- KERN_DATA_TRACE=$(top_builddir)/src/bin/lttng-sessiond/trace-kernel.o	\
- 		$(top_builddir)/src/bin/lttng-sessiond/consumer.o	\
- 		$(top_builddir)/src/bin/lttng-sessiond/utils.o \
--		$(top_builddir)/src/common/.libs/uri.o \
--		$(top_builddir)/src/common/.libs/utils.o \
-+		$(top_builddir)/src/common/uri.o \
-+		$(top_builddir)/src/common/utils.o \
- 		$(top_builddir)/src/common/health/libhealth.la \
- 		$(top_builddir)/src/common/sessiond-comm/libsessiond-comm.la
- 
-@@ -86,8 +86,8 @@ test_kernel_data_LDADD = $(LIBTAP) $(LIBCOMMON) $(LIBRELAYD) $(LIBSESSIOND_COMM)
- test_kernel_data_LDADD += $(KERN_DATA_TRACE)
- 
- # utils suffix for unit test
--UTILS_SUFFIX=$(top_builddir)/src/common/.libs/utils.o \
--		$(top_builddir)/src/common/.libs/runas.o
-+UTILS_SUFFIX=$(top_builddir)/src/common/utils.o \
-+		$(top_builddir)/src/common/runas.o
- 
- # parse_size_suffix unit test
- test_utils_parse_size_suffix_SOURCES = test_utils_parse_size_suffix.c
--- 
-2.6.3
-
diff --git a/package/lttng-tools/lttng-tools.hash b/package/lttng-tools/lttng-tools.hash
index 94e389f..f05b0e3 100644
--- a/package/lttng-tools/lttng-tools.hash
+++ b/package/lttng-tools/lttng-tools.hash
@@ -1,2 +1,2 @@
 # Locally generated
-sha256  261d1b60ef0f451be42df70f019b24fda9130372e326e7bdba3e3ffab7ca0c40  lttng-tools-2.7.0.tar.bz2
+sha256  0c799fb21dfa42475feaa1507ded934608b2e531039b46c40e944a5b81c7b21c  lttng-tools-2.7.1.tar.bz2
diff --git a/package/lttng-tools/lttng-tools.mk b/package/lttng-tools/lttng-tools.mk
index 65e0484..c33d6c2 100644
--- a/package/lttng-tools/lttng-tools.mk
+++ b/package/lttng-tools/lttng-tools.mk
@@ -4,14 +4,12 @@
 #
 ################################################################################
 
-LTTNG_TOOLS_VERSION = 2.7.0
+LTTNG_TOOLS_VERSION = 2.7.1
 LTTNG_TOOLS_SITE = http://lttng.org/files/lttng-tools
 LTTNG_TOOLS_SOURCE = lttng-tools-$(LTTNG_TOOLS_VERSION).tar.bz2
 LTTNG_TOOLS_LICENSE = GPLv2+, LGPLv2.1+ (include/lttng/*, src/lib/lttng-ctl/*)
 LTTNG_TOOLS_LICENSE_FILES = gpl-2.0.txt lgpl-2.1.txt LICENSE
 LTTNG_TOOLS_CONF_OPTS += --with-xml-prefix=$(STAGING_DIR)/usr
-# Need autoreconf because of a patch touching configure.ac
-LTTNG_TOOLS_AUTORECONF = YES
 
 # The host-lttng-babeltrace technically isn't a required build
 # dependency. However, having the babeltrace utilities built for the
-- 
2.7.0
