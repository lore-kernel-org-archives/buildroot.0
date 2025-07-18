Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1797AC83F17
	for <buildroot@archiver.kernel.org>; Fri, 18 Jul 2025 19:03:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BE42960A64;
	Fri, 18 Jul 2025 19:03:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w5YlJM58sc2Y; Fri, 18 Jul 2025 19:03:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E0B2560A61
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E0B2560A61;
	Fri, 18 Jul 2025 19:03:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8917A236
 for <buildroot@buildroot.org>; Fri, 18 Jul 2025 19:03:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6FB4241161
 for <buildroot@buildroot.org>; Fri, 18 Jul 2025 19:03:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BHvvtZS0C5RN for <buildroot@buildroot.org>;
 Fri, 18 Jul 2025 19:03:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12f; helo=mail-il1-x12f.google.com;
 envelope-from=joseph.kogut@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 90D7A4116A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 90D7A4116A
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com
 [IPv6:2607:f8b0:4864:20::12f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 90D7A4116A
 for <buildroot@buildroot.org>; Fri, 18 Jul 2025 19:03:44 +0000 (UTC)
Received: by mail-il1-x12f.google.com with SMTP id
 e9e14a558f8ab-3e28bf4a350so13084585ab.1
 for <buildroot@buildroot.org>; Fri, 18 Jul 2025 12:03:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752865423; x=1753470223;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GUYlNadPegCBDmDcNH6ybFRN8tBNc2hGSLr5Zvhgo84=;
 b=xUIt2qWNmDSX5FGzN78DmWdKNQXpm36odTpJg+d0XknShQviAv4BZO40noW2OKknPt
 6mEYIMOQj70N+pgNJ9iqOwHsyw7xG/kMQqx2k0Fmon47Vc9xExbmvB3duIKMyRsaq9Bv
 rIqyfJMKEv9oS2YLgtzpz4rGyCeAd81VvguW/b+AQCiLZNkGPRgHhfzulLic+ZkHUePv
 WQwGpPDlQBFezjKF4mmXR8ySD7+c1/uefX3lNwQwyTgagcSK7YRUrLKRCcw8ZQnEJGJm
 5f9kmrDORiVBwQ5CyTnq2mBuUiX3Fj70T/K4+Dz4uDw2wV//yLsTh4Fr4V+mq4SiGri6
 nEyQ==
X-Gm-Message-State: AOJu0YwpCA7Ry3gD1lbCJy4v/OcEgvO4wXiw1zK6dobZcW0RAmO/pbGu
 ty17QjnFQrjfXXXCwbutA8sQR+4zj2qopLf9D33qu5uDiIjSp0G1hPDDS/oWmOK9qgKMI+aMyfs
 bHjIDTsFlkxyJb56d7KLWJQVjNhgxGLA=
X-Gm-Gg: ASbGncs5WfEX2eOcolHKjJZb7753XW12MldgmByyKsVep88JqXw9kGoaw/cNsBcY+mh
 AxN/LmCMcSFv2QzEiqJ52GrnaZouGwmu85XsuEnFUQqe/HUp4zGf/H21PmF5xtno6s+9pV6Y9xL
 /36oFYxC1jm9m/JVNveemKKs5E7UUa1WG7SGSO59eJEayFY+yS+IWCpfladg3uVfe9TNE9mWvhc
 mLhxA==
X-Google-Smtp-Source: AGHT+IGRUpEawVpYomo8Uo5h4//heOXJQU47SqIWHHP6m1Igo+8VuvSaLOaPSMGVOg3vTZ/vGiwAyB+6Ba+s7Z5MF2U=
X-Received: by 2002:a05:6e02:1f01:b0:3dd:d995:30ec with SMTP id
 e9e14a558f8ab-3e297409f97mr40379395ab.12.1752865423324; Fri, 18 Jul 2025
 12:03:43 -0700 (PDT)
MIME-Version: 1.0
References: <20250618-virglrenderer-upstream-v1-0-57525ac8406e@gmail.com>
 <20250618-virglrenderer-upstream-v1-3-57525ac8406e@gmail.com>
 <9784ecae-1f26-427b-88d3-819ca40ff944@smile.fr>
In-Reply-To: <9784ecae-1f26-427b-88d3-819ca40ff944@smile.fr>
From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Fri, 18 Jul 2025 12:03:06 -0700
X-Gm-Features: Ac12FXwkYIFYe8807MEQMtywahvkY5yhWA-xHXMoSGheVlh_-Ohf0ZwG6CSx-PU
Message-ID: <CAMWSM7ieRB9a1_tf74HC_u22sV9vC7kb8LHDcCmvSeyYdjmvYg@mail.gmail.com>
To: Romain Naour <romain.naour@smile.fr>
Cc: buildroot@buildroot.org, Eric Le Bihan <eric.le.bihan.dev@free.fr>, 
 Steve deRosier <derosier@cal-sierra.com>, Bernd Kuhls <bernd@kuhls.net>, 
 James Hilliard <james.hilliard1@gmail.com>,
 Romain Naour <romain.naour@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752865423; x=1753470223; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GUYlNadPegCBDmDcNH6ybFRN8tBNc2hGSLr5Zvhgo84=;
 b=bsMVpVA3+YDyhjQUv0VD9lsEd0nZWi5L4lIUtk4DSL/VXL8pkKoCMCIh85fy2koQSd
 9O9LBAL7WvtXkuZAxca40GPj8yUptDywzC1af5DL3d63xpTlCbX9dGkkx1sz8xX5ycYg
 Qp7YGXJNVnqDWkvG16vDJxAf9f+O4lJcdaqS4w1WwT+5/FNG392zNhUUTjzMlnvneQqZ
 9ZOYNvMehaaJqJc42gFUxOV084bOmj2hMOw9SaUvIZLHDkJa+tpNVatFs5fWMjp79mAG
 lrhT0Pjz3ZxZH57OpDTDWgPs6Llmhj54J+Lq++bto4eW5J5mD5o6RCcRw9WM80xEXRE7
 w9KQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=bsMVpVA3
Subject: Re: [Buildroot] [PATCH 3/3] package/qemu: add virglrenderer support
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

SGVsbG8gUm9tYWluLAoKT24gU3VuLCBKdWwgNiwgMjAyNSBhdCA0OjQx4oCvQU0gUm9tYWluIE5h
b3VyIDxyb21haW4ubmFvdXJAc21pbGUuZnI+IHdyb3RlOgo+Cj4gSGVsbG8gSm9zZXBoLCBBbGws
Cj4KPiBMZSAxOS8wNi8yMDI1IMOgIDAyOjU5LCBKb3NlcGggS29ndXQgYSDDqWNyaXQgOgo+ID4g
QWRkIG9wdGlvbmFsIHZpcmdscmVuZGVyZXIgc3VwcG9ydC4KPiA+Cj4gPiBUaGlzIGZlYXR1cmUg
aXNuJ3QgdmVyeSB1c2VmdWwgd2l0aCBvcGVuZ2wgZGlzYWJsZWQsIHNvIGVuYWJsZSB0aGF0Cj4g
PiB0b28uCj4gPgo+ID4gaHR0cHM6Ly93d3cucWVtdS5vcmcvZG9jcy9tYXN0ZXIvc3lzdGVtL2Rl
dmljZXMvdmlydGlvLWdwdS5odG1sI3ZpcnRpby1ncHUtdmlyZ2xyZW5kZXJlcgo+Cj4gSXMgaG9z
dC1xZW11IHBhY2thZ2UgY291bGQgdXNlIHZpcmdscmVuZGVyZXIgKGhvc3QtdmlyZ2xyZW5kZXJl
cik/Cj4gKHByb2JhYmx5IG5vdCBkdWUgdG8gaG9zdC1tZXNhKQo+CgpJIHRoaW5rIEkgbG9va2Vk
IGludG8gdGhpcyB3aGVuIGRldmVsb3BpbmcgdGhpcyBwYXRjaCBzZXJpZXMsIGFuZAp3aGlsZSBp
dCdzIHRlY2huaWNhbGx5IGZlYXNpYmxlIChhbmQgdXNlZnVsIGZvciB0ZXN0aW5nISksIHRoZXJl
IHdlcmUKYmxvY2tlcnMuIEl0J3Mgc29tZXRoaW5nIHRoYXQgY291bGQgYmUgZXhwbG9yZWQgaW4g
bGF0ZXIgcGF0Y2hlcy4gQXMKeW91IG1lbnRpb24sIHdlJ2QgaGF2ZSB0byBoYXZlIGxpYmdsIG9u
IHRoZSBob3N0LCBsaWJlcG94eSwgbGliZWdsLApldGMuCgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6
IEpvc2VwaCBLb2d1dCA8am9zZXBoLmtvZ3V0QGdtYWlsLmNvbT4KPiA+IC0tLQo+ID4gIHBhY2th
Z2UvcWVtdS9Db25maWcuaW4gfCAxMiArKysrKysrKysrKysKPiA+ICBwYWNrYWdlL3FlbXUvcWVt
dS5tayAgIHwgIDggKysrKysrKy0KPiA+ICAyIGZpbGVzIGNoYW5nZWQsIDE5IGluc2VydGlvbnMo
KyksIDEgZGVsZXRpb24oLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9xZW11L0NvbmZp
Zy5pbiBiL3BhY2thZ2UvcWVtdS9Db25maWcuaW4KPiA+IGluZGV4IDJkMTVhYjFlYTljNzg4OTkz
OWUzZmE0YzUzMmYzNDAzYzI2ZWRhZWQuLjMzNGYxZGNmNWY2OGEyYjNjNWU3MmI0ZTY3ZTY4Zjk0
YWM2NjVlMzMgMTAwNjQ0Cj4gPiAtLS0gYS9wYWNrYWdlL3FlbXUvQ29uZmlnLmluCj4gPiArKysg
Yi9wYWNrYWdlL3FlbXUvQ29uZmlnLmluCj4gPiBAQCAtMTAwLDYgKzEwMCwxOCBAQCBjb25maWcg
QlIyX1BBQ0tBR0VfUUVNVV9TREwKPiA+ICAgICAgICAgU2F5ICd5JyB0byBlbmFibGUgdGhlIFNE
TCBmcm9udGVuZCwgdGhhdCBpcywgYSBncmFwaGljYWwKPiA+ICAgICAgICAgd2luZG93IHByZXNl
bnRpbmcgdGhlIFZNJ3MgZGlzcGxheS4KPiA+Cj4gPiArY29tbWVudCAiT3BlbkdMIGFuZCB2aXJn
bHJlbmRlcmVyIG5lZWQgYW4gT3BlbkdMIGFuZC9vciBPcGVuR0wgRUdMIGJhY2tlbmQiCj4gPiAr
ICAgICBkZXBlbmRzIG9uICEoQlIyX1BBQ0tBR0VfSEFTX0xJQkVHTCB8fCBCUjJfUEFDS0FHRV9I
QVNMSUJHTCkKPgo+IHMvQlIyX1BBQ0tBR0VfSEFTTElCR0wvQlIyX1BBQ0tBR0VfSEFTX0xJQkdM
Lwo+CgpUaGFua3MsIEknbGwgZml4IHRoaXMuCgo+ID4gKwo+ID4gK2NvbmZpZyBCUjJfUEFDS0FH
RV9RRU1VX1ZJUkdMUkVOREVSRVIKPiA+ICsgICAgIGJvb2wgIkVuYWJsZSB2aXJnbHJlbmRlcmVy
Igo+ID4gKyAgICAgZGVwZW5kcyBvbiBCUjJfUEFDS0FHRV9IQVNfTElCRUdMIHx8IEJSMl9QQUNL
QUdFX0hBU19MSUJHTCAjIHZpcmdscmVuZGVyZXIKPiA+ICsgICAgIHNlbGVjdCBCUjJfUEFDS0FH
RV9WSVJHTFJFTkRFUkVSCj4gPiArICAgICBoZWxwCj4gPiArICAgICAgIFNheSAneScgdG8gZW5h
YmxlIHZpcmdscmVuZGVyZXIsIGVuYWJsaW5nIEdMIGFuZAo+ID4gKyAgICAgICBWdWxrYW4gcGFz
c3Rocm91Z2ggZnJvbSB0aGUgaG9zdCB0byB0aGUgZ3Vlc3QKPiA+ICsgICAgICAgdGhyb3VnaCB2
aXJ0aW8tZ3B1Lgo+ID4gKwo+ID4gIGNvbmZpZyBCUjJfUEFDS0FHRV9RRU1VX0ZEVAo+ID4gICAg
ICAgYm9vbCAiRW5hYmxlIEZEVCIKPiA+ICAgICAgIHNlbGVjdCBCUjJfUEFDS0FHRV9EVEMKPiA+
IGRpZmYgLS1naXQgYS9wYWNrYWdlL3FlbXUvcWVtdS5tayBiL3BhY2thZ2UvcWVtdS9xZW11Lm1r
Cj4gPiBpbmRleCBmZGM4NTkxZTU0NmFiNmI5NmZkYjAyYjM3NDJiNzVmNTg3YmUyMzlmLi40MjIx
ZTAyN2MwNzkyNGY2ODEzNTkxNzk2OTI3NDM0MjBmZmFhMzhlIDEwMDY0NAo+ID4gLS0tIGEvcGFj
a2FnZS9xZW11L3FlbXUubWsKPiA+ICsrKyBiL3BhY2thZ2UvcWVtdS9xZW11Lm1rCj4gPiBAQCAt
MjYxLDYgKzI2MSwxMyBAQCBlbHNlCj4gPiAgUUVNVV9PUFRTICs9IC0tZGlzYWJsZS11c2ItcmVk
aXIKPiA+ICBlbmRpZgo+ID4KPiA+ICtpZmVxICgkKEJSMl9QQUNLQUdFX1FFTVVfVklSR0xSRU5E
RVJFUikseSkKPiA+ICtRRU1VX09QVFMgKz0gLS1lbmFibGUtdmlyZ2xyZW5kZXJlciAtLWVuYWJs
ZS1vcGVuZ2wKPgo+IEknbSB3b25kZXJpbmcgKEkgd291bGQgcHJlZmVyKSBpZiB3ZSBuZWVkIGEg
c2VwYXJhdGUgb3B0aW9uIHRvIGVuYWJsZSBvcGVuZ2wKPiBzdXBwb3J0IGluIFFlbXUuCj4KCkkg
dGhpbmsgdGhpcyBtYWtlcyBzZW5zZS4gVGhlIHZpcmdscmVuZGVyZXIgY29uZmlnIGNvdWxkIGp1
c3Qgc2VsZWN0IHRoaXMuCgpCZXN0LApKb3NlcGgKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVp
bGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9i
dWlsZHJvb3QK
