Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01D40C71155
	for <buildroot@archiver.kernel.org>; Fri, 20 Jun 2025 10:15:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B16CF40786;
	Fri, 20 Jun 2025 10:15:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YnoMNjWj3ejQ; Fri, 20 Jun 2025 10:15:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EC38C407D3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EC38C407D3;
	Fri, 20 Jun 2025 10:15:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3A2BF16B
 for <buildroot@buildroot.org>; Fri, 20 Jun 2025 10:15:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1C4D840056
 for <buildroot@buildroot.org>; Fri, 20 Jun 2025 10:15:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id htX49ui6qg9B for <buildroot@buildroot.org>;
 Fri, 20 Jun 2025 10:15:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com;
 envelope-from=romain.naour@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E8CED40024
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E8CED40024
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E8CED40024
 for <buildroot@buildroot.org>; Fri, 20 Jun 2025 10:15:21 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3a375e72473so766547f8f.0
 for <buildroot@buildroot.org>; Fri, 20 Jun 2025 03:15:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750414520; x=1751019320;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3Ahh8NIfQSg5nmEjlcI/4Ghklabl1pcTLrI/hCU3yG0=;
 b=NnjI+0o1QGYU1F9kJnsdBOO4+6iP+LgTGlOn9Yd0191ZDiy138cgHUUe/0fgMSlfhU
 Ra+T8DqgyaDDjPIPiBuBS2hPJA5Au6CC+sAYzbTIXIPuuHFswhZ3NGEn3wyUNg1hvo6e
 KOB630N7Gr5E52FuC+jmZlP2i/CIGXuTpfkVDKp/ooeKCfut1v8JHbfchjkKzpiNPGdo
 /jHFIH8RSWYB1jNiHASw3U6KiJUKlCrs7U6/csGDwMx/x5/uSZ1RQUVcCjmqStET40Ha
 XcMkHRW5K2kEfoZ1kknOGuY8EnEiKNIlFYhMmDmjj1Hw63p6TANO5b08Dazo0SQjvy2N
 vMXg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUFMUB6LHAjeHwdw2Wxc/Zd/CfCgojSzhPBKLeC8/ueVFjnfhXdRoD47IiNPYkw0aUT3uZjLYtrKSc=@buildroot.org
X-Gm-Message-State: AOJu0Yyeqa7JJWxiIcxg4g3okrPDQrvjdCbBTLU2t/xwVxqQiSLrisCW
 DEV+raup6SS6y/4FGf7PI3I65uL1HZEQeocSTWqSeH65K8zaTkeJz4GZ
X-Gm-Gg: ASbGncvCcPZ/oUniZUVt0pTItfRgknyM/V6uJurm3ou4PQt+DwI8UQl3rC/g2I0fhq2
 1v4DXxNiyRHaT5Ag1299bT3atgzBxxtzL6BwdthedKSlStq6e9UKfdB50Lfew0e8jm9YuVIQ2zL
 9loHBMUXB7n3I8NP+lN72kIHzqrUMM0pxtuJl2dhFpS5P/d8n3EkPNHOHY62rTsWNsd+bmRGz28
 aLOJKqjRu2BUn1bM1bGtnvBHAv7mZ2TBjeGdx3hauEruHoHio3DwJlwJXzVHzbIbm0qKywhEDpK
 PXLEbk2yVcKXgSdXPfwKSCaUNqzNrraCNLqY2PsrP6pi6bMubu1GGS2movNTkwya9CNH1KOzdGC
 gyZoCwYDAjMNB9QgP/TvRExCPcqwrhcerULvZSai6VnwzuswvWcBBXPy72aCSmWKn0QWJfLTHJs
 fi+mlg8gSDaSs/6O0l4eiQKQFmJg==
