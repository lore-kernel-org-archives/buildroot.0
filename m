Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48A45C48BF6
	for <buildroot@archiver.kernel.org>; Sun, 18 Feb 2024 13:55:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 129E34072B;
	Sun, 18 Feb 2024 13:55:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2KwDG-KlWIvc; Sun, 18 Feb 2024 13:55:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 197E240770
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 197E240770;
	Sun, 18 Feb 2024 13:55:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E75FB1BF31A
 for <buildroot@lists.busybox.net>; Sun, 18 Feb 2024 13:55:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E0F4A40158
 for <buildroot@lists.busybox.net>; Sun, 18 Feb 2024 13:55:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tW_XxrtY84QR for <buildroot@lists.busybox.net>;
 Sun, 18 Feb 2024 13:55:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::b33; helo=mail-yb1-xb33.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7327C400DD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7327C400DD
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com
 [IPv6:2607:f8b0:4864:20::b33])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7327C400DD
 for <buildroot@buildroot.org>; Sun, 18 Feb 2024 13:55:52 +0000 (UTC)
Received: by mail-yb1-xb33.google.com with SMTP id
 3f1490d57ef6-dcc80d6004bso3505478276.0
 for <buildroot@buildroot.org>; Sun, 18 Feb 2024 05:55:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708264551; x=1708869351;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=or/wdA1utjnmPrzrI4HMsXpimTKXVE2hSU+JKW9Aaqo=;
 b=J0ynTs5UVWVxVS1MhoE9247Zvil1+bOCBr9uzCs58aEGvRS85gbuU2Jon/Ki5HKuPa
 RAdluY/WTdytm8AwYY+yZUOsWc+hI4KBU++qMDWkjLDkW/orlmZvJfvsn7b2CBbZamj0
 Iz5wfiXv3AnJWlrBbjgeocgkaOJHb/olf7jwnvclPruPfmga/akNWt3022M4t+HkpnNg
 Z+yFsiLuWxITpH9CCuFGGqeuiDMzvR8AfsOuLVX93vGEwPVBtvTwcZVwwW4w2lsjxztT
 mBgx3In3wcA/cMLfSNUSYsPwLSPfJPCwRG1H1w6k8OekYGuhwkqxwd+Zg0jpjb8jQolC
 YWTg==
X-Gm-Message-State: AOJu0YxaS13HVWO50qJ+OXrM41aUh+VsNlCGhzh+oxAyhhegSO2jcgVL
 H0UmmqXTCNfi+P8yYvayvNU+xqr0j8c8kISGfiJOmVRXnWZMIpSAC7U6FJY3rVp7tQMlDscuyGO
 KL7scLd3FBgYNQ5qGnyfuvh1wUFFwzMcYTFrX2A==
X-Google-Smtp-Source: AGHT+IHxtizLEmC5Q48v8NQfEyGx/8L/ljUYzfD5OcATGHDo9Xd9oSQRQGKhnYr5gcDEELZYhJB9EyoqzvAgjMyLcEo=
X-Received: by 2002:a25:f61e:0:b0:dc7:4ad4:c977 with SMTP id
 t30-20020a25f61e000000b00dc74ad4c977mr8663630ybd.25.1708264551159; Sun, 18
 Feb 2024 05:55:51 -0800 (PST)
MIME-Version: 1.0
References: <20240217160244.1320482-1-dario.binacchi@amarulasolutions.com>
 <20240217160244.1320482-15-dario.binacchi@amarulasolutions.com>
 <95a8a71f608575339cd61ba5ed09b93d8714c01c.camel@gmail.com>
In-Reply-To: <95a8a71f608575339cd61ba5ed09b93d8714c01c.camel@gmail.com>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Sun, 18 Feb 2024 14:55:39 +0100
Message-ID: <CABGWkvpWxtzyrDB5o9Cp9xqmftdm1RvmjNEAvYmXMhsV++OrUA@mail.gmail.com>
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1708264551; x=1708869351;
 darn=buildroot.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=or/wdA1utjnmPrzrI4HMsXpimTKXVE2hSU+JKW9Aaqo=;
 b=A74fkihoMuLNxydkTQ+3Jy4gjkWu2RhmhRCMI7WqQ0I/SrxjZjivXwkN0kKo+ajLi+
 kGHmutdDBYlHsarJ9Z6fd6qvwYXLawhzH3mVhjgXYhlLjYNfq/gqeFtC7d6d/lLJjdHh
 hV+2odwy7Mq19PxbN8/pmBIDCBJtKWCa1sWVI=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=A74fkiho
Subject: Re: [Buildroot] [PATCH v4 14/20] boot/uboot: set BINMAN_INDIRS for
 TI K3 DM
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
Cc: michael@amarulasolutions.com, Asaf Kahlon <asafka7@gmail.com>,
 Xuanhao Shi <X15000177@gmail.com>, James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Romain Naour <romain.naour@smile.fr>, Anand Gadiyar <gadiyar@ti.com>,
 linux-amarula@amarulasolutions.com, bryce@redpinelabs.com,
 Andreas Dannenberg <dannenberg@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgQWxleGFuZGVyLAoKT24gU2F0LCBGZWIgMTcsIDIwMjQgYXQgOTo0NOKAr1BNIEFsZXhhbmRl
