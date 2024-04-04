Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE444CD1284
	for <buildroot@archiver.kernel.org>; Thu,  4 Apr 2024 13:06:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 85D6A4191B;
	Thu,  4 Apr 2024 13:06:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 18Z1PQRi4MB8; Thu,  4 Apr 2024 13:06:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 04B4B418F2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 04B4B418F2;
	Thu,  4 Apr 2024 13:06:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2431E1BF41F
 for <buildroot@lists.busybox.net>; Thu,  4 Apr 2024 13:06:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C16EB418F2
 for <buildroot@lists.busybox.net>; Thu,  4 Apr 2024 13:06:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DdGkZ2yAMwlE for <buildroot@lists.busybox.net>;
 Thu,  4 Apr 2024 13:06:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::232; helo=mail-lj1-x232.google.com;
 envelope-from=heiko.thiery@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 257C741908
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 257C741908
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 257C741908
 for <buildroot@buildroot.org>; Thu,  4 Apr 2024 13:06:14 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2d80baf621eso10025781fa.1
 for <buildroot@buildroot.org>; Thu, 04 Apr 2024 06:06:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712235973; x=1712840773;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uI+OudvzYreVaImlHHcRr+D/db1DRf00ubFxHlj5igg=;
 b=AyzMkxmW1ix1Y/JLYAYPRNqNbRMWHrwbC50QK9U/jY6VonHp/GPxsk1yxex67w+Fxz
 ceR5EXj2rm2+IUC+k6ZWmLNydbL5EClLETzC+nQ0vccVPOq1r7kMNG051EL1jKH81M22
 Mwupr25ybMADTTuAAG/X9M9OmonY7TNyVylKmwABs3q0+Ow0DNaUrts8hqHqAP9qvikr
 BtipwCU+XuDDKzAoK96H7Tzrk4DS0fsIVTH9TlaEsvdbTnPJaS3otU5syt8GlRKlqt2T
 HyYH430GJATdrxaC/QbQBWg7sT8Af7iW5Yx1LuZZFc7oTkGDSs17LNUGU+6TIC8LPgeS
 EiMg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWpAL3cVVNaf0TsegqfWxunRsZhCL8AuqtObg3ipRZwuYuE6POxlqniWJaR7RczNEXxQud5QeUsBMWz1iXndV8Tk99Rhq560A==
X-Gm-Message-State: AOJu0YzvWhpU0sdy9/1tLvKBSxSvDCI0GxWewnbZMPYQosjyM766AeIU
 my9cv3fCRaOY2tZVVyrX5dslF9HFw9b6FSIroMQo+9j6I7LsuSvKjhg67DHGIkfdeATY5pdu6Nk
 N8mmBYPYuJM9g86j5Y4z1/TDERmdXnPomE/w=
X-Google-Smtp-Source: AGHT+IEs3RUlCXvBz78JHkCRMK3ihPSne2d7q9ZMb6RYvmtmPd7dHn667W3QI6O4ymM6zOGFvAuANUmIHKzQ3oY8iKE=
X-Received: by 2002:a05:651c:235:b0:2d8:3dc7:e302 with SMTP id
 z21-20020a05651c023500b002d83dc7e302mr1615598ljn.2.1712235972527; Thu, 04 Apr
 2024 06:06:12 -0700 (PDT)
MIME-Version: 1.0
References: <20240403195403.1359007-1-romain.naour@smile.fr>
 <CAEyMn7YZB0q1p56F4ECOemAEbJReDUDLUuKBQyp6H016gCL7Fg@mail.gmail.com>
 <edac4a6e-c07a-48ce-9f9a-13928f8c898a@smile.fr>
 <D0BAEFA95U59.21GTZHTZRDS1A@walle.cc>
 <CAEyMn7Yoowh--mcB6Qn8rsGh+5AZphqmc-QNcp8oFJnb6g+HNg@mail.gmail.com>
 <161774c5-0326-4baf-921a-7332c677f9fc@smile.fr>
In-Reply-To: <161774c5-0326-4baf-921a-7332c677f9fc@smile.fr>
From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Thu, 4 Apr 2024 15:06:00 +0200
Message-ID: <CAEyMn7ZybRdwOkZmgrtYSEQdvv=6p=UCRAGkHUrkr4bVMHMW_g@mail.gmail.com>
To: Romain Naour <romain.naour@smile.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712235973; x=1712840773; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uI+OudvzYreVaImlHHcRr+D/db1DRf00ubFxHlj5igg=;
 b=X4LbNhSXIqIMKMoefncq0hfBJ8rYV3ftx8AnVDVK9jh8G+Sj87vm1/usSOXTVZQrBV
 souDhg+3Egf4Sq3ErXJzbEpzAMEeRmHv48kpzZF8V/NjlVax1g/A5fSMoVV1V4GFHgVm
 RCif6BXdUiM6TVvT8Z9O7b+F1KG8rhY6T13UHJzmr3iYDYwq4lgSH2preEomOrNFGC/e
 7R1dN9QSf40xt4MgGBKDXZQCupiMyFoI1LVSaj/5ck12G6ZeuNtYKNduE2AbLJ0oavSD
 wLtqsgaUbjxGIsUTO4rGU7DQ8BpYKDmEIzNvJjoUMHngF25hLFnOvDiSTwpjWrdGTQNR
 QGSg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=X4LbNhSX
