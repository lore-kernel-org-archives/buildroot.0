From: Baruch Siach <baruch@tkos.co.il>
Date: Tue,  7 Aug 2018 07:38:01 +0300
Subject: [Buildroot] [PATCH] uboot-tools: requires host gcc 4.7+
Message-ID: <cc4aa02d36bdd5ab0f2a450508c67c332d1b5d2c.1533616681.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

U-Boot now adds -std=gnu11 when building its build utilities, like
fixdep. This option is only supported since gcc version 4.7.

  https://gcc.gnu.org/gcc-4.7/changes.html

Fixes:
http://autobuild.buildroot.net/results/ea0/ea09b614a3c10d494939d9551c0c3bfca4626ece/
http://autobuild.buildroot.net/results/f8e/f8efd9af4d86c51fe4f5afe44db9abf9adc5718f/
http://autobuild.buildroot.net/results/c0a/c0ab35c3cb46f84863fe20c0ee92ecc2379578b6/

Cc: Matt Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/uboot-tools/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/uboot-tools/Config.in b/package/uboot-tools/Config.in
index 63a058e8562a..78a8b66c4d97 100644
--- a/package/uboot-tools/Config.in
+++ b/package/uboot-tools/Config.in
@@ -1,10 +1,14 @@
 config BR2_PACKAGE_UBOOT_TOOLS
 	bool "u-boot tools"
+	depends on BR2_HOST_GCC_AT_LEAST_4_7 # -std=gnu11
 	help
 	  Companion tools for Das U-Boot bootloader.
 
 	  http://www.denx.de/wiki/U-Boot/WebHome
 
+comment "u-boot tools needs host gcc >= 4.7"
+	depends on !BR2_HOST_GCC_AT_LEAST_4_7
+
 if BR2_PACKAGE_UBOOT_TOOLS
 
 config BR2_PACKAGE_UBOOT_TOOLS_FIT_SUPPORT
-- 
2.18.0
