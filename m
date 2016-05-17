From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 May 2016 23:39:57 +0200
Subject: [Buildroot] [PATCH 1/3] midori: add missing
	BR2_TOOLCHAIN_USES_GLIBC dependency
Message-ID: <1463521199-13662-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
-- 
2.7.4
