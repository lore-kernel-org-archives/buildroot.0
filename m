Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74931CFD2F6
	for <buildroot@archiver.kernel.org>; Thu, 27 Nov 2025 20:20:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4D4B641425;
	Thu, 27 Nov 2025 20:20:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XoJfz6l2nQAa; Thu, 27 Nov 2025 20:20:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5A82F4142C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5A82F4142C;
	Thu, 27 Nov 2025 20:20:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6FA6D2A9
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 20:20:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5541E404CD
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 20:20:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IacEXtLAXuW9 for <buildroot@buildroot.org>;
 Thu, 27 Nov 2025 20:20:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org DAF854023A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DAF854023A
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DAF854023A
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 20:20:30 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 3F21AB0055E;
 Thu, 27 Nov 2025 21:20:26 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 27 Nov 2025 21:20:26 +0100
MIME-Version: 1.0
Date: Thu, 27 Nov 2025 21:20:26 +0100
To: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Cc: buildroot@buildroot.org, Jagan Teki <jagan@amarulasolutions.com>
In-Reply-To: <DEI4H0M1QWOY.36P256HMM50FO@bootlin.com>
References: <20251104200833.4095436-1-ju.o@free.fr>
 <DEI4H0M1QWOY.36P256HMM50FO@bootlin.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <d5d9cd7fbcb463132a1c5998d530b916@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1764274828;
 bh=lQv3Q2vwaRz+wqxu3QekOhlhdTqai16soC9b7TKN9VQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ANGq1y12UsVCn2XIhAwGOoiopX78EHfAN6i2VNlhFXIAvXeVlxBJ0XkRMhLxuGDrL
 bmlRJsL1hk+RcJQiNV11TZyBMOHTRMKKZf+aLI/EYvXmZxEPWBNRIItcJQWbtEdCtS
 Nl9lsxNfYEIkEwcibQEYh+9+/yoT/PGWjuoUF1cU0nCUUqOgZjaZLBgJwBjMTPkjcz
 37i4jAeCKMt8UG8OMQQZYpc76SPu2iPCZPrErrppubZiYwW/RIOkZcwm6nPb6oLmXA
 dkXi7PHBpCVrBH7G91yqkzc9R7SbOA2U4ndR7umfR+LpiH9UKrGX1ES0/pRAlyxcRV
 3coptowZtVGOw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ANGq1y12
Subject: Re: [Buildroot] [PATCH 1/1] configs/pine64_star64: update to latest
 upstream uboot and LTS kernel
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

Hi Thomas,

On 25/11/2025 23:17, Thomas Bonnefille wrote:
> Hello Julien,
> 
>> Since Buildroot commit [1] "package/gcc: switch to GCC 14.x as the
>> default", pine64_star64_defconfig compilation is failing in
>> u-boot with error:
>> 
>>     drivers/video/dw_hdmi.c: In function 'dw_hdmi_write':
>>     drivers/video/dw_hdmi.c:81:42: error: passing argument 2 of 
>> 'writeb' makes pointer from integer without a cast [-Wint-conversion]
>> 
>> See build failure [2].
>> 
>> Upstream U-Boot includes a support for this board since commit [3],
>> first included in v2024.07.
>> Upstream Kernel includes a support for this board since commit [4],
>> first included in v6.11.
>> 
>> This commit switches uboot and linux from the repository
>> https://github.com/Fishwaldo
>> to their respective upstream sources.
>> 
>> U-Boot is updated from the fork from a v2021.10 base to v2025.10.
>> The Linux Kernel is updated from the fork from a v5.15.131 base
>> to v6.12.56.
>> 
>> While at it, this commit updates the defconfig to the new convention:
>> - It adds custom hashes and enables BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
>> - It switches to a glibc stable bootlin external toolchain
>> 
>> Note that the upstream uboot defconfig name for the pine64 star64
>> board is starfive_visionfive2 (which is in fact another, but very
>> similar board). The detection of the board is made inside the SPL.
>> See [5].
>> 
>> Finally, switching to upstream uboot and kernel required few
>> adjustments:
>> - The genimage.cfg is updated to use the "u-boot.itb" file produced by
>>   U-Boot,
>> - In genimage.cfg, the uboot partition-type-uuid is changed to
>>   xbootldr (the genimage human readable name), to follow the
>>   recommendation of the UUID to use from [5],
>> - In extlinux.conf, rootwait is added in kernel arguments,
>> - The post-build.sh script and the star64-uboot-fit-image.its file
>>   are removed: they are no longer needed, since U-Boot and Binman
>>   are managing everything,
>> - BR2_TARGET_UBOOT_SPL_NAME is updated in the defconfig, to reflect
>>   the file name generated by U-Boot,
>> - BR2_PACKAGE_HOST_STARFIVE_SPLTOOL is removed from the defconfig,
>>   it is no longer needed, since upstream U-Boot produces the file
>>   at the correct format,
>> - BR2_PACKAGE_HOST_UBOOT_TOOLS is also removed from the defconfig,
>>   it is no longer needed since U-Boot uses Binman,
>> - the defconfig is updated to include the new uboot requirements
>>   (BR2_TARGET_UBOOT_{NEEDS,USE}_*),
>> - the pine64_star64_defconfig entry is removed from 
>> .checkpackageignore
>>   it is no longer needed.
>> 
>> This patch was tested on a Pine64 Star64 board V1.1,
>> PCB revision: 0xc1, BOM revision: A.
>> 
>> Fixes:
>> - [2]
>> 
>> [1] 
>> https://gitlab.com/buildroot.org/buildroot/-/commit/1e1fafa1f0f5069418e92f702c2a66db6408a634
>> [2] https://gitlab.com/buildroot.org/buildroot/-/jobs/11916952973
>> [3] 
>> https://source.denx.de/u-boot/u-boot/-/commit/7ebf7e77c0616ef0d2f58cc1684c230f656bd3d6
>> [4] 
>> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=2606bf583b9623694b864c220fd6b3d2ed13ba13
>> [5] 
>> https://source.denx.de/u-boot/u-boot/-/blob/v2025.10/doc/board/starfive/pine64_star64.rst
>> 
>> Signed-off-by: Julien Olivain <ju.o@free.fr>
> 
> I had a look at your patch, it looks good to me (and is cleaner than 
> what I
> sent !) :
> 
> Reviewed-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>

Thanks for the review. Even if this patch is a large bump and
we are in a release client, I applied it on master because it
fixes the compilation.

> However my second patch [1] still apply as the only board which was 
> using
> the starfive spl tool in Buildroot was the Star64.
> 
> 1: 
> https://lore.kernel.org/buildroot/20250822-update_star64-v1-2-83fe87fbe8ea@bootlin.com/

Thanks for pointing that out, I apply it too.

> Thank you very much,
> Thomas Bonnefille

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
