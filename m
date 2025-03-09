Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A47FC28B25
	for <buildroot@archiver.kernel.org>; Sun,  9 Mar 2025 12:45:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E8883606F6;
	Sun,  9 Mar 2025 12:45:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fXLX7UoqE7AR; Sun,  9 Mar 2025 12:44:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D94FB606F7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D94FB606F7;
	Sun,  9 Mar 2025 12:44:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id C88B4DC
 for <buildroot@buildroot.org>; Sun,  9 Mar 2025 12:44:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C15BD40B47
 for <buildroot@buildroot.org>; Sun,  9 Mar 2025 12:44:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id trh1xGj-6WJL for <buildroot@buildroot.org>;
 Sun,  9 Mar 2025 12:44:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::632; helo=mail-pl1-x632.google.com;
 envelope-from=kanakshilledar@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7BDD940B67
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7BDD940B67
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7BDD940B67
 for <buildroot@buildroot.org>; Sun,  9 Mar 2025 12:44:53 +0000 (UTC)
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-22400301e40so7222785ad.1
 for <buildroot@buildroot.org>; Sun, 09 Mar 2025 05:44:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741524293; x=1742129093;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vY0APlpc/Kf3xQVv7bzQz1HJriH63Js+5DoniOzZZzw=;
 b=LGqB69WMpCpd/K91zcwFM0UE9aaHCgWx1lVpsAoU8roDKMvvTb7JZ8tGFzkCyV5i8K
 CLufTF2bG3VF0LU/oP9/S6MN7xMvxM8jG+l/g4sZHBeMp/L4UzWccR+rnibIvXJq4IFM
 IZT3jcWyjZiK6Lmji/Lwb1P6dSxgvF0bQ950oWi6UZG00RMAp3DTVQsk7pyeLK7y/qtY
 XtkqDnoQ/IdaAC83s5/IeLbn+romwCJC08WhspKazMNpSaFFymEawuMYeUDRhTEtjTpS
 yoow7c/FVDWgSSJKuZrGTKP4Ati54jFyEr8KmKCQ9EPra7s+cakCS1ZBsYOewq+HQpYx
 /hLA==
X-Gm-Message-State: AOJu0YzoPej9RBzcwsSxpfqLBxZzHt+IbWAfMNxDkzXPoNIIlBRd9Cra
 +EreP1/N4RF9mOf55zHG1S9aiV9PQXs5vPq9l6UlFOm7OYss3auU2ccfwHhoqeKjehG1zYa4C2N
 nfiO0fH44W4pIz/a43tikfi1iv/k=
X-Gm-Gg: ASbGncsmeULEh5de82hHcYDBPKo7vLPEGcTmtj+bqsfHPaIvmvQzIPNeRXIFIXESVur
 d4dJmbYvvrJrlOQG1yHMbOs4LaShfH3IZm9rS2Z/at5IQvmTqgqtNcAWNSFUYe4SIgwm3Pmm8Sq
 KsmYRjP0q1rD+ljJGrxLQNdakvVo1V
X-Google-Smtp-Source: AGHT+IHa+r1AWHEIqXaMCRsrKr/KHPTv5LX8bASHTO5LYhVjxDp115w/aX3GFe69rT3qv/JStgTLczcMg89Efo0mS+I=
X-Received: by 2002:a17:903:40ce:b0:224:8bf:6d83 with SMTP id
 d9443c01a7336-22541efbc49mr33625135ad.8.1741524292331; Sun, 09 Mar 2025
 05:44:52 -0700 (PDT)
MIME-Version: 1.0
References: <20250308061245.1774235-2-kanakshilledar@gmail.com>
 <20250308061245.1774235-3-kanakshilledar@gmail.com>
 <30c8349c51ad3ecd7075e1074f3f699a@free.fr>
