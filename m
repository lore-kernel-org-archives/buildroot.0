Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C13F9C4321E
	for <buildroot@archiver.kernel.org>; Tue, 29 Nov 2022 22:07:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4B0C860D57;
	Tue, 29 Nov 2022 22:07:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4B0C860D57
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7xnWchYb61_V; Tue, 29 Nov 2022 22:07:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 884F560C24;
	Tue, 29 Nov 2022 22:07:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 884F560C24
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 582381BF5AD
 for <buildroot@lists.busybox.net>; Tue, 29 Nov 2022 22:07:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 40FFA60C24
 for <buildroot@lists.busybox.net>; Tue, 29 Nov 2022 22:07:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 40FFA60C24
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5qdMvfOVBDVP for <buildroot@lists.busybox.net>;
 Tue, 29 Nov 2022 22:07:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4EC3C60C0C
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4EC3C60C0C
 for <buildroot@buildroot.org>; Tue, 29 Nov 2022 22:07:22 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id m14so331201wrh.7
 for <buildroot@buildroot.org>; Tue, 29 Nov 2022 14:07:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0TPYvssg6bKEnHuSc/b53r1izm7ZApEybRkO2MfM2xk=;
 b=WCp5l51gTb0jVXGiTF+tEQGE8E5AtraODUhDvWcRhLps0VlqnoylArxAoz+HHHNRs+
 cHuC3FlQxf83lCGX7c19g6r1BEYs/7LbRSZFSeBcdmmtR8OO4cxt6cyCzyFbXUfP0TxM
 wV6C0D5ED+zn1ViNhHQycy/16VgBWGViUWTIHm5boV9H51hlnJ87lgylNoZvgDvmx/Nb
 /7qNsYY/tgIrCM/sLrMEdaz8jIs/HpM/3asv0cuw3OI4KJdF+JZXDENAsWbK49x21yb3
 OfKsOyjW4BP0hsx+5+9l4xVh1sQvYv2WoYvJnCfe4hr9dWfWCq5KOBBXfBqKV8BT/4t9
 lSAg==
X-Gm-Message-State: ANoB5pkqkMU6kHPxORy/MQvi37bkN/236jO9RJcYF4aRUosuSPNJeIB8
 qAE7SPumafdOsyBsMJnv0a1Cew==
X-Google-Smtp-Source: AA0mqf4By6+nCgVXpJ7AWdcr1EgZX4sTWTzVKo5EYg7leqO4gNvpvN080gobYh/lcx1l+9YnehFfNA==
X-Received: by 2002:a5d:5306:0:b0:242:c1f:e19e with SMTP id
 e6-20020a5d5306000000b002420c1fe19emr11981366wrv.270.1669759640547; 
 Tue, 29 Nov 2022 14:07:20 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 h5-20020adfa4c5000000b0023659925b2asm14883910wrb.51.2022.11.29.14.07.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Nov 2022 14:07:20 -0800 (PST)
Message-ID: <407b3ca3-b87c-4758-3cb1-b2dc3802a8c9@mind.be>
Date: Tue, 29 Nov 2022 23:07:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Content-Language: en-GB
To: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
References: <20221129164019.546521-1-giulio.benetti@benettiengineering.com>
From: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <20221129164019.546521-1-giulio.benetti@benettiengineering.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0TPYvssg6bKEnHuSc/b53r1izm7ZApEybRkO2MfM2xk=;
 b=S7yggeyEt5lyDrhYWmr1hu4Gf2BmaD+zvkSoMhkPW6vRF/SbKkZJrphetiZe9R1GSq
 0VSjbp4f6Nk6ETCmx2/SgMIos+rsPW0Yp3Ui2E+2lZ7FopO+8vrqxFvUKg5q2p6LYvqX
 dMS/P8ldf57Vt5Wxb1M3RctlFg0lhOLswYTedV1aoTS99u04MQosAMLoDmhpVHXiAZbC
 Wpq/SseyHI6WFsl7Pch8Ye8tjtdfqfFmnEPJKSln+Gu79gjQBFbIGTVgselDotSQkDLi
 FC2D04OpJUWxpekpN4vv2gRmLCbvxS/chX/rQ1jsRt8K0itq1xcB7bslg/61Eg+YGZF+
 DUHw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=S7yggeyE
Subject: Re: [Buildroot] [PATCH] package/rtl8821au: bump to latest version
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



On 29/11/2022 17:40, Giulio Benetti wrote:
> Fixes:
> http://autobuild.buildroot.net/results/4526cb70ce91bcd5fce60ebb4f704a63f1ecd249/
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

  Applied to master, thanks, after updating the commit message to include the 
date and the branch name.

  Regards,
  Arnout

> ---
>   package/rtl8821au/rtl8821au.hash | 2 +-
>   package/rtl8821au/rtl8821au.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/rtl8821au/rtl8821au.hash b/package/rtl8821au/rtl8821au.hash
> index a5d0c2d5d4..b19cb93bf6 100644
> --- a/package/rtl8821au/rtl8821au.hash
> +++ b/package/rtl8821au/rtl8821au.hash
> @@ -1,3 +1,3 @@
>   # Locally calculated
> -sha256  302f37098c3ae018eebf8ca80bcd2ec8ffc46755daed811278321d0914758f41  rtl8821au-e0b443940471c166a5cc6280d3608f95228e017f.tar.gz
> +sha256  9dfb2b12c52fe759e4978cbd7a0fb90f0605ae9146a6d0186f2869bbfb6d13fd  rtl8821au-0cab870ff635ba038705ab29363b0cbbedd5c258.tar.gz
>   sha256  640d90f6ee401241ff62834d0d1b33f83049e99b8bfdfa04ed1b0a1635dde3e7  LICENSE
> diff --git a/package/rtl8821au/rtl8821au.mk b/package/rtl8821au/rtl8821au.mk
> index 65c0bc913d..6bb77de81f 100644
> --- a/package/rtl8821au/rtl8821au.mk
> +++ b/package/rtl8821au/rtl8821au.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -RTL8821AU_VERSION = e0b443940471c166a5cc6280d3608f95228e017f
> +RTL8821AU_VERSION = 0cab870ff635ba038705ab29363b0cbbedd5c258
>   RTL8821AU_SITE = $(call github,lwfinger,rtl8812au,$(RTL8821AU_VERSION))
>   RTL8821AU_LICENSE = GPL-2.0
>   RTL8821AU_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
