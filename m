Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C494C3DA45
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 08:31:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 474C08401D;
	Fri, 12 Jul 2024 08:31:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dwpORlxBnhYk; Fri, 12 Jul 2024 08:31:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4B59584027
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4B59584027;
	Fri, 12 Jul 2024 08:31:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 24A061BF584
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 08:31:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 11FC260AC3
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 08:31:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DFx7_Vitnvz5 for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 08:31:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 41A7260AE3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 41A7260AE3
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 41A7260AE3
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 08:31:01 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-42122ac2f38so10460595e9.1
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 01:31:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720773060; x=1721377860;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8Q5t/hD5CW0qRS3++uxEiTVbtxh86+nW8lN7DnN4r1Q=;
 b=nmIwMEC55OIgD1/fLvpzL0ppDv4GXEhNcmss6bi9M2+oH8cTxFsSvEIEaAD5ZFuAoA
 gpf3J7Zr/A+18pU2gNtWmkHQdB1DZsyWsUI8SMCSqCSBuLk2AnHK+RlhTvs1NrC2AkXj
 XNQHwtDE0iSaWOVockX9AK6sJUEK6Ik3wyNYyE+Q6DQU6Nsxw1AbaRMJAbxgWo0HwRq2
 LW7nIQejQJylYUUcR/VpgzI/W7pAAGjWkf4nR8ds8SRKKuj0e+hhfPvsITMJ7RNBF1Y+
 duUP2RIWLWNkOg7LwVlhrHkYvJ35ltwDKy6znar3jnKnygLC6gr2GtYmERxV5fOYSiTU
 2mJA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXdjP8eKHTdpOqFLe9zgRIfFiCayDY27drTcWdmItS/MiFEeFarQ7WFR0T57KLm6U9ZNXyYPK+tej3fxSMgRISzaYjIoDJbCg==
X-Gm-Message-State: AOJu0YxzMxC7pIFKAbWr4akbkWtwurfZ/M9Mp1JXAB6dBio2r/iYiXTB
 1VH9ZbqTSuSua0Vy9Xaj+rVZ4XmGKEylnwqgfcYB+aTRJtwGCjhlibKzrBSpL1s=
X-Google-Smtp-Source: AGHT+IHVAZJmB4YSyZaLwxARFOEYAF5QYmjsFI/SiCGLvfaRvUtrV8ZfcOEXVJMh6eZRiZQlEVlOXg==
X-Received: by 2002:a05:600c:3204:b0:424:7871:2e9e with SMTP id
 5b1f17b1804b1-4279dacf793mr15777185e9.6.1720773060052; 
 Fri, 12 Jul 2024 01:31:00 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:b481:98b5:611f:e783?
 (2a01cb05949d5800b48198b5611fe783.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:b481:98b5:611f:e783])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4279f288bd1sm14645895e9.24.2024.07.12.01.30.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Jul 2024 01:30:59 -0700 (PDT)
Message-ID: <87aa4c6c-19f6-4c09-89d8-af0a69429966@mind.be>
Date: Fri, 12 Jul 2024 10:30:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Brandon Maier <brandon.maier@collins.com>, buildroot@buildroot.org
References: <20240617-mtd-2-2-0-bugfixes-v1-0-a136825e24ff@collins.com>
Content-Language: en-GB
In-Reply-To: <20240617-mtd-2-2-0-bugfixes-v1-0-a136825e24ff@collins.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1720773060; x=1721377860; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8Q5t/hD5CW0qRS3++uxEiTVbtxh86+nW8lN7DnN4r1Q=;
 b=iLD7LxefewbLMCDjkPT/8LdDQS3pPnLdYx5CiAqyru5KwFrHKVOry+3OqqfuVca+Lk
 7UJTMIplzvJNIZ1lDzhCXfevyHpVzfEXunOZlPrVezKf/MhD7Gw2ohPq2fNpqLFK9Izy
 bosaDIqAiV4YYo5KXODQhcGWSZ5daBVTHqIdtQq1DOism/cRybfTg1b1W39gHhzPfUf5
 SD1KGVGoWENF0uPOHgr3ADqL0vavNRMUoW4BBfY6Ht//8z/oupg17PWaY93jX0703DFb
 w1wGkfd9e1YxoP+ru8E7K1UEDYZ4W8vjkTV+s0b25V+XNEA8Zsww4D5TKIuBt0rZFpmr
 CIWw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=iLD7Lxef
Subject: Re: [Buildroot] [PATCH 0/3] package/mtd: fixes and changes for
 release 2.2.0
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 17/06/2024 20:43, Brandon Maier via buildroot wrote:
> Signed-off-by: Brandon Maier <brandon.maier@collins.com>
> ---
> Brandon Maier (3):
>        package/mtd: fix tests compiling when disabled
>        package/mtd: make lzo an optional dependency
>        package/mtd: make zlib an optional dependency

  Applied series to master, thanks.

  Regards,
  Arnout

> 
>   package/mtd/Config.in |  4 ----
>   package/mtd/mtd.mk    | 24 +++++++++++++++++++-----
>   2 files changed, 19 insertions(+), 9 deletions(-)
> ---
> base-commit: 7bfea9372f1842279a8f57b5fc4428bbae822e91
> change-id: 20240617-mtd-2-2-0-bugfixes-995704faabb2
> 
> Best regards,
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
