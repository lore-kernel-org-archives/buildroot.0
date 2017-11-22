From: Philippe Proulx <eeppeliteloop@gmail.com>
Date: Wed, 22 Nov 2017 17:55:31 -0500
Subject: [Buildroot] [PATCH 3/3] lttng-tools: bump to version 2.10.1
In-Reply-To: <20171122225531.26429-1-eeppeliteloop@gmail.com>
References: <20171122225531.26429-1-eeppeliteloop@gmail.com>
Message-ID: <20171122225531.26429-3-eeppeliteloop@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adding 0001-Fix-detect-dlmopen-and-disable-corresponding-tests-i.patch
to detect if dlmopen() exists and disable parts of the build accordingly
if not. This fixes a bug when building with musl or uClibc-ng.

Adding 0002-Fix-src-common-pipe.h-include-sys-types.h-for-ssize_.patch
to fix an #include bug when building with musl.

Adding 0003-Fix-warning-src-bin-lttng-utils.c-cast-incompatible-.patch
to remove compilation warnings.

All three new patches are in upstream's master branch as of this date
and will be part of an eventual release.

Signed-off-by: Philippe Proulx <eeppeliteloop@gmail.com>
---
 ...dlmopen-and-disable-corresponding-tests-i.patch | 249 +++++++++++++++++++++
 ...mon-pipe.h-include-sys-types.h-for-ssize_.patch |  31 +++
 ...-src-bin-lttng-utils.c-cast-incompatible-.patch |  32 +++
 package/lttng-tools/lttng-tools.hash               |   6 +-
 package/lttng-tools/lttng-tools.mk                 |   5 +-
 5 files changed, 318 insertions(+), 5 deletions(-)
 create mode 100644 package/lttng-tools/0001-Fix-detect-dlmopen-and-disable-corresponding-tests-i.patch
 create mode 100644 package/lttng-tools/0002-Fix-src-common-pipe.h-include-sys-types.h-for-ssize_.patch
 create mode 100644 package/lttng-tools/0003-Fix-warning-src-bin-lttng-utils.c-cast-incompatible-.patch

