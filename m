Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B43DC67861
	for <buildroot@archiver.kernel.org>; Tue,  9 Apr 2024 20:51:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 147E260E45;
	Tue,  9 Apr 2024 20:51:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Bn9Ihb0bw0P7; Tue,  9 Apr 2024 20:51:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4578660E8F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4578660E8F;
	Tue,  9 Apr 2024 20:51:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 121471BF3A4
 for <buildroot@lists.busybox.net>; Tue,  9 Apr 2024 20:50:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6B53940647
 for <buildroot@lists.busybox.net>; Tue,  9 Apr 2024 20:50:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d-GrHg-5jsxR for <buildroot@lists.busybox.net>;
 Tue,  9 Apr 2024 20:50:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0F36040637
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0F36040637
 for <buildroot@buildroot.org>; Tue,  9 Apr 2024 20:50:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EC86F85E31; Tue,  9 Apr 2024 20:50:29 +0000 (UTC)
From: Romain Naour <romain.naour@smile.fr>
To: buildroot@buildroot.org
Date: Tue, 9 Apr 2024 14:11:50 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6439a10e98523281c0f9be670bf9dd605a367025
X-Git-Newrev: 0059e3c5556d3deeef6387e2192476160d551bc7
X-Patchwork-Hint: ignore
Message-Id: <20240409205029.EC86F85E31@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/ti_am62x_sk_defconfig: bump U-Boot
 version to 2024.01
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
Content-Type: multipart/mixed; boundary="===============3982388730779143634=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3982388730779143634==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=0059e3c5556d3deeef6387e2192476160d551bc7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The 2024.01 version of U-Boot for the am62x-sk board has introduced two
major changes:
- The device tree k3-am625-sk.dtb is no longer searched in /boot, but in
  /boot/dtb/ti. Hence, the disabling of BR2_LINUX_KERNEL_INSTALL_TARGET
  and the use of extlinux.conf for the proper loading of the device tree.
  Furthermore, the parameter BR2_ROOTFS_POST_SCRIPT_ARGS was used to
  auto-generate the extlinux.conf file so that developers can change the
  kernel loading options by modifying the .config.
- U-Boot is capable of building tiboot3.bin using Binman. So it's no longer
  necessary to use custom tools like ti-k3-image-gen.
- Use a custom tiboot3.bin since the default is "hs-fs",
  but the ti_am62x_sk_defconfig expect the "gp" one

Tested on SK-AM62B-P1.

Tested-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
Tested-by: Michael Trimarchi <michael@amarulasolutions.com>
Tested-by: Andreas Dannenberg <dannenberg@ti.com>
Tested-by: Gero Schwäricke <gero.schwaericke@grandcentrix.net>
Tested-by: Bryan Brattlof <bb@ti.com>
Reviewed-by: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 board/ti/am62x-sk/genimage.cfg                     |  7 ++-
 .../patches/ti-k3-r5-loader/ti-k3-r5-loader.hash   |  2 +-
 board/ti/am62x-sk/post-build.sh                    | 54 ++++++++++++++++++++++
 configs/ti_am62x_sk_defconfig                      | 14 +++---
 4 files changed, 69 insertions(+), 8 deletions(-)

diff --git a/board/ti/am62x-sk/genimage.cfg b/board/ti/am62x-sk/genimage.cfg
index 26304fe98f..398209f4d8 100644
--- a/board/ti/am62x-sk/genimage.cfg
+++ b/board/ti/am62x-sk/genimage.cfg
@@ -4,10 +4,15 @@ image boot.vfat {
 			"tiboot3.bin",
 			"tispl.bin",
 			"u-boot.img",
+			"k3-am625-sk.dtb",
+			"Image"
+		}
+		file extlinux/extlinux.conf {
+			image = extlinux.conf
 		}
 	}
 
