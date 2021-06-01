From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 1 Jun 2021 22:50:20 +0200
Subject: [Buildroot] [git commit] package/lttng-tools: disable tests
Message-ID: <20210601202927.019277FD64@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2df1c10ba76fa9d8d40a438d16c40cba15ec5db6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Disabling tests will fix the following build failures on riscv32:

select_poll_epoll.c:408:16: note: each undeclared identifier is reported only once for each function it appears in
select_poll_epoll.c: In function 'ppoll_fds_ulong_max':
select_poll_epoll.c:440:16: error: 'SYS_ppoll' undeclared (first use in this function); did you mean 'SYS_tkill'?
  440 |  ret = syscall(SYS_ppoll, ufds, ULONG_MAX, NULL, NULL);
      |                ^~~~~~~~~
      |                SYS_tkill
select_poll_epoll.c: In function 'pselect_invalid_fd':
select_poll_epoll.c:488:16: error: 'SYS_pselect6' undeclared (first use in this function); did you mean 'SYS_semctl'?
  488 |  ret = syscall(SYS_pselect6, fd + 1, &rfds, NULL, NULL, NULL, NULL);
      |                ^~~~~~~~~~~~
      |                SYS_semctl

Fixes:
 - http://autobuild.buildroot.org/results/dd39188a7191efa512a51f18f4c34d9ee711a6a7

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 .../0001-configure.ac-add-disable-tests.patch      | 37 ++++++++++++++++++++++
 package/lttng-tools/lttng-tools.mk                 |  3 ++
 2 files changed, 40 insertions(+)

diff --git a/package/lttng-tools/0001-configure.ac-add-disable-tests.patch b/package/lttng-tools/0001-configure.ac-add-disable-tests.patch
new file mode 100644
index 0000000000..f569c7ec70
--- /dev/null
+++ b/package/lttng-tools/0001-configure.ac-add-disable-tests.patch
@@ -0,0 +1,37 @@
+From 8c3a5d0921090e2fc3c4e2561509d23eb9ffa6dd Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Fri, 2 Apr 2021 21:07:07 +0200
+Subject: [PATCH] configure.ac: add --disable-tests
+
+Allow the user to explicitly disable tests
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/lttng/lttng-tools/pull/162]
+---
+ configure.ac | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/configure.ac b/configure.ac
+index 04f9cef4..372cdf3d 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -862,6 +862,8 @@ AC_ARG_ENABLE([bin-lttng-sessiond], AS_HELP_STRING([--disable-bin-lttng-sessiond
+ 	      [Disable the build of lttng-sessiond binaries]))
+ AC_ARG_ENABLE([extras], AS_HELP_STRING([--disable-extras],
+ 	      [Disable the build of the extra components]))
++AC_ARG_ENABLE([tests], AS_HELP_STRING([--disable-tests],
++	      [Disable the build of the test components]))
+ 
+ 
+ # Always build libconfig since it a dependency of libcommon
+@@ -1027,6 +1029,7 @@ AM_CONDITIONAL([BUILD_BIN_LTTNG_SESSIOND], [test x$enable_bin_lttng_sessiond !=
+ 
+ # Export the tests and extras build conditions.
+ AS_IF([\
++test "x$enable_tests" != "xno" && \
+ test "x$enable_bin_lttng" != "xno" && \
+ test "x$enable_bin_lttng_consumerd" != "xno" && \
+ test "x$enable_bin_lttng_crash" != "xno" && \
+-- 
+2.30.2
+
diff --git a/package/lttng-tools/lttng-tools.mk b/package/lttng-tools/lttng-tools.mk
index 8789ded333..fdc5c33bd2 100644
--- a/package/lttng-tools/lttng-tools.mk
+++ b/package/lttng-tools/lttng-tools.mk
@@ -11,8 +11,11 @@ LTTNG_TOOLS_INSTALL_STAGING = YES
 LTTNG_TOOLS_LICENSE = GPL-2.0, LGPL-2.1 (include/lttng/*, src/lib/lttng-ctl/*)
 LTTNG_TOOLS_LICENSE_FILES = LICENSE $(addprefix LICENSES/,BSD-2-Clause BSD-3-Clause GPL-2.0 LGPL-2.1 MIT)
 LTTNG_TOOLS_DEPENDENCIES = liburcu libxml2 popt util-linux
+# We're patching configure.ac
+LTTNG_TOOLS_AUTORECONF = YES
 LTTNG_TOOLS_CONF_OPTS = \
 	--disable-man-pages \
+	--disable-tests \
 	--with-lttng-system-rundir=/run/lttng
 
 ifeq ($(BR2_PACKAGE_LTTNG_LIBUST),y)
