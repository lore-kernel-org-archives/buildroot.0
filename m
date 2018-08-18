From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 18 Aug 2018 22:10:52 +0200
Subject: [Buildroot] [PATCH 1/1] boost: enable back log on powerpc with
 uclibc
Message-ID: <20180818201052.3959-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

boost-log builds fine with powerpc on uclibc nowadays so enable it back.
By removing this dependency, build failure on azmq is also fixed as this
package is currently selecting boost-log without fulfilling this
dependency

Fixes:
 - http://autobuild.buildroot.net/results/9c373d0b5a1a59e2271d71c480d55a90a67b84cb

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/boost/Config.in | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/package/boost/Config.in b/package/boost/Config.in
index 537ebc7b20..965d198ebf 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -203,9 +203,6 @@ comment "boost-locale needs a toolchain w/ dynamic library"
 config BR2_PACKAGE_BOOST_LOG
 	bool "boost-log"
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
-	# for some reason, uClibc on PowerPC fails to build the boost
-	# log module
-	depends on !(BR2_powerpc && BR2_TOOLCHAIN_USES_UCLIBC)
 	select BR2_PACKAGE_BOOST_ATOMIC
 	select BR2_PACKAGE_BOOST_DATE_TIME
 	select BR2_PACKAGE_BOOST_FILESYSTEM
@@ -217,7 +214,6 @@ config BR2_PACKAGE_BOOST_LOG
 
 comment "boost-log needs a toolchain w/ NPTL"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL
-	depends on !(BR2_powerpc && BR2_TOOLCHAIN_USES_UCLIBC)
 
 config BR2_PACKAGE_BOOST_MATH
 	bool "boost-math"
-- 
2.14.1
