Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DFBAC54E90
	for <buildroot@archiver.kernel.org>; Thu, 22 May 2025 19:50:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F1B0E4188A;
	Thu, 22 May 2025 19:50:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dS73Wv3h_LLA; Thu, 22 May 2025 19:50:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2A44441806
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2A44441806;
	Thu, 22 May 2025 19:50:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 29084BC
 for <buildroot@buildroot.org>; Thu, 22 May 2025 19:50:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0F5AD4021E
 for <buildroot@buildroot.org>; Thu, 22 May 2025 19:50:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LnhPFv43KlzC for <buildroot@buildroot.org>;
 Thu, 22 May 2025 19:50:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::a33; helo=mail-vk1-xa33.google.com;
 envelope-from=petr.vorel@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 08E5A40204
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 08E5A40204
Received: from mail-vk1-xa33.google.com (mail-vk1-xa33.google.com
 [IPv6:2607:f8b0:4864:20::a33])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 08E5A40204
 for <buildroot@buildroot.org>; Thu, 22 May 2025 19:50:14 +0000 (UTC)
Received: by mail-vk1-xa33.google.com with SMTP id
 71dfb90a1353d-527b70bd90dso3064747e0c.3
 for <buildroot@buildroot.org>; Thu, 22 May 2025 12:50:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747943414; x=1748548214;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RPnEEPlUaTs96dxzZRzSHOWmt5IiEmigc7b3E7I3k80=;
 b=Va4WkxyCL2CQ2Q9WA+i2lSyMP2nBuzp1I6CCw462vXt5szlPtZYte/EVYjW+Aio9fD
 iqsraCGwkGGJhGk+y5VeSN1IyaOhxgWpr4ZVvSp2q4g7h0hCHFMrbJrn+FEYHaubgP3y
 M4vr/hFjYbHwJdOmokixwEuRTHTonE34XGywlmji1Qmhw3UAsv5h9Dgj43DcqGFVo8Gt
 b36aH2A1LLOSAlislPcbrSfmyX5skniJ/C8vD0HtyWLcpsOWPPT9oOxJpJdK4fyw6glZ
 AphW7ed9ehWP68s63XQ+AtznyoeMe9LKZ37XD8DbYnv2I9jGf8kIHZH5IRkXCghHOVh9
 YQeA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU7ORPoTfFXriDFYaUMQiaZQQff7ZgcHI8qcvN3A38ZX8X/3AkRwTk2bpneTVjvbSfwJjt41Epa4l8=@buildroot.org
X-Gm-Message-State: AOJu0Yw0RgWI33IuMuSVl2wOUaJ4SxGycNEzALfJ5F8d206mc9X8Qvdb
 z3DsecVaJHJHBjW1g8FeKH3GMWrvjLFMfI8zc1bJbAXPzFK55YC5F8E2rjypK9gVZgXreOhF9T9
 eyckcVny1X6tWKzq8mJ/HQgX0KEi6yn0=
X-Gm-Gg: ASbGnctoYWN8+PbhUbpPQ1IKTGu15MUZE8hNfd5PWpHYv+ilv2gcOWtsq+8W5lkhxfq
 Te3/dCQn5tlpTkhSdZt2y60B9v2/eJH5siW2riEu86LXbc/5QoSKV/+aGkbHktOHshsUP7eFNTe
 vCJMG/apdXZW9FZ7Lo03xZFBj3Dv4D/XMn
X-Google-Smtp-Source: AGHT+IHsocnTbJADfubQ9vrmSA3yMgqgWxC3L8dZmInZ+7WZZlMX9YlLBNLu1+1NjBP9KFEifXzD12aMbIRdIb2N9qc=
X-Received: by 2002:a05:6122:31a1:b0:52c:7abb:efee with SMTP id
 71dfb90a1353d-52f1fe8e62amr379866e0c.9.1747943413069; Thu, 22 May 2025
 12:50:13 -0700 (PDT)
