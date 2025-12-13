Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB39AD59F76
	for <buildroot@archiver.kernel.org>; Sat, 13 Dec 2025 15:37:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BD7B382ED1;
	Sat, 13 Dec 2025 15:37:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sTndQlHPiCzs; Sat, 13 Dec 2025 15:37:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EE40E82E19
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765640242;
	bh=lZgYxqC89kHN7rfKsUIiqPB9ywLYt/UrYeYt4kARAWs=;
	h=Date:To:Cc:References:From:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nX6444/K/AqQLrd/QOWdoOOJstDhmx52qXzDiRttP9iJtkRiwdOvBO7BfSDKJZ9H4
	 8blDbBeW8Nc6GRwpbpxSNeseWGDY6pu8VkDn0pZH805EBXf/QQ2vs0dt3gDIkRJ61Q
	 sc428Ry3iht3L8bLNPF5eE/NKG1MtqACQ9Q/diRGiqWaWWbHsem4w90EhLFYKWBDVy
	 438dHMlaVT/a11hBMG6B403aBJhYXlK9O2Yw+WaTLnoZErspygHekBXsePYSoAYsQH
	 g6jcKen09/1ao2b+lXUxvYM4/rzR3SdDJnuWbNIRyKquA7M1EH354D+sVj3+Dz4KZE
	 gtq7f78p5I/VA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EE40E82E19;
	Sat, 13 Dec 2025 15:37:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id AFCB42C1
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 15:37:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A13D082B5E
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 15:37:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KDantIVm0MmM for <buildroot@buildroot.org>;
 Sat, 13 Dec 2025 15:37:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52c; helo=mail-ed1-x52c.google.com;
 envelope-from=raphael.pavlidis@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C5A3E822DB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C5A3E822DB
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C5A3E822DB
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 15:37:19 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-6498850d3f6so2785650a12.0
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 07:37:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765640238; x=1766245038;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dXKsTbC0cofJ4hu0EFoOUhrQahe1e0E0NTdAfnKWOmg=;
 b=wPt3itZpR1E0p9gY0x3bns/hQiPsIO5ojdn4IooNA4CJa29Ehbf4y8ORkA77CSH4T/
 GpTsfH3WuG8aTMgLX/xpIotasYg6ZrHIbN84Qtdf6alHepFhQm6l/cDg3bG414kGw6wP
 1um5LkqhLNWGFUj2vO+WSfQ+5n9bgqbAIqLGfWXzbrWiFx/LYCMd3yrEi1XrHfieAxvx
 k3lr5nozPrS7pqEaB1t/lnHY0+mtgmN4SOJpNF4ejGh3Z0GD1WVorxPrryG0q9t6ATWg
 8J8WsdgCeLoBOZLOX4AqOqOy7fsT1S3Cm+fZqxCFUGzlQJSddJf+VMYdKwo1JaVEQMjO
 9owg==
X-Gm-Message-State: AOJu0YzM3hBNpLP2H5Lb8m/zES1rzcDUvLxa7JqyEcB7Om7RZXdwgF0p
 /3c/DAM/eOnJzZEPigeXFvKea66xG7G6B2E/yqGC9ePRYzS1y4HdK0UqI1Kl6w==
X-Gm-Gg: AY/fxX6iLxeUX8yyA4povd/9d7umi8YPEKAG5S2Aou+1xldlS+euht/HVJMsk+bjVtx
 24qxCNmbY9/71du/XMjFVmb5ys2G/0x/FIjV+FBr7SXS+oC7VNf8YKVR4Imu9+BqsFgeaibDDVw
 7q6EBYd+v36YMhks1+RIzUItpa+bzk0VCOKevG1j+ydCJo7pQbBfBEcx/sp36OQHDI1f6BqGWxX
 XgxwF45FJ4/kfrbjZRe2RsBLzPYRtvORE1soXFgAUVmkvHO71TUp9OSjqeWR5Z3tUVr7G3eklkA
 QkL3J53gfwsOMQ5U0OA4JiEqY9KE/ZtPcITnCBvem87aa4wggaJQS0Gp9vGK6bzXh/gk8ua5pL+
 TgwY6NirMKCrR0GrbmNKjLUXIpk7+A5UIe76itRKWxT2TzcEjGKXbf+scUorxSaMvHea4+tR75X
 jcgPl4d4dbgLvxYl32EbqADM1ZP89hYYSdyg==
X-Google-Smtp-Source: AGHT+IHD+qTnWCrv1CFhBZeTuEdxSquy+gvUsStoD0Ynepp8g0IQePMeQM9osUWpDNHcr3w7t0lU5w==
X-Received: by 2002:a17:906:f585:b0:b76:2667:7728 with SMTP id
 a640c23a62f3a-b7d23b84c18mr549161766b.46.1765640237393; 
 Sat, 13 Dec 2025 07:37:17 -0800 (PST)
Received: from ?IPV6:2a02:8070:2483:7e00::213f? ([2a02:8070:2483:7e00::213f])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b7cfa519205sm853862266b.32.2025.12.13.07.37.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 13 Dec 2025 07:37:17 -0800 (PST)
Message-ID: <29b1c9b8-ba4c-4fbe-a445-733bdd664388@gmail.com>
Date: Sat, 13 Dec 2025 16:37:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
References: <20251205171837.22075-1-raphael.pavlidis@gmail.com>
 <20251207153233.166a575b@windsurf>
 <1d599696-da61-443c-87c1-3405c24808a7@gmail.com>
 <20251208172039.7c07673b@windsurf>
Content-Language: en-US
From: Raphael Pavlidis <raphael.pavlidis@gmail.com>
In-Reply-To: <20251208172039.7c07673b@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1765640238; x=1766245038; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dXKsTbC0cofJ4hu0EFoOUhrQahe1e0E0NTdAfnKWOmg=;
 b=NXuIErzwo03ZPp1gQ7ybO6ZM8vjkJdwx/lNZ8oxNOAA95IMAa9o97tPR68mCRcJetW
 c9FgGlI4rU34oXt7E2erL9vTEdayRT1HUEGLQ1eZAoBLI0JK4R3a/t4NrqBXiFIfMQ+E
 965WskA7JD2h3a3Hghbl5c1nJtp1TuM4siZtU9VhM37wai1+o4M2VUjzdkz28h4gBUac
 +skQ1oB/yz8boevOx+7KbD37n/qhWFau2mFncGeGADpVR2NVNKaAgEzWQ9ygageAQV80
 tc/fr0D1vUOV/Ixxs95+tlSMiWh5IrMMfcsVxnz4N72xxKmsKeJUVwlRWUO9h/BdViIN
 BE9A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=NXuIErzw
Subject: Re: [Buildroot] [PATCH v1 1/2] package/xwayland: add nettle and
 libmd as sha1 libraries
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Thomas

On 12/8/25 17:20, Thomas Petazzoni wrote:
> Hello Raphael,
> 
[SNIP]
> 
> Seems relevant. Could you include this explanation in the commit
> message?

Alright I will do it.

Thanks a lot!

Raphael Pavlidis
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
