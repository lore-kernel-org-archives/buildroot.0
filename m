From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 24 May 2016 17:08:59 +0200
Subject: [Buildroot] [git commit] midori: add missing
	BR2_TOOLCHAIN_USES_GLIBC dependency
Message-ID: <20160524151833.067A78049D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5ebf6282413c96937ffabf4d2d3b6ce75a344693
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

midori selects webkitgtk, and webkitgtk needs a glibc toolchain, but
midori did not propagate this dependency, causing the following kconfig
warning:

warning: (BR2_PACKAGE_MIDORI) selects BR2_PACKAGE_WEBKITGTK which has unmet direct dependencies (BR2_INSTALL_LIBSTDCPP && BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 && BR2_TOOLCHAIN_USES_GLIBC && BR2_PACKAGE_LIBGTK3 && BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS)

Interestingly, the Config.in comment of the midori package already
mentionned the (e)glibc dependency, but the BR2_TOOLCHAIN_USES_GLIBC
dependency was not expressed (either on the comment or on the main
package option itself).

Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/midori/Config.in | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/midori/Config.in b/package/midori/Config.in
index 91a63af..9751f33 100644
--- a/package/midori/Config.in
+++ b/package/midori/Config.in
@@ -1,7 +1,7 @@
 comment "midori needs libgtk3 and an (e)glibc toolchain w/ C++, gcc >= 4.9"
 	depends on BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_PACKAGE_LIBGTK3 \
-		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || !BR2_TOOLCHAIN_USES_GLIBC
 
 config BR2_PACKAGE_MIDORI
 	bool "midori"
@@ -18,6 +18,7 @@ config BR2_PACKAGE_MIDORI
 	depends on BR2_PACKAGE_LIBGTK3
 	depends on BR2_INSTALL_LIBSTDCPP # webkitgtk
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # webkitgtk
+	depends on BR2_TOOLCHAIN_USES_GLIBC # webkitgtk
 	depends on BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS
 	help
 	  Midori is a lightweight web browser based on WebKit