MIME-Version: 1.0
References: <4a4473d3-56d6-4576-9a8f-5b708a1569df@grenoble.cnrs.fr>
 <1f3bc78a69a8ae087f6edebeba0b7017@free.fr>
 <114f7365-da97-4ce0-8cad-bde4e9264efc@grenoble.cnrs.fr>
In-Reply-To: <114f7365-da97-4ce0-8cad-bde4e9264efc@grenoble.cnrs.fr>
From: Petr Vorel <petr.vorel@gmail.com>
Date: Thu, 22 May 2025 21:50:02 +0200
X-Gm-Features: AX0GCFvsHJ80xtWuQ3oALrdACzQNCfWK7b-_hS0AQf90RuraL10Af9TS9oyb-ro
Message-ID: <CAB1t1Czy=5km3UGxeBDw6TttEWP33n2uDw87qXBbvMbySNjw_w@mail.gmail.com>
To: Edgar Bonet <bonet@grenoble.cnrs.fr>
Cc: Julien Olivain <ju.o@free.fr>,
 Buildroot development <buildroot@buildroot.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747943414; x=1748548214; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RPnEEPlUaTs96dxzZRzSHOWmt5IiEmigc7b3E7I3k80=;
 b=Ft9cAeTab500vWFnMYLzj3dVBcQyh3qbGSaVLvz4ZJ3lA7hrdU1SkE2Ybs6Ae1tAOZ
 S49aCll45NHzMtz2AKfqjS/P3pf8ATexgGynhk+cOmIjM/hIL5HLhSJYSAIP8ElylKNp
 chySig8RchuN7bSnKq3yEXeNFqq7ND7aVQGv763UIrUsI+EmtEtwx7UAeL81/L/Hj2TB
 3hEaGZA/dRUJtr7lDN4eaC1J6inLvOluFfyqZ8HCRgzG+ULSHc5QnQgoV2PDBmYZTw2u
 E2yxZni+o+DUx2EGgepmLE6tAX6svF9foAqpB7xKGMjcjU1AH4S70KW4aAxqMxMoA5TI
 jLUA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Ft9cAeTa
Subject: Re: [Buildroot] [PATCH 1/1] support/kconfig: fix another compiler
 warning
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

