Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47609D3B991
	for <buildroot@archiver.kernel.org>; Tue, 26 Nov 2024 14:17:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D25F3407D1;
	Tue, 26 Nov 2024 14:17:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BVMDngtIyaSJ; Tue, 26 Nov 2024 14:17:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A3AA9407D5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A3AA9407D5;
	Tue, 26 Nov 2024 14:17:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1F72D4961
 for <buildroot@buildroot.org>; Tue, 26 Nov 2024 14:17:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F0DB240616
 for <buildroot@buildroot.org>; Tue, 26 Nov 2024 14:17:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SpCsGLr_OM7I for <buildroot@buildroot.org>;
 Tue, 26 Nov 2024 14:17:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::62f; helo=mail-pl1-x62f.google.com;
 envelope-from=brandon.maier@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 21B82405A5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 21B82405A5
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 21B82405A5
 for <buildroot@buildroot.org>; Tue, 26 Nov 2024 14:17:42 +0000 (UTC)
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-214d1c6d724so18537445ad.3
 for <buildroot@buildroot.org>; Tue, 26 Nov 2024 06:17:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732630662; x=1733235462;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uOSwPRkL+D9VMlr0gXTMMQSuaNF0Ezf/C85Xz7oWTZI=;
 b=EyhFWyYit+l6fxHSplxcWoMyCXIfIuKWi/mbEPLKE3GqxN7/btQMra4IBhJA2Mz4HP
 PgY8GLBQKAd+Ud54shZ3cQgKNuC4oo8ZE/kl8RmBA1rCN7gGqtGvteOEPvaSnTrM2w3P
 b48Cw+nNOzN8Amhfgj2YC5ft3cFHMbybqOvMWmLMCSe0ecFES6xH0YgNlPtYQzndSdzZ
 UCziL4A/BwU/mrEAsOa3wUGksN6bIFlqpeV8XhWSSbUucC2+WyzOg+FD6zNeyWVn5azV
 NU/2R4O9XUSwuV1s/UksCof/4ru1YE7NOv6uilDiBy2KKr1ot1FtsGzjbjg+ffuRA785
 ToDw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXshQNSiSBL8QTdnHJFcIGkkw9DreSjSOMzgd71n8vufQ+CXcZBzitGPNKJEgq0s1nIWmsuqRdVASI=@buildroot.org
X-Gm-Message-State: AOJu0YzDAuYq6KZHlGRx39KBvSD7Y/InSAwI403W5Vd+x26jQPk+3BXC
 +qdLg+cDLm2qSsPtSqSRygqU2AyvHBF9Htm+EHFm5cHFVRIh5cqvVSS51Fa3CZdbou/ThNkyfv2
 s99syNzs24UWQmmyfP55lGHlk8NT+58SF
X-Gm-Gg: ASbGncuhh+cIOjd/DJWVsRSJPbK8OBWt6lZdH+V8KNDTcsRFMAybLCEUJngoL2CSC/g
 PACt7lxZEhVD5hYG/+iX0b/vKwX+pLMM=
X-Google-Smtp-Source: AGHT+IFxS7ZhcsTkBtGirgwadZgrA3axFFmaJFJat+UQj0z/Lc3xa7V4+J5Jj0P0s7/8expmZHCgefpE4b8TGMzttHs=
X-Received: by 2002:a17:902:dace:b0:211:18bc:e74b with SMTP id
 d9443c01a7336-2129f22090amr280809725ad.1.1732630661684; Tue, 26 Nov 2024
 06:17:41 -0800 (PST)
MIME-Version: 1.0
References: <20241119205901.58762-1-vjardin@free.fr>
 <CADwxmTktxHDhbw56oraJFHrNknUD+sqNvbAD8EpOEJHKs-5vDQ@mail.gmail.com>
 <q75xktmldvlans2dyvm2ssodi7bzjcpqb7yyjw6mowmb4i5yhc@em7opvmlgjgm>