X-Google-Smtp-Source: AGHT+IH554pjuwZjymJlQ4yi8njZlu/HZ18sA7CiqKffnA8S79RRkSLdLACPMoe2HlUbJxn7EjA0wg==
X-Received: by 2002:adf:e19d:0:b0:3a4:cbc6:9db0 with SMTP id
 ffacd0b85a97d-3a6d12ea306mr1839977f8f.51.1750414519546; 
 Fri, 20 Jun 2025 03:15:19 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:9411:7278:9672:fcde?
 (2a01cb05949d5800941172789672fcde.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:9411:7278:9672:fcde])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4535eac8c16sm53753655e9.19.2025.06.20.03.15.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Jun 2025 03:15:18 -0700 (PDT)
Message-ID: <77d3e45f-d0a1-4c10-85d4-b452d9688b46@gmail.com>
Date: Fri, 20 Jun 2025 12:15:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
Cc: Joseph Kogut <joseph.kogut@gmail.com>
References: <20250619195132.1986901-1-giulio.benetti@benettiengineering.com>
 <20250619195132.1986901-3-giulio.benetti@benettiengineering.com>
Content-Language: en-US
From: Romain Naour <romain.naour@gmail.com>
In-Reply-To: <20250619195132.1986901-3-giulio.benetti@benettiengineering.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1750414520; x=1751019320; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3Ahh8NIfQSg5nmEjlcI/4Ghklabl1pcTLrI/hCU3yG0=;
 b=hAP7XYQh45TjRb4TIEhuTPJwShQCkrXW40bi2b4quqjixKL+OP6ZzRYuho1kxxJXOS
 8HrqrVw71ppDvXyvMfKPBs2xb3womyY/mgQNFuBylLPpvgMDM9NLZNvJJNTPgm48eqy/
 Xzu72vMYQGfT4mNrPmbgbPmBVtmKhnkrs3V4OgWhwJm0sItWLq/E6n/u+FX2OLWRVIxs
 nXmiXSRJAeRgf8dIlLRfSyId601aorCG2QDkkEt8FQzThpVYEstvNFjwW2z4Aqq2ETq9
 xg8xUWrn0j2Zv4rvMX9QLcnwDD6DRSAfyGdCEcS8lWRyi4AwqxnkDAcqnJkOSYjPgA4a
 hXYg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=hAP7XYQh