In-Reply-To: <30c8349c51ad3ecd7075e1074f3f699a@free.fr>
From: Kanak Shilledar <kanakshilledar@gmail.com>
Date: Sun, 9 Mar 2025 18:14:41 +0530
X-Gm-Features: AQ5f1JpZ7vjhH30lyw3_e-iD6A48nvfCWBc7WWVuaLq2FndFjnf32pihDl6rD50
Message-ID: <CAGLn_=t5xbDowAixbERSfasHK6BhBXPKgf8Rnm0Tsq8xQruR2A@mail.gmail.com>
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org, Damien Le Moal <dlemoal@kernel.org>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741524293; x=1742129093; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vY0APlpc/Kf3xQVv7bzQz1HJriH63Js+5DoniOzZZzw=;
 b=NAt4PhAjhD7+J01LQAev72gyEJZVFrsoT6n8ucwE4yOnAkZh8lXkBfASaIiY3CKHZ6
 9tvL0b9XLRKELmNrKB2pPWcT9StukYn+kuIMp6As2229ikMHFOdoHbeEkTlLZR/Dzgvs
 BYUAlHv2V84WRehGAlyGgckK/LE4s13iyfYVhD3j+2LmYkGGKEPDgXegq7DN7z5NtecF
 kf7bu9m8pBHd6t74rgQRwuKw+L1eqx1jruEdqY4+2DR3AsZDvQmEH9BHVaZF8LVWbCYO
 FqxmsBZN2BqcATljXBj4cSzqW3aZPUvFIUbKZAlipo3pyh9fjcJcIxms47WJq3i4wEs5
 lyNg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=NAt4PhAj
Subject: Re: [Buildroot] [PATCH 1/2] package/sipeed-lpi4abin: add licheepi4a
 boot bins
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

