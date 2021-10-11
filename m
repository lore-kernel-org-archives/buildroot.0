Return-Path: <SRS0=49zi=O7=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8757C433F5
	for <buildroot@archiver.kernel.org>; Mon, 11 Oct 2021 21:19:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5664460EE2
	for <buildroot@archiver.kernel.org>; Mon, 11 Oct 2021 21:19:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5664460EE2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 28C7C608EB;
	Mon, 11 Oct 2021 21:19:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oIWUjfKDzRHP; Mon, 11 Oct 2021 21:19:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8709C608C4;
	Mon, 11 Oct 2021 21:19:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B34441BF865
 for <buildroot@lists.busybox.net>; Mon, 11 Oct 2021 21:19:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A2FA580E92
 for <buildroot@lists.busybox.net>; Mon, 11 Oct 2021 21:19:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id afC-HTP_zTuE for <buildroot@lists.busybox.net>;
 Mon, 11 Oct 2021 21:19:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C321080E56
 for <buildroot@buildroot.org>; Mon, 11 Oct 2021 21:19:15 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id p13so73387707edw.0
 for <buildroot@buildroot.org>; Mon, 11 Oct 2021 14:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=lOp5KGNu/+gYLggvlQQ1nrL1fHhsnxoBWP0JeUwF8eE=;
 b=P++FbxtxRSXoSvGSksReQE9FAsV6nbTwbAUmE63a/MdcwaSRdjjG+G0XMEIgXcZ2sV
 Epz92nifpWjI3S8PE1O42HqTpW4dkWEdvclAnEsmpQdwiHNYpidYal47voy4Qxdd+wYk
 t4iNszQ1url2qWNTNWtoXymSuAiTX8Q9xTcXv0i3De94z15p6Sk00pl/mhrhETu4bR4o
 tCKnLOkLFXx4f5cDxMT4cT3BFQvMBLI6+dYLV5VoOZKH/0SU56Ehc0TOLRt647ENBGrQ
 FaCVGc75REq+TbEmjnpflGVDui67iFg96nPS7OikkbJBp22xojYNVsS3n80jx7ADyqFU
 Rmpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=lOp5KGNu/+gYLggvlQQ1nrL1fHhsnxoBWP0JeUwF8eE=;
 b=WR/EaBouBfMn1ewbbL/lcJbrYjWHkOa3ABxPykk1UQaCf5IaFW5xkWR9H+vLPqc77Q
 24++nOm/35Qaque50fzGGxwMjp40Z9qk3VlvjyOOG7ZpIBcDW5l3GxoW7DwHuxtn0eeS
 1N/cXAMq9DRMLrBn361IVEOBh7mAwSj5pSXlqUgBjCUV3VSNO6HGW3Qxt4/HMA24DqNH
 ptZoRyiMjXBL0DuIj56cTn3sd5oh9IENnWepenwkxLQeRjSh2TC1Vvx9x0OFTUTaHDXp
 KWlYxlMzEfuKNaW3g2B7Xnjv5s/ZRgVG4yhrYWgTjCDkFTCYtiIb2vP1yK9GfLEcYm5z
 MwBg==
X-Gm-Message-State: AOAM533ClZ9qeqOlERQkAmcvBWcm2PleiQI2xHqyMDkAlkyyRK0bxFnQ
 +RjGMBjE4MCdc934CZtVC0XEmg==
X-Google-Smtp-Source: ABdhPJzAZ3+35A+v1T2qj8drkpAnO2rOnW2QRGOmcACwE794wnKQy91FUb2zufqSk03nfKwDcv6LkA==
X-Received: by 2002:a05:6402:51c9:: with SMTP id
 r9mr44859919edd.48.1633987153896; 
 Mon, 11 Oct 2021 14:19:13 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id z16sm5392636edb.16.2021.10.11.14.19.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Oct 2021 14:19:13 -0700 (PDT)
Message-ID: <ad7b755b-1dda-6ae6-0952-d113bff9e78a@mind.be>
Date: Mon, 11 Oct 2021 23:19:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20210929162520.1778888-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20210929162520.1778888-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/liburcu: fix build without wchar
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
Cc: Philippe Proulx <eeppeliteloop@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 29/09/2021 18:25, Fabrice Fontaine wrote:
> Fix the following build failure raised since bump to version 0.13.0 in
> commit 9cedbcf494e647371f92368014d31091848772bb and
> https://github.com/urcu/userspace-rcu/commit/8b2f0590d94f6bc3f1d31bd3e0c9ea744b5b55cb:
> 
> configure: error: The compiler does not support C99
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/435d127728b014d565dd75861f87e18716f9fe5e
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/liburcu/liburcu.mk | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/package/liburcu/liburcu.mk b/package/liburcu/liburcu.mk
> index c0a44764f1..e29784abe4 100644
> --- a/package/liburcu/liburcu.mk
> +++ b/package/liburcu/liburcu.mk
> @@ -12,4 +12,8 @@ LIBURCU_LICENSE_FILES = lgpl-2.1.txt lgpl-relicensing.txt gpl-2.0.txt LICENSE
>   
>   LIBURCU_INSTALL_STAGING = YES
>   
> +# ac_cv_prog_cc_c99 is required for BR2_USE_WCHAR=n because the C99 test
> +# provided by autoconf relies on wchar_t.
> +LIBURCU_CONF_ENV = ac_cv_prog_cc_c99=-std=gnu99
> +
>   $(eval $(autotools-package))
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