-	size = 16M
+	size = 64M
 }
 
 image sdcard.img {
diff --git a/board/ti/am62x-sk/patches/ti-k3-r5-loader/ti-k3-r5-loader.hash b/board/ti/am62x-sk/patches/ti-k3-r5-loader/ti-k3-r5-loader.hash
index 2a5c99c459..0e171c56f5 100644
--- a/board/ti/am62x-sk/patches/ti-k3-r5-loader/ti-k3-r5-loader.hash
+++ b/board/ti/am62x-sk/patches/ti-k3-r5-loader/ti-k3-r5-loader.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256  50b4482a505bc281ba8470c399a3c26e145e29b23500bc35c50debd7fa46bdf8  u-boot-2022.10.tar.bz2
+sha256  b99611f1ed237bf3541bdc8434b68c96a6e05967061f992443cb30aabebef5b3  u-boot-2024.01.tar.bz2
diff --git a/board/ti/am62x-sk/post-build.sh b/board/ti/am62x-sk/post-build.sh
new file mode 100755
index 0000000000..4f19f4d6cf
--- /dev/null
+++ b/board/ti/am62x-sk/post-build.sh
@@ -0,0 +1,54 @@
+#!/bin/sh -x
+
+# genimage will need to find the extlinux.conf
+# in the binaries directory
+
+die() {
+  cat <<EOF >&2
+Error: $@
+
+Usage: ${0} -c <console> -r <root> [-x <extra-args>]
+EOF
+  exit 1
+}
+
+o='c:d:r:x:'
+O='console:,devicetree:,root:,extra-args:'
+opts="$(getopt -n "${0##*/}" -o "${o}" -l "${O}" -- "${@}")"
+eval set -- "${opts}"
+while [ ${#} -gt 0 ]; do
+    case "${1}" in
+    (-c|--console)
+        CONSOLE="${2}"; shift 2
+        ;;
+    (-d|--devicetree)
+        DEVICETREE="${2}"; shift 2
+        ;;
+    (-r|--root)
+        ROOT="${2}"; shift 2
+        ;;
+    (-x|--extra-args)
+        EXTRA_ARGS="${2}"; shift 2
+        ;;
+    (--)
+        shift 1; break
+        ;;
+    esac
+done
+
+[ -n "${CONSOLE}" ] || die "Missing \`console' argument"
+[ -n "${DEVICETREE}" ] || die "Missing \`devicetree' argument"
+[ -n "${ROOT}" ] || die "Missing \`root' argument"
+append="console=${CONSOLE} root=${ROOT} rw rootfstype=ext4 rootwait"
+if [ -n "${EXTRA_ARGS}" ]; then
+    append="${append} ${EXTRA_ARGS}"
+fi
+
+mkdir -p "${BINARIES_DIR}"
+cat <<-__HEADER_EOF > "${BINARIES_DIR}/extlinux.conf"
+	label am62x-sk-buildroot
+	  kernel /Image
+	  fdtdir /
+	  devicetree /${DEVICETREE}
+	  append ${append}
+	__HEADER_EOF
diff --git a/configs/ti_am62x_sk_defconfig b/configs/ti_am62x_sk_defconfig
index b2814526bb..7a411ed423 100644
--- a/configs/ti_am62x_sk_defconfig
+++ b/configs/ti_am62x_sk_defconfig
@@ -1,15 +1,16 @@
 BR2_aarch64=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_4=y
 BR2_GLOBAL_PATCH_DIR="board/ti/am62x-sk/patches"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/ti/am62x-sk/post-build.sh"
+BR2_ROOTFS_POST_BUILD_SCRIPT_ARGS="-c ttyS2,115200n8 -d k3-am625-sk.dtb -r /dev/mmcblk1p2 -x earlycon=ns16550a,mmio32,0x02800000"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
-BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/ti/am62x-sk/genimage.cfg"
+BR2_ROOTFS_POST_IMAGE_SCRIPT_ARGS="-c board/ti/am62x-sk/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.4.16"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="ti/k3-am625-sk"
-BR2_LINUX_KERNEL_INSTALL_TARGET=y
 BR2_PACKAGE_LINUX_FIRMWARE=y
 BR2_PACKAGE_LINUX_FIRMWARE_TI_WL18XX=y
 BR2_TARGET_ROOTFS_EXT2=y
@@ -23,21 +24,22 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_TARGET_BOARD="lite"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL32_OPTEE=y
 BR2_TARGET_OPTEE_OS=y
 BR2_TARGET_OPTEE_OS_PLATFORM="k3-am62x"
-BR2_TARGET_TI_K3_IMAGE_GEN=y
-BR2_TARGET_TI_K3_IMAGE_GEN_SOC_AM62X=y
 BR2_TARGET_TI_K3_R5_LOADER=y
 BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION=y
-BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION_VALUE="2022.10"
+BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION_VALUE="2024.01"
 BR2_TARGET_TI_K3_R5_LOADER_BOARD_DEFCONFIG="am62x_evm_r5"
+BR2_TARGET_TI_K3_R5_LOADER_TIBOOT3_BIN="tiboot3-am62x-gp-evm.bin"
+BR2_TARGET_TI_K3_R5_LOADER_USE_BINMAN=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2022.10"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.01"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="am62x_evm_a53"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
 BR2_TARGET_UBOOT_NEEDS_TI_K3_BOOT_FIRMWARE=y
+BR2_TARGET_UBOOT_USE_BINMAN=y
 # BR2_TARGET_UBOOT_FORMAT_BIN is not set
 BR2_TARGET_UBOOT_FORMAT_IMG=y
 BR2_TARGET_UBOOT_SPL=y

--===============3982388730779143634==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3982388730779143634==--
