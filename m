Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0792C4332F
	for <buildroot@archiver.kernel.org>; Wed, 13 Dec 2023 21:03:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6740F40399;
	Wed, 13 Dec 2023 21:03:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6740F40399
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dmEUXGb1Tupi; Wed, 13 Dec 2023 21:03:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3E3CC404B9;
	Wed, 13 Dec 2023 21:03:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3E3CC404B9
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 627391BF475
 for <buildroot@lists.busybox.net>; Wed, 13 Dec 2023 21:03:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3A9E9615A3
 for <buildroot@lists.busybox.net>; Wed, 13 Dec 2023 21:03:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3A9E9615A3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3EPKVv6lOstJ for <buildroot@lists.busybox.net>;
 Wed, 13 Dec 2023 21:03:45 +0000 (UTC)
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7D7CB607A3
 for <buildroot@buildroot.org>; Wed, 13 Dec 2023 21:03:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7D7CB607A3
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-55266a38808so151170a12.1
 for <buildroot@buildroot.org>; Wed, 13 Dec 2023 13:03:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702501422; x=1703106222;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fxSenTQKvrJ7Cq51SBrveuWGys40K+i1rlYGwcHDwz4=;
 b=XqOTTmtuF2uIxcARuUjOzk+r8M4QOkfPWgr2x6fGE0Hkr1eXA6ArdXgp+GvsqtSrgk
 vbNMv7DpvbKyE+tuVb5XZdYbqh4GVjqOc6tiYKOeYsSSjVgLcx2wbi31nt0QK7tBqs5R
 YdtnIA8uiNK0z9XYYE0RE/1T9cXeIkIosDiNIPTvjl1BNP4r9ffln1EqLgq2OD1XoO4b
 a8RGR5y1Gf9al8vz9CpecYmZ4xRx4f8tGHtWWvS2C+JA6ejmAR1kZN/TM1uVaoWbbOc1
 3xF+phDXfgWbdLzKUWonE8PxODs0zHP4A/BTvlXBUSMKSDt1/S/gEql6LBwBI10q5lI4
 yhMA==
X-Gm-Message-State: AOJu0YzEshqLE8jZacmb7YyIDgrMI9G0yCt5fTXG86/KaBqv0LeO17oG
 /vUz5F5REj1lH//R0wRAbazwc4fSDRc2j7iaER8=
X-Google-Smtp-Source: AGHT+IE7Y1t76H2p306X1nHRGTKq7Q2uVpY5twj9sp0WIMAqDd9lz+xUg0OU7ekAr9pm8/MHW5Go6w==
X-Received: by 2002:a17:907:da0:b0:a18:692c:cff7 with SMTP id
 go32-20020a1709070da000b00a18692ccff7mr4845449ejc.44.1702501422461; 
 Wed, 13 Dec 2023 13:03:42 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 vg16-20020a170907d31000b00a1cdf29af64sm8345924ejc.45.2023.12.13.13.03.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Dec 2023 13:03:41 -0800 (PST)
Message-ID: <f63d5836-a4fe-467e-b928-184a4aafae26@mind.be>
Date: Wed, 13 Dec 2023 22:03:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Yuan Tan <tanyuan@tinylab.org>, buildroot@buildroot.org,
 yann.morin.1998@free.fr, Peter Korsgaard <peter@korsgaard.com>
References: <20231211095614.182498-1-tanyuan@tinylab.org>
In-Reply-To: <20231211095614.182498-1-tanyuan@tinylab.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1702501422; x=1703106222; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fxSenTQKvrJ7Cq51SBrveuWGys40K+i1rlYGwcHDwz4=;
 b=cLHv5dB1jY3ev8PfyNC6uogiykrtDBtHcpJbrXlZOHB8NU/MGTLuoSFYmRMB2lFiF4
 HPJ7C4x07gpO9X1spp46YTVaejoOGR2d3xILqHmwQ2H1mRXI8/ZsL2t9CBkMW2T7kdOE
 6sDrcS9xxCoe1pcfCMqJAnRDskHN5P2xeXjt9MP0yXXe4mtrzy47cZ4PHQwx52PAHixj
 PiVl/DCiKwyUkNTlFQrNAyUfPhcumTViYDVQP7NX3DHJijYMwG3dNvO/NwPhXe5KRGMv
 S0xlHNRxGWT33mST3QPpSw/fwbDmwRTddEIVNPmDAUVq671XaXll+FLjMFGB9NldgAqy
 RPew==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=cLHv5dB1
Subject: Re: [Buildroot] Inquiry About Mirroring Methods for Buildroot
 Packages
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 11/12/2023 10:56, Yuan Tan wrote:
> Hi,
> 
> I am reaching out to inquire about the best practices for mirroring
> Buildroot packages. We aim to establish a reliable mirror for these
> packages, particularly to facilitate access for users in regions like
> mainland China, where downloading packages can sometimes be challenging.

  We use cloudflare CDN. I just read up on it and it seems there's a separate 
CDN that needs to be enabled to serve China. Perhaps that just needs to be enabled?
Peter?

> I have two suggestions and would like to know if either is possible:
> 
> 1. Could you enable rsync for sources.buildroot.net? This would make it
> easier for mirror sites to stay updated.
> 
> 2. If rsync isn't an option, would it be okay to use wget to clone the
> entire sources.buildroot.net?

  Wouldn't it be easier to construct your own version, by running the same 
script that Peter uses to update actual sources.buildroot.net? Though IIUC that 
script is a bit of a hack.

  Regards,
  Arnout

> I would also like to inquire if there are any licensing or authorization
> considerations we should be aware of when mirroring Buildroot.
> 
> Thank you for taking the time to consider these options. I greatly
> appreciate any guidance or suggestions you can provide.
> 
> Best regards,
> 
> Yuan
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
