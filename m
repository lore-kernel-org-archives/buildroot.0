Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 815E3E7DEF2
	for <buildroot@archiver.kernel.org>; Mon,  2 Feb 2026 14:57:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A7045607D3;
	Mon,  2 Feb 2026 14:57:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qb5jkT6tZNAp; Mon,  2 Feb 2026 14:57:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9AC3560726
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770044243;
	bh=ZalXs5hvLF4TZVrWULvupSC34+p0+VrZsxIHs+OdlCk=;
	h=Date:To:References:Cc:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=nbSn4F8zTdhBF/SeGr+UzhqX2pBVo2j5QoiekAUIjrzp/TBsnQg8x0rW9XGRpw6v4
	 /ECLw/A5sDvhhJX2ewd44x4omk1Lu/0uZD5fpnwxUxp83H15ZzpF5FFvELKepy5q8W
	 b0rNTMUo1/XB/Y1DLiu2vPSVIPujnoa4BltjfoKUrXZzWjEqHPbL7olK/RXBpSwL0e
	 L20QaZUQ2K5MOc2jDtW/Nig2XYP9864Zxkpm90SVeFXs5KjgnbkqkaGxjWszU5Ks4R
	 H1uyLGOWbEJab/2VCEqXFxB4PkpyVj8KCfrAbErwsi1YkO0ZjqZoSDSJk/3xKsGPsU
	 swQMdg9nzmAYQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9AC3560726;
	Mon,  2 Feb 2026 14:57:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0510023E
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 14:57:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DBE254093E
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 14:57:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t9-DEK9QqYgY for <buildroot@buildroot.org>;
 Mon,  2 Feb 2026 14:57:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B6A0240A51
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B6A0240A51
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B6A0240A51
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 14:57:20 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-43591b55727so3972063f8f.3
 for <buildroot@buildroot.org>; Mon, 02 Feb 2026 06:57:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770044239; x=1770649039;
 h=content-transfer-encoding:in-reply-to:cc:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Ma0BTLeRjue6dhrIlfFXhQycMNi6dQWraMvVKFxiSDo=;
 b=Qm4EUn3KrwdfUvlOy9V6raUz3naMS9xEluYJVVIt9slDLB3UGAZEgKsZu2BOaG3XU9
 e6I7x3WooQEEp8glBLk/ob9xBbiI4BQrYT5EKDEnqztFstxvpA/jqam0bqxJUxkbIKc/
 2meClK2cxixOR9SBu1E436+yX22jD59qSoSeQBuR1hopbGploV8yBcMvyW490cZF+pEz
 SdHvBjC15YPWiVk0VLoys+ZSpZ14j6+okmkiDZatOba1cfJ3owaF1UDMRMRA4d581wmE
 NOGSbi81355p1SLFB9z7eKPC1o5nKwFpCDRfAlD4NMR6c+CSPQpb0g/EYjdeabKjwwKA
 ZkFA==
X-Gm-Message-State: AOJu0Yzr9FJBwJgcCt+jceavKNhKRCDamUwgpy8x32EBySpsPQz9ihBn
 jg288fv5HSAioT8ltGw0v7cw2qpXcbl/YuLHxYIl53iOeoTDTU1sBHINvC7w/AImg9G4Kqpuq2W
 1JE7n+ao=
X-Gm-Gg: AZuq6aJ8HBmGJAwcXuG5YYgPycfbTxBJu9hCNdnLnz/ulhwfV7gRTd/zBtFLlKaY0bT
 xUejJ6ApCH7gqKLONg7PBo0Y+YywWis3sQiVROmSRnbDOz1DRFhHSVNRQqtJJ9kkD+Aw8DBRAwd
 DXebheW6DyfyjafZjJhRWwRE0z40tnDf26dchc1tKEE918SRfeUUv7SMDTe0pnDbEnNy9CwUNsx
 JnqkAXioQwjEYtOB2Gnj0A4bdTgiD3HxPUoMntrhnoKqxFTOGWYf4s9f34//d4rez90TOfjP2sx
 POR+tcWduteT2OU/dJG/GRpJb7NAHiLR8vrlhcF4hovPheB5P//YWB/OWzf5OZchB9mpsT5tN9X
 uDykaFkKF7rrGKJVZ5aAjmz6AT2AnvIscFsJUEb5OgWpYLmpb0cp7lqxkdSx2wygr2LKIJ/gt2I
 xZIdW79B6g3QoXxFP3tvl3uWDOdJhz5A7It9QlnJlYGRaVz7yRxADy
X-Received: by 2002:a05:6000:25c1:b0:435:a4a9:6f79 with SMTP id
 ffacd0b85a97d-435f3a6aa94mr15979168f8f.8.1770044238613; 
 Mon, 02 Feb 2026 06:57:18 -0800 (PST)
