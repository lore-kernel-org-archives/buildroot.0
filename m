Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C7D4CD128A
	for <buildroot@archiver.kernel.org>; Wed,  3 Apr 2024 21:02:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 250AD416AE;
	Wed,  3 Apr 2024 21:02:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LYKq5FPKD8Qd; Wed,  3 Apr 2024 21:02:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AE32E417C2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AE32E417C2;
	Wed,  3 Apr 2024 21:02:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8CB5E1BF408
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 21:02:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7A30F6082B
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 21:02:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xJCiY9WL-Hu2 for <buildroot@lists.busybox.net>;
 Wed,  3 Apr 2024 21:02:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9844B6080B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9844B6080B
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9844B6080B
 for <buildroot@buildroot.org>; Wed,  3 Apr 2024 21:02:18 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-34378a6994cso137116f8f.1
 for <buildroot@buildroot.org>; Wed, 03 Apr 2024 14:02:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712178136; x=1712782936;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Ym36LJk8xls9yuNvgalCERApFiwebxwU6hPqhbL+zZc=;
 b=ZLY0aOdvh98Yvm9ReDnGI2Yirbd1lnwmpA0kICoJOP7Wgc/qHGGZ9cm/da9YRbLgWC
 CwwPtuya5zd/5QvbCG/mztjWG65mPQJf9KTHg0qEAoJx7GaOCXikdud8lKuyJeFT19Ft
 7IHFDL8YY0QcxFeGFX3YkZKgpzjiXwNGbue7SZtYwVWT2C2SwKz/7gbX+4jhpc/Z10ID
 2PXRilHdIZEK4BA9mKCxSJUjXziOAvRca7/glW8LnXE8ckZuTsazvqTiUekkpxnmoqf8
 pIHM9lnysWFnUV7PcmQj69PKTDagkBaNGyrezx15RKkuwLFUht6vIbcNl7GBip8NV2+K
 mNkw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVCH2OFXizYvCEjuBSeXbWrorbq857QME5PiBb4y205yx1IdlsAXCvRJKpL7CbZG+0Ef4bV8zhxzexwym1RlMAcOk0315OV9A==
X-Gm-Message-State: AOJu0Yy1RV+b7kkugbFdraD9vGrVUSjSXgSdFbFcThFibmW7ZSu/Rnrq
 4wRr7Ph0FilwUxlCaeuXTEKdhVTmCUUWXyZ6BmgPOURsGf3quTZdkk6Cid9QQPOyC2vTVV8tzin
 c
X-Google-Smtp-Source: AGHT+IF+dI+iEVPbkBKt5X4B31X/JO25SyzobvmydXeFjnSUlOhZ9OoFQtR/syZBVa/JVLytjmLUpA==
X-Received: by 2002:adf:e3cb:0:b0:343:7ced:8913 with SMTP id
 k11-20020adfe3cb000000b003437ced8913mr509974wrm.23.1712178136524; 
 Wed, 03 Apr 2024 14:02:16 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 h4-20020a056000000400b00343668bc492sm5538877wrx.71.2024.04.03.14.02.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Apr 2024 14:02:16 -0700 (PDT)
Message-ID: <9644951a-0724-4163-9a93-4f0e066ce1f7@mind.be>
Date: Wed, 3 Apr 2024 23:02:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Norbert Lange <nolange79@gmail.com>, buildroot@buildroot.org
References: <20240116110002.2146885-1-nolange79@gmail.com>
Content-Language: en-GB
In-Reply-To: <20240116110002.2146885-1-nolange79@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1712178136; x=1712782936; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Ym36LJk8xls9yuNvgalCERApFiwebxwU6hPqhbL+zZc=;
 b=YMSI7wnEJqOwG/6RX4K4KC2ICpddY5t4QaOwamFQb65bL52RDDU1CulWAOcHwameJb
 3td01KcPSIWf5zpS5fUld7YfeIA4Ct2yzHVKVzCq36SaIhTrZlwdnN31ono/COoa7v7v
 UPppVym7BM2wShBYEKLO3TnpgxkssEwL2eR2VzClkRYBMEEoB+q+/k7NUAwYauyKc9QL
 /u4PbGedmPhqovETMm3XNDDfKVmUhw2Rwz7u0+qe87z2MRfpsb6wEMh082ZqpYHvaaiA
 MU2jdRkFTao7h0Z41tTpLh79KZBZjR80WXqVH7gILzGdZk9f6t1J+/TYM2l+31jUd8s0
 O7mA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=YMSI7wnE
Subject: Re: [Buildroot] [PATCH] package/psplash: fix systemd unit ordering
 and dependencies
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
Cc: Phil Eichinger <phil.eichinger@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 16/01/2024 12:00, Norbert Lange wrote:
> Fix a typo in the dependencies, and switch the type to 'exec'.
> This ensures that the psplash-systemd service will find the
> FIFO created by psplash.

  It doesn't actually ensure that: systemd considers the unit ready as soon as 
it has done execve, but the pipe will only be created later.

  The solution is to make the psplash-systemd service wait until the pipe 
actually exists, but I'm not sure how to do that.

  Anyway, this is already an improvement, so applied to master, thanks.

  Regards,
  Arnout

> 
> Change the psplash-systemd dependency to BindsTo, so stopping
> psplash itself will also end this service and free resources.
> 
> psplash-start service need to start early, otherwise it might try
> to compete/take away the framebuffer from the final graphical
> stack. Order it before sysinit.target.
> 
> Signed-off-by: Norbert Lange <nolange79@gmail.com>
> ---
>   package/psplash/psplash-start.service   | 2 ++
>   package/psplash/psplash-systemd.service | 4 ++--
>   2 files changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/package/psplash/psplash-start.service b/package/psplash/psplash-start.service
> index b97e883e54..74cbc33955 100644
> --- a/package/psplash/psplash-start.service
> +++ b/package/psplash/psplash-start.service
> @@ -2,8 +2,10 @@
>   Description=Starts Psplash Boot screen
>   DefaultDependencies=no
>   RequiresMountsFor=/run
> +Before=sysinit.target
>   
>   [Service]
> +Type=exec
>   ExecStart=/usr/bin/psplash -n
>   
>   [Install]
> diff --git a/package/psplash/psplash-systemd.service b/package/psplash/psplash-systemd.service
> index 249aa54039..f89bc5f4fe 100644
> --- a/package/psplash/psplash-systemd.service
> +++ b/package/psplash/psplash-systemd.service
> @@ -1,8 +1,8 @@
>   [Unit]
>   Description=Start psplash-systemd progress communication helper
>   DefaultDependencies=no
> -After=systemd-start.service
> -Requires=psplash-start.service
> +After=psplash-start.service
> +BindsTo=psplash-start.service
>   RequiresMountsFor=/run
>   
>   [Service]
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
