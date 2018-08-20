From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 21 Aug 2018 00:12:56 +0200
Subject: [Buildroot] [PATCH v2,
 1/2] boost: context needs thread if gcc <= 4.6
Message-ID: <20180820221257.1553-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

mutex is available on gcc 4.7.x, the issue is that boost does not
correctly detect it because -std=c++11 is missing.
Keep thread select for gcc version lower or equal to 4.6

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2 (after review of Thomas Petazzoni):
 - Update first patch to keep selection of boost-thread but lower gcc
   version from 4.8 to 4.7
 - Update second patch to add -std=c++11 only if gcc >= 4.7

 package/boost/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/boost/Config.in b/package/boost/Config.in
index 965d198ebf..627cf2f356 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -83,7 +83,7 @@ config BR2_PACKAGE_BOOST_CONTEXT
 	bool "boost-context"
 	depends on BR2_PACKAGE_BOOST_CONTEXT_ARCH_SUPPORTS
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735
-	select BR2_PACKAGE_BOOST_THREAD if !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+	select BR2_PACKAGE_BOOST_THREAD if !BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
 	help
 	  C++11 context switching library.
 
-- 
2.14.1
