Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2481C00144
	for <buildroot@archiver.kernel.org>; Fri, 29 Jul 2022 19:40:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 343C383F5B;
	Fri, 29 Jul 2022 19:40:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 343C383F5B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9hszDOrlODiF; Fri, 29 Jul 2022 19:40:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 45E1D83F38;
	Fri, 29 Jul 2022 19:40:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 45E1D83F38
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A110C1BF33A
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 19:40:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 888FB60DE5
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 19:40:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 888FB60DE5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lSe2QvKzO5A7 for <buildroot@lists.busybox.net>;
 Fri, 29 Jul 2022 19:40:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C1D0360A6C
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C1D0360A6C
 for <buildroot@buildroot.org>; Fri, 29 Jul 2022 19:40:40 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id v17so7041459edc.1
 for <buildroot@buildroot.org>; Fri, 29 Jul 2022 12:40:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=X45RDScQYFyv4O46SUrkp1zX/C6sWgpxmqZpM/rEcoQ=;
 b=QiXzADLS2FeYBn+/uGCKqmudF5SuFMAsD3J2DqciM356KrrEha5feQFRshvUraI9nK
 vuqtTl0zzchMPa6QMsz6P3ljBcj6MElRI0JD870PJQJFNITSNKdCDJnnQrwJJPcDi7qs
 dVGA8K6cdmC0yyfa5u6vMPXKR82q0Z6evOyp/L4k9zrKMw/L8SAl2zd6a3/HQWKXLAHt
 E11fUPCKGXLrYWROyFg8xG9cQ5VR3V9Ji5E4BYX43fHsVm3/AuhFcPH1YM235H3gReCs
 ivk8/Qw+a64detApT3wM6EiRowjx4Rt2Izfmpr9KPrAydmwUASDBmNoEDc612nKncthx
 lP2Q==
X-Gm-Message-State: AJIora9to6MybDE/ZznM2sYDguDwlGJGgMX8RkYeupc5SzoZeSCcd1aW
 d8xCDhs7wb1swT/xxYLBLtVZjA==
X-Google-Smtp-Source: AGRyM1vIWA6SJMFAKJ+7aWcJJrzXgBqDlZ84V8xt6CTaqRNdlYm2destlPc2bOttMkB3gkR2SDer9A==
X-Received: by 2002:a05:6402:4511:b0:43b:a182:8a0a with SMTP id
 ez17-20020a056402451100b0043ba1828a0amr5058341edb.410.1659123638779; 
 Fri, 29 Jul 2022 12:40:38 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 g1-20020a17090604c100b0072b91a3d7e9sm2077057eja.28.2022.07.29.12.40.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Jul 2022 12:40:38 -0700 (PDT)
Message-ID: <413b2523-0ea9-f051-f2c8-6aec483bf8fc@mind.be>
Date: Fri, 29 Jul 2022 21:40:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-GB
To: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
References: <20220729162430.1028453-1-giulio.benetti@benettiengineering.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220729162430.1028453-1-giulio.benetti@benettiengineering.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=X45RDScQYFyv4O46SUrkp1zX/C6sWgpxmqZpM/rEcoQ=;
 b=ZI6ZhwuWREuYS5T/zL1ihPzLa4yn0xe1GyJmMB4jw8BJvhbxGtNqcsmskTrzsrt0NT
 oE4elJNpL8qJWEaIfn0KjmuzP8oeaPiTUUpbwlZVZchM1M0KpcKO24apjgqkQzDE7RBE
 hqv8pjQWFdfIrVnq+yC3Cl4p+gYr/mgTapomNLqTQAIrNL4TNAI/3g7j4ZRJ0n3xlf2h
 Uwalne2tRFwjqkWcbwzHCHD4u1Z/YPMuSpnZaF2HHCnIrcIJ/rv13HPR2wYab1wjlgbf
 z59pofKbp/lynJBOmshz/MKKkw6vZhT7S4TGNfqnbH7CMUrshzcnAJuIuiIDqmSG1GOi
 OkBQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=ZI6ZhwuW
Subject: Re: [Buildroot] [PATCH 1/2] toolchain/Config.in: fix
 BR2_TOOLCHAIN_HAS_GCC_BUG_99140 number
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 29/07/2022 18:24, Giulio Benetti wrote:
> While introducing gcc bug 99410 I've named BR2_TOOLCHAIN_HAS_GCC_BUG_ to
> 99140 that is wrong. So let's fix this by changing bug option to
> BR2_TOOLCHAIN_HAS_GCC_BUG_99410.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>   package/belle-sip/belle-sip.mk | 2 +-
>   toolchain/Config.in            | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/belle-sip/belle-sip.mk b/package/belle-sip/belle-sip.mk
> index 11b96f3fd9..51e017000c 100644
> --- a/package/belle-sip/belle-sip.mk
> +++ b/package/belle-sip/belle-sip.mk
> @@ -35,7 +35,7 @@ endif
>   
>   BELLE_SIP_CFLAGS = $(TARGET_CFLAGS)
>   
> -ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_99140),y)
> +ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_99410)

  Something went wrong here... ,y) dropped off.

  Regards,
  Arnout

>   BELLE_SIP_CFLAGS += -O0
>   endif
>   
> diff --git a/toolchain/Config.in b/toolchain/Config.in
> index 6d12b6fed7..722bdb2de0 100644
> --- a/toolchain/Config.in
> +++ b/toolchain/Config.in
> @@ -188,7 +188,7 @@ config BR2_TOOLCHAIN_HAS_GCC_BUG_93847
>   # Error: branch offset out of range on Nios II. This bug
>   # no longer exists in gcc 8.x but reappeared on gcc 9.x and has been
>   # fixed on gcc 11.x.
> -config BR2_TOOLCHAIN_HAS_GCC_BUG_99140
> +config BR2_TOOLCHAIN_HAS_GCC_BUG_99410
>   	bool
>   	default y if !BR2_TOOLCHAIN_GCC_AT_LEAST_8
>   	default y if BR2_TOOLCHAIN_GCC_AT_LEAST_9 && !BR2_TOOLCHAIN_GCC_AT_LEAST_11
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
