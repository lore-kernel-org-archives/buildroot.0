Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 131EDE91297
	for <buildroot@archiver.kernel.org>; Thu,  5 Feb 2026 09:10:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BB14F82065;
	Thu,  5 Feb 2026 09:10:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pX1DuBl5EM2k; Thu,  5 Feb 2026 09:10:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B053C81E1C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770282623;
	bh=2+GAA+SzVOgOpdiCogJITftrnNbOGL1o4rhkbs+njV8=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=CtHPrUaMTB3O05P695ZnAHGIKMqFlBAk97UGVVu91LTk8mkEpfVxgr/Bsoi8mdUY5
	 9xd94t5yxepqjPbR9sCKN0OS2wEPSv/lRF6iEZ6nFIhza/AEgY2Z9CYCEZ4oQx86F1
	 DLaCJZlmKRghjHVn7jN1ta2YrLQDmU92kF+vTFTFyGWhPMpNV4UkPK6E5KZthOw8qt
	 UiOwvvYlmKA2moUbZ2BM95+AFeLFKBsruuA7bAlR1i7CVSyMd4P2B2mMArH1lPaQqx
	 bsBfomVqHUMovUdTt1htz9MxSyDXs8Ex425zAplHArMIrst/K+Ky8cFK6fN+3DJD1O
	 Guk/fLkg0yTzg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B053C81E1C;
	Thu,  5 Feb 2026 09:10:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id C4B03F5
 for <buildroot@buildroot.org>; Thu,  5 Feb 2026 09:10:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A981840D12
 for <buildroot@buildroot.org>; Thu,  5 Feb 2026 09:10:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a439SMZ1NSjn for <buildroot@buildroot.org>;
 Thu,  5 Feb 2026 09:10:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B59E540D01
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B59E540D01
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B59E540D01
 for <buildroot@buildroot.org>; Thu,  5 Feb 2026 09:10:20 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4807068eacbso5807215e9.2
 for <buildroot@buildroot.org>; Thu, 05 Feb 2026 01:10:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770282618; x=1770887418;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BXyKISYdFt91AHYSlVePcWdY/I/gxJZqI8T/zXu6FuI=;
 b=i+z6anxeW1xo21bLsMPPBwLsoZ4L3xrKZ0jBbFZHrWHAsbAgcAzNCjbeKHJ3k47SL3
 t1Apq2ta/Q70NNb4Uds+I+rLTnq+KPKj6LBchUwjpWUAPgm+zPsPT4ZHQY77asgYRSLT
 4YWLfT8scZ4T9+CU1zKr1IYIe1e0k/L8bxZD0PhRjfR3efO+jPpKCXAU1rn6SF8IDZLa
 xkJuyU+rJaDp/t+qFN4BIKZ8PtV9UiMOFX1p2sqUmreexWROGPl01KuGifg3QgJNpawM
 wJSFmFQZcQlwCpU9g6ryA91V8R8DYF42ieMmo48de6Y5S/91xDP+Ac6rVzUQe3Apeea0
 /QZQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXg41bGG3AjV00QO5N7eRwHBqDqHzaaMEg/NKpqb8fgKscDBTC1SagTwb1Hhr5nkjsLHJouXvWZNZM=@buildroot.org
X-Gm-Message-State: AOJu0YwD3knxTvg+w0gNqoTzmNPXIORGbqSQWOIyMkwCqpyBdd/7F28x
 OF/XYthYx6tq2/i9/Ujt2tbTAi2rZY31cRAG+mqmh4J2sl2Io3HzSxeE2Lta4MNXc2U=
X-Gm-Gg: AZuq6aIdjYyaHKh5CycPl7k1C/3vgQSI+gZO2fnNOiIUGb+NewrVTCUIRSa0NOl6X7A
 fRMub2mP392llhq6fNqeGkait0yBGpAu2s5aIoydZY4m3uAdEFzbdToXvQeoTTPrQOD4jSAM4Is
 zeanjzhp+Nn72NM1nanypk5IIriT3//OHvhe3C2jvuKQHP02F1w3GJB88deznUqjsOkC76Ox7D9
 O6MvzC1S1FQlmLn4hhNl5QCncE6Oi/xE8qLnZjQ2MqnKe6RVkzvHMJKXc23KIV3nhwvTxciOlyn
 u7rq8vGGQDSX6aTnay8DBqbfJiUQ1ss5k5Xd9a9UjGJaPPUGWhSj1510kMAVlnY9VA8p3qUNiP9
 AKnWdJJ+5IVw8MJ/LslbsryYJz7GEulGketYF3c8FgtIuYoqMD0hKEE86UdvVhiLAZITJDQuXS5
 3LnyclQ16HAULaT9Rl/LJjyDKVo/R+Qw7slZ4IJEp4bPeg+ZtDtimdZom1rJC1a+4MO/DtYOZAR
 5XLolY5+QjRc/Gg6nVDdKyaz88zCK31Yx1plyLJ0LfKcywr+31X6Q==
X-Received: by 2002:a05:6000:24c5:b0:431:16d:63d1 with SMTP id
 ffacd0b85a97d-4361805d638mr8704197f8f.44.1770282618209; 
 Thu, 05 Feb 2026 01:10:18 -0800 (PST)
