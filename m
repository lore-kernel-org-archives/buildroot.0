Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D843C433F5
	for <buildroot@archiver.kernel.org>; Tue,  5 Apr 2022 11:50:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 01F5360D90;
	Tue,  5 Apr 2022 11:50:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QHQV6csC9oEQ; Tue,  5 Apr 2022 11:50:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A273560D57;
	Tue,  5 Apr 2022 11:50:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E02521BF847
 for <buildroot@lists.busybox.net>; Tue,  5 Apr 2022 11:50:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DE19081D3D
 for <buildroot@lists.busybox.net>; Tue,  5 Apr 2022 11:50:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xTUc16qQiQ-4 for <buildroot@lists.busybox.net>;
 Tue,  5 Apr 2022 11:50:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [IPv6:2607:f8b0:4864:20::d2f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9A1D381D2D
 for <buildroot@buildroot.org>; Tue,  5 Apr 2022 11:50:43 +0000 (UTC)
Received: by mail-io1-xd2f.google.com with SMTP id h63so14758275iof.12
 for <buildroot@buildroot.org>; Tue, 05 Apr 2022 04:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bDa1BJWzEm6RW/wLpGEwfa3gQzvhrkIHq2eHbP7hSow=;
 b=qahUwDxEokVHYq1QyjIU11DXPHvDPIaMOxskUR4fSQsArWC6Re+MgAo2q8ssAZ4Ua+
 k7jSf4NFTy2bJfRQWaLvXfSnnE1x4LL49ywDYR6AgShrLhf9J3I1NzVHS76bSC1al7Mw
 kPUf/4EfD5yR4PD/njR4qc+65aZJpV4ENTinSnOsZf9WBewY5nbnsrmeOUqFx/vyertR
 Oyq1QdPnuiannyruljwrQU7PV+tr8Mn+Uv8koxTRI34s2cRCDCcZ6xU3xmebnCcSWbf1
 Sl92p/TrISqTFl/n/fjl6hnpybTxh0f4ogWtqm2ItI//JKpUvqiQ2tYjkj6BXRvtfBTv
 lSSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bDa1BJWzEm6RW/wLpGEwfa3gQzvhrkIHq2eHbP7hSow=;
 b=RC1bMglu/vFyWsql4Hn9WlT/fZFiubWoAUobF5szd/RTzV123r4lJmMR+3FpGqv7YG
 qoN1pzto5tApfcCVx1US3mkgdwp4Uzj+Jm6N8UtXNBUAo3JDeUNysrR9eZhSJtzMmALb
 mnnneF3PHbQLbduAYYQMGh+/qva85TaOgjko8vBI7ur0/mlEDnjI7Ntp+hVvRhsiRsee
 2yfxapRsI/NML6dwwgzoRIGkQQObacL1XNUuGoSSapKCTUB/F59HU6kg9DrncIENK+2r
 qcZrhHj2/d8A07mS5LzsCe8FsowPgpayG8Zuk83WIjOSA6gzbPKQRQVSzhRtDd0/DJ67
 MP1w==
X-Gm-Message-State: AOAM530BtIHsf2d5LWo7gw95TYS2Fb+1mkeScQoueEMnHrm89bHB6IWx
 VKmgYSaWZBUwNI8DFfDcTAiWZjmkA5B1Cg==
X-Google-Smtp-Source: ABdhPJwqc8hcLZkaSy0axCn/FfjNQ3HzNwI0N2qp6Vt/6Il1Gb5EXwUOsOPF2KkUpOY3RvIuznkGVg==
X-Received: by 2002:a5d:9318:0:b0:649:a18:dab8 with SMTP id
 l24-20020a5d9318000000b006490a18dab8mr1561148ion.96.1649159442360; 
 Tue, 05 Apr 2022 04:50:42 -0700 (PDT)
Received: from james-x399.localdomain (71-218-122-133.hlrn.qwest.net.
 [71.218.122.133]) by smtp.gmail.com with ESMTPSA id
 j9-20020a926e09000000b002c9f3388cd4sm7382357ilc.21.2022.04.05.04.50.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Apr 2022 04:50:41 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  5 Apr 2022 05:50:40 -0600
Message-Id: <20220405115040.3779242-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v4 1/1] utils/genrandconfig: add randconfig
 based --no-toolchains-csv option
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Currently we only test a limited set of toolchains that are mostly
prebuilt, add a flag to allow using randconfig for randomizing
additional toolchain settings instead of randpackageconfig.

To avoid invalid configs we need to add additional config validation
filtering and fixups.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v3 -> v4:
  - use fixup_config instead of other retries to filter bad configs
Changes v2 -> v3:
  - properly check exit codes
Changes v1 -> v2:
  - refactor fixup_config control flow
---
 utils/genrandconfig | 215 ++++++++++++++++++++++++++++++++++++++++++--
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
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
