From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 27 Nov 2013 10:00:41 -0300
Subject: [Buildroot] [PATCH] apr: needs mmu
Message-ID: <1385557241-13292-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Uses fork() in apr_proc_fork() which is used by almost all the packages
that use apr (log4cxx, subversion).
apr-util doesn't use fork or apr_proc_fork but it's of no use alone.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/apr-util/Config.in   | 1 +
 package/apr/Config.in        | 1 +
 package/log4cxx/Config.in    | 1 +
 package/subversion/Config.in | 1 +
 4 files changed, 4 insertions(+)

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
index 8791b8c..616fb1f 100644
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
-- 
1.8.3.2
