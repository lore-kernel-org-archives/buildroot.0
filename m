From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 16 Feb 2019 11:42:02 +0100
Subject: [Buildroot] [PATCH 1/1] package/upmpdcli: needs NPTL
Message-ID: <20190216104202.13511-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The software uses pthread_mutexattr_setrobust which isn't available in
uClibc-ng Linuxthreads support.

Fixes:
 - http://autobuild.buildroot.org/results/197615ad077b0a719954024c3ba182dac43a0555

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/upmpdcli/Config.in | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/upmpdcli/Config.in b/package/upmpdcli/Config.in
index 938024e8a2..74eb768830 100644
--- a/package/upmpdcli/Config.in
+++ b/package/upmpdcli/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_UPMPDCLI
 	bool "upmpdcli"
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_TOOLCHAIN_HAS_THREADS # libupnpp
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++11, libupnpp
 	select BR2_PACKAGE_JSONCPP
 	select BR2_PACKAGE_LIBMICROHTTPD
@@ -15,6 +15,8 @@ config BR2_PACKAGE_UPMPDCLI
 
 	  http://www.lesbonscomptes.com/upmpdcli/
 
-comment "upmpdcli needs a toolchain w/ C++, threads, gcc >= 4.9"
+comment "upmpdcli needs a toolchain w/ C++, NPTL, gcc >= 4.9"
 	depends on BR2_USE_MMU
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+	depends on !BR2_INSTALL_LIBSTDCPP || \
+		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
-- 
2.14.1
