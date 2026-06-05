Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 144CDCD6E7C
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:49:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DC9C741EAB;
	Fri,  5 Jun 2026 12:49:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TAY47UsSp5c0; Fri,  5 Jun 2026 12:49:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B4EEE41E8A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663774;
	bh=IwdnZny34kl3LhUk45dXXPhVIKWjTYG4bxJZpocIRdc=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=FgYPsd8T0L3vuSMVCieh7qiZusy60A8eiPkZ+lv/MRWue866iyiitiKWlj+QfwoCw
	 fG+mtOeqWSyo75KduIeILgaJAFnmNUx6qfso0qlmOUiKFiT+8vhR2wbboXe2mq0EMY
	 Eyit1OUWa+tyFwcCh2svIHybMQFYeMKFCG3oSRBbhJC5LWJTTMBsBI9JTIEjdy7nE3
	 hui6DQ6RMPhVjZR9BHYt3wBrnVS4qPs3mtW055sZMMKGTMAFEgFR6cABEcacQJUnpp
	 itYVceDFCDE0QGr+FUgAyQaNd0N6JbD1kNkkhsckSIoncX7k84mF/HDsqZDtfCwTjx
	 asd3dsr5luy3Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B4EEE41E8A;
	Fri,  5 Jun 2026 12:49:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 82634388
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:49:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7D9F640382
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:49:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zdlQvISaGJgK for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:49:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 624DB4037E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 624DB4037E
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 624DB4037E
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:49:29 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-490acbb0f89so12644745e9.0
 for <buildroot@buildroot.org>; Fri, 05 Jun 2026 05:49:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780663767; x=1781268567;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=vZOXwYQeqB3vV+bwAuFpZCURQH4TbNmbZVrVeJlRyYk=;
 b=n3241JrdcOYWTuMJxZWWkOw1phBr2X7jph28SCFTjyYT2UTwT2wQiMztAnJY3DYCin
 EV/v37XLCalb6VyijYICWgkyR5r1XN9dxm4TZXAoEaZ8aWrfu+MSUq44F/bHZtYQa3E2
 8AlY+TlQCajP0B4LTB6Hs/f56QXJjwGRSDOm7nPVH9gWIqCj+KM/v8Y25AKk5kAhTiBr
 1+lRidHr0w0XP7Y5Pz8GA4UlyFkGaH+UYdHowq9w9dZM7V/nC2rA7xKYXldyILxxoa09
 pZ79VEwA2eGZ10SGBHxwgAigTrg/7t9wWGOVOoc/4D7GFJEZQrtGxJ9gqKWIDLEGsADs
 uPnQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ/I7tN3fQmqUyjzwHkFn9yOhCv/sVR7Po6oWnoKdWDia+dj4Cl2uS9uEnFNpqKVMS3pk4lqa1BdCeI=@buildroot.org
X-Gm-Message-State: AOJu0YwZ5TjvSF/JM7+0URn9nt6lTemgsngv+jmlUdURY8RNebAfkopf
 dASCSHBAyDEvCbMZh5QidYSbtIewKE6ay1vgYzxddQ8bBcwpZVYl8ROhHVSlesJ0Gcw=
X-Gm-Gg: Acq92OG0hE+y9ji3LboVF2HyFCFDiNmZ4OH04e4YIGVL60TiAS72kdWYHq7nYqq5o8g
 v0ClypG9eQ4dXf4wc3gbM5Y2qec9BC8zzOA1CJztQB9GAyxcGNRproUEV3HM1Hbv0UN4dkTf4FR
 /mgkIt9lIhIUlgDuSaxyj0xeGs5gsPbqrYkuCHs6bSlXQH0RRknvR60/8Lzv3eJ57smv+y34lIY
 +W1gUl7hg5crifCZmgUjeLw/JD5ZM1mbR6vMiblKNlXSIpj1H1VWG/HLmplsPoVAJ1RFsUs3/aB
 Kofr8PUzj45cPUw6hM239JXGfW7eo6D8sdt0e0ub53BxW+7bAv/Ham1mgM3Myi5Inkvrou0G0Jp
 tc3ubVrKMGUn7M/JD8lyt5aOTEVzA/AjZNzVc2NL5mVeLG59AdTSymJnaniAlZhHy5ePIAPbNnr
 U5BzTnqcAgb4A+QvTLSYlN1QSLIA==
