Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFCCDF557F7
	for <buildroot@archiver.kernel.org>; Mon, 20 Apr 2026 09:35:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6F6C18268B;
	Mon, 20 Apr 2026 09:35:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id txtM0NxNuVbc; Mon, 20 Apr 2026 09:35:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 895F380B80
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776677736;
	bh=KG1Ru3U3mHUvIz2C0FXomFu87kRho66ldbfNzDFNPQY=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=rIgAEODO/lo84nPo+Uk6CE66LifWh7cwOuXALlW97d4Il51NNqRh9HQicDdmYj8ht
	 S2kNBhs8AR6X3dpPN7maytQkdGJ9BHc5h+KAhfByfdeFcKm1EC3C7ZTf7T226YqnZE
	 9+0ukXPA6VB3vw6+YwOqkMn1KWmIE022c2Qep60+8zJ/hlKooZGkwhI2HVoy2gmtSC
	 AMy+Xb+F75g+2M6U9/PrVm8iUkJqGyRpBMU4YqgsORXWlgW7Xgu7J9eEkFliY9N95Y
	 oWK9IXQ/R4ak0M4rCwUIt7mx61cqepdy3DIMJ3UjmOaZCboWv+GwV8vrJLKxH/sXyk
	 n6q06eWcBwjnQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 895F380B80;
	Mon, 20 Apr 2026 09:35:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 735CC24D
 for <buildroot@buildroot.org>; Mon, 20 Apr 2026 09:35:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 591C961090
 for <buildroot@buildroot.org>; Mon, 20 Apr 2026 09:35:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u8j3nHdiprQx for <buildroot@buildroot.org>;
 Mon, 20 Apr 2026 09:35:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=dowan.gullient@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2087B6108D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2087B6108D
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2087B6108D
 for <buildroot@uclibc.org>; Mon, 20 Apr 2026 09:35:33 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4891f625344so5460575e9.0
 for <buildroot@uclibc.org>; Mon, 20 Apr 2026 02:35:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776677732; x=1777282532;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YNWo4CkmBasENEhsqXqf9obOL4mgKrDFJFgEc1JVL1U=;
 b=fKONLG+knO9pve//dxOLBW6S3reKN9005uR+uR//6RvASi684ZWCbS8GAOPzRZ17y2
 bp4wNAVHCvXt9GmmWH+1vbIpMy2uluxQpjr21qph89Ms8+hzk5yQ7rTIx+4rHJ92ClC/
 rYE+FeoyTQYwXz6yCrFLyLG+/WAdYLIHJ5d5JGQjx8sYKO7sdQaBFBsfcs7HJvvWwg10
 RCtmDrum48r3TK4A9Es4sA/dODYd4NRm26ePJUjfJ7DxHBQptXCnKkzJ4lC9haAWRswW
 N9dW12eeMkqsYqj3wuQikRXycreFjh0/UBUaHCSSDIQI2vLe28kSEZT1ruc7QKEGrye8
 MCSw==
X-Forwarded-Encrypted: i=1;
 AFNElJ+/i7caCRHycJ0tdXuF4BmvBWj6MBFj4oF7p8mIaIZC/IsTKz2gWodv7zS0lzuZ/eFtTkQ+2LAAk3I=@uclibc.org
X-Gm-Message-State: AOJu0YxVKAC2uqGUCUwYL+wKRmLn8iIAAxHQeNIhZbalGzrDTUrJwRlk
 orZIeZ7PMx0gIzrINLMPSwAyJZDc3gPoOqDAXgCxXraMqQP1hGCU/jB2nq2c0LvZNk8=
