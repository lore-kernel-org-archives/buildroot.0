Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F03EC433EF
	for <buildroot@archiver.kernel.org>; Sat,  9 Apr 2022 16:45:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CE60D60B8B;
	Sat,  9 Apr 2022 16:45:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ky-ZCyBDNgkl; Sat,  9 Apr 2022 16:45:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6AA0C60ACE;
	Sat,  9 Apr 2022 16:45:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 008531BF59C
 for <buildroot@lists.busybox.net>; Sat,  9 Apr 2022 16:45:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DC64C60ACE
 for <buildroot@lists.busybox.net>; Sat,  9 Apr 2022 16:45:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ApSUy9WUO0ks for <buildroot@lists.busybox.net>;
 Sat,  9 Apr 2022 16:45:48 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7CEDA60A9C
 for <buildroot@buildroot.org>; Sat,  9 Apr 2022 16:45:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id CA8918376A; Sat,  9 Apr 2022 16:36:10 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 9 Apr 2022 18:45:03 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7818cef78bfaf8eab8ec86d715ca76b0dbfa46e8
X-Git-Newrev: aeee90ec109b83c42779e6a2617f7d57e25a2b65
X-Patchwork-Hint: ignore
Message-Id: <20220409163610.CA8918376A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] utils/genrandconfig: add randconfig based
 --no-toolchains-csv option
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=aeee90ec109b83c42779e6a2617f7d57e25a2b65
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently we only test a limited set of toolchains that are mostly
prebuilt, add a flag to allow using randconfig for randomizing
additional toolchain settings instead of randpackageconfig.

To avoid invalid configs we need to add additional config validation
filtering and fixups. Although the loop around 'make randconfig'
attempts does make sure we eventually end up with a valid configuration,
there is a bias towards e.g. disabling the kernel. It would be possible
to e.g. always force BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y, but
that removes the possibility for a toolchains-csv config to add a valid
custom defconfig. (Note that currently this isn't possible anyway since
'make randpackageconfig' is used if a toolchains-csv is provided, but
eventually we want to use 'make randconfig' also if a toolchains-csv is
provided.)

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 utils/genrandconfig | 215 +++++++++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 206 insertions(+), 9 deletions(-)

diff --git a/utils/genrandconfig b/utils/genrandconfig
index 3483d55c14..59fe34e58d 100755
--- a/utils/genrandconfig
+++ b/utils/genrandconfig
@@ -315,6 +315,192 @@ def fixup_config(sysinfo, configfile):
         configlines.remove('BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE=""\n')
         configlines.append('BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="%s"\n' % bootscr)
 
