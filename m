Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2A1BC3DA7F
	for <buildroot@archiver.kernel.org>; Thu, 15 Aug 2024 17:50:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4FCDB40B9B;
	Thu, 15 Aug 2024 17:50:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1pmUByFdQj_l; Thu, 15 Aug 2024 17:50:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F2F6840C57
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F2F6840C57;
	Thu, 15 Aug 2024 17:50:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5FB621BF475
 for <buildroot@lists.busybox.net>; Thu, 15 Aug 2024 17:50:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4BBB48208F
 for <buildroot@lists.busybox.net>; Thu, 15 Aug 2024 17:50:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h6Ob_v4IF9ry for <buildroot@lists.busybox.net>;
 Thu, 15 Aug 2024 17:50:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 494CA8118E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 494CA8118E
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 494CA8118E
 for <buildroot@buildroot.org>; Thu, 15 Aug 2024 17:50:34 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 4F42B13F861;
 Thu, 15 Aug 2024 19:50:28 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 15 Aug 2024 19:50:27 +0200
Date: Thu, 15 Aug 2024 19:50:27 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Dong Wang <wangdong115@foxmail.com>
Message-ID: <Zr4_46ILTkziZpJU@landeda>
References: <tencent_C2D6061483906AA710B3001B277F4EE62606@qq.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <tencent_C2D6061483906AA710B3001B277F4EE62606@qq.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1723744231;
 bh=xjU8kKm4Iuffp6knnrN8pvryzGL8scDWheF6xXLJbrc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RtmNcheH3mk5TQ+ZUQWO06odXagEcwdxx7zFHakgGipKmE4jyZCt+6nInyWceNe74
 F/bp57KPsY3802kEReb3EknkIv49F09Fw7jKTBEmPs36bK7duB9DqxebgVMkLCeJev
 9p036+B0XX6HmyX9HOoQUt4DvWlG/haxTaEQMuN4RQFkZPxsIQyxt4EkRd1bWAQO+H
 En7QRmd6gwabKEdSAnKOFlcAM7olOwbnaz6VD/ll7809zqS8SH3gBnpxbnDvcnoCzF
 9nwI5dEVuZRreO06te80e7U0oiTJHJc8PBwhyrAOqldC0NoO2NA/PWks3yKsPs4hKW
 6AP0XyXN5nHGA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=RtmNcheH
Subject: Re: [Buildroot] [PATCH next] board/friendlyarm/nanopi-neo: fix
 uboot partition size
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Dong Wang, All,

Thanks for your contribution.

On 2024-08-16 01:28 +0800, Dong Wang spake thusly:
> This patch fixes the wrongly calculated uboot partition size in
> genimage.cfg. The size should be 1016K, which is
> 1MB (typical partition start) - 8K(offset dictated by the bootrom).

It seems you are using an old version of Buildroot, as the defconfig
and board files for nanopi_neo were removed with commit c0a44ba0dfbf
(configs/friendlyarm_nanopi_neo: drop defconfig), in August 2022, two
years ago.

If you are still using nanopi_neo and have access to that board, then
you are welcome to submit it again, of course!

Regards,
Yann E. MORIN.

> Signed-off-by: Dong Wang <wangdong115@foxmail.com>
> ---
>  board/friendlyarm/nanopi-neo/genimage.cfg | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/board/friendlyarm/nanopi-neo/genimage.cfg b/board/friendlyarm/nanopi-neo/genimage.cfg
> index ec78fd0e56..8d6bdd3295 100644
> --- a/board/friendlyarm/nanopi-neo/genimage.cfg
> +++ b/board/friendlyarm/nanopi-neo/genimage.cfg
> @@ -7,7 +7,7 @@ image sdcard.img {
>  		in-partition-table = false
>  		image = "u-boot-sunxi-with-spl.bin"
>  		offset = 8K
> -		size = 1000K # 1MB - 8KB(offset) - 16KB(GPT)
> +		size = 1016K # 1MB - 8KB(offset)
>  	}
>  
>  	partition rootfs {
> -- 
> 2.25.1
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
