Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBEE4C5CFC1
	for <buildroot@archiver.kernel.org>; Fri, 14 Aug 2026 14:11:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8582C40E31;
	Fri, 14 Aug 2026 14:11:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dynr7T2KKzMw; Fri, 14 Aug 2026 14:11:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A979240E44
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786716673;
	bh=5v4puhoMKa3Nai6g70L0Qfi+fVRFghldNxWd1VGnBK8=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=ihfE5dEfjSCc/dXcndF3NFmNga5Zo2G7lnKwcA5rQTZ9V30+XxvhAS7JPMPSs5Xzg
	 nV/Qz2pDymbnZgtP+hmtHcEtaZA8aFfbfnTaoMEoNMPFlY4fUNQ0U6klz6G5GkVToX
	 54QUc7ezyd0IYtaual0Mpk8Zzf///bSZZYFWP3SEbg8BfYTnSgOwgBJYEU7oUNQhBC
	 qO7o5BrPq69M64FpeacFHA/ff5iBRD9yL+41408pgxUhmI0FCg2xAnNP4j5kwY5UP6
	 ui6TkYIt5sWTNDOvi/L4YarikbOX0uem/cBFePxj54lb45PnRB+mVc2ZHf+ydRJmgE
	 VqooFl7ZYHZrQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A979240E44;
	Fri, 14 Aug 2026 14:11:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7C2F023F
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 14:11:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6270F400A4
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 14:11:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jNtkIlLo5DIq for <buildroot@buildroot.org>;
 Fri, 14 Aug 2026 14:11:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 611B34011F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 611B34011F
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 611B34011F
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 14:11:11 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4954d29264cso5639655e9.2
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 07:11:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786716669; x=1787321469;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=j+y4CLNumsxFhe5G2t5gekB7AGiZ531X2iGxPBdSvg4=;
 b=POuh+WYTP9kp4MP/EMDpIqHQrq9waGmivqKuW5wjyQEpIGc3cwL/1aotrvBIBwm3Hp
 VLD+ob8bCLGR83mvNoL9i5BKZV6aB+5lfHRmhPHdN5TXcHyzWs+7HcPERs4FQukb2YaZ
 VSuPazKAXJmaSDq27E3fTqIcSKOvJK8hBXq+erKGsU7C84q7qm5NrZja75rYzA3T85Mv
 STyc6DkoMKcG9DP+EvwtjZ1XFYA8PU+k8D6hZy6jwXafgwCPmcB4X0GVg69XJb0vg7wb
 jxrl8lSZeNQJzi27Fs08124WvZmmVNfxDoEDycp57pJJ5tAxHwXjKvpt3ZZPyKHyPGYm
 00+g==
X-Forwarded-Encrypted: i=1;
 AHgh+Rod+FS6FY0dtW7ZJBJVgtjgDC0vZpin8/AXcqGbKGO1B2AbdLzus9xnqoQcdOtqcuM0HI4xE+wCDSQ=@buildroot.org
X-Gm-Message-State: AOJu0YxsR13xMPzKr87/G5qwfUW62/25Hr+vhmDNqezDmCM0oDQQkoZV
 3C/2FZjum0gtbkkgYITlPPmF01BBPgaEnf4qNgnO2VJ4+WC1qPZyEY4KAsAEc6hQSJc=
X-Gm-Gg: AR+sD119Np98oWiTt1C5gX1nkhNGe81gS0WmxX3yM9owy1zX43XbnfZFgqT+0hZQtUe
 YTCqK7kb3xc8ZXfjYaoCINKrkb3q7WuLp6F9wVMOwNaSP2uaSINdmnEgrrwTMgOtLpy1WRsoc+D
 6yHDqiAChAKeRspjulJJ+v4rxL1lJKIWLqd/LoIUTz9k9Zm//fXGU7j0wbOEoYa1Eue3JlWnG12
 vxfmLr2sT9q/1jED2RxoLg0RL7/8QhXZTz8AznegwUM/yzxhmznSebTUanhY50YbIa8KjbpMFcI
 IgKasEhbl1zVG6G5Zeb9OrRLX+HOvf51hkMTDkhEHnoE74+HRRGcQ+a4xzFJXyzBwePkJyXmRxX
 FjuCXBLM2KvuH5ChPLyO149iaFSegzOmL5k4YVNLdl1ExgrSfHmnSfj4y47Y1u4M2lUKn2M5V8N
 9gt1XEEeRNsJRzmK9LSF0JZ/KFdc8nFoMV3fWB7RCJz5ePrtnJEnCFEIwish78yrNIPv4WV9jaj
 AgXdLU1w5QHxu3rIV1BzJDTTiG6AFaHXzdP1z2F1d4Ruzhk
X-Received: by 2002:a05:600c:4e14:b0:499:7e2b:8e5 with SMTP id
 5b1f17b1804b1-4998793ffe7mr91871185e9.5.1786716669356; 
 Fri, 14 Aug 2026 07:11:09 -0700 (PDT)
Received: from ?IPV6:2a02:a03f:63ab:dc01:1291:d1ff:fe92:3b5a?
 ([2a02:a03f:63ab:dc01:1291:d1ff:fe92:3b5a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4815f2c46besm8344046f8f.31.2026.08.14.07.11.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Aug 2026 07:11:09 -0700 (PDT)
Message-ID: <1796ef6c-e030-44b1-a22e-36efba7ecede@mind.be>
Date: Fri, 14 Aug 2026 16:11:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Romain Naour <romain.naour@smile.fr>, buildroot@buildroot.org
References: <20260606225120.409046-1-romain.naour@smile.fr>
 <20260606225120.409046-5-romain.naour@smile.fr>
Content-Language: en-US
In-Reply-To: <20260606225120.409046-5-romain.naour@smile.fr>
Subject: Re: [Buildroot] [PATCH 5/7] configs/acmesystems_aria_g25_{128mb,
 256mb}_defconfig: remove defconfig
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 7/06/26 00:51, Romain Naour via buildroot wrote:
> This configuration for the acmesystems aria g25 were added back in July
> 2015 (commit 2e52be798276fe0c28949f4a16fce0ca20e52153), and has not
> been updated in any significant way since 2019 (the last major kernel
> update [1]).
>
> This defconfig still use a 4.19 kernel that is no longer maintained.
>
> Remove its support.
>
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/14728913801 (acmesystems_aria_g25_256mb_defconfig)
> https://gitlab.com/buildroot.org/buildroot/-/jobs/14728913800 (acmesystems_aria_g25_128mb_defconfig)
>
> [1] ab10b5b3ee6aa1e19aa6264153eeed9054d4c2e7
>
> Signed-off-by: Romain Naour <romain.naour@smile.fr>

Applied to 2025.02.x and 2026.05.x, thanks !
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
