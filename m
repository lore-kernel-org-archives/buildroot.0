Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B152AC021B1
	for <buildroot@archiver.kernel.org>; Thu, 20 Feb 2025 08:58:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 537D0411CD;
	Thu, 20 Feb 2025 08:58:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a3d5kyA5It4x; Thu, 20 Feb 2025 08:58:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 33616411D2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 33616411D2;
	Thu, 20 Feb 2025 08:58:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 63761D92
 for <buildroot@buildroot.org>; Thu, 20 Feb 2025 08:58:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 51FD583F14
 for <buildroot@buildroot.org>; Thu, 20 Feb 2025 08:58:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oMVewTNb_7Oz for <buildroot@buildroot.org>;
 Thu, 20 Feb 2025 08:58:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 16B1283EF1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 16B1283EF1
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 16B1283EF1
 for <buildroot@buildroot.org>; Thu, 20 Feb 2025 08:58:07 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-439a1e8ba83so6022875e9.3
 for <buildroot@buildroot.org>; Thu, 20 Feb 2025 00:58:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740041885; x=1740646685;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=O4HJ605fmjmj+k3e+7/c/LY59AywJPC30rfoVJnDQo8=;
 b=cBPxmBLkqGYPW1gUN8yOEoMpNgRu68kAJg58peCNB9Q9ps0YeK+bhIKrTl4NbpK1pg
 m7M2TlEPRmNUHkdGj57yOfwRqDGCPwHKhva9fcP5h5VYQYiRRxuPGL/PLf9AHif5/Hzv
 YyzfepDcTe8GoP30MYAL/VFG2KxyGgzIqCSt0C1zibJj+iBKLotAkCHehnN2W+tUpfGN
 +i0hK70mTN0TI1dJPAi3hw0WxneT8zZhvTPnDaW6PIN31o17xHnoaXYi9uxJXLSrlCkJ
 cxTkd+91sBRXfekxG6D1hJkrDtjp2qfwpV8s8IlWl0v/Lslgx6YsIUGwf/kIC/g704XU
 zscQ==
X-Gm-Message-State: AOJu0YwOZwRzYzxyVW9H5mgSiAYBwqrE92ZQOHzJe2pIZ41VykrizICM
 1Sus+oaWXTUq1MN694dVvSOOhpVcSjkwMoaS61NtJ2eoXdhOKv+nCEJI+Qc1Lr4=
X-Gm-Gg: ASbGncuZF3CSOFyfcKetwAs/uAhuyVicnUi0YPbYllGhreDHeD5OMMhQ2RumyhSg1Cd
 9MJB9s7bsHYVTFk7KQ44uX8oF+BDNR5dEXKFjizns9IjHHZ7GqC+XhHeSeGEmj881ZFW/q9jLt0
 83A4oHkfD31PVDqcjB9O6yeoZP/FNO6T7S56Epea1ZW1wxnuJBABU2LyoULCEXugvTND49GgDIx
 jLLvyTfaWYYb34Bm0UdPHP1XtV37Re6aF4icwacp+430i0LqUDEGWmuEkCUWvztmwxjECtP3hKb
 xGD+6NygzUyMJiI7Rc4PynNCIpczDBdj8/ihQnAJc4+x6HKgMaqfjjZ4T3Hy9bAO8LeKNUi78qW
 E/Vip2iVVb7Pal/8Ftr7UJlmS4MMPQl03Gbg37tBhcJprBooXse4=
X-Google-Smtp-Source: AGHT+IEDiQBGr1gCls1o+JUhGgkewmjBc2XI8v9HliyiMKNHHNnEMjiItRPkqTU7jDnLlm6EsFH3Sw==
X-Received: by 2002:a5d:65c2:0:b0:38d:eb33:79c2 with SMTP id
 ffacd0b85a97d-38f33f51162mr14188408f8f.32.1740041885246; 
 Thu, 20 Feb 2025 00:58:05 -0800 (PST)
Received: from ?IPV6:2a01:cb05:949d:5800:e3ef:2d7a:4131:71f?
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4399bea8577sm36896875e9.0.2025.02.20.00.58.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Feb 2025 00:58:04 -0800 (PST)
Message-ID: <b0b7fa40-dcb9-4e9c-8fdd-01ef429c820a@smile.fr>
Date: Thu, 20 Feb 2025 09:58:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Niklas Cassel <Niklas.Cassel@wdc.com>
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>,
 Michael Walle <michael@walle.cc>, =?UTF-8?Q?Ga=C3=ABl_PORTAY?=
 <gael.portay+rtone@gmail.com>, Chris Packham <judge.packham@gmail.com>,
 Edgar Bonet <bonet@grenoble.cnrs.fr>
References: <20250204163622.192932-1-romain.naour@smile.fr>
 <20250204163622.192932-3-romain.naour@smile.fr> <Z7SSXM7bSGmshmtp@ryzen>
Content-Language: en-US
In-Reply-To: <Z7SSXM7bSGmshmtp@ryzen>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1740041885; x=1740646685; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=O4HJ605fmjmj+k3e+7/c/LY59AywJPC30rfoVJnDQo8=;
 b=tYKnwenbgX/tsEsDVOoVxaTP4ipROD9d0t2uBdqObhomo1xi4XmpA0kIca+ZTTpMc4
 N8VjUR4NRIYk5oGtDk8JzhWcrYuo1VBOEuvGCWWS3F5/Ov5Dkw/0Eu0FHCVdY2HqNTDZ
 nHhZzH9FrwGAQ2+OnFTr8QSSnpznvxy3uJne4=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=tYKnwenb
Subject: Re: [Buildroot] [PATCH v5 3/6] linux: introduce
 BR2_LINUX_KERNEL_CUSTOM_DTS_DIR
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gTmlrbGFzLCBBbGwsCgpMZSAxOC8wMi8yMDI1IMOgIDE0OjU5LCBOaWtsYXMgQ2Fzc2Vs
IGEgw6ljcml0wqA6Cj4gSGVsbG8gUm9tYWluLAo+IAo+IEFueSB1cGRhdGUgb24gdGhpcyBzZXJp
ZXM/CgpNYXkgSSBhc2sgZm9yIGEgcmV2aWV3LWJ5IGFuZC9vciB0ZXN0ZWQtYnkgdGFnIGZvciB0
aGlzIHNlcmllcz8KClRoYW5rcyEKCkJlc3QgcmVnYXJkcywKUm9tYWluCgo+IAo+IAo+IEtpbmQg
cmVnYXJkcywKPiBOaWtsYXMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcK
aHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
