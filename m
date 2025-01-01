Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC7F1E7718B
	for <buildroot@archiver.kernel.org>; Wed,  1 Jan 2025 20:44:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B9FCB80F4F;
	Wed,  1 Jan 2025 20:44:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SXDGtZ40mLKy; Wed,  1 Jan 2025 20:44:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CBD7480F6E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CBD7480F6E;
	Wed,  1 Jan 2025 20:44:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5DEEBF24
 for <buildroot@buildroot.org>; Wed,  1 Jan 2025 20:44:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3EFE060615
 for <buildroot@buildroot.org>; Wed,  1 Jan 2025 20:44:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tbYPVa2p51gV for <buildroot@buildroot.org>;
 Wed,  1 Jan 2025 20:44:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::344; helo=mail-wm1-x344.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B9F5F60611
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B9F5F60611
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B9F5F60611
 for <buildroot@buildroot.org>; Wed,  1 Jan 2025 20:44:07 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id
 5b1f17b1804b1-436341f575fso112695505e9.1
 for <buildroot@buildroot.org>; Wed, 01 Jan 2025 12:44:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735764245; x=1736369045;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ikribbMjAAmavCQRyeYlxUVepgoVRNiBpv9VOnPomog=;
 b=WJNXCeo/ZOhCaBjoPdnP4USn3pCSSStWRt90PKCV2LHFrrWXNwhCBNbZOH5QGOn6lT
 h0cP/qD1AKnSuyMAuoatqh7RuJ5sJsorX1PVsgrGptrUfGxD/XZuI4uYMWwopGM6JW8i
 BfFl/uSYS8VIjQ6gfR2tbhV3JYITerZnNoyUjAfvmjJzjXxGhH7tUiZIatNSDeQXswDu
 z7ju8nfOT+RYgmDHFZC47WePjM+3c6WwnB5Y5rdaUBV4/cI0TZeuPocGnUeyVbGLIsSP
 /IiilNMbF7OAzfm2Eaoj99Qtbcg1pxOjiS9OHrevgi23m6oyPpXOvm7ctqqtNZd5Ojpv
 JcYA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUZIyA6ghNeHQwuvf4ciUuNHVMmJiUzCyWIfFkwm5knekaXfKmVE070ZPSXO+Zy4SuXxv1wnP9uzsM=@buildroot.org
X-Gm-Message-State: AOJu0YyaePsahK044Uj9wVWQZCMJc8fKc/fWFYLM63dbvjejvgvo2NIX
 hg6XHxuGsXtpGk2Otz5lWVU9Yil+0Y8qeyRHC5IOX0zde/nwLL0DqGFuYAMOvxY=
X-Gm-Gg: ASbGncu4ZCtjTAC0g/AwqAEDwKZ+eTNLlXiMqbDLPnN3aQsz02jP39jrD+zOO9bFARM
 bL34MRBLOfgNgHjAG1kPvISx+S+/m326ytdn8b4XgWymPAmEhfmcCM9hg3PbnTiLck90WxchbZe
 oD6zEQGQgOKo5ocYKT0U0T8/dUkLxTgoaWzVWGmJU7jqZ+RaShxnjZQzbIWaFz+63W0vuirbdFA
 rccdE65nz0dYDfZNc3tg3oHIbVOFa609SjF0ueluuyHqyJ17zjJbYdndSC8wWVmEy0ysMNg8h7x
 24aOpDQMNRHadB9QrMEd1w5573ascto4WMndFgsc6Xpn5WYEeO0wIX2x1Ao+wFY7ypihDdvWKkO
 cJ+CObH8G4E3xh4Gr
X-Google-Smtp-Source: AGHT+IGuIh9CTBbHNjNtdWkU5XTr6tu5uGGR9/R9Zv/5aGT8k6OGIIOuD9O9ZA5CY//DjtvqzTsVPQ==
X-Received: by 2002:a05:600c:1d10:b0:434:ff45:cbbe with SMTP id
 5b1f17b1804b1-4366864414amr401961895e9.18.1735764245408; 
 Wed, 01 Jan 2025 12:44:05 -0800 (PST)
Received: from ?IPV6:2a01:cb05:949d:5800:e3ef:2d7a:4131:71f?
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43661219578sm435063215e9.20.2025.01.01.12.44.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Jan 2025 12:44:05 -0800 (PST)
Message-ID: <68e77125-69e1-4b69-95db-92b14a96a6f1@smile.fr>
Date: Wed, 1 Jan 2025 21:44:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bryan Brattlof <bb@ti.com>, buildroot@buildroot.org
Cc: Anand Gadiyar <gadiyar@ti.com>, Xuanhao Shi <X15000177@gmail.com>
References: <20241218-uboot-bump-v2-1-0692ca1c4dcd@ti.com>
Content-Language: fr
In-Reply-To: <20241218-uboot-bump-v2-1-0692ca1c4dcd@ti.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1735764245; x=1736369045; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ikribbMjAAmavCQRyeYlxUVepgoVRNiBpv9VOnPomog=;
 b=dtwcOZahpvWBiniXrFXQLutgyLOx3yUaOOBsI+V/TCPL/rstUGlgluau1xkdnaurIV
 gVgKEPF/Z9DhWqsYnmAhY8FCQBFR9nEu6Yi2Utp0wd1prKAQ9iogS9h8Ua7Ez5uaAZyq
 E0DJERM5bzitjnmiqaf/0Z7uWbdagj5PYutu4=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=dtwcOZah