ciBTdmVyZGxpbgo8YWxleGFuZGVyLnN2ZXJkbGluQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBIaSBE
YXJpbywKPgo+IE9uIFNhdCwgMjAyNC0wMi0xNyBhdCAxNzowMiArMDEwMCwgRGFyaW8gQmluYWNj
aGkgd3JvdGU6Cj4gPiBBcyBleHBsYWluZWQgaW4gWzFdLCBhZGRpbmcgc3VwcG9ydCBmb3IgQU02
MnggTFAgU0sgaW4gVS1Cb290LCByZXF1aXJlcwo+ID4gYmlubWFuIGZvciBidWlsZGluZyBib290
bG9hZGVyIGltYWdlcy4gVGhlIEJJTk1BTl9JTkRJUlMgZW52aXJvbm1lbnQKPiA+IHZhcmlhYmxl
IGlzIHVzZWQgdG8gcHJvdmlkZSBhIHNwYWNlLXNlcGFyYXRlZCBsaXN0IG9mIGRpcmVjdG9yaWVz
IHRvCj4gPiBzZWFyY2ggZm9yIGJpbmFyeSBibG9icy4KPiA+Cj4gPiBbMV0gaHR0cHM6Ly9wYXRj
aHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L3Vib290L3BhdGNoLzIwMjMxMDMwMTEwMTM4LjEzNDc2
MDMtMy1uLXlhZGF2QHRpLmNvbS8KPiA+IFNpZ25lZC1vZmYtYnk6IERhcmlvIEJpbmFjY2hpIDxk
YXJpby5iaW5hY2NoaUBhbWFydWxhc29sdXRpb25zLmNvbT4KPiA+Cj4gPiAtLS0KPiA+Cj4gPiBu
byBjaGFuZ2VzIHNpbmNlIHYxOgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IERhcmlvIEJpbmFjY2hp
IDxkYXJpby5iaW5hY2NoaUBhbWFydWxhc29sdXRpb25zLmNvbT4KPiA+IC0tLQo+ID4gIGJvb3Qv
dWJvb3QvdWJvb3QubWsgfCAzICsrLQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMo
KyksIDEgZGVsZXRpb24oLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvYm9vdC91Ym9vdC91Ym9vdC5t
ayBiL2Jvb3QvdWJvb3QvdWJvb3QubWsKPiA+IGluZGV4IGRkYTYwNmE4ODA1OS4uY2Y3MGY4NmE0
MTMyIDEwMDY0NAo+ID4gLS0tIGEvYm9vdC91Ym9vdC91Ym9vdC5tawo+ID4gKysrIGIvYm9vdC91
Ym9vdC91Ym9vdC5tawo+ID4gQEAgLTE4OSw3ICsxODksOCBAQCBlbmRpZgo+ID4gIGlmZXEgKCQo
QlIyX1RBUkdFVF9VQk9PVF9ORUVEU19USV9LM19ETSkseSkKPiA+ICBVQk9PVF9USV9LM19ETV9T
T0NOQU1FID0gJChjYWxsIHFzdHJpcCwkKEJSMl9UQVJHRVRfVUJPT1RfVElfSzNfRE1fU09DTkFN
RSkpCj4gPiAgVUJPT1RfREVQRU5ERU5DSUVTICs9IHRpLWszLWJvb3QtZmlybXdhcmUKPiA+IC1V
Qk9PVF9NQUtFX09QVFMgKz0gRE09JChCSU5BUklFU19ESVIpL3RpLWRtLyQoVUJPT1RfVElfSzNf
RE1fU09DTkFNRSkvaXBjX2VjaG9fdGVzdGJfbWN1MV8wX3JlbGVhc2Vfc3RyaXAueGVyNWYKPiA+
ICtVQk9PVF9NQUtFX09QVFMgKz0gRE09JChCSU5BUklFU19ESVIpL3RpLWRtLyQoVUJPT1RfVElf
SzNfRE1fU09DTkFNRSkvaXBjX2VjaG9fdGVzdGJfbWN1MV8wX3JlbGVhc2Vfc3RyaXAueGVyNWYg
XAo+Cj4gSXMgdGhlIGFib3ZlIGFjdHVhbGx5IHN0aWxsIHJlcXVpcmVkIHdpdGggYmlubWFuPwo+
IFRoZSBuYW1lcyBhcmUgaGFyZGNvZGVkIGluIFUtQm9vdCBpbiBhcmNoL2FybS9kdHMvazMtYW02
MjUtc2stYmlubWFuLmR0c2kKCkkgd2lsbCB2ZXJpZnkgd2l0aCBzb21lIHRlc3RzLAoKVGhhbmtz
IGFuZCByZWdhcmRzCkRhcmlvCgo+Cj4gPiArICAgICBCSU5NQU5fSU5ESVJTPSQoQklOQVJJRVNf
RElSKQo+Cj4gVGhpcyBzZWVtcyB0byBiZSB0aGUgb25seSByZXF1aXJlZCBwYXJ0Lgo+Cj4gPiAg
ZW5kaWYKPiA+Cj4gPiAgaWZlcSAoJChCUjJfVEFSR0VUX1VCT09UX05FRURTX09QRU5TQkkpLHkp
Cj4KPiAtLQo+IEFsZXhhbmRlciBTdmVyZGxpbi4KPgoKCi0tIAoKRGFyaW8gQmluYWNjaGkKClNl
bmlvciBFbWJlZGRlZCBMaW51eCBEZXZlbG9wZXIKCmRhcmlvLmJpbmFjY2hpQGFtYXJ1bGFzb2x1
dGlvbnMuY29tCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCgoKQW1hcnVsYSBT
b2x1dGlvbnMgU1JMCgpWaWEgTGUgQ2FuZXZhcmUgMzAsIDMxMTAwIFRyZXZpc28sIFZlbmV0bywg
SVQKClQuICszOSAwNDIgMjQzIDUzMTAKaW5mb0BhbWFydWxhc29sdXRpb25zLmNvbQoKd3d3LmFt
YXJ1bGFzb2x1dGlvbnMuY29tCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcK
aHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
