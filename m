Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 479E6CA0ED1
	for <buildroot@archiver.kernel.org>; Mon, 11 Aug 2025 20:47:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E1C1E41B71;
	Mon, 11 Aug 2025 20:47:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GVew8wdZ_-iX; Mon, 11 Aug 2025 20:47:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E7A0A41701
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E7A0A41701;
	Mon, 11 Aug 2025 20:47:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 01357D98
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 20:47:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DB72A4005E
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 20:47:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Wvqszd3vU9d0 for <buildroot@buildroot.org>;
 Mon, 11 Aug 2025 20:47:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A17E640F56
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A17E640F56
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A17E640F56
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 20:47:50 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3b7825e2775so4286035f8f.2
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 13:47:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754945268; x=1755550068;
 h=content-transfer-encoding:in-reply-to:from:cc:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Nv7OmxjqNt9GfFOc/porIr7ZO5inZn23O0kHXnnNIz0=;
 b=uiktPPJj3VemXHTJ5dXEyHQIVyD5JUxJ7gu+duDyXqKWlD4p3FXeJJ3hFLHrA5gq8n
 WLLhO83ZmM8ROvPnQZPpgIR/XEEV3lfsyuR8GaFba+e/AqVU0jxNjH116ny1iFcf4Zlx
 nBCj4gIhFeVemPeoXYcMxTYXBWGN04miF3pMTr91bw43ADscPgOZz4yg6vdtzcrBVSkw
 CZ5qCgH5kmvaCA5udDZ3/ytXd79fJYZhiyirVL3XfcGvLjCLQb1dLc/BuOsIaH3Or7OV
 LVzb8cLLkDpjyzZL+N5mdS/Z1beRqRgq4ILgT6MonjCfuhmKVkggOGMgN62Gc9fBEQYT
 tPTQ==
X-Gm-Message-State: AOJu0Yz3aILmmGR1oqZD1CWyIfymilwbjXPEURGiQFf/1ig4T19KLmko
 2jsIXoVEAJy4YAvIVflvj7qCKnDaKZGv3eSUGXKYHXBcJyUNTF28VVNEaNnun8/n9mTShG76mOs
 w4hSQ
X-Gm-Gg: ASbGncvPXaB7B5g78ai4gz7TogzTkiZjsjmNV5HrcmFIl/HCK2DNhNkTURvE77vYi/O
 Ea0mdL6zfJaWGVetg+Hfp58qJQyM6FWxmisgIj+ErqGkYsUSx3bajo1Fe6/8FYuLFSwu29C5Gq8
 0l/9+/UMVQf1JfO0Z3a3qvgMWh6Yi/iFPgCoJhb2a5eOy2LEZt9HMkGYqz4YJdkyvLJfTiVM4S4
 Q/dCTt2zCdXbM4zhws9rIjpS8a8VnP2R2M6D49uoVDurzGboUQE/YYy28xpZwT2eUbtk8cvBovP
 VKE4Z9li+coMgWhETKTotF+wtNFH/YwwUnAyjqHNRsGsrS3vgMEUoW1Ky99jneJ7/pC2cLMc+f3
 zBnDOtcqe6FLVTopFo3yVz7lO4OJLphCvKWiUtY+AuQuTV/9ylttucSGfMNL45mOQmk4mzBsfmq
 8gh7DCtxFnYxjIEEYX2NENAiKb4a1j450aPD5PPzts11d6HwoYZws/4fZrR8TWLRIRoMyxSqU=
X-Google-Smtp-Source: AGHT+IHdh+ffyqxGHPewfGQWJxMztWVNRPEPlDQVuCOF0hCoFB4bIqiUuYrRbQ11yWWrgNV1rz4tqQ==
X-Received: by 2002:a5d:64c4:0:b0:3b7:6828:5f78 with SMTP id
 ffacd0b85a97d-3b910fcc8a3mr925558f8f.4.1754945268580; 
 Mon, 11 Aug 2025 13:47:48 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:c97d:3b73:4a46:d823?
 (2a01cb05949d5800c97d3b734a46d823.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:c97d:3b73:4a46:d823])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b79c3ac51asm42749244f8f.1.2025.08.11.13.47.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Aug 2025 13:47:48 -0700 (PDT)
