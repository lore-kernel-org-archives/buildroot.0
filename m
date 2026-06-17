Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F9DECD98E2
	for <buildroot@archiver.kernel.org>; Wed, 17 Jun 2026 17:45:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 62711606A8;
	Wed, 17 Jun 2026 17:45:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ruaWGPHEny_R; Wed, 17 Jun 2026 17:45:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 649B6606A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781718317;
	bh=Qo7VotSXYcd5r3OXcUbOmcCtXWrf6Dn0Ot3VrXigcDw=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=A1ubj91+m21hMjJlDHKSjBqZlB9h01pnb94KZrYq0fWLb6o4crnlbJ9W9Azd51uhE
	 efxj72IeMUozVu7sX91zhrXHmKDG8TmxwTKvliATKarHBWuAP8wBwVe3T17pdkdfc2
	 PCVyiKNNTIBaqjGnsM+yZJ8U+WRazICeAFTZ4hpoVP5CszQPRjgIgOrLWAAR+dw8cS
	 xbIx0nT/GEjQxhjdruGpNtkjjp5JS7Acrn+fwlopv7gJz068Oz1Nw+vdIHHnv1+WL8
	 3kzDsAsv5cG6vdh59ga6cNI3x2Jmz1BntoRefDM7Z65ZF+L3WLsAP4dc4EnwSLzmKP
	 5lKDCh0MBLyhg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 649B6606A9;
	Wed, 17 Jun 2026 17:45:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 99F68355
 for <buildroot@buildroot.org>; Wed, 17 Jun 2026 17:45:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7F42B8113C
 for <buildroot@buildroot.org>; Wed, 17 Jun 2026 17:45:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Eeki1mwtW6l3 for <buildroot@buildroot.org>;
 Wed, 17 Jun 2026 17:45:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::e2b; helo=mail-vs1-xe2b.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 83601810EF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 83601810EF
