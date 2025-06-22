Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E5BFC7115A
	for <buildroot@archiver.kernel.org>; Sun, 22 Jun 2025 14:23:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5179C60DF4;
	Sun, 22 Jun 2025 14:23:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xo-5rArPDrGK; Sun, 22 Jun 2025 14:23:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7755760C31
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7755760C31;
	Sun, 22 Jun 2025 14:23:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 90D85C8
 for <buildroot@buildroot.org>; Sun, 22 Jun 2025 14:23:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6D4B440548
 for <buildroot@buildroot.org>; Sun, 22 Jun 2025 14:23:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F8Yll8zuOGCw for <buildroot@buildroot.org>;
 Sun, 22 Jun 2025 14:23:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::130; helo=mail-il1-x130.google.com;
 envelope-from=joseph.kogut@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B034640505
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B034640505
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com
 [IPv6:2607:f8b0:4864:20::130])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B034640505
 for <buildroot@buildroot.org>; Sun, 22 Jun 2025 14:23:14 +0000 (UTC)
Received: by mail-il1-x130.google.com with SMTP id
 e9e14a558f8ab-3ddd1cf40cfso11788585ab.1
 for <buildroot@buildroot.org>; Sun, 22 Jun 2025 07:23:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750602193; x=1751206993;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FtEIRFivC6sIl6VWzXYxdOtuuKPF3r1Rz8LuGx2OSr0=;
 b=OAo40nJ6+vdZFLiXNSuM/oPCa1oImiZNz951/ScZj4R4u+ZXhws3aiZ7x5aI6bGTCL
 3TSp2O0Kterq/SBWVnQJC2yvtMaDrnQ0aSdpA6/sjm+8UcfFlzGbnwIIrLFZTfDgJEuY
 ROY5+G413MthUZ/K2J4uNp89Q6uRVu+3IP7vCp0BTCKnJnfZTZCobFskWzO+iBarUUbs
 0IkjtS5NDNpFou/atVhq0zymAsp/L58rbzc46a58lGOayUNTiMSAyg0cbVmzWAx9qQPs
 jjSr7hhGZsIFWA4FhClHayq9QrjcTM9PAdpgt8H4V9L32ID5sUKRygoKeXtigaxbC4/6
 CJ6Q==
X-Gm-Message-State: AOJu0Ywfai9T+QAAhCODrhAVXIF4Xx3QI1bqxzt3pC47XyKNUkIDlXvm
 eMr97L4SKEdEynXTR+3603iuPH7dOoPZAMHpUMtBqSvBCWuvnjjDzpfI4p1wK6Qz1iIBgwV5z9D
 q0n0djCb5IrFEwp3H325H6dDyOxlr0rgBUQ==
X-Gm-Gg: ASbGncsWztnw4Rzb8XxfbGnABVfMyuh1VmkOeDeVrm8RhnaRcit8jGjekMVbhge02xO
 QrihOch3QZFPkk5PJQqyb604Y2gnH3Lk6yCDPQKzGtQbIW33z56mPBPw18ywJT/17P65R3pduhv
 uNeoIPlSSmj6hKaYpLRF0srEZv43prrxV0chq07SmTgQQ=
X-Google-Smtp-Source: AGHT+IFvPwZKgJQQ+rnkkljluB1SjkAXqmVpZmOogekUoky8pKb4aIM6lXlucsH5Ta+2RjjS/CyNcnLhQxHZavemPo0=
X-Received: by 2002:a05:6e02:2404:b0:3dc:8746:962b with SMTP id
 e9e14a558f8ab-3de38cb0971mr105137855ab.15.1750602193570; Sun, 22 Jun 2025
 07:23:13 -0700 (PDT)
MIME-Version: 1.0
References: <20250618-virglrenderer-upstream-v1-0-57525ac8406e@gmail.com>
 <20250618-virglrenderer-upstream-v1-1-57525ac8406e@gmail.com>
 <e1e2018bf9ed6c9d061d94fa7965f254@free.fr>
In-Reply-To: <e1e2018bf9ed6c9d061d94fa7965f254@free.fr>
From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Sun, 22 Jun 2025 07:22:37 -0700
X-Gm-Features: AX0GCFsFu776KsP2MeJYREMKY1LBl4qgDr_Gs2XxMIVwvbnUKqZtOHW1ErPDpcQ
Message-ID: <CAMWSM7gXs5GbgRNcg1YF23j3zdgT34csJwKiQw6n+v=gH58d4Q@mail.gmail.com>
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org, Eric Le Bihan <eric.le.bihan.dev@free.fr>, 
 Steve deRosier <derosier@cal-sierra.com>, Bernd Kuhls <bernd@kuhls.net>, 
 James Hilliard <james.hilliard1@gmail.com>,
 Romain Naour <romain.naour@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1750602193; x=1751206993; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FtEIRFivC6sIl6VWzXYxdOtuuKPF3r1Rz8LuGx2OSr0=;
 b=gf/2igJ2ddd1QtD7ZXukEllvz/eZNKmEGKLXNn2rQLunVcj6+UOHYOkRADcR/85sFd
 vOCwctpqw0f1cRIxW7UyScp9C+33norlWrR0MKXfVGZu9HAH6dibyc7Akrd0LzkI9kO9
 yZbQq/IQa/cHPWZp5GVby1UjImwuUP3NThRRgbUW504MsWHzFuZCkbRlvYm6W4QKzuWO
 2U+EWxjxU1MYzc/Alq7y9fvML17/1ldIJ0GxsV9gXR4kYCRijVUflEzvRgyVn1lN++kY
 sVkYY/7lhZUXq+tySsG9TyXXmNPEJu53+Z7Ungp4t5IF9Ig+4BSZFeM8Wb0cICNbuexM
 F93A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=gf/2igJ2
