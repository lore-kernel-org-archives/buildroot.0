Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B220FC4828F
	for <buildroot@archiver.kernel.org>; Thu,  8 Feb 2024 11:28:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6BC478516F;
	Thu,  8 Feb 2024 11:28:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kLCmGf6G3YNv; Thu,  8 Feb 2024 11:28:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 53E7285175
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 53E7285175;
	Thu,  8 Feb 2024 11:28:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B79F01BF267
 for <buildroot@lists.busybox.net>; Thu,  8 Feb 2024 11:28:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ADF6041AFE
 for <buildroot@lists.busybox.net>; Thu,  8 Feb 2024 11:28:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id x7CiHaw_Lj3Q for <buildroot@lists.busybox.net>;
 Thu,  8 Feb 2024 11:28:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::634; helo=mail-ej1-x634.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 82C0840193
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 82C0840193
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 82C0840193
 for <buildroot@buildroot.org>; Thu,  8 Feb 2024 11:28:14 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a39e31e1aa9so91319766b.0
 for <buildroot@buildroot.org>; Thu, 08 Feb 2024 03:28:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707391692; x=1707996492;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Ya97RrdDla2Hgj7v8kwnmI5ImjMlMSL9SDCLpxRdDPY=;
 b=MMngCtGRzYrvwo98v1qdM7H2CBxh0VHLNSGgfKxJyN3Qw8EUAq12whZRuHyen0cSgP
 D8kEsxAw6UUjYLfhRRhZECBWA7cCLCpIC7auYd+SUzd391jVre0bkrMpjLd10ixpaS5/
 IBysWf7mvb+5ISAR9X9CxWNvS410l7eaG39ENecSofslJ9YhJFWwvdemCU6TGUvJOQWY
 7LbmU1sMk7UF95TJBp7kqpy3rH2UtacPhNW7Dj3IYy6Q+Y6tzvlifXv58q8W2Iz6/D1U
 q2vrLwIQVQ2soogDWCjf4PyjAZAPxFVRvkql0HzAnDBBr8gvg+rfxBaYe9WLr5OvF2x+
 QsZQ==
X-Gm-Message-State: AOJu0Yza0vuOHJz9ReUm8o0arziGxbLkobPoUV22wlU5FE21kLbUTOif
 haPr0l0rfbEHzjqwePwoa0P446zVM1OKnWlC3w6ywNI+n2wJqem0ayvlEAM36Hc=
X-Google-Smtp-Source: AGHT+IGox2TdxYMuzaRHdVdKZ7lPV9Zc3Ewj8vFUI0INu4sgWCgcYFzEYA8NNI4TUQkGwBqFsKV/jw==
X-Received: by 2002:a17:906:538a:b0:a38:2bba:c4c7 with SMTP id
 g10-20020a170906538a00b00a382bbac4c7mr4990971ejo.7.1707391692079; 
 Thu, 08 Feb 2024 03:28:12 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVv5vO5GIin5VIss6ewxZu68Vzja8rBtvWypApnMd71zx03BMYSZabg2XpOVuvOKYUHSpth9ENvUsBTOc5OVQ4A8Bl/S7Q7BXvWjl1zdoY9P6vFIssXJC/wy9wvmYewfUtjLWbY7z4Ac8K5F0e/6EMMrvu6XCl0LJ3Lar/rAeSuC5iUDJtBlvoE/96hvGYvkIzJNwhu/uq95vQPRig6nkI=
Received: from [10.1.0.163] (ip-188-118-3-185.reverse.destiny.be.
 [188.118.3.185]) by smtp.gmail.com with ESMTPSA id
 a21-20020a170906245500b00a381eb99d97sm1782577ejb.181.2024.02.08.03.28.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Feb 2024 03:28:11 -0800 (PST)
Message-ID: <454a12aa-fe40-4435-8c6e-5f020d960bb5@mind.be>
Date: Thu, 8 Feb 2024 12:28:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20240110093850.2302133-1-james.hilliard1@gmail.com>
 <20240110093850.2302133-6-james.hilliard1@gmail.com>
