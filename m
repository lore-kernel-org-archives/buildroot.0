Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20C1BC5CFC1
	for <buildroot@archiver.kernel.org>; Fri, 14 Aug 2026 14:08:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D8C2C40E11;
	Fri, 14 Aug 2026 14:08:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jFpmi28mnaap; Fri, 14 Aug 2026 14:08:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3059B40DF2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786716494;
	bh=xEmU6qzyWEjFe1HZbbcoK3s6WxYPd8FQ/hhUW1ZXC/s=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=OquydxHjGkZXYpWxNjZmmEzXmEDCf3soQU1yds5VP6lI4CNuxIFFQ193nGTH8oJnb
	 W7G3IJpd4wLsXbVg3q91wSSXFT1irPGHxeKrNHxUGg/fwluZNTANT80T2P0bgMGUAH
	 OKaHKHGl11WSVtxTOK9FUdNpWuYIV5MsXm0B0cyjRdVEss/O3hctpWey7FH00jFrsZ
	 LtsmsHAE3NIM68oENfsi1sD9vQIrQEReC0h/XZn8U190LTx4azTKwzyzzsY1FeX1AF
	 7YnUF44wVKpbCxhPY3XciuS1yzWWEmoG2pTPf73wNPrV94P9OCoTbYBJSkcgFpmbZE
	 vTTkMlqkUV8Mg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3059B40DF2;
	Fri, 14 Aug 2026 14:08:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 95C951B8
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 14:08:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7C8A24011F
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 14:08:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0xyNmGVlsrcI for <buildroot@buildroot.org>;
 Fri, 14 Aug 2026 14:08:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A3DCF400A4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A3DCF400A4
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A3DCF400A4
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 14:08:11 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-47fe89fb333so621048f8f.3
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 07:08:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786716489; x=1787321289;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=AQmVlKoVpR4SlWbgUsfAgDPuEZfdi96VBjxiphppS2s=;
 b=gwrQev5RMRYaNI8TBoeBgVIpA7jJcj/YRFvNufGKDUZGCgMdl6vE0gAwkt+4hdacoF
 9KtYkBp0/3/mdmED6iZbRUnWDF3ajyeZGAfQOsDjGIrn9LmQgFakQyJm1ivKi0TCKaHN
 y8d/tVxyIicr2NuXuTpig5K53RuVshDBaA6KPRN+dm3wHt3Adsxh4O7IUBlQ0ekO3f6F
 etfnZKa/ABwkVdPWX2G67H1Yayev47qzo+WFnGIUzQ1nLoSudLgS2454IkXHFDbcmcBW
 stUVj9dt2bv97i+UPGlvTkBSe+xo8kfei0AvR2vTVAJGYOUj0uo7EN6XxskIAjxgUVue
 08lw==
X-Forwarded-Encrypted: i=1;
 AHgh+RrvlroD4M1yuQjRJPNGhckulBydMu0KxLdotjKSlhGi0rocjbqUmTpVLhxWD7iSDswjIktL6VufN/0=@buildroot.org
X-Gm-Message-State: AOJu0YyjppS/GgEZq/SbM7ZCFE6pRYoLKl9z73OD1bQDSIflCMHAsSIu
 F296qR6uqjfDjONC8RNg2qO5IZyuMBwVGt2jMnBrzT/bUJ6bHBTk3XJhsngONJ12eqA=
X-Gm-Gg: AR+sD12vj1R6VyZNA7ewZDBKgOgExweFFBdrPsvehfI6olcvTJJgTcZQqxLKVBy0BIo
 72k9L+kRboJCnXRXmwj57zD36XXMrtdpY8baAM4LWe03G6/4zv3GYBxN5N81pRL47n9UgA3UnyK
 Vyi1JtrtB7d+Upa69RoWcOwL3C4RsNMir55qnear8a+De0dqL89K7rtLp3xcClFgoGC/sBvaikS
 o5u5JIRA0eGju3y3xpGOfs7uzLgVJspPbII+4g0yvWTxfOafnOkpY41hUg9u8htuJ8Lckjp2jnE
 lDi7wAHJR0YM10Nr7gBjztgv9EXub63HM2FLY6K6EhW0616XqnLdiYWy585m7h3CfMFNdcr1ToB
 TYkj/ySt2+GA5cFBdNcm72fUQtN5WBbYnVKBiuJJlEVjw5U2SSEy7H4NOSJRdj+VJPJXNL7TkJp
 gfXgEOBc2ErW9nnT2L4aIIzwsBxBW2c3Wjf/VGgj3ZMDR/y8qUfBTkCjMglVebKCOI0Qh2PXBVf
 WflWpBtbpW8k12HMlH95x7KlXu463oo+Al7p790tF/6jo56
X-Received: by 2002:a05:6000:1a88:b0:47f:9ac6:ca60 with SMTP id
 ffacd0b85a97d-481606a45abmr9142123f8f.0.1786716489506; 
 Fri, 14 Aug 2026 07:08:09 -0700 (PDT)
Received: from ?IPV6:2a02:a03f:63ab:dc01:1291:d1ff:fe92:3b5a?
 ([2a02:a03f:63ab:dc01:1291:d1ff:fe92:3b5a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4815f21a068sm8438090f8f.12.2026.08.14.07.08.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Aug 2026 07:08:09 -0700 (PDT)
Message-ID: <3e70e3bb-301b-4e3a-b8b3-eb4bd672af78@mind.be>
Date: Fri, 14 Aug 2026 16:08:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Neal Frager <neal.frager@amd.com>, buildroot@buildroot.org
Cc: alistair@alistair23.me, stefano.stabellini@amd.com,
 ibai.erkiaga-elorza@amd.com, luca.ceresoli@bootlin.com,
 micheal.saleab@amd.com, yann.morin@orange.com, matthew.l.weber3@boeing.com,
 brandon.maier@collins.com, john.ernberg@actia.se, brian.j.wood2@boeing.com,
 ju.o@free.fr, stewart.hildebrand@amd.com, thomas.petazzoni@bootlin.com,
 romain.naour@smile.fr, michal.simek@amd.com, romain.naour@gmail.com
References: <20260804102449.1532082-1-neal.frager@amd.com>
Content-Language: en-US
In-Reply-To: <20260804102449.1532082-1-neal.frager@amd.com>
Subject: Re: [Buildroot] [PATCH 1/1] DEVELOPERS: add Neal Frager for xen
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

On 4/08/26 12:24, Neal Frager via buildroot wrote:
> Add Neal Frager for xen and qemu-xen packages.
>
> Signed-off-by: Neal Frager <neal.frager@amd.com>

Applied to 2025.02.x and 2026.05.x, thanks !
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
