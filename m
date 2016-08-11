From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 11 Aug 2016 15:04:14 +0200
Subject: [Buildroot] [git commit] uboot-tools: add missing !BR2_STATIC_LIBS
	dependency for FIT signature
Message-ID: <20160811130418.E45F681EB5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=031130a4ed9d7e7b6d83cbb18089224008bc964d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

BR2_PACKAGE_UBOOT_TOOLS_FIT_SUPPORT selects BR2_PACKAGE_DTC, but forgets
to depends on !BR2_STATIC_LIBS like BR2_PACKAGE_DTC does.

Fixes the following kconfig warning:

  arning: (BR2_PACKAGE_UBOOT_TOOLS_FIT_SUPPORT && BR2_PACKAGE_KVMTOOL && BR2_PACKAGE_UBOOT_TOOLS_MKIMAGE_FIT_SIGNATURE_SUPPORT) selects BR2_PACKAGE_DTC which has unmet direct dependencies (!BR2_STATIC_LIBS)

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/uboot-tools/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/uboot-tools/Config.in b/package/uboot-tools/Config.in
index 88d6225..df61fda 100644
--- a/package/uboot-tools/Config.in
+++ b/package/uboot-tools/Config.in
@@ -9,6 +9,7 @@ if BR2_PACKAGE_UBOOT_TOOLS
 
 config BR2_PACKAGE_UBOOT_TOOLS_FIT_SUPPORT
 	bool "Flattened Image Tree (FIT) support"
+	depends on !BR2_STATIC_LIBS
 	select BR2_PACKAGE_DTC
 	select BR2_PACKAGE_DTC_PROGRAMS
 	help
@@ -20,6 +21,9 @@ config BR2_PACKAGE_UBOOT_TOOLS_FIT_SUPPORT
 	  in a single blob. To boot this new uImage structure,
 	  pass the address of the blob to the "bootm" command.
 
+comment "u-boot tools FIT support needs a toolchain w/ dynamic library"
+	depends on !BR2_STATIC_LIBS
+
 if BR2_PACKAGE_UBOOT_TOOLS_FIT_SUPPORT
 
 config BR2_PACKAGE_UBOOT_TOOLS_FIT_SIGNATURE_SUPPORT
