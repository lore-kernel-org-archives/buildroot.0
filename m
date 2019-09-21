From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 21 Sep 2019 22:03:09 +0200
Subject: [Buildroot] [PATCH 1/1] package/apr: needs threads
Message-ID: <20190921200309.24759-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Upstream commit
https://github.com/apache/apr/commit/815881ea01a13055a580756bb426d5f96daf14ff

added a check for int64_t which uses the APR_CHECK_TYPES_FMT_COMPATIBLE
m4 macro:

https://github.com/apache/apr/commit/4d8039901cc7e0d645a7a20fc74c18d1781a3445

which in turn uses the m4 macro APR_TRY_COMPILE_NO_WARNING.
This macro adds -Werror to CFLAGS:

https://github.com/apache/apr/blob/trunk/build/apr_common.m4#L504

and breaks the configure check for int64_t on toolchains lacking
threads support:

http://autobuild.buildroot.net/results/69f/69f3a65ec3b43ff6124f83ea63c808a77dc180d9/apr-1.7.0/config.log

configure:24284: checking whether int64_t and long long use fmt %lld
configure:24316: /data/buildroot/buildroot-test/instance-0/output/host/bin/arm-linux-gcc -c -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os    -Werror -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -DLINUX -D_REENTRANT -D_GNU_SOURCE conftest.c >&5
In file included from /data/buildroot/buildroot-test/instance-0/output/host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/include/sys/types.h:26:0,
                 from conftest.c:147:
/data/buildroot/buildroot-test/instance-0/output/host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/include/features.h:218:5: error: #warning requested reentrant code, but thread support was disabled [-Werror=cpp]
 #   warning requested reentrant code, but thread support was disabled
     ^~~~~~~
cc1: all warnings being treated as errors

Fixes:
http://autobuild.buildroot.net/results/69f/69f3a65ec3b43ff6124f83ea63c808a77dc180d9/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/apache/Config.in     | 2 +-
 package/apr-util/Config.in   | 5 +++--
 package/apr/Config.in        | 5 +++--
 package/log4cxx/Config.in    | 2 +-
 package/subversion/Config.in | 5 +++--
 5 files changed, 11 insertions(+), 8 deletions(-)

diff --git a/package/apache/Config.in b/package/apache/Config.in
index 693ee20a1b..afe5632c8a 100644
--- a/package/apache/Config.in
+++ b/package/apache/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_APACHE
 	bool "apache"
 	depends on !BR2_STATIC_LIBS
-	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_TOOLCHAIN_HAS_THREADS # apr, apr-util
 	depends on BR2_USE_MMU # apr
 	select BR2_PACKAGE_APR_UTIL
 	select BR2_PACKAGE_PCRE
diff --git a/package/apr-util/Config.in b/package/apr-util/Config.in
index 6c5e3bbdf5..90a28892ea 100644
--- a/package/apr-util/Config.in
+++ b/package/apr-util/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_APR_UTIL
 	bool "apr-util"
 	# apr really needs shared library support
 	depends on !BR2_STATIC_LIBS
+	depends on BR2_TOOLCHAIN_HAS_THREADS # apr
 	depends on BR2_USE_MMU # apr
 	select BR2_PACKAGE_APR
 	select BR2_PACKAGE_EXPAT
@@ -10,6 +11,6 @@ config BR2_PACKAGE_APR_UTIL
 
 	  http://apr.apache.org/
 
-comment "apr-util needs a toolchain w/ dynamic library"
+comment "apr-util needs a toolchain w/ threads, dynamic library"
 	depends on BR2_USE_MMU
-	depends on BR2_STATIC_LIBS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
diff --git a/package/apr/Config.in b/package/apr/Config.in
index 67de925474..5ce2f84bf3 100644
--- a/package/apr/Config.in
+++ b/package/apr/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_APR
 	bool "apr"
 	# apr really needs shared library support
 	depends on !BR2_STATIC_LIBS
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # fork() in apr_proc_fork()
 	help
 	  The mission of the Apache Portable Runtime (APR) project is to
@@ -11,6 +12,6 @@ config BR2_PACKAGE_APR
 
 	  http://apr.apache.org/
 
-comment "apr needs a toolchain w/ dynamic library"
+comment "apr needs a toolchain w/ threads, dynamic library"
 	depends on BR2_USE_MMU
-	depends on BR2_STATIC_LIBS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
diff --git a/package/log4cxx/Config.in b/package/log4cxx/Config.in
index bf739a43ca..f1c0d3cd56 100644
--- a/package/log4cxx/Config.in
+++ b/package/log4cxx/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_LOG4CXX
 	# apr really needs shared library support
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_TOOLCHAIN_HAS_THREADS # apr, apr-util
 	depends on BR2_USE_MMU # apr
 	select BR2_PACKAGE_APR
 	select BR2_PACKAGE_APR_UTIL
diff --git a/package/subversion/Config.in b/package/subversion/Config.in
index ecac51814e..c01a2f10d2 100644
--- a/package/subversion/Config.in
+++ b/package/subversion/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_SUBVERSION
 	bool "subversion"
 	# apr really needs shared library support
 	depends on !BR2_STATIC_LIBS
+	depends on BR2_TOOLCHAIN_HAS_THREADS # apr, apr-util
 	depends on BR2_USE_MMU # apr
 	select BR2_PACKAGE_APR
 	select BR2_PACKAGE_APR_UTIL
@@ -13,6 +14,6 @@ config BR2_PACKAGE_SUBVERSION
 
 	  http://subversion.apache.org/
 
-comment "subversion needs a toolchain w/ dynamic library"
+comment "subversion needs a toolchain w/ threads, dynamic library"
 	depends on BR2_USE_MMU
-	depends on BR2_STATIC_LIBS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
-- 
2.20.1
