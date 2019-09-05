From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu,  5 Sep 2019 19:10:20 +0200
Subject: [Buildroot] [PATCH 1/1] package/lttng-babeltrace: bump to version
 1.5.7
Message-ID: <20190905171020.3705-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Remove second patch (already in version)
- Add hash for license files

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...x_lib_elfutils.m4-add-cache-variable.patch | 77 -------------------
 .../lttng-babeltrace/lttng-babeltrace.hash    | 10 ++-
 package/lttng-babeltrace/lttng-babeltrace.mk  |  4 +-
 3 files changed, 9 insertions(+), 82 deletions(-)
 delete mode 100644 package/lttng-babeltrace/0002-m4-ax_lib_elfutils.m4-add-cache-variable.patch

diff --git a/package/lttng-babeltrace/0002-m4-ax_lib_elfutils.m4-add-cache-variable.patch b/package/lttng-babeltrace/0002-m4-ax_lib_elfutils.m4-add-cache-variable.patch
deleted file mode 100644
index b16781419a..0000000000
--- a/package/lttng-babeltrace/0002-m4-ax_lib_elfutils.m4-add-cache-variable.patch
+++ /dev/null
@@ -1,77 +0,0 @@
-From 697ab0905c59561562dc52cd3b925781e07814f3 Mon Sep 17 00:00:00 2001
-From: Philippe Proulx <eeppeliteloop@gmail.com>
-Date: Wed, 2 Nov 2016 01:40:12 -0400
-Subject: [PATCH] m4/ax_lib_elfutils.m4: add cache variable
-
-This patch adds an autoconf cache variable to override the
-AC_RUN_IFELSE() test result when cross-compiling.
-
-Signed-off-by: Philippe Proulx <eeppeliteloop@gmail.com>
-[Philippe: grabbed from this pull request:
-    https://github.com/efficios/babeltrace/pull/52
-]
----
- m4/ax_lib_elfutils.m4 | 32 +++++++++++++++++---------------
- 1 file changed, 17 insertions(+), 15 deletions(-)
-
-diff --git a/m4/ax_lib_elfutils.m4 b/m4/ax_lib_elfutils.m4
-index fcfe06b..f4fcb0d 100644
---- a/m4/ax_lib_elfutils.m4
-+++ b/m4/ax_lib_elfutils.m4
-@@ -21,7 +21,9 @@
- # WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
- #
- # Check the currently installed version of elfutils by using the
--# _ELFUTILS_PREREQ macro defined in elfutils/version.h.
-+# `_ELFUTILS_PREREQ` macro defined in <elfutils/version.h>.
-+#
-+# The cache variable for this test is `bt_cv_lib_elfutils`.
- #
- # AX_LIB_ELFUTILS(MAJOR_VERSION, MINOR_VERSION, [ACTION-IF-TRUE], [ACTION-IF-FALSE])
- # ---------------------------------------------------------------------------
-@@ -29,7 +31,6 @@ AC_DEFUN([AX_LIB_ELFUTILS], [
- 	m4_pushdef([major_version], [$1])
- 	m4_pushdef([minor_version], [$2])
- 
--	AC_MSG_CHECKING([for elfutils version >= major_version.minor_version])
- 	m4_if([$#], 3, [
- 		m4_pushdef([true_action], [$3])
- 	], [
-@@ -43,20 +44,21 @@ AC_DEFUN([AX_LIB_ELFUTILS], [
- 			AC_MSG_ERROR(elfutils >= major_version.minor_version is required)])
- 	])
- 
--	AC_RUN_IFELSE([
--		AC_LANG_SOURCE([
--			#include <stdlib.h>
--			#include <elfutils/version.h>
-+	AC_CACHE_CHECK(
-+		[for elfutils version >= major_version.minor_version],
-+		[bt_cv_lib_elfutils], [
-+			AC_RUN_IFELSE([AC_LANG_SOURCE([
-+				#include <stdlib.h>
-+				#include <elfutils/version.h>
-+
-+				int main(void) {
-+					return _ELFUTILS_PREREQ(major_version, minor_version) ? EXIT_SUCCESS : EXIT_FAILURE;
-+				}
-+			])], [bt_cv_lib_elfutils=yes], [bt_cv_lib_elfutils=no])
-+		]
-+	)
- 
--			int main(void) {
--				return _ELFUTILS_PREREQ(major_version, minor_version) ? EXIT_SUCCESS : EXIT_FAILURE;
--			}
--		])
--	],
--		echo yes
--		true_action,
--		echo no
--		false_action)
-+	AS_IF([test "x$bt_cv_lib_elfutils" = "xyes"], [true_action], [false_action])
- 
- 	m4_popdef([false_action])
- 	m4_popdef([true_action])
--- 
-2.9.3
-
diff --git a/package/lttng-babeltrace/lttng-babeltrace.hash b/package/lttng-babeltrace/lttng-babeltrace.hash
index fafcd5e5d7..7c114ac7ec 100644
--- a/package/lttng-babeltrace/lttng-babeltrace.hash
+++ b/package/lttng-babeltrace/lttng-babeltrace.hash
@@ -1,3 +1,7 @@
-# From http://www.efficios.com/files/babeltrace/babeltrace-1.5.2.tar.bz2.{md5,sha1}
-md5 1176e7f69e128112d5f29fefec39c6ce  babeltrace-1.5.2.tar.bz2
-sha1 3316e8311ebbc9e8642ed399208c1846a6f0e0c3  babeltrace-1.5.2.tar.bz2
+# From http://www.efficios.com/files/babeltrace/babeltrace-1.5.7.tar.bz2.sha256
+sha256 215331e025ffd39c665a34231b9429180e48aca78f79fb972d0bf1322d2b807b  babeltrace-1.5.7.tar.bz2
+
+# Hash for license files
+sha256 2f801b7c2494850c3d91da820eb230502dc0192c9d0db024db37ec08d0be1434  mit-license.txt
+sha256 ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  gpl-2.0.txt
+sha256 12d4222ac628fe4092cba8ed90bc5227a4dedd0b94973273cecbc393325bf1c2  LICENSE
diff --git a/package/lttng-babeltrace/lttng-babeltrace.mk b/package/lttng-babeltrace/lttng-babeltrace.mk
index cfd67de6c6..363d7f5b17 100644
--- a/package/lttng-babeltrace/lttng-babeltrace.mk
+++ b/package/lttng-babeltrace/lttng-babeltrace.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LTTNG_BABELTRACE_SITE = http://www.efficios.com/files/babeltrace
-LTTNG_BABELTRACE_VERSION = 1.5.2
+LTTNG_BABELTRACE_VERSION = 1.5.7
 LTTNG_BABELTRACE_SOURCE = babeltrace-$(LTTNG_BABELTRACE_VERSION).tar.bz2
 LTTNG_BABELTRACE_LICENSE = MIT, LGPL-2.1 (include/babeltrace/list.h), GPL-2.0 (test code)
 LTTNG_BABELTRACE_LICENSE_FILES = mit-license.txt gpl-2.0.txt LICENSE
@@ -17,7 +17,7 @@ HOST_LTTNG_BABELTRACE_DEPENDENCIES = \
 	host-popt host-util-linux host-libglib2 host-pkgconf host-elfutils
 HOST_LTTNG_BABELTRACE_CONF_OPTS += --enable-debug-info
 
-# For: 0002-m4-ax_lib_elfutils.m4-add-cache-variable.patch
+# We're patching tests/lib/Makefile.am
 LTTNG_BABELTRACE_AUTORECONF = YES
 
 ifeq ($(BR2_PACKAGE_ELFUTILS),y)
-- 
2.23.0.rc1