SGkgSnVsaWVuLAoKVGhhbmtzIGZvciByZXZpZXdpbmcgbXkgcGF0Y2guIEkgaGF2ZSBmb2xsb3dl
ZCB5b3VyIGNvbW1lbnRzIGFuZCBtYWRlCnRoZSBuZWNlc3NhcnkgY2hhbmdlcy4KQWRkaXRpb25h
bGx5IEkgYWRkZWQgbXlzZWxmIGludG8gdGhlIERFVkVMT1BFUlMgZmlsZSBmb3IgdGhpcyBwYWNr
YWdlCmFzIHdlbGwgKGlmIHRoYXQncyBhbHJpZ2h0KS4KU2VuZGluZyB0aGUgdjIgcGF0Y2ggc2hv
cnRseQoKVGhhbmtzIGFuZCBSZWdhcmRzLApLYW5hayBTaGlsbGVkYXIKCk9uIFN1biwgTWFyIDks
IDIwMjUgYXQgMzo1OOKAr0FNIEp1bGllbiBPbGl2YWluIDxqdS5vQGZyZWUuZnI+IHdyb3RlOgo+
Cj4gSGkgS2FuYWssCj4KPiBUaGFua3MgZm9yIHRoZSBwYXRjaCEKPgo+IEkgaGF2ZSBmZXcgY29t
bWVudHMsIHNlZSBiZWxvdy4KPgo+IE9uIDA4LzAzLzIwMjUgMDc6MTIsIEthbmFrIFNoaWxsZWRh
ciB3cm90ZToKPiA+IFNpcGVlZCBMaWNoZWVQaSA0QSByZXF1aXJlcyBzb21lIHByb3ByaWV0YXJ5
IGJpbmFyaWVzCj4gPiBmb3IgYm9vdGluZywgdGhlc2UgYXJlIHByb3ZpZGVkIGluIHRoZSB0aDE1
MjAtYm9vdC1maXJtd2FyZQo+ID4gcmVwbyBbMV0uIFRoZXNlIGJpbmFyaWVzIGFyZSBhbHNvIHJl
cXVpcmVkIGZvciB0aGUgb25ib2FyZAo+ID4gc291bmQgYW5kIHdpZmkuCj4gPgo+ID4gWzFdIGh0
dHBzOi8vZ2l0aHViLmNvbS9yZXZ5b3MvdGgxNTIwLWJvb3QtZmlybXdhcmUKPiA+Cj4gPiBTaWdu
ZWQtb2ZmLWJ5OiBLYW5hayBTaGlsbGVkYXIgPGthbmFrc2hpbGxlZGFyQGdtYWlsLmNvbT4KPiA+
IC0tLQo+ID4gIHBhY2thZ2UvQ29uZmlnLmluICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwg
IDEgKwo+ID4gIHBhY2thZ2Uvc2lwZWVkLWxwaTRhYmluL0NvbmZpZy5pbiAgICAgICAgICAgIHwg
IDUgKysrKwo+ID4gIHBhY2thZ2Uvc2lwZWVkLWxwaTRhYmluL3NpcGVlZC1scGk0YWJpbi5oYXNo
IHwgIDIgKysKPiA+ICBwYWNrYWdlL3NpcGVlZC1scGk0YWJpbi9zaXBlZWQtbHBpNGFiaW4ubWsg
ICB8IDMwICsrKysrKysrKysrKysrKysrKysrCj4gPiAgNCBmaWxlcyBjaGFuZ2VkLCAzOCBpbnNl
cnRpb25zKCspCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2Uvc2lwZWVkLWxwaTRhYmlu
L0NvbmZpZy5pbgo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL3NpcGVlZC1scGk0YWJp
bi9zaXBlZWQtbHBpNGFiaW4uaGFzaAo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL3Np
cGVlZC1scGk0YWJpbi9zaXBlZWQtbHBpNGFiaW4ubWsKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvcGFj
a2FnZS9Db25maWcuaW4gYi9wYWNrYWdlL0NvbmZpZy5pbgo+ID4gaW5kZXggNGE4MWE2MmVjNC4u
Y2U4Y2I5NWQ3ZSAxMDA2NDQKPiA+IC0tLSBhL3BhY2thZ2UvQ29uZmlnLmluCj4gPiArKysgYi9w
YWNrYWdlL0NvbmZpZy5pbgo+ID4gQEAgLTYxNiw2ICs2MTYsNyBAQCBlbmRtZW51Cj4gPiAgICAg
ICBzb3VyY2UgInBhY2thZ2Uvc2V0c2VyaWFsL0NvbmZpZy5pbiIKPiA+ICAgICAgIHNvdXJjZSAi
cGFja2FnZS9zZzNfdXRpbHMvQ29uZmlnLmluIgo+ID4gICAgICAgc291cmNlICJwYWNrYWdlL3Np
Z3Jvay1jbGkvQ29uZmlnLmluIgo+ID4gKyAgICAgc291cmNlICJwYWNrYWdlL3NpcGVlZC1scGk0
YWJpbi9Db25maWcuaW4iCj4gPiAgICAgICBzb3VyY2UgInBhY2thZ2Uvc2lzcG1jdGwvQ29uZmln
LmluIgo+ID4gICAgICAgc291cmNlICJwYWNrYWdlL3NtYXJ0bW9udG9vbHMvQ29uZmlnLmluIgo+
ID4gICAgICAgc291cmNlICJwYWNrYWdlL3Ntc3Rvb2xzMy9Db25maWcuaW4iCj4gPiBkaWZmIC0t
Z2l0IGEvcGFja2FnZS9zaXBlZWQtbHBpNGFiaW4vQ29uZmlnLmluCj4gPiBiL3BhY2thZ2Uvc2lw
ZWVkLWxwaTRhYmluL0NvbmZpZy5pbgo+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiA+IGluZGV4
IDAwMDAwMDAwMDAuLmI4ZGM5ZmJjOWUKPiA+IC0tLSAvZGV2L251bGwKPiA+ICsrKyBiL3BhY2th
Z2Uvc2lwZWVkLWxwaTRhYmluL0NvbmZpZy5pbgo+ID4gQEAgLTAsMCArMSw1IEBACj4gPiArY29u
ZmlnIEJSMl9QQUNLQUdFX1NJUEVFRF9MUEk0QUJJTgo+ID4gKyAgICAgYm9vbCAic2lwZWVkLWxw
aTRhYmluIgo+ID4gKyAgICAgZGVwZW5kcyBvbiBCUjJfcmlzY3Y9eQo+Cj4gSGVyZSwgdGhlIGNv
bmRpdGlvbiBzaG91bGQgYmUgc2ltcGxpZmllZCB0bzoKPgo+ICAgICAgICAgZGVwZW5kcyBvbiBC
UjJfcmlzY3YKPgo+ID4gKyAgICAgaGVscAo+ID4gKyAgICAgICBUaGlzIHBhY2thZ2UgcHJvdmlk
ZXMgVEgxNTIwIFNvQyBiaW5hcnkgYmxvYnMgZm9yIExpY2hlZVBpIDRBLgo+ID4gZGlmZiAtLWdp
dCBhL3BhY2thZ2Uvc2lwZWVkLWxwaTRhYmluL3NpcGVlZC1scGk0YWJpbi5oYXNoCj4gPiBiL3Bh
Y2thZ2Uvc2lwZWVkLWxwaTRhYmluL3NpcGVlZC1scGk0YWJpbi5oYXNoCj4gPiBuZXcgZmlsZSBt
b2RlIDEwMDY0NAo+ID4gaW5kZXggMDAwMDAwMDAwMC4uZjdhOGFiZGZkZAo+ID4gLS0tIC9kZXYv
bnVsbAo+ID4gKysrIGIvcGFja2FnZS9zaXBlZWQtbHBpNGFiaW4vc2lwZWVkLWxwaTRhYmluLmhh
c2gKPiA+IEBAIC0wLDAgKzEsMiBAQAo+ID4gKyMgTG9jYWxseSBjb21wdXRlZAo+ID4gK3NoYTI1
Ngo+ID4gZTViMjllMTI2NzAwOTYxN2RjZjdjZjNkMGQ1OWQ3ZGU2MmIwNmI5NmJiMTk4MWRlMzIw
NmI5YTUzMTIzNDgxZgo+ID4gc2lwZWVkLWxwaTRhYmluLW1hc3Rlci1naXQ0LnRhci5nego+ID4g
ZGlmZiAtLWdpdCBhL3BhY2thZ2Uvc2lwZWVkLWxwaTRhYmluL3NpcGVlZC1scGk0YWJpbi5tawo+
ID4gYi9wYWNrYWdlL3NpcGVlZC1scGk0YWJpbi9zaXBlZWQtbHBpNGFiaW4ubWsKPiA+IG5ldyBm
aWxlIG1vZGUgMTAwNjQ0Cj4gPiBpbmRleCAwMDAwMDAwMDAwLi5jMGFhZGVmMzVmCj4gPiAtLS0g
L2Rldi9udWxsCj4gPiArKysgYi9wYWNrYWdlL3NpcGVlZC1scGk0YWJpbi9zaXBlZWQtbHBpNGFi
aW4ubWsKPiA+IEBAIC0wLDAgKzEsMzAgQEAKPiA+ICsjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwo+
ID4gKyMKPiA+ICsjIHNpcGVlZC1scGk0YWJpbgo+ID4gKyMKPiA+ICsjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIwo+ID4gKwo+ID4gK1NJUEVFRF9MUEk0QUJJTl9WRVJTSU9OID0gbWFzdGVyCj4KPiBC
cmFuY2ggbmFtZXMgc2hvdWxkIG5vdCBiZSB1c2VkIGluIF9WRVJTSU9OLiBUaGUgZG93bmxvYWRl
ZCBkYXRhCj4gd2lsbCBiZSBjYWNoZWQgaW4gdGhlIGRvd25sb2FkIGRpcmVjdG9yeSBhbmQgd2ls
bCBub3QgYmUgdXBkYXRlZCBpZgo+IHRoZSByZW1vdGUgY2hhbmdlcy4KPgo+IElmIHlvdSB3YW50
IHRvIHVzZSB0aGUgImxhdGVzdCIgdmVyc2lvbiBhcyBvZiB0b2RheSwgZm9yIGV4YW1wbGU6Cj4g
aHR0cHM6Ly9naXRodWIuY29tL3Jldnlvcy90aDE1MjAtYm9vdC1maXJtd2FyZS9jb21taXQvNDRl
YzRlMWNjODIxNDE5NjM4NDJlYzQ1ZGIwZDE2MTdmOWYwN2U3NQo+Cj4gWW91IGNhbiB0aGVuIHNl
dDoKPiBTSVBFRURfTFBJNEFCSU5fVkVSU0lPTiA9IDQ0ZWM0ZTFjYzgyMTQxOTYzODQyZWM0NWRi
MGQxNjE3ZjlmMDdlNzUKPgo+IFlvdSdsbCBhbHNvIG5lZWQgdG8gdXBkYXRlIHRoZSBoYXNoIGZp
bGUgYWNjb3JkaW5nbHkuCj4KPiA+ICtTSVBFRURfTFBJNEFCSU5fU0lURSA9Cj4gPiBodHRwczov
L2dpdGh1Yi5jb20vcmV2eW9zL3RoMTUyMC1ib290LWZpcm13YXJlLmdpdAo+ID4gK1NJUEVFRF9M
UEk0QUJJTl9TSVRFX01FVEhPRCA9IGdpdAo+ID4gKyMgU0lQRUVEX0xQSTRBQklOX0xJQ0VOU0Ug
PSBQUk9QUklFVEFSWQo+Cj4gVGhlIF9MSUNFTlNFIHNob3VsZCBub3QgYmUgY29tbWVudGVkIGhl
cmUuIENvdWxkIHlvdSB1bmNvbW1lbnQgaXQ/Cj4KPiA+ICsjIFNJUEVFRF9MUEk0QUJJTl9MSUNF
TlNFX0ZJTEVTID0gTElDRU5TRQo+Cj4gVGhlcmUgaXMgbm8gcmVhbCBsaWNlbnNlIGZpbGUgaW4g
dGhlIHVwc3RyZWFtIHJlcG9zaXRvcnkuCj4KPiBUZWNobmljYWxseSwgdGhlcmUgaXMgdGhlICJj
b3B5cmlnaHQiIGZpbGU6Cj4gaHR0cHM6Ly9naXRodWIuY29tL3Jldnlvcy90aDE1MjAtYm9vdC1m
aXJtd2FyZS9ibG9iL21hc3Rlci9kZWJpYW4vY29weXJpZ2h0Cj4gYnV0IGl0cyBjb250ZW50IGRv
ZXMgbm90IHJlYWxseSBnaXZlIGluZm9ybWF0aW9uIG9uIHRoZSBhY3R1YWwKPiBsaWNlbnNlIHRl
cm1zLgo+Cj4gU28gdGhpcyBjb21tZW50IGxpbmUgc2hvdWxkIGJlIHJlbW92ZWQuCj4KPiA+ICtT
SVBFRURfTFBJNEFCSU5fSU5TVEFMTF9JTUFHRVMgPSBZRVMKPiA+ICtTSVBFRURfTFBJNEFCSU5f
SU5TVEFMTF9UQVJHRVQgPSBOTwo+ID4gKwo+ID4gK1NJUEVFRF9MUEk0QUJJTl9BT05fRlBHQV9G
SUxFTkFNRSA9IGFkZG9ucy9ib290L2xpZ2h0X2Fvbl9mcGdhLmJpbgo+ID4gK1NJUEVFRF9MUEk0
QUJJTl9DOTA2X0FVRElPX0ZJTEVOQU1FID0gYWRkb25zL2Jvb3QvbGlnaHRfYzkwNl9hdWRpby5i
aW4KPiA+ICtTSVBFRURfTFBJNEFCSU5fU1RSX0ZJTEVOQU1FID0gYWRkb25zL2Jvb3Qvc3RyLmJp
bgo+Cj4gU2luY2UgdGhvc2UgdmFyaWFibGVzIGFyZSBub3QgcmV1c2VkIGFueXdoZXJlIGVsc2Us
IHRoaXMgY291bGQgYmUKPiBzaW1wbGlmaWVkIGFzOgo+Cj4gU0lQRUVEX0xQSTRBQklOX0ZJTEVT
ID0gXAo+ICAgICAgICAgYWRkb25zL2Jvb3QvbGlnaHRfYW9uX2ZwZ2EuYmluIFwKPiAgICAgICAg
IGFkZG9ucy9ib290L2xpZ2h0X2M5MDZfYXVkaW8uYmluIFwKPiAgICAgICAgIGFkZG9ucy9ib290
L3N0ci5iaW4KPgo+ID4gK2RlZmluZSBTSVBFRURfTFBJNEFCSU5fSU5TVEFMTF9JTUFHRVNfQ01E
Uwo+ID4gKyAgICAgJChmb3JlYWNoIGYsIFwKPiA+ICsgICAgICAgICAgICAgJChTSVBFRURfTFBJ
NEFCSU5fQU9OX0ZQR0FfRklMRU5BTUUpIFwKPiA+ICsgICAgICAgICAgICAgJChTSVBFRURfTFBJ
NEFCSU5fQzkwNl9BVURJT19GSUxFTkFNRSkgXAo+ID4gKyAgICAgICAgICAgICAkKFNJUEVFRF9M
UEk0QUJJTl9TVFJfRklMRU5BTUUpIFwKPiA+ICsgICAgICAgICAgICAgLCBcCj4gPiArICAgICAg
ICAgICAgICQoSU5TVEFMTCkgLUQgLW0gMDY0NCAtdCAkKEJJTkFSSUVTX0RJUikvYm9vdGJpbnMg
JChARCkvJChmKQo+ID4gKyAgICAgKQo+Cj4gVGhlbiwgdGhpcyBjb3VsZCBiZSBzaW1wbGlmaWVk
IHRvOgo+Cj4gICAgICAgICAkKGZvcmVhY2ggZiwkKFNJUEVFRF9MUEk0QUJJTl9GSUxFUyksIFwK
PiAgICAgICAgICAgICAgICAgJChJTlNUQUxMKSAtRCAtbSAwNjQ0IC10ICQoQklOQVJJRVNfRElS
KS9ib290YmlucyAkKEBEKS8kKGYpCj4gICAgICAgICApCj4KPiA+ICtlbmRlZgo+ID4gKwo+ID4g
KyQoZXZhbCAkKGdlbmVyaWMtcGFja2FnZSkpCj4gPiAtLQo+ID4gMi40My4wCj4KPiBDb3VsZCB5
b3Ugc2VuZCBhbiB1cGRhdGVkIHBhdGNoIHdpdGggdGhvc2UgY2hhbmdlcyBwbGVhc2U/Cl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWls
aW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qu
b3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
