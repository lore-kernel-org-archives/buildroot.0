Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25835C4829E
	for <buildroot@archiver.kernel.org>; Thu, 15 Feb 2024 10:20:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C9C0981E64;
	Thu, 15 Feb 2024 10:20:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1F2zb8rOpTPf; Thu, 15 Feb 2024 10:20:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DE83F81E65
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DE83F81E65;
	Thu, 15 Feb 2024 10:20:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B88601BF30F
 for <buildroot@lists.busybox.net>; Thu, 15 Feb 2024 10:20:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B35D381E64
 for <buildroot@lists.busybox.net>; Thu, 15 Feb 2024 10:20:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Fjjvz6LyQNrz for <buildroot@lists.busybox.net>;
 Thu, 15 Feb 2024 10:20:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com;
 envelope-from=alexander.sverdlin@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 233B281E15
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 233B281E15
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 233B281E15
 for <buildroot@buildroot.org>; Thu, 15 Feb 2024 10:20:52 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-33cf6266c76so414677f8f.1
 for <buildroot@buildroot.org>; Thu, 15 Feb 2024 02:20:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707992451; x=1708597251;
 h=mime-version:user-agent:content-transfer-encoding:autocrypt
 :references:in-reply-to:date:cc:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DB5iRAuJrXaiB6wcGl2XT5jxuxwJ1Cs2Qi0oxg0mtAw=;
 b=ZBMDNwrnCJ9Y7wZmwW29EzubmurcuPBUF3g1JFAVVmV613AkG3cPhVYhT2w+Aineb7
 VJQvjVydkNdIMYHp/VWL37OqXOXw1HGHPc+kdfSt+qjsyN4+XDc9/Lgg0EJOZQUWTsDI
 4oh6fLCdsI9GrFwIr2dR3fRVE1VwWb+zYpUq1EeIKx19JP0+8x6/zpcSMZ4l/7g3pE3s
 RV7FqcH1NBgovOQ55nvUuzw/OlnObYQKD5FoHd/JIIeMQsv7nTqdJvdFs8lcYyCPuE5k
 YdgJYef8x+L7SXwIrA5lv8BfpHcOEQO3d6sU5/rpg9Ms5olRKHupGyl040qJ5lqe1utC
 g+yg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXzgtUvIh/xzub06VkDvmIR3wFNf44hxCsytT8QAS05uz95BJ/hKHP1j5Hwb0+86l6tvCdYukiIb5C7uXg0F+bQp5XVxNgP0w==
X-Gm-Message-State: AOJu0YyiZIhxG800F6zUBqYEa9w5lPvx1mDixpPBep50mdVj2rwAfGjT
 o1FVC0MaF1Zqvvd5I8tyoZ1QugJSnG7Tn0HSySJhKuOlW23m3xpl
X-Google-Smtp-Source: AGHT+IGls6CjGoaWjQHSj2QitV5/XcbtRiJ89YviS4jsRasiPW5WnxAkyHtj1VvlO2Z2Ez1G8w4kuA==
X-Received: by 2002:adf:e74c:0:b0:33c:f090:ac59 with SMTP id
 c12-20020adfe74c000000b0033cf090ac59mr1121348wrn.54.1707992450699; 
 Thu, 15 Feb 2024 02:20:50 -0800 (PST)
Received: from giga-mm-1.home ([2a02:1210:8690:9300:82ee:73ff:feb8:99e3])
 by smtp.gmail.com with ESMTPSA id
 s7-20020a5d69c7000000b0033cf453f2bbsm1302096wrw.35.2024.02.15.02.20.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Feb 2024 02:20:50 -0800 (PST)
Message-ID: <8981fdd9313957b6f0174ac03006db1063b395f7.camel@gmail.com>
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Romain Naour <romain.naour@smile.fr>, buildroot@buildroot.org
Date: Thu, 15 Feb 2024 11:20:50 +0100
In-Reply-To: <20240213172817.2872849-22-romain.naour@smile.fr>
References: <20240213172817.2872849-1-romain.naour@smile.fr>
 <20240213172817.2872849-22-romain.naour@smile.fr>
Autocrypt: addr=alexander.sverdlin@gmail.com; prefer-encrypt=mutual;
 keydata=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
