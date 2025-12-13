Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91ACFD5B165
	for <buildroot@archiver.kernel.org>; Sat, 13 Dec 2025 20:46:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4FC5D403A4;
	Sat, 13 Dec 2025 20:46:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RmJ4J0mLoXLZ; Sat, 13 Dec 2025 20:46:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 696C4403AA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765658772;
	bh=QCK8mAowF0XBgRd7acxxz5Odw3Z5kyz00D/OYA8FaQ8=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Dqd1oamE85nUrPAtYaOPsFW7MxKb7E3TWLjQg0XMc61EKuVf7NfRnwEtsQ9cskoUD
	 y0hOUy6VQwyrrPi6pAqu+Sy3u6UqNysuRJfLfycKAYk7rGsMmI1c8xpgeGUZcmf7N+
	 0WDg4PnjyqhT0Q9jghfYsYELZDs9BUbyuiHDqVHy7svEc2GCn7CsrfnItzdIj59KKu
	 Z0FS4BWEC36Q6wckjhTeo1GSsA9XFTgoy88B6zEw89Jz6pHHXqkgIgNrGV9ke1zqbi
	 GDjgAIypQYBasROAWsiYWDxF9r+F9Yv40PtWhEJItG2clEYskAGZIx8eFc2DwRTiMi
	 gt1uYM1FYp7tw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 696C4403AA;
	Sat, 13 Dec 2025 20:46:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id C7AE52C1
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 20:46:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B9A86608A5
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 20:46:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QN9dFnBFoLIt for <buildroot@buildroot.org>;
 Sat, 13 Dec 2025 20:46:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B69B6607ED
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B69B6607ED
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B69B6607ED
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 20:46:09 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id AE376780333;
 Sat, 13 Dec 2025 21:46:01 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 13 Dec 2025 21:46:01 +0100
MIME-Version: 1.0
Date: Sat, 13 Dec 2025 21:46:01 +0100
To: Kory Maincent <kory.maincent@bootlin.com>
Cc: buildroot@buildroot.org, Bryan Brattlof <bb@ti.com>, Bajjuri Praneeth
 <praneeth@ti.com>, Lothar Felten <lothar.felten@gmail.com>,
 thomas.petazzoni@bootlin.com
In-Reply-To: <20251212162053.883682-2-kory.maincent@bootlin.com>
References: <20251212162053.883682-1-kory.maincent@bootlin.com>
 <20251212162053.883682-2-kory.maincent@bootlin.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <83449352760f5935309de9759b56c1fb@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1765658767;
 bh=uE3DCp+x7lXMVKFWUgGKqICAVdf7kwpx3i0VU+UijfM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=BFG26EdqhD7PeeE/5dK5KF7sjpHJnImhMOi74xQd25JWvEeNVhIJgMl2rzHv8Ig1K
 hCWPG/AOl3Wxsxrtnb4Yg11K7MSMF7pD1Gng9M3uz43QY0/xQHY8po9dJzh93mJAcQ
 PqvmUDadRBevoQ/Atkoj1dKn2NoYdj+Y5izp+4N4ge4IPzktLb9R5mVOIBYV7UMG9d
 LP6LXUUKbDlu1N1blFfhCO6anyYSJuQ/wHhZEqVhg0QVxiq8tONp8UL/qtW4t4nd6W
 noldwhRw7LPBcuuk8MtU0WcLs5Rz2LF2g6NL7FVgoJUDvwf6iUviBguAUXdkk2FKnV
 /4gM7UXCcJXjg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=BFG26Edq
Subject: Re: [Buildroot] [PATCH v2 1/2] configs/beaglebone: Bump to Linux
 mainline 6.18
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Kory,

Thanks for the patch!  I have few comments, see below.

On 12/12/2025 17:20, Kory Maincent via buildroot wrote:
> From: "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>
> 
> Bumps the Linux kernel to the latest 6.18 mainline version.
> 
> Tested on BeagleBone Black.
> 
> Signed-off-by: Kory Maincent (TI.com) <kory.maincent@bootlin.com>
> ---
> 
> Change in v2:
> - Use a specific Linux version.
> ---
[...]
> diff --git a/configs/beaglebone_defconfig 
> b/configs/beaglebone_defconfig
> index 86bf6bce9a..e0fc8968ba 100644
> --- a/configs/beaglebone_defconfig
> +++ b/configs/beaglebone_defconfig
> @@ -1,7 +1,7 @@
>  BR2_arm=y
>  BR2_cortex_a8=y
>  BR2_ARM_FPU_VFPV3=y
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_18=y

We are trying to switch most defconfigs to use Bootlin external
glibc toolchains. See:
https://elinux.org/Buildroot:DeveloperDaysELCE2024#Rules_for_defconfigs
(I know, this policy is still not included in the documentation).

So this "BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_18=y" line should be
removed, and you should just have instead:

BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_GLIBC_STABLE=y

See for example:
https://gitlab.com/buildroot.org/buildroot/-/commit/331d80f52e4912b422a2de27c9c0528923862e46

>  BR2_GLOBAL_PATCH_DIR="board/beagleboard/beaglebone/patches"
>  BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
>  BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
> @@ -9,9 +9,10 @@ 
> BR2_ROOTFS_POST_BUILD_SCRIPT="board/beagleboard/beaglebone/post-build.sh"
>  BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
>  BR2_ROOTFS_POST_SCRIPT_ARGS="-c 
> board/beagleboard/beaglebone/genimage.cfg"
>  BR2_LINUX_KERNEL=y
> -BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call 
> github,beagleboard,linux,6.12.34-ti-arm32-r12)/linux-6.12.34-ti-arm32-r12.tar.gz"
> -BR2_LINUX_KERNEL_DEFCONFIG="bb.org"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18"

If you bump the kernel version here, and this defconfig has
BR2_DOWNLOAD_FORCE_CHECK_HASHES=y, you should also update the custom
hash in board/beagleboard/beaglebone/patches/linux/linux.hash.

It probably worked when you tested because Buildroot had 6.18 hash
in linux/linux.hash, but now Buildroot bumped to 6.18.1 with
https://gitlab.com/buildroot.org/buildroot/-/commit/dc7eb6bf08d2293fc47f5f43d16d377758e9788a
the hash check is now failing.

While at it, you could already update to 6.18.1 or later.

So your custom hash should look like, for example:
https://gitlab.com/buildroot.org/buildroot/-/blob/master/board/arm/fvp-ebbr/patches/linux/linux.hash

> +BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
> +BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/ti/common/am335x/linux.config"
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
>  BR2_LINUX_KERNEL_INTREE_DTS_NAME="ti/omap/am335x-evm 
> ti/omap/am335x-bone ti/omap/am335x-boneblack ti/omap/am335x-bonegreen 
> ti/omap/am335x-evmsk ti/omap/am335x-boneblue 
> ti/omap/am335x-boneblack-wireless ti/omap/am335x-bonegreen-wireless"
>  BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
> --
> 2.43.0

Could you send an updated patch fixing the custom hash file and
switching to Bootlin external toolchain, please?

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
