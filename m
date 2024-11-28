Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C828D70DEB
	for <buildroot@archiver.kernel.org>; Thu, 28 Nov 2024 20:11:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D027A4055C;
	Thu, 28 Nov 2024 20:11:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8Sb8eR9kEf5L; Thu, 28 Nov 2024 20:11:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C1ABB4055D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C1ABB4055D;
	Thu, 28 Nov 2024 20:11:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7EA08712
 for <buildroot@buildroot.org>; Thu, 28 Nov 2024 20:11:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6C5184055C
 for <buildroot@buildroot.org>; Thu, 28 Nov 2024 20:11:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1S-Fv1pADYEt for <buildroot@buildroot.org>;
 Thu, 28 Nov 2024 20:11:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com;
 envelope-from=robertoxmed@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 71B544055D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 71B544055D
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 71B544055D
 for <buildroot@buildroot.org>; Thu, 28 Nov 2024 20:11:16 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-385d6e36de7so479780f8f.0
 for <buildroot@buildroot.org>; Thu, 28 Nov 2024 12:11:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732824674; x=1733429474;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3pFOnTTHWv4FZPujLJzsCKznA4RSFvzlBILJKaW7BMw=;
 b=PsLbVyvx4lEG4f8bzYPDlBVbThSnFFlTphPhQwnZIJhsdiPjk1jnezeOY8iDqXKfpR
 YOIGaKDM8KbHBzWEZhA+H2Km/gBSW9AHh51MPuYR7kfocsQ07JCubSa9Uyt0R6E8cvmX
 r7Ujkzh9XpWn5xdKU8NZRhhWuqk3z2wEA29fEogj87VK2rDbVS6q0wD37KoGwGYh8/SC
 3q9whSU2l5sfEGAVL3e8BVCsY0bVL3wHLCxGUh9VkWSdK1xuIbfJJnUhPK8UmZABUD1e
 XZ/KiCeJuoQZ3PYu5zKNpN7cS1em1oDz9/A8EZgtU/fuvx1ngXgfIxZZuZIqzTFOIOH4
 88SQ==
X-Gm-Message-State: AOJu0Yz3TIUAbInnmV/i9Q7jfWKuDfUWPsJokVhoywQlfcohj2xBkfBK
 W/wlwtvhQeDfAR2RHptfh/TbQ5yaz9E1LWFdax0WMVK2ZzOcZie6whrAsBxd
X-Gm-Gg: ASbGnct3gKy0RbOdBv5bQSS0xO3uy+5vzUEPtgWSwX9ChhwQSwhqqUZ5esBQ9kfofDx
 RNBp7HhuJTyHYVcodPq3SZuB6Q4TApA29WDMZK26N9bFOHrjkff8a7D2XJQtUWkoiQ/dyhwCYO0
 vqG9gDduTOxW6gkAUHfc5KkG4kuXTnzRDDqcnXCzvHjjXbxNnGfPPX2J7ysbXr2DSFb96J9+js0
 OhZuWK+GjOQLPsgeW5S8UhsDGD8rmm2Uk6wfhqOeka2xTOPGL0+QWr7CHOqcO0MwgCAApxTN5rr
 f7ZxEXBM6SjLcWZHDPh0lcf/
X-Google-Smtp-Source: AGHT+IFuOrOU6OyDl2BXgN+DHUV5GRnPymaFVFn/wFv2JEgRZNCrPrw51UYq3A3rUM3NV2mbzAt/NQ==
X-Received: by 2002:a05:6000:2707:b0:382:494b:3327 with SMTP id
 ffacd0b85a97d-385c6eb7a70mr6284039f8f.17.1732824673912; 
 Thu, 28 Nov 2024 12:11:13 -0800 (PST)
Received: from ?IPV6:2001:bb6:11e3:a300:da4d:c63d:b184:11d6?
 ([2001:bb6:11e3:a300:da4d:c63d:b184:11d6])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d097e8e25dsm1042731a12.62.2024.11.28.12.11.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Nov 2024 12:11:13 -0800 (PST)
Message-ID: <8fd22598-c0af-4d39-b87d-0c9b4259b0bf@gmail.com>
Date: Thu, 28 Nov 2024 20:11:12 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org
References: <20241117220500.584642-1-robertoxmed@gmail.com>
 <20241117220500.584642-2-robertoxmed@gmail.com>
 <8ad05d9774584d398fab6e43dc1bd3ca@free.fr>
Content-Language: en-US
From: Roberto Medina <robertoxmed@gmail.com>
In-Reply-To: <8ad05d9774584d398fab6e43dc1bd3ca@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1732824674; x=1733429474; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3pFOnTTHWv4FZPujLJzsCKznA4RSFvzlBILJKaW7BMw=;
 b=dW4UM75C/Puuhi1H1XUzIukNdqT0ejIQwW3CtJJ0gLvPZdEGl6Spz2YYG3qXO4/D9R
 k1OdBonqFMkB0seHI+SAC/8t6GP1Ve+LH4qPQeWkTk7JBfq3wOBWGUq4ZlAc8JVrKsNZ
 NAWBpcsAmeZxa9Zmm6w1adOlKw6tB3pRB7hY4RoEFD0zBJmvDsYASIoCyggTFKaO14vp
 CjB17ITB7nyS8an3CM40rmfKfUrjU2D3G3vJY/N3PfzYKO1BiqsTkrGAcywbLh/diHrL
 355snUqCOBDh7UogUEgmJI7PLzllS2I2NO6Sof3AuA/j7X0+ohHi7MtrN/e0QfW1lp3t
 8fNw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=dW4UM75C
Subject: Re: [Buildroot] [PATCH v3 1/1] configs/roc_pc_rk3399: Bump Linux,
 U-Boot, TF-A
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

Hi Julien,

Sorry for the late reply.

On 11/18/24 8:54 PM, Julien Olivain wrote:
> Applied to next, thanks.
> 
> Side note: I updated .checkpackageignore, due to a
> "make check-package" error.

Thanks for the fixes!

> Could you do those change in a future update please?

Sorry for the naive question, but are you expecting a v4 for this bump 
to reach master?

Thanks,
Roberto
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
