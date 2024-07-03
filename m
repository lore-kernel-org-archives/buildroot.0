Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABC3CC2BD09
	for <buildroot@archiver.kernel.org>; Wed,  3 Jul 2024 20:10:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6949060733;
	Wed,  3 Jul 2024 20:10:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fsLDsB7ABodB; Wed,  3 Jul 2024 20:10:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8733660841
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8733660841;
	Wed,  3 Jul 2024 20:10:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0473C1BF36E
 for <buildroot@lists.busybox.net>; Wed,  3 Jul 2024 20:10:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E6DCE844DA
 for <buildroot@lists.busybox.net>; Wed,  3 Jul 2024 20:10:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O1fuoU2Az1dZ for <buildroot@lists.busybox.net>;
 Wed,  3 Jul 2024 20:10:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::229; helo=mail-lj1-x229.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 38C9C83F28
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 38C9C83F28
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 38C9C83F28
 for <buildroot@buildroot.org>; Wed,  3 Jul 2024 20:10:38 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2ed5ac077f5so69996691fa.1
 for <buildroot@buildroot.org>; Wed, 03 Jul 2024 13:10:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720037437; x=1720642237;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=seMFwVdfADwT2hLG7gyBzyJGdI7DwjdTJasF1pJDrCU=;
 b=L2K9eoIOJsSQLSYUj4Qa7tT3sJNRJBsbKWrhOej7VimCaexV3xCKdB7/yCbgzM7SG+
 ab3oqyTI5Ka99jmyw+Lm7DpfbheRomh5PMyjpTBr2HF7U/9MCi3lF9L384OWWzvbZ6Zn
 6iI55B1GNPzgyRUyrahDqKlzO0FFcVfqOxKTX5v38gfYOUUYx5bdI96yvOFcBcY98/kL
 oZ0g7+UfkmVvoq/qk6rmzuPVxPHZfijimxsKT564SLMsSLITRWHIlDIcsDC1SK5KXe1S
 07TaPyqHsXqDkkeF1ekvYJjBR93eDnARO6FNlxdo9XIH4iHtCCDQSALZq0EGHJtaK/gK
 dIGg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVlhUt3fFmi1MgiPLmBdsZs4GBdKkJf1rymudcoaD60SRCApGUxifCc8QQaDZXP1wykJnwSW6dhDN9h7TJK5+xYNqLwiLPPgQ==
X-Gm-Message-State: AOJu0YxQG4yfzeV7/Jw3ZuVdlJoSn87JeQ/zYq0Rh6Pi87LoibWpjRPM
 53N9DdTyTotIaiuR/lE8UwxMJbwRKV4KlHz/1PQ6cR+TAF0ckLvKP3ICej8kGqyDcCO4r5A3cyM
 F
X-Google-Smtp-Source: AGHT+IFBookkI+EmSP4UQKZfktcwEYO0d+hxKf2iB5rXIJ89BoFWPmHKEhPKGJ4oEmvHWbXAaBMxWg==
X-Received: by 2002:a2e:bcc1:0:b0:2ee:6b86:b098 with SMTP id
 38308e7fff4ca-2ee6b86b263mr79326411fa.8.1720037436443; 
 Wed, 03 Jul 2024 13:10:36 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:e3ef:2d7a:4131:71f?
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4257a2f7451sm194876965e9.0.2024.07.03.13.10.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Jul 2024 13:10:36 -0700 (PDT)
Message-ID: <00811c59-efb8-4a4d-9db8-16f4b2cc7c08@smile.fr>
Date: Wed, 3 Jul 2024 22:10:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Arnout Vandecappelle <arnout@mind.be>, buildroot@buildroot.org
References: <20240703151407.1827264-1-arnout@mind.be>
Content-Language: fr, en-US
In-Reply-To: <20240703151407.1827264-1-arnout@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1720037437; x=1720642237; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=seMFwVdfADwT2hLG7gyBzyJGdI7DwjdTJasF1pJDrCU=;
 b=XH0FYypt7EPtlQDoo979ghpohRSxVJtCx1Cq3W+sNq1xIYLUDeJ7CLhua8M2WFiQU7
 PQXl24SM4h+tAMY9klaOcnlzV9fiv5KjM4uh/+lZV3+nx+PI0IJVHK3RMXr65Z5zYHtm
 PxIfciWugs/13fKXXM6lE3jNVcwgYlVpKOqhI=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=XH0FYypt
