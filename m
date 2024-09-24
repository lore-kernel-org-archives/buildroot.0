Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0EE9CF9C6B
	for <buildroot@archiver.kernel.org>; Tue, 24 Sep 2024 06:28:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 62D6F81EC0;
	Tue, 24 Sep 2024 06:28:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AcssRzg3gyRg; Tue, 24 Sep 2024 06:28:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6C40A81EC1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6C40A81EC1;
	Tue, 24 Sep 2024 06:28:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 885F31BF385
 for <buildroot@lists.busybox.net>; Tue, 24 Sep 2024 06:28:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 76D6540359
 for <buildroot@lists.busybox.net>; Tue, 24 Sep 2024 06:28:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W9ahuMGxAQns for <buildroot@lists.busybox.net>;
 Tue, 24 Sep 2024 06:28:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0A3CF4011B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0A3CF4011B
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0A3CF4011B
 for <buildroot@buildroot.org>; Tue, 24 Sep 2024 06:28:09 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4280ca0791bso50380265e9.1
 for <buildroot@buildroot.org>; Mon, 23 Sep 2024 23:28:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727159288; x=1727764088;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=M2Q7DL5YDySkMnvSu2XxuAw/Aq4XcZDdtCgnfjsHxfQ=;
 b=K5PsTP6HiqHBrFZvtKbbz5IqoLQ+zCwCIvG+Ji/W2cSlV8MP0nl9zm7XgirD1xX0sb
 i+MUO5hbp635GAPad0edsq6NPIdB6yxWUPrPMZeo8qM0ylz4J3SDAKBStIbh6+y/hYVv
 7E2YQswxGA+frFwa9DeDH8VwowutgJth/D3qq2OrghUFe1fSwIlsaZx72oaLMYKI3yEj
 opbQ6zvveX8yf8gg+O6SajqOfqI4sfUTPhg8Ub5u4Jk2p/5LOjdKvbRtfON/+GPbFLqU
 /cyq1xMqRkt85eH7z0rDPHrzhBwu9WHA6IbEHaG7gCO6ZyesU5teCcw4ajS7wsGrbhHD
 O5SA==
X-Gm-Message-State: AOJu0Ywfpdhg/siAgIHiEw/U7J65lEIjF+11iHZBd/xAuEbkKIoULFj/
 ryfFr1+YnoXgAIHuqK7Uotn9HfqnQNjO3sEwmCHn9Pmad0SLly0CrOB1UGUiBK4=
X-Google-Smtp-Source: AGHT+IGBsWw5DBISFlRLC2tRah6vH3xzEkKJLHnXdUtRrCSCq1J4fix2VEMDABz/VRPL3i8YbxEjjA==
X-Received: by 2002:adf:e105:0:b0:368:420e:b790 with SMTP id
 ffacd0b85a97d-37a43146093mr6943592f8f.14.1727159287962; 
 Mon, 23 Sep 2024 23:28:07 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37cbc2a8b39sm712267f8f.6.2024.09.23.23.28.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Sep 2024 23:28:07 -0700 (PDT)
Message-ID: <ccc3bdea-4ce5-4ccb-a143-d55cda8574bf@mind.be>
Date: Tue, 24 Sep 2024 08:28:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Andy Yan <andyshrk@163.com>
References: <20240922090713.20744-1-andyshrk@163.com>
 <7728aa00-20d0-4dd8-8db7-4b6c75265082@mind.be>
 <295f913.4081.19222169e77.Coremail.andyshrk@163.com>
Content-Language: en-GB
In-Reply-To: <295f913.4081.19222169e77.Coremail.andyshrk@163.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1727159288; x=1727764088; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=M2Q7DL5YDySkMnvSu2XxuAw/Aq4XcZDdtCgnfjsHxfQ=;
 b=DoWjdNlndRv5dAlHyc9xddNp9dW8cyWb8/3fOzYGyU9TTX7Srv+TH7fOouMXlnJvpS
 kY4Br7YTkuwvzXCprH1Tytc+Wpmswxwu1uldkHJGWXZWNect9vZTk3HWWsvjRgFEVA3M
 nVHPUEboC8/PowR0FxMGpF+pvOH5bwwu+55BcKYGcS5EQv+OYGXJJOKN4TbM2FS6gyIq
 8CfsMUbXXVC7J2pEvOwBnVoB71tEOk1NFMfllVFpFAJn8uGNcxzS2LYc0DaccIpAKK0L
 L9MXAd0MtMmUliXlOpqcyRT07kMaQZahc4sydR5q7atDMbp9iJkpydy31l+kcpC17UnN
 Zt0Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=DoWjdNln
