Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20F0DC30653
	for <buildroot@archiver.kernel.org>; Thu,  4 Jul 2024 20:10:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C79A940482;
	Thu,  4 Jul 2024 20:10:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e8hRmy-nQPU7; Thu,  4 Jul 2024 20:10:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 934AA404C5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 934AA404C5;
	Thu,  4 Jul 2024 20:10:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id ED5881BF2A1
 for <buildroot@lists.busybox.net>; Thu,  4 Jul 2024 20:10:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DA24640893
 for <buildroot@lists.busybox.net>; Thu,  4 Jul 2024 20:10:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nrzdH3evppk2 for <buildroot@lists.busybox.net>;
 Thu,  4 Jul 2024 20:10:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7C23140884
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7C23140884
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7C23140884
 for <buildroot@buildroot.org>; Thu,  4 Jul 2024 20:10:25 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-42565cdf99cso8297465e9.3
 for <buildroot@buildroot.org>; Thu, 04 Jul 2024 13:10:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720123824; x=1720728624;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=J3gVTrOgBLzPbk2ABttsyFftrk9GPixZ5xNwv8xdwcA=;
 b=HJ2+vT6skIbakXpP7dvNCsGD5lyqNOWP+f+YXfoUWxE+RHJkbMkENEj7aq8AwqQxTj
 FH2O5ZC0C27Ff8AaPvm2j/qabl1CHxuuEZg+NkeUiYfmtQyAgZ6vI8v/zcPN36gaKRjo
 zvY2KWVp3fn8izPPUCxFmBSaFDZ1WBTH6F1mIWHDSbl+CHe8pYjYvT7ybA71Mcxl+srX
 nAXiJQ7NevUyvm8G7RJqWNufUC8ztmNWXGCkPWhlXZDz1ewnGRLouUnVseTol9N/3pat
 b+EUYxExuAQYCaEnRFVjfNuJlNnsBg9e83X8E+XLLeHy0mp4yDUoHKGmQ4KstDTgglJf
 +wyg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWolTjKr4x9RqWaplIORTujNNGFy/tORMtHCdku9IMWyzetnQzndsDnKlG+eU71DXL2Sw25lsDXH8sg7lY1eyLdR3BJl5PKzw==
X-Gm-Message-State: AOJu0Yw49vS3JvQ80TBphdTEZ/OkDG6NmEUSvD4Eajg5eGbUfArr8zgE
 b84R1GFhXADEZokxxoIM6amf3goGPSzOMCqLgXS0tqkUnxKGy/tcfbNgDjK68Ic=
X-Google-Smtp-Source: AGHT+IEtKhW9zmMhJSkTrCvmXw6Q/umy6XDhVncKnSEldBxUzH2fMtw/OZ+OFnnZcinAk98aCMoamA==
X-Received: by 2002:a05:600c:4344:b0:425:657a:518d with SMTP id
 5b1f17b1804b1-4264a3cfff8mr27131645e9.14.1720123823829; 
 Thu, 04 Jul 2024 13:10:23 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4264a2ca6dbsm35981535e9.38.2024.07.04.13.10.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Jul 2024 13:10:23 -0700 (PDT)
Message-ID: <b335fcb8-5ea2-4ca9-9bf8-a5d62caab290@mind.be>
Date: Thu, 4 Jul 2024 22:10:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Peter Korsgaard <peter@korsgaard.com>, Joachim Wiberg <troglobit@gmail.com>
References: <CA+h8R2rXC7pFxf4EtUM1ppGjLviduQki4UD1bzZb8_ZByj4JXA@mail.gmail.com>
 <8b4e27a50df0f4c4770eeb7f7edfed5f2c1f8483.camel@gmail.com>
 <87zfqxuxc7.fsf@dell.be.48ers.dk>
Content-Language: en-GB
In-Reply-To: <87zfqxuxc7.fsf@dell.be.48ers.dk>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1720123824; x=1720728624; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=J3gVTrOgBLzPbk2ABttsyFftrk9GPixZ5xNwv8xdwcA=;
 b=Qdl0AxChT22WGzxIXZMue3iou4+NGIic198+nrvp4qxPlU+3lDEXwvP2d1gV7+b9ah
 DPXTV//gcmrkRRMvP7+CoMNcDt5FXDj7kkpaWMx4z/jLBNnX+XBkuhuqI27e4M9Vsnhh
 A0XoquvcggX6j90D5/DYnedKVJx4NJWo/5PMfi5YccWPKqdeZe1oju0LKpT26zVoAS8g
 NzMmXjzHC/jHGyr2bFqu9cEK3RBOdrnDkG3w4PBKyP8+WNFclrhTbWqsbX8LV+9yYPP9
 q/HduDMI3RFGYIFvMdDRQ7TUuU88hlWx3DV3SMzl4A5D6pwH6vCzR8op0KpNNYDHmNhk
 2m6w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Qdl0AxCh
Subject: Re: [Buildroot] package/openssh: please backport bump to 9.8p1
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
Cc: Christian Stewart <christian@aperture.us>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 04/07/2024 14:59, Peter Korsgaard wrote:
>>>>>> "Joachim" == Joachim Wiberg <troglobit@gmail.com> writes:
> 
>   > On Tue, 2024-07-02, Christian Stewart via buildroot wrote:
>   >> Please backport openssh 9.8p1 to 2024.05.x.
>   >> 4ac2cc5beec0eac4991fb28f286707a5659fa67e
>   >> It contains a security fix.
> 
>   > +1 for 2024.02.x with the additional fix for sshd-session in
> 
>   > 11d2ad31046263d80da5ff6b36c3d25b1bbc0d82
> 
> Yes, I will get to it this weekend. I'll have a look if cherry-picking
> the fix on 9.7 is better than bumping given that DSA keys are no longer
> supported.

  The Debian patch [1] hopefully applies cleanly (and hopefully doesn't depend 
on anything else).

  Christian, Joachim, would you be able to test that patch and perhaps even send 
a Buildroot patch against 2024.02.x?

  Regards,
  Arnout

[1] 
https://salsa.debian.org/ssh-team/openssh/-/blob/master/debian/patches/sshsigdie-async-signal-unsafe.patch?ref_type=heads


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
