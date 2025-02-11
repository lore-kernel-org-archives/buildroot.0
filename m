Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AF75C0219B
	for <buildroot@archiver.kernel.org>; Tue, 11 Feb 2025 16:32:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2B5F7812EE;
	Tue, 11 Feb 2025 16:32:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZdYYmKGWz73m; Tue, 11 Feb 2025 16:32:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 323A8812F4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 323A8812F4;
	Tue, 11 Feb 2025 16:32:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 13B67C2
 for <buildroot@buildroot.org>; Tue, 11 Feb 2025 16:32:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0C09140253
 for <buildroot@buildroot.org>; Tue, 11 Feb 2025 16:32:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DM_dYK-pghJ5 for <buildroot@buildroot.org>;
 Tue, 11 Feb 2025 16:32:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org DA629403C8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DA629403C8
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DA629403C8
 for <buildroot@buildroot.org>; Tue, 11 Feb 2025 16:32:17 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-38dc9eba8a1so3675986f8f.1
 for <buildroot@buildroot.org>; Tue, 11 Feb 2025 08:32:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739291536; x=1739896336;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mcokaUE4juzDWxaUBNG8YPHbLBEmcouIJD9fZaBKDZY=;
 b=n4gF7IhzpTkFbmp6DecgK2a/jEVYUp2/hgZXZv4JOrbdGTaVU461bCnwwIbitPesPT
 3ZXRMjYaWz/nmoN2hkPfErAlW7kg2U8KP1bqDBTu1KosYu8m+vNaKTy8jpknO08vJg94
 dhvup/QST1GZD8WyP6MMIMd93kAAemAFPvtsSUDoHvErZwW5J03DIYw4EsaZUDeRxg56
 0EtHpJLqaferdXYB4HuaR0x4AL+8TvYhyhINPexIeTw2OH/0nQONj/jP1Df2WX4+jZCr
 g78UUfr69mc9ynXUGfLrMXEy+xczZymr6OP0mLq3/kYDTGQCChMl85+B04mTKLXCapPO
 LWHg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX50khfpTlkQPRSwSzWYGIrlh4UHoPWkt1pK/jnWIMrFRpvuDtNsT9mQ0csTAZ2d//mn2BYPI4nTbE=@buildroot.org
X-Gm-Message-State: AOJu0YxMIRDBigHGF1KzKcitbJAbP2zfX18RhdaXpDM2J1B+2RajWF3z
 32yqmTU0OKAPecc8VqTXug0pxoHySYKUEkYGoeUVyU4NHOILQThr1qdJqDxSCEA=
X-Gm-Gg: ASbGncu5Fn9NAEVrWegScub+ZGCmMqT81q7cCs56Ssw/h0aERbStPTNDbMi2eSmaRdU
 hW5w/Qbf/fzPCBFXF1Pv1c1VEXG4O8reGpZ816m0QgEmgtGlslKULrmbdzHDcPDQJMOU0AjxLkf
 eiFTfBILn4FAqrAyZ9KDGumka4d2O8Azv8ilKFjxJ3Pl1swNYntXGESIBZoJZQeNZE3Ud8uspX3
 IItRQxnYkms//qf7f0ZAN3LGLus7b3k0pcdBhZFlYJPWkfBUDaduj5rwqoLO62qyUor0caFfTwJ
 p2V3SJ9nMdmlnSRjTHTH93uyT+5S8dnsI4D7MV1ZFbswNp1ba4pBI8sD/Br1ih9Tneqh7flLfqh
 BbhG5VOgvCroPv4cVRKSRo+1vZK3sv0YWQX/wiQb/Fj+TpL9Mqbw=
X-Google-Smtp-Source: AGHT+IHQPj74JDa/2+P1/n0XN8pyP22jtFkirbwScMamHYJz0a1SAnskOXllHmFcvmLLBpfeufzYDQ==
X-Received: by 2002:a05:6000:402c:b0:385:d852:29ed with SMTP id
 ffacd0b85a97d-38dc9138a84mr12900197f8f.36.1739291535751; 
 Tue, 11 Feb 2025 08:32:15 -0800 (PST)
Received: from ?IPV6:2a01:cb05:949d:5800:e3ef:2d7a:4131:71f?
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4390d94d7d4sm219388295e9.10.2025.02.11.08.32.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Feb 2025 08:32:15 -0800 (PST)
Message-ID: <3798f1c6-b7b2-4691-91dd-65b00bee82a9@smile.fr>
Date: Tue, 11 Feb 2025 17:32:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jamie Gibbons <jamie.gibbons@microchip.com>, buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Conor Dooley <Conor.Dooley@microchip.com>,
 Valentina Fernandez Alanis <Valentina.FernandezAlanis@microchip.com>
References: <20250121090513.3375533-1-jamie.gibbons@microchip.com>
 <20250121090513.3375533-3-jamie.gibbons@microchip.com>
Content-Language: en-US
In-Reply-To: <20250121090513.3375533-3-jamie.gibbons@microchip.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1739291536; x=1739896336; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mcokaUE4juzDWxaUBNG8YPHbLBEmcouIJD9fZaBKDZY=;
 b=P8Caxd+CZ76uQPCVFdmVW0HLasbbWeFz0yTqK2mRSxpjkcInZ+gmiNVffEN24ilqaH
 NoZXsgr7NBCJYbHpELwd4BUu+p8EyStDiLVTRQmjbNL8iN0FnPC5UwSF1Kn3boIy/DhE
 Dqyv1mA/IbaVp4hsM25As58TCwm8vKQy5ApNg=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=P8Caxd+C
