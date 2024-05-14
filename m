Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7F2AC04FFE
	for <buildroot@archiver.kernel.org>; Tue, 14 May 2024 15:49:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 955898188B;
	Tue, 14 May 2024 15:49:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WEK-Quq52ME3; Tue, 14 May 2024 15:49:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7AAA9818D4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7AAA9818D4;
	Tue, 14 May 2024 15:49:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4FBEB1BF4DB
 for <buildroot@lists.busybox.net>; Tue, 14 May 2024 15:49:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 49FB3404B1
 for <buildroot@lists.busybox.net>; Tue, 14 May 2024 15:49:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IFluHNJn2yiA for <buildroot@lists.busybox.net>;
 Tue, 14 May 2024 15:49:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3E06E402E4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3E06E402E4
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3E06E402E4
 for <buildroot@buildroot.org>; Tue, 14 May 2024 15:49:22 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 01EF913F8D7;
 Tue, 14 May 2024 17:49:15 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 14 May 2024 17:49:14 +0200
Date: Tue, 14 May 2024 17:49:14 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: marleen.vos@essensium.com
Message-ID: <ZkOH-mlXOt42gkGG@landeda>
References: <20240514101244.1067520-1-marleen.vos@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240514101244.1067520-1-marleen.vos@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1715701759;
 bh=92FYqrNPeyVsCGm1jbEBkmJJ9IhjL1ae8Y3Cj8m3h0k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gZzdo3DYAJFD4YPQvQF1tdXLACAt8X03qn3Y6W4lTrKc9AZbm2y8/4jvJkZKyA5iS
 DNaj9T9szMSR8A49zdGkfeMDAWBFc6WZ0E0begPYiz4g7qZ6ojGeSv0KIrzpFqwLLD
 gtyfTRQK3zRjMXe/PTfHddL8vjLbZVcBQUqIppmV+FgC29GnRuKvuZqMG965bvmoPg
 zVSBBR+KY2aaMisLshScInCfbVJU61hjWP/1WS2lKbWHwov0nD/FXXdPlRVQu0bsId
 4rDIPGTIqSJ9T4+B9M0pMsFCmH2yprT5pXH5yQ3FPI7lIEr8ZPBr/6nHS9EzpjOBRx
 DRZJDcV8yCEFQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=gZzdo3DY
Subject: Re: [Buildroot] [PATCH 1/1] configs/avenger96_defconfig: fix CI
 build error due to a missing package for uboot
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
Cc: Marleen Vos <marleen.vos@mind.be>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Marleen, All,

On 2024-05-14 12:12 +0200, Marleen Vos via buildroot spake thusly:
> From: Marleen Vos <marleen.vos@mind.be>
> 
> This refers to https://gitlab.com/buildroot.org/buildroot/-/jobs/6813124907
> The build error referenced in that link is:
> 
> error: command 'swig' failed: No such file or directory
> make[4]: *** [scripts/dtc/pylibfdt/Makefile:33: rebuild] Error 1
> make[3]: *** [scripts/Makefile.build:397: scripts/dtc/pylibfdt] Error 2
> make[2]: *** [Makefile:2014: scripts_dtc] Error 2
> make[1]: *** [package/pkg-generic.mk:283: /builds/buildroot.org/buildroot/output/build/uboot-2024.01/.stamp_built] Error 2
> make: *** [Makefile:82: _all] Error 2
> 
> BR2_TARGET_UBOOT_NEEDS_PYLIBFDT is added to the avenger96_defconfig in order to resolve the issue
> 
> Signed-off-by: Marleen Vos <marleen.vos@mind.be>

Applied to master, thanks.

While you're looking at this defconfig, could look into adding hashes
for the custom versions it uses? See for example:
    5efa5e9023 configs/armadeus_apf27: add hashes for Linux/U-Boot

Regards,
Yann E. MORIN.

> ---
>  configs/avenger96_defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/configs/avenger96_defconfig b/configs/avenger96_defconfig
> index f73b654dc8..64cfb3c2b0 100644
> --- a/configs/avenger96_defconfig
> +++ b/configs/avenger96_defconfig
> @@ -47,6 +47,7 @@ BR2_TARGET_UBOOT_FORMAT_DTB=y
>  BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
>  BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-nodtb.bin"
>  BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=stm32mp15xx-dhcor-avenger96"
> +BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
>  
>  # Additional tools
>  BR2_PACKAGE_HOST_GENIMAGE=y
> -- 
> 2.34.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
