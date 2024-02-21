Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4675C48BEB
	for <buildroot@archiver.kernel.org>; Wed, 21 Feb 2024 15:33:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 65978416FD;
	Wed, 21 Feb 2024 15:33:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Hev1SpBXd2iz; Wed, 21 Feb 2024 15:33:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2D94D4170B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2D94D4170B;
	Wed, 21 Feb 2024 15:33:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 67AA91BF34B
 for <buildroot@lists.busybox.net>; Wed, 21 Feb 2024 15:33:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6257B418BF
 for <buildroot@lists.busybox.net>; Wed, 21 Feb 2024 15:33:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zYgAiGmx2j8p for <buildroot@lists.busybox.net>;
 Wed, 21 Feb 2024 15:33:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0C154418AF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0C154418AF
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0C154418AF
 for <buildroot@buildroot.org>; Wed, 21 Feb 2024 15:33:08 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-41273f53c71so6808765e9.1
 for <buildroot@buildroot.org>; Wed, 21 Feb 2024 07:33:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708529587; x=1709134387;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CAE9a9z8gnyAVqdb3wv2r+WqqQWnqMtN00wfMfajxUI=;
 b=vuclqy356hASm9ftAwnXnO+2W4bOB7JGNUZGXCnRSKm5NqYX3ZrcWMtlCIC7dp+33m
 d44sYkRvl/D2du5rnJyxigajqJfXX6qxCmRztoJd6DE4uOBCkFdjmVjZ3b1v6zzZ1l/i
 lrFh13LnncpSmPYQGqeVU3uRNS2txWROzuvwK1se4ruqeT0VUH779su2LPkDc1juq/kV
 YJqux5wLzNgkgwYZBankhhOYjcQ4YitDG7dgtoyVa0PI/PyIkqVPnklfWzU4kZjvNi9/
 veeaeSP52PuXZxoenXXYnD8qEpaSpJ8ZFbt4Jc0fEucuLrvd7VknCZebhrTwsmnejTji
 bNGA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX5lhDaIypDRCL4pMtlM+53/yk95rupH35eOQojosbkg1QjNENzGGDvrYmDvEYNmoiAWoTK5d/cn4U22n7Pv9RcafXLcHWuFQ==
X-Gm-Message-State: AOJu0Yypo8Me2/5q33SqDMIkLwb3zbDFX7r1p0351o1A7eueieILhFY3
 5LmvFYoKaJypLLRIcT4mv2fmW7dKw+5jRfLdWYQ0ukE8wjWl2bPpnebroVgNs2DAnSAmE9mYH81
 x
X-Google-Smtp-Source: AGHT+IFdut98FRgmBX18gMlltAitV1Ta64F6spdDWHlYCyNgXEnydPg+IehDKAJ7fO5hIGyJLJH7+A==
X-Received: by 2002:a05:600c:3ba6:b0:411:d89d:d7ba with SMTP id
 n38-20020a05600c3ba600b00411d89dd7bamr17217387wms.7.1708529586852; 
 Wed, 21 Feb 2024 07:33:06 -0800 (PST)
Received: from ?IPV6:2a04:cec0:102f:f3c5:3be6:9d2b:1a77:e396?
 ([2a04:cec0:102f:f3c5:3be6:9d2b:1a77:e396])
 by smtp.gmail.com with ESMTPSA id
 co3-20020a0560000a0300b0033d70dd0e04sm5094894wrb.8.2024.02.21.07.33.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Feb 2024 07:33:06 -0800 (PST)
Message-ID: <8a008e9a-410f-406a-8e8c-0ce1724c1643@smile.fr>
Date: Wed, 21 Feb 2024 16:33:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: fr
To: David Picard <david.picard@clermont.in2p3.fr>, buildroot@buildroot.org
References: <c90e4512-405c-40fb-b597-1a04d7449afa@clermont.in2p3.fr>
 <d2a4dc21-1140-497d-91d6-2dde78e98cd0@smile.fr>
 <a6433199-1362-4d80-9ccf-389d8e7ed517@clermont.in2p3.fr>
 <643b99fe-655d-45b9-80dd-f47bb53efcb2@smile.fr> <ZdWYBJ7mt1L2CTjL@landeda>
 <d74f4d3c-bbd2-4dea-96df-77122691ce9f@clermont.in2p3.fr>
 <c7fe916e-a476-4df3-872d-0cd422e78a85@clermont.in2p3.fr>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <c7fe916e-a476-4df3-872d-0cd422e78a85@clermont.in2p3.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1708529587; x=1709134387;
 darn=buildroot.org; 
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=CAE9a9z8gnyAVqdb3wv2r+WqqQWnqMtN00wfMfajxUI=;
 b=CHcDY6GjlrFhQtajkIHAwFFrmJFx7aoqcqAWumY7Nr2NmyLRPN/qbb8iA7sYh2ufvr
 554M6KgdW8jIG79H05PWtUQzfqKHF6NNEE0V3/giAePzWmjZeQuYHbCWHdnraDrlnC/s
 CMSGX81JZ1B+D9uWOjnoqemfjoWO/xwHAYQmVEQMWGuezHtte7/jhGLQvdy3I2azZIdm
 G4gBvnJMfzCM5QE4e1tvB0PVTWAenM56kE+2tr6Suh9AP4u0hdPzZQTBZt2EfKUFiFmp
 purH3Xn0j846kiCCPlLCcmesDkv/kPaEA6mL98XHz3txp+gy0FGmHha0b6zdkJ7EXUh2
 p/9w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=CHcDY6Gj
