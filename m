Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E811C4345F
	for <buildroot@archiver.kernel.org>; Wed,  1 May 2024 22:17:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4F62F82165;
	Wed,  1 May 2024 22:17:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VSd_TH7DNoiJ; Wed,  1 May 2024 22:17:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6B4C98216B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6B4C98216B;
	Wed,  1 May 2024 22:17:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AA2EF1BF407
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 22:17:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 971BF4016B
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 22:17:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PqjgV9fVCWyy for <buildroot@lists.busybox.net>;
 Wed,  1 May 2024 22:17:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 903A7400D3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 903A7400D3
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 903A7400D3
 for <buildroot@buildroot.org>; Wed,  1 May 2024 22:17:11 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-34db48cbe78so912344f8f.1
 for <buildroot@buildroot.org>; Wed, 01 May 2024 15:17:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714601829; x=1715206629;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7m4xDdNbm4ndpweuiI9QOILCFr3Pnek3Xg9wmvFF+qQ=;
 b=Hn7hsgTuHAg1kMVIJcJoXdIqcCinwOaedVSCV+to0UIcxuB+26ttYnT1QncqOYn37o
 4LFhLDMm3PlQpDfhdLnROYpGeJY02nrKmvZdKK47sJZc++R9c7yEwPJKJMvtctAxAocM
 pF8x0U2m/Ycfqa0+tFlRLNNCHwr87HepAhkaEJ6Xf5u+Tj4MpuQuqHvjZSjOYj9FzqHw
 sUxo9rrSzR68xOdlfQwtlkuuKKNF4FiN8Mzlt2UpUqHiQwHgJIQtEOjPn38hSC26RtaV
 aS/IVXjULkKZqQ5VdKX32hx9S/EsaeFbuGxPADvcLqImbDMdz0KJ/XR+Uh+l0Cw4JRAJ
 xf/Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCX2ubo6GtpB7/huX5kHU4qt9mlRkWKShdrKe4T8EyzuqdIIO3/kEGokUZDyU98kjAAYyQdklg58jJOGZSeWqBpNy1ClEtIODQ==
X-Gm-Message-State: AOJu0YzVp+q63xAoZp0HXka/hYO61H9smc37IdAqQlTuEf4Ld05ShS2/
 fVmpO0JczBXh38nmmQj67vcOp+LzlbM4NLnUMkb6ipGtWxpagr/0NTRrki8VrY8=
X-Google-Smtp-Source: AGHT+IG3MsBDt2Y62PKsgls8fm1HLimVVnbKAy4K7YCz4BsPRrP5A4fdYeQ38EfHu/sjHGUpFSo5CQ==
X-Received: by 2002:a5d:56c8:0:b0:34d:9aea:d6d1 with SMTP id
 m8-20020a5d56c8000000b0034d9aead6d1mr2757490wrw.15.1714601829327; 
 Wed, 01 May 2024 15:17:09 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:e3ef:2d7a:4131:71f?
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 a12-20020a056000050c00b00349ac818326sm35429156wrf.43.2024.05.01.15.17.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 May 2024 15:17:09 -0700 (PDT)
Message-ID: <680ac1d8-d61b-4f82-9b04-a24fb2d3e782@smile.fr>
Date: Thu, 2 May 2024 00:17:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
References: <20240413064203.53781-1-bernd@kuhls.net>
Content-Language: fr
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20240413064203.53781-1-bernd@kuhls.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1714601829; x=1715206629;
 darn=buildroot.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7m4xDdNbm4ndpweuiI9QOILCFr3Pnek3Xg9wmvFF+qQ=;
 b=ZfA0kcfVY8gT9oFEddymMWKqun3IJZfNRVrasa+qhGu41zFITFSgMDHRRF5cNYWe4r
 1sPn4gv7A/3zeJrYxkOwrfSgVfUSCF7FfPMHEIEJGaRtKsdLKFW64GMGTNWW/42dNnbG
 6NddT5qk27bAEyNi1gbAbtPbWmoG8e6OUIN5FxKZW/a/J7amCb7n3WChWQNCP3r7n05N
 QW40/gSMUHya7QLLLeY+yysO9nZJDovAkQ7HKjU5dARw5isxugMliy8osU57ZdGRktWS
 Bya6yYRMmvqIX3GYiwHOP3icHlHHRIrDTYnjp52ypee7aLzdE9FnYnE/EySAiYqDP1s9
 VP3w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=ZfA0kcfV
