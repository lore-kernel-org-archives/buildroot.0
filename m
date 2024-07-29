Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A5E2C3DA4A
	for <buildroot@archiver.kernel.org>; Mon, 29 Jul 2024 19:29:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E92EE810A3;
	Mon, 29 Jul 2024 19:29:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DQRcpZdO2TkQ; Mon, 29 Jul 2024 19:29:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DB56E810A8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DB56E810A8;
	Mon, 29 Jul 2024 19:29:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D5AE21BF399
 for <buildroot@lists.busybox.net>; Mon, 29 Jul 2024 19:29:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C19FF810A8
 for <buildroot@lists.busybox.net>; Mon, 29 Jul 2024 19:29:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DUj50ONp-Foa for <buildroot@lists.busybox.net>;
 Mon, 29 Jul 2024 19:29:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62d; helo=mail-ej1-x62d.google.com;
 envelope-from=christian@aperture.us; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A6785810A3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A6785810A3
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A6785810A3
 for <buildroot@buildroot.org>; Mon, 29 Jul 2024 19:29:43 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a7aa212c1c9so518394266b.2
 for <buildroot@buildroot.org>; Mon, 29 Jul 2024 12:29:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722281381; x=1722886181;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GQz4my156B1o7s29Y58qtluD/6m6kLNEYi2qRzRQn1Y=;
 b=TH0+KCZCzwPleP128D57rOxc6qIync+S+Nu/K1BfX15wJJVNee83srD98cMt9cN1bc
 HjDkaHYFJMiEA9UnH/mFL4veU1piy5fiWUGy3NDYmoTJGdvwrl5XMf9alb9/lFkGsAyA
 eu2uFuhoUuPG5b9V87Dl7Ch5/im5EP5uFo71ULhtOGZShecABi6MccvBrA2Zrw3nf06N
 JSmbfEu70Vvs6LAsDYfQuCi34NZjD/NjVJImeq8nWtS54N5BV9bpflFnttWqwp6PETI6
 UBliIeVQyZomOGlASPJ3cWvHvoLROU2B9F/4azy2HBv51pMSph/eUZTdw+QGFhQmqJyM
 GFOw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUzlwUIwtMZgeph+I7E2QWwa/+121ilGa3j3xY2F6muaYSmm7/+47KepoYSMR9ehMZVGuMDx25i4OojVBS3MIBOFC116r/qmQ==
X-Gm-Message-State: AOJu0YwRJ3n+C40ExpLqGDON2RuX9R9onCxbd7xFyNU/BZRP9DsnZPUS
 5jq0k9P/EJHK0XonMfKT9WXhogqV0L8n+MU9tE4Ygp1BYL2JrR+kljE9juGhQbZJXmJRpY9UJCE
 4QPCEJw==
X-Google-Smtp-Source: AGHT+IEwMUq8GxVotFhcpAa4CBO9Zw0kQd1M9LkALazSukHthh6ymi/+GfnCY7g2Z5lxyAcbC83I+w==
X-Received: by 2002:a17:907:3f1f:b0:a7a:b385:37c8 with SMTP id
 a640c23a62f3a-a7d3ffa3fd1mr621127966b.5.1722281380518; 
 Mon, 29 Jul 2024 12:29:40 -0700 (PDT)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com.
 [209.85.218.47]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7acada29f2sm544893266b.162.2024.07.29.12.29.39
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Jul 2024 12:29:39 -0700 (PDT)
Received: by mail-ej1-f47.google.com with SMTP id
 a640c23a62f3a-a7aa212c1c9so518388166b.2
 for <buildroot@buildroot.org>; Mon, 29 Jul 2024 12:29:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUBq33cBZO106K+Yf7Mv3xKtgUntNNgmivCYTEm7CefIGGbUR9+w/JH0/o7XFeUDJh6By8ZrBAJYt+rKICKGLR3L+Aud7vLCA==
X-Received: by 2002:a17:907:3e1a:b0:a7a:8e98:8911 with SMTP id
 a640c23a62f3a-a7d400d7295mr612729166b.38.1722281379347; Mon, 29 Jul 2024
 12:29:39 -0700 (PDT)
MIME-Version: 1.0
References: <20240727202340.1484781-1-james.hilliard1@gmail.com>
 <20240729203325.3560903e@windsurf>
 <CA+h8R2rym0T+bcy3mUUSXKxwYtNH7KuTV0oUV-7PdCQdA6L5jQ@mail.gmail.com>
In-Reply-To: <CA+h8R2rym0T+bcy3mUUSXKxwYtNH7KuTV0oUV-7PdCQdA6L5jQ@mail.gmail.com>
Date: Mon, 29 Jul 2024 12:29:27 -0700
X-Gmail-Original-Message-ID: <CA+h8R2qNtFKpa7ON93Xxr3jhgGrNLaHMsaDMSBkb-MWovmuH8g@mail.gmail.com>
Message-ID: <CA+h8R2qNtFKpa7ON93Xxr3jhgGrNLaHMsaDMSBkb-MWovmuH8g@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1722281381; x=1722886181; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GQz4my156B1o7s29Y58qtluD/6m6kLNEYi2qRzRQn1Y=;
 b=ud1sbg189bWNlZ229/6E4htXCZzIfpOJwQA8DmXtRBxGGNEpUD3o+M3Zm+Ph46VUxu
 tCztkM3giAGG4siG5aKHPpj1kfNKFthYZJSVIoBmzqAzHayVuUFEFU4oB/PuwIgsQJTd
 iZGqST96K49DiK1ifTZa/WpqTJ2YUTGtwzEqhXWqJB/EO7rZHZmtvFEKt0ajRhML2fxm
 B00tvRk7snM5DlU4wuRyPXoEIIU5H60ecxVf9ZSm+OtC5rATeFihX3VCLqw0U1p22YPU
 XXwQNUVTlJ0geKK+BcS81rV2awKWkqAYNYhmgXP7vd6Oe4tXrLJU5IELPsQ59leCzjWC
 4y3w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=aperture.us
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aperture.us header.i=@aperture.us header.a=rsa-sha256
 header.s=google header.b=ud1sbg18