+    if 'BR2_ROOTFS_SKELETON_CUSTOM=y\n' in configlines and \
+       'BR2_ROOTFS_SKELETON_CUSTOM_PATH=""\n' in configlines:
+        configlines.remove('BR2_ROOTFS_SKELETON_CUSTOM=y\n')
+        configlines.remove('BR2_ROOTFS_SKELETON_CUSTOM_PATH=""\n')
+
+    if 'BR2_LINUX_KERNEL=y\n' in configlines and \
+       'BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y\n' in configlines and \
+       'BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE=""\n' in configlines:
+        configlines.remove('BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y\n')
+        configlines.append('BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y\n')
+        configlines.remove('BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE=""\n')
+
+    if 'BR2_LINUX_KERNEL=y\n' in configlines and \
+       'BR2_LINUX_KERNEL_USE_DEFCONFIG=y\n' in configlines and \
+       'BR2_LINUX_KERNEL_DEFCONFIG=""\n' in configlines:
+        configlines.remove('BR2_LINUX_KERNEL_USE_DEFCONFIG=y\n')
+        configlines.append('BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y\n')
+        configlines.remove('BR2_LINUX_KERNEL_DEFCONFIG=""\n')
+
+    if 'BR2_LINUX_KERNEL=y\n' in configlines and \
+       'BR2_LINUX_KERNEL_CUSTOM_GIT=y\n' in configlines and \
+       'BR2_LINUX_KERNEL_CUSTOM_REPO_URL=""\n' in configlines:
+        configlines.remove('BR2_LINUX_KERNEL_CUSTOM_GIT=y\n')
+        configlines.append('BR2_LINUX_KERNEL_LATEST_VERSION=y\n')
+        configlines.remove('BR2_LINUX_KERNEL_CUSTOM_REPO_URL=""\n')
+
+    if 'BR2_LINUX_KERNEL=y\n' in configlines and \
+       'BR2_LINUX_KERNEL_CUSTOM_HG=y\n' in configlines and \
+       'BR2_LINUX_KERNEL_CUSTOM_REPO_URL=""\n' in configlines:
+        configlines.remove('BR2_LINUX_KERNEL_CUSTOM_HG=y\n')
+        configlines.append('BR2_LINUX_KERNEL_LATEST_VERSION=y\n')
+        configlines.remove('BR2_LINUX_KERNEL_CUSTOM_REPO_URL=""\n')
+
+    if 'BR2_LINUX_KERNEL=y\n' in configlines and \
+       'BR2_LINUX_KERNEL_CUSTOM_SVN=y\n' in configlines and \
+       'BR2_LINUX_KERNEL_CUSTOM_REPO_URL=""\n' in configlines:
+        configlines.remove('BR2_LINUX_KERNEL_CUSTOM_SVN=y\n')
+        configlines.append('BR2_LINUX_KERNEL_LATEST_VERSION=y\n')
+        configlines.remove('BR2_LINUX_KERNEL_CUSTOM_REPO_URL=""\n')
+
+    if 'BR2_LINUX_KERNEL=y\n' in configlines and \
+       'BR2_LINUX_KERNEL_CUSTOM_TARBALL=y\n' in configlines and \
+       'BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION=""\n' in configlines:
+        configlines.remove('BR2_LINUX_KERNEL_CUSTOM_TARBALL=y\n')
+        configlines.append('BR2_LINUX_KERNEL_LATEST_VERSION=y\n')
+        configlines.remove('BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION=""\n')
+
+    if 'BR2_LINUX_KERNEL=y\n' in configlines and \
+       'BR2_LINUX_KERNEL_CUSTOM_VERSION=y\n' in configlines and \
+       'BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=""\n' in configlines:
+        configlines.remove('BR2_LINUX_KERNEL_CUSTOM_VERSION=y\n')
+        configlines.append('BR2_LINUX_KERNEL_LATEST_VERSION=y\n')
+        configlines.remove('BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=""\n')
+
+    if 'BR2_LINUX_KERNEL=y\n' in configlines and \
+       'BR2_LINUX_KERNEL_DTS_SUPPORT=y\n' in configlines and \
+       'BR2_LINUX_KERNEL_INTREE_DTS_NAME=""\n' in configlines and \
+       'BR2_LINUX_KERNEL_CUSTOM_DTS_PATH=""\n' in configlines:
+        configlines.remove('BR2_LINUX_KERNEL_DTS_SUPPORT=y\n')
+        configlines.remove('BR2_LINUX_KERNEL_INTREE_DTS_NAME=""\n')
+        configlines.remove('BR2_LINUX_KERNEL_CUSTOM_DTS_PATH=""\n')
+        if 'BR2_LINUX_KERNEL_APPENDED_UIMAGE=y\n' in configlines:
+            configlines.remove('BR2_LINUX_KERNEL_APPENDED_UIMAGE=y\n')
+            configlines.append('BR2_LINUX_KERNEL_UIMAGE=y\n')
+        if 'BR2_LINUX_KERNEL_APPENDED_ZIMAGE=y\n' in configlines:
+            configlines.remove('BR2_LINUX_KERNEL_APPENDED_ZIMAGE=y\n')
+            configlines.append('BR2_LINUX_KERNEL_ZIMAGE=y\n')
+        if 'BR2_LINUX_KERNEL_SIMPLEIMAGE=y\n' in configlines:
+            configlines.remove('BR2_LINUX_KERNEL_SIMPLEIMAGE=y\n')
+            configlines.append('BR2_LINUX_KERNEL_VMLINUX=y\n')
+
+    if 'BR2_LINUX_KERNEL_EXT_AUFS=y\n' in configlines and \
+       'BR2_LINUX_KERNEL_EXT_AUFS_VERSION=""\n' in configlines:
+        configlines.remove('BR2_LINUX_KERNEL_EXT_AUFS=y\n')
+        configlines.remove('BR2_LINUX_KERNEL_EXT_AUFS_VERSION=""\n')
+
+    if 'BR2_PACKAGE_LINUX_BACKPORTS=y\n' in configlines and \
+       'BR2_PACKAGE_LINUX_BACKPORTS_USE_CUSTOM_CONFIG=y\n' in configlines and \
+       'BR2_PACKAGE_LINUX_BACKPORTS_CUSTOM_CONFIG_FILE=""\n' in configlines:
+        configlines.remove('BR2_PACKAGE_LINUX_BACKPORTS=y\n')
+        configlines.remove('BR2_PACKAGE_LINUX_BACKPORTS_USE_CUSTOM_CONFIG=y\n')
+        configlines.remove('BR2_PACKAGE_LINUX_BACKPORTS_CUSTOM_CONFIG_FILE=""\n')
+
+    if 'BR2_PACKAGE_LINUX_BACKPORTS=y\n' in configlines and \
+       'BR2_PACKAGE_LINUX_BACKPORTS_USE_DEFCONFIG=y\n' in configlines and \
+       'BR2_PACKAGE_LINUX_BACKPORTS_DEFCONFIG=""\n' in configlines:
+        configlines.remove('BR2_PACKAGE_LINUX_BACKPORTS=y\n')
+        configlines.remove('BR2_PACKAGE_LINUX_BACKPORTS_USE_DEFCONFIG=y\n')
+        configlines.remove('BR2_PACKAGE_LINUX_BACKPORTS_DEFCONFIG=""\n')
+
+    if 'BR2_KERNEL_HEADERS_VERSION=y\n' in configlines and \
+       'BR2_DEFAULT_KERNEL_VERSION=""\n' in configlines:
+        configlines.remove('BR2_KERNEL_HEADERS_VERSION=y\n')
+        configlines.remove('BR2_DEFAULT_KERNEL_VERSION=""\n')
+
+    if 'BR2_KERNEL_HEADERS_CUSTOM_GIT=y\n' in configlines and \
+       'BR2_KERNEL_HEADERS_CUSTOM_REPO_URL=""\n':
+        configlines.remove('BR2_KERNEL_HEADERS_CUSTOM_GIT=y\n')
+        configlines.remove('BR2_KERNEL_HEADERS_CUSTOM_REPO_URL=""\n')
+
+    if 'BR2_KERNEL_HEADERS_CUSTOM_TARBALL=y\n' in configlines and \
+       'BR2_KERNEL_HEADERS_CUSTOM_TARBALL_LOCATION=""\n' in configlines:
+        configlines.remove('BR2_KERNEL_HEADERS_CUSTOM_TARBALL=y\n')
+        configlines.remove('BR2_KERNEL_HEADERS_CUSTOM_TARBALL_LOCATION=""\n')
+
+    if 'BR2_TARGET_AT91BOOTSTRAP3=y\n' in configlines and \
+       'BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG=""\n' in configlines:
+        configlines.remove('BR2_TARGET_AT91BOOTSTRAP3=y\n')
+        configlines.remove('BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG=""\n')
+
+    if 'BR2_TARGET_BAREBOX=y\n' in configlines and \
+       'BR2_TARGET_BAREBOX_USE_CUSTOM_CONFIG=y\n' in configlines and \
+       'BR2_TARGET_BAREBOX_CUSTOM_CONFIG_FILE=""\n' in configlines:
+        configlines.remove('BR2_TARGET_BAREBOX=y\n')
+        configlines.remove('BR2_TARGET_BAREBOX_USE_CUSTOM_CONFIG=y\n')
+        configlines.remove('BR2_TARGET_BAREBOX_CUSTOM_CONFIG_FILE=""\n')
+
+    if 'BR2_TARGET_BAREBOX=y\n' in configlines and \
+       'BR2_TARGET_BAREBOX_USE_DEFCONFIG=y\n' in configlines and \
+       'BR2_TARGET_BAREBOX_BOARD_DEFCONFIG=""\n' in configlines:
+        configlines.remove('BR2_TARGET_BAREBOX=y\n')
+        configlines.remove('BR2_TARGET_BAREBOX_USE_DEFCONFIG=y\n')
+        configlines.remove('BR2_TARGET_BAREBOX_BOARD_DEFCONFIG=""\n')
+
+    if 'BR2_TARGET_OPTEE_OS=y\n' in configlines and \
+       'BR2_TARGET_OPTEE_OS_PLATFORM=""\n' in configlines:
+        configlines.remove('BR2_TARGET_OPTEE_OS=y\n')
+        configlines.remove('BR2_TARGET_OPTEE_OS_PLATFORM=""\n')
+
+    if 'BR2_TARGET_S500_BOOTLOADER=y\n' in configlines and \
+       'BR2_TARGET_S500_BOOTLOADER_BOARD=""\n' in configlines:
+        configlines.remove('BR2_TARGET_S500_BOOTLOADER=y\n')
+        configlines.remove('BR2_TARGET_S500_BOOTLOADER_BOARD=""\n')
+
+    if 'BR2_TARGET_UBOOT=y\n' in configlines and \
+       'BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y\n' in configlines and \
+       'BR2_TARGET_UBOOT_USE_CUSTOM_CONFIG=y\n' in configlines and \
+       'BR2_TARGET_UBOOT_CUSTOM_CONFIG_FILE=""\n' in configlines:
+        configlines.remove('BR2_TARGET_UBOOT=y\n')
+        configlines.remove('BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y\n')
+        configlines.remove('BR2_TARGET_UBOOT_USE_CUSTOM_CONFIG=y\n')
+        configlines.remove('BR2_TARGET_UBOOT_CUSTOM_CONFIG_FILE=""\n')
+
+    if 'BR2_TARGET_UBOOT=y\n' in configlines and \
+       'BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y\n' in configlines and \
+       'BR2_TARGET_UBOOT_USE_DEFCONFIG=y\n' in configlines and \
+       'BR2_TARGET_UBOOT_BOARD_DEFCONFIG=""\n' in configlines:
+        configlines.remove('BR2_TARGET_UBOOT=y\n')
+        configlines.remove('BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y\n')
+        configlines.remove('BR2_TARGET_UBOOT_USE_DEFCONFIG=y\n')
+        configlines.remove('BR2_TARGET_UBOOT_BOARD_DEFCONFIG=""\n')
+
+    if 'BR2_TARGET_UBOOT=y\n' in configlines and \
+       'BR2_TARGET_UBOOT_BUILD_SYSTEM_LEGACY=y\n' in configlines and \
+       'BR2_TARGET_UBOOT_BOARDNAME=""\n' in configlines:
+        configlines.remove('BR2_TARGET_UBOOT=y\n')
+        configlines.remove('BR2_TARGET_UBOOT_BUILD_SYSTEM_LEGACY=y\n')
+        configlines.remove('BR2_TARGET_UBOOT_BOARDNAME=""\n')
+
+    if 'BR2_TOOLCHAIN_EXTERNAL=y\n' in configlines and \
+       'BR2_TOOLCHAIN_EXTERNAL_PREINSTALLED=y\n' in configlines and \
+       'BR2_TOOLCHAIN_EXTERNAL_PATH=""\n' in configlines:
+        configlines.remove('BR2_TOOLCHAIN_EXTERNAL=y\n')
+        configlines.remove('BR2_TOOLCHAIN_EXTERNAL_PREINSTALLED=y\n')
+        configlines.remove('BR2_TOOLCHAIN_EXTERNAL_PATH=""\n')
+        if 'BR2_ARCH_HAS_NO_TOOLCHAIN_BUILDROOT=y\n' in configlines:
+            return False
+
+    if 'BR2_TOOLCHAIN_EXTERNAL=y\n' in configlines and \
+       'BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y\n' in configlines and \
+       'BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y\n' in configlines and \
+       'BR2_TOOLCHAIN_EXTERNAL_URL=""\n' in configlines:
+        configlines.remove('BR2_TOOLCHAIN_EXTERNAL=y\n')
+        configlines.remove('BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y\n')
+        configlines.remove('BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y\n')
+        configlines.remove('BR2_TOOLCHAIN_EXTERNAL_URL=""\n')
+        if 'BR2_ARCH_HAS_NO_TOOLCHAIN_BUILDROOT=y\n' in configlines:
+            return False
+
+    if 'BR2_PACKAGE_XVISOR=y\n' in configlines and \
+       'BR2_PACKAGE_XVISOR_USE_CUSTOM_CONFIG=y\n' in configlines and \
+       'BR2_PACKAGE_XVISOR_CUSTOM_CONFIG_FILE=""\n' in configlines:
+        configlines.remove('BR2_PACKAGE_XVISOR_USE_CUSTOM_CONFIG=y\n')
+        configlines.append('BR2_PACKAGE_XVISOR_USE_DEFCONFIG=y\n')
+        configlines.remove('BR2_PACKAGE_XVISOR_CUSTOM_CONFIG_FILE=""\n')
+
     with open(configfile, "w+") as configf:
         configf.writelines(configlines)
 
