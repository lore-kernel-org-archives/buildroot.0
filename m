Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8636C2BD09
	for <buildroot@archiver.kernel.org>; Wed,  3 Jul 2024 21:32:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1665384750;
	Wed,  3 Jul 2024 21:32:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S8--iDarVz8P; Wed,  3 Jul 2024 21:32:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E4F9D8474D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E4F9D8474D;
	Wed,  3 Jul 2024 21:32:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8D25F1BF2C3
 for <buildroot@lists.busybox.net>; Wed,  3 Jul 2024 21:32:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7718740111
 for <buildroot@lists.busybox.net>; Wed,  3 Jul 2024 21:32:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 451DYNuPLvPs for <buildroot@lists.busybox.net>;
 Wed,  3 Jul 2024 21:32:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A15C94000B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A15C94000B
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A15C94000B
 for <buildroot@buildroot.org>; Wed,  3 Jul 2024 21:32:24 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-42579b60af1so35210975e9.2
 for <buildroot@buildroot.org>; Wed, 03 Jul 2024 14:32:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720042343; x=1720647143;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=klxJfiD0q0O8dvBnhbDFKy4mbn2ps9PfYXTyzSVbCTQ=;
 b=a2f4q3ClSZoiQP2XHOE4Wh7L7GRirdWuPyVkuWsT9JUcMb4Wk6xi0ShrMJELxmKh/Q
 rnYUL5yGLrkCf17vfU6+qDxxkETSdK5lM94IEi3MCECyCXxivkrVnA+boolDv+MkxRZu
 mKQYvhn3SKSVIqs1Lp0AuGtvpIfMTPiPFhrh/HXSUMHPc7Bm3gVWMjZdbyzjDjkLuC1p
 tV5KSEktUxLlJ/Oap+l0bO6RTvrC5wPN2SGGW9Ijg6kXgY2qUBkccr8yJtYM/Md80yVo
 2pFWI5kLeFoTITI2LBBshez3HeHWA1cA1WtRvhZNcjif4XtDBG1Ii74otxBFp7DN+ERM
 ylsA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXgUOm3a3NoSCT/3dVsgB+XReMgV7AehbQZohpm+y1QkflGnZqfkQz17ppZSo3//NhLwXQPeRp28tnxV/xO9OP7FH3P9XH/YA==
X-Gm-Message-State: AOJu0YwqwADNOeHLl7ru7FulJJv/5091I/pMLY03rV6zbJytuJYh03qO
 WrQlAtxW67YLrLGCYCu7og7Dxj6EZmUhSB6I1P9iLTRvvBl1Cp8PuuXeb8C9dqdY0v7yDeQP4GJ
 Q
X-Google-Smtp-Source: AGHT+IHVhnqVFvtE7Of1xOA9CnP2lFs+6KqnrbF06pprjNUuH/7rr5EY9XW1Z+EkGKczP73o86y4VA==
X-Received: by 2002:a05:600c:474d:b0:425:670f:7d14 with SMTP id
 5b1f17b1804b1-4257a02f2f9mr86746225e9.20.1720042342668; 
 Wed, 03 Jul 2024 14:32:22 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:e3ef:2d7a:4131:71f?
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42588492b4fsm113029515e9.4.2024.07.03.14.32.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Jul 2024 14:32:22 -0700 (PDT)
Message-ID: <0d010957-bd83-4136-bc11-398d53eed477@smile.fr>
Date: Wed, 3 Jul 2024 23:32:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?B?UmFwaGHDq2wgTcOpbG90dGU=?= <raphael.melotte@mind.be>,
 buildroot@buildroot.org
