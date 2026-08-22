Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4DD3C5DF97
	for <buildroot@archiver.kernel.org>; Sat, 22 Aug 2026 12:39:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B4845810A3;
	Sat, 22 Aug 2026 12:39:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RZKlBIKbNGIU; Sat, 22 Aug 2026 12:39:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787402354;
	bh=un75EH1RNPd5kA6JGpWkAWT03fhoHgeVqrIlQbmGiB4=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=jDu/dKjiYYdzUNCDV3Z6ntKwul/NoIiCCVNKY3h/DAgQKtoSBTD+h6F3hB3q2NobH
	 udyR4NzQn+WCVyBIpMiinUwvJPAH8Ow5Ds+KI1K4XY6eGp1S1W8hKBygikcd4aROg+
	 Kvv8eCViuZFFJjrvXLUX8UmMLdv/D5NLMwL4qNSNiisvHpmqHn2k5p+e00OMBQ6wIJ
	 198NGenBr3fE9aCtjJU+OziJJtGPo/3HSeutzNeoGaraKM3y9wWyZp0FvYZUdO9tt4
	 vgxy15GO+NU7tRPYY5xbTuefb+PPqTwwGVFr/9d8Rdn3E/dFxAtNUsQktQI2N6jZXt
	 2J5MWzZPwmocw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4A30980F8B;
	Sat, 22 Aug 2026 12:39:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id E15482B2
 for <buildroot@buildroot.org>; Sat, 22 Aug 2026 12:39:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DF07E40549
 for <buildroot@buildroot.org>; Sat, 22 Aug 2026 12:39:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qlQ-slUOTCsC for <buildroot@buildroot.org>;
 Sat, 22 Aug 2026 12:39:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62b; helo=mail-ej1-x62b.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DA4D240475
 for <buildroot@buildroot.org>; Sat, 22 Aug 2026 12:39:10 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-c2074710751so346717666b.1
 for <buildroot@buildroot.org>; Sat, 22 Aug 2026 05:39:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787402348; x=1788007148;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Ld+sCjigThom1sFHNwdcadnXWtqnP+OtLeH6FrTQOBg=;
 b=ry2cXa1H8WTUV8CDAgnZRQpxMY56yEWYbDi1kOOoJBWcKYz82gxmf20L08kRWtoHxi
 ThcnMhA8rv+RCQzZMzajuIXHackkNYGAnJCxgKU5TEOgr63p73HYi84T5OwKgWEcAowA
 9rrsDYiigpxr9dpdYm7trxpyrSkOYKOXFbO6ifi+LLl1BgjHXtEet+GCW1/DL9AHQ4HX
 g0WHu72pWaOdllzBaPBhhewkXhLx/1Mm+CYwjZAxQJEatBBFPlokrszWOsIMQtNrGm+B
 wHjCNoejs+rBjDVQcDXp1mZChd/EviSycbH2vjZOAhS3fOVJH+DKgDieH9SQu6lPDA1W
 ATpQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RoSr8JMgO1O+dEDmo20BdRJWJoTRwEbjGWEr1jwCVz9pZfNWo0AFDc3AvsAQeQ4IIIeJT3KGyen5nc=@buildroot.org
X-Gm-Message-State: AFuF++n0OMlqF0Q+frcyzVqq+bxxf+FiTGMUHAcpXVyaqcdvV/LJTyHM
 q302k4pQc5qJI+WPw/wlbmapBhQoJTGKgjfNTTBJCxkE6V5uGjMT0JNzQhZOGfmgUy3vu7Gm4EV
 GVrZd
X-Gm-Gg: AR+sD11E7w+/ClGvMu7yYb4XjVGA0F58PN0XT+JDEAWGjYC2ByV4pnBlmu7a2TmXcPF
 WY6DYN/+K8W98jBZ+ag/yWtVBJ5QQwjTfmXyacefMezziOse5p1lRohmx3+cgPLEdwDPhiKuLls
 oojK06yLJCIegSKN9cJxdDjK6oo7F2A8m39ejnqvhYpgFwTu4lAqatver/m+ZKhToDMBwTJVr14
 EiWW3CdFc8fdcZKrfV8W+ZQ5hT1jrEPisGWWerznElJkjyr1AY8OU4nWZmBEYCK6pQj+99rwDdi
 M2TiefsOlXP5CG3Wcrnq7mMRP4zHVMb97FyCbiW+bFbR9Gv8/TkYLGtdIOv6KjMEiS13ZgK1/Eg
 jUnIDxZyZrKkdeUneICFFmhr6n2sZRVwR+qXPhjeKFHSBL9b7RSYupUk3AvBovQrGsLTFNrF9BJ
 xuzYgGdjiXOlr84P+9m8fc7YCGcxXVbj9IV1AWKkQhrQq10ZTi8VKM9Ps2pQRTwLb88fg7aqF+u
 PWQvSjmHc6Nvq6Iuvkb+VjrHmKxlr00PZEV65ghSMpozk9+
X-Received: by 2002:a17:907:c8c7:b0:c24:680a:1c42 with SMTP id
 a640c23a62f3a-c2491c9a6eamr656057466b.7.1787402348485; 
 Sat, 22 Aug 2026 05:39:08 -0700 (PDT)
Received: from [192.168.129.33] (154.186-200-80.adsl-dyn.isp.belgacom.be.
 [80.200.186.154]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6a3ff0c3491sm11921940a12.10.2026.08.22.05.39.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 22 Aug 2026 05:39:07 -0700 (PDT)
Message-ID: <30dd8a1a-33e9-4688-a766-c76e099bf24d@mind.be>
Date: Sat, 22 Aug 2026 14:39:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Waldemar Brodkorb <wbx@openadk.org>, buildroot@buildroot.org
References: <aoC7Qd8pbR8RIl0H@waldemar-brodkorb.de>
Content-Language: en-US
In-Reply-To: <aoC7Qd8pbR8RIl0H@waldemar-brodkorb.de>
Subject: Re: [Buildroot] [PATCH] package/uclibc: Fix SSP support for RISCV32
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

On 15/08/26 21:17, Waldemar Brodkorb wrote:
> Add patch pending upstream to fix SSP for RISCV32.
>
> Fixes:
>    https://autobuild.buildroot.org/results/1b6/1b6f2161b11390b6545bddbc39b444401c718ebb/
>
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

Applied to 2025.02.x and 2026.05.x, thanks !
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
