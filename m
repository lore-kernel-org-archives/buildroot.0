From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 22 Dec 2019 11:13:33 +0100
Subject: [Buildroot] [git commit] package/apitrace: needs MMU
Message-ID: <20191222100432.745D48D4FB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=60f704502a2eb29dd8b986ef810f238c1419bc3f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

apitrace uses its own version of gtest which needs fork() since
version 8.0 and
https://github.com/apitrace/apitrace/commit/85cf7c8b86129699246574dfeec846e88a3f88a2

Moreover, apitrace also uses fork in ./lib/os/os_posix.cpp

Fixes:
 - http://autobuild.buildroot.org/results/1165ed62d9ae3dbdc13590c39bb55edd9a444567

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/apitrace/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/apitrace/Config.in b/package/apitrace/Config.in
index 116a864681..abd7ae00ee 100644
--- a/package/apitrace/Config.in
+++ b/package/apitrace/Config.in
@@ -1,10 +1,12 @@
 comment "apitrace needs a toolchain w/ C++, wchar, threads, gcc >= 4.9"
+	depends on BR2_USE_MMU
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
 		!BR2_TOOLCHAIN_HAS_THREADS || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 
 config BR2_PACKAGE_APITRACE
 	bool "apitrace"
+	depends on BR2_USE_MMU # fork()
 	depends on BR2_USE_WCHAR
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
