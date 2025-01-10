Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3C39E7719A
	for <buildroot@archiver.kernel.org>; Fri, 10 Jan 2025 00:08:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 48E8C40724;
	Fri, 10 Jan 2025 00:08:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S5o5T22Nf719; Fri, 10 Jan 2025 00:08:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 175944072F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 175944072F;
	Fri, 10 Jan 2025 00:08:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3958F940
 for <buildroot@buildroot.org>; Fri, 10 Jan 2025 00:08:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 245F9403C0
 for <buildroot@buildroot.org>; Fri, 10 Jan 2025 00:08:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Wz_0pULXEUjK for <buildroot@buildroot.org>;
 Fri, 10 Jan 2025 00:08:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d30; helo=mail-io1-xd30.google.com;
 envelope-from=brandon.maier@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2FDF9400B8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2FDF9400B8
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2FDF9400B8
 for <buildroot@buildroot.org>; Fri, 10 Jan 2025 00:08:52 +0000 (UTC)
Received: by mail-io1-xd30.google.com with SMTP id
 ca18e2360f4ac-844de072603so112231339f.0
 for <buildroot@buildroot.org>; Thu, 09 Jan 2025 16:08:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736467732; x=1737072532;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=MstyncL+SSr9lmVHOUCzuwysydBrkwSLh2jEJqy7eoE=;
 b=muxiMuYS3Zqx0QBhI6uBVM+gcYWpZEbbHfsGh/AQHuA1WL4rXdqEsNGczpYgzQffjb
 ABjY9RHQBkqGnPZXiKfHaIm/hide4pebg2iH2bxvKbbvZ11RYlYpw1Gj0ZyXJknHc2jc
 NvGq2CQzn1k56i3fTfppM+Pyxlnh+Au/+7wlolPzdvLU1ppih/I3sxsMvoFZgEaYej+I
 wxP1q40eKs/66tjWCKj3qr1Nm8laYozD40YQPDZPck537DLPRHZ4WoXDdh8dfCdU9FBB
 kUpdgQE1jsVmfjbru+aE+N5dUHnZWXk8k1ImnEGqQwXgMIfgT3MqUwBuNCnrhO4Zv+gM
 ijDQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXJyzufHaHITp2mbPbqIzQrVPTAspedBH7rVd0FHTSn4VNmmiQLguU+dInedXWtv0r/R3esj6NJcpI=@buildroot.org
X-Gm-Message-State: AOJu0YzNycMTW6h3R2O8XCxR+eqf/lvOGBMUEW9K8jKNI/2F9PzsVHLn
 8y6v4J6Ho62Hf6C0W7GXyxSTXzkAuYFv90H2VpT2GyeJYQMLvf03
X-Gm-Gg: ASbGncsH3Ez1mXkcRulpVgaMfGxoP7uh6ZdGt7ZgA+8NHEt3E/IUX2sjYG9/8jX8GhA
 PKBj3bXxfid5cQZN6tPIc288OROJDdBk15pVClkMA1B7/H0hqA3SQFiD5pB6UgYjOyElKqidKe/
 PAWqKmTvNBfBb1J32U9AclOV1njYMocB7KNb2y4YICIanIazN8lwARg/VQw/6BAciPSQI1e+oRs
 I5VJBLRUUgPzxzTsOAxKLhAlgEyfaKwfyYG/Fllck8tmnocut55HCPwU5ksBHW2DGV6bxaPyvvs
 YC8bRR8zLbsjDNvg0SGlijsbpQ39EUc=
X-Google-Smtp-Source: AGHT+IHAjy/3PGcCbk1zUatjK7EQozb0GJ+KF0fnDoGxeBjnD0Jad5cDjdz/bartURCcGozcyI2bOw==
X-Received: by 2002:a05:6602:4897:b0:849:a2bb:ffdd with SMTP id
 ca18e2360f4ac-84ce007669cmr957170539f.4.1736467731892; 
 Thu, 09 Jan 2025 16:08:51 -0800 (PST)
Received: from localhost (207-191-210-45.dhcp.imoncommunications.net.
 [207.191.210.45]) by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-84d61fa3db9sm60269439f.32.2025.01.09.16.08.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Jan 2025 16:08:50 -0800 (PST)