SGkgYWxsLAoKCk9uIFRodSwgMjIgTWF5IDIwMjUgYXQgMTg6NTAsIEVkZ2FyIEJvbmV0IDxib25l
dEBncmVub2JsZS5jbnJzLmZyPiB3cm90ZToKPgo+IEhlbGxvIEp1bGllbiEgSGVsbG8gYWxsIQo+
Cj4gT24gMjEvMDUvMjAyNSAyMjoyMiwgSnVsaWVuIE9saXZhaW4gd3JvdGU6Cj4gPiBIaSBFZGdh
ciwKPiA+Cj4gPiBUaGFuayB5b3UgZm9yIHRoZSBwYXRjaC4KPiA+Cj4gPiBPbiAxOS8wNS8yMDI1
IDExOjE1LCBFZGdhciBCb25ldCB2aWEgYnVpbGRyb290IHdyb3RlOgo+ID4+IENvbXBpbGluZyB3
aXRoIEdDQyAxMy4zIGdlbmVyYXRlcyB0aGlzOgo+ID4+Cj4gPj4gLi91dGlsLmM6IEluIGZ1bmN0
aW9uIOKAmGZpbGVfd3JpdGVfZGVw4oCZOgo+ID4+IC4vdXRpbC5jOjg2OjI2OiB3YXJuaW5nOiDi
gJglc+KAmSBkaXJlY3RpdmUgd3JpdGluZyAxMCBvciBtb3JlIGJ5dGVzIGludG8gYSByZWdpb24g
b2Ygc2l6ZSBiZXR3ZWVuIDEgYW5kIDQwOTcgWy1XZm9ybWF0LW92ZXJmbG93PV0KPiA+PiAgICA4
NiB8ICAgICAgICAgc3ByaW50ZihidWYyLCAiJXMlcyIsIGRpciwgbmFtZSk7Cj4gPj4gICAgICAg
fCAgICAgICAgICAgICAgICAgICAgICAgICAgXn4KPiA+PiAuL3V0aWwuYzo4Njo5OiBub3RlOiDi
gJhzcHJpbnRm4oCZIG91dHB1dCAxMSBvciBtb3JlIGJ5dGVzIChhc3N1bWluZyA0MTA3KSBpbnRv
IGEgZGVzdGluYXRpb24gb2Ygc2l6ZSA0MDk3Cj4gPj4gICAgODYgfCAgICAgICAgIHNwcmludGYo
YnVmMiwgIiVzJXMiLCBkaXIsIG5hbWUpOwo+ID4+ICAgICAgIHwgICAgICAgICBefn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fgo+ID4+Cj4gPj4gVGhpcyBpcyBzaW1pbGFyIHRvIHRoZSB3
YXJuaW5ncyBnZW5lcmF0ZWQgYnkgR0NDIDkuNCBhbmQgZml4ZWQgaW4KPiA+PiAzMjQ2MTJkNjhl
ICgic3VwcG9ydC9rY29uZmlnOiBmaXggY29tcGlsZXIgd2FybmluZ3MiKS4KPiA+Pgo+ID4+IEF2
b2lkIHRoZSB3YXJuaW5nIGJ5IGVubGFyZ2luZyB0aGUgZGVzdGluYXRpb24gYnVmZmVyIG9mIGZw
cmludGYoKS4KPiA+Pgo+ID4+IFNpZ25lZC1vZmYtYnk6IEVkZ2FyIEJvbmV0IDxib25ldEBncmVu
b2JsZS5jbnJzLmZyPgo+ID4+IC0tLQo+ID4+ICBzdXBwb3J0L2tjb25maWcvdXRpbC5jIHwgMiAr
LQo+ID4+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiA+
Pgo+ID4+IGRpZmYgLS1naXQgYS9zdXBwb3J0L2tjb25maWcvdXRpbC5jIGIvc3VwcG9ydC9rY29u
ZmlnL3V0aWwuYwo+ID4+IGluZGV4IDg2NjVmNWJiODkuLjg2Y2U5OTQzNjcgMTAwNjQ0Cj4gPj4g
LS0tIGEvc3VwcG9ydC9rY29uZmlnL3V0aWwuYwo+ID4+ICsrKyBiL3N1cHBvcnQva2NvbmZpZy91
dGlsLmMKPiA+PiBAQCAtMzUsNyArMzUsNyBAQCBzdHJ1Y3QgZmlsZSAqZmlsZV9sb29rdXAoY29u
c3QgY2hhciAqbmFtZSkKPiA+PiAgaW50IGZpbGVfd3JpdGVfZGVwKGNvbnN0IGNoYXIgKm5hbWUp
Cj4gPj4gIHsKPiA+PiAgICAgIGNoYXIgKnN0cjsKPiA+PiAtICAgIGNoYXIgYnVmW1BBVEhfTUFY
KzIwXSwgYnVmMltQQVRIX01BWCsxXSwgZGlyW1BBVEhfTUFYKzFdOwo+ID4+ICsgICAgY2hhciBi
dWZbUEFUSF9NQVgrMjBdLCBidWYyW1BBVEhfTUFYKzExXSwgZGlyW1BBVEhfTUFYKzFdOwo+ID4K
PiA+IEJ1aWxkcm9vdCBpcyBjdXJyZW50bHkgdXNpbmcgYSAocmF0aGVyIG9sZCkgdmVyc2lvbiBv
ZiBLY29uZmlnCj4gPiBmcm9tIEtlcm5lbCA0LjE3LXJjMi4gU2VlIFsxXS4gQnVpbGRyb290IG1h
aW50YWlucyBhIGxpc3Qgb2YKPiA+IHBhdGNoZXMgYXBwbGllZCBvbiBpdCwgaW4gWzJdLgo+Cj4g
SW5kZWVkLCBBcm5vdXQgVmFuZGVjYXBwZWxsZSBleHBsYWluZWQgbWUgdGhhdCB3aGlsZSByZXZp
ZXdpbmcgYQo+IHZlcnkgc2ltaWxhciBwYXRjaCBvZiBtaW5lLiBIb3dldmVyLCBoZSBjb25jbHVk
ZWQ6WzFdCj4KPiAgICAgSG93ZXZlciwgaW4gdGhpcyBjYXNlLCB1cHN0cmVhbSBoYXMgYWxyZWFk
eSBoZWF2aWx5IG1vZGlmaWVkIHRob3NlCj4gICAgIGZpbGVzLCBhbmQgZml4ZWQgdGhlIGlzc3Vl
cy4gU28gd2UgdGhlcmUncyBubyBuZWVkIHRvIGtlZXAgaXQgYXMKPiAgICAgcGF0Y2hlcy4KCkkn
bSBub3Qgc3VyZSBpZiBhbnlib2R5IHdpbGwgZXZlciBzcGVudCB0aW1lIHRvIHVwZGF0ZSBvdXIg
a2NvbmZpZyAod2hpY2ggd291bGQKbmVlZCB5ZXQgYW5vdGhlciBwYXRjaGVzIGFzIHRoZSBjdXJy
ZW50IHdvdWxkIG5vdCB3b3JrKSB3aGVuIHRoZSBvbGQgb25lIHdvcmtzLgoKSSB3b3VsZCBub3Qg
bWluZCB0aGF0LCBidXQgaWYgYW55Ym9keSBsYXRlciB3YW50cyB0byBkbyB0aGUgdXBkYXRlIGhl
IHdpbGwgbm90CmJlIGhhcHB5IHdpdGggb3VyIGRlY2lzaW9uLgoKS2luZCByZWdhcmRzLApQZXRy
Cgo+Cj4gQW5kIGhlIGFwcGxpZWQgdGhlIHBhdGNoLCB3aXRoIHRoaXMgbm90ZSBvbiB0aGUgY29t
bWl0IG1lc3NhZ2U6WzJdCj4KPiAgICAgTm9ybWFsbHksIHdlIHdhbnQgY2hhbmdlcyB0byBrY29u
ZmlnIHRvIGJlIHJlZmxlY3RlZCBieSBwYXRjaGVzIGluCj4gICAgIHN1cHBvcnQva2NvbmZpZy9w
YXRjaGVzLiBUaGlzIG1ha2VzIGl0IGVhc2llciB0byByZXN5bmMgd2l0aAo+ICAgICB1cHN0cmVh
bSBrY29uZmlnLiBIb3dldmVyLCBpbiB0aGlzIGNhc2UsIGV2ZXJ5dGhpbmcgdGhhdCBpcyBjaGFu
Z2VkCj4gICAgIGhlcmUgaXMgYWxyZWFkeSBjaGFuZ2VkIGNvbXBsZXRlbHkgKGFuZCBkaWZmZXJl
bnRseSkgdXBzdHJlYW0sIHNvCj4gICAgIHRoZXJlIGlzIG5vIGFkZGVkIHZhbHVlIGluIGtlZXBp
bmcgdGhlIHBhdGNoLgo+Cj4gSSBkb24ndCBrbm93IHdoZXRoZXIgdGhpcyByYXRpb25hbGUgZm9y
IG5vdCBrZWVwaW5nIHRoZSBwYXRjaCBpcyBzdGlsbAo+IHZhbGlkIHRvZGF5LiBXaGF0IGRvIHlv
dSB0aGluaz8gU2hvdWxkIEkgdXBkYXRlCj4gMTQtc3VwcG9ydC1vdXQtb2YtdHJlZS1jb25maWcu
cGF0Y2ggYW55d2F5Pwo+Cj4gUmVnYXJkcywKPgo+IEVkZ2FyLgo+Cj4gWzFdIGh0dHBzOi8vbGlz
dHMuYnVpbGRyb290Lm9yZy9waXBlcm1haWwvYnVpbGRyb290LzIwMjEtT2N0b2Jlci8zMTA1NTku
aHRtbAo+IFsyXSBodHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJvb3QvLS9j
b21taXQvMzI0NjEyZDY4ZTA5Cj4KPiA+IFNlZSBmb3IgZXhhbXBsZSwgYW5vdGhlciBjb21taXQg
YWRkaW5nIGEgcGF0Y2ggZm9yIEtjb25maWcgWzNdLgo+ID4gTm90ZSB0aGUgY29tbWl0IGlzIG1v
ZGlmeWluZyB0aGUgc291cmNlIG9mIGtjb25maWcgYW5kIGlzIGFsc28KPiA+IGFkZGluZyBhIHBh
dGNoIGlzIHRoZSBkaXJlY3RvcnkuCj4gPgo+ID4gU2luY2UgdGhlIHdhcm5pbmcgeW91IHdhbnQg
dG8gZml4IGlzIGludHJvZHVjZWQgYnkgb25lIG9mIHRoZSBCdWlsZHJvb3QKPiA+IHBhdGNoIHRv
IGJlIGFwcGxpZWQgb24gS2NvbmZpZyBpbiBbNF0sIHlvdXIgcGF0Y2ggc2hvdWxkIGFsc28KPiA+
IG1vZGlmeSBbNF0gdG8gbWFrZSBzdXJlIHlvdXIgY2hhbmdlIHdpbGwgYmUgcmViYXNlZCBvbiBm
dXR1cmUga2NvbmZpZwo+ID4gdXBkYXRlcy4KPiA+Cj4gPiBDb3VsZCB5b3Ugc2VuZCBhbiB1cGRh
dGVkIHZlcnNpb24gb2YgdGhpcyBwYXRjaCBhbHNvIHVwZGF0aW5nIHRoZQo+ID4ga2NvbmZpZyBw
YXRjaCBbM10gcGxlYXNlPwo+ID4KPiA+PiAgICAgIHN0cnVjdCBzeW1ib2wgKnN5bSwgKmVudl9z
eW07Cj4gPj4gICAgICBzdHJ1Y3QgZXhwciAqZTsKPiA+PiAgICAgIHN0cnVjdCBmaWxlICpmaWxl
Owo+ID4+IC0tCj4gPj4gMi40My4wCj4gPgo+ID4gQmVzdCByZWdhcmRzLAo+ID4KPiA+IEp1bGll
bi4KPiA+Cj4gPiBbMV0gaHR0cHM6Ly9naXRsYWIuY29tL2J1aWxkcm9vdC5vcmcvYnVpbGRyb290
Ly0vYmxvYi8yMDI1LjA1LXJjMS9zdXBwb3J0L2tjb25maWcvUkVBRE1FLmJ1aWxkcm9vdAo+ID4g
WzJdIGh0dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJvb3Qub3JnL2J1aWxkcm9vdC8tL3RyZWUvMjAy
NS4wNS1yYzEvc3VwcG9ydC9rY29uZmlnL3BhdGNoZXM/cmVmX3R5cGU9dGFncwo+ID4gWzNdIGh0
dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJvb3Qub3JnL2J1aWxkcm9vdC8tL2NvbW1pdC9kNjVjMTBj
MjBhZGQ1OGYxN2NmMWQ3YjZkZThlNzkwM2IwYWE5ZGRjCj4gPiBbNF0gaHR0cHM6Ly9naXRsYWIu
Y29tL2J1aWxkcm9vdC5vcmcvYnVpbGRyb290Ly0vYmxvYi8yMDI1LjA1LXJjMS9zdXBwb3J0L2tj
b25maWcvcGF0Y2hlcy8xNC1zdXBwb3J0LW91dC1vZi10cmVlLWNvbmZpZy5wYXRjaCNMMTc2Cj4g
PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+ID4gYnVp
bGRyb290IG1haWxpbmcgbGlzdAo+ID4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKPiA+IGh0dHBz
Oi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo+Cl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWls
aW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qu
b3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