Subject: Re: [Buildroot] [PATCH] docs/website/support.html: add Benetti
 Engineering to the commercial support list
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gR2l1bGlvLCBBbGwsCgpMZSAxOS8wNi8yMDI1IMOgIDIxOjUxLCBHaXVsaW8gQmVuZXR0
aSBhIMOpY3JpdMKgOgo+IEFzIEJlbmV0dGkgRW5naW5lZXJpbmcgSSBrZWVwIGNvbnRyaWJ1dGlu
ZyBzaW5jZSA4IHllYXJzIG1vcmUgb3IgbGVzcyBvbgo+IG1hbnkgcGFja2FnZXMgYW5kIEkndmUg
bGVhcm50IGEgbG90IGJ5IGpvaW5pbmcgdGhpcyBjb21tdW5pdHkuIE1vc3Qgb2YgYWxsCj4gSSd2
ZSByZWNlaXZlZCBwcmVjaW91cyByZXZpZXdzIGZyb20gbWFpbnRhaW5lcnMgb2YgdG9kYXkgYW5k
IHllc3RlcmRheS4KPiBBbHNvLCBmaW5hbGx5IEkndmUgZm91bmQgc29tZSB0aW1lIHRvIGNyZWF0
ZSBteSBjb21wYW55IGxvZ28gYW5kIHNvIGxldCdzCj4gYWRkIEJlbmV0dGkgRW5naW5lZXJpbmcg
dG8gY29tbWVyY2lhbCBzdXBwb3J0IHVzaW5nIExpbmtlZEluIHBhZ2UgYXMKPiBwbGFjZWhvbGRl
ciB1bnRpbCB0aGUgZmluYWwgd2Vic2l0ZSB3aWxsIGJlIHJlYWR5Lgo+IAo+IFNpZ25lZC1vZmYt
Ynk6IEdpdWxpbyBCZW5ldHRpIDxnaXVsaW8uYmVuZXR0aUBiZW5ldHRpZW5naW5lZXJpbmcuY29t
PgoKQWNrZWQtYnk6IFJvbWFpbiBOYW91ciA8cm9tYWluLm5hb3VyQGdtYWlsLmNvbT4KCkJlc3Qg
cmVnYXJkcywKUm9tYWluCgoKPiAtLS0KPiAgLi4uL3dlYnNpdGUvaW1hZ2VzL2JlbmV0dGktZW5n
aW5lZXJpbmctbG9nby5wbmcgfCBCaW4gMCAtPiA5NzI2OCBieXRlcwo+ICBkb2NzL3dlYnNpdGUv
c3VwcG9ydC5odG1sICAgICAgICAgICAgICAgICAgICAgICB8ICAgMyArKysKPiAgMiBmaWxlcyBj
aGFuZ2VkLCAzIGluc2VydGlvbnMoKykKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRvY3Mvd2Vic2l0
ZS9pbWFnZXMvYmVuZXR0aS1lbmdpbmVlcmluZy1sb2dvLnBuZwo+IAo+IGRpZmYgLS1naXQgYS9k
b2NzL3dlYnNpdGUvaW1hZ2VzL2JlbmV0dGktZW5naW5lZXJpbmctbG9nby5wbmcgYi9kb2NzL3dl
YnNpdGUvaW1hZ2VzL2JlbmV0dGktZW5naW5lZXJpbmctbG9nby5wbmcKPiBuZXcgZmlsZSBtb2Rl
IDEwMDY0NApbLi4uXQo+IAo+IGRpZmYgLS1naXQgYS9kb2NzL3dlYnNpdGUvc3VwcG9ydC5odG1s
IGIvZG9jcy93ZWJzaXRlL3N1cHBvcnQuaHRtbAo+IGluZGV4IDIxYzZlMGEzNGUuLjljNDQ5ODBl
NjcgMTAwNjQ0Cj4gLS0tIGEvZG9jcy93ZWJzaXRlL3N1cHBvcnQuaHRtbAo+ICsrKyBiL2RvY3Mv
d2Vic2l0ZS9zdXBwb3J0Lmh0bWwKPiBAQCAtMTM5LDYgKzEzOSw5IEBACj4gIAkgICAgPGEgaHJl
Zj0iaHR0cHM6Ly93d3cuYW1hcnVsYXNvbHV0aW9ucy5jb20vc2VydmljZXMvaW50ZWdyYXRlZC1z
eXN0ZW0vIj4KPiAgCSAgICAgIDxpbWcgc3JjPSJpbWFnZXMvYW1hcnVsYS1zb2x1dGlvbnMtbG9n
by5wbmciIHN0eWxlPSJtYXgtd2lkdGg6MjAwcHg7IG1hcmdpbi1yaWdodDo0MHB4OyIvPgo+ICAJ
ICAgIDwvYT4KPiArCSAgICA8YSBocmVmPSJodHRwczovL3d3dy5saW5rZWRpbi5jb20vY29tcGFu
eS9iZW5ldHRpLWVuZ2luZWVyaW5nLXNhcyI+Cj4gKwkgICAgICA8aW1nIHNyYz0iaW1hZ2VzL2Jl
bmV0dGktZW5naW5lZXJpbmctbG9nby5wbmciIHN0eWxlPSJtYXgtd2lkdGg6MjYwcHg7IG1hcmdp
bi1yaWdodDo0MHB4OyIvPgo+ICsJICAgIDwvYT4KPiAgCSAgPC9jZW50ZXI+Cj4gIAk8L2Rpdj4K
PiAgICAgICAgPC9kaXY+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0
dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
