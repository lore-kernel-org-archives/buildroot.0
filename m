Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF65AC433F5
	for <buildroot@archiver.kernel.org>; Mon,  7 Mar 2022 18:42:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6827260EDD;
	Mon,  7 Mar 2022 18:42:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oNoima4ft94h; Mon,  7 Mar 2022 18:42:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8988560ED9;
	Mon,  7 Mar 2022 18:42:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7392D1BF2F6
 for <buildroot@lists.busybox.net>; Mon,  7 Mar 2022 18:42:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6CD2840A7A
 for <buildroot@lists.busybox.net>; Mon,  7 Mar 2022 18:42:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=paral.in
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AGEtQubocj06 for <buildroot@lists.busybox.net>;
 Mon,  7 Mar 2022 18:42:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ua1-x92d.google.com (mail-ua1-x92d.google.com
 [IPv6:2607:f8b0:4864:20::92d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 746944047C
 for <buildroot@buildroot.org>; Mon,  7 Mar 2022 18:42:03 +0000 (UTC)
Received: by mail-ua1-x92d.google.com with SMTP id y1so6910381uap.4
 for <buildroot@buildroot.org>; Mon, 07 Mar 2022 10:42:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=paral.in; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8TeNGyz0q4bARUgcEiBk+IIeL0bRwuWVn0u97x7LvNM=;
 b=jVaZJ5G34mS4PdUPE0+BobBhaK/GtxvTp4G6A+IrMvO/x6d2Z4+KJVxqW1f/IOJh9B
 47aw6RYt65uv9eKQakUdoQXdhBmTvKnhpRhsJ6AagqGh4c9VmMfIGCwqo8+lz5ylF7NI
 SnBTWh8A2YjqSJ/uUCPf/xHQgJ13pO15m3VU460KPSUA7cmiXnL/RNX0fQreJNhERuQY
 O5kKbsmxEhkujOTe84Xt9Qt3Id52Pyz2z40X4L2dh+NsYu2zww/85/gyY+o4QwcWezSP
 CfVyKGpumN3AauagNJhmsRuv4sQ2dvxMcoQ50BMDS/UidKuaTCTg0KhKYSCb/6nKs224
 rj3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8TeNGyz0q4bARUgcEiBk+IIeL0bRwuWVn0u97x7LvNM=;
 b=mrfMGwf1//oQA2PbEJaIsjPoBCCoI5TF0p4ptrS5cXs9n7Isc1pggmp2nsTeljS1bE
 vy3HJq3TbluwUs4jxRwFWexjdqhSZbPLEm50qndQG/5bTnydXQl9e/QSPq34Nxu7ti+k
 aqKITjpS3dnx779qSFTG8cS4bUIIfi+NYNfO+g/FvTaQ8VYfcy3etV/LWTkTbRwyGfDU
 kVE9WWBjPBF3248XgPcEgZggOaXkjV2jbAF1NxT2bt5Hf6cZPmyNQiwzsXeR0xGJG0Lu
 fKLSo6WIVZjX2q2LQR1Sn7ee/izWeLkvNvit/nvp7YkURCNaoGBG4IR0zYjKIaAGeKcA
 fUzQ==
X-Gm-Message-State: AOAM533cwRrgx0c8HscdpYQUDbQln/Xm471KXCMdnLfBVYKunGPk1gEL
 uvOFDUaOEBh8wE8AL7Ic3yTy1NT4CL4+Gg==
X-Google-Smtp-Source: ABdhPJylRwc/pv6O+NHK2zc5EVmJLmYtvLU+R7/Uajnnt7zZq8pil5EP+L9oSarQSBrKrzVY1f547A==
X-Received: by 2002:ab0:554f:0:b0:345:f038:1e09 with SMTP id
 u15-20020ab0554f000000b00345f0381e09mr4653960uaa.110.1646678521957; 
 Mon, 07 Mar 2022 10:42:01 -0800 (PST)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com.
 [209.85.217.50]) by smtp.gmail.com with ESMTPSA id
 108-20020a9f24f5000000b0034a4433fe83sm2101887uar.37.2022.03.07.10.42.00
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Mar 2022 10:42:00 -0800 (PST)
Received: by mail-vs1-f50.google.com with SMTP id z85so3310146vsz.5
 for <buildroot@buildroot.org>; Mon, 07 Mar 2022 10:42:00 -0800 (PST)
X-Received: by 2002:a67:1dc1:0:b0:31e:650d:a7ad with SMTP id
 d184-20020a671dc1000000b0031e650da7admr4935451vsd.85.1646678520068; Mon, 07
 Mar 2022 10:42:00 -0800 (PST)
MIME-Version: 1.0
References: <22645_1646667795_62262813_22645_170_3_aabbdb8dc24868de9188190a6e1e7e1f1b6b12bc.1646667793.git.yann.morin@orange.com>
In-Reply-To: <22645_1646667795_62262813_22645_170_3_aabbdb8dc24868de9188190a6e1e7e1f1b6b12bc.1646667793.git.yann.morin@orange.com>
Date: Mon, 7 Mar 2022 10:41:49 -0800
X-Gmail-Original-Message-ID: <CA+h8R2oehTEDTGz9Hk7GsujdpbWoLC59z8HfJJky__KOYGtRbw@mail.gmail.com>
Message-ID: <CA+h8R2oehTEDTGz9Hk7GsujdpbWoLC59z8HfJJky__KOYGtRbw@mail.gmail.com>
To: yann.morin@orange.com
Subject: Re: [Buildroot] [PATCH] package/pkg-golang: don't export unused
 BR_GOMOD
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@paral.in>
Cc: Christian Stewart <christian@paral.in>, Anisse Astier <anisse@astier.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Yann,

On Mon, Mar 7, 2022 at 7:43 AM <yann.morin@orange.com> wrote:
>
> From: "Yann E. MORIN" <yann.morin@orange.com>
>
> BR_GOMOD is a remnant from a previous iteration of the golang download
> infrastructure; it is currently used nowhere.
>
> Do not set it.
>
> Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: Anisse Astier <anisse@astier.eu>
> Cc: Christian Stewart <christian@paral.in>
> ---
>  package/pkg-golang.mk | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/package/pkg-golang.mk b/package/pkg-golang.mk
> index f1c5cfd350..0cb2ed73cc 100644
> --- a/package/pkg-golang.mk
> +++ b/package/pkg-golang.mk
> @@ -87,8 +87,7 @@ $(2)_POST_PATCH_HOOKS += $(2)_GEN_GOMOD
>  $(2)_DOWNLOAD_POST_PROCESS = go
>  $(2)_DL_ENV += \
>         $$(HOST_GO_COMMON_ENV) \
> -       GOPROXY=direct \
> -       BR_GOMOD=$$($(2)_GOMOD)
> +       GOPROXY=direct

Reviewed-by: Christian Stewart <christian@paral.in>

Thanks,
Christian
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