diff --git a/package/lttng-tools/0001-Fix-detect-dlmopen-and-disable-corresponding-tests-i.patch b/package/lttng-tools/0001-Fix-detect-dlmopen-and-disable-corresponding-tests-i.patch
new file mode 100644
index 0000000000..8e14a14413
--- /dev/null
+++ b/package/lttng-tools/0001-Fix-detect-dlmopen-and-disable-corresponding-tests-i.patch
@@ -0,0 +1,249 @@
+From bc1d8ca01415710d40224de312c7ecf6f4223301 Mon Sep 17 00:00:00 2001
+From: Philippe Proulx <eeppeliteloop@gmail.com>
+Date: Mon, 6 Nov 2017 18:46:41 -0500
+Subject: [PATCH] Fix: detect dlmopen() and disable corresponding tests if not
+ available
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+musl and uClibc-ng are known not to support dlmopen(). LTTng-UST has
+this dlmopen() detection.
+
+Signed-off-by: Philippe Proulx <eeppeliteloop@gmail.com>
+[Philippe: backport from upstream commit bc1d8ca0
+           edited to remove .gitignore part]
+Signed-off-by: J?r?mie Galarneau <jeremie.galarneau@efficios.com>
+---
+ .gitignore                                 |  1 +
+ configure.ac                               | 25 ++++++++++++++++++++++
+ tests/regression/ust/ust-dl/prog.c         | 17 +++++++++++++--
+ tests/regression/ust/ust-dl/test_ust-dl    | 32 ----------------------------
+ tests/regression/ust/ust-dl/test_ust-dl.in | 34 ++++++++++++++++++++++++++++++
+ tests/regression/ust/ust-dl/test_ust-dl.py |  9 +++++++-
+ tests/utils/test_utils.py                  |  3 +++
+ 7 files changed, 86 insertions(+), 35 deletions(-)
+ delete mode 100755 tests/regression/ust/ust-dl/test_ust-dl
+ create mode 100644 tests/regression/ust/ust-dl/test_ust-dl.in
+
+diff --git a/configure.ac b/configure.ac
+index 016c56ec..b6ea39c5 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -196,6 +196,30 @@ AC_CHECK_FUNCS([ \
+ # add -lrt to LIBS
+ AC_CHECK_LIB([rt], [clock_gettime, timer_create, timer_settime, timer_delete])
+
++# Checks for dl.
++AC_CHECK_LIB([dl], [dlopen], [
++	have_libdl=yes
++	libdl_name=dl
++], [
++	# libdl not found, check for dlopen in libc.
++	AC_CHECK_LIB([c], [dlopen], [
++		have_libc_dl=yes
++		libdl_name=c
++	], [
++		AC_MSG_ERROR([Cannot find dlopen in libdl nor libc. Use [LDFLAGS]=-Ldir to specify their location.])
++	])
++])
++
++# Check if libdl has dlmopen support.
++AH_TEMPLATE([HAVE_DLMOPEN], ["Define to 1 if dlmopen is available."])
++AC_CHECK_LIB([$libdl_name], [dlmopen], [
++	AC_DEFINE([HAVE_DLMOPEN], [1])
++	HAVE_DLMOPEN=1
++], [
++	HAVE_DLMOPEN=0
++])
++AC_SUBST(HAVE_DLMOPEN)
++
+ # Babeltrace viewer check
+ AC_ARG_WITH([babeltrace-bin],
+ 	AS_HELP_STRING([--with-babeltrace-bin],
+@@ -1100,6 +1124,7 @@ AC_CONFIG_FILES([
+ AC_CONFIG_FILES([tests/regression/ust/python-logging/test_python_logging],[chmod +x tests/regression/ust/python-logging/test_python_logging])
+ # Inject LTTNG_TOOLS_BUILD_WITH_LIBPFM variable in test script.
+ AC_CONFIG_FILES([tests/perf/test_perf_raw],[chmod +x tests/perf/test_perf_raw])
++AC_CONFIG_FILES([tests/regression/ust/ust-dl/test_ust-dl],[chmod +x tests/regression/ust/ust-dl/test_ust-dl])
+
+ AC_OUTPUT
+
+diff --git a/tests/regression/ust/ust-dl/prog.c b/tests/regression/ust/ust-dl/prog.c
+index e8e4b264..669792d9 100644
+--- a/tests/regression/ust/ust-dl/prog.c
++++ b/tests/regression/ust/ust-dl/prog.c
+@@ -13,7 +13,12 @@
+  */
+ int main(int argc, char **argv)
+ {
+-	void *h0, *h1, *h2, *h3, *h4;
++	void *h0, *h2, *h3, *h4;
++
++#ifdef HAVE_DLMOPEN
++	void *h1;
++#endif
++
+ 	char *error;
+ 	int (*foo)(void);
+
+@@ -21,10 +26,14 @@ int main(int argc, char **argv)
+ 	if (!h0) {
+ 		goto get_error;
+ 	}
++
++#ifdef HAVE_DLMOPEN
+ 	h1 = dlmopen(LM_ID_BASE, "libfoo.so", RTLD_LAZY);
+ 	if (!h1) {
+ 		goto get_error;
+ 	}
++#endif
++
+ 	h2 = dlopen("libzzz.so", RTLD_LAZY);
+ 	if (!h2) {
+ 		goto get_error;
+@@ -38,7 +47,7 @@ int main(int argc, char **argv)
+ 		goto get_error;
+ 	}
+
+-	foo = dlsym(h1, "foo");
++	foo = dlsym(h3, "foo");
+ 	error = dlerror();
+ 	if (error != NULL) {
+ 		goto error;
+@@ -49,9 +58,13 @@ int main(int argc, char **argv)
+ 	if (dlclose(h0)) {
+ 		goto get_error;
+ 	}
++
++#ifdef HAVE_DLMOPEN
+ 	if (dlclose(h1)) {
+ 		goto get_error;
+ 	}
++#endif
++
+ 	if (dlclose(h2)) {
+ 		goto get_error;
+ 	}
+diff --git a/tests/regression/ust/ust-dl/test_ust-dl b/tests/regression/ust/ust-dl/test_ust-dl
+deleted file mode 100755
+index 1f2934db..00000000
+--- a/tests/regression/ust/ust-dl/test_ust-dl
++++ /dev/null
+@@ -1,32 +0,0 @@
+-#!/bin/bash
+-#
+-# Copyright (C) - 2013 J?r?mie Galarneau <jeremie.galarneau@efficios.com>
+-#
+-# This program is free software; you can redistribute it and/or modify it
+-# under the terms of the GNU General Public License, version 2 only, as
+-# published by the Free Software Foundation.
+-#
+-# This program is distributed in the hope that it will be useful, but WITHOUT
+-# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+-# FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+-# more details.
+-#
+-# You should have received a copy of the GNU General Public License along with
+-# this program; if not, write to the Free Software Foundation, Inc., 51
+-# Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
+-
+-CURDIR=$(dirname $0)
+-TESTDIR=${CURDIR}/../../..
+-
+-source $TESTDIR/utils/utils.sh
+-
+-if [ ! -x "$CURDIR/.libs/libfoo.so" ]; then
+-	diag "No shared object generated. Skipping all tests."
+-	exit 0
+-fi
+-
+-start_lttng_sessiond_notap
+-
+-python3 ${CURDIR}/test_ust-dl.py
+-
+-stop_lttng_sessiond_notap
+diff --git a/tests/regression/ust/ust-dl/test_ust-dl.in b/tests/regression/ust/ust-dl/test_ust-dl.in
+new file mode 100644
+index 00000000..61d00d21
+--- /dev/null
++++ b/tests/regression/ust/ust-dl/test_ust-dl.in
+@@ -0,0 +1,34 @@
++#!/bin/bash
++#
++# Copyright (C) - 2013 J?r?mie Galarneau <jeremie.galarneau@efficios.com>
++#
++# This program is free software; you can redistribute it and/or modify it
++# under the terms of the GNU General Public License, version 2 only, as
++# published by the Free Software Foundation.
++#
++# This program is distributed in the hope that it will be useful, but WITHOUT
++# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
++# FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
++# more details.
++#
++# You should have received a copy of the GNU General Public License along with
++# this program; if not, write to the Free Software Foundation, Inc., 51
++# Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
++
++CURDIR=$(dirname $0)
++TESTDIR=${CURDIR}/../../..
++
++source $TESTDIR/utils/utils.sh
++
++if [ ! -x "$CURDIR/.libs/libfoo.so" ]; then
++	diag "No shared object generated. Skipping all tests."
++	exit 0
++fi
++
++export LTTNG_TOOLS_HAVE_DLMOPEN=@HAVE_DLMOPEN@
++
++start_lttng_sessiond_notap
++
++python3 ${CURDIR}/test_ust-dl.py
++
++stop_lttng_sessiond_notap
+diff --git a/tests/regression/ust/ust-dl/test_ust-dl.py b/tests/regression/ust/ust-dl/test_ust-dl.py
+index 81972a7d..72459840 100644
+--- a/tests/regression/ust/ust-dl/test_ust-dl.py
++++ b/tests/regression/ust/ust-dl/test_ust-dl.py
+@@ -31,6 +31,9 @@ sys.path.append(test_utils_path)
+ from test_utils import *
+
+
++have_dlmopen = (os.environ.get('LTTNG_TOOLS_HAVE_DLMOPEN') == '1')
++
++
+ NR_TESTS = 14
+ current_test = 1
+ print("1..{0}".format(NR_TESTS))
+@@ -113,7 +116,11 @@ current_test += 1
+ print_test_result(dlopen_event_found > 0, current_test, "lttng_ust_dl:dlopen event found in resulting trace")
+ current_test += 1
+
+-print_test_result(dlmopen_event_found > 0, current_test, "lttng_ust_dl:dlmopen event found in resulting trace")
++if have_dlmopen:
++    print_test_result(dlmopen_event_found > 0, current_test, "lttng_ust_dl:dlmopen event found in resulting trace")
++else:
++    skip_test(current_test, 'dlmopen() is not available')
++
+ current_test += 1
+
+ print_test_result(build_id_event_found > 0, current_test, "lttng_ust_dl:build_id event found in resulting trace")
+diff --git a/tests/utils/test_utils.py b/tests/utils/test_utils.py
+index 4b38630c..02e632a2 100644
+--- a/tests/utils/test_utils.py
++++ b/tests/utils/test_utils.py
+@@ -62,6 +62,9 @@ def print_test_result(result, number, description):
+     result_string += " {0} - {1}".format(number, description)
+     print(result_string)
+
++def skip_test(number, description):
++    print('ok {} # skip {}'.format(number, description))
++
+ def enable_ust_tracepoint_event(session_info, event_name):
+     event = Event()
+     event.name = event_name
+--
+2.15.0
+
diff --git a/package/lttng-tools/0002-Fix-src-common-pipe.h-include-sys-types.h-for-ssize_.patch b/package/lttng-tools/0002-Fix-src-common-pipe.h-include-sys-types.h-for-ssize_.patch
new file mode 100644
index 0000000000..914947684d
--- /dev/null
+++ b/package/lttng-tools/0002-Fix-src-common-pipe.h-include-sys-types.h-for-ssize_.patch
@@ -0,0 +1,31 @@
+From 40dde31f7eeb71af169b97b82d8fd1739895dfc3 Mon Sep 17 00:00:00 2001
+From: Philippe Proulx <eeppeliteloop@gmail.com>
+Date: Wed, 8 Nov 2017 15:19:24 -0500
+Subject: [PATCH] Fix: src/common/pipe.h: include <sys/types.h> for ssize_t and
+ mode_t
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Signed-off-by: Philippe Proulx <eeppeliteloop@gmail.com>
+[Philippe: backport from upstream commit 40dde31f]
+Signed-off-by: J?r?mie Galarneau <jeremie.galarneau@efficios.com>
+---
+ src/common/pipe.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/common/pipe.h b/src/common/pipe.h
+index 2d4fc967..30f7c3f3 100644
+--- a/src/common/pipe.h
++++ b/src/common/pipe.h
+@@ -20,6 +20,7 @@
+
+ #include <pthread.h>
+ #include <common/macros.h>
++#include <sys/types.h>
+
+ enum lttng_pipe_state {
+ 	LTTNG_PIPE_STATE_OPENED = 1,
+--
+2.15.0
+
diff --git a/package/lttng-tools/0003-Fix-warning-src-bin-lttng-utils.c-cast-incompatible-.patch b/package/lttng-tools/0003-Fix-warning-src-bin-lttng-utils.c-cast-incompatible-.patch
new file mode 100644
index 0000000000..b353b8f48a
--- /dev/null
+++ b/package/lttng-tools/0003-Fix-warning-src-bin-lttng-utils.c-cast-incompatible-.patch
@@ -0,0 +1,32 @@
+From 56efeab366da412ee4196107c08174f32ed83c9a Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?J=C3=A9r=C3=A9mie=20Galarneau?=
+ <jeremie.galarneau@efficios.com>
+Date: Mon, 13 Nov 2017 10:31:29 -0500
+Subject: [PATCH] Fix warning: src/bin/lttng/utils.c: cast incompatible pointer
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Reported-by: Philippe Proulx <eeppeliteloop@gmail.com>
+[Philippe: backport from upstream commit 56efeab3]
+Signed-off-by: J?r?mie Galarneau <jeremie.galarneau@efficios.com>
+---
+ src/bin/lttng/utils.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/bin/lttng/utils.c b/src/bin/lttng/utils.c
+index 885f498b..52a2440e 100644
+--- a/src/bin/lttng/utils.c
++++ b/src/bin/lttng/utils.c
+@@ -387,7 +387,7 @@ int check_relayd(void)
+ 	 * A successful connect means the relayd exists thus returning 0 else a
+ 	 * negative value means it does NOT exists.
+ 	 */
+-	ret = connect(fd, &sin, sizeof(sin));
++	ret = connect(fd, (struct sockaddr *) &sin, sizeof(sin));
+ 	if (ret < 0) {
+ 		/* Not found. */
+ 		ret = 0;
+--
+2.15.0
+
diff --git a/package/lttng-tools/lttng-tools.hash b/package/lttng-tools/lttng-tools.hash
index 8a4c2ebda4..51742525bc 100644
--- a/package/lttng-tools/lttng-tools.hash
+++ b/package/lttng-tools/lttng-tools.hash
@@ -1,3 +1,3 @@
-# From http://lttng.org/files/lttng-tools/lttng-tools-2.9.5.tar.bz2.{md5,sha1}
-md5 051224eb991aee07f8721ff1877d0b96  lttng-tools-2.9.5.tar.bz2
-sha1 b988b237f34baa3916242dc9141aa61470e99dfd  lttng-tools-2.9.5.tar.bz2
+# From http://lttng.org/files/lttng-tools/lttng-tools-2.10.1.tar.bz2.{md5,sha1}
+md5 fd80fa64dffd8017fb30836eb30532cc  lttng-tools-2.10.1.tar.bz2
+sha1 b29554903160dc1c89b41c85493fd968de0e624f  lttng-tools-2.10.1.tar.bz2
diff --git a/package/lttng-tools/lttng-tools.mk b/package/lttng-tools/lttng-tools.mk
index 776750c63e..68781ba19d 100644
--- a/package/lttng-tools/lttng-tools.mk
+++ b/package/lttng-tools/lttng-tools.mk
@@ -4,13 +4,14 @@
 #
 ################################################################################
 
-LTTNG_TOOLS_VERSION = 2.9.5
+LTTNG_TOOLS_VERSION = 2.10.1
 LTTNG_TOOLS_SITE = http://lttng.org/files/lttng-tools
 LTTNG_TOOLS_SOURCE = lttng-tools-$(LTTNG_TOOLS_VERSION).tar.bz2
 LTTNG_TOOLS_LICENSE = GPL-2.0+, LGPL-2.1+ (include/lttng/*, src/lib/lttng-ctl/*)
 LTTNG_TOOLS_LICENSE_FILES = gpl-2.0.txt lgpl-2.1.txt LICENSE
 LTTNG_TOOLS_CONF_OPTS += --disable-man-pages
-
+# 0001-Fix-detect-dlmopen-and-disable-corresponding-tests-i.patch
+LTTNG_LIBUST_AUTORECONF = YES
 LTTNG_TOOLS_DEPENDENCIES = liburcu libxml2 popt util-linux
 
 ifeq ($(BR2_PACKAGE_LTTNG_LIBUST),y)
-- 
2.15.0