Subject: Re: [Buildroot] [PATCH 1/5] docs/website/news.html: announce LTS
 Sponsoring
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gQXJub3V0LCBBbGwsCgpMZSAwMy8wNy8yMDI0IMOgIDE3OjE0LCBBcm5vdXQgVmFuZGVj
YXBwZWxsZSB2aWEgYnVpbGRyb290IGEgw6ljcml0wqA6Cj4gQWx0aG91Z2ggdGhlIG5leHQgY29t
bWl0cyB3aWxsIGFsc28gYWRkIG1vcmUgaW5mb3JtYXRpb24gYWJvdXQgdGhlIExUUwo+IHNwb25z
b3JpbmcgaW4gb3RoZXIgcGxhY2VzIG9uIHRoZSB3ZWJzaXRlLCBsaW5rIGRpcmVjdGx5IHRvIHRo
ZSBsYW5kaW5nCj4gcGFnZSBvbiB0aGUgTWluZCB3ZWJzaXRlLgo+IAo+IFNpZ25lZC1vZmYtYnk6
IEFybm91dCBWYW5kZWNhcHBlbGxlIDxhcm5vdXRAbWluZC5iZT4KClNlcmllcyBhcHBsaWVkIHRv
IG1hc3RlciwgdGhhbmtzLgoKQmVzdCByZWdhcmRzLApSb21haW4KCgo+IC0tLQo+ICBkb2NzL3dl
YnNpdGUvbmV3cy5odG1sIHwgMjEgKysrKysrKysrKysrKysrKysrKysrCj4gIDEgZmlsZSBjaGFu
Z2VkLCAyMSBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL2RvY3Mvd2Vic2l0ZS9uZXdz
Lmh0bWwgYi9kb2NzL3dlYnNpdGUvbmV3cy5odG1sCj4gaW5kZXggOWFiZGY4ZjcyMC4uN2U2NmQw
MjMzMSAxMDA2NDQKPiAtLS0gYS9kb2NzL3dlYnNpdGUvbmV3cy5odG1sCj4gKysrIGIvZG9jcy93
ZWJzaXRlL25ld3MuaHRtbAo+IEBAIC05LDYgKzksMjcgQEAKPiAgPGgyPk5ld3M8L2gyPgo+ICA8
dWwgY2xhc3M9InRpbWVsaW5lIj4KPiAgCj4gKyAgPGxpIGNsYXNzPSJ0aW1lbGluZS1pbnZlcnRl
ZCI+Cj4gKyAgICA8ZGl2IGNsYXNzPSJ0aW1lbGluZS1iYWRnZSI+PGkgY2xhc3M9ImdseXBoaWNv
biBnbHlwaGljb24tZXVybyI+PC9pPjwvZGl2Pgo+ICsgICAgPGRpdiBjbGFzcz0idGltZWxpbmUt
cGFuZWwiPgo+ICsgICAgICA8ZGl2IGNsYXNzPSJ0aW1lbGluZS1oZWFkaW5nIj4KPiArCTxoNCBj
bGFzcz0idGltZWxpbmUtdGl0bGUiPkxUUyBTcG9uc29yaW5nIGFubm91bmNlZDwvaDQ+Cj4gKyAg
ICAgIDwvZGl2Pgo+ICsgICAgICA8ZGl2IGNsYXNzPSJ0aW1lbGluZS1ib2R5Ij4KPiArCTxwPldl
IGFyZSBleGNpdGVkIHRvIHNoYXJlIHRoYXQgd2UgaGF2ZSBsYXVuY2hlZCB0aGUgQnVpbGRyb290
IExvbmcKPiArCSAgVGVybSBTdXBwb3J0IChMVFMpIFNwb25zb3JpbmcgUHJvamVjdCE8L3A+Cj4g
Kwk8cD5UaGlzIGluaXRpYXRpdmUgY29tZXMgZnJvbSBhIHBsYWNlIHdoZXJlIHdlIHVuZGVyc3Rh
bmQgdGhlIGNyaXRpY2FsCj4gKwkgIG5lZWQgZm9yIGV4dGVuZGVkIHN1cHBvcnQgd2hpY2ggaXMg
YmV5b25kIHZvbHVudGVlcmluZy4gVGhhdCdzIHdoeQo+ICsJICB3ZSBhcmUgY2FsbGluZyBhbGwg
QnVpbGRyb290IHVzZXJzIGFuZCBlbnRodXNpYXN0cyB0byBjb21lIHRvZ2V0aGVyCj4gKwkgIGFu
ZCBqb2luIHRoaXMgaW5pdGlhdGl2ZSB0aGF0J3Mgc2hhcGluZyB0aGUgZnV0dXJlIG9mIEJ1aWxk
cm9vdC48L3A+Cj4gKwk8cD4KPiArCTxwPkZpbmQgbW9yZSBpbmZvcm1hdGlvbiBvbiB0aGUKPiAr
CSAgPGEgaHJlZj0iaHR0cHM6Ly9taW5kLmJlL2J1aWxkcm9vdC1sdHMiPkJ1aWxkcm9vdCBMVFMg
U3BvbnNvcmluZwo+ICsJICBwYWdlPC9hPi48L3A+Cj4gKyAgICAgIDwvZGl2Pgo+ICsgICAgPC9k
aXY+Cj4gKyAgPC9saT4KPiArCj4gICAgPGxpPgo+ICAgICAgPGRpdiBjbGFzcz0idGltZWxpbmUt
YmFkZ2UiPjxpIGNsYXNzPSJnbHlwaGljb24gZ2x5cGhpY29uLXRodW1icy11cCI+PC9pPjwvZGl2
Pgo+ICAgICAgPGRpdiBjbGFzcz0idGltZWxpbmUtcGFuZWwiPgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWls
ZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9idWlsZHJvb3QK