In-Reply-To: <q75xktmldvlans2dyvm2ssodi7bzjcpqb7yyjw6mowmb4i5yhc@em7opvmlgjgm>
From: Brandon Maier <brandon.maier@gmail.com>
Date: Tue, 26 Nov 2024 08:17:30 -0600
Message-ID: <CADwxmTk+-1moJHWyPXsxrgN+aiG0biNCU-m86a+Rguw04SDaJg@mail.gmail.com>
To: Vincent Jardin <vjardin@free.fr>
Cc: Robin Jarry <robin@jarry.cc>, buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1732630662; x=1733235462; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uOSwPRkL+D9VMlr0gXTMMQSuaNF0Ezf/C85Xz7oWTZI=;
 b=RUHauNKmCR7Jt20HcyVOTiH97zFntV/xRfx38uA6qqB9iS5IEfk5wt3au9yseGDMEl
 QqJoRVvHhQjc1gbKhoP/2FAA5t4XiPn46d49gkhozMvObNQrsAY8Pnvh7xWpCLu01mve
 YHCJ6K0iOwykzyi6j7d2Sgj8nKXbToaw5RusVElPMEr064X3EUr9Qpzg5XR8BfsluBIv
 w+ngMRAadXCMm0dGJWei17guKrclkFya/HE+oD4IRxSWwndfKw7jC3BSgjYGrbU8229p
 bsnrol3+M4+Ms3/ev4Xfw1UD1CVx72AIMaXFCp607M7oxsnOFT/4fG/0ecLXRFdqnZIF
 WI7w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=RUHauNKm
Subject: Re: [Buildroot] [PATCH 1/1] package/pkg-meson: h files only into
 sysroot
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