Subject: Re: [Buildroot] [PATCH v11 00/17] Add support for AM62x-SK HS-FS
 devices
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
Cc: Michael Walle <michael@walle.cc>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGksCgpBbSBEby4sIDQuIEFwci4gMjAyNCB1bSAxNDoxNCBVaHIgc2NocmllYiBSb21haW4gTmFv
dXIgPHJvbWFpbi5uYW91ckBzbWlsZS5mcj46Cj4KPiBIZWxsbyBIZWlrbywgTWljaGFlbCwgQWxs
LAo+Cj4gTGUgMDQvMDQvMjAyNCDDoCAxMzo0NiwgSGVpa28gVGhpZXJ5IGEgw6ljcml0IDoKPiA+
IEhpLAo+ID4KPiA+IEFtIERvLiwgNC4gQXByLiAyMDI0IHVtIDEzOjA0IFVociBzY2hyaWViIE1p
Y2hhZWwgV2FsbGUgPG1pY2hhZWxAd2FsbGUuY2M+Ogo+ID4+Cj4gPj4gSGkgUm9tYWluLAo+ID4+
Cj4gPj4gdGhhbmtzIGZvciB3b3JraW5nIG9uIHRoZSBzZXJpZXMhCj4gPj4KPiA+Pj4+IEkga25v
dyB0aGVyZSBhcmUgc29tZSBkaXNjdXNzaW9ucyBvbmdvaW5nIGFib3V0IHRoZSBoYW5kbGluZyBv
ZiB0aGUKPiA+Pj4+IEJSMl9QQUNLQUdFX1RJX0szX1NFQ1RZUEVfWCBhbmQgQlIyX1BBQ0tBR0Vf
VElfSzNfU09DX1guIEkgc2VlIHRoYXQKPiA+Pj4+IHRoZXNlIHZhcmlhYmxlcyBhcmUgb25seSB1
c2VkIGZvciBzZWxlY3RpbmcgdGhlIHJpZ2h0IHZhbHVlIGZvcgo+ID4+Pj4gQlIyX1RBUkdFVF9U
SV9LM19SNV9MT0FERVJfVElCT09UM19CSU4uICBTaW5jZSB3ZSBjYW4gc2V0IHRoaXMgdmFsdWUK
PiA+Pj4+IGRpcmVjdGx5IGZvciBlYWNoIGRlZmNvbmZpZyBJIHRoaW5rIHdlIGNhbiBnZXQgcmlk
IG9mIGFsbCB0aGlzIHN0dWZmLgo+ID4+Pj4gTmV2ZXJ0aGVsZXNzIHRoZXJlIGlzIGEgcHJvYmxl
bSB3aXRoIHRoZQo+ID4+Pj4gQlIyX1RBUkdFVF9USV9LM19SNV9MT0FERVJfVElCT09UM19CSU4g
c2luY2UgaXQgaXMgbm90IHBvc3NpYmxlIHRvCj4gPj4+PiBzZWxlY3QgYSB2YWx1ZSBpbiBtZW51
Y29uZmlnIGJlY2F1c2Ugb2YgdGhlIG1pc3NpbmcgaGVscCB0ZXh0Lgo+ID4+Pgo+ID4+PiBJdCBz
ZWVtcyBlYXNpZXIgdG8gc2VsZWN0IHRoZSBTb0MgdmFyaWFudCBhbmQgdGhlIFNlY3R5cGUgdXNp
bmcgdHdvIGJvb2xlYW4gdGhhbgo+ID4+PiBsZXR0aW5nIHRoZSB1c2VyIHRvIHByb3ZpZGUgdGhl
IHJpZ2h0IGZpbGUgbmFtZSBpbgo+ID4+PiBCUjJfVEFSR0VUX1RJX0szX1I1X0xPQURFUl9USUJP
T1QzX0JJTiBmcm9tIHRoZSBkZWZjb25maWcuCj4gPj4KPiA+PiBEb2Vzbid0IHNlZW0gZWFzaWVy
IHRvIG1lIHRvIHVwZGF0ZSB0aGUgcGFja2FnZSBlYWNoIHRpbWUgYSBuZXcgU29DCj4gPj4gaXMg
aW50cm9kdWNlZC4gQmVzaWRlcy4uCj4gPj4KPiA+Pj4gSXMgYSB1c2UgY2FzZSB3aGVyZSB0aGUg
d2UgbXVzdCB1c2UgYSBjdXN0b20gdGlib290MyouYmluIG5hbWUgPwo+ID4+Cj4gPj4gLi55b3Ug
YXJlIGxpdGVyYWxseSBlbmNvZGluZyB0aGUgYm9hcmQgbmFtZSAiLWV2bSIgb2YgdGhlIFRJIEVW
TQo+ID4+IGludG8gdGhhdCBuYW1lLiBTbyBpdCBpcyB1bnVzYWJsZSBmb3IgYW55IG90aGVyIGJv
YXJkLiBFLmcuICB0aGVyZQo+ID4+IGlzIGFscmVhZHkgdGhpcyBib2FyZCB1cHN0cmVhbToKPiA+
PiBodHRwczovL2VsaXhpci5ib290bGluLmNvbS91LWJvb3QvdjIwMjQuMDQvc291cmNlL2FyY2gv
YXJtL2R0cy9rMy1hbTYyNS1waHljb3JlLXNvbS1iaW5tYW4uZHRzaSNMMTQKPiA+Pgo+ID4+IEFz
IEkgc2FpZCwgdGhhdCBmaWxlbmFtZSBpcyBqdXN0IGEgZnJlZSBmb3JtIHR5cGUgb2YgZmlsZW5h
bWUgYW5kCj4gPj4gdGhlIGR0c2kgYXV0aG9yIGlzIGZyZWUgdG8gY2hvb3NlIGl0cyBuYW1pbmcu
Cj4gPj4KPiA+PiBJTUhPIHdpdGggdGhlIHJlbW92YWwgb2YgdGhlIGltYWdlIGdlbiBwYWNrYWdl
LCB0aGVyZSBpcyBubyBuZWVkCj4gPj4gZm9yIHRoZSBTT0MgYW5kIFNFQ1RZUEUgY2hvaWNlIGFu
eW1vcmUsIGFzIGl0IGlzIGp1c3QgdXNlZCB0bwo+ID4+IGFzc2VtYmxlIHRoZSBib2FyZCBzcGVj
aWZpYyBmaWxlbmFtZSB3aGljaCB3aWxsIGVuZCB1cCBiZWluZyB0aGUKPiA+PiB0aWJvb3QzLmJp
bi4gQnV0IHUtYm9vdCBpcyBhbHJlYWR5IGNob29zaW5nIHRoZSBkZWZhdWx0IHRpYm9vdDMuYmlu
Cj4gPj4gZm9yIHlvdToKPiA+PiBodHRwczovL2VsaXhpci5ib290bGluLmNvbS91LWJvb3QvdjIw
MjQuMDQvc291cmNlL2FyY2gvYXJtL2R0cy9rMy1hbTYyNS1waHljb3JlLXNvbS1iaW5tYW4uZHRz
aSNMNjAKPiA+Pgo+ID4+IFNvcnJ5IGZvciBiZWluZyBzbyBwZXJzaXN0ZW50LCBJIHJlYWxseSBk
b24ndCB0aGluayB0aGlzIGlzIHRoZQo+ID4+IGNvcnJlY3QgYXBwcm9hY2guIEp1c3QgZGVmYXVs
dGluZyB0aGUgYmluYXJ5IG5hbWUgdG8gdGlib290My5iaW4KPiA+PiB3aWxsIHByb2JhYmx5IGhh
bmRsZSBtb3N0IGNhc2VzIGFuZCBmb3IgdGhlIG9kZGJhbGxzLCBqdXN0IHNldCB0aGUKPiA+PiBm
aWxlbmFtZSBpbiB0aGUgZGVmY29uZmlnLgo+ID4KPiA+IE1pY2hhZWwgaXMgcmlnaHQgYXQgdGhp
cyBwb2ludC4gVGhpcyBvcHRpb24gb25seSBjYW4gc2VsZWN0IHRoZSBUSSBldm0KPiA+IHNwZWNp
ZmljIHRpYm9vdDMgZmlsZXMgZGVmaW5lZCBpbiB0aGUgVS1Cb290IGJpbm1hbiBkdHNpIGZpbGVz
LiBJIGp1c3QKPiA+IGNoZWNrZWQgYW5kIGluIFUtQm9vdCBhcmUgMyBvdGhlciBib2FyZHMgdGhh
dCB1c2UgZGlmZmVyZW50IG5hbWVzCj4gPiB0aGFuIHRoZSBvbmUgdXNlZCBieSBUSS4gQW5kIGF0
IGxlYXN0IG9uZSBvdGhlciB3aWxsIGNvbWUgaW4gdGhlIG5lYXIgZnV0dXJlLgo+Cj4gSW5kZWVk
LCB5b3UncmUgcmlnaHQuCj4KPiBMYXN0IHRpbWUgSSd2ZSBjaGVja2VkIC1ldm0gd2FzIHVzZWQg
b24gbW9zdCAoSSB0aG91Z2h0IG9uIGFsbCkgYm9hcmRzLgo+Cj4gU2VlIHRoZSBmaWxlIGszLWo3
MjFlLWJpbm1hbi5kdHNpIHNoYXJlZCBiZXR3ZWVuIHRoZSByZWFsIFRJIEVWTSBhbmQgdGhlCj4g
c2stdGRhNFZNIGJvYXJkcy4KPgo+IGh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL3UtYm9vdC9s
YXRlc3Qvc291cmNlL2FyY2gvYXJtL2R0cy9rMy1qNzIxZS1iaW5tYW4uZHRzaQo+Cj4gRXZlbiB0
aGUgYmVhcGxlcGxheSB1c2VzIHRoZSAtZXZtIHN1ZmZpeDoKPgo+IGh0dHBzOi8vZWxpeGlyLmJv
b3RsaW4uY29tL3UtYm9vdC9sYXRlc3Qvc291cmNlL2FyY2gvYXJtL2R0cy9rMy1hbTYyNS1yNS1i
ZWFnbGVwbGF5LmR0cyNMODEKPgo+IEkgbWlzc2VkIHRoZSB2ZXJkaW4gZXhhbXBsZXM6Cj4gaHR0
cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vdS1ib290L2xhdGVzdC9zb3VyY2UvYXJjaC9hcm0vZHRz
L2szLWFtNjI1LXZlcmRpbi13aWZpLWRldi1iaW5tYW4uZHRzaSNMMTIKPgo+IEluIG90aGVyIGhh
bmQsIHdlIHNob3VsZCBub3QgcmVseSBvbiB0aGUgdGlib290My5iaW4gc3ltbGluayBzaW5jZSBp
dCBsaW5rcyB0aGUKPiAtZ3AsIC1ocy1mcywgLWhzIHRpYm9vdDMgYmluYXJ5IGFjY29yZGluZyB0
byB3aGVyZSAic3ltbGluayA9ICJ0aWJvb3QzLmJpbiI7Igo+IGxpbmUgaXMgbG9jYXRlZCBpbiBr
My0qYmlubWFuLmR0c2kuCj4KPiBTbywgaW5zdGVhZCBvZiBCUjJfVEFSR0VUX1RJX0szX1I1X0xP
QURFUl9USUJPT1QzX0JJTiB5b3Ugc3VnZ2VzdCB0byBsZXQgdGhlCj4gdXNlciB0byBkZWZpbmUg
YSBjdXN0b20gdGlib290MyBiaW5hcnkgbmFtZSBvciBpZiBlbXB0eSB1c2UgdGhlIGRlZmF1bHQg
b25lLgoKTXkgc3VnZ2VzdGlvbiBpcyB0byByZW1vdmUgdGhlIEJSMl9QQUNLQUdFX1RJX0szX1NP
Q19BTXh4IGFuZApCUjJfUEFDS0FHRV9USV9LM19TRUNUWVBfeHggc3R1ZmYsIGxldCB0aGUgdXNl
ciBkZWZpbmUgYSBiaW5hcnkgZmlsZQpuYW1lIGluIEJSMl9UQVJHRVRfVElfSzNfUjVfTE9BREVS
X1RJQk9PVDNfQklOIG9yIGRvIGEgZGVmYXVsdCB0bwp0aWJvb3QzLmJpbgoKPiBXZSBzaG91bGQg
YWxzbyBkbyBzb21ldGhpbmcgc2ltaWxhciBmb3IgQlIyX1RBUkdFVF9USV9LM19SNV9MT0FERVJf
U1dTRldfSVRCCgpUaGlzIHNvdW5kcyBzaW1pbGFyIHRvIHRoZSB0aGluZyBhYm92ZSwgYnV0IG9u
IHRoZSBwb3J0IEkgdXNlZCBmb3IgdGhlCm5ldyB1cGNvbWluZyBib2FyZCB0aGlzIHdhcyBub3Qg
dXNlZCBhbmQgdGhlcmVmb3JlIG5vdCBjb25zaWRlcmVkIGluCmRldGFpbC4KCi0tIApIZWlrbwoK
PiBCZXN0IHJlZ2FyZHMsCj4gUm9tYWluCj4KPgo+ID4KPiA+Pgo+ID4+IC1taWNoYWVsCj4gPgo+
ID4KPiA+IC0tCj4gPiBIZWlrbwo+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5v
cmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290
Cg==