X-Received: by 2002:a05:600c:4e55:b0:490:601f:d775 with SMTP id
 5b1f17b1804b1-490c259a232mr55418175e9.5.1780663767468; 
 Fri, 05 Jun 2026 05:49:27 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490bc3d6c65sm150376015e9.12.2026.06.05.05.49.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jun 2026 05:49:27 -0700 (PDT)
To: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  5 Jun 2026 14:49:26 +0200
Message-ID: <20260605124926.271246-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260522-openscap_nptl_threads-v2-1-cb06d4d208da@bootlin.com>
References: <20260522-openscap_nptl_threads-v2-1-cb06d4d208da@bootlin.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780663767; x=1781268567; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vZOXwYQeqB3vV+bwAuFpZCURQH4TbNmbZVrVeJlRyYk=;
 b=R5Kce47RA/vTTnhZsd/GjF7QzZwno9Yn3rLGKwAqUWK0UacIKfvMKeZUWNMjKxQNHF
 uPcD1CyPbj0v2/Zf8w32dVNzZf37/q22WoIEHEV5rn/twO3A2t1LqBRJ5UmvjuKOXM0u
 KK9Noltu1pN2OeUpjXPWiZzQTjJ7Texk90dFw8oiQTdCyr7Y+Tsly5jxdLmp5SpGH+J8
 QuhQMVNxTbuvtJk6bo/gtbjeFa9IvUNLk44QIqqdk/jCvPqrwrTf3EjEEfwwW6BejssA
 8cc/uaKSxWqGBybkH4W61URDNjLDTHV1/G3D2Z5aPkJSlsiFmRoHlsMlfbUApcpx2c0d
 kS2A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=R5Kce47R