Subject: Re: [Buildroot] [PATCH v2] boot/ti-k3-r5-loader: add host-gnutls to
 dependencies
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

SGVsbG8gQnJ5YW4sCgpMZSAxOS8xMi8yMDI0IMOgIDAxOjM3LCBCcnlhbiBCcmF0dGxvZiB2aWEg
YnVpbGRyb290IGEgw6ljcml0wqA6Cj4gTmV3ZXIgdmVyc2lvbnMgb2YgVS1Cb290IHdpbGwgcmVx
dWlyZSB0aGUgR251VExTIGxpYnJhcnkgdG8gYmUgaW5zdGFsbGVkCj4gb24gdGhlIGhvc3QgbWFj
aGluZSB0byBidWlsZCB0aGUgbWtlZmljYXBzdWxlIHRvb2wgZm9yIFUtQm9vdCdzIGltYWdlCj4g
cGFja2FnaW5nIHBoYXNlIHRvIGdlbmVyYXRlIHRoZSBmaW5hbCBjYXBzdWxlIGZvciBhbGwgdGhl
IGJvb3QgaW1hZ2VzCj4gaW5jbHVkaW5nIHRoZSB0aWJvb3QzLmJpbiBpbWFnZS4KPiAKPiBBZGQg
aG9zdC1nbnV0bHMgdG8gdGhlIGxpc3Qgb2YgZGVwZW5kZW5jaWVzLgo+IAo+IFNpZ25lZC1vZmYt
Ynk6IEJyeWFuIEJyYXR0bG9mIDxiYkB0aS5jb20+CgpJIGFkZGVkIGEgbGluayB0byBvdXIgZ2l0
bGFiLWNpIHdoZXJlIHRoZSBpc3N1ZSBoYXMgYmVlbiByZXBvcnRlZDoKCmh0dHBzOi8vZ2l0bGFi
LmNvbS9idWlsZHJvb3Qub3JnL2J1aWxkcm9vdC8tL2pvYnMvODcyMzQ4MzU3OCAodGlfYW02Mnhf
c2tfZGVmY29uZmlnKQoKQXBwbGllZCB0byBtYXN0ZXIsIHRoYW5rcy4KCkJlc3QgcmVnYXJkcywK
Um9tYWluCgoKPiAtLS0KPiBDaGFuZ2VzIGluIHYyOgo+IC0gZWxhYm9yYXRlZCBvbiBjb21taXQg
d2h5IGhvc3QtZ251dGxzIGlzIHJlcXVpcmVkCj4gLSBMaW5rIHRvIHYxOiBodHRwczovL2xvcmUu
a2VybmVsLm9yZy9yLzIwMjQxMjEwLXVib290LWJ1bXAtdjEtMS1iYWViNTlmZWVmNjFAdGkuY29t
Cj4gLS0tCj4gIGJvb3QvdGktazMtcjUtbG9hZGVyL3RpLWszLXI1LWxvYWRlci5tayB8IDEgKwo+
ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPiAKPiBkaWZmIC0tZ2l0IGEvYm9vdC90
aS1rMy1yNS1sb2FkZXIvdGktazMtcjUtbG9hZGVyLm1rIGIvYm9vdC90aS1rMy1yNS1sb2FkZXIv
dGktazMtcjUtbG9hZGVyLm1rCj4gaW5kZXggZTQyNmYwMzllMDIxZC4uZGI1YzNjZGFmOGI2NSAx
MDA2NDQKPiAtLS0gYS9ib290L3RpLWszLXI1LWxvYWRlci90aS1rMy1yNS1sb2FkZXIubWsKPiAr
KysgYi9ib290L3RpLWszLXI1LWxvYWRlci90aS1rMy1yNS1sb2FkZXIubWsKPiBAQCAtNDYsNiAr
NDYsNyBAQCBUSV9LM19SNV9MT0FERVJfREVQRU5ERU5DSUVTID0gXAo+ICAJaG9zdC1wa2djb25m
IFwKPiAgCSQoQlIyX01BS0VfSE9TVF9ERVBFTkRFTkNZKSBcCj4gIAlob3N0LWFybS1nbnUtdG9v
bGNoYWluIFwKPiArCWhvc3QtZ251dGxzIFwKPiAgCWhvc3Qtb3BlbnNzbCBcCj4gIAlob3N0LXB5
dGhvbjMgXAo+ICAJaG9zdC1weXRob24tanNvbnNjaGVtYSBcCj4gCj4gLS0tCj4gYmFzZS1jb21t
aXQ6IDM2NDVlM2I3ODFiZTVjZWRiYjBlNjY3Y2FhNzA0NTU0NDRjZTQ1NTIKPiBjaGFuZ2UtaWQ6
IDIwMjQxMjEwLXVib290LWJ1bXAtMmZhM2VmMDc2NjlmCj4gCj4gQmVzdCByZWdhcmRzLAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1h
aWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9v
dC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
