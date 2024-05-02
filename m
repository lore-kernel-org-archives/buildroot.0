Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AF8FC4345F
	for <buildroot@archiver.kernel.org>; Thu,  2 May 2024 21:04:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AE221400AB;
	Thu,  2 May 2024 21:04:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QEKtM3PKqsvG; Thu,  2 May 2024 21:04:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B14C741BB3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B14C741BB3;
	Thu,  2 May 2024 21:04:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 34C601BF340
 for <buildroot@lists.busybox.net>; Thu,  2 May 2024 21:04:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2140060903
 for <buildroot@lists.busybox.net>; Thu,  2 May 2024 21:04:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2nWreYuVvdff for <buildroot@lists.busybox.net>;
 Thu,  2 May 2024 21:04:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 856C4608FC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 856C4608FC
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 856C4608FC
 for <buildroot@buildroot.org>; Thu,  2 May 2024 21:04:52 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-41a1d88723bso60164845e9.0
 for <buildroot@buildroot.org>; Thu, 02 May 2024 14:04:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714683890; x=1715288690;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ckSGz0X1Bmipx7H3gXLvIStXTi5uDHPBSLeYeTkFLNg=;
 b=KYkqig39e9PwY4QhHIGROsn62Bh7tMnY2g79wGtplAc5Dg9GSImrxbcny6pgxkfotn
 IITPTgyTc7fiOQAIROI2dJPT2dOc4sb4W84LwamyUQFtMMbSkFBToCTHeTELa7SHPs+A
 /Nf2lnzGCrVXlsm8RiG77kjYXkVtjfXQ2JNMnIUhzp/+hEUkwtSlQCQjbw2qtwOiz3IB
 mbr4+9HI6o5RKJ6KKZ00wxDJO8xCHuJvw6Iky/3KiZWNUjeDvVwXjfy1pgAZOcsd0Bjb
 i+i8gbKet1mwSToWT6Wi9q0OYXVMOTXZ15kQpst9vM8r0wdrxLqdZbuAf19huiIDVZVt
 JG3A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXTiNuLiznFskuyZyfBd8qFdfOF03F7DEI6E9CKNa52RzoxVStMxwWuCfU5oE/ZEdUmzDJuNWm+sMuYxlxO2ZVlJa7iePUU2w==
X-Gm-Message-State: AOJu0YwIwy+D3/z3BlLYNj+feiN6mlh9xt6jx6AAnUVBa8HOqF9J9r3/
 7TSwa8MmKJG2esmo874wq+3pLR7ZJkFy0pmfeZlnEQo7sBZtWmgoUxvwOA9wYdFeMCopAVbHqB/
 9
X-Google-Smtp-Source: AGHT+IE8wODCqSUlaVPMLl/Eh2cN6cGyAgvF3YzL4HVaF3ucklXfpcwVTkv3+Zf7oTJiKZBfXCpFZw==
X-Received: by 2002:a05:600c:5252:b0:41b:d973:253e with SMTP id
 fc18-20020a05600c525200b0041bd973253emr697802wmb.41.1714683890153; 
 Thu, 02 May 2024 14:04:50 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 r9-20020a05600c35c900b0041bf5b9fb93sm3157299wmq.5.2024.05.02.14.04.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 May 2024 14:04:49 -0700 (PDT)
Message-ID: <aaea6b52-14c0-44f1-8646-e7069b20ff8d@mind.be>
Date: Thu, 2 May 2024 23:04:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
References: <cover.1714243078.git.yann.morin.1998@free.fr>
Content-Language: en-GB
In-Reply-To: <cover.1714243078.git.yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1714683890; x=1715288690; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ckSGz0X1Bmipx7H3gXLvIStXTi5uDHPBSLeYeTkFLNg=;
 b=Q2RKH4ln2QYZ1hoe9IQWxO8vpVo0wp4UZTdsRr4Mgz6u9+3+hFQ3Kxtd/swiDCYWTq
 RkqK1wG3K4r6hdxM/oadn1odnyTfLyo3yZjmLvoFF54YSpc5UlN1WOYnzhwmsMWv8gaF
 +cECHGPwgPhshc32q4MAtfLjFRNvhdfs9w5gMaHh2IW87r2OkJMnInY5jmKynl0oLZ75
 4h8evrXLTLacwW2XInjd8XsilGJYALMPawmCJvbMZGiTyyYWh0XfKmvYy3xdl3zX4wX/
 XOkN6/lmxRpizlm0l2wJLr1pSpyisPXCnLzsnPqCV2ld6SIv6O/QsktzjNmyM+UGpOWk
 Mf8g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=Q2RKH4ln
Subject: Re: [Buildroot] [PATCH 00/15 v2] support/download: extend download
 features and reproducibility (branch yem/git-attributes)
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
Cc: Woody Douglass <wdouglass@carnegierobotics.com>,
 Adam Duskett <adam.duskett@amarulasolutions.com>,
 Francois Perrad <fperrad@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

  Hi Yann,all,

On 27/04/2024 20:38, Yann E. MORIN wrote:
> Hello All!
> 
> This series extends the download infra in two ways:
>   1. git attributes are emulated
>   2- download reproducibility is enhanced

  As discussed privately on IRC: while applying this series, I suddenly 
remembered that we also wanted to update the tar version used by Buildroot to 
something higher than 1.34. We're currently stuck there because of changes in 
the generated tar format, which also changes the tarball hashes, which would 
imply a huge refresh of the hash files that use VCS or vendored sources.

  This series, however, already does such a refresh of all the hash files, so 
it's the ideal occasion to also update tar.

  Therefore, I haven't applied to master. Instead, I've pushed my modifications 
to branch yem/git-attributes on https://gitlab.com/arnout/buildroot and you can 
pick it up from there. And I've marked the series as Changes Requested.

  Regards,
  Arnout

[snip]
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