Received: from mail-vs1-xe2b.google.com (mail-vs1-xe2b.google.com
 [IPv6:2607:f8b0:4864:20::e2b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 83601810EF
 for <buildroot@buildroot.org>; Wed, 17 Jun 2026 17:45:15 +0000 (UTC)
Received: by mail-vs1-xe2b.google.com with SMTP id
 ada2fe7eead31-726840fb461so27596137.0
 for <buildroot@buildroot.org>; Wed, 17 Jun 2026 10:45:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781718314; cv=none;
 d=google.com; s=arc-20240605;
 b=C2C2TbJMMO23jyOoQZ1YE8iZJkd6PTzzdSCTx6i+W31D7r7/4D7Mx0akJG7eITpkey
 UCC6BfNwUkYInB7C24M5YNk8w73aE7HGFJb2CNO561sPbkQEO6k6cDgCT4SNF/YImX23
 iPdgX3c50VcSCnsJVSZfuurkw7m0TUjaK9lPaNrZy9FS/kMS6VmJ+01ZmMig7GTKXaMW
 gJ6AoT0OTyDXh81da/8cmfvrit4I2BkeZDZ11mvZ4aeZ6RNMGHw5za/x/NNnw6KoiEJJ
 Zzn9D3knEin5viXbpSmUROBUlHaAjy8g3wmUDinp+apZSf2soheSj9YX8e/o2AAWEkUt
 lcMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=wptZjwtE9Ti00iN6kwQ4sQGVfxJF0+K+RHtRGs58GQk=;
 fh=cVeFviFVk3w7pJfsb6dITt8BWPSefD7nKGK0QH3WO8g=;
 b=TOAtAPag4dxpv3gFmeQ9zfa6E9mfcal2GFoX3kQR3DNDDrCspGF1aUnjSvtOsZkFjg
 rlCFznKlSDI9KyPlyAJFZkavTvLzcAR6SpI+BzNK3n0ZApOyDhLsXyA7pE0/SoJyQBnp
 Vxz/S3SyqJg4vgIGc4Ta2ouE4iTk8ZoL7OmOLKypxz7Opegro3n2n31eAuK7o29bibWT
 8pXUG0MCCw/vzhGwb7/vi/1uBc0VrLkTO+wjY/rkNS4J8EgcVdoN0EgXoVGN+PRd/fA0
 4qsLdcZjzX0VRuUVhYfpZifwPuwLufX1/bI6m5QDoSYHVsRw9xx3PJ+e8hWxlT9KS6Mk
 6nLA==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781718314; x=1782323114;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=wptZjwtE9Ti00iN6kwQ4sQGVfxJF0+K+RHtRGs58GQk=;
 b=ln0cdZsNlcQrX0bwJlwtBznY+NONm2xcTVvvPppUMIRKR+hYygo1B/LKUGXtgbRZyG
 c1zNJFqF2lZ3j4A+SgU2kk6UzBCq7Evxgjj6DQO7w6jahkxuzofYmU4EBtwxIwHYnIjX
 rYsblBcRW2zwjNpUXm2HXlyROZ4Ev0QrBngwvEbaYYRJO5lqeq/mBaNvcEh+y6X9RNf/
 dWFGQX+GNSngYMhe4eEKRh5FXOlPKoeUW9I2qGwci1kzRKErV/CGzNEhKB89GL57a68Z
 Ptf9EBEXoNs+B11GxEDN9CtxRy+c9nm55ketRTKBodmQdfaqd0Ulj1kMrElCi/uxGjpb
 CsxQ==
X-Gm-Message-State: AOJu0Yy6QkskGwo7911iiJOph+hdZnvYSZPjeITbzVmtRgmt7z40AJ67
 hHdXrTKe5deY0839GL5R4+yOhk+xBVGqM3tOg3WzKJh7m7hmczCVAgBd3yLWZeSSF+AgZCD6AIN
 vAyvCzU/0XYqZhn2o3DRNTkiDVLimoww=
X-Gm-Gg: AfdE7ckngToEP1W1HXb8HQQpy6WdQwMLpTSmgRLB65AqtUinTJ1lWEw/4GTsIu3Z0kZ
 +/2vHyEhrzGPev8GrwTt4UDE/P/BpuP2XU1TwvZpN50zVq8rfMjbP4KvEckf3kpXlhZPHkncmZM
 VMhvl0Q4R9hHYRaj3LloKVk8rOR3c4iKivknZCapNZsgr5Px0r8PUHraQqj7pCqa3B0+NxaVYwV
 FkSTIDHBPRf9HWL5JAxpUP6R8j038PnPkd5LRb6ZJtMgWywtjAkqTG4lLJOxcs7npHSNdqQ6SDH
 +VjJ3sU2H/EEyyc1sTleS9jO6KAuedLMMb0Doz36gu/1M1a3EwBrLwrtByxWemZKNdDPNrxwOva
 nCxMXK+W0bM9yKFln2p8WZakF8XzZ0xjD29DO6v4ku/z9FTiR
X-Received: by 2002:a05:6102:d87:b0:605:ead:8f38 with SMTP id
 ada2fe7eead31-7246da6b23cmr3140338137.29.1781718313955; Wed, 17 Jun 2026
 10:45:13 -0700 (PDT)
MIME-Version: 1.0
References: <20260616013113.3899641-1-james.hilliard1@gmail.com>
 <20260616013113.3899641-2-james.hilliard1@gmail.com>
 <dbd17e1e-bcf4-45ea-9e8e-5b9032f902b2@bubu1.eu>
In-Reply-To: <dbd17e1e-bcf4-45ea-9e8e-5b9032f902b2@bubu1.eu>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 17 Jun 2026 11:45:03 -0600
X-Gm-Features: AVVi8Cfs-Sn-LhehpY0fgA8zIm2QozvBy7scDNx4djGM9oErvMAqgoyYmKy3nSI
Message-ID: <CADvTj4o4KyUBFxOUitZx-hw99HpazrfmPEHRK2KAqEwjauUGZg@mail.gmail.com>
To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: buildroot@buildroot.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Thomas Perale <thomas.perale@mind.be>, 
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1781718314; x=1782323114; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wptZjwtE9Ti00iN6kwQ4sQGVfxJF0+K+RHtRGs58GQk=;
 b=aQOF+PuEVZb+++QARUHfUzzFFbbO2po0WgKNlQCcRN4ZrWmhxR97xqZFH57ORuo2AJ
 IXrZsL0E8G6btjsaAU3+p3X6lKHP/dgwgNZJSOW9iUYuv4gRVK5cQSP9/VKKcLsBYHq6
 k4A3t/NdncTgniKgrPRSl13KSXg8aNM2XfTfuwrP0ZfxSVNZ97+pbsDIyj6MUEdCI+Tf
 Nt4sywrhYcCZhCbqKhNc55oqPKHrQjz2JED6VdUTpC1Xw9FXQaVo8M+Sr48bFVbhPm0D
 3FhfvqUURP2kzACrtXTK0m2iyJ9d6vwNTR2VaV6D+y5RIU3moDNksscwQRJim1t5O5nM
 jRHg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=aQOF+PuE
Subject: Re: [Buildroot] [PATCH 2/3] package/pkg-python: derive PyPI site
 from blake2b-256 hash
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

T24gVHVlLCBKdW4gMTYsIDIwMjYgYXQgMTE6MDnigK9BTSBNYXJjdXMgSG9mZm1hbm4gPGJ1aWxk
cm9vdEBidWJ1MS5ldT4gd3JvdGU6Cj4KPiBIaSBKYW1lcywKPiB0aGFua3MgZm9yIHRoaXMgc2Vy
aWVzLiBBIGZldyBjb21tZW50cyBiZWxvdy4KPgo+IE9uIDYvMTYvMjYgMDM6MzEsIEphbWVzIEhp
bGxpYXJkIHdyb3RlOgo+ID4gUHl0aG9uIHBhY2thZ2VzIGRvd25sb2FkZWQgZnJvbSBQeVBJIGN1
cnJlbnRseSBzdG9yZSB0aGUgY29tcGxldGUKPiA+IGZpbGVzLnB5dGhvbmhvc3RlZC5vcmcgcGFj
a2FnZSBwYXRoIGluIHRoZWlyIC5tayBmaWxlLiBUaGF0IHBhdGggaXMKPiA+IGhhc2gtYmFzZWQs
IHNvIGl0IGNoYW5nZXMgZm9yIGV2ZXJ5IHZlcnNpb24gYnVtcCBhbmQgYWRkcyBjaHVybiB0bwo+
ID4gdXBkYXRlcyBhbmQgYmFja3BvcnRzLgo+ID4KPiA+IFdoZW4gYSBQeXRob24gcGFja2FnZSBk
b2VzIG5vdCBkZWZpbmUgX1NJVEUsIGxvb2sgZm9yIGEgYmxha2UyYi0yNTYKPiA+IGVudHJ5IG1h
dGNoaW5nIGl0cyBzb3VyY2UgYXJjaGl2ZSBpbiB0aGUgcGFja2FnZSAuaGFzaCBmaWxlIGFuZCBk
ZXJpdmUKPiA+IHRoZSBmaWxlcy5weXRob25ob3N0ZWQub3JnIGRpcmVjdG9yeSBmcm9tIHRoYXQg
ZGlnZXN0IGJlZm9yZSB0aGUgZ2VuZXJpYwo+ID4gcGFja2FnZSBpbmZyYXN0cnVjdHVyZSB2YWxp
ZGF0ZXMgX1NJVEUuCj4KPiBXaGF0IGRvIHlvdSB0aGluayBhYm91dCBnb2luZyBvbmUgc3RlcCBm
dXJ0aGVyIGFuZCBhbHNvIGNhbGN1bGF0aW5nIHRoZQo+IFNPVVJDRSB2YXJpYWJsZSBhdXRvbWF0
aWNhbGx5IGlmIG5vdCBkZWZpbmVkPwo+Cj4gVGhlIGx1YXJvY2tzIGluZnJhc3RydWN0dXJlIGhh
cyBGT09fTkFNRV9VUFNUUkVBTSBmb3IgdGhpcywgd2hpY2ggaXMKPiB1c2VkIHRvIGF1dG9tYXRp
Y2FsbHkgY2FsY3VsYXRlIHRoZSBGT09fU09VUkNFIHZhcmlhYmxlLCBmb3IgcHlwaSBpdAo+IHdv
dWxkIGJlICQoRk9PX05BTUVfVVBTVFJFQU0pLSQoRk9PX1ZFUlNJT04pLnRhci5neiBpZiBub3Qg
b3ZlcndyaXR0ZW4sCj4gSSB0aGluaz8pCj4KPiBBbmQgdGhlbiBGT09fTkFNRV9VUFNUUkVBTSBj
YW4gYWxzbyBiZSBzZXQgdG8gcGFja2FnZSBuYW1lIG1pbnVzIHRoZQo+IHB5dGhvbiBwcmVmaXgs
IHVubGVzcyBzZXQgZXhwbGljaXRseT8gV2Ugb25seSBoYXZlIGEgaGFuZGZ1bCBvZiBwYWNrYWdl
cwo+IHRoYXQgZGl2ZXJnZSBmcm9tIHRoaXMgcGF0dGVybiwgbWFpbmx5IGlmIHRoZXkgYXJlIGNh
bGxlZAo+IHB5dGhvbi1zb21ldGhpbmcgdXBzdHJlYW0gb3IgaWYgd2UgcGFja2FnZXMgdGhlbSBh
cyBhIGdlbmVyaWMgdG9vbAo+IGluc3RlYWQgb2YgYSBweXRob24gcGFja2FnZSAoaS5lLiBzY29u
cykuIFRoZXJlJ3MgYWxzbyAoSSB0aGluaykgdHdvCj4gcGFja2FnZXMgd2hpY2ggZ290IHJlbmFt
ZWQgdXBzdHJlYW0gYW5kIElNTyBzaG91bGQganVzdCBiZSByZW5hbWVkIGluCj4gYnVpbGRyb290
IGFzIHdlbGwgYXQgc29tZSBwb2ludC4gQnV0IGFueXdheSwgdGhpcyB3aWxsIGNvdmVyIGxpa2Ug
OTgmIG9mCj4gb3VyIHB5dGhvbiBwYWNrYWdlcywgc28gSSB0aGluayBpdCdzIHdvcnRoIGhhdmlu
ZyBhbmQgZG9jdW1lbnRpbmcgdGhpcwo+IGFzIGEgZGVmYXVsdD8KClByb2JhYmx5IG1ha2VzIHNl
bnNlLCBidXQgSSB0aGluayBiZXN0IGhhbmRsZSB0aGF0IHNlcGFyYXRlbHkgc2luY2Ugd2UKd2ls
bCBoYXZlIHRvIGRlYWwgd2l0aCBwYWNrYWdlcyB0aGF0IGRpdmVyZ2UgZnJvbSB0aGUgbm9ybWFs
IHBhdHRlcm4uCgo+Cj4gPgo+ID4gVGhpcyBrZWVwcyB0aGUgcGVyLXZlcnNpb24gZGlnZXN0IGlu
IHRoZSAuaGFzaCBmaWxlIGFuZCBhdm9pZHMgY2FycnlpbmcKPiA+IHRoZSBzYW1lIGhhc2ggaW5m
b3JtYXRpb24gYXMgcGFydCBvZiB0aGUgcGFja2FnZSBzaXRlIFVSTC4gVXBkYXRlCj4gPiBzY2Fu
cHlwaSB0byBvbWl0IHRoZSBnZW5lcmF0ZWQgX1NJVEUgYXNzaWdubWVudCBzbyBuZXdseSBnZW5l
cmF0ZWQgUHlQSQo+ID4gcGFja2FnZXMgY2FuIHVzZSB0aGUgcmVzb2x2ZXIuCj4gPgo+ID4gU2ln
bmVkLW9mZi1ieTogSmFtZXMgSGlsbGlhcmQgPGphbWVzLmhpbGxpYXJkMUBnbWFpbC5jb20+Cj4g
PiAtLS0KPiA+ICAgZG9jcy9tYW51YWwvYWRkaW5nLXBhY2thZ2VzLXB5dGhvbi5hZG9jIHwgIDUg
KysrKysKPiA+ICAgcGFja2FnZS9wa2ctcHl0aG9uLm1rICAgICAgICAgICAgICAgICAgIHwgMTAg
KysrKysrKysrKwo+ID4gICB1dGlscy9zY2FucHlwaSAgICAgICAgICAgICAgICAgICAgICAgICAg
fCAgOSAtLS0tLS0tLS0KPiA+ICAgMyBmaWxlcyBjaGFuZ2VkLCAxNSBpbnNlcnRpb25zKCspLCA5
IGRlbGV0aW9ucygtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9kb2NzL21hbnVhbC9hZGRpbmctcGFj
a2FnZXMtcHl0aG9uLmFkb2MgYi9kb2NzL21hbnVhbC9hZGRpbmctcGFja2FnZXMtcHl0aG9uLmFk
b2MKPiA+IGluZGV4IGQ2YmFlMjk5YTAuLmE2NmFmMWU3ZTIgMTAwNjQ0Cj4gPiAtLS0gYS9kb2Nz
L21hbnVhbC9hZGRpbmctcGFja2FnZXMtcHl0aG9uLmFkb2MKPiA+ICsrKyBiL2RvY3MvbWFudWFs
L2FkZGluZy1wYWNrYWdlcy1weXRob24uYWRvYwo+ID4gQEAgLTgyLDYgKzgyLDExIEBAIEFsbCB0
aGUgcGFja2FnZSBtZXRhZGF0YSBpbmZvcm1hdGlvbiB2YXJpYWJsZXMgdGhhdCBleGlzdCBpbiB0
aGUKPiA+ICAgeHJlZjpnZW5lcmljLXBhY2thZ2UtcmVmZXJlbmNlW2dlbmVyaWMgcGFja2FnZSBp
bmZyYXN0cnVjdHVyZV0gYWxzbwo+ID4gICBleGlzdCBpbiB0aGUgUHl0aG9uIGluZnJhc3RydWN0
dXJlLgo+ID4KPiA+ICtGb3IgUHl0aG9uIHBhY2thZ2VzIGRvd25sb2FkZWQgZnJvbSBQeVBJLCB0
aGUgK1BZVEhPTl9GT09fU0lURSsgdmFyaWFibGUKPiA+ICtjYW4gYmUgb21pdHRlZCB3aGVuIHRo
ZSBwYWNrYWdlICsuaGFzaCsgZmlsZSBjb250YWlucyBhICtibGFrZTJiLTI1NisKPiA+ICtoYXNo
IGZvciB0aGUgc291cmNlIGFyY2hpdmUuIEJ1aWxkcm9vdCBkZXJpdmVzIHRoZSBoYXNoLWJhc2Vk
Cj4gPiArZmlsZXMucHl0aG9uaG9zdGVkLm9yZyBVUkwgZnJvbSB0aGF0IGhhc2guCj4gPiArCj4g
PiAgIE5vdGUgdGhhdDoKPiA+Cj4gPiAgICAqIEl0IGlzIG5vdCBuZWNlc3NhcnkgdG8gYWRkICtw
eXRob24rIG9yICtob3N0LXB5dGhvbisgaW4gdGhlCj4gPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9w
a2ctcHl0aG9uLm1rIGIvcGFja2FnZS9wa2ctcHl0aG9uLm1rCj4gPiBpbmRleCAzMmFjZTRhYWMx
Li4wYmE5M2Q4ZmFlIDEwMDY0NAo+ID4gLS0tIGEvcGFja2FnZS9wa2ctcHl0aG9uLm1rCj4gPiAr
KysgYi9wYWNrYWdlL3BrZy1weXRob24ubWsKPiA+IEBAIC00NTQsNiArNDU0LDE2IEBAIGVuZGlm
Cj4gPgo+ID4gICBlbmRpZiAjIGhvc3QgLyB0YXJnZXQKPiA+Cj4gPiAraWZuZGVmICQoMilfU0lU
RQo+ID4gKyBpZm5kZWYgJCgzKV9TSVRFCj4KPiBUaGUgdXN1YWwgcGF0dGVybiBoZXJlIGlzIGRv
aW5nOgo+Cj4gaWZuZGVmICQoMilfU0lURQo+ICAgaWZkZWYgJCgzKV9TSVRFCj4gICAgICQoMilf
U0lURSA9ICQkKCQoMylfU0lURSkKPiBlbHNlCj4gICAgWy4uLl0KPgo+IElzIHRoZXJlIGFueSBy
ZWFzb24gdG8gbm90IGZvbGxvdyB0aGlzIGhlcmU/Cj4KPiA+ICsgICQoMilfU0lURSA9ICQkKHNo
ZWxsIFwKPiA+ICsgICAgIGF3ayAtdiBmaWxlbmFtZT0iJCQobm90ZGlyICQkKCQoMilfU09VUkNF
KSkiIFwKPiA+ICsgICAgICAgICAgICAgJyQkJCQxID09ICJibGFrZTJiLTI1NiIgJiYgJCQkJDMg
PT0gZmlsZW5hbWUgeyBoID0gJCQkJDI7IHByaW50ZiAiaHR0cHM6Ly9maWxlcy5weXRob25ob3N0
ZWQub3JnL3BhY2thZ2VzLyVzLyVzLyVzIiwgc3Vic3RyKGgsIDEsIDIpLCBzdWJzdHIoaCwgMywg
MiksIHN1YnN0cihoLCA1KTsgZXhpdCB9JyBcCj4KPiBUaGlzIGlzIGVhc2llciB0aGFuIHdoYXQg
SSBjYW1lIHVwIHdpdGgsIG5pY2UuIDopCj4KPiA+ICsgICAgICAgICAgICAgJCQod2lsZGNhcmQg
JCQoJCgyKV9IQVNIX0ZJTEVTKSkgXAo+ID4gKyAgICAgICAgICAgICAvZGV2L251bGwpCj4KPiBO
b3QgYSBodWdlIGZhbiBvZiBwYXNzaW5nIC9kZXYvbnVsbCB0byBhd2sgaGVyZSwgY2FuIHdlIGFk
ZCBhIGNvbmRpdGlvbgo+IGluc3RlYWQgdGhhdCBndWFyZHMgYWdhaW5zdCB0aGVyZSBiZWluZyBu
byBoYXNoIGZpbGVzIGFuZCB0aGVuIGVycm9ycyBvdXQ/Cj4KPiBSZWxhdGVkbHksIHdlIGFsc28g
bmVlZCB0byBndWFyZCBhZ2FpbnN0IG5vIGJsYWtlMmIgaGFzaCBiZWluZyBpbiB0aGUKPiBoYXNo
IGZpbGUgYW5kIHRodXMgbm8gU0lURSBiZWluZyBleHRyYWN0ZWQgKHdoZW4gbm9uZSBpcyBkZWZp
bmVkCj4gbWFudWFsbHkuIEkgdGhpbmsgdGhpcyBzaG91bGQgcmFpc2UgYW4gZXhwbGljaXQgZXJy
b3IgYXMgd2VsbC4KCkFwcGxpZWQgcmVtYWluaW5nIHN1Z2dlc3Rpb25zIGluIHYyOgpodHRwczov
L2xvcmUua2VybmVsLm9yZy9idWlsZHJvb3QvMjAyNjA2MTcxNzQyMDguMzk2ODE4My0xLWphbWVz
LmhpbGxpYXJkMUBnbWFpbC5jb20vVC8KCj4KPiAgPiBbLi4uXQo+Cj4gTWFyY3VzCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5n
IGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3Jn
L21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
