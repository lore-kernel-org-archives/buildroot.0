Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19C0EC2BD09
	for <buildroot@archiver.kernel.org>; Mon,  1 Jul 2024 07:11:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D1BCF81431;
	Mon,  1 Jul 2024 07:11:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EwDz5m3cgZ5u; Mon,  1 Jul 2024 07:11:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D779C8144E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D779C8144E;
	Mon,  1 Jul 2024 07:11:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 291F11BF340
 for <buildroot@lists.busybox.net>; Mon,  1 Jul 2024 07:11:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 215838144E
 for <buildroot@lists.busybox.net>; Mon,  1 Jul 2024 07:11:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wGTBV09nGZy3 for <buildroot@lists.busybox.net>;
 Mon,  1 Jul 2024 07:11:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::136; helo=mail-lf1-x136.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1DDF681431
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1DDF681431
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1DDF681431
 for <buildroot@buildroot.org>; Mon,  1 Jul 2024 07:11:38 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-52cecba8d11so3195659e87.1
 for <buildroot@buildroot.org>; Mon, 01 Jul 2024 00:11:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719817897; x=1720422697;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3A+dlJ02vF6/l9wd2eTqTjC9+m6wYb7Uig3NYj4/SPM=;
 b=UwpdJoUZjKhMq35vB5TkQinCYgZZnikXWwFDGzNteyAibP4pV/YoBEubi+KVSryM4U
 aa9oPszLkExw2o49ZFUlQlHRE3M6TwVfITgj+Nauj0GMSUahowkwONtT3wAp0I0Ala+a
 HDvwfF03WPBsKc7wpQZqTBp66xzhNSQHo2udlXfM6K1LqgX+OQm6F95fh/C9lZJjgoRc
 PM5cK68YcvocaWyiZqMYkv4q6SyibvEe9LGRT1QP+DhTPnpV/KwBy9oSpMn5DYipDLZg
 Bxn4DgVAvr8nxCj9GrWtmpaAOzNpBVT4lDEJ8XdbMW4VBPP8yE+h1St147eOj7u5iRPE
 yOfw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWZl9LFSOR69Zrd2pB5FjaV2zYRGH3y22vMfvVt6G+0IDaCl3Abu6Y8Zn+I8BIisbRR9ozJ0lK1AVcF1vNM+Zbi//7bHKu7ug==
X-Gm-Message-State: AOJu0YxUZBYTBkP5ZltUAT1anFi/JX/T4bKH8YofZNtZ0TGmFrVvsnhI
 zGrcVdRtssNUg83tK2gW6TJkZXKm6zzU6FHGjKFiz+f76XEq2w5GtDjxN0lq18c=
X-Google-Smtp-Source: AGHT+IG9iezV7L/dq2L6Q8+m0bcSnbO+dYrmA8WVBkcpRCe6pRT6/WMNHCRISDrAsdKqEHfw2FtKIw==
X-Received: by 2002:a05:6512:b1c:b0:52c:e01b:8875 with SMTP id
 2adb3069b0e04-52e82686c03mr2645495e87.35.1719817896504; 
 Mon, 01 Jul 2024 00:11:36 -0700 (PDT)
Received: from [10.1.0.155] (ip-188-118-3-185.reverse.destiny.be.
 [188.118.3.185]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3675a0d8e97sm9164175f8f.33.2024.07.01.00.11.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Jul 2024 00:11:36 -0700 (PDT)
Message-ID: <3e7963e4-b7e5-4ed3-9f6d-90d1b1eb2109@mind.be>
Date: Mon, 1 Jul 2024 09:11:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Devoogdt <thomas@devoogdt.com>, buildroot@buildroot.org
References: <20240608102527.2467188-1-thomas@devoogdt.com>
Content-Language: en-GB
In-Reply-To: <20240608102527.2467188-1-thomas@devoogdt.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1719817897; x=1720422697; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3A+dlJ02vF6/l9wd2eTqTjC9+m6wYb7Uig3NYj4/SPM=;
 b=buiQpWH4+mX+SH7iBZG1vzPcne9PwGv6awwfVsa9L3jpjolJ6HkKEMykBm+QSGQ1c3
 kEdf751JazrxN8uUcbUvDAqvKp7+QbHd/MfeQjoMDRnACFyKqRO//u153hN6uIorQcfm
 erbPaAO8gtJEVfo1Hq/+417JiKPWo7JSe69LFrxOGzOisnvqtaXO5Qc2xYhu3uVroPgh
 EqXIDjIpyN7u9Turbk+L/+ozXph2nHuFeOS7bs2QsQbLP1hGcBmb5L6JvXdt8t53+wRg
 Dlyym+VD8SCFemUDNS8rWbQ2cu0SMKkVEu3yTSnx66U0w6xtn2iZzWrKjS2mPk83pPKU
 /LRg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=buiQpWH4
Subject: Re: [Buildroot] [PATCH v1 1/3] package/libinput: bump to 1.26.0
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 08/06/2024 12:25, Thomas Devoogdt wrote:
> Announce:
>    https://lists.freedesktop.org/archives/wayland-devel/2024-June/043657.html
> 
> Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>

  Applied all three to master, thanks.

  Regards,
  Arnout

> ---
>   package/libinput/libinput.hash | 2 +-
>   package/libinput/libinput.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libinput/libinput.hash b/package/libinput/libinput.hash
> index 643cb16213..2ab56e4827 100644
> --- a/package/libinput/libinput.hash
> +++ b/package/libinput/libinput.hash
> @@ -1,5 +1,5 @@
>   # Locally computed
> -sha256  193bd592298bd9e369c0ef3e5d83a6a9d68ddc4cd3dfc84bbe77920a8d0d57df  libinput-1.25.0.tar.bz2
> +sha256  8c582b86c6865aaee2516ee96b299cef60c98e113d1391bbd2683eac08221a07  libinput-1.26.0.tar.bz2
>   
>   # License files
>   sha256  80de50b2022a840db044c56db804ca3565600a692c0714babface587acc6d1b0  COPYING
> diff --git a/package/libinput/libinput.mk b/package/libinput/libinput.mk
> index 499ed5ff4b..3b5070c85e 100644
> --- a/package/libinput/libinput.mk
> +++ b/package/libinput/libinput.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -LIBINPUT_VERSION = 1.25.0
> +LIBINPUT_VERSION = 1.26.0
>   LIBINPUT_SOURCE = libinput-$(LIBINPUT_VERSION).tar.bz2
>   LIBINPUT_SITE = https://gitlab.freedesktop.org/libinput/libinput/-/archive/$(LIBINPUT_VERSION)
>   LIBINPUT_DEPENDENCIES = host-pkgconf libevdev mtdev udev
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
