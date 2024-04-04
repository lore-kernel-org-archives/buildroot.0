Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5A0CCD1292
	for <buildroot@archiver.kernel.org>; Thu,  4 Apr 2024 13:20:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7F7814193C;
	Thu,  4 Apr 2024 13:20:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fb8e7Efsb1VQ; Thu,  4 Apr 2024 13:20:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4D6D741A85
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4D6D741A85;
	Thu,  4 Apr 2024 13:20:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 02C661BF337
 for <buildroot@lists.busybox.net>; Thu,  4 Apr 2024 13:20:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E46D7830E3
 for <buildroot@lists.busybox.net>; Thu,  4 Apr 2024 13:20:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w9Y-99PgEU5u for <buildroot@lists.busybox.net>;
 Thu,  4 Apr 2024 13:20:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E4E9783027
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E4E9783027
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E4E9783027
 for <buildroot@buildroot.org>; Thu,  4 Apr 2024 13:20:55 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-343cd12630aso222665f8f.1
 for <buildroot@buildroot.org>; Thu, 04 Apr 2024 06:20:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712236854; x=1712841654;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=X71mWXKBOq9FE4y9Xrw3KtpRItRRvLeG0BiR4i6y4T0=;
 b=T0TD2HjRrkJaOv6gmv4zcw2u11Txl54dc+MIUGw6/HuFRvhtmdke9v4uEDMeYHNVNl
 CospvYAFPsKLVMHaS+/4wEIkIOXEYRxjXhcsnRpIhLK12iO8Izi8yOTcrPNLPSfzejLq
 AAq9rABoySMNUGJ9dsxSTnzmhB825/yOSkSAJURCsx6gocFMXjPdSd+Xw6LQG8YIQrj9
 B0TawIjFLGOIL63SKCw4HXRzVeiu2CWyoI8rUdZvVPkP4nVp/lAzmrwaH/auioR1ZXi9
 X+5DtffO6dYMIRepzOeeap2eYm2aauCym76nRcHCRwFRzLHYBiDAX/O1GBfqJHrfxQqU
 VNhg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUNvyNIvbNOP95QSSaPbIWU/Oco0Szk+nApI+vkQK0XJpPVmgunDwJL3rMTIDWeLFnzGyTdw9oTqWqWAiz4V5UXgT2tFJmoTw==
X-Gm-Message-State: AOJu0Yxk5RUZbzfYdIc0SNlyxyN4Yza09vkPJtKRqo5LsSkhqHm92on7
 H0UVtEb4KduJWV/WoCkqt35B4vBee21+P7LJ+O1hsH1db0irgDqpAn1DkbxYUK4=
X-Google-Smtp-Source: AGHT+IFDgYcNmUoi486XAb/8hdpAX5vuYpOcHShXNdlAQr5HCxKODL5VkpOzS8g18ZoX/1m5Km7oNQ==
X-Received: by 2002:a5d:4b02:0:b0:341:c996:c15a with SMTP id
 v2-20020a5d4b02000000b00341c996c15amr2107870wrq.16.1712236853668; 
 Thu, 04 Apr 2024 06:20:53 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 bo15-20020a056000068f00b003434c6d9916sm11770228wrb.110.2024.04.04.06.20.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Apr 2024 06:20:52 -0700 (PDT)
Message-ID: <e4bd62b8-a697-48f1-8a60-2f78bb802467@mind.be>
Date: Thu, 4 Apr 2024 15:20:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Romain Naour <romain.naour@smile.fr>, Heiko Thiery <heiko.thiery@gmail.com>
References: <20240403195403.1359007-1-romain.naour@smile.fr>
 <CAEyMn7YZB0q1p56F4ECOemAEbJReDUDLUuKBQyp6H016gCL7Fg@mail.gmail.com>
 <edac4a6e-c07a-48ce-9f9a-13928f8c898a@smile.fr>
Content-Language: en-GB
In-Reply-To: <edac4a6e-c07a-48ce-9f9a-13928f8c898a@smile.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1712236854; x=1712841654; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=X71mWXKBOq9FE4y9Xrw3KtpRItRRvLeG0BiR4i6y4T0=;
 b=JgLzA3y9hTiMhjBtRnJfwM0WMGyiM40QXxxEb4FYf9DspjQ/sRjL7wL/4aZ5KnAP2m
 2YSy+myR13vni8BMdW6ourZJ3cvxP8M3TVbffe4pspm8lyo+/W1Rveui2aLDGVVjZBmu
 6uS3LuCVhTl09ywDueBSfjzhKHXk9fRGKvv2/1ry1NYRd6p0tEHg0cJMsQFNfn6J0879
 6+Pj3hFMt3qUIffFZIyT7CTQDC6U8/AyvuY7V3bppckVZ2JVz34zkqrwFtu0QpMO7x5i
 a9cXBdewz3RaVxK3iB9xVU9Jvv9agdTbkbikYIcfCMLriHT7ANpXYCT4crHhqV5i12a/
 NY8g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=JgLzA3y9
Subject: Re: [Buildroot] [PATCH v11 00/17] Add support for AM62x-SK HS-FS
 devices
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
Cc: Michael Walle <michael@walle.cc>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 04/04/2024 11:39, Romain Naour wrote:
> Note: the arm-trusted-firmware used in TI AM6x defconfig are using v2.7 while
> v2.10 is already available. meta-ti on kirkstone seems to use v2.10 already [1]

  I would prefer to use BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_LTS_2_8_VERSION 
rather than bumping to latest.

  Regards,
  Arnout

> 
> [1]
> https://git.yoctoproject.org/meta-ti/tree/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc?h=kirkstone#n1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