References: <20240701145708.2886402-1-raphael.melotte@mind.be>
Content-Language: fr, en-US
In-Reply-To: <20240701145708.2886402-1-raphael.melotte@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1720042343; x=1720647143; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=klxJfiD0q0O8dvBnhbDFKy4mbn2ps9PfYXTyzSVbCTQ=;
 b=k3RKTn9NRJoe9yZ6RQNA3NpEUYwCU+/DsK+qff1F0Aw5SGM8AedHbUwBf1m8YdYcIT
 WxVpAFbjXRQPHB0yqNeLZszAne/VLXM8IRJ1q4Tu7FhADZAXiBloCKV/FkR0F140Erjp
 5JSas30UwMXY0V2uyoyJ4si2/eAYrf4w42VQU=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=k3RKTn9N
Subject: Re: [Buildroot] [PATCH 1/4] package/python-sdbus: new package
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gUmFwaGHDq2wsIEFsbCwKCkxlIDAxLzA3LzIwMjQgw6AgMTY6NTcsIFJhcGhhw6tsIE3D
qWxvdHRlIHZpYSBidWlsZHJvb3QgYSDDqWNyaXTCoDoKPiBTaWduZWQtb2ZmLWJ5OiBSYXBoYcOr
bCBNw6lsb3R0ZSA8cmFwaGFlbC5tZWxvdHRlQG1pbmQuYmU+Cj4gLS0tCj4gIERFVkVMT1BFUlMg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDEgKwo+ICBwYWNrYWdlL0NvbmZpZy5pbiAg
ICAgICAgICAgICAgICAgICAgICB8ICAxICsKPiAgcGFja2FnZS9weXRob24tc2RidXMvQ29uZmln
LmluICAgICAgICAgfCAgOCArKysrKysrKwo+ICBwYWNrYWdlL3B5dGhvbi1zZGJ1cy9weXRob24t
c2RidXMuaGFzaCB8ICA1ICsrKysrCj4gIHBhY2thZ2UvcHl0aG9uLXNkYnVzL3B5dGhvbi1zZGJ1
cy5tayAgIHwgMTkgKysrKysrKysrKysrKysrKysrKwo+ICA1IGZpbGVzIGNoYW5nZWQsIDM0IGlu
c2VydGlvbnMoKykKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvcHl0aG9uLXNkYnVzL0Nv
bmZpZy5pbgo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9weXRob24tc2RidXMvcHl0aG9u
LXNkYnVzLmhhc2gKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvcHl0aG9uLXNkYnVzL3B5
dGhvbi1zZGJ1cy5tawo+IAo+IGRpZmYgLS1naXQgYS9ERVZFTE9QRVJTIGIvREVWRUxPUEVSUwo+
IGluZGV4IDhhNWNjZWJhNzguLjBkNThkZjdkNTAgMTAwNjQ0Cj4gLS0tIGEvREVWRUxPUEVSUwo+
ICsrKyBiL0RFVkVMT1BFUlMKPiBAQCAtMjY2OCw2ICsyNjY4LDcgQEAgRjoJcGFja2FnZS9weXRo
b24tam1lc3BhdGgvCj4gIEY6CXBhY2thZ2UvcHl0aG9uLXB5bXVwZGYvCj4gIEY6CXBhY2thZ2Uv
cHl0aG9uLXJzYS8KPiAgRjoJcGFja2FnZS9weXRob24tczN0cmFuc2Zlci8KPiArRjoJcGFja2Fn
ZS9weXRob24tc2RidXMvCj4gIEY6CXN1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3NhbXBs
ZV9weXRob25fam1lc3BhdGgucHkKPiAgRjoJc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2Uv
c2FtcGxlX3B5dGhvbl9yc2EucHkKPiAgRjoJc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2Uv
c2FtcGxlX3B5dGhvbl9zM3RyYW5zZmVyLnB5Cj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvQ29uZmln
LmluIGIvcGFja2FnZS9Db25maWcuaW4KPiBpbmRleCA1NTBmZGMxZjQxLi40NWQ4YThjN2VjIDEw
MDY0NAo+IC0tLSBhL3BhY2thZ2UvQ29uZmlnLmluCj4gKysrIGIvcGFja2FnZS9Db25maWcuaW4K
PiBAQCAtMTMzNCw2ICsxMzM0LDcgQEAgbWVudSAiRXh0ZXJuYWwgcHl0aG9uIG1vZHVsZXMiCj4g
IAlzb3VyY2UgInBhY2thZ2UvcHl0aG9uLXNjYXB5L0NvbmZpZy5pbiIKPiAgCXNvdXJjZSAicGFj
a2FnZS9weXRob24tc2NoZWR1bGUvQ29uZmlnLmluIgo+ICAJc291cmNlICJwYWNrYWdlL3B5dGhv
bi1zY2lweS9Db25maWcuaW4iCj4gKwlzb3VyY2UgInBhY2thZ2UvcHl0aG9uLXNkYnVzL0NvbmZp
Zy5pbiIKPiAgCXNvdXJjZSAicGFja2FnZS9weXRob24tc2Rub3RpZnkvQ29uZmlnLmluIgo+ICAJ
c291cmNlICJwYWNrYWdlL3B5dGhvbi1zZWNyZXRzdG9yYWdlL0NvbmZpZy5pbiIKPiAgCXNvdXJj
ZSAicGFja2FnZS9weXRob24tc2VlL0NvbmZpZy5pbiIKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9w
eXRob24tc2RidXMvQ29uZmlnLmluIGIvcGFja2FnZS9weXRob24tc2RidXMvQ29uZmlnLmluCj4g
bmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwLi5iNTc2MmY1MTMwCj4gLS0t
IC9kZXYvbnVsbAo+ICsrKyBiL3BhY2thZ2UvcHl0aG9uLXNkYnVzL0NvbmZpZy5pbgo+IEBAIC0w
LDAgKzEsOCBAQAo+ICtjb25maWcgQlIyX1BBQ0tBR0VfUFlUSE9OX1NEQlVTCj4gKwlib29sICJw
eXRob24tc2RidXMiCj4gKwlkZXBlbmRzIG9uIEJSMl9QQUNLQUdFX1NZU1RFTUQgIyByZXF1aXJl
ZCB0byBnZXQgc2QtYnVzCj4gKwloZWxwCj4gKwkgIE1vZGVybiBQeXRob24gRC1CdXMgbGlicmFy
eS4gQmFzZWQgb24gc2QtYnVzIGZyb20KPiArCSAgbGlic3lzdGVtZC4KPiArCj4gKwkgIGh0dHBz
Oi8vZ2l0aHViLmNvbS9pZ285NTg2Mi9weXRob24tc2RidXMKClBsZWFzZSwgYWRkIGEgY29tbWVu
dCB3aGVuIHN5c3RlbWQgaXMgZGlzYWJsZWQ6Cgpjb21tZW50ICJweXRob24tc2RidXMgbmVlZHMg
c3lzdGVtZCIKCWRlcGVuZHMgb24gIUJSMl9QQUNLQUdFX1NZU1RFTUQKCj4gZGlmZiAtLWdpdCBh
L3BhY2thZ2UvcHl0aG9uLXNkYnVzL3B5dGhvbi1zZGJ1cy5oYXNoIGIvcGFja2FnZS9weXRob24t
c2RidXMvcHl0aG9uLXNkYnVzLmhhc2gKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAw
MDAwMDAwMDAuLjEzYzhjMmJiNWYKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvcGFja2FnZS9weXRo
b24tc2RidXMvcHl0aG9uLXNkYnVzLmhhc2gKPiBAQCAtMCwwICsxLDUgQEAKPiArIyBtZDUsIHNo
YTI1NiBmcm9tIGh0dHBzOi8vcHlwaS5vcmcvcHlwaS9zZGJ1cy9qc29uCj4gK21kNSAgNDZkM2Vh
MDBhNDkxYzJlZWMyYTI1Y2NmNjFiOGE3N2EgIHNkYnVzLTAuMTIuMC50YXIuZ3oKPiArc2hhMjU2
ICBjMzY5MmQ3NTcwNDQzOGE3OGFkYzE0MzkzNTBiYzMyZjMwZDZiMzhhZDM0NGNmYzk0NzczZGI4
OWM2Y2U0YTg5ICBzZGJ1cy0wLjEyLjAudGFyLmd6Cj4gKyMgTG9jYWxseSBjb21wdXRlZCBzaGEy
NTYgY2hlY2tzdW1zCj4gK3NoYTI1NiAgODE3N2Y5NzUxMzIxMzUyNmRmMmNmNjE4NGQ4ZmY5ODZj
Njc1YWZiNTE0ZDRlNjhhNDA0MDEwNTIxYjg4MDY0MyAgQ09QWUlORwo+IGRpZmYgLS1naXQgYS9w
YWNrYWdlL3B5dGhvbi1zZGJ1cy9weXRob24tc2RidXMubWsgYi9wYWNrYWdlL3B5dGhvbi1zZGJ1
cy9weXRob24tc2RidXMubWsKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAw
MDAuLmU0YmU2ZWZlZjQKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvcGFja2FnZS9weXRob24tc2Ri
dXMvcHl0aG9uLXNkYnVzLm1rCj4gQEAgLTAsMCArMSwxOSBAQAo+ICsjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIwo+ICsjCj4gKyMgcHl0aG9uLXNkYnVzCj4gKyMKPiArIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMKPiArCj4gK1BZVEhPTl9TREJVU19WRVJTSU9OID0gMC4xMi4wCj4gK1BZVEhPTl9TREJV
U19TT1VSQ0UgPSBzZGJ1cy0kKFBZVEhPTl9TREJVU19WRVJTSU9OKS50YXIuZ3oKPiArUFlUSE9O
X1NEQlVTX1NJVEUgPSBodHRwczovL2ZpbGVzLnB5dGhvbmhvc3RlZC5vcmcvcGFja2FnZXMvOGUv
MzkvM2Q0OWYwZDE4ZGNiYTMzNDRhZjc1NmYzMWU0NDA4ZTdkZTUwYjNkZjg2ZmEzZjNlYTZmNjA0
NDAyZjE2Cj4gK1BZVEhPTl9TREJVU19TRVRVUF9UWVBFID0gc2V0dXB0b29scwo+ICtQWVRIT05f
U0RCVVNfTElDRU5TRSA9IEdOVSBMZXNzZXIgR2VuZXJhbCBQdWJsaWMgTGljZW5zZSB2MiBvciBs
YXRlciAoTEdQTHYyKykKClVzZSBTUERYIGxpY2Vuc2UgZm9ybWF0OiBMR1BMLTIuMCsKCj4gK1BZ
VEhPTl9TREJVU19MSUNFTlNFX0ZJTEVTID0gQ09QWUlORwo+ICtQWVRIT05fU0RCVVNfREVQRU5E
RU5DSUVTID0gc3lzdGVtZAoKSW50ZXJlc3RpbmcsIGxhc3QgdGltZSBJIGNvbnNpZGVyZWQgc2Ri
dXMgSSB3YXMgbG9va2luZyBmb3Igc29tZXRoaW5nIGxpa2UKWW9jdG8ncyBkYnVzLXdhaXQuCgpo
dHRwczovL2dpdC55b2N0b3Byb2plY3Qub3JnL2RidXMtd2FpdAoKQmVzdCByZWdhcmRzLApSb21h
aW4KCgo+ICsKPiAraWZlcSAoJChCUjJfU1RBVElDX0xJQlMpLHkpCj4gK1BZVEhPTl9TREJVU19F
TlYgKz0gUFlUSE9OX1NEQlVTX1VTRV9TVEFUSUNfTElOSz0xCj4gK2VuZGlmCj4gKwo+ICskKGV2
YWwgJChweXRob24tcGFja2FnZSkpCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qu
b3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9v
dAo=
