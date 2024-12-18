Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 850C9E77188
	for <buildroot@archiver.kernel.org>; Wed, 18 Dec 2024 19:02:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1F569415DD;
	Wed, 18 Dec 2024 19:02:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PqJGrUczHacx; Wed, 18 Dec 2024 19:01:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B1569415E4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B1569415E4;
	Wed, 18 Dec 2024 19:01:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9203AC0
 for <buildroot@buildroot.org>; Wed, 18 Dec 2024 19:01:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8005880EF4
 for <buildroot@buildroot.org>; Wed, 18 Dec 2024 19:01:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QzAUYohrAz5k for <buildroot@buildroot.org>;
 Wed, 18 Dec 2024 19:01:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4A2AC811B9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4A2AC811B9
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4A2AC811B9
 for <buildroot@buildroot.org>; Wed, 18 Dec 2024 19:01:55 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 30B1A60172;
 Wed, 18 Dec 2024 20:01:44 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:39052])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 18 Dec 2024 20:01:44 +0100
MIME-Version: 1.0
Date: Wed, 18 Dec 2024 20:01:44 +0100
From: Julien Olivain <ju.o@free.fr>
To: Neal Frager <neal.frager@amd.com>
In-Reply-To: <20241218131832.693150-1-neal.frager@amd.com>
References: <20241218131832.693150-1-neal.frager@amd.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <b646a402364b6818caecd4e0a7dda615@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1734548513;
 bh=QWsB8Wh9Nn3NEoN38BAUk9u9IGsW4AvjG/g0Y3dE4sQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=juOX0UyXwoA1WMipSDwxqTs/jDmsc/bjRSnqRmJbgeDNI+u+2RuJcSUV7xDiP6KFt
 jhUoXMF8VzMrhIZGMdy1q+5Mi8m+HUESFQjuo2/3ZF/XyiBG5DgfF+lstv8hcPCdhT
 gUOIqAHl6RqG+30Sv4hIi1CTywpj5ycWVtww7bEpNZwT64Yf5BLw3mKScVKrByMoQd
 /tBkptWcE2TisYMvzk2tdC9aRVk8BPsOwKeXxBBOtn7JAnCiigvQ1AmOLWZlgKCTK5
 WNTF+aQKaJzXEmuUWsd0jQre1K9YGUIfmErR2zlcnElsSehKXj3jtyzd9xc32sf5p0
 2K1xFs022eV3w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=juOX0UyX
Subject: Re: [Buildroot] [PATCH v1 1/1] configs/zynqmp_kria*: fix u-boot
 boot hang
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: luca.ceresoli@bootlin.com, brandon.maier@collins.com,
 thomas.petazzoni@bootlin.com, buildroot@buildroot.org, romain.naour@smile.fr,
 michal.simek@amd.com, yann.morin.1998@free.fr
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 18/12/2024 14:18, Neal Frager wrote:
> If the u-boot DP driver attempts to configure the Kria SOM DP before it 
> is
> released from reset, it will cause a boot hang.  Since the KV260 uses 
> the DP
> by default, this patch needs to be included with buildroot until it is 
> part
> of a u-boot-xlnx release tag.
> 
> While only the KV260 is directly affected, there is no issue with 
> applying
> this patch to all 3 zynqmp_kria defconfigs.
> 
> This patch has also been committed to u-boot upstream.
> 
> Upstream: 
> https://github.com/u-boot/u-boot/commit/8b81010a2fe385524b58bea9116f1b6954c3d2bd
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>

Applied to master, thanks.