Subject: Re: [Buildroot] [PATCH 1/1] package/cmake: add
 BR2_HOST_CMAKE_AT_LEAST_3_28
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gQmVybmQsCgpMZSAxMy8wNC8yMDI0IMOgIDA4OjQyLCBCZXJuZCBLdWhscyBhIMOpY3Jp
dMKgOgo+IEJ1aWxkcm9vdCBjb21taXQgMzhkMDczNDlkYWVjZTYzOTM4MDA2MTllY2IzZWY5ODI5
OTcxMTgxOSBmb3Jnb3QgdG8KPiBhZGQgdGhlIGNvcnJlc3BvbmRpbmcgQlIyX0hPU1RfQ01BS0Vf
QVRfTEVBU1RfWF9ZIG9wdGlvbi4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBCZXJuZCBLdWhscyA8YmVy
bmRAa3VobHMubmV0Pgo+IC0tLQo+ICBwYWNrYWdlL2NtYWtlL0NvbmZpZy5pbi5ob3N0IHwgNSAr
KysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBh
L3BhY2thZ2UvY21ha2UvQ29uZmlnLmluLmhvc3QgYi9wYWNrYWdlL2NtYWtlL0NvbmZpZy5pbi5o
b3N0Cj4gaW5kZXggMDkzNWU5YTU2NC4uYzM4YmI5ZGFhYSAxMDA2NDQKPiAtLS0gYS9wYWNrYWdl
L2NtYWtlL0NvbmZpZy5pbi5ob3N0Cj4gKysrIGIvcGFja2FnZS9jbWFrZS9Db25maWcuaW4uaG9z
dAo+IEBAIC00NywxMCArNDcsMTUgQEAgY29uZmlnIEJSMl9IT1NUX0NNQUtFX0FUX0xFQVNUXzNf
MjcKPiAgCWJvb2wKPiAgCXNlbGVjdCBCUjJfSE9TVF9DTUFLRV9BVF9MRUFTVF8zXzI2Cj4gIAo+
ICtjb25maWcgQlIyX0hPU1RfQ01BS0VfQVRfTEVBU1RfM18yOAo+ICsJYm9vbAo+ICsJc2VsZWN0
IEJSMl9IT1NUX0NNQUtFX0FUX0xFQVNUXzNfMjcKPiArCj4gICMgVGhpcyBvcmRlciBndWFyYW50
ZWVzIHRoYXQgdGhlIGhpZ2hlc3QgdmVyc2lvbiBpcyBzZXQsIGFzIGtjb25maWcKPiAgIyBzdG9w
cyBhZmZlY3RpbmcgYSB2YWx1ZSBvbiB0aGUgZmlyc3QgbWF0Y2hpbmcgZGVmYXVsdC4KPiAgY29u
ZmlnIEJSMl9IT1NUX0NNQUtFX0FUX0xFQVNUCj4gIAlzdHJpbmcKPiArCWRlZmF1bHQgIjMuMjgi
CWlmIEJSMl9IT1NUX0NNQUtFX0FUX0xFQVNUXzNfMjgKPiAgCWRlZmF1bHQgIjMuMjciCWlmIEJS
Ml9IT1NUX0NNQUtFX0FUX0xFQVNUXzNfMjcKPiAgCWRlZmF1bHQgIjMuMjYiCWlmIEJSMl9IT1NU
X0NNQUtFX0FUX0xFQVNUXzNfMjYKPiAgCWRlZmF1bHQgIjMuMjUiCWlmIEJSMl9IT1NUX0NNQUtF
X0FUX0xFQVNUXzNfMjUKCkFwcGxpZWQgdG8gbWFzdGVyLCB0aGFua3MuCgpCZXN0IHJlZ2FyZHMs
ClJvbWFpbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xp
c3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
