Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99506C5AC7A
	for <buildroot@archiver.kernel.org>; Fri,  7 Aug 2026 11:45:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B74AE60905;
	Fri,  7 Aug 2026 11:45:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PJeOAabiyc-n; Fri,  7 Aug 2026 11:45:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8637E60909
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786103152;
	bh=sWJ4fXFqPVb1BuQGo+QzBUaE+gY4mc2ktBlfdblchqE=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=sx5INTF5abaDM0a36NS80mvWe81eXJKv1t7VCTUxs2nOladfN/YP1lGbrbo9jEnx/
	 ERsXMQB8qdUeZY8lvJhhFT/CyYQt8y9ONGki5VZ9z6OkbCIVNbaHD9YGDNUIKghlFA
	 5HvJaTrYFP2i83xDlkNyvM+CeFeXN/eHVj6sbuv2wycMM7ggnTTI1zKvvd4mtydmKy
	 g8wgVoluvcsdARZPsGNfyluJtWgdcjEcsJp10GRBMqj6/m+5nMIbLEn7y25YnMRaXs
	 vXxOVnQZfqQeXhCPU2qC4l6UInV2SD9jz+V25prAkF7janvwExVm5tb3SEaqLGNxUV
	 mBKXSvhWVvW9g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8637E60909;
	Fri,  7 Aug 2026 11:45:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id E12FC259
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 11:45:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C77F640A6C
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 11:45:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Cs81uflbdiGR for <buildroot@buildroot.org>;
 Fri,  7 Aug 2026 11:45:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D006C40A69
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D006C40A69
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D006C40A69
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 11:45:49 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-47ddf7b09e5so3111994f8f.1
 for <buildroot@buildroot.org>; Fri, 07 Aug 2026 04:45:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786103147; x=1786707947;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=9MaS40PL1oSf7/ujHGbIE30fOUmClXeMjc+rWiyX5jo=;
 b=SOCnV0R2+28dNSqv/7xZj//RpBJMDUEFZHtG33myJqoqW/FH6agbcvIIfT5KfTEWAx
 0/0URNwgSEJVlhyFLyWkmMsxhBHdJ2KinA1NpQ5877FJgPy7D5uEdzHOFSliFkz3+Qb1
 6uf7IQjWtojqWS8/ZL9QWOojdvKkVUYRxZ4G+zm1pT2w0HsLQ21Kr24+Gid/aXHZcd85
 sA+LeQePGY05dvRn3CBqh+g7ASQV7cLSrelgwSdO2ksekjyzUyquVbd1p59LvymB296r
 kWi+bE3ubz6LYgBc+c2Spza40NzeH1mosLuK13Ed84N1FJDNr1HCW+XDiYG0nONxIy30
 Yc3Q==
X-Forwarded-Encrypted: i=1;
 AHgh+RrW0jpUk0qCvMK4ZTJzyX+fRPQzo841ryMKBNkrql+bpkRUL1olJQ84m/g17LPLEnQzA4k0XLsx3AQ=@buildroot.org
X-Gm-Message-State: AOJu0YxG2lJbBcWLrJ81VgEdTH6GKgjb3kLc7rDYe9FaHRmik2kzIH0S
 //HD8WZMIO4EU8kLQJhndNK9ew0cOMKPa0AfPGhzpbTSQpRRYZS7dlCP21kmO5c+Oo59nqAdOW5
 uBVzm
X-Gm-Gg: AR+sD10Foh+yLtarFLEEtUZYid5nrArrHK9KtdIc44R9nvJA8eqMHaPovEFjPB9T1ZK
 X8/oeudx5iaeqo/B7d8zLrAfjaOoHiwUowm6mqae90CREuPIN9lHFctka4wBXPJ+6xtQYfF5u60
 yPcwFWG3KOouLjKs+ZYb72ZeSLGysvsX+yBBIJjwyFWjgpNXIrZ01MmJPilkKAFMQ6Vs1cgJPbe
 7Gi59OwyY79cM10TVBhhIuK0S9UDOj+tSMvxdR9JG7RmGxTJEDTJVKkIfWcRE3xtHZeiiboaEA3
 yV/sZ5LGQEIzEsw4A3V1ujoL35xzR60/BCjB189sJLdBQs1HORP5cQoKXQEfrMHUXIk08/BKIJX
 dhmWAuDwfEngv5Y4Z99XHAITatJHHX5epbniojVCHEZm5pdLXTKqIGSKDw1tEjgXA0iIjWRw/9D
 0HU8dX7ZbmPs4MS8003/yQ1M+RT3Rw2hWWQINAr0MvxBB4FeynntfpDTBXzABYRfPCInnZrszM9
 72ygCK0l4fie8Z56pwPOL5KG8DZpbSW+/5IxedcELD7ZxBz26C4u0nUs8uBjYi6THY6s2Q=
X-Received: by 2002:a05:6000:46d4:b0:47f:34ba:2d0d with SMTP id
 ffacd0b85a97d-47ffd21d9f3mr9408483f8f.8.1786103147103; 
 Fri, 07 Aug 2026 04:45:47 -0700 (PDT)
Received: from ?IPV6:2a02:a03f:63ab:dc01:1291:d1ff:fe92:3b5a?
 ([2a02:a03f:63ab:dc01:1291:d1ff:fe92:3b5a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4800220727bsm5262628f8f.33.2026.08.07.04.45.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Aug 2026 04:45:46 -0700 (PDT)
Message-ID: <4211efdf-cd76-4ffa-84d7-3547c524ae25@mind.be>
Date: Fri, 7 Aug 2026 13:45:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: yann.morin@orange.com, buildroot@buildroot.org
References: <cover.1785315694.git.yann.morin@orange.com>
 <908af995a945a17aeb8612058a0b67e97e13231b.1785315694.git.yann.morin@orange.com>
Content-Language: en-US
In-Reply-To: <908af995a945a17aeb8612058a0b67e97e13231b.1785315694.git.yann.morin@orange.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1786103147; x=1786707947; darn=buildroot.org;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=9MaS40PL1oSf7/ujHGbIE30fOUmClXeMjc+rWiyX5jo=;
 b=EJF1/v4PnnGjSbAQBjDMYxPytsQU0KNDZQkUN72iXBYMLgf6Qb7Gjm0bkkq3MScD5M
 YPFbCu4veLowWlt71G0nb5Qvwx0269mRtQuV/0e/mgjg0PthGdkhu47AVh8vFORQHgPN
 Sym74Empeja/M0y3TVaYxNAEo3atzzi6rOkivKSEJPW8iIAxeUkr1aqDXRgCwowgMzEF
 0j1r3WJ2C4jfJ1khG4ra3kGDYQyEDB7wWRftQY7O1UhWyN5pGda1hPn4USEa2muO5byK
 VeBXf+H3n6uUIWBZce2ugGBIDelm9FymLgZh433Dy4opwktXpwhAwXs4mbynarI6joef
 zRmQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=EJF1/v4P
Subject: Re: [Buildroot] [PATCH 1/2] package/docker-credential-gcr: bump to
 2.1.32
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

On 29/07/26 11:01, yann.morin@orange.com wrote:
> From: "Yann E. MORIN" <yann.morin@orange.com>
>
> Changelog: https://github.com/GoogleCloudPlatform/docker-credential-gcr/compare/v2.1.30...v2.1.32
>
> Signed-off-by: Yann E. MORIN <yann.morin@orange.com>

Series applied to 2026.05.x, thanks

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
