From: Michael Walle <michael@walle.cc>
Date: Tue, 12 Jan 2021 11:51:54 +0100
Subject: [Buildroot] [PATCH 2/2] configs/kontron_smarc_sal28: integrate RCW
 into rootfs image
In-Reply-To: <20210112105154.31531-1-michael@walle.cc>
References: <20210112105154.31531-1-michael@walle.cc>
Message-ID: <20210112105154.31531-3-michael@walle.cc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Integrate the RCW into the storage device image, so the image can also
be used a boot source. The SoC expects the RCW at offset 4096 of the SD
card or eMMC.

Signed-off-by: Michael Walle <michael@walle.cc>
---
 board/kontron/smarc-sal28/genimage.cfg | 6 ++++++
 configs/kontron_smarc_sal28_defconfig  | 1 +
 2 files changed, 7 insertions(+)

diff --git a/board/kontron/smarc-sal28/genimage.cfg b/board/kontron/smarc-sal28/genimage.cfg
index d75234d997..f3fb77e00a 100644
--- a/board/kontron/smarc-sal28/genimage.cfg
+++ b/board/kontron/smarc-sal28/genimage.cfg
@@ -3,6 +3,12 @@ image sdcard-emmc.img {
 		gpt = true
 	}
 
+	partition rcw {
+		offset = 4k
+		in-partition-table = "no"
+		image = "rcw.bin"
+	}
+
 	partition u-boot {
 		offset = 1M
 		in-partition-table = "no"
diff --git a/configs/kontron_smarc_sal28_defconfig b/configs/kontron_smarc_sal28_defconfig
index 767858f601..ddc7022886 100644
--- a/configs/kontron_smarc_sal28_defconfig
+++ b/configs/kontron_smarc_sal28_defconfig
@@ -16,6 +16,7 @@ BR2_LINUX_KERNEL_INTREE_DTS_NAME="freescale/fsl-ls1028a-kontron-sl28 freescale/f
 BR2_LINUX_KERNEL_DTB_KEEP_DIRNAME=y
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_PACKAGE_RCW_SMARC_SAL28=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_ROOTFS_EXT2_SIZE="128M"
-- 
2.20.1
