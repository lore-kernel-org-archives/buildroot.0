Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E69C8C001DE
	for <buildroot@archiver.kernel.org>; Wed,  9 Aug 2023 20:21:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3DB5160BA3;
	Wed,  9 Aug 2023 20:21:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3DB5160BA3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J4-wL3Y9chxr; Wed,  9 Aug 2023 20:21:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9F24260590;
	Wed,  9 Aug 2023 20:21:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9F24260590
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F1FF71BF3EB
 for <buildroot@lists.busybox.net>; Wed,  9 Aug 2023 20:21:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C96C84137D
 for <buildroot@lists.busybox.net>; Wed,  9 Aug 2023 20:21:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C96C84137D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UXKkwTJ04z2J for <buildroot@lists.busybox.net>;
 Wed,  9 Aug 2023 20:21:48 +0000 (UTC)
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5B08C409EF
 for <buildroot@buildroot.org>; Wed,  9 Aug 2023 20:21:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5B08C409EF
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2b9b904bb04so3687811fa.1
 for <buildroot@buildroot.org>; Wed, 09 Aug 2023 13:21:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691612506; x=1692217306;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8SD3NjEgAzAOUQyFHkRekms+/Cek3BTfw+hwh8b3UM0=;
 b=luvE12ixuHt0XxGCRhYlbFZpMcRwG9AQLaPYwDgcUkQ48d2JFkbgb1HPGb9dnGpjvy
 OQa4Rf3P7OcogCMsj42TOEzUmCZtVe3kGoaH7Zdu/Tow09woWEvwfDh5FIfuXQ4z1MEc
 cuNKVIOqcykP3HC4E1s7lZkUXX4DTXFzmy4LPeqjCjh7ojvVEVBn/ZObkKvT/w0RKiom
 BPcoIY4AWDH7xE8NJX4ttsbEy9/mhwPxQScnydcjR44bNVgtiLg693pyxslSdp8lpf/x
 JYPcU1QI0fYn4e1wt9XW6HqlcZUogfwO3c/4QT2smNBs64e/r3kGyen5RTFaRcG/Pp4r
 rL2g==
X-Gm-Message-State: AOJu0Yw4whR4Kr5tFTxpMKxUbj37cZN20pI3Cm2gSRaVwTEUXo1fVQ50
 URP2xILNZ3w6LZ8UL6wiDzFK4w==
X-Google-Smtp-Source: AGHT+IEG/p+vJ8/ccQh/AD24QhghNSIBPuHPCx1sVUHU+1jGpbixjgThIpUlsQDlzZvjrukMOiwnVw==
X-Received: by 2002:a2e:884f:0:b0:2b6:e2aa:8fbc with SMTP id
 z15-20020a2e884f000000b002b6e2aa8fbcmr220531ljj.8.1691612504260; 
 Wed, 09 Aug 2023 13:21:44 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:dd61:254f:5a09:dc06?
 (ptr-9fplejq6xo58kteed52.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:dd61:254f:5a09:dc06])
 by smtp.gmail.com with ESMTPSA id
 c9-20020a170906d18900b0099bc038eb2bsm8384951ejz.58.2023.08.09.13.21.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Aug 2023 13:21:43 -0700 (PDT)
Message-ID: <50ed3d73-757b-666f-bd77-a2877b773b5c@mind.be>
Date: Wed, 9 Aug 2023 22:21:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-GB
To: Vincent Fazio <vfazio@xes-inc.com>,
 Nick Betteridge <lists.nick.betteridge@gmail.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
References: <38cce51d-40e8-1e28-ed5a-0d2c9f8a710a@gmail.com>
 <PH1P110MB1603A41B40688C71A511E6D19F0BA@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
In-Reply-To: <PH1P110MB1603A41B40688C71A511E6D19F0BA@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1691612506; x=1692217306;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8SD3NjEgAzAOUQyFHkRekms+/Cek3BTfw+hwh8b3UM0=;
 b=HCphhq/Z5lBwWpd7XRmvGQE/dqNa9cFH1wPq7j28U2fmxj5ifUENb/JxgAxPJ+kOHJ
 IjAlRnYgbnre4zMH4dIqZ4k99fdbUl3xGTIciOCFDtiU743S45dWjPiTujCm5IM/uofQ
 MzWxSIF43MAfom+SoR48fnaoYVPncb8HpDMVsqx5tEuDB6uxJYB5J14jFXbElkFMHlYv
 s33TpVLmAEfqLOKL9+7jbVz7ASq7ZqX5/vYb95ojuuizO/LuRFlOtC2vYmf4BRgHVBea
 BfC0ldQuBhccIj1jLcNYzjIB8BasZm7VOnalgx4MFHXPKMTLUBKumFjdu5ZylgbI0kik
 tMjg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=HCphhq/Z
Subject: Re: [Buildroot] [External] - Arm cortex-a55 problem when building
 busybox
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



On 02/08/2023 17:24, Vincent Fazio wrote:
> Without a defconfig with which to reproduce, it's hard to say for sure, but it seems like
> your compiler does not support `-mcpu=cortex-a55` which was added in GCC 8. There
> is a check in the Kconfig menu for this when building a BR toolchain. Are you using a
> custom toolchain perhaps?

  It looks like toolchain-external-custom is missing dependencies on 
!BR2_ARCH_NEEDS_GCC_AT_LEAST_X in its version selection... Care to fix that?

  Regards,
  Arnout
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
