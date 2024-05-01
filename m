Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 001F8C4345F
	for <buildroot@archiver.kernel.org>; Wed,  1 May 2024 21:09:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B97734016B;
	Wed,  1 May 2024 21:09:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qT1u3NwAO4Zv; Wed,  1 May 2024 21:09:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DB23341777
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DB23341777;
	Wed,  1 May 2024 21:09:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 766971BF384
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 21:09:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6FF69820D4
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 21:09:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V1eMFf42xdCS for <buildroot@lists.busybox.net>;
 Wed,  1 May 2024 21:09:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5532E820D3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5532E820D3
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5532E820D3
 for <buildroot@buildroot.org>; Wed,  1 May 2024 21:09:36 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-41b7a26326eso44872615e9.3
 for <buildroot@buildroot.org>; Wed, 01 May 2024 14:09:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714597774; x=1715202574;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ABQPGLbsPHAmLtk46oTVumF4IbuTVzeDrXNQu+Os6T0=;
 b=d0GJGKGBf+FVSlB8fwECwrNSnVR3DmySf/HrETpgAzt/Td5S2YuvnurDuhMBwBEFoH
 RDDPl0SGdc5MyxWZuTn9DJggESTnX7gXpjiqYddtGysglnicvIAMsEzEq+Q85yl5HTRF
 UvhuuOf5Pf5Rt4fTESi9nItb2ikNzn+958r03A+Q6qrmFUTia3l8fsHttFE/9qgjzlpa
 qo2BBTIlIfLRj+8gAD27kKnEvmcbQuAFNk/y/V+am+nJmgtzjZOqKf5Vx6MchJoN+NHI
 ov052hsPZAqhjhBlfMoxPC1isHRXaB6FwL6GgA4To/e9wEfHREUDb5dI9XCY3+E/5GpI
 puZg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVG3BMb6rntPe7pVoXvzkY404MnzpNsevWeDy16vK8AQV2h0Ny4Wi2UBBXzS7tEuUlQjErzNKJ5OoSfHFNIHwiI6zF2sHzjJA==
X-Gm-Message-State: AOJu0YwXUwFEQ5aK3dNPEFPxu0rU4FIo0sgoVGLz6uNhiSLvH9pQWr5D
 gBMyrx9kbdDvPt4LBsum5Hs0tnjphEOEeC8Qzus7CzKf4M5ZwoBfY93huRu5Xp0=
X-Google-Smtp-Source: AGHT+IHhKUoc81URGqQwHAdt+KZ9OPeeoy2eZ43Omv6hWb7vkjmeRG5qk1aBoy00KWYsiA/0jFve/Q==
X-Received: by 2002:a5d:6409:0:b0:34c:c1c:8413 with SMTP id
 z9-20020a5d6409000000b0034c0c1c8413mr81950wru.58.1714597774201; 
 Wed, 01 May 2024 14:09:34 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:e3ef:2d7a:4131:71f?
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 f7-20020a5d6647000000b0034dcb22d82fsm2504684wrw.20.2024.05.01.14.09.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 May 2024 14:09:33 -0700 (PDT)
Message-ID: <2a3bb6ef-f536-4257-b5bf-382e0882f945@smile.fr>
Date: Wed, 1 May 2024 23:09:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?S=C3=A9bastien_Szymanski?= <sebastien.szymanski@armadeus.com>,
 buildroot@buildroot.org
References: <20240418133035.30749-1-sebastien.szymanski@armadeus.com>
Content-Language: fr
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20240418133035.30749-1-sebastien.szymanski@armadeus.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1714597774; x=1715202574;
 darn=buildroot.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ABQPGLbsPHAmLtk46oTVumF4IbuTVzeDrXNQu+Os6T0=;
 b=rZjp5I3VSreU1hIobSVUcfzpzzT1JIVxi1aRYIjMC6c/bC/wWmXVyCTFb8QfIy0Y+Z
 3EcQptQcepj9V06M8dJBqBuZYv15i0W7qE4UzssKGkdUlLxAtzh3JR4EEHqFC5DApnfD
 NexoVd0SBAWYS2TIUKRUOJw/RX0EmSQoVFcLsavgPiXfrbCi4pJVBPN6WkIv7EuJ5Fvc
 1b54lzRe4Q48pjWzhu6z7zcB/wC9krTzbZ6i7V8K7c9QhxCoHbElHeN24Fch8YLD7qED
 oHThxCNCNj/F6nmhWNvW4nWMb0BVHzNZL6Bb5HqAjLx0bv433BOdEBG1WTumuTDDrCRg
 oMeQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=rZjp5I3V
Subject: Re: [Buildroot] [PATCH 1/1] DEVELOPERS: add myself for Armadeus
 boards
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
Cc: Julien Boibessot <julien.boibessot@armadeus.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gU8OpYmFzdGllbiwKCkxlIDE4LzA0LzIwMjQgw6AgMTU6MzAsIFPDqWJhc3RpZW4gU3p5
bWFuc2tpIGEgw6ljcml0wqA6Cj4gU2lnbmVkLW9mZi1ieTogU8OpYmFzdGllbiBTenltYW5za2kg
PHNlYmFzdGllbi5zenltYW5za2lAYXJtYWRldXMuY29tPgo+IC0tLQo+ICBERVZFTE9QRVJTIHwg
MiArKwo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBh
L0RFVkVMT1BFUlMgYi9ERVZFTE9QRVJTCj4gaW5kZXggMzk5YjI5MzFmZjNkLi43YTFmYTQzZjRi
MGQgMTAwNjQ0Cj4gLS0tIGEvREVWRUxPUEVSUwo+ICsrKyBiL0RFVkVMT1BFUlMKPiBAQCAtMjc3
Nyw2ICsyNzc3LDggQEAgRjoJc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2Uvc2FtcGxlX251
Lm51Cj4gIEY6CXN1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfbnUucHkKPiAgCj4g
IE46CVPDqWJhc3RpZW4gU3p5bWFuc2tpIDxzZWJhc3RpZW4uc3p5bWFuc2tpQGFybWFkZXVzLmNv
bT4KPiArRjoJYm9hcmQvYXJtYWRldXMvCj4gK0Y6CWNvbmZpZ3MvYXJtYWRldXMqCj4gIEY6CXBh
Y2thZ2UvbW1jLXV0aWxzLwo+ICBGOglwYWNrYWdlL3B5dGhvbi1mbGFzay1qc29ucnBjLwo+ICBG
OglwYWNrYWdlL3B5dGhvbi1mbGFzay1sb2dpbi8KCkFwcGxpZWQgdG8gbWFzdGVyLCB0aGFua3Mu
CgpCZXN0IHJlZ2FyZHMsClJvbWFpbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290
Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJv
b3QK
