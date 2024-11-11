Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A8D4D3ABF5
	for <buildroot@archiver.kernel.org>; Mon, 11 Nov 2024 20:25:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E161B80D9C;
	Mon, 11 Nov 2024 20:25:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cXdbDybkl0T8; Mon, 11 Nov 2024 20:25:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 381B080DAF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 381B080DAF;
	Mon, 11 Nov 2024 20:25:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 774566C
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 20:25:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 689A1401A2
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 20:25:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EKCambpjSN57 for <buildroot@buildroot.org>;
 Mon, 11 Nov 2024 20:25:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::933; helo=mail-ua1-x933.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3361140294
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3361140294
Received: from mail-ua1-x933.google.com (mail-ua1-x933.google.com
 [IPv6:2607:f8b0:4864:20::933])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3361140294
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 20:25:46 +0000 (UTC)
Received: by mail-ua1-x933.google.com with SMTP id
 a1e0cc1a2514c-84fb533bb9bso1673511241.3
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 12:25:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731356745; x=1731961545;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jO5jtIGDn6YtJVA2hhaOkE0KahMs4qj43CTmE6cDKiU=;
 b=lWzuVCIewU5OpQ6t39FXLy/zVMFtGnc0AiuJq9R3dhtXCPJgsr2l/z0dsyVzn4UkQr
 xH4c7CJE1pbQvuKzxw1w3VQk3ZAXRrPBJ7tqqPHDkt3iqZObvA4XdCY8my4xyaiwE49F
 1QyAoMhQLB17UASOjBKbbjeEYI/YUp1clHy/7jSxiYCmFaqmFWvM6qo1uzhGyB8Tj46m
 o8p0ihLKItOQQ4aa0UXC5OBOp7/Y2LHabV30b78li0RnUzKcMkFUgeAGWoT2YN8S9Ak+
 CvRM+TfC+UGH3C0Ks9MomkJOr4nIM12yrkH6lWEG3Yb7CDos297Z4aCfNXzpRBBCpEkl
 s8IA==
X-Gm-Message-State: AOJu0Yzi9/VW+vQBdM+B3Ojyz2ZZdZc8646K3OZ9gPdVdjBTgE5nc0C5
 J6B7OVKrPZpHNLOcFEdxIF0FTlI3+GMqf5tiJYjxo9wBL0/2RylNhKszgod+0oM8dbvGQtimHPb
 P9CnnnrSUr6AapjgmfYQvuKre9cFBJJvzX0I=
X-Google-Smtp-Source: AGHT+IGQFbmm6QJWTOxBaYD2GnCO8mMhweB3Ta9PhJGP7CEeh4jbH7/8kxjacJV44ZuP/EPYHx7Hd2UQ43sE7u9e5CU=
X-Received: by 2002:a05:6102:3f41:b0:493:bcbd:4633 with SMTP id
 ada2fe7eead31-4aae1367e06mr13908707137.3.1731356744354; Mon, 11 Nov 2024
 12:25:44 -0800 (PST)
MIME-Version: 1.0
References: <20241110193734.1463141-1-james.hilliard1@gmail.com>
 <20241110193734.1463141-2-james.hilliard1@gmail.com>
 <20241111211949.6f844f31@windsurf>
In-Reply-To: <20241111211949.6f844f31@windsurf>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 11 Nov 2024 13:25:33 -0700
Message-ID: <CADvTj4oU1W_eKJkOGDvg=Wtad4pfUfn1Ag_DLnGz_FtSr0avtg@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, Antoine Tenart <atenart@kernel.org>, 
 Marcus Folkesson <marcus.folkesson@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731356745; x=1731961545; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jO5jtIGDn6YtJVA2hhaOkE0KahMs4qj43CTmE6cDKiU=;
 b=H3s8Bsp9SPWEbx6BUrND2plD3Xj4XWpJ7vHtQ1lWczh3fmonWwdUd2/rQRJDDcCFrG
 kaBPjUQg8FWXxetMbdejcGw4b4sLNmUOFEgHD0ydVv9kAcgSj1dvFoIqXAs8V/2Jic66
 NMfAAHYGz1vHolFhW5rKcrVdYpaDNoemhu0ys1bymniz23EOFFzXWLxnfSkFWyI4MeLJ
 ibWj0H3Er0fx3zx5QUXOiE2XAVkcIHpBtFKzPOyQ0eojjAGDUj6rxOt5gQj54Eps9HD7
 kgOqTQ4Abdx7tgCj0CJpu0eVIrYvzo+51ZW8dMLfXhZ1OdbYtD6cbOVY4OwM7ES7iVQ9
 L+FA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=H3s8Bsp9