Mime-Version: 1.0
Date: Thu, 09 Jan 2025 18:08:50 -0600
Message-Id: <D6XYFQK4270H.1G6EIYZ0AZW8R@gmail.com>
Cc: "Eric Le Bihan" <eric.le.bihan.dev@free.fr>, "Robin Jarry" <robin@jarry.cc>
From: "Brandon Maier" <brandon.maier@gmail.com>
To: "Vincent Jardin" <vjardin@free.fr>, <buildroot@buildroot.org>
X-Mailer: aerc 0.18.2
References: <D67L0SLHFKBX.2N0314A43JOJC@gmail.com>
 <20250102164630.25695-1-vjardin@free.fr>
 <20250102164630.25695-2-vjardin@free.fr>
In-Reply-To: <20250102164630.25695-2-vjardin@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736467732; x=1737072532; darn=buildroot.org;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MstyncL+SSr9lmVHOUCzuwysydBrkwSLh2jEJqy7eoE=;
 b=HFJNC1fIcstp5/g8ukaG2cQH/Sw7EopEYn6+C5DBDJmi0jba7mdt0j0z+t2qEff7tz
 S2GiioD5ul3C3f5dTM7g8SUD8NrCG0+8x/Ktea/ySmGat2vtbrWSUYOJGA1aNGWWsKa4
 K6p8bHjO0YUE62WXIc3JOhNZYlDUmxE/lUGM+AiTZsFlOSjQELxBI4TtguBVDfcyPoih
 P0s1f4b8Aw+Pmkqs2y4aPVPpyTG8/tUWnb1zMXhvIDJeXNs3/eNblwjX9z16c9sgVrAI
 hNHjsKLLcKQtIcx4N+lGaUj0CcvgsxGxj7EXM9UC0WQDw93QixGGTi6kUDOsYOyyoXyk
 iP8g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=HFJNC1fI
Subject: Re: [Buildroot] [PATCH v6 1/2] package/pkg-meson: h files only into
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

