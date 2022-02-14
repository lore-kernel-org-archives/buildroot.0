Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3D47C433F5
	for <buildroot@archiver.kernel.org>; Mon, 14 Feb 2022 20:41:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9840E818C0;
	Mon, 14 Feb 2022 20:41:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rcYJumil04CV; Mon, 14 Feb 2022 20:41:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D16CF8186B;
	Mon, 14 Feb 2022 20:41:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9EA461BF348
 for <buildroot@lists.busybox.net>; Mon, 14 Feb 2022 20:41:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8D7C860B15
 for <buildroot@lists.busybox.net>; Mon, 14 Feb 2022 20:41:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xU1F8pCwoxWM for <buildroot@lists.busybox.net>;
 Mon, 14 Feb 2022 20:41:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8C5EE60A98
 for <buildroot@buildroot.org>; Mon, 14 Feb 2022 20:41:41 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id o24so26140066wro.3
 for <buildroot@buildroot.org>; Mon, 14 Feb 2022 12:41:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=6rBjDbFwlcpemeJnhJEllj9NqCko2CwBUkehkh+r0bI=;
 b=CGXt17hMzG8HLoTANUji3OBeAokMujHyl0yx1qJikW0iY5Va2nU9OXRSucBeAVFOhk
 AI+ZONJtMrzFGzIW0uva8lmwupvxIW7ZAJ5+F+jDX5j7jeBwPboUPeOVOUrMFH1o/TSs
 lOtb0agtV+aG8rzjJMdKJ6noP8Vg5hQKPbxtteHE7/cHsFeV5OeaBDgsI7PDSczJwclh
 NlCu4HqLAg91nbVZHdkMaqWuUBIQ0jPZ0EkBKul/46IlWSClteA3/ASB93qd77H2I8zr
 FpdVUrMEbfrg+MVxhNA1k4QypR2/h/9Rxmai0QWyIhRYtgEjaqIWUIVeHR/TmOTMEBd+
 wJFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=6rBjDbFwlcpemeJnhJEllj9NqCko2CwBUkehkh+r0bI=;
 b=kHgTWAhIVMEtCJbW7px+f9DC7DJ6yJq8nRe9AA1Fg8xBGvP/brZjh+lppk0wxkWXWL
 X4Q9TNnvwosGJfMjylflnCeNhjJJ9iIsf1b1n1mtMJyy0NOHzvZe9FEpEWgbLuaHiskK
 551UE+40LE7BCO8Tbq8VN5xcl49NCzzeNHSSBrn+4YUcD5idWn2l7kDzW6kr+e3eyKEG
 QS6/U28/wiUcR/UhvZ0WGKk/rXkJw1+QqpKPIUF2i4iND3wTgYckRKNG88IiBT2tChbi
 vvpm+rx8LYKwZ/AOg/6Dxnr2idw/gw4vn4CEX5P7vsQ9KpIjFcyByp00FXDggSoCF0SZ
 rYpA==
X-Gm-Message-State: AOAM530ZnuuCSkYBFRv7Fdzcphy9FLVvC0x54tvKu/sE9vB9y7qfcose
 KLRUcBAtFasNIbcjIUurzFRKJHfqGbjp4A==
X-Google-Smtp-Source: ABdhPJxMfmr9QFeOcHMPB3r7qZxsO2t3phK4AgfNW+vJIbPyn4mbw7qB+HidQPkFDihXkgKuQAkrjA==
X-Received: by 2002:a05:6000:1ac5:: with SMTP id
 i5mr586805wry.703.1644871299888; 
 Mon, 14 Feb 2022 12:41:39 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id x5sm23836815wrv.63.2022.02.14.12.41.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Feb 2022 12:41:39 -0800 (PST)
Message-ID: <96afee8b-4875-666f-a28b-841a990e8fb3@mind.be>
Date: Mon, 14 Feb 2022 21:41:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-GB
To: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
References: <2fec6210-3811-197d-45a7-1ece869f49e0@benettiengineering.com>
 <20220206142403.1644118-1-giulio.benetti@benettiengineering.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220206142403.1644118-1-giulio.benetti@benettiengineering.com>
Subject: Re: [Buildroot] [PATCH] toolchain: fix gcc bug 99140 condition
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 06/02/2022 15:24, Giulio Benetti wrote:
> Gcc bug 99140 exhibits with gcc versions:
> - up to 7.x
> - 9.x
> - 10.x
> and doesn't show up with gcc versions:
> - 8.x
> - 11.x
> then moving BR2_TOOLCHAIN_GCC_AT_LEAST_9 to BR2_TOOLCHAIN_GCC_AT_LEAST_10
> makes gcc version 9 set as working but it's not. So let's back substitute
> BR2_TOOLCHAIN_GCC_AT_LEAST_10 with BR2_TOOLCHAIN_GCC_AT_LEAST_9.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   toolchain/Config.in | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/toolchain/Config.in b/toolchain/Config.in
> index aed8f393a3..db3f451f45 100644
> --- a/toolchain/Config.in
> +++ b/toolchain/Config.in
> @@ -189,7 +189,7 @@ config BR2_TOOLCHAIN_HAS_GCC_BUG_93847
>   config BR2_TOOLCHAIN_HAS_GCC_BUG_99140
>   	bool
>   	default y if !BR2_TOOLCHAIN_GCC_AT_LEAST_8
> -	default y if BR2_TOOLCHAIN_GCC_AT_LEAST_10 && !BR2_TOOLCHAIN_GCC_AT_LEAST_11
> +	default y if BR2_TOOLCHAIN_GCC_AT_LEAST_9 && !BR2_TOOLCHAIN_GCC_AT_LEAST_11
>   	depends on BR2_nios2
>   
>   # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=101737
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
