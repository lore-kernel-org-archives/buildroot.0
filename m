Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE5B8C0218A
	for <buildroot@archiver.kernel.org>; Tue, 28 Jan 2025 23:00:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 619BD80EC8;
	Tue, 28 Jan 2025 23:00:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8_ZqitYetbzO; Tue, 28 Jan 2025 23:00:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 739C280EDC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 739C280EDC;
	Tue, 28 Jan 2025 23:00:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 45B4C20
 for <buildroot@buildroot.org>; Tue, 28 Jan 2025 23:00:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4073080EC8
 for <buildroot@buildroot.org>; Tue, 28 Jan 2025 23:00:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lKNnZGnwduoM for <buildroot@buildroot.org>;
 Tue, 28 Jan 2025 23:00:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::e31; helo=mail-vs1-xe31.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1748D80EDC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1748D80EDC
Received: from mail-vs1-xe31.google.com (mail-vs1-xe31.google.com
 [IPv6:2607:f8b0:4864:20::e31])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1748D80EDC
 for <buildroot@buildroot.org>; Tue, 28 Jan 2025 23:00:19 +0000 (UTC)
Received: by mail-vs1-xe31.google.com with SMTP id
 ada2fe7eead31-4affbc4dc74so3701074137.0
 for <buildroot@buildroot.org>; Tue, 28 Jan 2025 15:00:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738105219; x=1738710019;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OmS60G1LTPAJn9ILyzo2s5lIDsWU22HHEh2gFT5IM6I=;
 b=QD5kNrfbemIRhf9wugzOaGn0rT4mqe826kpI4IwuJsA+960pSfmBjXM5G/tTiBC/Lx
 LtWcieEzYrToHhtynJvOJQ1RT2ggMj08CLJSFowKJpvu/hSFKkPOMlFyr+4ha4JTYgnd
 pxMhKULrQIBcnJnI8OVLrpV3rX8o38ZMkoulTUATD7Hx8AIJ+7HtQtF1od1p8p4Pzrs1
 iUWfHyXe/gYddh8CljDRWGnfPqllgH9o18NUYC5Z5CM46BdyfCmjRCZ8eOBrrZ8IjK0L
 gFaRLuFqKScESZcATnAJrpR5DrCk7j0BLQVxSsWUXn67PwiCKm3z3JUv8kde3kKXHGeR
 ZOoQ==
X-Gm-Message-State: AOJu0YwmO4BQ2zv/f39RmkBGOjm6JfCD0gVSJCZ0cv6FUsoUmdIPUJ0E
 PbDvqPDV+hIsvrKH8968jHE/UpcbnSWxuSlYdTzn0f/vNIWAqSs94Ym8asLmzhE6gzzuGL0BVbg
 xTP8PNKRLG0SCzAMvs0WCKe2xqNTMgEa+
X-Gm-Gg: ASbGnctb5PBaoRMD5+i+SR121vpCelRihZ/EJCxDkMnllHGFEADMcyM3539uVCvTM8H
 igm5C0pSCjEneuMna+tNpwwcRn6Jd6yYSGipD9zdri7RyJtlUKxWVbT5o9+5QxCOyo+hl1CBW
X-Google-Smtp-Source: AGHT+IHFwe84zPR80ChNRtQBm+n6icgaNc46guiwY/8GOAbKvLavSxQn/orh4e5OrMTyDzbNB+/ED0Bf39/2Fc2vVYk=
X-Received: by 2002:a05:6102:3709:b0:4b1:1b67:6a5c with SMTP id
 ada2fe7eead31-4b9a52719e7mr783639137.18.1738105218753; Tue, 28 Jan 2025
 15:00:18 -0800 (PST)
MIME-Version: 1.0
References: <20250128170153.2298242-1-james.hilliard1@gmail.com>
 <20250128170153.2298242-10-james.hilliard1@gmail.com>
 <42a394596365512b8bf4d523042534ae@free.fr>