Subject: Re: [Buildroot] [PATCH v2 2/3] configs/beaglev_fire: add support
 for overlays and update script
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

SGVsbG8gSmFtaWUsIEFsbCwKCkxlIDIxLzAxLzIwMjUgw6AgMTA6MDUsIEphbWllIEdpYmJvbnMg
dmlhIGJ1aWxkcm9vdCBhIMOpY3JpdMKgOgo+IFdoZW4gYXBwbHlpbmcgb3ZlcmxheXMgYXQgYm9v
dCB0aW1lIGFsbCBkdGJzIG5lZWQgdG8gYmUgY29tcGlsZWQgd2l0aAo+IHRoZSBgLUBgIGZsYWcu
IFNldCB0aGUgYXBwcm9wcmlhdGUgY29uZmlnIHRvIGRvIHRoaXMuCgpJIHRoaW5rIHRoaXMgcGF0
Y2ggc2hvdWxkIGJlIGZpcnN0IGluIHRoaXMgc2VyaWVzLgoKPiBUaGUgdXBkYXRlZCB1cGRhdGUt
Z2F0ZXdhcmUgc2NyaXB0IHVzZXMgYHN0YXRgIG9uIHRoZSB0YXJnZXQgdG8gZ2V0IHRoZQo+IHNp
emUgb2YgZmlybXdhcmUgZmlsZXMsIGVuYWJsZSBjb3JldXRpbHMgYW5kIGl0J3MgZGVwZW5kZW5j
eSB0byBtYWtlIHVzZQo+IG9mIHRoaXMgcGFja2FnZSBvbiB0aGUgdGFyZ2V0ICB3aGVuIHRoaXMg
c2NyaXB0IGlzIHVzZWQuCj4gVGhlIHVwZGF0ZWQgdXBkYXRlLWdhdGV3YXJlIHNjcmlwdCBubyBs
b25nZXIgdXNlcyBgc3RhdGAgYW5kCj4gdGhlcmVmb3JlLCBjb3JldXRpbHMgaXMgbm8gbG9uZ2Vy
IG5lY2Vzc2FyeS4KCktlZXBpbmcgdGhpcyBwYXJ0IGluIHRoZSBjb21taXQgbG9nIGlzIGFjdHVh
bGx5IGNvbmZ1c2luZy4KSXQgYWN0dWFsbHkgZXhwbGFpbiB0aGUgdXBkYXRlIG9mIHRoaXMgcGF0
Y2ggYmV0d2VlbiB2MSBhbmQgdjIsIHNvIGl0IHNob3VsZCBnbwp1bmRlciAtLS0gYmVsb3cgYXMg
cGF0Y2ggY2hhbmdlIGxvZy4KCkJlc3QgcmVnYXJkcywKUm9tYWluCgoKPiAKPiBSZXZpZXdlZC1i
eTogQ29ub3IgRG9vbGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4KPiBTaWduZWQtb2Zm
LWJ5OiBKYW1pZSBHaWJib25zIDxqYW1pZS5naWJib25zQG1pY3JvY2hpcC5jb20+Cj4gLS0tCj4g
IGNvbmZpZ3MvYmVhZ2xldl9maXJlX2RlZmNvbmZpZyB8IDEgKwo+ICAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKykKPiAKPiBkaWZmIC0tZ2l0IGEvY29uZmlncy9iZWFnbGV2X2ZpcmVfZGVm
Y29uZmlnIGIvY29uZmlncy9iZWFnbGV2X2ZpcmVfZGVmY29uZmlnCj4gaW5kZXggMWQyNmE3OGYw
Ny4uYmZhYTgyMDhlOSAxMDA2NDQKPiAtLS0gYS9jb25maWdzL2JlYWdsZXZfZmlyZV9kZWZjb25m
aWcKPiArKysgYi9jb25maWdzL2JlYWdsZXZfZmlyZV9kZWZjb25maWcKPiBAQCAtMTIsNiArMTIs
NyBAQCBCUjJfTElOVVhfS0VSTkVMX0NVU1RPTV9UQVJCQUxMX0xPQ0FUSU9OPSIkKGNhbGwgZ2l0
aHViLGxpbnV4NG1pY3JvY2hpcCxsaW51eCxsaQo+ICBCUjJfTElOVVhfS0VSTkVMX0RFRkNPTkZJ
Rz0ibXBmcyIKPiAgQlIyX0xJTlVYX0tFUk5FTF9EVFNfU1VQUE9SVD15Cj4gIEJSMl9MSU5VWF9L
RVJORUxfSU5UUkVFX0RUU19OQU1FPSJtaWNyb2NoaXAvbXBmcy1iZWFnbGV2LWZpcmUiCj4gK0JS
Ml9MSU5VWF9LRVJORUxfRFRCX09WRVJMQVlfU1VQUE9SVD15Cj4gIEJSMl9QQUNLQUdFX01URD15
Cj4gIEJSMl9UQVJHRVRfUk9PVEZTX0VYVDI9eQo+ICBCUjJfVEFSR0VUX1JPT1RGU19FWFQyXzQ9
eQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRy
b290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1
aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
