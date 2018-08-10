From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 10 Aug 2018 08:37:21 +0300
Subject: [Buildroot] [PATCH] uboot-tools: force host CFLAGS
Message-ID: <6c246971096ed5ace6c35e3102ca0649025c19fa.1533879441.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

U-Boot now adds -std=gnu11 when building its build utilities, like
fixdep. This option is only supported since gcc version 4.7.

  https://gcc.gnu.org/gcc-4.7/changes.html

Force usage of Buildroot HOST_CFLAGS, like we do already for
host-uboot-tools, to avoid the -std=gnu11 option.

Fixes:
http://autobuild.buildroot.net/results/ea0/ea09b614a3c10d494939d9551c0c3bfca4626ece/
http://autobuild.buildroot.net/results/f8e/f8efd9af4d86c51fe4f5afe44db9abf9adc5718f/
http://autobuild.buildroot.net/results/c0a/c0ab35c3cb46f84863fe20c0ee92ecc2379578b6/

Cc: Matt Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/uboot-tools/uboot-tools.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/uboot-tools/uboot-tools.mk b/package/uboot-tools/uboot-tools.mk
index f5027d2da390..5ac7b1c29399 100644
--- a/package/uboot-tools/uboot-tools.mk
+++ b/package/uboot-tools/uboot-tools.mk
@@ -19,6 +19,7 @@ endef
 UBOOT_TOOLS_MAKE_OPTS = CROSS_COMPILE="$(TARGET_CROSS)" \
 	CFLAGS="$(TARGET_CFLAGS)" \
 	LDFLAGS="$(TARGET_LDFLAGS)" \
+	HOSTCFLAGS="$(HOST_CFLAGS)" \
 	STRIP=$(TARGET_STRIP)
 
 ifeq ($(BR2_PACKAGE_UBOOT_TOOLS_FIT_SUPPORT),y)
-- 
2.18.0