Received: from ?IPV6:2a01:cb05:94a2:a200:2ad9:827a:59cb:148a?
 (2a01cb0594a2a2002ad9827a59cb148a.ipv6.abo.wanadoo.fr.
 [2a01:cb05:94a2:a200:2ad9:827a:59cb:148a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4361805fbc5sm11736566f8f.34.2026.02.05.01.10.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Feb 2026 01:10:17 -0800 (PST)
Message-ID: <13ba2d7c-706d-41a9-9168-1ebda42296bc@smile.fr>
Date: Thu, 5 Feb 2026 10:10:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Peter Korsgaard <peter@korsgaard.com>,
 Romain Naour via buildroot <buildroot@buildroot.org>
Cc: Julien Olivain <ju.o@free.fr>
References: <20260204173349.315559-1-romain.naour@smile.fr>
 <87tsvvodzr.fsf@dell.be.48ers.dk>
Content-Language: fr, en-US
In-Reply-To: <87tsvvodzr.fsf@dell.be.48ers.dk>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1770282618; x=1770887418; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BXyKISYdFt91AHYSlVePcWdY/I/gxJZqI8T/zXu6FuI=;
 b=yZ9+5NMr9ghrd6Td/TcKNSSCU6MtSnzPXtamvDsebh2BzOm/oWD26lKmpLlV93FjjU
 swVH7djuFHA6VofQmh6TXFDCUe3dzQkqL1RF77JrFZLBfT68IeuExMMZbx/an2CPDm3+
 fAWM3kLPm3T7FbEu6tWNNUK4d1sWbbx8Rvlgg=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=yZ9+5NMr
Subject: Re: [Buildroot] [PATCH] Revert "package/pkg-cmake.mk: add
 Platform/Buildroot-Initialize.cmake"
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

SGVsbG8gUGV0ZXIsIEFsbCwKCkxlIDA1LzAyLzIwMjYgw6AgMDg6MTgsIFBldGVyIEtvcnNnYWFy
ZCBhIMOpY3JpdMKgOgo+Pj4+Pj4gIlJvbWFpbiIgPT0gUm9tYWluIE5hb3VyIHZpYSBidWlsZHJv
b3QgPGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnPiB3cml0ZXM6Cj4gCj4gID4gU2luY2UgY29tbWl0
IFsxXSBzb21lIGNtYWtlIHBhY2thZ2VzIGZhaWwgdG8gYnVpbGQgd2hlbiBjbWFrZSBmcm9tIHRo
ZQo+ICA+IGhvc3QgaXMgdXNlZC4KPiAKPiAgPj4+PiBvcGVuanBlZyAyLjUuNCBDb25maWd1cmlu
Zwo+IAo+ICA+IENNYWtlIEVycm9yIGF0IFsuLi5dL2hvc3Qvc2hhcmUvYnVpbGRyb290L1BsYXRm
b3JtL0J1aWxkcm9vdC1Jbml0aWFsaXplLmNtYWtlOjEgKGluY2x1ZGUpOgo+ICA+ICAgaW5jbHVk
ZSBjb3VsZCBub3QgZmluZCByZXF1ZXN0ZWQgZmlsZToKPiAKPiAgPiAgICAgUGxhdGZvcm0vTGlu
dXgtSW5pdGlhbGl6ZQo+ICA+IENhbGwgU3RhY2sgKG1vc3QgcmVjZW50IGNhbGwgZmlyc3QpOgo+
ICA+ICAgL3Vzci9zaGFyZS9jbWFrZS0zLjI1L01vZHVsZXMvQ01ha2VTeXN0ZW1TcGVjaWZpY0lu
aXRpYWxpemUuY21ha2U6MjEgKGluY2x1ZGUpCj4gID4gICBDTWFrZUxpc3RzLnR4dDoyMCAocHJv
amVjdCkKPiAKPiAgPiBUaGlzIHJldmVydHMgY29tbWl0IFsxXSBlZjlmMGEwN2VkNDA5NzBhN2Rl
NGM2MDhhNTcwOGVmNmNlYjc1MTMxIGZvcgo+ICA+IHRoZSB0aW1lIGJlaW5nLgo+IAo+ICA+IENj
OiBKdWxpZW4gT2xpdmFpbiA8anUub0BmcmVlLmZyPgo+ICA+IFNpZ25lZC1vZmYtYnk6IFJvbWFp
biBOYW91ciA8cm9tYWluLm5hb3VyQHNtaWxlLmZyPgo+IAo+IEkgaGF2ZSBpbnN0ZWFkIGFwcGxp
ZWQgSnVsaWVuJ3MgcGF0Y2guCj4gCgpQZXJmZWN0LCBUaGFua3MuCgpXZSB3ZXJlIGRpc2N1c3Np
bmcgd2l0aCBKdWxpZW4gYWJvdXQgdGhpcyBpc3N1ZSB5ZXN0ZXJkYXkuCgpCZXN0IHJlZ2FyZHMs
ClJvbWFpbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xp
c3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
