From: Koen Martens <gmc@sonologic.nl>
Date: Thu, 6 Jul 2017 17:40:01 +0200
Subject: [Buildroot] [PATCH 1/1] capnproto: new package
Message-ID: <201707061544.v66FiZQQ020306@mx1.sonologic.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Cap'n Proto is an insanely fast data interchange format
and capability-based RPC system. Think JSON, except
binary. Or think Protocol Buffers, except faster. In
fact, in benchmarks, Cap?n Proto is INFINITY TIMES
faster than Protocol Buffers.

https://capnproto.org/index.html

Signed-off-by: Koen Martens <gmc@sonologic.nl>
---
 DEVELOPERS                            |  1 +
 package/Config.in                     |  1 +
 package/capnproto/0001-execinfo.patch | 85 +++++++++++++++++++++++++++++++++++
 package/capnproto/Config.in           | 16 +++++++
 package/capnproto/capnproto.mk        | 17 +++++++
 5 files changed, 120 insertions(+)
 create mode 100644 package/capnproto/0001-execinfo.patch
 create mode 100644 package/capnproto/Config.in
 create mode 100644 package/capnproto/capnproto.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index c409f28..6ad12d2 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1023,6 +1023,7 @@ N:	Kevin Joly <kevin.joly@sensefly.com>
 F:	package/libgphoto2/
 
 N:	Koen Martens <gmc@sonologic.nl>
+F:	package/capnproto/
 F:	package/linuxconsoletools/
 
 N:	Laurent Cans <laurent.cans@gmail.com>
diff --git a/package/Config.in b/package/Config.in
index 46c78a0..0619103 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1375,6 +1375,7 @@ menu "Other"
 	source "package/bctoolbox/Config.in"
 	source "package/bdwgc/Config.in"
 	source "package/boost/Config.in"
+	source "package/capnproto/Config.in"
 	source "package/clapack/Config.in"
 	source "package/classpath/Config.in"
 	source "package/cppcms/Config.in"
diff --git a/package/capnproto/0001-execinfo.patch b/package/capnproto/0001-execinfo.patch
new file mode 100644
index 0000000..85ef716
--- /dev/null
+++ b/package/capnproto/0001-execinfo.patch
@@ -0,0 +1,85 @@
+Capnproto assumes that if __GLIBC__ is defined then
+execinfo.h is available. uClibc does not implement
+execinfo.h, but does define __GLIBC__ in features.h
+(documented as an acceptable lie).
+
+We add an explicit check for existence of execinfo.h
+to configure and use HAVE_EXECINFO_H in the code
+that includes execinfo.h
+
+A more permanent patch has been submitted upstream
+as a pull-request.
+
+https://github.com/capnproto/capnproto/pull/511
+
+Signed-off-by: Koen Martens <gmc@sonologic.nl>
+
+diff -Naur a/config.h.in b/config.h.in
+--- a/config.h.in	2017-06-08 20:03:58.000000000 +0200
++++ b/config.h.in	2017-07-06 12:26:45.559406000 +0200
+@@ -3,6 +3,9 @@
+ /* Define to 1 if you have the <dlfcn.h> header file. */
+ #undef HAVE_DLFCN_H
+ 
++/* Define to 1 if you have the <execinfo.h> header file. */
++#undef HAVE_EXECINFO_H
++
+ /* Define to 1 if you have the <inttypes.h> header file. */
+ #undef HAVE_INTTYPES_H
+ 
+diff -Naur a/configure b/configure
+--- a/configure	2017-06-08 20:03:58.000000000 +0200
++++ b/configure	2017-07-06 12:26:45.559406000 +0200
+@@ -9157,6 +9157,20 @@
+ done
+ 
+ 
++for ac_header in execinfo.h
++do :
++  ac_fn_c_check_header_compile "$LINENO" "execinfo.h" "ac_cv_header_execinfo_h" "$ac_includes_default
++"
++if test "x$ac_cv_header_execinfo_h" = xyes; then :
++  cat >>confdefs.h <<_ACEOF
++#define HAVE_EXECINFO_H 1
++_ACEOF
++
++fi
++
++done
++
++
+ 
+ func_stripname_cnf ()
+ {
+diff -Naur a/configure.ac b/configure.ac
+--- a/configure.ac	2017-06-08 20:03:50.000000000 +0200
++++ b/configure.ac	2017-07-06 12:26:45.559406000 +0200
+@@ -52,6 +52,8 @@
+ AC_LANG([C++])
+ AX_CXX_COMPILE_STDCXX_11
+ 
++AC_CHECK_HEADERS(execinfo.h)
++
+ AS_CASE("${host_os}", *mingw*, [
+     # We don't use pthreads on MinGW.
+     PTHREAD_CFLAGS="-mthreads"
+diff -Naur a/src/kj/exception.c++ b/src/kj/exception.c++
+--- a/src/kj/exception.c++	2017-06-04 19:03:27.000000000 +0200
++++ b/src/kj/exception.c++	2017-07-06 12:28:07.472341999 +0200
+@@ -19,6 +19,7 @@
+ // OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
+ // THE SOFTWARE.
+ 
++#include "config.h"
+ #include "exception.h"
+ #include "string.h"
+ #include "debug.h"
+@@ -33,7 +34,7 @@
+ #endif
+ #include "io.h"
+ 
+-#if (__linux__ && __GLIBC__) || __APPLE__
++#if HAVE_EXECINFO_H
+ #define KJ_HAS_BACKTRACE 1
+ #include <execinfo.h>
+ #endif
diff --git a/package/capnproto/Config.in b/package/capnproto/Config.in
new file mode 100644
index 0000000..d25ccf7
--- /dev/null
+++ b/package/capnproto/Config.in
@@ -0,0 +1,16 @@
+config BR2_PACKAGE_CAPNPROTO
+	bool "capnproto"
+	depends on BR2_HOST_GCC_AT_LEAST_4_8 # C++11
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
+	help
+	  Cap'n Proto is an insanely fast data interchange format
+	  and capability-based RPC system. Think JSON, except
+	  binary. Or think Protocol Buffers, except faster. In
+	  fact, in benchmarks, Cap?n Proto is INFINITY TIMES
+	  faster than Protocol Buffers.
+
+	  https://capnproto.org/index.html
+
+comment "capnproto needs host and target gcc >= 4.8"
+	depends on !BR2_HOST_GCC_AT_LEAST_4_8 || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+
diff --git a/package/capnproto/capnproto.mk b/package/capnproto/capnproto.mk
new file mode 100644
index 0000000..510a3b2
--- /dev/null
+++ b/package/capnproto/capnproto.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# capnproto
+#
+################################################################################
+
+CAPNPROTO_VERSION = 0.6.1
+CAPNPROTO_SOURCE = capnproto-c++-$(CAPNPROTO_VERSION).tar.gz
+CAPNPROTO_SITE = https://capnproto.org
+CAPNPROTO_LICENSE = MIT
+CAPNPROTO_LICENSE_FILES = LICENSE.txt
+CAPNPROTO_INSTALL_STAGING = YES
+CAPNPROTO_CONF_OPTS = --with-external-capnp
+CAPNPROTO_DEPENDENCIES = host-capnproto
+
+$(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
2.7.4
