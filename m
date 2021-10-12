Return-Path: <SRS0=Fi0H=PA=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CB6CC433F5
	for <buildroot@archiver.kernel.org>; Tue, 12 Oct 2021 20:36:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 050596103D
	for <buildroot@archiver.kernel.org>; Tue, 12 Oct 2021 20:36:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 050596103D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CAF96825E6;
	Tue, 12 Oct 2021 20:36:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Povx0TXtoSPP; Tue, 12 Oct 2021 20:36:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5421F81D72;
	Tue, 12 Oct 2021 20:36:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7398E1BF5A0
 for <buildroot@lists.busybox.net>; Tue, 12 Oct 2021 20:36:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 621AD40104
 for <buildroot@lists.busybox.net>; Tue, 12 Oct 2021 20:36:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AF9ica9Ok4Kd for <buildroot@lists.busybox.net>;
 Tue, 12 Oct 2021 20:36:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7BACA400CE
 for <buildroot@buildroot.org>; Tue, 12 Oct 2021 20:36:21 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id w14so990811edv.11
 for <buildroot@buildroot.org>; Tue, 12 Oct 2021 13:36:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=hojuttMXtzZxU/HCgvtR0r9aEXxwRtwZptxBcDRlCvY=;
 b=LDqlOM5Ve0vj5/rI02RuWMuwZ7DczUulPs52RKZLHR6VeDkv376msIJJXuT2yoqDqz
 10IiFVrsOL9akrwik3GfBC3Dfj4Q8ho8yYEjDMA/mA0OgyJUHUVYrlH1By8NVL4DHDge
 INAvyFHQYa8wSuusDOhwCHyEUte8bTHUw71pmgW5Rchv9Fz4dWPLc7zGCPjyAsxmzO9E
 3+luX9DILY3uOgnyecO5FEeotuqlb7sjhSSvAHQrwRSQBoR70u6NcCQt18act4Fr84M3
 cxNFoWh+MRhgMeOQ9CXHKYbH7DhxOvA7PwRJ4KwVJa8rPpzG51UkSTiG8l/Ah0PVKyx4
 Wz0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=hojuttMXtzZxU/HCgvtR0r9aEXxwRtwZptxBcDRlCvY=;
 b=hJP0gSmW52tYSPj8A34JJJI9Lhk/r5M4fMJywjjsaKciBnXhParpt4S9D5wnlmeDKV
 8Af3QW+2RAz2VAi09g3GW6LjfCQTWpr8SJZX81aejoHDgWQWYI2qAUavybW8/3+AdJsk
 q0WXJ/koolhw9zcLiOHSYu9pF/g6AOtTWnAe//nyW+ngEWvOqhJjGtnZ7cy9LJl55WiF
 3xHkKxxoRdraiuUGxJ1JjEw8TgaG6zXH7cZT79lMKkQxCQ+IUHFNQjNRTPfe2hPJhzdu
 zjfDOr2mmJcq0n8nuLjedR3JcKOMeyXmloTx21Zj4uZ76akQC3SIyU0z6dCYkepm7OF5
 p6AA==
X-Gm-Message-State: AOAM531CrR+j7GEq1txh3SlxJrbgVMR6eN2sfYcE6s87RJnzc3c4yG2v
 O0kH0gYvGLGKyrk7YkPzCLssylJo/xF2NiBA
X-Google-Smtp-Source: ABdhPJz6v2WYdSZmXHjusl8vrd6ngjjtyxSFB8hANuxyrVVtpc57TvE+LKMYGoG5t1U5Plsi6sb66g==
X-Received: by 2002:a50:cf87:: with SMTP id h7mr2947981edk.152.1634070979715; 
 Tue, 12 Oct 2021 13:36:19 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id s26sm6475090edt.78.2021.10.12.13.36.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Oct 2021 13:36:19 -0700 (PDT)
Message-ID: <72962c91-377d-3587-55d3-8f40e5f56b87@mind.be>
Date: Tue, 12 Oct 2021 22:36:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
References: <20211005005346.955339-1-giulio.benetti@benettiengineering.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211005005346.955339-1-giulio.benetti@benettiengineering.com>
Subject: Re: [Buildroot] [PATCH 0/4] Make A20/A33 using NEON+VFPv4 FPU
 strategy
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
Cc: Luca Ceresoli <luca@lucaceresoli.net>,
 Jagan Teki <jagan@amarulasolutions.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 05/10/2021 02:53, Giulio Benetti wrote:
> This patchset enable on remaining A20/A33 board the NEON+VFPv4 FPU
> strategy as other A20 boards already do.
> 
> Giulio Benetti (4):
>    configs/bananapi_m1: use NEON+VFPv4 as FPU strategy
>    configs/olimex_a20_olinuxino_lime: use NEON+VFPv4 as FPU strategy
>    configs/olimex_a20_olinuxino_lime2: use NEON+VFPv4 as FPU strategy
>    configs/olimex_a33_olinuxino: use NEON+VFPv4 as FPU strategy

  Series applied to master, thanks.

  Regards,
  Arnout

> 
>   configs/bananapi_m1_defconfig                | 1 +
>   configs/olimex_a20_olinuxino_lime2_defconfig | 1 +
>   configs/olimex_a20_olinuxino_lime_defconfig  | 1 +
>   configs/olimex_a33_olinuxino_defconfig       | 1 +
>   4 files changed, 4 insertions(+)
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
