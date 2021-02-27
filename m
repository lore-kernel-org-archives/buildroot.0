From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 27 Feb 2021 18:18:24 +0100
Subject: [Buildroot] [git commit] package/log4cplus: bump to version 2.0.6
Message-ID: <20210308072136.67B948893D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c95486059827d65c5e4761879e848ee070d47b81
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop patch (already in version) and so autoreconf

https://github.com/log4cplus/log4cplus/releases/tag/REL_2_0_6

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...onfigure-ac-check-for-libraries-in-C-mode.patch | 62 ----------------------
 package/log4cplus/log4cplus.hash                   |  2 +-
 package/log4cplus/log4cplus.mk                     |  4 +-
 3 files changed, 2 insertions(+), 66 deletions(-)

diff --git a/package/log4cplus/0001-configure-ac-check-for-libraries-in-C-mode.patch b/package/log4cplus/0001-configure-ac-check-for-libraries-in-C-mode.patch
deleted file mode 100644
index 6226a6210d..0000000000
--- a/package/log4cplus/0001-configure-ac-check-for-libraries-in-C-mode.patch
+++ /dev/null
@@ -1,62 +0,0 @@
-From 4446516eb4fc8613d26669f5683f9d5d7c36ee67 Mon Sep 17 00:00:00 2001
-From: Peter Seiderer <ps.report@gmx.net>
-Date: Wed, 18 Dec 2019 21:26:58 +0100
-Subject: [PATCH] configure.ac: check for libraries in C mode
-
-Fixes check for libraries failures, e.g. (from config.log):
-
-  arc-buildroot-linux-uclibc-g++ -o conftest -Os -Wall -fdiagnostics-show-caret -ftrack-macro-expansion -fdiagnostics-color=auto -Wextra -pedantic -Wstrict-aliasing -Wstrict-overflow -Woverloaded-virtual -Wold-style-cast -Wc++14-compat -Wundef -Wshadow -Wformat -Wnoexcept -Wsuggest-attribute=format -Wsuggest-attribute=noreturn -Wno-variadic-macros -fvisibility=hidden conftest.cpp -latomic
-  conftest.cpp:28:6: error: new declaration 'char __atomic_fetch_and_4()' ambiguates built-in declaration 'unsigned int __atomic_fetch_and_4(volatile void*, unsigned int, int)' [-fpermissive]
-     28 | char __atomic_fetch_and_4 ();
-        |      ^~~~~~~~~~~~~~~~~~~~
-  conftest.cpp: In function 'int main()':
-  conftest.cpp:32:30: error: too few arguments to function 'unsigned int __atomic_fetch_and_4(volatile void*, unsigned int, int)'
-     32 | return __atomic_fetch_and_4 ();
-        |                              ^
-
-Resulting in:
-
-	checking for library containing __atomic_fetch_and_4... no
-
-instead (after the fix applied):
-
-	checking for library containing __atomic_fetch_and_4... -latomic
-
-Signed-off-by: Peter Seiderer <ps.report@gmx.net>
-[Retrieved from:
-https://github.com/log4cplus/log4cplus/commit/4446516eb4fc8613d26669f5683f9d5d7c36ee67]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- configure.ac | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/configure.ac b/configure.ac
-index 72fbd870a..64eff1936 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -412,6 +412,7 @@ LOG4CPLUS_DEFINE_MACRO_IF([LOG4CPLUS_HAVE_VAR_ATTRIBUTE_INIT_PRIORITY],
- 
- dnl Checks for libraries.
- 
-+AC_LANG_PUSH([C])
- AC_SEARCH_LIBS([__atomic_fetch_and_4], [atomic])
- AC_SEARCH_LIBS([strerror], [cposix])
- dnl On some systems libcompat exists only as a static library which
-@@ -422,6 +423,7 @@ AC_SEARCH_LIBS([setsockopt], [socket network net])
- AS_IF([test "x$with_iconv" = "xyes"],
-   [AC_SEARCH_LIBS([iconv_open], [iconv], [],
-      [AC_SEARCH_LIBS([libiconv_open], [iconv])])])
-+AC_LANG_POP([C])
- 
- dnl Windows/MinGW specific.
- 
-@@ -497,7 +499,9 @@ dnl Multi threaded library.
-    AS_VAR_APPEND([LIBS], [" $PTHREAD_LIBS"])
- 
-    dnl required on HP-UX
-+   AC_LANG_PUSH([C])
-    AC_SEARCH_LIBS([sem_init], [rt])
-+   AC_LANG_POP([C])
- 
-    AS_CASE([$ax_cv_cxx_compiler_vendor],
-      [gnu|clang],
diff --git a/package/log4cplus/log4cplus.hash b/package/log4cplus/log4cplus.hash
index 43ff401da6..28e5b204c7 100644
--- a/package/log4cplus/log4cplus.hash
+++ b/package/log4cplus/log4cplus.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  6046f0867ce4734f298418c7b7db0d35c27403090bb751d98e6e76aa4935f1af  log4cplus-2.0.5.tar.xz
+sha256  73519a5e47c40cf375aa6cd28a703b01908b5dcd3f4cb4290db2fef237c8180c  log4cplus-2.0.6.tar.xz
 sha256  91d7e42ff80e74c4c94e5ad353375fa0358cd0abbf43f5fe957097cdbd4e2c4d  LICENSE
diff --git a/package/log4cplus/log4cplus.mk b/package/log4cplus/log4cplus.mk
index 8a613efaee..8b62fb8f92 100644
--- a/package/log4cplus/log4cplus.mk
+++ b/package/log4cplus/log4cplus.mk
@@ -4,14 +4,12 @@
 #
 ################################################################################
 
-LOG4CPLUS_VERSION = 2.0.5
+LOG4CPLUS_VERSION = 2.0.6
 LOG4CPLUS_SOURCE = log4cplus-$(LOG4CPLUS_VERSION).tar.xz
 LOG4CPLUS_SITE = http://downloads.sourceforge.net/project/log4cplus/log4cplus-stable/$(LOG4CPLUS_VERSION)
 LOG4CPLUS_LICENSE = Apache-2.0, BSD-2-Clause, BSD-like (threadpool)
 LOG4CPLUS_LICENSE_FILES = LICENSE
 LOG4CPLUS_INSTALL_STAGING = YES
-# We're patching configure.ac
-LOG4CPLUS_AUTORECONF = YES
 
 ifeq ($(BR2_GCC_ENABLE_LTO),y)
 LOG4CPLUS_CONF_OPTS += --enable-lto