Subject: Re: [Buildroot] [PATCH] package/io: New package
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Cc: buildroot@buildroot.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAyNC8wOS8yMDI0IDA1OjMyLCBBbmR5IFlhbiB3cm90ZToKPiAKPiBIaSBBcm5vdXTvvIwK
PiAKPiBBdCAyMDI0LTA5LTI0IDAyOjQ3OjAyLCAiQXJub3V0IFZhbmRlY2FwcGVsbGUgdmlhIGJ1
aWxkcm9vdCIgPGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnPiB3cm90ZToKPj4gICBIaSBBbmR5LApb
c25pcF0KPj4gICBJIGd1ZXNzIHRoaXMgcmVsaWVzIG9uIENPTkZJR19ERVZNRU0gdG8gYmUgc2V0
IGluIHRoZSBrZXJuZWwuIFRoaXMgc2hvdWxkIGJlCj4+IG1lbnRpb25lZCBpbiB0aGUgQ29uZmln
LmluIGhlbHAgdGV4dCwgYW5kIGlkZWFsbHkgc29tZXRoaW5nIGxpa2UgdGhpczoKPiAKPiBJIHdp
bGwgbWVudGlvbiBpdCBpbiBDb25maWcuaW4sIGFzIHNvbWV0aW1lcyB3ZSBtYXkgYnVpbGQgYSBy
b290ZnMgd2l0aG91dCBsaW51eCBrZXJuZWwsCj4gaSBhbSBub3Qgc3VyZSB3ZSBzaG91ZCBhZGQg
dGhpcyBMSU5VWF9DT05GSUdfRklYVVBTIG9yIG5vdC4KCiAgTElOVVhfQ09ORklHX0ZJWFVQUyBp
cyBpZ25vcmVkIGlmIHlvdSBkb24ndCBidWlsZCB0aGUga2VybmVsIGZyb20gd2l0aGluIApidWls
ZHJvb3QsIHNvIHRoYXQncyBmaW5lLiBUaGUgbWFpbiBxdWVzdGlvbiBpczogaXMgdGhlcmUgZXZl
ciBhIHNpdHVhdGlvbiB3aGVyZSAKeW91IGNhbiB1c2UgdGhpcyB0b29sIHdpdGhvdXQgaGF2aW5n
IENPTkZJR19ERVZNRU0gc2V0PyBJZiBub3QsIGl0J3MgcHJvYmFibHkgCmJldHRlciB0byBhZGQg
dGhlIGZpeHVwLgoKICBJdCdzIGEgYml0IGEgdHJpY2t5IGRlY2lzaW9uIGluIHRoaXMgY2FzZSBo
b3dldmVyLCBiZWNhdXNlIENPTkZJR19ERVZNRU0gaXMgYSAKc2VjdXJpdHkgYmxhY2sgaG9sZS4g
SWYgeW91IGFjY2lkZW50YWxseSBsZWF2ZSB0aGUgaW8gdG9vbCBlbmFibGVkLCB5b3UncmUgCmZv
cmNpbmcgdGhlIGtlcm5lbCB0byBidWlsZCBpbiB0aGlzIGFudGlmZWF0dXJlLi4uCgogIFNvIG9u
IHNlY29uZCB0aG91Z2h0LCBwcm9iYWJseSBiZXR0ZXIgbm90IHRvIGluY2x1ZGUgdGhlIExJTlVY
X0NPTkZJR19GSVhVUFMuCgogIFJlZ2FyZHMsCiAgQXJub3V0CgoKPiAKPiBUaGFua3MgZm9yIHlv
dXIgcmV2aWV3Lgo+Pgo+PiBkZWZpbmUgSU9fTElOVVhfQ09ORklHX0ZJWFVQUwo+PiAJJChjYWxs
IEtDT05GSUdfRU5BQkxFX09QVCxDT05GSUdfREVWTUVNKQo+PiBlbmRlZgo+Pgo+Pj4gK2RlZmlu
ZSBJT19CVUlMRF9DTURTCj4+PiArCSQoVEFSR0VUX0NDKSAkKFRBUkdFVF9DRkxBR1MpICQoVEFS
R0VUX0xERkxBR1MpICQoQEQpL2lvLmMgLW8gJChARCkvaW8KPj4+ICtlbmRlZgo+Pj4gKwo+Pj4g
K2RlZmluZSBJT19JTlNUQUxMX1RBUkdFVF9DTURTCj4+PiArCSQoSU5TVEFMTCkgLW0gMDc1NSAt
RCAkKEBEKS9pbyAkKFRBUkdFVF9ESVIpL3Vzci9iaW4vaW8KPj4+ICtlbmRlZgo+Pj4gKwo+Pj4g
KyQoZXZhbCAkKGdlbmVyaWMtcGFja2FnZSkpCj4+Cj4+Cj4+ICAgUmVnYXJkcywKPj4gICBBcm5v
dXQKPj4KPj4gWzFdIGh0dHBzOi8vbmlnaHRseS5idWlsZHJvb3Qub3JnLyNERVZFTE9QRVJTCj4+
Cj4+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4+IGJ1
aWxkcm9vdCBtYWlsaW5nIGxpc3QKPj4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKPj4gaHR0cHM6
Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290CgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGlu
ZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