Received: from [172.16.2.208] (host-109-89-232-55.dynamic.voo.be.
 [109.89.232.55]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-435e1322dc7sm44932739f8f.37.2026.02.02.06.57.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Feb 2026 06:57:18 -0800 (PST)
Message-ID: <677cef30-38c8-4126-9dbb-b45c553ed702@smile.fr>
Date: Mon, 2 Feb 2026 15:57:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: buildroot@buildroot.org
References: <20260202144550.1877480-1-romain.naour@smile.fr>
Content-Language: fr, en-US
Cc: Julien Olivain <ju.o@free.fr>
In-Reply-To: <20260202144550.1877480-1-romain.naour@smile.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1770044239; x=1770649039; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:cc:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Ma0BTLeRjue6dhrIlfFXhQycMNi6dQWraMvVKFxiSDo=;
 b=VjR7svNjCl4F3D52DYKgxKoY+M/efc/U5gQWTDqpFpytawiw/X6E/y1ZbAhRa/PlvK
 f5FfRPFUu6duU93Qhr225ynywFgEr4g6/wLegVBGLwnH46O3ycFWSGX5SYOTq4BGMtWL
 W9z3r0hkEkOGMQSHX0GtpHZyTeo869p7fi1H4=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=VjR7svNj
Subject: Re: [Buildroot] [PATCH]
 support/testing/tests/package/test_firewalld: use ext2 instead of cpio
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

SGVsbG8sCgpMZSAwMi8wMi8yMDI2IMOgIDE1OjQ1LCBSb21haW4gTmFvdXIgYSDDqWNyaXTCoDoK
PiBUaGUgQ1BJTyBmaWxlc3lzdGVtIGdlbmVyYXRlZCBieSB0aGUgdGVzdF9maXJld2FsbGQgdGVz
dCBpcyB0b28KPiBsYXJnZSwgYW5kIGRvZXNuJ3QgZml0IGFzIGFuIGluaXRyYW1mcyBpbiB0aGUg
MjU2TUIgb2YgUkFNIGF2YWlsYWJsZQo+IGluIHRoZSB2ZXJzYXRpbGVwYiBtYWNoaW5lLiBUaGlz
IGNhdXNlcyBhICJJbml0cmFtZnMgdW5wYWNraW5nIGZhaWxlZDoKPiB3cml0ZSBlcnJvciIgd2hl
biBib290aW5nLCBhbmQgbWFueSBmaWxlcyBiZWluZyBtaXNzaW5nIGZyb20gdGhlIHJvb3QKPiBm
aWxlc3lzdGVtLCB1bHRpbWF0ZWx5IGNhdXNpbmcgdGhlIHRlc3QgdG8gZmFpbC4KPiAKPiBUaGUg
dGVzdF9maXJld2FsbGQgdGVzdCBpbml0aWFsbHkgc3RhcnRlZCB0byBmYWlsIGZvbGxvd2luZyBh
IHN5c3RlbWQKPiB1cGRhdGUgWzFdWzNdOgo+IAo+ICAgW0JSVEVTVCMgc3lzdGVtY3RsIGlzLWFj
dGl2ZSBmaXJld2FsbGQKPiAgIGZhaWxlZAo+IAo+IEJ1dCByZWFsbHkgc3RhcnRlZCB0byBjcmFz
aCBhdCBib290IGZvbGxvd2luZyBhIHB5dGhvbiAzLjE0IHVwZGF0ZQo+IFsyXVs0XToKPiAKPiAg
IFJ1biAvaW5pdCBhcyBpbml0IHByb2Nlc3MKPiAgIC9pbml0OiBleGVjOiBsaW5lIDE1OiAvc2Jp
bi9pbml0OiBub3QgZm91bmQKPiAKPiBBbHNvLCB1cGRhdGUgVGVzdEZpcmV3YWxsZFN5c1ZJbml0
IHRvIHVzZSBleHQyIGluc3RlYWQgb2YgY3Bpby4KPiAKPiBbMV0gOTI2ZTA1MDRkMDZiNWQ2MWQ3
YWZmYjI0Yjk0YjEzM2I5MTZiNzFmNwo+IFsyXSBhMGE2YWJjOGIxOTNlNWJkYWI1MzI2MzI0ZDcy
OTljMTlkNWQ4YzY3Cj4gCj4gRml4ZXM6Cj4gWzNdIGh0dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJv
b3Qub3JnL2J1aWxkcm9vdC8tL2pvYnMvMTI5NDQ3OTcwNTkKPiBbNF0gaHR0cHM6Ly9naXRsYWIu
Y29tL2J1aWxkcm9vdC5vcmcvYnVpbGRyb290Ly0vam9icy8xMTg1Njg0MDk0MAo+IAo+IFNpZ25l
ZC1vZmYtYnk6IFJvbWFpbiBOYW91ciA8cm9tYWluLm5hb3VyQHNtaWxlLmZyPgpPdmVyIHRoZSB0
aW1lLCB3ZSBoYXZlIHRoZSBzYW1lIGlzc3VlIHdpdGggdGhlIGxpbWl0ZSBvZiAyNTZNQiBvZiBS
QU0gb24gdGhpcwpxZW11IHRhcmdldC4gRG8gd2UgcGxhbiB0byB1c2UgYW5vdGhlciB0YXJnZXQg
YnkgZGVmYXVsdD8gTWF5YmUgc3dpdGNoIHRvCmFhcmNoNjQgdGFyZ2V0ID8KCmh0dHBzOi8vZ2l0
bGFiLmNvbS9idWlsZHJvb3Qub3JnL2J1aWxkcm9vdC8tL2NvbW1pdC9hOWRmMjA2MTkwZTUzMTY4
MDhiOTAzMTRlNDI1NGJhOWU4NDllNDAzCihmaXJzdCBzd2l0Y2ggdG8gZXh0MiBoYXBwZW5lZCBp
biAyMDIyKQoKV2Ugbm93IGhhdmUgbWFueSB0ZXN0cyBidWlsZGluZyB0aGVpciBvd24gYWFyY2g2
NCBrZXJuZWwgc2luY2Ugd2UgZG9uJ3QgaGF2ZSBhCnByZWJ1aWx0IGFhcmNoNjQga2VybmVsIHll
dC4KClRob3VnaHRzPwoKQmVzdCByZWdhcmRzLApSb21haW4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRy
b290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlz
dGluZm8vYnVpbGRyb290Cg==