X-Gm-Gg: AeBDieu23hHMo27dB9prsGXkQObA1vrq6phkOkf1SewVcd2eoFTKHrKq4E5jmwVMU90
 UBwHmSA/PkW4b6z8UsoS2IbZegZaLgI6V0lYWrjr1swQHXTe+NQObxnfAiQJvhuiEeG/HY/18Gl
 VYVkdst2n1HiexKBCJGg5Kz19pyhxltqKIiA5Dn4hQwnUShhzI3N3lQq/S69DVaE3ibg1LLhM5c
 YEPBosVOaDKgf2t0GgfF8L0QVskr++6TNZSp3s3yoPmo88DDScBeIPfnr2dLqajG2nIQE3dSxnQ
 VvLxmRxLl4EaP2TB1mRosQ7AdolyRzULV/ncff3BTMno+VFLAYF9tAzOnWUg3SF87K0jtvjht1t
 FJo6Js4fPz4J3On/YyHpkURnUa5OzNFnpjmVWmD2j5gSlPDRg+by6AitnWdd/5E25hzO+cUIb12
 ItBXjkF41z45ntVfjH5uE34IIUiCYCgTXZtXPwgrNnT7toXbIn1Z/hbIvVtJnS3rWlqw2gL/pNA
 st0CWjv/Mg3je9/iVr7d8ovyfM=
X-Received: by 2002:a05:600c:8b6b:b0:485:3c2e:60d5 with SMTP id
 5b1f17b1804b1-488fb8859ddmr172819715e9.2.1776677732003; 
 Mon, 20 Apr 2026 02:35:32 -0700 (PDT)
Received: from [10.5.90.6]
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488ffad20f2sm98173215e9.0.2026.04.20.02.35.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Apr 2026 02:35:31 -0700 (PDT)
Message-ID: <d62eff2f-4a14-434d-a246-05f2967a6c4c@smile.fr>
Date: Mon, 20 Apr 2026 11:35:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@uclibc.org,
 El Mehdi YOUNES <elmehdi.younes@smile.fr>
References: <20260417085936.200528-1-dowan.gullient@smile.fr>
 <20260417085936.200528-18-dowan.gullient__23313.2156588667$1776416437$gmane$org@smile.fr>
 <pan$e5c1c$f6ea9e55$8fb3420f$7ab0e74e@ID-313208.user.individual.net>
Content-Language: en-US
In-Reply-To: <pan$e5c1c$f6ea9e55$8fb3420f$7ab0e74e@ID-313208.user.individual.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1776677732; x=1777282532; darn=uclibc.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=YNWo4CkmBasENEhsqXqf9obOL4mgKrDFJFgEc1JVL1U=;
 b=YdKvN5SR58nEM3ohejWulxKTKvh6IUrsEUxuoAbRJlzWcjX93skgQoEGeefltFCLXA
 7O7A+V/w8fuNXGrE7YGRh42kl3+b8RBDrxkBhpEt7o33E8pSSocQbDIjd4qxppu8welj
 LO9Y6/NZL5uwv2TM2a8Bj/yCAwlTP8icZi81w=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=YdKvN5SR
Subject: Re: [Buildroot] [PATCH v1 17/21] support/testing : test_openjdk :
 Bump kernel version to last LTS (6.18)
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
From: dowan gullient via buildroot <buildroot@buildroot.org>
Reply-To: dowan gullient <dowan.gullient@smile.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello, thank you for your message, I will indeed create a V2 of my 
commit based on your contribution.

Best regards,
Gullient Dowan.

On 4/17/26 16:23, Bernd Kuhls wrote:
> Am Fri, 17 Apr 2026 10:59:32 +0200 schrieb Dowan Gullient via buildroot:
>
>>   ifeq ($(BR2_PACKAGE_OPENJDK_VERSION_21),y)
>>   OPENJDK_VERSION_MAJOR = 21
>> -OPENJDK_VERSION_MINOR = 0.4
>> -OPENJDK_VERSION_BUILD = 7
>> +OPENJDK_VERSION_MINOR = 0.9
>> +OPENJDK_VERSION_BUILD = 8
> Hi Dowan,
>
> this patch already bumps OpenJDK:
> https://patchwork.ozlabs.org/project/buildroot/patch/
> 20260313195744.991927-1-bernd@kuhls.net/
>
> Regards, Bernd
>
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
