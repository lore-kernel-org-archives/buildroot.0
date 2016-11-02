From: Philippe Proulx <eeppeliteloop@gmail.com>
Date: Wed,  2 Nov 2016 02:55:08 -0400
Subject: [Buildroot] [PATCH v4 4/4] lttng-babeltrace: add debug info support
In-Reply-To: <20161102065508.3162-1-eeppeliteloop@gmail.com>
References: <20161102065508.3162-1-eeppeliteloop@gmail.com>
Message-ID: <20161102065508.3162-5-eeppeliteloop@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since Babeltrace 1.4, there is support for printing debug information
along with compatible traces and event records. Babeltrace needs
elfutils in this case. If elfutils can be built with the current
configuration, the lttng-babeltrace package selects it and builds
with support for debug information. Otherwise the menuconfig shows
a comment which explains why debug information support cannot be
built.

Signed-off-by: Philippe Proulx <eeppeliteloop@gmail.com>
---
Changes v3 -> v4:
  - Remove duplicate --disable-debug-info.
  - Replace patch to remove line in configure.ac with patch submitted
    upstream to add a cache variable to the elfutils check.
  - Use said cache variable in LTTNG_BABELTRACE_CONF_ENV.

 ...-m4-ax_lib_elfutils.m4-add-cache-variable.patch | 74 ++++++++++++++++++++++
 package/lttng-babeltrace/Config.in                 | 17 +++++
 package/lttng-babeltrace/lttng-babeltrace.mk       | 12 +++-
 3 files changed, 102 insertions(+), 1 deletion(-)
 create mode 100644 package/lttng-babeltrace/0002-m4-ax_lib_elfutils.m4-add-cache-variable.patch

diff --git a/package/lttng-babeltrace/0002-m4-ax_lib_elfutils.m4-add-cache-variable.patch b/package/lttng-babeltrace/0002-m4-ax_lib_elfutils.m4-add-cache-variable.patch
new file mode 100644
index 0000000..b592d7f
--- /dev/null
+++ b/package/lttng-babeltrace/0002-m4-ax_lib_elfutils.m4-add-cache-variable.patch
@@ -0,0 +1,74 @@
+From 697ab0905c59561562dc52cd3b925781e07814f3 Mon Sep 17 00:00:00 2001
+From: Philippe Proulx <eeppeliteloop@gmail.com>
+Date: Wed, 2 Nov 2016 01:40:12 -0400
+Subject: [PATCH 1/3] m4/ax_lib_elfutils.m4: add cache variable
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
index 95b635d..55e2143 100644
--- a/package/lttng-babeltrace/Config.in
+++ b/package/lttng-babeltrace/Config.in
@@ -27,6 +27,23 @@ config BR2_PACKAGE_LTTNG_BABELTRACE
 
 	  http://diamon.org/babeltrace
 
+if BR2_PACKAGE_LTTNG_BABELTRACE
+
+config BR2_PACKAGE_LTTNG_BABELTRACE_DEBUG_INFO
+	bool
+	default y
+	depends on !BR2_bfin # elfutils
+	depends on !BR2_STATIC_LIBS # elfutils
+	depends on BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC # elfutils
+	select BR2_PACKAGE_ELFUTILS
+
+comment "handling debug info in traces needs a glibc or uClibc toolchain w/ dynamic library"
+	depends on !BR2_bfin # elfutils
+	depends on BR2_STATIC_LIBS \
+		|| !(BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC)
+
+endif
+
 comment "lttng-babeltrace needs a toolchain w/ wchar, threads"
 	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/lttng-babeltrace/lttng-babeltrace.mk b/package/lttng-babeltrace/lttng-babeltrace.mk
index deb2d07..2139435 100644
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
+ifeq ($(BR2_PACKAGE_LTTNG_BABELTRACE_DEBUG_INFO),y)
+LTTNG_BABELTRACE_DEPENDENCIES += elfutils
+LTTNG_BABELTRACE_CONF_OPTS += --enable-debug-info
+LTTNG_BABELTRACE_CONF_ENV += bt_cv_lib_elfutils=yes
+else
+LTTNG_BABELTRACE_CONF_OPTS += --disable-debug-info
+endif
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
2.9.3