In-Reply-To: <42a394596365512b8bf4d523042534ae@free.fr>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 29 Jan 2025 01:00:07 +0200
X-Gm-Features: AWEUYZnWyBEfK9MWS5QmJN-DkPd5206XBvpeKXdeJeqIHEfrpwcwuXjm7A_fST4
Message-ID: <CADvTj4o+t64=vn46+jEy7JBy51vpVaYHVxC3T7rfjr47QuzeeA@mail.gmail.com>
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org, Stefan Hager <stefan.hager@ginzinger.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1738105219; x=1738710019; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OmS60G1LTPAJn9ILyzo2s5lIDsWU22HHEh2gFT5IM6I=;
 b=Mzw+uC6ncAa/hfxYSDEElBM1EiEIsS+pR6dg5kL1Wp0LCEEYYpjCTVrSONl3l0z4NU
 uWGoqjPqeGzLivsurS4LMdsl9X75IAiQEJxZbqcIqiF7nuGL6ks9h3TVqrdHLsLddNGb
 mmtpKqmiRE0YKUCvzhTQ7bqTZ0ch2eeEs6/saeYu0zHRN3t8xix74qCybkWYjTx7Rnl1
 x3wVZfSc2kTlY7xf1j/3Fa92GVtFy2pvwRlYxZi0LpBiYBRLIAIgB+mSpVYyIb6lZ0mo
 +81bvFdfvz4D8PaN/Zo16dD8PxRp8C8kfakYKlOS8T5cTyCmNJGE5uoYgt8w481iyQN+
 To4A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Mzw+uC6n
Subject: Re: [Buildroot] [PATCH v8 10/10] package/tensorflow-lite: new
 package
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