Subject: Re: [Buildroot] [PATCH 1/3] package/python-glslang: bump to version
 15.3.0
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gSnVsaWVuLAoKVGhhbmsgeW91IGZvciB5b3VyIHRpbWUgaW4gcmV2aWV3aW5nIHRoaXMs
IHlvdXIgY2hhbmdlcyBsb29rIGNvcnJlY3QKdG8gbWUuIEknbGwga2VlcCBhbiBleWUgb24gdGhl
IGF1dG9idWlsZGVyIHJlc3VsdHMgaW4gY2FzZSBvZiBhbnkKYnVpbGQgZmFpbHVyZXMuCgpJIGxv
b2sgZm9yd2FyZCB0byBmZWVkYmFjayBvbiB0aGUgcmVzdCBvZiB0aGUgc2VyaWVzLgoKQmVzdCwK
Sm9zZXBoCgpPbiBTdW4sIEp1biAyMiwgMjAyNSBhdCAxOjIx4oCvQU0gSnVsaWVuIE9saXZhaW4g
PGp1Lm9AZnJlZS5mcj4gd3JvdGU6Cj4KPiBIaSBKb3NlcGgsCj4KPiBPbiAxOS8wNi8yMDI1IDAy
OjU5LCBKb3NlcGggS29ndXQgd3JvdGU6Cj4gPiBTZWUgY2hhbmdlbG9nCj4gPiBodHRwczovL2dp
dGh1Yi5jb20vS2hyb25vc0dyb3VwL2dsc2xhbmcvYmxvYi9tYWluL0NIQU5HRVMubWQKPiA+Cj4g
PiBGaXhlcyBidWlsZCBpc3N1ZTogZXJyb3I6IOKAmHVpbnQzMl904oCZIGhhcyBub3QgYmVlbiBk
ZWNsYXJlZCwgZW5jb3VudGVyZWQKPiA+IG9uIEdDQyB2MTUsIGNhdXNlZCBieSBjc3RkaW50IG5v
dCBiZWluZyBpbXBsaWNpdGx5IGluY2x1ZGVkLgo+ID4KPiA+IGh0dHBzOi8vYnVncy5nZW50b28u
b3JnLzkzNzI2MQo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IEpvc2VwaCBLb2d1dCA8am9zZXBoLmtv
Z3V0QGdtYWlsLmNvbT4KPgo+IEkgYXBwbGllZCB0aGlzIHBhdGNoIG9ubHkgZnJvbSB0aGlzIHNl
cmllcywgYXMgaXQgZml4ZXMKPiBhIGdjYzE1IGlzc3VlIChhbmQgdXBkYXRlcyB0aGUgcGFja2Fn
ZSkuIEknbGwgZ2l2ZSBzb21lCj4gbW9yZSB0aW1lIGZvciByZXZpZXdzIGZvciB0aGUgcWVtdSB2
aXJnbHJlbmRlcmVyIHBhdGNoZXMuCj4KPiBJIGFsc28gZGlkIGZldyBtaW5vciBjaGFuZ2VzIGZy
b20geW91IG9yaWdpbmFsIHN1Ym1pc3Npb24uIFNlZToKPiBodHRwczovL2dpdGxhYi5jb20vYnVp
bGRyb290Lm9yZy9idWlsZHJvb3QvLS9jb21taXQvNTMwNzZmMGViYTg1YzUzYmNiZWU0M2NkZDgx
YTBkNTg0YmE1YmUyMgo+Cj4gSSBoYWQgdG8gZGlzYWJsZSBnbHNsYW5nIHRlc3RzIGJlY2F1c2Ug
dGhlIGNtYWtlIHNjcmlwdCB3YXMKPiBmYWlsaW5nIHdpdGggY21ha2UgPCAzLjI2LiBPdXIgQnVp
bGRyb290IGRvY2tlciByZWZlcmVuY2UKPiBpbWFnZSBpcyB1c2luZyAzLjI1Lgo+Cj4gUGxlYXNl
LCBjb21tZW50IG9yIHNlbmQgZm9sbG93dXAgcGF0Y2hlcyBpZiBJIG1pc3NlZCBzb21ldGhpbmcu
Cj4KPiBCZXN0IHJlZ2FyZHMsCj4KPiBKdWxpZW4uCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1
aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8v
YnVpbGRyb290Cg==
