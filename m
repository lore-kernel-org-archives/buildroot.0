Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE500C2BD09
	for <buildroot@archiver.kernel.org>; Mon,  1 Jul 2024 07:15:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B070B8144F;
	Mon,  1 Jul 2024 07:15:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 38A9BSMT-RRp; Mon,  1 Jul 2024 07:15:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D54968143E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D54968143E;
	Mon,  1 Jul 2024 07:15:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EFB321BF340
 for <buildroot@lists.busybox.net>; Mon,  1 Jul 2024 07:15:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DC6616069B
 for <buildroot@lists.busybox.net>; Mon,  1 Jul 2024 07:15:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nCzljiCrvPHI for <buildroot@lists.busybox.net>;
 Mon,  1 Jul 2024 07:15:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12b; helo=mail-lf1-x12b.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 11DEC600C9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 11DEC600C9
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 11DEC600C9
 for <buildroot@buildroot.org>; Mon,  1 Jul 2024 07:15:28 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-52cecba8d11so3199451e87.1
 for <buildroot@buildroot.org>; Mon, 01 Jul 2024 00:15:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719818127; x=1720422927;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Rtiik25nsiZxn30gVHRNspoBa9m/lxDSgtKLzhMQrvU=;
 b=j4JLTi5JNnZHpy35pG1xzZWtDCZuRZpXth2IMHrp99DtPPlYE97l0jkzVDhemnzkOY
 RpT8U9IGt/fiKJdpRd5+8ZTamPTYuf6f9yZGCfHOhvp05PbMfQ2WuNi8vHHJ9sAp/fl5
 oFb5lNO1X1IXF4rCAVRXwoRefr06ttIZsSSSb2KSKJQxzcHBBfaagEU1iQhKzS0FIP7h
 pnIsp/aYXmPu/asi8nu1RITAx8fnSTk3mBb6zowV/Rv2KxxpEchFIC2uQ+XD5/YZcDb7
 DHAw+n7WZjZZex/fm3a7pgcWjI64bEQQWpl/Kbbn1fIci+kOO2E4iNBX2G+Au6Qrfg0X
 DSUA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV6X/8fBcWhw2ndVxyKf6XpKmfwo4+jMXWzj/cGiPd6yVcSuJX0qDjumDbibApuJmj5RREtcRwmXgHBYSp4tKQJvcy6wIyN2g==
X-Gm-Message-State: AOJu0YwatnemhaVhgyCaWOj75DKjDwjS/09AjQiVnEvSyB2C+OAEuDcV
 a/v/VFjy+4dQ3vLclqQGr0WsMLODWfghP0jD6Gl24Gyy/7P9rRoc2O+1sbbJnPMOHZTSsvLn4PR
 6
X-Google-Smtp-Source: AGHT+IGT+rrvqnVDFyr+MQw5KWYvJjxjJpMVEE33KcGRnfxNLTh+VYtCo52UcZSSef/iueG5nB0+cQ==
X-Received: by 2002:a05:6512:e9b:b0:52c:fd46:bf07 with SMTP id
 2adb3069b0e04-52e826fb0dbmr3055606e87.49.1719818126641; 
 Mon, 01 Jul 2024 00:15:26 -0700 (PDT)
Received: from [10.1.0.155] (ip-188-118-3-185.reverse.destiny.be.
 [188.118.3.185]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4256af376easm139863325e9.5.2024.07.01.00.15.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Jul 2024 00:15:26 -0700 (PDT)
Message-ID: <1f0d5486-84aa-4112-ad83-cb750c437853@mind.be>
Date: Mon, 1 Jul 2024 09:15:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
References: <20240608130258.3295823-1-giulio.benetti@benettiengineering.com>
Content-Language: en-GB
In-Reply-To: <20240608130258.3295823-1-giulio.benetti@benettiengineering.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1719818127; x=1720422927; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Rtiik25nsiZxn30gVHRNspoBa9m/lxDSgtKLzhMQrvU=;
 b=WVtaJ/zceKKkQBbu80TdqRWnHwnEje1hDb/3bNOwrB7Up7YqQSQruqw1dti7eZBTJ0
 wMV3GxO+G9PXGelY4L1nykw+CsD4Mr4W0IVLD/eNTLWfosyzeltgnv068xipXedjfioN
 uyYIdN5fgR87q+oSeCizbROFALAJ5FXFBNczG/f6HMyY175s/vfFllZgaGIlqGZ5OIjc
 iuIgUr+/KMAGZsv0EL5M1qTyiYM2ADZZpn9m8o7OUraEqcfBkdvixPxrjIzo43HGiPCd
 dRLbXhoLO7IhNKg2idFDNhsEpUSTwDVEUEz8InLr9Bfafl2IU4XsbtJR12I/Rs6i1AMp
 sAmQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=WVtaJ/zc
Subject: Re: [Buildroot] [PATCH/for-next] package/erlang-jiffy: bump version
 to 1.1.2
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Cc: Johan Oudinet <johan.oudinet@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 08/06/2024 15:02, Giulio Benetti wrote:
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/erlang-jiffy/erlang-jiffy.hash | 2 +-
>   package/erlang-jiffy/erlang-jiffy.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/erlang-jiffy/erlang-jiffy.hash b/package/erlang-jiffy/erlang-jiffy.hash
> index f172d1476e..7c314694e7 100644
> --- a/package/erlang-jiffy/erlang-jiffy.hash
> +++ b/package/erlang-jiffy/erlang-jiffy.hash
> @@ -1,3 +1,3 @@
>   # Locally computed
> -sha256  a999351d956d3ed10c33a6dd7e9435e674e519b5b82a46d60361afdb83062fd8  erlang-jiffy-1.1.1.tar.gz
> +sha256  f43bafc1ae5c9c1a7843a4c6b2d0b7ef57188e567381bf734035ef9701a7458f  erlang-jiffy-1.1.2.tar.gz
>   sha256  0fa8afad2f02c08850a16e36fe55376ee19732b3a116a0207f2a73c857777a49  LICENSE
> diff --git a/package/erlang-jiffy/erlang-jiffy.mk b/package/erlang-jiffy/erlang-jiffy.mk
> index de2e4749fb..b3f7cf82c7 100644
> --- a/package/erlang-jiffy/erlang-jiffy.mk
> +++ b/package/erlang-jiffy/erlang-jiffy.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -ERLANG_JIFFY_VERSION = 1.1.1
> +ERLANG_JIFFY_VERSION = 1.1.2
>   ERLANG_JIFFY_SITE = $(call github,davisp,jiffy,$(ERLANG_JIFFY_VERSION))
>   ERLANG_JIFFY_LICENSE = MIT (core), \
>   	BSD-3-Clause (Google double conversion library), \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
