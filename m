Return-Path: <SRS0=SwR/=OE=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96CB9C433F5
	for <buildroot@archiver.kernel.org>; Tue, 14 Sep 2021 19:44:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0856C610CE
	for <buildroot@archiver.kernel.org>; Tue, 14 Sep 2021 19:44:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0856C610CE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8DD66400A4;
	Tue, 14 Sep 2021 19:44:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id coPc0bWOow9e; Tue, 14 Sep 2021 19:44:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A2A3A4039A;
	Tue, 14 Sep 2021 19:44:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8F18C1BF228
 for <buildroot@lists.busybox.net>; Tue, 14 Sep 2021 19:44:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7D38A4039A
 for <buildroot@lists.busybox.net>; Tue, 14 Sep 2021 19:44:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4vbNaW36XDL2 for <buildroot@lists.busybox.net>;
 Tue, 14 Sep 2021 19:44:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 538D2400A4
 for <buildroot@buildroot.org>; Tue, 14 Sep 2021 19:44:21 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:31d8:df7a:786c:e8e0])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id BA4A819F553;
 Tue, 14 Sep 2021 21:44:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1631648658;
 bh=SAIQJu9fi7XQWswoP4/3R96al1B8EfVzjTlTAHw+rpc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uTArrYGHsRqmMrthNqWq5/dieZ5SwkV8eJXfvkKAnUm8+ryA9iZ1E23viL8gnByfW
 APCAbBnPtn022BBhYuK5aUQOtGcdR5NDrjU6vz9FTjeXva2+633okrOA4zCnJiTbsd
 nR+m1kbo/2eeh4xCajlFppqZaDpOmEWxp2em9INIHxu9TE3XQwz2SKGw0VhGpb+qAl
 m8uzipxklnh/ql8gGLmXlKhSMNwmEjYij8/grCVVsTIZ36dwqibSL06YhBU2Xn9k57
 iq7vTeu5pFUEOPTFRenv6JlyoYx5ohCZilGVOb5/NDOGeqBbf7Mib/0FBURf3q3ULm
 I10VNtqwYUOag==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 14 Sep 2021 21:44:13 +0200
Date: Tue, 14 Sep 2021 21:44:13 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Heiko Thiery <heiko.thiery@gmail.com>
Message-ID: <20210914194413.GP1053080@scaer>
References: <20210914192741.26306-1-heiko.thiery@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210914192741.26306-1-heiko.thiery@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH] boot/uboot: fix hook to copy imx firmware
 files
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

Heiko, All,

On 2021-09-14 21:27 +0200, Heiko Thiery spake thusly:
> Simplification has broken it. Fix it again.
> 
> Fixes: af99e7a5f3863049 ("boot/uboot: copy IMX firmware files to uboot package dir")
> Cc: Yann E. MORIN <yann.morin.1998@free.fr>
> Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>

Thanks for fixing my mess! Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  boot/uboot/uboot.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
> index 184f822af4..2eb1792de9 100644
> --- a/boot/uboot/uboot.mk
> +++ b/boot/uboot/uboot.mk
> @@ -194,7 +194,7 @@ define UBOOT_COPY_IMX_FW_FILES
>  		cp $(BINARIES_DIR)/$(fw) $(@D)/
>  	)
>  endef
> -UBOOT_PRE_BUILD_HOOKS += UBOOT_COPY_IMX_DDR_FIRMWARE
> +UBOOT_PRE_BUILD_HOOKS += UBOOT_COPY_IMX_FW_FILES
>  endif
>  
>  ifeq ($(BR2_TARGET_UBOOT_NEEDS_DTC),y)
> -- 
> 2.20.1
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
