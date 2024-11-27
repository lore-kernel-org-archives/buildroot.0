Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44DBCD6D242
	for <buildroot@archiver.kernel.org>; Wed, 27 Nov 2024 21:58:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 986324249E;
	Wed, 27 Nov 2024 21:58:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G2kyEY9YM7IX; Wed, 27 Nov 2024 21:58:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5BC4B41EA2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5BC4B41EA2;
	Wed, 27 Nov 2024 21:58:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id BC7B6712
 for <buildroot@buildroot.org>; Wed, 27 Nov 2024 21:58:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 98A8941EA2
 for <buildroot@buildroot.org>; Wed, 27 Nov 2024 21:58:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lsQj8SJ0puMq for <buildroot@buildroot.org>;
 Wed, 27 Nov 2024 21:58:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4150840B40
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4150840B40
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4150840B40
 for <buildroot@buildroot.org>; Wed, 27 Nov 2024 21:58:54 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 2C85319F574;
 Wed, 27 Nov 2024 22:58:49 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:50936])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 27 Nov 2024 22:58:49 +0100
MIME-Version: 1.0
Date: Wed, 27 Nov 2024 22:58:49 +0100
From: Julien Olivain <ju.o@free.fr>
To: Andy Yan <andyshrk@163.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20241127032336.345826-1-andyshrk@163.com>
References: <20241127032336.345826-1-andyshrk@163.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <8acb5897b8fc142d1e91cf5e68bfb378@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1732744731;
 bh=xNbTpLcM/+oOg7suo9XsQD//43E+veUQUZdCNm7T9dY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=nUuo/rNuGeld3Eg3KfjESlgbnm3kDEU9ItmIRSHNO7+8dwvY6XnuVUtJYw5Af/dnM
 zdnTiM4XoKCgFMCcE746n3/E/YQMmCl3N14ePFV/PKu010jBKoqDNlUqAuMkKJC21E
 NvVh3aMIYB/zvhkBlrL1WlwTY4Rsg4o+fLNkHBYsetc8+yxk8g6yIpJCYmUDoRC5TF
 grtiPT3PfDlfXwYRp9EEd3QpkPNxa6W5y9D2aZR7QdysMgcL36ZOpg6eyL7H3PEqre
 /3Lcec3gmzv67MddDRaaePAJ0GNfeXAM3JAdX/yyXEqL9GpswjBkbGAguOXfcQYLVV
 Oz/2++dJIfQTQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=nUuo/rNu
Subject: Re: [Buildroot] [PATCH] configs/rock5b_defconfig: Increase the
 filesystem size to 512MB
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Andy,

On 27/11/2024 04:23, Andy Yan wrote:
> The current 250MB filesystem size is not enough which will casue
> failure like bellow:
> 
> Copying files into the device: __populate_fs: Could not allocate block
> in ext2 filesystem while writing file "libharfbuzz-subset.so.0.60900.0"
> mkfs.ext4: Could not allocate block in ext2 filesystem while populating
> file system
> *** Maybe you need to increase the filesystem size
> (BR2_TARGET_ROOTFS_EXT2_SIZE)

Building this defconfig with the commands:

     make rock5b_defconfig
     make

succeed. See for example:
https://gitlab.com/buildroot.org/buildroot/-/jobs/8429067667

The filesystem size is usually increased when the defconfig is
no longer building (without adding packages). So if you get the
build error when adding packages to your config, you should increase
the filesystem size to the right size for your project.


> Signed-off-by: Andy Yan <andyshrk@163.com>
> ---
>  configs/rock5b_defconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/configs/rock5b_defconfig b/configs/rock5b_defconfig
> index 38b5aad206..43710b6545 100644
> --- a/configs/rock5b_defconfig
> +++ b/configs/rock5b_defconfig
> @@ -28,7 +28,7 @@ 
> BR2_PACKAGE_ROCKCHIP_RKBIN_TPL_FILENAME="bin/rk35/rk3588_ddr_lp4_2112MHz_lp5_273
>  
> BR2_PACKAGE_ROCKCHIP_RKBIN_BL31_FILENAME="bin/rk35/rk3588_bl31_v1.40.elf"
>  BR2_TARGET_ROOTFS_EXT2=y
>  BR2_TARGET_ROOTFS_EXT2_4=y
> -BR2_TARGET_ROOTFS_EXT2_SIZE="250M"
> +BR2_TARGET_ROOTFS_EXT2_SIZE="512M"
>  BR2_TARGET_UBOOT=y
>  BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
>  BR2_TARGET_UBOOT_CUSTOM_VERSION=y
> --
> 2.34.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