User-Agent: Evolution 3.50.4 
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707992451; x=1708597251; darn=buildroot.org;
 h=mime-version:user-agent:content-transfer-encoding:autocrypt
 :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=DB5iRAuJrXaiB6wcGl2XT5jxuxwJ1Cs2Qi0oxg0mtAw=;
 b=ZtIvaGS2HcB7g0joU1kO14bTfYJC50OCuL2gY4SQDfssFv/Eaklq/DWWts4wFEyjlA
 fJV7utpeHl4BXRRrLGTD27OPHIgao6WqKxV+HRqcVay+pwim/nbwk/6LSJ/r6yXu7p/+
 s7x6cgZTlljqdVKQCCpvwOssOBRFmKmCHMLgYKliXyM91KKxQYdmFcox7+SfxYYsbYoL
 bk0ySUQ4i6XC70WUc1FeBcsfLqFpqYyMqZP8m2tCxIQLZWPuD4UFzRniLU8aSzeUrdTg
 bS2lYWfsOEmXjwwD3eC4NuFwsmp/slrGLdLVBHc9Z75PT3VyFDSahdBGDZb0SNmV5Dih
 kXwA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ZtIvaGS2
Subject: Re: [Buildroot] [PATCH 21/21] boot/ti-k3-image-gen: remove package
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
Cc: Xuanhao Shi <X15000177@gmail.com>, Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgUm9tYWluLAoKT24gVHVlLCAyMDI0LTAyLTEzIGF0IDE4OjI4ICswMTAwLCBSb21haW4gTmFv
dXIgd3JvdGU6Cj4gLWNob2ljZQo+IC0JcHJvbXB0ICJTZWN1cml0eSB0eXBlIgo+IC0JaGVscAo+
IC0JwqAgVGhlIHRhcmdldCBTb0Mgc2VjdXJpdHkgdHlwZSBvcHRpb24gZm9yIGltYWdlIGdlbi7C
oCBWYWxpZAo+IC0JwqAgb3B0aW9ucyBhcmUgImdwIiBmb3IgR2VuZXJhbCBQdXJwb3NlIGRldmlj
ZXMsICJocy1mcyIgZm9yCj4gLQnCoCBIaWdoIFNlY3VyaXR5IC0gRmllbGQgU2VjdXJhYmxlIGRl
dmljZXMsIG9yICJocyIgZm9yIEhpZ2gKPiAtCcKgIFNlY3VyaXR5IC0gU2VjdXJpdHkgRW5mb3Jj
aW5nIGRldmljZXMuwqAgTm90ZSBmb3IgYWxsIEhpZ2gKPiAtCcKgIFNlY3VyaXR5IGRldmljZSB2
YXJpYW50cyB0aGUgVElfU0VDVVJFX0RFVl9QS0cgZW52aXJvbm1lbnRhbAo+IC0JwqAgdmFyaWFi
bGUgbXVzdCBiZSBkZWZpbmVkIGF0IGJ1aWxkIHRpbWUgcG9pbnRpbmcgdG8gYSB2YWxpZAo+IC0J
wqAgY29yZS1zZWNkZXYtazMgZm9sZGVyIGxvY2F0aW9uLCBvdGhlcndpc2UgdGhlIGJ1aWxkIHdp
bGwKPiAtCcKgIGZhaWwsIHNlZQo+IC0JwqAgaHR0cHM6Ly9naXQudGkuY29tL2NnaXQvc2VjdXJp
dHktZGV2ZWxvcG1lbnQtdG9vbHMvY29yZS1zZWNkZXYtazMKPiAtCj4gLWNvbmZpZyBCUjJfVEFS
R0VUX1RJX0szX0lNQUdFX0dFTl9TRUNUWVBFX0dQCj4gLQlib29sICJncCIKPiAtCj4gLWNvbmZp
ZyBCUjJfVEFSR0VUX1RJX0szX0lNQUdFX0dFTl9TRUNUWVBFX0hTX0ZTCj4gLQlib29sICJocy1m
cyIKPiAtCj4gLWNvbmZpZyBCUjJfVEFSR0VUX1RJX0szX0lNQUdFX0dFTl9TRUNUWVBFX0hTCj4g
LQlib29sICJocyIKPiAtCj4gLWVuZGNob2ljZQoKYW5vdGhlciBvYnNlcnZhdGlvbiBJIG1hZGUg
anVzdCBub3c6IHByZXZpb3VzbHkgQlIyX1RBUkdFVF9USV9LM19JTUFHRV9HRU5fU0VDVFlQRV9H
UD15CndhcyB0aGUgZGVmYXVsdCwgd2hpY2ggZGlkbid0IGJvb3Qgb24gbXkgSFMtRlMgU29DLgoK
WW91IHBhdGNoc2V0IHN0YXJ0ZWQgb3V0LW9mLXRoZS1ib3gsIHdoaWNoLCBJIGNvbmNsdWRlLCBt
ZWFucywgSFMtRlMgaXMgbm93IHRoZQpkZWZhdWx0IGZvciBBTTYyeC4gSSdtIG5vdCBzdXJlIGlm
IHRoaXMgaXMgYSBwcm9ibGVtLCB0aG91Z2guCgotLSAKQWxleGFuZGVyIFN2ZXJkbGluLgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1h
aWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9v
dC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
