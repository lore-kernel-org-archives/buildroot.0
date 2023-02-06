Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA2D9C05027
	for <buildroot@archiver.kernel.org>; Mon,  6 Feb 2023 11:26:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7841281495;
	Mon,  6 Feb 2023 11:26:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7841281495
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Tjyi2oAXAgWl; Mon,  6 Feb 2023 11:26:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C21C581491;
	Mon,  6 Feb 2023 11:26:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C21C581491
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 801941BF397
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 11:26:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 58EF560A7E
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 11:26:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 58EF560A7E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RtnfhjH-E6A4 for <buildroot@lists.busybox.net>;
 Mon,  6 Feb 2023 11:26:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 850F0607F0
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 850F0607F0
 for <buildroot@buildroot.org>; Mon,  6 Feb 2023 11:26:40 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 n28-20020a05600c3b9c00b003ddca7a2bcbso8493651wms.3
 for <buildroot@buildroot.org>; Mon, 06 Feb 2023 03:26:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pi1lOTznuY6UOCEhh7g8iC/BSFjbgzQGIUW5woMFoj8=;
 b=vWa6I1VnRMp3/kcgjRA67iV+NkNJxrQhsZsGc6Sdj6S4owP+yaGKKQAws4L5MmdXdI
 EfNA7Nmr5Ezd/LpNCYBIuWBhkd8dS3EKNdDiq6MUU0+3VCJy/l48uf+Rzas11yTkrPop
 tKEMaF1T4XPfbH7gVwSkpG8EHMs+N/7v8qrpFpTKmolD4iEyFEZJvmJ1lHMhwhbDVo1f
 I4D8mWASBCk/fsPXTI3g/PvQoGhqLt3G1X563SrztWVbALZTuIo9hEELaPrGZsWFbzpw
 XyUhCJ8k1CroPEw9ILyDbfXt+B/ox7E5908gXbCQm7ufmMxh2QpO2zVrkgWk3G+mBtx1
 BQ5w==
X-Gm-Message-State: AO0yUKXhpPBuAQ0jNU4SzYjNbNjEyipjM6tnsC0zDpd0e2+/3piF+BvX
 sJB6p6oCqIVyc4gtJLdNUBv8Cw==
X-Google-Smtp-Source: AK7set9u0r/hXEG0nMKsS8hrALQR/0BnuSGB1DI5Cg6kUlG++uVVLu6Y+1Dz03aRi8NO5rPApIFpog==
X-Received: by 2002:a05:600c:cc3:b0:3df:fc69:e96b with SMTP id
 fk3-20020a05600c0cc300b003dffc69e96bmr3146393wmb.5.1675682798774; 
 Mon, 06 Feb 2023 03:26:38 -0800 (PST)
Received: from [192.168.16.188] (cpe1150018.bra.be.verixi.net. [85.119.216.19])
 by smtp.gmail.com with ESMTPSA id
 s13-20020a05600c45cd00b003dc42d48defsm11205537wmo.6.2023.02.06.03.26.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Feb 2023 03:26:38 -0800 (PST)
Message-ID: <c155387a-3cba-db3e-9931-326d8b7e8ff0@mind.be>
Date: Mon, 6 Feb 2023 12:26:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Content-Language: en-GB
To: Alsey Coleman Miller <alseycmiller@gmail.com>, buildroot@buildroot.org
References: <20220329185059.943889-1-alseycmiller@gmail.com>
 <20220329185059.943889-3-alseycmiller@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <20220329185059.943889-3-alseycmiller@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pi1lOTznuY6UOCEhh7g8iC/BSFjbgzQGIUW5woMFoj8=;
 b=PrMnY5u15P0HDuuOwxSfjJ6rb/vvFJetgi168LbLd3eSq30FrRa79eqyDuweWoWPmi
 jIaSc2b6VzCCQx6KrIWkq4u0hGiRiVw6/Ud5sOos0HEpj8rxBsh0rcuSaDPHYPg7xL0S
 w3oho/vwQ7fVS4DZpMZSPmoqla7/E8qSNcJ7TNOquEzCwiucok5MSJ0e3zS6v+LjDbPt
 hEmy8at9DfeZoIW26DEjv2B2G/fQQK1LYPnZ0p0Ztk97l8ICJtQ61TK1NviJ6aqNskrc
 /or5sJn8khht04dpBfHitRZvUu0F0Pba96a5u3NUIfRmVl+88Lk/77IJV07Gxx+XkARI
 DOkA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=PrMnY5u1
Subject: Re: [Buildroot] [PATCH 3/4] package/libdispatch: add fix for 32-bit
 arm
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

  Hi Alsey,

  This patch should be included in the first one.

On 29/03/2022 20:50, Alsey Coleman Miller wrote:
> Signed-off-by: Alsey Coleman Miller <alseycmiller@gmail.com>
> ---
>   package/libdispatch/arm-yield.patch | 13 +++++++++++++
>   1 file changed, 13 insertions(+)
>   create mode 100644 package/libdispatch/arm-yield.patch
> 
> diff --git a/package/libdispatch/arm-yield.patch b/package/libdispatch/arm-yield.patch
> new file mode 100644
> index 0000000000..fa7cf7cce4
> --- /dev/null
> +++ b/package/libdispatch/arm-yield.patch
> @@ -0,0 +1,13 @@

  Patches should be git formatted. They should have a full commit message that 
explains the issue, and a Signed-off-by. There should also be an upstream 
reference, or something like "Not applicable" and an explaantion why it's not 
applicable for upstream.

  Regards,
  Arnout


> +diff --git a/src/shims/yield.c b/src/shims/yield.c
> +index 43f0017..d0c5fff 100644
> +--- a/src/shims/yield.c
> ++++ b/src/shims/yield.c
> +@@ -36,7 +36,7 @@ void *
> + _dispatch_wait_for_enqueuer(void **ptr)
> + {
> + #if !DISPATCH_HW_CONFIG_UP
> +-#if defined(__arm__) || defined(__arm64__)
> ++#if (defined(__arm__) && defined(__APPLE__)) || defined(__arm64__)
> + 	int spins = DISPATCH_WAIT_SPINS_WFE;
> + 	void *value;
> + 	while (unlikely(spins-- > 0)) {
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