T24gV2VkLCBKYW4gMjksIDIwMjUgYXQgMTI6NDDigK9BTSBKdWxpZW4gT2xpdmFpbiA8anUub0Bm
cmVlLmZyPiB3cm90ZToKPgo+IEhpIEphbWVzLCBTdGVmYW4sCj4KPiBPbiAyOC8wMS8yMDI1IDE4
OjAxLCBKYW1lcyBIaWxsaWFyZCB3cm90ZToKPiA+IEZyb206IFN0ZWZhbiBIYWdlciA8c3RlZmFu
LmhhZ2VyQGdpbnppbmdlci5jb20+Cj4gPgo+ID4gVGhpcyBwYWNrYWdlIGFkZHMgdGhlIHRlbnNv
cmZsb3cgbGl0ZSBydW50aW1lIHRvIGJ1aWxkcm9vdC4KPiA+Cj4gPiBUZXN0ZWQtYnk6IFN0ZWZh
biBIYWdlciA8c3RlZmFuLmhhZ2VyQGdpbnppbmdlci5jb20+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBT
dGVmYW4gSGFnZXIgPHN0ZWZhbi5oYWdlckBnaW56aW5nZXIuY29tPgo+ID4gU2lnbmVkLW9mZi1i
eTogSmFtZXMgSGlsbGlhcmQgPGphbWVzLmhpbGxpYXJkMUBnbWFpbC5jb20+Cj4KPiBbLi4uXQo+
Cj4gPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS90ZW5zb3JmbG93LWxpdGUvdGVuc29yZmxvdy1saXRl
Lm1rCj4gPiBiL3BhY2thZ2UvdGVuc29yZmxvdy1saXRlL3RlbnNvcmZsb3ctbGl0ZS5tawo+ID4g
bmV3IGZpbGUgbW9kZSAxMDA2NDQKPiA+IGluZGV4IDAwMDAwMDAwMDAuLjQzM2VmZjMyNDIKPiA+
IC0tLSAvZGV2L251bGwKPiA+ICsrKyBiL3BhY2thZ2UvdGVuc29yZmxvdy1saXRlL3RlbnNvcmZs
b3ctbGl0ZS5tawo+ID4gQEAgLTAsMCArMSw1OSBAQAo+ID4gKyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjCj4gPiArIwo+ID4gKyMgdGVuc29yZmxvdy1saXRlCj4gPiArIwo+ID4gKyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjCj4gPiArCj4gPiArVEVOU09SRkxPV19MSVRFX1ZFUlNJT04gPSAyLjExLjAK
Pgo+IFNvIEkgZmluYWxseSBtZXJnZWQgdGhpcyBsb25nc3RhbmRpbmcgdGVuc29yZmxvdy1saXRl
IHNlcmllcy4KPiBUaGFua3MgYWdhaW4hCj4KPiBUaGUgdmVyc2lvbiBtZXJnZWQgaGVyZSBpcyBh
IGJpdCBvdXRkYXRlZCBhbHJlYWR5LiBTZWU6Cj4gaHR0cHM6Ly9naXRodWIuY29tL3RlbnNvcmZs
b3cvdGVuc29yZmxvdy9yZWxlYXNlcy90YWcvdjIuMTEuMAo+IGZyb20gTm92ZW1iZXIgMjAyMi4K
Pgo+IEZvciByZWZlcmVuY2UsIHRoZSBsYXRlc3QgdmVyc2lvbiwgYXMgb2YgdG9kYXkgaXMgdjIu
MTguMDoKPiBodHRwczovL2dpdGh1Yi5jb20vdGVuc29yZmxvdy90ZW5zb3JmbG93L3JlbGVhc2Vz
L3RhZy92Mi4xOC4wCj4gZnJvbSBPY3RvYmVyIDIwMjQuCj4KPiBTbyBpdCB3b3VsZCBiZSByZWFs
bHkgbmljZSB0byBzZWUgdXBkYXRlcyB0b3dhcmRzIHRoaXMgbmV3ZXIgdmVyc2lvbi4KPiBUaGlz
IHdpbGwgcHJvYmFibHkgYnJpbmcgbmV3IGRlcGVuZGVuY2llcyB0b28uCgpZZWFoLCBub3cgdGhh
dCBpdCdzIG1lcmdlZCBpdCBzaG91bGQgYmUgYSBiaXQgZWFzaWVyIHRvIGJyaW5nIHVwIHRvCmRh
dGUsIHdpdGggc28gbWFueSBuZXcgZGVwZW5kZW5jaWVzIGV2ZW4gZm9yIHRoZSBvbGRlciB2ZXJz
aW9uCkkgd2FudGVkIHRvIHRyeSBhbmQga2VlcCB0aGUgc2VyaWVzIGFzIHNtYWxsIGFzIHBvc3Np
YmxlLgoKPgo+IEFsc28sIGZvciBpbmZvcm1hdGlvbiwgdGVuc29yZmxvdy1saXRlIGlzIGluIGEg
cHJvY2VzcyB0byBiZQo+IHJlbmFtZWQgdG8gTGl0ZVJULiBTZWU6Cj4gaHR0cHM6Ly9kZXZlbG9w
ZXJzLmdvb2dsZWJsb2cuY29tL2VuL3RlbnNvcmZsb3ctbGl0ZS1pcy1ub3ctbGl0ZXJ0Lwo+IGh0
dHBzOi8vZ2l0aHViLmNvbS9nb29nbGUtYWktZWRnZS9saXRlcnQKPgo+IEl0IHNlZW1zIHRoaXMg
cHJvY2VzcyB3aWxsIHRha2Ugc29tZSB0aW1lLCBzbyBJIG1lcmdlZCB0aGlzCj4gcGFja2FnZSB3
aXRoIGl0cyAib2xkIiBuYW1lIGFueXdheS4KClllYWgsIGl0IHNlZW1zIGNoYW5nZXMgYXJlIGdl
dHRpbmcgcHVzaGVkIHRvIHRoZSBvbGQgYW5kIG5ldwpsb2NhdGlvbnMgc3RpbGwuCgo+Cj4gQmVz
dCByZWdhcmRzLAo+Cj4gSnVsaWVuLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qu
b3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9v
dAo=