Subject: Re: [Buildroot] [PATCH 1/1] package/intel-socfpga-hwlib: add new
 package
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gRGF2aWQsCgpMZSAyMS8wMi8yMDI0IMOgIDEzOjI1LCBEYXZpZCBQaWNhcmQgYSDDqWNy
aXTCoDoKPiBPciBzaG91bGQgSSBhZGQgTElCRk9PX0VYVFJBX0RPV05MT0FEUyB0byBteSBhcHBs
aWNhdGlvbiBwYWNrYWdlID8KClNlZSBhbiBleGFtcGxlIGhvdyB0byB1c2UgX0VYVFJBX0RPV05M
T0FEUzoKCmh0dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJvb3Qub3JnL2J1aWxkcm9vdC8tL2Jsb2Iv
bWFzdGVyL3BhY2thZ2UvdGVzc2VyYWN0LW9jci90ZXNzZXJhY3Qtb2NyLm1rP3JlZl90eXBlPWhl
YWRzI0w1OAoKQmVzdCByZWdhcmRzLApSb21haW4KCgo+IAo+IExlIDIxLzAyLzIwMjQgw6AgMDk6
MzYsIERhdmlkIFBpY2FyZCBhIMOpY3JpdMKgOgo+PiBTbywgc2hvdWxkIEkgc3VibWl0IGEgcGFj
a2FnZSwgdXNpbmcgdGhlIExJQkZPT19FWFRSQV9ET1dOTE9BRFMgZmVhdHVyZSA/IFdoYXQKPj4g
dmFsdWUgd291bGQgeW91IHJlY29tbWVuZCBmb3IgTElCRk9PX0RMX0RJUiA/Cj4+Cj4+IERhdmlk
Cj4+Cj4+IExlIDIxLzAyLzIwMjQgw6AgMDc6MjgsIFlhbm4gRS4gTU9SSU4gYSDDqWNyaXTCoDoK
Pj4+Pj4gSSBkaWQgaXQgb24gcHVycG9zZS4gVGhpcyBwYWNrYWdlIGlzIGNhbGxlZCBhIGxpYnJh
cnksIGJ1dCBpdCByZWFsbHkgaXMgYSBidW5jaAo+Pj4+PiBvZiBDIGZpbGVzLiBZb3Ugb25seSB1
c2UgYSBzdWJzZXQsIGRlcGVuZGluZyBvbiB5b3VyIGhhcmR3YXJlLiBUaGlzIGNvZGUgd2FzCj4+
Pj4+IG1hZGUgdG8gYmUgY29tcGlsZWQgaW4gdGhlIGFwcGxpY2F0aW9uLCBub3QgYXMgYSBjb252
ZW50aW9uYWwgbGlicmFyeS4KPj4+Pj4gSSBjb3VsZCBjb3B5IHRoZSBmaWxlcyB0byBTVEFHSU5H
LCBidXQgY2xlYW5pbmcgd291bGQgYmUgbW9yZSBjb21wbGljYXRlZCBhbmQgaXQKPj4+Pj4gd291
bGQgd2FzdGUgc29tZSBkaXNrIHNwYWNlLgo+Pj4+IE9rLCBtYXliZSBpcyBzaG91bGQgbm90IGJl
IHBhY2thZ2VkIGluIEJ1aWxkcm9vdCB0aGVuLgo+Pj4+IFdoZW4gYSBwYWNrYWdlIGlzIGJ1aWxk
IGJ5IEJ1aWxkcm9vdCwgaXQgY2FuIGdlbmVyYXRlIGEgYmluYXJ5LCBhIGxpYnJhcnkgb3IKPj4+
PiBwcm92aWRlIHNvbWUgaGVhZGVyIGZpbGVzLgo+Pj4+IElmIHlvdXIgYXBwbGljYXRpb24gZG9l
c24ndCBidW5kbGUgaW50ZWwtc29jZnBnYS1od2xpYiBzb3VyY2VzIGJ1dCBpdCByZXF1aXJlcwo+
Pj4+IGl0IHRvIGJ1aWxkIGluIEJ1aWxkcm9vdCwgeW91IGNhbiB1c2UgTElCRk9PX0VYVFJBX0RP
V05MT0FEUyB0byBhZGQgYW4gZXh0cmEKPj4+PiBkb3dubG9hZCBzdGVwLgo+Pj4gSSBhZ3JlZSB3
aXRoIFJvbWFpbi4gSXQgZG9lcyBub3QgbWFrZSBtaXVjaCBzZW5zZSBJTUhPIHRvIGp1c3QgZHJv
cAo+Pj4gc291cmNlIGZpbGVzIGxpa2UgdGhhdC4gQW5kIHRoZSBfRVhUUkFfRE9XTkxPQURTIG1l
Y2hhbmlzbSBpcyBleGFjdGx5Cj4+PiB0YWlsb3JlZCB0byBzdWNoIGNhc2VzLgo+Pgo+Pgo+PiBf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+PiBidWlsZHJv
b3QgbWFpbGluZyBsaXN0Cj4+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4+IGh0dHBzOi8vbGlz
dHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo+IAo+IAo+IF9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gYnVpbGRyb290IG1h
aWxpbmcgbGlzdAo+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4gaHR0cHM6Ly9saXN0cy5idWls
ZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290CgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxk
cm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2J1aWxkcm9vdAo=