Subject: Re: [Buildroot] [PATCH v3 1/1] package/tailscale: new package
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@aperture.us>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Anisse Astier <anisse@astier.eu>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhvbWFzLCBKYW1lcywKCk9uIE1vbiwgSnVsIDI5LCAyMDI0IGF0IDEyOjI24oCvUE0gQ2hyaXN0
aWFuIFN0ZXdhcnQKPGNocmlzdGlhbkBhcGVydHVyZS51cz4gd3JvdGU6Cj4gPiBUaGFua3MgSmFt
ZXMgZm9yIHRoaXMgbmV3IHBhY2thZ2UuIEkgdHJpZWQgYnVpbGRpbmcgaXQsIGJ1dCBpdCBmYWls
cwo+ID4gZHVyaW5nIHRoZSBkb3dubG9hZCB3aXRoOgo+ID4KPiA+IHZlcmlmeWluZyBmeWJyaWsu
aW8vY3Jkb2NAdjAuNi4zOiBjaGVja3N1bSBtaXNtYXRjaAo+ID4gICAgICAgICBkb3dubG9hZGVk
OiBoMTpBd2krditVUnRqNUR2UHIwTExkVnJXMk5uOS9HMVk3YUdwVVBHMUlBVEU0PQo+ID4gICAg
ICAgICBnby5zdW06ICAgICBoMTpqTk5BVklOdTh1cDV2ckxhMGpyVjd6N0hTbHlIRi82bE5PckF0
clh3WWxJPQo+ID4KPiA+IENvdWxkIHlvdSBoYXZlIGEgbG9vayBpbnRvIHRoaXM/Cj4KPiBUaGlz
IHdhcyBzb2x2ZWQgYWxyZWFkeSBvbiBUYWlsc2NhbGUgbWFzdGVyIGJyYW5jaDoKPgo+IGh0dHBz
Oi8vZ2l0aHViLmNvbS90YWlsc2NhbGUvdGFpbHNjYWxlL2lzc3Vlcy8xMjg1OSNpc3N1ZWNvbW1l
bnQtMjIzOTE1NzU2Mwo+Cj4gSXQgd2FzIGZpeGVkIGluIHRoaXMgY29tbWl0Ogo+Cj4gaHR0cHM6
Ly9naXRodWIuY29tL3RhaWxzY2FsZS90YWlsc2NhbGUvY29tbWl0LzBmNTdiOTM0MGIxNDQ5ZGU4
MTFhOWRhY2QwOThhNzY5MTkyYzQzNDQKPgo+IEkgZG9uJ3Qgc2VlIGEgcmVsZWFzZSB5ZXQgd2l0
aCB0aGlzIGNvbW1pdC4gV2UgY291bGQgZWl0aGVyIHRha2UgdGhlCj4gbGF0ZXN0IG1hc3RlciBj
b21taXQgaGFzaCBmb3Igbm93IG9yIGFwcGx5IGEgcGF0Y2ggd2l0aCB0aGlzIGNvbW1pdC4KPgo+
ID4gQWxzbywgY291bGQgeW91IG1ha2Ugc3VyZSB0byBhZGQgdGhlIGVudHJ5IGluIHRoZSBERVZF
TE9QRVJTIGZpbGU/Cj4KPiBZb3UgY291bGQgYWRkIG1lIHRvIHRoYXQgbGlzdCBhcyB3ZWxsIGlm
IHlvdSBsaWtlLgoKVXBvbiBzb21lIGZ1cnRoZXIgdGVzdGluZzoKCmV4cG9ydCBHT1BST1hZPWRp
cmVjdApnaXQgY2xvbmUgaHR0cHM6Ly9naXRodWIuY29tL3RhaWxzY2FsZS90YWlsc2NhbGUKY2Qg
dGFpbHNjYWxlCmdvIG1vZCB2ZW5kb3IKCkkgbm93IHNlZToKCmdpdGh1Yi5jb20vZ28tdG9vbHNt
aXRoL3BrZ2xvYWQ6Cmd2aXNvci5kZXYvZ3Zpc29yQHYwLjAuMC0yMDI0MDMwNjIyMTUwMi1lZTFl
MWY2MDcwZTM6IGludmFsaWQgdmVyc2lvbjoKdW5rbm93biByZXZpc2lvbiBlZTFlMWY2MDcwZTMK
ClJlcG9ydGVkIGhlcmU6CgpodHRwczovL2dpdGh1Yi5jb20vdGFpbHNjYWxlL3RhaWxzY2FsZS9p
c3N1ZXMvMTI4NTkjaXNzdWVjb21tZW50LTIyNTY3MzQ0MjYKCkJlc3QgcmVnYXJkcywKQ2hyaXN0
aWFuIFN0ZXdhcnQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczov
L2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
