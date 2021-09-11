Return-Path: <SRS0=HL2s=OB=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB644C433F5
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 19:53:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6490E61039
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 19:53:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6490E61039
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2BB40608CC;
	Sat, 11 Sep 2021 19:53:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sG5IZfj1ddsK; Sat, 11 Sep 2021 19:53:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9B12460804;
	Sat, 11 Sep 2021 19:53:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9AC491BF285
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 19:53:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8A3F740437
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 19:53:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CLApbxwn9sJx for <buildroot@lists.busybox.net>;
 Sat, 11 Sep 2021 19:53:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B899440426
 for <buildroot@buildroot.org>; Sat, 11 Sep 2021 19:53:32 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:6c4a:f4f1:e14a:6e93])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id AC5ECB004E8;
 Sat, 11 Sep 2021 21:53:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1631390010;
 bh=lHugnCVAlhwAAcW9g6Y0lpxTSDCkOVuRCFFDH6kjT9Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=itSommxSpC98CgsLiIkNe8fEykukRHbhvpTQxab99b0MXeQ28CxzOkNMfSXXTnsiv
 A7UAXXfHQr+s4RHIrxKA1xXO7nUv/y3yuKRF6xvjrxwZCxjDo13cKab0G6vcGLnaFU
 1JyxbfpfUlGd6kYkMUZFAkRF5wgrtxJtD/CbrJ5p6bnRiRRx6LlIoYZjniEp4SfDJt
 lkpnS+OX1n2oqVMjdcyCv1RQrn65fFFU4GmjOFtb1D/M4+UiD1tKRrqn0shDrzeVSc
 qkCgaxpELEiEN518hp9xy38hE0z3eEKozaHtioje7wkWb8GrmiTNMEiuqhoa+FjVPy
 SGrSRjo9CrbQg==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 11 Sep 2021 21:53:26 +0200
Date: Sat, 11 Sep 2021 21:53:26 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Dagg Stompler <daggs@gmx.com>
Message-ID: <20210911195326.GW1053080@scaer>
References: <20210911162515.29022-1-daggs@gmx.com>
 <20210911162515.29022-2-daggs@gmx.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210911162515.29022-2-daggs@gmx.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 2/2] genimae/odroidc2: increase image size
 to 128M
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Dagg, All,

On 2021-09-11 19:25 +0300, Dagg Stompler spake thusly:
> as a result of BR2_TARGET_ROOTFS_EXT2_SIZE's increase to 124M, increase
> the image size to 128M
> 
> Thanks to Yann E. MORIN <yann.morin.1998@free.fr> for pointing it out
> 
> Signed-off-by: Dagg Stompler <daggs@gmx.com>
> ---
>  board/hardkernel/odroidc2/genimage.cfg | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/board/hardkernel/odroidc2/genimage.cfg b/board/hardkernel/odroidc2/genimage.cfg
> index f49c1deaf3..4ef229024a 100644
> --- a/board/hardkernel/odroidc2/genimage.cfg
> +++ b/board/hardkernel/odroidc2/genimage.cfg
> @@ -6,7 +6,7 @@ image boot.vfat {
>  			"boot.scr"
>  		}
>  	}
> -	size = 64M
> +	size = 128M

Arg, I was completely off on that one; this size only applies to the
vfat partition, not to the whole SDcard image. My deepest apologies
about this...

Regards,
Yann E. MORIN.

>  }
> 
>  image sdcard.img {
> --
> 2.33.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@lists.buildroot.org
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
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
