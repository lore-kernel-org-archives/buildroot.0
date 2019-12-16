From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 16 Dec 2019 22:42:49 +0100
Subject: [Buildroot] [git commit] package/apitrace: needs wchar
Message-ID: <20191216213400.BF2058B7B9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=131c8e2e5165502a7c3265dd568f7c3817bd026a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

apitrace uses its own version of gtest which depends on wchar since
version 8.0 and
https://github.com/apitrace/apitrace/commit/85cf7c8b86129699246574dfeec846e88a3f88a2

Moreover, apitrace also uses wcslen in trace_writer.cpp since at least
version 8.0 and
https://github.com/apitrace/apitrace/commit/5e9a2b11b248aaa2f6f353bbcf9f600d65bcaf51

Fixes:
 - http://autobuild.buildroot.org/results/5f27556ccc9daec578fe1bf2ed516ca9921ed474

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/apitrace/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/apitrace/Config.in b/package/apitrace/Config.in
index 45b4c307bb..08313c4891 100644
--- a/package/apitrace/Config.in
+++ b/package/apitrace/Config.in
@@ -1,8 +1,10 @@
-comment "apitrace needs a toolchain w/ C++, gcc >= 4.9"
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+comment "apitrace needs a toolchain w/ C++, wchar, gcc >= 4.9"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 
 config BR2_PACKAGE_APITRACE
 	bool "apitrace"
+	depends on BR2_USE_WCHAR
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 	select BR2_PACKAGE_XLIB_LIBX11 if BR2_PACKAGE_XORG7