SGkgVmluY2VudCwKCk9uIFRodSBKYW4gMiwgMjAyNSBhdCAxMDo0NiBBTSBDU1QsIFZpbmNlbnQg
SmFyZGluIHdyb3RlOgo+IE1hbnkgcGFja2FnZXMgYnVpbHQgd2l0aCBCdWlsZHJvb3QgYW5kIG1l
c29uIGN1cnJlbnRseSBpbnN0YWxsIGhlYWRlcgo+IGZpbGVzIGludG8gYm90aDoKPiAgIC0gdGhl
IHRhcmdldOKAmXMgL3Vzci9pbmNsdWRlLCBhbmQKPiAgIC0gdGhlIHN5c3Jvb3TigJlzIC91c3Iv
aW5jbHVkZS4KPgo+IFdoZW4gRk9PX01FU09OX0lOU1RBTExfVEFHUyA9IFlFUywgZW5zdXJlIHRo
YXQgaGVhZGVyIGZpbGVzIGFyZQo+IGluc3RhbGxlZCBleGNsdXNpdmVseSBpbiB0aGUgc3RhZ2lu
ZyAoc3lzcm9vdCkgdGFyZ2V0IGR1cmluZyB0aGUKPiBidWlsZCBwcm9jZXNzLgo+Cj4gVGhlIGRl
ZmF1bHQgaXMgRk9PX01FU09OX0lOU1RBTExfVEFHUyA/PSBOTyBpbiBvcmRlciB0byBhdm9pZAo+
IGNoYW5naW5nIHRvIHRoaXMgbmV3IGJlaGF2aW91ciBmb3IgdGhlIHRpbWUgYmVpbmcuCj4KPiBT
aWduZWQtb2ZmLWJ5OiBWaW5jZW50IEphcmRpbiA8dmphcmRpbkBmcmVlLmZyPgo+IFN1Z2dlc3Rl
ZC1ieTogUm9iaW4gSmFycnkgPHJvYmluQGphcnJ5LmNjPgo+IFN1Z2dlc3RlZC1ieTogQnJhbmRv
biBNYWllciA8YnJhbmRvbi5tYWllckBnbWFpbC5jb20+CgpSZXZpZXdlZC1ieTogQnJhbmRvbiBN
YWllciA8YnJhbmRvbi5tYWllckBnbWFpbC5jb20+CgpUaGFua3MhCgo+IC0tLQo+ICBwYWNrYWdl
L3BrZy1tZXNvbi5tayB8IDExICsrKysrKysrLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2Vy
dGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9wa2ctbWVz
b24ubWsgYi9wYWNrYWdlL3BrZy1tZXNvbi5tawo+IGluZGV4IGJjODA1Yjc5OWMuLmMwODM3MWFh
MTAgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9wa2ctbWVzb24ubWsKPiArKysgYi9wYWNrYWdlL3Br
Zy1tZXNvbi5tawo+IEBAIC0yMjAsMTAgKzIyMCwxMyBAQCBlbmRpZgo+ICBpZm5kZWYgJCgyKV9J
TlNUQUxMX0NNRFMKPiAgZGVmaW5lICQoMilfSU5TVEFMTF9DTURTCj4gIAkkJChIT1NUX01BS0Vf
RU5WKSAkJCgkJChQS0cpX05JTkpBX0VOVikgXAo+IC0JCSQkKE5JTkpBKSAkJChOSU5KQV9PUFRT
KSAtQyAkJCgkJChQS0cpX1NSQ0RJUikvYnVpbGQgaW5zdGFsbAo+ICsJCSQkKE1FU09OKSBpbnN0
YWxsIC1DICQkKCQkKFBLRylfU1JDRElSKS9idWlsZAo+ICBlbmRlZgo+ICBlbmRpZgo+Cj4gKyMg
RGVmYXVsdCB2YWx1ZXMgZm9yIFN0YWdpbmcgaW5zdGFsbGF0aW9uIGFuZCBUYXJnZXQgaW5zdGFs
bGF0aW9uCj4gKyQoMilfTUVTT05fSU5TVEFMTF9UQUdTID89IE5PCj4gKwo+ICAjCj4gICMgU3Rh
Z2luZyBpbnN0YWxsYXRpb24gc3RlcC4gT25seSBkZWZpbmUgaXQgaWYgbm90IGFscmVhZHkgZGVm
aW5lZCBieQo+ICAjIHRoZSBwYWNrYWdlIC5tayBmaWxlLgo+IEBAIC0yMzEsNyArMjM0LDggQEAg
ZW5kaWYKPiAgaWZuZGVmICQoMilfSU5TVEFMTF9TVEFHSU5HX0NNRFMKPiAgZGVmaW5lICQoMilf
SU5TVEFMTF9TVEFHSU5HX0NNRFMKPiAgCSQkKFRBUkdFVF9NQUtFX0VOVikgJCQoJCQoUEtHKV9O
SU5KQV9FTlYpIERFU1RESVI9JCQoU1RBR0lOR19ESVIpIFwKPiAtCQkkJChOSU5KQSkgJCQoTklO
SkFfT1BUUykgLUMgJCQoJCQoUEtHKV9TUkNESVIpL2J1aWxkIGluc3RhbGwKPiArCQkkJChNRVNP
TikgaW5zdGFsbCAtQyBcCj4gKwkJICAkJCgkJChQS0cpX1NSQ0RJUikvYnVpbGQgJCQoaWYgJCQo
ZmlsdGVyIFlFUywkJCgkJChQS0cpX01FU09OX0lOU1RBTExfVEFHUykpLC0tdGFncz1ydW50aW1l
JCQoY29tbWEpZGV2ZWwpCj4gIGVuZGVmCj4gIGVuZGlmCj4KPiBAQCAtMjQyLDcgKzI0Niw4IEBA
IGVuZGlmCj4gIGlmbmRlZiAkKDIpX0lOU1RBTExfVEFSR0VUX0NNRFMKPiAgZGVmaW5lICQoMilf
SU5TVEFMTF9UQVJHRVRfQ01EUwo+ICAJJCQoVEFSR0VUX01BS0VfRU5WKSAkJCgkJChQS0cpX05J
TkpBX0VOVikgREVTVERJUj0kJChUQVJHRVRfRElSKSBcCj4gLQkJJCQoTklOSkEpICQkKE5JTkpB
X09QVFMpIC1DICQkKCQkKFBLRylfU1JDRElSKS9idWlsZCBpbnN0YWxsCj4gKwkJJCQoTUVTT04p
IGluc3RhbGwgLUMgXAo+ICsJCSAgJCQoJCQoUEtHKV9TUkNESVIpL2J1aWxkICQkKGlmICQkKGZp
bHRlciBZRVMsJCQoJCQoUEtHKV9NRVNPTl9JTlNUQUxMX1RBR1MpKSwtLXRhZ3M9cnVudGltZSkK
PiAgZW5kZWYKPiAgZW5kaWYKPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3Jn
Cmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
