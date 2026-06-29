Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C6FEC43458
	for <buildroot@archiver.kernel.org>; Mon, 29 Jun 2026 20:14:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 369ED82173;
	Mon, 29 Jun 2026 20:14:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T28RjkE2lj8B; Mon, 29 Jun 2026 20:14:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B50A482164
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782764083;
	bh=QuFHr+ugQwXwxT7jNg8EpRN60LLQ9cef6k+P/DqRG9I=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=MYMpr+NgWdkh8X/XTCZ8oMMCc7HbWlrGuVe0FTbvNveUvL7mWJuXPuXa6ooX2ABhf
	 bzUpCIwg08GYPZjfix3xjeC3Y5gMkA4ra2YXFWkrA3ZrSCbu5aL/ILOt/AkQn0cipF
	 5s/b40nPek73tUoVlDw3KypN0dNqy2sHZ+1jVnJ3LnhljoGZ6Ej2TUgC0/EfuGUgH9
	 stNjVMtyq4170Ily60HB5+u1FiRrsBriSFiM4EeUD0jv8eB8b3gYNi3K8nZrwpgY7Z
	 jjlUDTJBJg53xEjLvCAAOayNFGcVmRwoNW2MdqiUZO63lcmjSbQ1DIrBYQOTcWSjAI
	 D+G+SSyOCM4qA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B50A482164;
	Mon, 29 Jun 2026 20:14:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0684934C
 for <buildroot@buildroot.org>; Mon, 29 Jun 2026 20:14:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E03CF4090D
 for <buildroot@buildroot.org>; Mon, 29 Jun 2026 20:14:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W65zdH7IFLNO for <buildroot@buildroot.org>;
 Mon, 29 Jun 2026 20:14:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org BC753409DA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BC753409DA
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BC753409DA
 for <buildroot@buildroot.org>; Mon, 29 Jun 2026 20:14:41 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-493a548fc99so8552585e9.2
 for <buildroot@buildroot.org>; Mon, 29 Jun 2026 13:14:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782764079; x=1783368879;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5GIK8RNq0Y/6RTLy1CH3fWUKV5DL6Emiitm9PXVd0gM=;
 b=CUI7bRlNSBeOHvUGDrJDpbIs0lhRq6QnW3L3E25m1ZItUm6sNySmv6EO/U5IXMz826
 9DH3ZAJGMRgTWAwE2VfPnmVYvil/O0+PJuEE3BL57YiH7ylzG3wyivyUT1gStyHGK2jZ
 l/8s9BSzNtu8xxiTFpM3KZA/Ky14aZL89ATSQMmwqLnc5T3es4t1zViz3k4QGZqk+rk1
 PJIUiqD7zgRS1DPv2ZSmHo4n1IUAHs3SV7HpT3ESGvAdrI+0DRX+z8nQjmZXKAAw9/d3
 qYXBkrw/kuAzFn+Q7JwLSD7b0p6dJ5hTsYWtd4S0vJCZ/uxFuvBbYRqHF01a0KqZSqGJ
 EAXQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ8LIS5UmDxm3OgakNQHRSpO1295Ef983lg0gXOQ20KoMBpAhr0oRW3k+McLY1h01YQE6MGRKwut8gc=@buildroot.org
X-Gm-Message-State: AOJu0YxyxqhdhcKvF0isPq/4VRztFDhdU6t19VMheRwLGG0OgZmr6cA7
 nBnb5ZeKjv9IUgm/Rop3qsl4z0DrLb3Xg6W53/mTzRKpp32uBUSFWUEOf1wcN5yTpos=
X-Gm-Gg: AfdE7ckaO0jg0ZZnLex3++Mp8dx779zVW1/DtBw/BXqd+0DJksKKkbgBlI+++y68j/t
 cqWBFooSmCFGaqZhyDeloW/YbErLmATbg/VLkF8g8NisuPtS8EEE3fDxagEXHl6Dii9LbeuSXBe
 pL1HptrUsGOye+Si8x9RA+uuDJbeQGVgJieArkhAw99RV3n4m1QESbchwA43oJu3a9l3/S9ZzKY
 6xJ+b+IEpdCvWYPMzoJSliOPnrjBoh6fIkTx3/JPPQEUdLlL0sSBXB1b3L/qmzcD60OA6ljNDPX
 H2DLbcbK5MiLRwqIbvM2cVLtOAlhNNpEE3ZyziYYilE9/Vfu/JnN0E2bq/S6+aBF4m8C46/qqBS
 MJq1Bo4nF104Cgz4I3EK2woedjRXwNM11WBO+uyOMAEEoYYB5Lc/6rqACsDX08275xh5c6mL2xa
 J7fVXVlA08GmIXJ9S5RsA8NG5FQ68ddBmbVPfeSw4COt2YL/vdumX3ldCqsHGZovGSGT7P9sz9i
 icLdhDXS85AYPJmTdkEUplEkENvxvkMO/BDhj6Kxkrwggcsk8fWOTE=
