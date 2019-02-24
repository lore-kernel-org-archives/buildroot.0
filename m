From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 24 Feb 2019 21:23:41 +0100
Subject: [Buildroot] [git commit] package/upmpdcli: needs NPTL
Message-ID: <20190224202148.DA9CC8B89D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=292c5a0ecda2a3cb1c54f12e1302494eaa8382fa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The software uses pthread_mutexattr_setrobust which isn't available in
uClibc-ng Linuxthreads support.

Fixes:
 - http://autobuild.buildroot.org/results/197615ad077b0a719954024c3ba182dac43a0555

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Acked-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/upmpdcli/Config.in | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/upmpdcli/Config.in b/package/upmpdcli/Config.in
index cf85a793ea..74eb768830 100644
--- a/package/upmpdcli/Config.in
+++ b/package/upmpdcli/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_UPMPDCLI
 	bool "upmpdcli"
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_TOOLCHAIN_HAS_THREADS # libupnpp, libmicrohttpd
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
