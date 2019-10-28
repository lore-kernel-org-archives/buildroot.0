From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Mon, 28 Oct 2019 23:45:47 +0100
Subject: [Buildroot] [git commit] package/glog: switch to cmake
Message-ID: <20191028224426.B84348B90D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3c4ff9cea9af08acfe3a246cdc7cdf6c05c9664e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Switch to cmake to fix a build failure on m68k with uclibc because
glog's configure tests wrongly thinks that -fPIE works

By switching to cmake, we can remove the patch as the unittests won't be
built anymore

We can also finely tune options such as gflags, threads and dynamic
library support. This last option is handled through the standard
BUILD_SHARED_LIBS option

Fixes:
 - http://autobuild.buildroot.net/results/5a659d960c24256a2905f129dfa70e3dc9e92aec

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...rc-symbolize.cc-fix-build-without-dlfcn.h.patch | 37 ++++++++++++++++++++
 ...nitests-some-tests-require-HAVE_STACKTRAC.patch | 39 ----------------------
 package/glog/Config.in                             |  7 ++--
 package/glog/glog.mk                               | 21 ++++--------
 4 files changed, 45 insertions(+), 59 deletions(-)

diff --git a/package/glog/0001-src-symbolize.cc-fix-build-without-dlfcn.h.patch b/package/glog/0001-src-symbolize.cc-fix-build-without-dlfcn.h.patch
new file mode 100644
index 0000000000..73c6e670ed
--- /dev/null
+++ b/package/glog/0001-src-symbolize.cc-fix-build-without-dlfcn.h.patch
@@ -0,0 +1,37 @@
+From f71e0899439aaa0e6172243a0862bf8a72a241fc Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Mon, 28 Oct 2019 18:21:55 +0100
+Subject: [PATCH] src/symbolize.cc: fix build without dlfcn.h
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/google/glog/pull/475]
+---
+ src/symbolize.cc | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/src/symbolize.cc b/src/symbolize.cc
+index 1ffc607..ff027f2 100644
+--- a/src/symbolize.cc
++++ b/src/symbolize.cc
+@@ -110,7 +110,9 @@ _END_GOOGLE_NAMESPACE_
+ 
+ #if defined(__ELF__)
+ 
++#if defined(HAVE_DLFCN_H)
+ #include <dlfcn.h>
++#endif
+ #if defined(OS_OPENBSD)
+ #include <sys/exec_elf.h>
+ #else
+@@ -832,7 +834,7 @@ static ATTRIBUTE_NOINLINE bool SymbolizeAndDemangle(void *pc, char *out,
+ 
+ _END_GOOGLE_NAMESPACE_
+ 
+-#elif defined(OS_MACOSX) && defined(HAVE_DLADDR)
++#elif defined(OS_MACOSX) && defined(HAVE_DLADDR) && defined(HAVE_DLFCN_H)
+ 
+ #include <dlfcn.h>
+ #include <string.h>
+-- 
+2.23.0
+
diff --git a/package/glog/0001-symbolize_unitests-some-tests-require-HAVE_STACKTRAC.patch b/package/glog/0001-symbolize_unitests-some-tests-require-HAVE_STACKTRAC.patch
deleted file mode 100644
index 10a84fbbe0..0000000000
--- a/package/glog/0001-symbolize_unitests-some-tests-require-HAVE_STACKTRAC.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 87b41094299cdc626876085549725ed0205ca830 Mon Sep 17 00:00:00 2001
-From: Gilles Talis <gilles.talis@gmail.com>
-Date: Sat, 26 Oct 2019 19:10:43 +0200
-Subject: [PATCH] symbolize_unitests: some tests require HAVE_STACKTRACE
- defined to be run
-
-The following test cases functions:
--  TestWithPCInsideInlineFunction
--  TestWithPCInsideNonInlineFunction
--  TestWithReturnAddress
-are defined if HAVE_STACKTRACE is defined
-
-Make sure they are invoked under the same condition
-
-Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
----
- src/symbolize_unittest.cc | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/src/symbolize_unittest.cc b/src/symbolize_unittest.cc
-index 9a17e7b..e11470e 100644
---- a/src/symbolize_unittest.cc
-+++ b/src/symbolize_unittest.cc
-@@ -407,9 +407,12 @@ int main(int argc, char **argv) {
-   // used to install some callback function at InitGoogle() time.
-   InstallSymbolizeCallback(NULL);
-
-+# if defined(HAVE_STACKTRACE)
-   TestWithPCInsideInlineFunction();
-   TestWithPCInsideNonInlineFunction();
-   TestWithReturnAddress();
-+# endif
-+
-   return RUN_ALL_TESTS();
- # elif defined(OS_WINDOWS) || defined(OS_CYGWIN)
-   TestWithReturnAddress();
--- 
-2.17.1
-
diff --git a/package/glog/Config.in b/package/glog/Config.in
index 534997af49..e864094646 100644
--- a/package/glog/Config.in
+++ b/package/glog/Config.in
@@ -1,13 +1,10 @@
 config BR2_PACKAGE_GLOG
 	bool "glog"
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on !BR2_STATIC_LIBS
 	help
 	  C++ implementation of the Google logging module
 
 	  https://github.com/google/glog
 
-comment "glog needs a toolchain w/ C++, threads, dynamic library"
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
-		BR2_STATIC_LIBS
+comment "glog needs a toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/glog/glog.mk b/package/glog/glog.mk
index 6974f7bac7..9d31732a88 100644
--- a/package/glog/glog.mk
+++ b/package/glog/glog.mk
@@ -9,23 +9,14 @@ GLOG_SITE = $(call github,google,glog,v$(GLOG_VERSION))
 GLOG_INSTALL_STAGING = YES
 GLOG_LICENSE = BSD-3-Clause
 GLOG_LICENSE_FILES = COPYING
-
-# No configure script provided, so we need autoreconf
-GLOG_AUTORECONF = YES
+GLOG_CONF_OPTS = \
+	$(if $(BR2_TOOLCHAIN_HAS_THREADS),-DWITH_THREADS=ON, -DWITH_THREADS=OFF)
 
 ifeq ($(BR2_PACKAGE_GFLAGS),y)
 GLOG_DEPENDENCIES = gflags
+GLOG_CONF_OPTS += -DWITH_GFLAGS=ON
+else
+GLOG_CONF_OPTS += -DWITH_GFLAGS=OFF
 endif
 
-# glog can optionally use atomic __sync built-ins. However, its
-# configure script only checks for the availability of the 4 bytes
-# version, but the code also uses the 1 byte version. While this works
-# on most architectures, it does not on architectures that implement
-# only the 4 bytes version, such as Microblaze. So if the architecture
-# does not implement the 1 byte version, we hint the configure script
-# that atomic built-ins should not be used.
-ifeq ($(BR2_TOOLCHAIN_HAS_SYNC_1),)
-GLOG_CONF_ENV += ac_cv___sync_val_compare_and_swap=no
-endif
-
-$(eval $(autotools-package))
+$(eval $(cmake-package))
