From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 28 Nov 2013 14:44:16 +0100
Subject: [Buildroot] [git commit] apr: needs mmu
Message-ID: <20131128134439.6B9769BAAF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1f2d6618548ee2cf3d2c6314b3a9d7c648c97b48
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Uses fork() in apr_proc_fork() which is used by almost all the packages
that use apr (log4cxx, subversion).
apr-util doesn't use fork or apr_proc_fork but it's of no use alone.

[Peter: also hide log4cxx comment if !BR2_USE_MMU]
Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/apr-util/Config.in   |    1 +
 package/apr/Config.in        |    1 +
 package/log4cxx/Config.in    |    2 ++
 package/subversion/Config.in |    1 +
 4 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/package/apr-util/Config.in b/package/apr-util/Config.in
index 895dbb8..3d4ec23 100644
--- a/package/apr-util/Config.in
+++ b/package/apr-util/Config.in
@@ -7,6 +7,7 @@ config BR2_PACKAGE_APR_UTIL
 	select BR2_PACKAGE_ZLIB
 	# apr really needs shared library support
 	depends on !BR2_PREFER_STATIC_LIB
+	depends on BR2_USE_MMU # apr
 	help
 	  The utility library for the apache runtime project
 
diff --git a/package/apr/Config.in b/package/apr/Config.in
index ed319ed..e06d254 100644
--- a/package/apr/Config.in
+++ b/package/apr/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_APR
 	bool "apr"
 	# apr really needs shared library support
 	depends on !BR2_PREFER_STATIC_LIB
+	depends on BR2_USE_MMU # fork() in apr_proc_fork()
 	help
 	  The mission of the Apache Portable Runtime (APR) project is to create
 	  and maintain software libraries that provide a predictable and
diff --git a/package/log4cxx/Config.in b/package/log4cxx/Config.in
index 8791b8c..bc14226 100644
--- a/package/log4cxx/Config.in
+++ b/package/log4cxx/Config.in
@@ -6,6 +6,7 @@ config BR2_PACKAGE_LOG4CXX
 	depends on !BR2_PREFER_STATIC_LIB
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_MMU # apr
 	help
 	  Apache log4cxx is a logging framework for C++ patterned
 	  after Apache log4j.
@@ -15,3 +16,4 @@ config BR2_PACKAGE_LOG4CXX
 comment "log4cxx needs a toolchain w/ C++, threads, dynamic library"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
 		BR2_PREFER_STATIC_LIB
+	depends on BR2_USE_MMU
diff --git a/package/subversion/Config.in b/package/subversion/Config.in
index c1358fe..cc2549f 100644
--- a/package/subversion/Config.in
+++ b/package/subversion/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_SUBVERSION
 	select BR2_PACKAGE_APR_UTIL
 	# apr really needs shared library support
 	depends on !BR2_PREFER_STATIC_LIB
+	depends on BR2_USE_MMU # apr
 	select BR2_PACKAGE_NEON
 	select BR2_PACKAGE_NEON_XML
 	help