Content-Language: en-US
In-Reply-To: <20240110093850.2302133-6-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1707391692; x=1707996492; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Ya97RrdDla2Hgj7v8kwnmI5ImjMlMSL9SDCLpxRdDPY=;
 b=hZduIbjOMswE1ZcuSVbGjpwbIVrqIdVeamQisCG9ke+IH9deY+ZJD2RIpXF20hSYq2
 vP7BWCi7J3j6paRdJkKzBxnzTVtCLsNhAAImctLl28se8Emg5jssSPRzoRCguqJwny8n
 PtSqY3fcUJMI2in2Nt5MW1kxc0/DbMk1bziLjlrSOLUA0ob6JQRnkQQD0i2QM2H8QJ4w
 nflNBNd48B8oTp36Y1bDTvPDPzm+D636yrRk+eFNC4NlvXovyLLO6dnjGtq6AGBNSrCs
 cp0W2gqRx64KUDscVCZWK2lgL0u1pwxBSzeFPJreG4U0Iez9PmbEx6eLS6Q/m2y799us
 qB3Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=hZduIbjO
Subject: Re: [Buildroot] [PATCH 6/6] package/python-pymupdf: bump to version
 1.23.9rc2
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
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?B?UmFwaGHDq2wgTcOpbG90dGU=?= <raphael.melotte@mind.be>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>, Julien Olivain <ju.o@free.fr>,
 Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgSmFtZXMsIGFsbCwKClRoYW5rcyBmb3IgdGhlIHBhdGNoZXMhCkkgYWRkZWQgYSBmZXcgY29t
