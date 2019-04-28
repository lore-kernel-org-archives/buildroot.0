From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 28 Apr 2019 13:01:42 +0200
Subject: [Buildroot] [PATCH 1/1] package/uboot-tools: fix build with
 host-openssl
Message-ID: <20190428110142.14075-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If host-openssl is built before uboot-tools, build fails because
uboot-tools links with openssl headers from host which depends on
pthread.h

To fix this issue, don't pass pass HOST_CFLAGS to UBOOT_TOOLS_MAKE_OPTS

As HOST_CFLAGS was added to remove -std=gnu11 in commit
03a808a0999ac031a1e93000d9a3c50ffbcb64a4, add a dependency to gcc >= 4.7
to uboot-tools and mender (its reverse dependency)

Fixes:
 - http://autobuild.buildroot.org/results/915b509e814bda16be54a24276b9c740c51e5770

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/mender/Config.in           | 5 +++--
 package/uboot-tools/Config.in      | 4 ++++
 package/uboot-tools/uboot-tools.mk | 1 -
 3 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/package/mender/Config.in b/package/mender/Config.in
index 5ab2304e49..f8896692f7 100644
--- a/package/mender/Config.in
+++ b/package/mender/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_MENDER
 	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # uboot-tools
 	select BR2_PACKAGE_UBOOT_TOOLS # runtime
 	select BR2_PACKAGE_UBOOT_TOOLS_FWPRINTENV # runtime
 	help
@@ -13,7 +14,7 @@ config BR2_PACKAGE_MENDER
 
 	  https://github.com/mendersoftware/mender
 
-comment "mender needs a toolchain w/ threads"
+comment "mender needs a toolchain w/ threads, gcc >= 4.7"
 	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
diff --git a/package/uboot-tools/Config.in b/package/uboot-tools/Config.in
index 681f87b45f..4e6a5104ea 100644
--- a/package/uboot-tools/Config.in
+++ b/package/uboot-tools/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_UBOOT_TOOLS
 	bool "u-boot tools"
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # C++11
 	help
 	  Companion tools for Das U-Boot bootloader.
 
@@ -94,3 +95,6 @@ config BR2_PACKAGE_UBOOT_TOOLS_DUMPIMAGE
 	  extraction of data from U-Boot images.
 
 endif
+
+comment "uboot-tools needs a toolchain w/ gcc >= 4.7"
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
diff --git a/package/uboot-tools/uboot-tools.mk b/package/uboot-tools/uboot-tools.mk
index 61c70b7e7f..c27b2d364b 100644
--- a/package/uboot-tools/uboot-tools.mk
+++ b/package/uboot-tools/uboot-tools.mk
@@ -19,7 +19,6 @@ endef
 UBOOT_TOOLS_MAKE_OPTS = CROSS_COMPILE="$(TARGET_CROSS)" \
 	CFLAGS="$(TARGET_CFLAGS)" \
 	LDFLAGS="$(TARGET_LDFLAGS)" \
-	HOSTCFLAGS="$(HOST_CFLAGS)" \
 	STRIP=$(TARGET_STRIP)
 
 ifeq ($(BR2_PACKAGE_UBOOT_TOOLS_FIT_SUPPORT),y)
-- 
2.20.1
