From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 20 Jun 2017 22:14:52 +0200
Subject: [Buildroot] [git commit] openipmi: no need to check for
	clock_gettime
Message-ID: <20170620201446.0299C81E67@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f1f033d8ec0c7beb30902b4f7114182d12c53d84
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Buildroot no longer supports toolchains with glibc older than 2.17, so there
is no need to check whether librt is required for clock_* system calls.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...c-detect-lrt-requirement-for-clock_gettim.patch | 57 ----------------------
 1 file changed, 57 deletions(-)

diff --git a/package/openipmi/0002-configure.ac-detect-lrt-requirement-for-clock_gettim.patch b/package/openipmi/0002-configure.ac-detect-lrt-requirement-for-clock_gettim.patch
deleted file mode 100644
index d58ffd7..0000000
--- a/package/openipmi/0002-configure.ac-detect-lrt-requirement-for-clock_gettim.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-From d3be03464be7fa3844dfe0837a7e2c920c107836 Mon Sep 17 00:00:00 2001
-From: Baruch Siach <baruch@tkos.co.il>
-Date: Thu, 23 Jul 2015 13:35:35 +0300
-Subject: [PATCH] configure.ac: detect -lrt requirement for clock_gettime
-
-glibc versions before 2.17 require link with -lrt.
-
-Upstream status: sent, stuck in moderator's queue
-
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
- configure.ac     | 8 ++++++++
- unix/Makefile.am | 4 ++--
- 2 files changed, 10 insertions(+), 2 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 18401f161d45..6b350a41a916 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -854,6 +854,14 @@ OPENIPMI_SWIG_SO="${PYTHON_POSIX_SO}:\$(top_builddir)/lib/.libs/libOpenIPMI.so:\
- AC_SUBST(OPENIPMI_SWIG_LIBS)
- AC_SUBST(OPENIPMI_SWIG_SO)
- 
-+LIB_CLOCK_GETTIME=
-+clk_saved_libs=$LIBS
-+AC_SEARCH_LIBS([clock_gettime], [rt],
-+	       [test "$ac_cv_search_clock_gettime" = "none required" ||
-+		LIB_CLOCK_GETTIME=$ac_cv_search_clock_gettime])
-+AC_SUBST([LIB_CLOCK_GETTIME])
-+LIBS=$clk_saved_libs
-+
- # Everything from here to AC_OUTPUT is for libedit
- 
- # AC_PROG_LIBTOOL runs AC_CANONICAL_HOST
-diff --git a/unix/Makefile.am b/unix/Makefile.am
-index a108bc679c9a..fb60242d5d3b 100644
---- a/unix/Makefile.am
-+++ b/unix/Makefile.am
-@@ -9,13 +9,13 @@ lib_LTLIBRARIES = libOpenIPMIposix.la libOpenIPMIpthread.la
- 
- libOpenIPMIpthread_la_SOURCES = posix_thread_os_hnd.c selector.c
- libOpenIPMIpthread_la_LIBADD = -lpthread $(GDBM_LIB) \
--	$(top_builddir)/utils/libOpenIPMIutils.la
-+	$(top_builddir)/utils/libOpenIPMIutils.la $(LIB_CLOCK_GETTIME)
- libOpenIPMIpthread_la_LDFLAGS = -rdynamic -version-info $(LD_VERSION) \
- 	-Wl,-Map -Wl,libOpenIPMIpthread.map
- 
- libOpenIPMIposix_la_SOURCES = posix_os_hnd.c selector.c
- libOpenIPMIposix_la_LIBADD = $(top_builddir)/utils/libOpenIPMIutils.la \
--	$(GDBM_LIB)
-+	$(GDBM_LIB) $(LIB_CLOCK_GETTIME)
- libOpenIPMIposix_la_LDFLAGS = -rdynamic -version-info $(LD_VERSION) \
- 	-Wl,-Map -Wl,libOpenIPMIposix.map
- 
--- 
-2.1.4
-