Subject: Re: [Buildroot] [PATCH v2 2/2] package/swig: bump to version 4.3.0
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

T24gTW9uLCBOb3YgMTEsIDIwMjQgYXQgMToxOeKAr1BNIFRob21hcyBQZXRhenpvbmkKPHRob21h
cy5wZXRhenpvbmlAYm9vdGxpbi5jb20+IHdyb3RlOgo+Cj4gSGVsbG8gSmFtZXMsCj4KPiBPbiBT
dW4sIDEwIE5vdiAyMDI0IDEyOjM3OjM0IC0wNzAwCj4gSmFtZXMgSGlsbGlhcmQgPGphbWVzLmhp
bGxpYXJkMUBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBKYW1lcyBIaWxs
aWFyZCA8amFtZXMuaGlsbGlhcmQxQGdtYWlsLmNvbT4KPiA+IC0tLQo+ID4gIHBhY2thZ2Uvc3dp
Zy9zd2lnLmhhc2ggfCAyICstCj4gPiAgcGFja2FnZS9zd2lnL3N3aWcubWsgICB8IDQgKystLQo+
ID4gIDIgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+Cj4g
VGhhbmtzIGZvciB0aGlzIHBhdGNoLiBDb3VsZCB5b3UgcHJvdmlkZSBzb21lIGRldGFpbHMgb24g
aG93IHdlbGwgeW91Cj4gdGVzdGVkIHRoZSByZXZlcnNlIGRlcGVuZGVuY2llcyBvZiBob3N0LXN3
aWc/Cj4KPiBCYXNlZCBvbiB5b3VyIFBBVENIIDEvMiwgeW91IHRlc3RlZCBsaWJzZWxpbnV4LCBi
dXQgd2hhdCBhYm91dCB0aGUKPiBvdGhlciBwYWNrYWdlcz8gSSBjZXJ0YWlubHkgZG9uJ3QgcmVx
dWlyZSB0ZXN0aW5nICphbGwqIG9mIHRoZW0sIGJ1dAo+IHNpbmNlIHRoaXMgYnVtcCBoYXMgY2F1
c2VkIHNvbWUgYnJlYWthZ2UgZm9yIGxpYnNlbGludXgsIHdlIGNhbgo+IHBvdGVudGlhbGx5IGV4
cGVjdCBzb21lIGJyZWFrYWdlIGZvciBvdGhlciBwYWNrYWdlcy4gQ291bGQgeW91IGJ1aWxkIGEK
PiBkZWZjb25maWcgd2l0aCBhIGdvb2QgbnVtYmVyIG9mIHJldmVyc2UgZGVwZW5kZW5jaWVzIGVu
YWJsZWQsIGFuZAo+IHZlcmlmeSBpdCBidWlsZHMgT0ssIGFuZCByZXBvcnQgdGhpcyBpbiB0aGUg
Y29tbWl0IGxvZz8KCkkgcHJldHR5IG11Y2gganVzdCB0ZXN0IGJ1aWx0IHBhY2thZ2VzIGluZGl2
aWR1YWxseSByYXRoZXIgdGhhbiBhZGRpbmcKdGhlbSB0byBhIGRlZmNvbmZpZy4gSSB0aGluayBJ
IHRlc3RlZCBwcmV0dHkgbXVjaCBldmVyeXRoaW5nIHdpdGggaG9zdC1zd2lnCmFzIGEgZGVwZW5k
ZW5jeSwgSSBkaWRuJ3QgYm90aGVyIG1ha2luZyBzdXJlIGFsbCBjb3VsZCBmdWxseSBidWlsZCBi
dXQKanVzdCBjaGVja2VkIHRoYXQgdGhlcmUgd2VyZW4ndCBhbnkgb2J2aW91cyBzd2lnIGNvbXBp
bGF0aW9uIGVycm9ycy4KCj4KPiBUaGFua3MhCj4KPiBUaG9tYXMKPiAtLQo+IFRob21hcyBQZXRh
enpvbmksIENUTywgQm9vdGxpbgo+IEVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJp
bmcKPiBodHRwczovL2Jvb3RsaW4uY29tCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9v
dC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRy
b290Cg==