SGkgVmluY2VudAoKT24gVGh1LCBOb3YgMjEsIDIwMjQgYXQgNjoyMOKAr1BNIFZpbmNlbnQgSmFy
ZGluIDx2amFyZGluQGZyZWUuZnI+IHdyb3RlOgo+Cj4gSGkgQnJhbmRvbiwKPgo+IE9uIFRodSwg
Tm92IDIxLCAyMDI0IGF0IDA3OjQ5OjE1QU0gVVRDLCBCcmFuZG9uIE1haWVyIHdyb3RlOgo+ID4g
PiAgZGVmaW5lICQoMilfSU5TVEFMTF9TVEFHSU5HX0NNRFMKPiA+ID4gICAgICAgICAkJChUQVJH
RVRfTUFLRV9FTlYpICQkKCQkKFBLRylfTklOSkFfRU5WKSBERVNURElSPSQkKFNUQUdJTkdfRElS
KSBcCj4gPiA+IC0gICAgICAgICAgICAgICAkJChOSU5KQSkgJCQoTklOSkFfT1BUUykgLUMgJCQo
JCQoUEtHKV9TUkNESVIpL2J1aWxkIGluc3RhbGwKPiA+ID4gKyAgICAgICAgICAgICAgICQkKE1F
U09OKSBpbnN0YWxsIC1DICQkKCQkKFBLRylfU1JDRElSKS9idWlsZCAtLXRhZ3M9cnVudGltZSxk
ZXZlbAo+ID4KPiA+IFBlcmhhcHMgYSBuZXcgdmFyaWFibGUgbGlrZSAkKFBLRylfTUVTT05fSU5T
VEFMTF9TVEFHSU5HX1RBR1MuCj4KPiBJIGd1ZXNzIEkgZ2V0IHlvdXIgcG9pbnQsIGp1c3QgdG8g
Y29uZmlybSBhbmQgdGhlbiBJJ2xsIHN1Ym1pdCBhbgo+IHVwZGF0ZTogZG8geW91IHN1Z2dlc3Ms
Cj4KPiAgIC0gaWYgdGhlcmUgaXMgYSAkKFBLRylfSU5TVEFMTF9TVEFHSU5HID0gWUVTCj4gICAg
ICAgYW5kCj4gICAgIGEgJChQS0cpX01FU09OX0lOU1RBTExfU1RBR0lOR19UQUdTID0gWUVTCj4g
ICAgICAgdGhlbiwgd2Ugc2hvdWxkIHVzZSB0aGUgbWVzb24ncyB0YWdzID8KClRoaXMgb25lLCBt
eSBuYW1pbmcgd2FzIGEgYml0IG9mZiB0aG91Z2guIEl0IHdvdWxkIG1ha2UgbW9yZSBzZW5zZSB0
bwpkcm9wIHRoZSAiU1RBR0lORyIgZnJvbSB0aGUgbmFtZSwgaS5lLiBgJChQS0cpX01FU09OX0lO
U1RBTExfVEFHU2AuIFNvCnRoYXQgaXQgY2FuIGFwcGx5IHRvIGJvdGggU1RBR0lORyBhbmQgVEFS
R0VULgoKVGhlbiB5b3UgZW5kIHVwIHdpdGggc29tZXRoaW5nIGxpa2UKCiAgJCgyKV9NRVNPTl9J
TlNUQUxMX1RBR1MgPz0gWUVTCiAgLi4uCiAgZGVmaW5lICQoMilfSU5TVEFMTF9TVEFHSU5HX0NN
RFMKICAgICAgICAgJCQoVEFSR0VUX01BS0VfRU5WKSAkJCgkJChQS0cpX05JTkpBX0VOVikgREVT
VERJUj0kJChTVEFHSU5HX0RJUikgXAogICAgICAgICAgICAgICAgICQkKE1FU09OKSBpbnN0YWxs
IC1DIFwKICAgICAgICAgICAgICAgICAgJCQoJCQoUEtHKV9TUkNESVIpL2J1aWxkICQoaWYgJChm
aWx0ZXIKWUVTLCQoJChQS0cpX01FU09OX0lOU1RBTExfVEFHUykpLC0tdGFncz1ydW50aW1lLGRl
dmVsKQogIGVuZGVmCgpBbmQgYSBzaW1pbGFyIGNoYW5nZSBmb3IgSU5TVEFMTF9UQVJHRVRfQ01E
UwoKPgo+IG9yCj4KPiAgIC0gaWYgdGhlcmUgaXMgYSAkKFBLRylfTUVTT05fSU5TVEFMTF9TVEFH
SU5HX1RBR1MgPSBZRVMKPiAgICAgd2hhdGV2ZXIgdGhlICQoUEtHKV9JTlNUQUxMX1NUQUdJTkcg
PSBZRVMvTk8vbm90IHNldAo+ICAgICAgIHRoZW4sIHdlIHNob3VsZCB1c2UgdGhlIG1lc29uJ3Mg
dGFncyA/Cj4KPiBJIGFtIGp1c3QgY29uY2VybmVkIGFib3V0IHR3byBjb25mbGljdGluZyBpbnRl
cnBlcnRhdGlvbnMuIEFyZSB0aGVyZSBhbnkKPiBvdGhlciBjYXNlcyBmcm9tIEJ1aWxkcm9vdCB0
aGF0IGNvdWxkIGluc3BpcmUgdG8gYXBwbHkgdGhlIHNhbWUgbG9naWMgPwoKSSBiYXNlZCBteSBz
bmlwcGV0IGFib3ZlIG9uIHBhY2thZ2UvcGtnLWtjb25maWcubWsgIl9LQ09ORklHX1NVUFBPUlRT
X0RFRkNPTkZJRyIKClNvcnJ5IGZvciB0aGUgZGVsYXllZCByZXBseSBWaW5jZW50LCB0aGFuayB5
b3UgZm9yIGxvb2tpbmcgaW50byB0aGlzIQoKLSBCcmFuZG9uCgo+Cj4gYmVzdCByZWdhcmRzLAo+
ICAgVmluY2VudApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8v
bGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
