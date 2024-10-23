Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C98D4CFA45F
	for <buildroot@archiver.kernel.org>; Wed, 23 Oct 2024 19:49:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 76D5A407BD;
	Wed, 23 Oct 2024 19:49:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wFJU6CuMVA22; Wed, 23 Oct 2024 19:49:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 292EC407C2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 292EC407C2;
	Wed, 23 Oct 2024 19:49:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id C50314960
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 19:49:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A54174017B
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 19:49:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y1WKc8ViuFEK for <buildroot@buildroot.org>;
 Wed, 23 Oct 2024 19:49:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::e2d; helo=mail-vs1-xe2d.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 62DC040A56
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 62DC040A56
Received: from mail-vs1-xe2d.google.com (mail-vs1-xe2d.google.com
 [IPv6:2607:f8b0:4864:20::e2d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 62DC040A56
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 19:49:32 +0000 (UTC)
Received: by mail-vs1-xe2d.google.com with SMTP id
 ada2fe7eead31-4a479773730so28618137.2
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 12:49:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729712971; x=1730317771;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eWe6ZIxgZVIvBqBhdp/nKeAFlKpKDQWOlUAwQplxp8o=;
 b=POdrlDHaL3Bae5U4VCkYzs1w4gWZSirSUNQuygLpGOlS40lJ2BOmZLu2dYxMIROM6s
 MPAzT6MGKv30iG6q9EEXnUI3PVxYSn1yGJqrdFx7ZTnF2XzcLv7ZLPLVBYtMb210bs4o
 eBD9+5S9OY7fZAh3PlCGRJYim+KWm6Yc3oc16n7cjUdFb2j0L7Uo4sJaDKo1Nnnp6nom
 25xvnuoCzQmnj6C7MyW0MljxLB8IqknS9hBBGCg0NKQiqM2Nqz4fJKuMLp1umcbep+m8
 WN3INC0MhzXqx9YHgzd3F+go4Gl5fAVEeAlB5KwwCrLaQ3RZroOfZk88CGrhtOMzLtJw
 Phkw==
X-Gm-Message-State: AOJu0YzWZBFsFlQcj8fReAakFQebxEgZoiI9T+YasPEAuLKrq7BFrhiB
 HObDbCcDe6DNpYdlLSU7YtIFebP5SoT0UFqbOhPdGY/7es78XVFUb9nKUn61daPt6xpfg8XwZcJ
 K6jsTrqYTXb6bkKvRAHZmdle8xsKj3mnA
X-Google-Smtp-Source: AGHT+IErvxXzOP2cD2IBNTh/AzuYQO7d2kosdhaPpAXWddTRv4L1YaVAvNYhHkMWBMqHcu6frB+xBJoVdyewOp/nt1M=
X-Received: by 2002:a05:6102:3584:b0:4a4:97bc:c0d7 with SMTP id
 ada2fe7eead31-4a751bcb0edmr4204725137.8.1729712971059; Wed, 23 Oct 2024
 12:49:31 -0700 (PDT)
MIME-Version: 1.0
References: <20240805163133.4126564-1-james.hilliard1@gmail.com>
 <CA+h8R2oQGKFFH-vMX27WUO1uEAGyt4cz9MCwn9Cofwyujx1xDA@mail.gmail.com>
 <20240805223152.09ed915b@windsurf>
 <CADvTj4o_CnzCth+QqoxhVovBRinvYfbMf7r+SWnnY0tfVbKgbw@mail.gmail.com>
 <CA+h8R2obsR-CzMhWDpQ-A0oeEPaG-P=aCwF7BS4J-3eShmHJgg@mail.gmail.com>
 <20240806165050.234235b4@windsurf>
 <CADvTj4pOK8-2YXy0POUg1qOKa1MrjsxbnS-r1F7YMk_YXFmEAQ@mail.gmail.com>
 <CA+h8R2reErtSWPO1hGpX7tT5Xejb_SNqiuSCnXvJZKHwhzdcZg@mail.gmail.com>
 <20240806185731.372f8f3e@windsurf>
 <CA+h8R2rnNhM0nKyZm4_y6ZFrNyn7YzFa7BHeH57cLif38FSrxA@mail.gmail.com>
 <CADvTj4p2heLayPzF7uTK0TLzbbo4C_305vTg9=3W3aCQbAoQGw@mail.gmail.com>
 <CA+h8R2o--yr=J8bmo6R=rBStYLxwOW+fvEKQ3zfLuKrdZznCCA@mail.gmail.com>
 <20241023212545.28838fc1@windsurf>
In-Reply-To: <20241023212545.28838fc1@windsurf>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 23 Oct 2024 13:49:19 -0600
Message-ID: <CADvTj4p6EOBciNjy03REWUTkwA6VRYqVYRiYbeDueNC1gbSS_A@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Christian Stewart via buildroot <buildroot@buildroot.org>,
 Christian Stewart <christian@aperture.us>, 
 Anisse Astier <anisse@astier.eu>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729712971; x=1730317771; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eWe6ZIxgZVIvBqBhdp/nKeAFlKpKDQWOlUAwQplxp8o=;
 b=mAGD5xBQ6eBDXuc2Z18X+R8wMHWULqltfwPNNvxk2IZxKjG/UA33qcBbdmKwZ0uWQi
 lUICTixjtSZ7aaWDe6D1B9EWDci2eQt6zO3nSQWE6NJjkxs0bcQH1Cyuyw79YIY+xTho
 TWSA4VrjoQG+oqhY4usgQmYpG4yzP9AwFShTJDxCSaBNRrKxKlXogxKjHN3xbogX878a
 P8/Le1ZJBxaSlCSAFfgWcIc4UxtYS5aebjpjzMSdVeQgf57nEgKdaJT86uWFC79vLPdZ
 IeYjFEyMUvW4wqqNNVlD9QYQI2ddgH3AZjYVQb/crxFCV7T95xl143KB3HnHCQawlpM7
 n2eA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=mAGD5xBQ
Subject: Re: [Buildroot] [PATCH v4 1/2] package/pkg-golang.mk: allow
 packages to override download GOPROXY
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

T24gV2VkLCBPY3QgMjMsIDIwMjQgYXQgMToyNeKAr1BNIFRob21hcyBQZXRhenpvbmkKPHRob21h
cy5wZXRhenpvbmlAYm9vdGxpbi5jb20+IHdyb3RlOgo+Cj4gSGVsbG8sCj4KPiBPbiBXZWQsIDIz
IE9jdCAyMDI0IDA5OjM1OjE2IC0wNzAwCj4gQ2hyaXN0aWFuIFN0ZXdhcnQgdmlhIGJ1aWxkcm9v
dCA8YnVpbGRyb290QGJ1aWxkcm9vdC5vcmc+IHdyb3RlOgo+Cj4gPiBJdCBpcyBhIHByb3h5LCBu
b3QgYSBkb3dubG9hZCBVUkwuIFRoZSBpbnRlbnQgb2YgdGhlIGVudGlyZSBHbyBtb2R1bGUKPiA+
IHN5c3RlbSBpcyB0byBiZSBiYXNlZCBvbiBzb3VyY2UgY29udHJvbCB1bmRlciB0aGUgaG9vZC4g
V2Ugc2hvdWxkIGJlIGFibGUKPiA+IHRvIGNoZWNrIG91dCB0aGUgZ2l0IHJlcG9zaXRvcmllcyBv
ZiB0aGUgdW5kZXJseWluZyBzb3VyY2Ugd2l0aG91dCBoYXZpbmcKPiA+IHRvIHVzZSB0aGUgR29v
Z2xlIHByb3h5Lgo+ID4KPiA+IElmIHdlIG1ha2UgYSBoYWJpdCBvZiBpZ25vcmluZyB0aGVzZSBo
YXNoIG1pc21hdGNoZXMgaXQgd2lsbCBiZWNvbWUgdmVyeQo+ID4gZWFzeSBmb3IgcGVvcGxlIHRv
IHN0dWZmIGNvZGUgaW50byBhIHJlbGVhc2Ugb24gR2l0SHViIGFuZCB0aGVuIGNoYW5nZSB0aGUK
PiA+IHRhZyB0byBzb21ldGhpbmcgZWxzZSBsYXRlciwgbGVhdmluZyBiZWhpbmQgdGhlIG9sZCBy
ZWNvcmQgaW4gR09QUk9YWSBhbmQKPiA+IHRyaWNraW5nIG1haW50YWluZXJzIGludG8gcmV2aWV3
aW5nIHRoZSB3cm9uZyBjb2RlIG9uIHRoZSBtb2RpZmllZCBHaXRIdWIKPiA+IHRhZy4KPiA+Cj4g
PiBUaGVyZSBtdXN0IGJlIHNvbWUgcmVhc29uIHdoeSB5b3VyIHBhY2thZ2UgaXMgaGF2aW5nIHRo
aXMgaXNzdWUuIFdpdGgKPiA+IGFuY2hvcmUgcXVpbGwgcGFja2FnZSB3ZSBmb3VuZCB0aGF0IGl0
IHdhcyBnaXQgbGZzIHdpdGggdGVzdCBmaWxlcyBjYXVzaW5nCj4gPiB0aGUgcHJvYmxlbS4KPgo+
IEkgY29udGludWUgdG8gYWdyZWUgd2l0aCBDaHJpc3RpYW4uIElmIHVzaW5nIGNhY2hpbmcgcHJv
eGllcyBpcyBuZWVkZWQKPiB0byBhdm9pZCBkb3dubG9hZGluZyB0aGUgInJlYWwiIHVwc3RyZWFt
IGJlY2F1c2UgdGhlIHJlYWwgdXBzdHJlYW0gaGFzCj4gY2hhbmdlZC9pcyBicm9rZW4sIHRoaW5n
cyBhcmUgc2V2ZXJlbHkgd3JvbmcuCgpUaGlzIGlzIG9ubHkgZm9yIGRlcGVuZGVuY2llcyBvZiB0
aGUgcHJvamVjdCwgdGhlIGlzc3VlIGlzIHRoZXkgY2FuIG9mdGVuCnBvaW50IHRvIHVuc3RhYmxl
IGRlcGVuZGVuY3kgcmVwb3NpdG9yaWVzIEFGQUlVIGFuZCB1cHN0cmVhbXMganVzdAp0ZW5kIHRv
IHJlbHkgb24gdGhpcyBjYWNoaW5nIHByb3h5LgoKPgo+IEluc3RlYWQsIEkgd291bGQgcmVjb21t
ZW5kIHRvIHBhdGNoIG5ldGJpcmQgdG8gcmVzb2x2ZSB0aGlzIGlzc3VlLiBJCj4ga25vdyB0aGlz
IHJlcXVpcmVzIHBhdGNoZXMgdG8gYmUgYXBwbGllZCAqYmVmb3JlKiB0aGUgdmVuZG9yaW5nIHN0
ZXAsCj4gYnV0IHRoYXQgaXQgc29tZXRoaW5nIHRoYXQgYW55d2F5IHdvdWxkIGJlIHVzZWZ1bCB0
byBoYXZlLiBTbyBJIHdvdWxkCj4gc3VnZ2VzdCB0byBmaW5kIGEgd2F5IHRvIGRvIHRoYXQuIFBl
cmhhcHMgc29tZSBzcGVjaWFsIHBhdGNoIGV4dGVuc2lvbiwKPiBsaWtlIHBhY2thZ2UvPGZvbz4v
Ki52ZW5kb3JpbmctcGF0Y2ggb3Igc29tZSBvdGhlciBiZXR0ZXIgbmFtZSwgdGhhdAo+IHdvdWxk
IGJlIGFwcGxpZWQgYmVmb3JlIHRoZSB2ZW5kb3Jpbmcgc3RlcCB0YWtlcyBwbGFjZT8KCkknbSBu
b3QgYWN0dWFsbHkgdHJ5aW5nIHRvIG1vZGlmeSB0aGUgZGVwZW5kZW5jaWVzIHNwZWNpZmllZCBh
dCBhbGwsIGlmCnRoZSBvbmx5IGRvd25sb2FkIGxvY2F0aW9uIGZvciBhIHNwZWNpZmllZCBkZXBl
bmRlbmN5IEkgbmVlZCBpcyBvbgpodHRwczovL3Byb3h5LmdvbGFuZy5vcmcgdGhlbiBJJ20gbm90
IHN1cmUgaG93IEkgd291bGQgcGF0Y2ggdGhlCnBhY2thZ2UgdG8gdXNlIHRoYXQgaW5zdGVhZC4K
CkFsc28gdGhlbiB3aGF0IGRvIHdlIGRvIHdoZW4gYSBwYWNrYWdlIGRlcGVuZGVuY3kgaW5ldml0
YWJseQpicmVha3MgYWdhaW4gZHVlIHRvIHRoZSBkb3dubG9hZCBsb2NhdGlvbiBiZWNvbWluZyBi
cm9rZW4sIGRvCndlIGp1c3Qga2VlcCBwYXRjaGluZyB0aGUgcGFja2FnZSBvdmVyIGFuZCBvdmVy
IGFnYWluIGV2ZXJ5IHRpbWUKb25lIG9mIGl0cyBkZXBlbmRlbmNpZXMgYnJlYWtzPwoKPgo+IFRo
b21hcwo+IC0tCj4gVGhvbWFzIFBldGF6em9uaSwgY28tb3duZXIgYW5kIENFTywgQm9vdGxpbgo+
IEVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcgYW5kIHRyYWluaW5nCj4gaHR0
cHM6Ly9ib290bGluLmNvbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0
dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