Message-ID: <c6fab884-3590-411b-8f3a-257ba882ee15@smile.fr>
Date: Mon, 11 Aug 2025 22:47:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: buildroot@buildroot.org
References: <20250811203206.1506378-1-romain.naour@smile.fr>
Content-Language: fr, en-US
Cc: Joachim Wiberg <troglobit@gmail.com>
In-Reply-To: <20250811203206.1506378-1-romain.naour@smile.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1754945268; x=1755550068; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:cc:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Nv7OmxjqNt9GfFOc/porIr7ZO5inZn23O0kHXnnNIz0=;
 b=dXlZJPhbE3kSULvGZ6DZKvy/WFpR9SaBMJ19xMAhmObxC86fm90QIvsyRjmToexi8N
 /FY047qLFtXOJ8LvLE4fD2Do9lKjsMu+JrxqXE3BtQapRFDvO/JonKnKaAZrrJsJr27X
 cJPQcKgzWxsyL/0bSFUr3/XL3qnG9mxps3IQc=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=dXlZJPhb
Subject: Re: [Buildroot] [PATCH 1/2] package/thttpd: port to C99
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

SGVsbG8gSm9hY2hpbSwgQWxsLAoKTGUgMTEvMDgvMjAyNSDDoCAyMjozMiwgUm9tYWluIE5hb3Vy
IGEgw6ljcml0wqA6Cj4gQXBwbHkgY2hhbmdlcyBmcm9tIEZlZG9yYSBbMV0gdG8gZml4IGdjYy0x
NSBpc3N1ZXMuCj4gCj4gRGVzcGl0ZSB0aGUgbGFzdCB0aHR0cGQgcmVsZWFzZSAyLjI5IGJhY2sg
aW4gMjAxOCwgdGhlIHBhY2thZ2UKPiBkb2Vzbid0IGJ1aWxkIHdpdGggbW9kZXJuIGNvbXBpbGVy
IGFuZCBBdXRvY29uZiAobmV3ZXIgdGhhbiAyLjEzKS4KPiAKPiBGaXhlczoKPiBodHRwczovL2F1
dG9idWlsZC5idWlsZHJvb3Qub3JnL3Jlc3VsdHMvZjY1L2Y2NTY0YjE0NDM2NmE5MzZlOTQ1NTU4
NzUxNDFkZmUwY2NhNWQxMWIKPiBodHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWls
ZHJvb3QvLS9qb2JzLzEwOTcyODU5MzM4Cj4gaHR0cHM6Ly9naXRsYWIuY29tL2J1aWxkcm9vdC5v
cmcvYnVpbGRyb290Ly0vam9icy8xMDk3Mjg1ODk3OQo+IAo+IFsxXSBodHRwczovL3NyYy5mZWRv
cmFwcm9qZWN0Lm9yZy9ycG1zL3RodHRwZC9jLzYwOGExMGU3NzU4ZWI4NzU1NmFmNTIwNmFiZWVk
Y2ExZDNjZDUwMGYKPiAKPiBTaWduZWQtb2ZmLWJ5OiBSb21haW4gTmFvdXIgPHJvbWFpbi5uYW91
ckBzbWlsZS5mcj4KPiAtLS0KPiB0aHR0cGQgcGFja2FnZSBpcyB1c2VkIGJ5IFRlc3RXZ2V0IGFu
ZCBUZXN0TGliQ3VybCwgc28gd2UgY2FuJ3QgcmVtb3ZlIGl0Cj4gcmlnaHQgbm93LgoKSm9hY2hp
bSwgZG8geW91IGtub3cgaWYgeW91ciBpbXBsZW1lbnRhdGlvbiAibWVyZWNhdCIgWzFdIGNhbiBy
ZXBsYWNlIHRodHRwZD8KSW5kZWVkLCB0aGUgd2lraXBlZGlhIFsyXSByZXBvcnQgIm1lcmVjYXQi
IGFzIGEgZm9yayBvZiB0aHR0cGQuCgpbMV0gaHR0cHM6Ly9naXRodWIuY29tL3Ryb2dsb2JpdC9t
ZXJlY2F0LwpbMl0gaHR0cHM6Ly9lbi53aWtpcGVkaWEub3JnL3dpa2kvVGh0dHBkI0ZvcmtzCgpC
ZXN0IHJlZ2FyZHMsClJvbWFpbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9y
ZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