X-Received: by 2002:a05:600c:2195:b0:492:7019:caca with SMTP id
 5b1f17b1804b1-493b82bbff4mr11528285e9.26.1782764079340; 
 Mon, 29 Jun 2026 13:14:39 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:94a2:a200:2ad9:827a:59cb:148a?
 (2a01cb0594a2a2002ad9827a59cb148a.ipv6.abo.wanadoo.fr.
 [2a01:cb05:94a2:a200:2ad9:827a:59cb:148a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4926c28673dsm304640365e9.2.2026.06.29.13.14.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Jun 2026 13:14:38 -0700 (PDT)
Message-ID: <b2d7cf01-3a85-4791-bbe5-5f041bfbfdfb@smile.fr>
Date: Mon, 29 Jun 2026 22:14:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Fiona Klute <fiona.klute@gmx.de>, buildroot@buildroot.org
References: <20260627113409.777671-1-fiona.klute@gmx.de>
Content-Language: fr, en-US
In-Reply-To: <20260627113409.777671-1-fiona.klute@gmx.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1782764079; x=1783368879; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=5GIK8RNq0Y/6RTLy1CH3fWUKV5DL6Emiitm9PXVd0gM=;
 b=ixhGvNxUYGcckr6OJRGQ16a5FD1Z2uvYGE5tZwFX52payrygkdQgXfCcwjJOMm2UWy
 DmxqSXRTM2UtqCM9w/YXia6K+Dj0YEhqpXa8wqgN26PIsn0gFEg9Fx70a3ogUKWx+Cd2
 xElRJaWtXvP3zI5kE75s+N3M+FfHxHSvAQasQ=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=ixhGvNxU
Subject: Re: [Buildroot] [PATCH 1/1] support/testing:
 TestPythonPy3NetworkmanagerGoi: check we actually get data
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

SGVsbG8gRmlvbmEsIEFsbCwKCkxlIDI3LzA2LzIwMjYgw6AgMTM6MzQsIEZpb25hIEtsdXRlIHZp
YSBidWlsZHJvb3QgYSDDqWNyaXTCoDoKPiBUaGUgc2FtcGxlIHNjcmlwdCB3b3VsZCd2ZSBwYXNz
ZWQgZXZlbiBpZiB0aGUgY29ubmVjdGlvbnMgbGlzdCB3YXMKPiBlbXB0eS4gQ2hlY2sgdGhhdCB0
aGVyZSBpcyBhdCBsZWFzdCBvbmUgY29ubmVjdGlvbiwgYW5kIHRoYXQgdGhlCj4gc2FtcGxlIHNj
cmlwdCBjYW4gcmVhZCBsb29wYmFjayBkZXZpY2UgaW5mb3JtYXRpb24uCj4gCj4gU2lnbmVkLW9m
Zi1ieTogRmlvbmEgS2x1dGUgPGZpb25hLmtsdXRlQGdteC5kZT4KPiAtLS0KPiAgLi4uL3Rlc3Rz
L3BhY2thZ2Uvc2FtcGxlX3B5dGhvbl9uZXR3b3JrbWFuYWdlcl9nb2kucHkgICAgIHwgOCArKysr
KysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBh
L3N1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3NhbXBsZV9weXRob25fbmV0d29ya21hbmFn
ZXJfZ29pLnB5IGIvc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2Uvc2FtcGxlX3B5dGhvbl9u
ZXR3b3JrbWFuYWdlcl9nb2kucHkKPiBpbmRleCAyNDBlODQzN2ZkLi5kZmY2OGU2NmY5IDEwMDY0
NAo+IC0tLSBhL3N1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3NhbXBsZV9weXRob25fbmV0
d29ya21hbmFnZXJfZ29pLnB5Cj4gKysrIGIvc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2Uv
c2FtcGxlX3B5dGhvbl9uZXR3b3JrbWFuYWdlcl9nb2kucHkKPiBAQCAtMjQsMyArMjQsMTEgQEAg
Zm9yIGMgaW4gY29ubmVjdGlvbnM6Cj4gICAgICBwcmludCgie306Ii5mb3JtYXQoYy5nZXRfaWQo
KSkpCj4gICAgICBjLmZvcl9lYWNoX3NldHRpbmdfdmFsdWUocHJpbnRfdmFsdWVzLCBOb25lKQo+
ICAgICAgcHJpbnQoIlxuIikKPiArcHJpbnQoImZvdW5kIHt9IGRlZmluZWQgY29ubmVjdGlvbnMi
LmZvcm1hdChsZW4oY29ubmVjdGlvbnMpKSkKPiArYXNzZXJ0IGxlbihjb25uZWN0aW9ucykgPiAw
Cj4gKwo+ICsjIGNoZWNrIHRoYXQgd2UgY2FuIGZpbmQgdGhlIGxvb3BiYWNrIGRldmljZSAuLi4K
PiArbG9vcGJhY2sgPSBjbGllbnQuZ2V0X2RldmljZV9ieV9pZmFjZSgibG8iKQo+ICsjIC4uLiBh
bmQgcmVhZCBpdHMgdHlwZSBhbmQgc3RhdHVzIGFzIGV4cGVjdGVkCj4gK2Fzc2VydCBsb29wYmFj
ay5nZXRfZGV2aWNlX3R5cGUoKS5uYW1lID09ICJMT09QQkFDSyIKPiArYXNzZXJ0IGxvb3BiYWNr
LmdldF9zdGF0ZSgpLm5hbWUgPT0gIkFDVElWQVRFRCIKCkhhdmUgeW91IGNoZWNrZWQgdGhhdCB0
aGlzIHRlc3QgaXMgd29ya2luZyBhcyBleHBlY3RlZCB1c2luZyBhIGdpdGxhYiBydW5uZXIgPwoK
V2UgaGFkIHNvbWUgaXNzdWUgcmVjZW50bHkgdXNpbmcgbG9jYWwgbmV0d29yazoKClNlZToKaHR0
cHM6Ly9naXRsYWIuY29tL2J1aWxkcm9vdC5vcmcvYnVpbGRyb290Ly0vY29tbWl0L2EzNjczNjJh
ZjAwZWQzNDk5MTViMGI0NDk2ZWJlYjk5MTBmYzg2ZTQKCkNhbiB5b3UgZG91YmxlIGNoZWNrPwoK
QmVzdCByZWdhcmRzLApSb21haW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5v
cmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290
Cg==
