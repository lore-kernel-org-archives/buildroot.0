From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 2 Nov 2016 23:08:00 +0100
Subject: [Buildroot] [git commit] lttng-babeltrace: add debug info support
Message-ID: <20161102220812.E83538192A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=625af098cd358e5dc3528b5bf39def755c6b65a6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since Babeltrace 1.4, there is support for printing debug information
along with compatible traces and event records. Babeltrace needs
elfutils in this case.

Signed-off-by: Philippe Proulx <eeppeliteloop@gmail.com>
[Thomas:
 - add better description for
   0002-m4-ax_lib_elfutils.m4-add-cache-variable.patch
 - use automatic dependency on elfutils rather than a very complicated
   Config.in symbol]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...-m4-ax_lib_elfutils.m4-add-cache-variable.patch | 77 ++++++++++++++++++++++
 package/lttng-babeltrace/Config.in                 |  3 +
 package/lttng-babeltrace/lttng-babeltrace.mk       | 12 +++-
 3 files changed, 91 insertions(+), 1 deletion(-)

diff --git a/package/lttng-babeltrace/0002-m4-ax_lib_elfutils.m4-add-cache-variable.patch b/package/lttng-babeltrace/0002-m4-ax_lib_elfutils.m4-add-cache-variable.patch
new file mode 100644
index 0000000..b167814
--- /dev/null
+++ b/package/lttng-babeltrace/0002-m4-ax_lib_elfutils.m4-add-cache-variable.patch
@@ -0,0 +1,77 @@
+From 697ab0905c59561562dc52cd3b925781e07814f3 Mon Sep 17 00:00:00 2001
+From: Philippe Proulx <eeppeliteloop@gmail.com>
+Date: Wed, 2 Nov 2016 01:40:12 -0400
+Subject: [PATCH] m4/ax_lib_elfutils.m4: add cache variable
+
+This patch adds an autoconf cache variable to override the
+AC_RUN_IFELSE() test result when cross-compiling.
+
+Signed-off-by: Philippe Proulx <eeppeliteloop@gmail.com>
+[Philippe: grabbed from this pull request:
+    https://github.com/efficios/babeltrace/pull/52
+]
+---
+ m4/ax_lib_elfutils.m4 | 32 +++++++++++++++++---------------
+ 1 file changed, 17 insertions(+), 15 deletions(-)
+
+diff --git a/m4/ax_lib_elfutils.m4 b/m4/ax_lib_elfutils.m4
+index fcfe06b..f4fcb0d 100644
+--- a/m4/ax_lib_elfutils.m4
++++ b/m4/ax_lib_elfutils.m4
+@@ -21,7 +21,9 @@
+ # WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
+ #
+ # Check the currently installed version of elfutils by using the
+-# _ELFUTILS_PREREQ macro defined in elfutils/version.h.
++# `_ELFUTILS_PREREQ` macro defined in <elfutils/version.h>.
++#
++# The cache variable for this test is `bt_cv_lib_elfutils`.
+ #
+ # AX_LIB_ELFUTILS(MAJOR_VERSION, MINOR_VERSION, [ACTION-IF-TRUE], [ACTION-IF-FALSE])
+ # ---------------------------------------------------------------------------
+@@ -29,7 +31,6 @@ AC_DEFUN([AX_LIB_ELFUTILS], [
+ 	m4_pushdef([major_version], [$1])
+ 	m4_pushdef([minor_version], [$2])
+ 
+-	AC_MSG_CHECKING([for elfutils version >= major_version.minor_version])
+ 	m4_if([$#], 3, [
+ 		m4_pushdef([true_action], [$3])
+ 	], [
+@@ -43,20 +44,21 @@ AC_DEFUN([AX_LIB_ELFUTILS], [
+ 			AC_MSG_ERROR(elfutils >= major_version.minor_version is required)])
+ 	])
+ 
+-	AC_RUN_IFELSE([
+-		AC_LANG_SOURCE([
+-			#include <stdlib.h>
+-			#include <elfutils/version.h>
++	AC_CACHE_CHECK(
++		[for elfutils version >= major_version.minor_version],
++		[bt_cv_lib_elfutils], [
++			AC_RUN_IFELSE([AC_LANG_SOURCE([
++				#include <stdlib.h>
++				#include <elfutils/version.h>
++
++				int main(void) {
++					return _ELFUTILS_PREREQ(major_version, minor_version) ? EXIT_SUCCESS : EXIT_FAILURE;
++				}
++			])], [bt_cv_lib_elfutils=yes], [bt_cv_lib_elfutils=no])
++		]
++	)
+ 
+-			int main(void) {
+-				return _ELFUTILS_PREREQ(major_version, minor_version) ? EXIT_SUCCESS : EXIT_FAILURE;
+-			}
+-		])
+-	],
+-		echo yes
+-		true_action,
+-		echo no
+-		false_action)
++	AS_IF([test "x$bt_cv_lib_elfutils" = "xyes"], [true_action], [false_action])
+ 
+ 	m4_popdef([false_action])
+ 	m4_popdef([true_action])
+-- 
+2.9.3
+
diff --git a/package/lttng-babeltrace/Config.in b/package/lttng-babeltrace/Config.in
index 95b635d..9634a4d 100644
--- a/package/lttng-babeltrace/Config.in
+++ b/package/lttng-babeltrace/Config.in
@@ -18,6 +18,9 @@ config BR2_PACKAGE_LTTNG_BABELTRACE
 	  can decode and display LTTng traces, since the latter are
 	  written using the CTF format.
 
+	  To get support for debugging information, enable the
+	  elfutils package.
+
 	  Having this tool on the target is not mandatory. You can
 	  transfer the binary trace output from the target to your
 	  development workstation, and use babeltrace here.
diff --git a/package/lttng-babeltrace/lttng-babeltrace.mk b/package/lttng-babeltrace/lttng-babeltrace.mk
index deb2d07..59327db 100644
--- a/package/lttng-babeltrace/lttng-babeltrace.mk
+++ b/package/lttng-babeltrace/lttng-babeltrace.mk
@@ -10,10 +10,20 @@ LTTNG_BABELTRACE_SOURCE = babeltrace-$(LTTNG_BABELTRACE_VERSION).tar.bz2
 LTTNG_BABELTRACE_LICENSE = MIT, LGPLv2.1 (include/babeltrace/list.h), GPLv2 (test code)
 LTTNG_BABELTRACE_LICENSE_FILES = mit-license.txt gpl-2.0.txt LICENSE
 LTTNG_BABELTRACE_DEPENDENCIES = popt util-linux libglib2 host-pkgconf
-LTTNG_BABELTRACE_CONF_OPTS += --disable-debug-info
 HOST_LTTNG_BABELTRACE_DEPENDENCIES = \
 	host-popt host-util-linux host-libglib2 host-pkgconf
 HOST_LTTNG_BABELTRACE_CONF_OPTS += --disable-debug-info
 
+# For 0002-m4-ax_lib_elfutils.m4-add-cache-variable.patch
+LTTNG_BABELTRACE_AUTORECONF = YES
+
+ifeq ($(BR2_PACKAGE_ELFUTILS),y)
+LTTNG_BABELTRACE_DEPENDENCIES += elfutils
+LTTNG_BABELTRACE_CONF_OPTS += --enable-debug-info
+LTTNG_BABELTRACE_CONF_ENV += bt_cv_lib_elfutils=yes
+else
+LTTNG_BABELTRACE_CONF_OPTS += --disable-debug-info
+endif
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