> ---
>  ...1-video-zynqmp-add-support-for-reset.patch | 41 +++++++++++++++++++
>  configs/zynqmp_kria_kd240_defconfig           |  2 +-
>  configs/zynqmp_kria_kr260_defconfig           |  2 +-
>  configs/zynqmp_kria_kv260_defconfig           |  2 +-
>  4 files changed, 44 insertions(+), 3 deletions(-)
>  create mode 100644 
> board/zynqmp/kria/patches/uboot/0001-video-zynqmp-add-support-for-reset.patch
> 
> diff --git 
> a/board/zynqmp/kria/patches/uboot/0001-video-zynqmp-add-support-for-reset.patch 
> b/board/zynqmp/kria/patches/uboot/0001-video-zynqmp-add-support-for-reset.patch
> new file mode 100644
> index 0000000000..c6733e05a0
> --- /dev/null
> +++ 
> b/board/zynqmp/kria/patches/uboot/0001-video-zynqmp-add-support-for-reset.patch
> @@ -0,0 +1,41 @@
> +From: Michal Simek <michal.simek@amd.com>
> +Date: Mon, 9 Dec 2024 12:11:50 +0100
> +Subject: [PATCH] video: zynqmp: Add support for reset
> +
> +In Kria SOM configuration DP is under reset and access to DP is 
> causing
> +hang that's why call reset at probe to avoid this situation.
> +
> +Signed-off-by: Michal Simek <michal.simek@amd.com>
> +Link: 
> https://lore.kernel.org/r/0504474a91a9839828aecd37f8855fd154cdf2e1.1733742708.git.michal.simek@amd.com
> +---
> + drivers/video/zynqmp/zynqmp_dpsub.c | 6 ++++++
> + 1 file changed, 6 insertions(+)
> +
> +diff --git a/drivers/video/zynqmp/zynqmp_dpsub.c 
> b/drivers/video/zynqmp/zynqmp_dpsub.c
> +index 76abfeac4433..52af23c3c835 100644
> +--- a/drivers/video/zynqmp/zynqmp_dpsub.c
> ++++ b/drivers/video/zynqmp/zynqmp_dpsub.c
> +@@ -11,6 +11,7 @@
> + #include <dm.h>
> + #include <errno.h>
> + #include <generic-phy.h>
> ++#include <reset.h>
> + #include <stdlib.h>
> + #include <video.h>
> + #include <wait_bit.h>
> +@@ -2093,10 +2094,15 @@ static int zynqmp_dpsub_probe(struct udevice 
> *dev)
> + {
> + 	struct video_priv *uc_priv = dev_get_uclass_priv(dev);
> + 	struct zynqmp_dpsub_priv *priv = dev_get_priv(dev);
> ++	struct reset_ctl_bulk resets;
> + 	struct clk clk;
> + 	int ret;
> + 	int mode = RGBA8888;
> +
> ++	ret = reset_get_bulk(dev, &resets);
> ++	if (!ret)
> ++		reset_deassert_bulk(&resets);
> ++
> + 	ret = clk_get_by_name(dev, "dp_apb_clk", &clk);
> + 	if (ret < 0) {
> + 		dev_err(dev, "failed to get clock\n");
> diff --git a/configs/zynqmp_kria_kd240_defconfig 
> b/configs/zynqmp_kria_kd240_defconfig
> index d47c3e27e5..8e841df2e8 100644
> --- a/configs/zynqmp_kria_kd240_defconfig
> +++ b/configs/zynqmp_kria_kd240_defconfig
> @@ -1,6 +1,6 @@
>  BR2_aarch64=y
>  BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
> -BR2_GLOBAL_PATCH_DIR="board/xilinx/patches"
> +BR2_GLOBAL_PATCH_DIR="board/zynqmp/kria/patches board/xilinx/patches"
>  BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
>  BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynqmp/post-build.sh 
> board/zynqmp/kria/kd240/kd240.sh"
>  BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynqmp/post-image.sh"
> diff --git a/configs/zynqmp_kria_kr260_defconfig 
> b/configs/zynqmp_kria_kr260_defconfig
> index 6f2e88b47e..809cdd0dde 100644
> --- a/configs/zynqmp_kria_kr260_defconfig
> +++ b/configs/zynqmp_kria_kr260_defconfig
> @@ -1,6 +1,6 @@
>  BR2_aarch64=y
>  BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
> -BR2_GLOBAL_PATCH_DIR="board/xilinx/patches"
> +BR2_GLOBAL_PATCH_DIR="board/zynqmp/kria/patches board/xilinx/patches"
>  BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
>  BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynqmp/post-build.sh 
> board/zynqmp/kria/kr260/kr260.sh"
>  BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynqmp/post-image.sh"
> diff --git a/configs/zynqmp_kria_kv260_defconfig 
> b/configs/zynqmp_kria_kv260_defconfig
> index 9aed096e5d..92d44c2b64 100644
> --- a/configs/zynqmp_kria_kv260_defconfig
> +++ b/configs/zynqmp_kria_kv260_defconfig
> @@ -1,6 +1,6 @@
>  BR2_aarch64=y
>  BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
> -BR2_GLOBAL_PATCH_DIR="board/xilinx/patches"
> +BR2_GLOBAL_PATCH_DIR="board/zynqmp/kria/patches board/xilinx/patches"
>  BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
>  BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynqmp/post-build.sh 
> board/zynqmp/kria/kv260/kv260.sh"
>  BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynqmp/post-image.sh"
> --
> 2.25.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