@@ -331,11 +517,14 @@ def gen_config(args):
 
     sysinfo = SystemInfo()
 
-    # Select a random toolchain configuration
-    configs = get_toolchain_configs(args.toolchains_csv, args.buildrootdir)
+    if args.toolchains_csv:
+        # Select a random toolchain configuration
+        configs = get_toolchain_configs(args.toolchains_csv, args.buildrootdir)
 
-    i = randint(0, len(configs) - 1)
-    toolchainconfig = configs[i]
+        i = randint(0, len(configs) - 1)
+        toolchainconfig = configs[i]
+    else:
+        toolchainconfig = []
 
     configlines = list(toolchainconfig)
 
@@ -409,7 +598,7 @@ def gen_config(args):
         bounded_loop -= 1
         subprocess.check_call(["make", "O=%s" % args.outputdir, "-C", args.buildrootdir,
                                "KCONFIG_PROBABILITY=%d" % randint(1, 20),
-                               "randpackageconfig"])
+                               "randpackageconfig" if args.toolchains_csv else "randconfig"])
 
         if fixup_config(sysinfo, configfile):
             break
@@ -433,10 +622,18 @@ if __name__ == '__main__':
     parser.add_argument("--buildrootdir", "-b",
                         help="Buildroot directory (relative to current directory)",
                         type=str, default='.')
-    parser.add_argument("--toolchains-csv",
-                        help="Path of the toolchain configuration file",
-                        type=str,
-                        default="support/config-fragments/autobuild/toolchain-configs.csv")
+
+    toolchains_csv = parser.add_mutually_exclusive_group(required=False)
+    toolchains_csv.add_argument("--toolchains-csv",
+                                dest="toolchains_csv",
+                                help="Path of the toolchain configuration file",
+                                type=str)
+    toolchains_csv.add_argument("--no-toolchains-csv",
+                                dest="toolchains_csv",
+                                help="Generate random toolchain configuration",
+                                action='store_false')
+    parser.set_defaults(toolchains_csv="support/config-fragments/autobuild/toolchain-configs.csv")
+
     args = parser.parse_args()
 
     # We need the absolute path to use with O=, because the relative
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