Subject: Re: [Buildroot] [PATCH RESEND v2] package/openscap: add dependency
 on NPTL threads
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SW4gcmVwbHkgb2Y6Cj4gT3BlbnNjYXAgY29kZSBpcyBjYWxsaW5nIE5QVEwgZnVuY3Rpb25zIHN1
Y2ggYXMgcHRocmVhZF9iYXJyaWVyX3dhaXQsCj4gd2hpY2ggYXJlIG5vdCBwcm92aWRlZCBieSBw
dGhyZWFkcy4KPiAKPiBNYWtlIHRoZSByZXF1aXJlbWVudCBvbiBOUFRMIHRocmVhZHMgZXhwbGlj
aXQgYnkgYWRkaW5nIHRoZQo+IGNvcnJlc3BvbmRpbmcgIGRlcGVuZGVuY3kgaW4gb3BlbnNjYXAg
Q29uZmlnLmluLgo+IAo+IEZpeGVzOiBodHRwczovL2F1dG9idWlsZC5idWlsZHJvb3Qub3JnL3Jl
c3VsdHMvMmQ5NDc1YjdjZDJkNDEzYzk5ZDYyMzNlYmIyMTNiYzkzMmYxZTM5OC8KPiBTaWduZWQt
b2ZmLWJ5OiBBbGV4aXMgTG90aG9yw6kgPGFsZXhpcy5sb3Rob3JlQGJvb3RsaW4uY29tPgoKQXBw
bGllZCB0byAyMDI2LjAyLnguIFRoYW5rcwoKPiAtLS0KPiBDaGFuZ2VzIGluIHYyOgo+IC0gZHJv
cCBib2d1cyBwYXRjaCAxLzIsIGFzIG9yaWdpbmFsIENvbmZpZy5pbiB3YXMgZmluZQo+IC0gcmVm
b3JtYXQgbWlzc2luZyBkZXBlbmRlbmN5IGNvbW1lbnQKPiAtIExpbmsgdG8gdjE6IGh0dHBzOi8v
bG9yZS5rZXJuZWwub3JnL3IvMjAyNjAzMDQtb3BlbnNjYXBfbnB0bF90aHJlYWRzLXYxLTAtOWRm
ZjkyY2MzN2UwQGJvb3RsaW4uY29tCj4gLS0tCj4gIHBhY2thZ2Uvb3BlbnNjYXAvQ29uZmlnLmlu
IHwgNSArKystLQo+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9u
cygtKQo+IAo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL29wZW5zY2FwL0NvbmZpZy5pbiBiL3BhY2th
Z2Uvb3BlbnNjYXAvQ29uZmlnLmluCj4gaW5kZXggMzE3MDU1Yzc1MzI3Li4yNWMzODVkMTYzY2Yg
MTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9vcGVuc2NhcC9Db25maWcuaW4KPiArKysgYi9wYWNrYWdl
L29wZW5zY2FwL0NvbmZpZy5pbgo+IEBAIC0yLDYgKzIsNyBAQCBjb25maWcgQlIyX1BBQ0tBR0Vf
T1BFTlNDQVAKPiAgCWJvb2wgIm9wZW5zY2FwIgo+ICAJZGVwZW5kcyBvbiBCUjJfUEFDS0FHRV9M
SUJHUEdfRVJST1JfQVJDSF9TVVBQT1JUUyAgIyBsaWJnY3J5cHQKPiAgCWRlcGVuZHMgb24gIUJS
Ml9TVEFUSUNfTElCUyAjIGRsZmNuLmgKPiArCWRlcGVuZHMgb24gQlIyX1RPT0xDSEFJTl9IQVNf
VEhSRUFEU19OUFRMCj4gIAlzZWxlY3QgQlIyX1BBQ0tBR0VfTElCQ1VSTAo+ICAJIyBJbiB0aGVv
cnkgc2hvdWxkIGJ1aWxkIHdpdGhvdXQgY3J5cHRvLCBidXQgaW4gcHJhY3RpY2UgaXQKPiAgCSMg
ZG9lc24ndDogaHR0cHM6Ly9naXRodWIuY29tL09wZW5TQ0FQL29wZW5zY2FwL2lzc3Vlcy8yMzEw
Cj4gQEAgLTE5LDYgKzIwLDYgQEAgY29uZmlnIEJSMl9QQUNLQUdFX09QRU5TQ0FQCj4gIAkgIGh0
dHBzOi8vd3d3Lm9wZW4tc2NhcC5vcmcvCj4gIAkgIGh0dHBzOi8vZ2l0aHViLmNvbS9PcGVuU0NB
UC9vcGVuc2NhcAo+ICAKPiAtY29tbWVudCAib3BlbnNjYXAgbmVlZHMgYSB0b29sY2hhaW4gdy8g
ZHluYW1pYyBsaWJyYXJ5Igo+ICtjb21tZW50ICJvcGVuc2NhcCBuZWVkcyBhIHRvb2xjaGFpbiB3
LyBkeW5hbWljIGxpYnJhcnksIE5QVEwiCj4gIAlkZXBlbmRzIG9uIEJSMl9QQUNLQUdFX0xJQkdQ
R19FUlJPUl9BUkNIX1NVUFBPUlRTCj4gLQlkZXBlbmRzIG9uIEJSMl9TVEFUSUNfTElCUwo+ICsJ
ZGVwZW5kcyBvbiBCUjJfU1RBVElDX0xJQlMgfHwgIUJSMl9UT09MQ0hBSU5fSEFTX1RIUkVBRFNf
TlBUTAo+IAo+IC0tLQo+IGJhc2UtY29tbWl0OiAzNDZkNjY2N2ZlYmRiZWM5YTNjNTdlNDcwMDlh
YjIxZTEyMWI1YjFkCj4gY2hhbmdlLWlkOiAyMDI2MDMwNC1vcGVuc2NhcF9ucHRsX3RocmVhZHMt
NDNmYTRiZTQzNTY2Cj4gCj4gQmVzdCByZWdhcmRzLAo+IC0tIAo+IEFsZXhpcyBMb3Rob3LDqSA8
YWxleGlzLmxvdGhvcmVAYm9vdGxpbi5jb20+Cj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gYnVpbGRy
b290QGJ1aWxkcm9vdC5vcmcKPiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9idWlsZHJvb3QKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpo
dHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