bWVudHMvcXVlc3Rpb25zIGJlbG93LgoKT24gMS8xMC8yNCAxMDozOCwgSmFtZXMgSGlsbGlhcmQg
d3JvdGU6Cj4gTWlncmF0ZSB0byBpbiB0cmVlIHBlcDUxNyBiYXNlZCBidWlsZCBiYWNrZW5kLgo+
IAoKRG9lcyB0aGlzIG5ldyB2ZXJzaW9uIGNyb3NzLWNvbXBpbGUgZm9yIHlvdT8KSSBnZXQgdGhl
IGZvbGxvd2luZyBlcnJvciBiZWNhdXNlIHRoZSB3cm9uZyBweXRob24tY29uZmlnIGlzIHVzZWQg
KEkgb25seSBicmllZmx5IHRyaWVkIGFybXY1IHNvIGZhcik6CgplcnJvcjogI2Vycm9yICJMT05H
X0JJVCBkZWZpbml0aW9uIGFwcGVhcnMgd3JvbmcgZm9yIHBsYXRmb3JtIChiYWQgZ2NjL2dsaWJj
IGNvbmZpZz8pLiIKCj4gTm90ZSB0aGF0IHZlcnNpb24gMS4yMy44IGlzIG5vdCBjb21wYXRpYmxl
IHdpdGggbXVwZGYgMS4yMy44IGR1ZSB0bwo+IGhlYWRlciBjb25mbGljdCBidWdzIHRoYXQgd2Vy
ZSBmaXhlZCBhZnRlciB0aGUgMS4yMy44IHJlbGVhc2UuCj4gCj4gU2lnbmVkLW9mZi1ieTogSmFt
ZXMgSGlsbGlhcmQgPGphbWVzLmhpbGxpYXJkMUBnbWFpbC5jb20+Cj4gLS0tCj4gICBwYWNrYWdl
L3B5dGhvbi1weW11cGRmL3B5dGhvbi1weW11cGRmLmhhc2ggfCAgNCArLS0KPiAgIHBhY2thZ2Uv
cHl0aG9uLXB5bXVwZGYvcHl0aG9uLXB5bXVwZGYubWsgICB8IDMzICsrKysrKysrKysrKy0tLS0t
LS0tLS0KPiAgIDIgZmlsZXMgY2hhbmdlZCwgMjAgaW5zZXJ0aW9ucygrKSwgMTcgZGVsZXRpb25z
KC0pCj4gCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvcHl0aG9uLXB5bXVwZGYvcHl0aG9uLXB5bXVw
ZGYuaGFzaCBiL3BhY2thZ2UvcHl0aG9uLXB5bXVwZGYvcHl0aG9uLXB5bXVwZGYuaGFzaAo+IGlu
ZGV4IDlmZDgxNTAwODguLmU1NzY1MmFiNjkgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9weXRob24t
cHltdXBkZi9weXRob24tcHltdXBkZi5oYXNoCj4gKysrIGIvcGFja2FnZS9weXRob24tcHltdXBk
Zi9weXRob24tcHltdXBkZi5oYXNoCj4gQEAgLTEsNSArMSw1IEBACj4gICAjIG1kNSwgc2hhMjU2
IGZyb20gaHR0cHM6Ly9weXBpLm9yZy9weXBpL3B5bXVwZGYvanNvbgo+IC1tZDUgIDQ2OGZlNTYz
NzVhMWZjYTk5ZTgzZmUwYWEwYjlmOGJkICBQeU11UERGLTEuMjIuMC50YXIuZ3oKPiAtc2hhMjU2
ICA2ZTE2OTRlNWMwY2Q4YjkyZDUwM2E1MDZlZThlNGJhMWJlZDc2ODUyOGRlNTg2ODg5ZDNlYzkw
ZTlkYzRhN2QzICBQeU11UERGLTEuMjIuMC50YXIuZ3oKPiArbWQ1ICBlYjBiNjVlYWEwNjNjMjQx
N2Q4OWM1NDUzZTdjODJhZCAgUHlNdVBERi0xLjIzLjlyYzIudGFyLmd6Cj4gK3NoYTI1NiAgYmE2
ZmRkOTA3ODE0YWNiOTY4Y2U2NjlmNDliMGMxNGVmOWVmOGIxZTJkMTYxODI5YjdhMzE0NjFhYWIw
NDQyOSAgUHlNdVBERi0xLjIzLjlyYzIudGFyLmd6Cj4gICAjIExvY2FsbHkgY29tcHV0ZWQgc2hh
MjU2IGNoZWNrc3Vtcwo+ICAgc2hhMjU2ICA1N2M4ZmYzM2M5YzBjZmMzZWYwMGU2NTBhMWNjOTEw
ZDdlZTQ3OWE4YmM1MDlmNmM5MjA5YTdjMmExMTM5OWQ2ICBDT1BZSU5HCj4gZGlmZiAtLWdpdCBh
L3BhY2thZ2UvcHl0aG9uLXB5bXVwZGYvcHl0aG9uLXB5bXVwZGYubWsgYi9wYWNrYWdlL3B5dGhv
bi1weW11cGRmL3B5dGhvbi1weW11cGRmLm1rCj4gaW5kZXggNjM5Y2UwZTAwZS4uYWM3NmFmYTNm
NiAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL3B5dGhvbi1weW11cGRmL3B5dGhvbi1weW11cGRmLm1r
Cj4gKysrIGIvcGFja2FnZS9weXRob24tcHltdXBkZi9weXRob24tcHltdXBkZi5tawo+IEBAIC01
LDI1ICs1LDI4IEBACj4gICAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwo+ICAgCj4gICAjIHB5dGhv
bi1weW11cGRmJ3MgdmVyc2lvbiBtdXN0IG1hdGNoIG11cGRmJ3MgdmVyc2lvbgo+IC1QWVRIT05f
UFlNVVBERl9WRVJTSU9OID0gMS4yMi4wCj4gK1BZVEhPTl9QWU1VUERGX1ZFUlNJT04gPSAxLjIz
LjlyYzIKPiAgIFBZVEhPTl9QWU1VUERGX1NPVVJDRSA9IFB5TXVQREYtJChQWVRIT05fUFlNVVBE
Rl9WRVJTSU9OKS50YXIuZ3oKPiAtUFlUSE9OX1BZTVVQREZfU0lURSA9IGh0dHBzOi8vZmlsZXMu
cHl0aG9uaG9zdGVkLm9yZy9wYWNrYWdlcy8yOC9iYS9kNmJiNmZkNjc4ZTgzOTZkN2I5NDQ4NzAy
ODZmYjI1ZmQ2ZjQ5OWI4Y2I1OTliNTQzNmM4ZjcyNWFkYmYKPiAtUFlUSE9OX1BZTVVQREZfU0VU
VVBfVFlQRSA9IHNldHVwdG9vbHMKPiArUFlUSE9OX1BZTVVQREZfU0lURSA9IGh0dHBzOi8vZmls
ZXMucHl0aG9uaG9zdGVkLm9yZy9wYWNrYWdlcy9iNC9mZi9kYjQ0MzAzZDYwYjhjYzMxMGE3MTg3
ZDUwMGM3NzY1YjNiNDhhYTExM2M4NjQyOGQ1ZDFjMzkwYjhmYjUKPiArUFlUSE9OX1BZTVVQREZf
U0VUVVBfVFlQRSA9IHBlcDUxNwo+ICAgUFlUSE9OX1BZTVVQREZfTElDRU5TRSA9IEFHUEwtMy4w
Kwo+ICAgUFlUSE9OX1BZTVVQREZfTElDRU5TRV9GSUxFUyA9IENPUFlJTkcKPiAgICMgTm8gbGlj
ZW5zZSBmaWxlIGluY2x1ZGVkIGluIHBpcCwgYnV0IGl0J3MgcHJlc2VudCBvbiBnaXRodWIKPiAt
UFlUSE9OX1BZTVVQREZfREVQRU5ERU5DSUVTID0gZnJlZXR5cGUgaG9zdC1zd2lnIG11cGRmIHps
aWIKPiArUFlUSE9OX1BZTVVQREZfREVQRU5ERU5DSUVTID0gXAo+ICsJaG9zdC1weXRob24tbGli
Y2xhbmcgXAoKSXNuJ3QgbGliY2xhbmcgb25seSByZXF1aXJlZCBieSB0aGUgUHlNdVBERiBwbHVt
YmluZyB3aGVuIGl0IGJ1aWxkcyB0aGUgYnVuZGxlZCBNdVBERj8KSW4gb3VyIGNhc2Ugc2luY2Ug
d2UncmUgYnVpbGRpbmcgTXVQREYgYXMgYSBzZXBhcmF0ZSBwYWNrYWdlLCB3ZSBob3BlZnVsbHkg
ZG9uJ3QgbmVlZCBpdC4uLgoKPiArCWhvc3QtcHl0aG9uLXBzdXRpbCBcCgogRnJvbSBhIHF1aWNr
IGxvb2sgYXQgdGhlIFB5TXVQREYgY29kZSwgdGhpcyBzZWVtcyB0byBiZSBuZWVkZWQgb25seSBm
b3IgYSBzaW5nbGUgdGVzdCAod2hpY2ggd2UgZG9uJ3QgcnVuLCBzbyB3ZSBkb24ndCBuZWVkIGl0
KS4KCj4gKwlob3N0LXB5dGhvbi1zZXR1cHRvb2xzIFwKPiArCWhvc3QtcHl0aG9uLXN3aWcgXAoK
VGhlIHdheSBJIHVuZGVyc3RhbmQgaXQsIFB5TXVQREYgYWRkZWQgdGhpcyBob3N0LXB5dGhvbi1z
d2lnIGRlcGVuZGVuY3kgYXMgYSB3YXkgdG8gbWFrZSBzdXJlIHN3aWcgaXMgYXZhaWxhYmxlIHdo
ZW4gYnVpbGRpbmcuClNpbmNlIHdlIGFscmVhZHkgaGF2ZSBob3N0LXN3aWcgYXMgYSBkZXBlbmRl
bmN5LCB3ZSBjYW4gcHJvYmFibHkgdXNlIHRoYXQgb25lIHRvIGJ1aWxkIGFzIFlhbm4gc3VnZ2Vz
dGVkPwoKPiArCWhvc3Qtc3dpZyBcCj4gKwlmcmVldHlwZSBcCj4gKwltdXBkZiBcCj4gKwl6bGli
Cj4gICAKPiAtUFlUSE9OX1BZTVVQREZfRU5WID0gQ0ZMQUdTPSItSSQoU1RBR0lOR19ESVIpL3Vz
ci9pbmNsdWRlL211cGRmIC1JJChTVEFHSU5HX0RJUikvdXNyL2luY2x1ZGUvZnJlZXR5cGUyIgo+
IC0KPiAtIyBXZSBuZWVkIHRvIHJlbW92ZSB0aGUgb3JpZ2luYWwgcGF0aHMgYXMgd2UgcHJvdmlk
ZSB0aGVtIGluIHRoZSBDRkxBR1M6Cj4gLWRlZmluZSBQWVRIT05fUFlNVVBERl9SRU1PVkVfUEFU
SFMKPiAtCXNlZCAtaSAiL1wvdXNyXC9pbmNsdWRlXC9tdXBkZi9kIiAkKEBEKS9zZXR1cC5weQo+
IC0Jc2VkIC1pICIvXC91c3JcL2luY2x1ZGVcL2ZyZWV0eXBlMi9kIiAkKEBEKS9zZXR1cC5weQo+
IC0Jc2VkIC1pICIvXC91c3JcL2xvY2FsXC9pbmNsdWRlXC9tdXBkZi9kIiAkKEBEKS9zZXR1cC5w
eQo+IC0Jc2VkIC1pICIvbXVwZGZcL3RoaXJkcGFydHlcL2ZyZWV0eXBlXC9pbmNsdWRlL2QiICQo
QEQpL3NldHVwLnB5Cj4gLWVuZGVmCj4gLQo+IC1QWVRIT05fUFlNVVBERl9QT1NUX1BBVENIX0hP
T0tTID0gUFlUSE9OX1BZTVVQREZfUkVNT1ZFX1BBVEhTCj4gK1BZVEhPTl9QWU1VUERGX0VOViA9
IFwKPiArCVBZTVVQREZfSU5DTFVERVM9IiQoU1RBR0lOR19ESVIpL3Vzci9pbmNsdWRlL2ZyZWV0
eXBlMjokKFNUQUdJTkdfRElSKS91c3IvaW5jbHVkZSIgXAo+ICsJUFlNVVBERl9NVVBERl9MSUI9
IiQoU1RBR0lOR19ESVIpL3Vzci9saWIiIFwKPiArCVBZTVVQREZfU0VUVVBfRkxBVk9VUj1wIFw+
ICsJUFlNVVBERl9TRVRVUF9JTVBMRU1FTlRBVElPTlM9YSBcCgpJdCdzIHdvcnRoIG5vdGluZyB0
aGF0IFB5TXVQREYgaXMgZ3JhZHVhbGx5IHN3aXRjaGluZyB0byBhIG5ldyBpbXBsZW1lbnRhdGlv
biB3aGljaCB3aWxsIHJlcXVpcmUgTXVQREYgdG8gYmUgYnVpbHQgd2l0aCBweXRob24gYmluZGlu
Z3MgaW4gdGhlIGZ1dHVyZSAoYnV0IGZvciBub3csIGJvdGggaW1wbGVtZW50YXRpb25zIGFyZSBz
dGlsbCBhdmFpbGFibGUgQUZBSUNUKS4KCj4gKwlQWU1VUERGX1NFVFVQX01VUERGX0JVSUxEPQo+
ICAgCj4gICAkKGV2YWwgJChweXRob24tcGFja2FnZSkpCgpUaGVyZSBzZWVtIHRvIGJlIG1vcmUg
d29yayBuZWVkZWQgdG8gZ2V0IHRoaXMgbmV3IHZlcnNpb24gdG8gd29yaywgSSdsbCB0cnkgdG8g
aGF2ZSBhIGNsb3NlciBsb29rIGF0IGl0IGluIHRoZSBuZXh0IGZldyBkYXlzLgoKCktpbmQgcmVn
YXJkcywKClJhcGhhw6tsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0
cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
