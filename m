From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed,  9 May 2018 11:33:28 +0200
Subject: [Buildroot] [PATCH 1/1] log4cplus: add C++11 dependencies
Message-ID: <20180509093328.25493-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

log4cplus uses std::future which is a C++11 feature affected by the gcc
bug 64735

Fixes:
 - http://autobuild.buildroot.net/results/4f4e9ed5dd5bad76eeee5d151e958f22603615b3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/log4cplus/Config.in | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/package/log4cplus/Config.in b/package/log4cplus/Config.in
index 8a112a4e8f..fd224dd270 100644
--- a/package/log4cplus/Config.in
+++ b/package/log4cplus/Config.in
@@ -3,6 +3,8 @@ config BR2_PACKAGE_LOG4CPLUS
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # C++11
+	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # std::future
 	help
 	  log4cplus is a simple to use C++ logging API providing
 	  thread-safe, flexible, and arbitrarily granular control
@@ -11,5 +13,9 @@ config BR2_PACKAGE_LOG4CPLUS
 
 	  http://sourceforge.net/projects/log4cplus
 
-comment "log4cplus needs a toolchain w/ C++, wchar, threads"
-	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_USE_WCHAR && BR2_TOOLCHAIN_HAS_THREADS)
+comment "log4cplus needs a toolchain w/ C++, wchar, threads, gcc >= 4.7"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
+		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
+
+comment "log4cplus needs a toolchain not affected by GCC bug 64735"
+	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
-- 
2.14.1
