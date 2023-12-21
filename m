Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37BCCC35274
	for <buildroot@archiver.kernel.org>; Thu, 21 Dec 2023 22:17:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1F2294000E;
	Thu, 21 Dec 2023 22:17:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1F2294000E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7zpq83iOdObi; Thu, 21 Dec 2023 22:17:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4F8DE42DEE;
	Thu, 21 Dec 2023 22:17:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4F8DE42DEE
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5EDA91BF329
 for <buildroot@lists.busybox.net>; Thu, 21 Dec 2023 22:17:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3397983F0E
 for <buildroot@lists.busybox.net>; Thu, 21 Dec 2023 22:17:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3397983F0E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p3tG4XactKWT for <buildroot@lists.busybox.net>;
 Thu, 21 Dec 2023 22:17:43 +0000 (UTC)
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EDD5083FB3
 for <buildroot@buildroot.org>; Thu, 21 Dec 2023 22:17:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EDD5083FB3
Received: by mail-pf1-x430.google.com with SMTP id
 d2e1a72fcca58-6d3165ac96bso985779b3a.0
 for <buildroot@buildroot.org>; Thu, 21 Dec 2023 14:17:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703197062; x=1703801862;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=C8zwCc71VLGCMS+fGrQOyv8hSMX3ftdDuP2tHjzbvzs=;
 b=Wcut5y7nzPJKoBlTC967TShAVcyi3kcnBrAIcC5jcG0SsgvpBWDXTNP7Mu+D83pLDg
 j5Ki8jAs5aLC2tQMurI9X/Pl0+D6NRZb7T4AtcW1KfgL07/Cpa9oNjJS1329bVetRa3p
 SFUN5q+FMzBhrGzl/G0160M82KC22dyCatfATH0Y6hhitqIfNVVREyRoi1pydVcqOEi1
 QXBZpT0kdaKUvVdLphr9YfZ4HZZGpvGpYktbD1KK6eK0cWqmHkptL7IaEgzopgi/U8op
 HsrbQVjCuvE5ddv+Jx2LcB9VQKvevSSeKgMykGbz7dxC12ce5pMDhl6G0N/+71RsaSEr
 yBhw==
X-Gm-Message-State: AOJu0Yxn7oOuVpxjRhqizvG1QqOr6ttqcTjYy1MbGpsvFmnEi4lbsftL
 sleOAxKuXIrYHcSAnKmv+yNnApU0Gev9+p1ZQ5c=
X-Google-Smtp-Source: AGHT+IGcTXex5A8q94N7woTiB2psrVFAq4FWZ4k6W39iVfbQphznJdgLNVrJscH4mI/YcgRV5iUytPFZd2Bd7sBp238=
X-Received: by 2002:aa7:85cf:0:b0:6d2:a56e:a5df with SMTP id
 z15-20020aa785cf000000b006d2a56ea5dfmr314718pfn.37.1703197062240; Thu, 21 Dec
 2023 14:17:42 -0800 (PST)
MIME-Version: 1.0
References: <20230814215233.745573-1-gregorhaas1997@gmail.com>
 <20230822214755.1af65bb4@windsurf> <20230824192016.GA3722679@scaer>
In-Reply-To: <20230824192016.GA3722679@scaer>
From: Gregor Haas <gregorhaas1997@gmail.com>
Date: Thu, 21 Dec 2023 14:17:06 -0800
Message-ID: <CAMqWt3qTN9xSPQSesrBNcDnGU6trXg=G+i2pNJ3v1Vn25OtGcg@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1703197062; x=1703801862; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=C8zwCc71VLGCMS+fGrQOyv8hSMX3ftdDuP2tHjzbvzs=;
 b=KFTMun1vNDayLkqafHjTf3LVKv1Zl2TmAGWufuIxql9/1i6smcApSRpPLsNQCfOUVh
 eeFMrOeqSr51iQvqbp+zu0/f2lkF/J2SINAC/j/5UKiJZFuJ+6fw13wNMQaqFcCH2jjy
 wSxdW3MoiM87Q/o0kY7bezjRXVO8RD534JxQtNkap9hP69Z8CbF4limq+0LksYDRce8c
 FVy23z74jy6cBxBwc8PW8sAti0V3M2r4Z+H+Tui/JT6yCXrzLWHJGxDMYzsBQKcTQB51
 H99uHH7MbPYqpaK43467cfhJD/eiLT0YvVjJFurt4nMO9hF0hb1/mw3fMcIDQbX8PokM
 Bbiw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=KFTMun1v
Subject: Re: [Buildroot] [PATCH 1/1] package/bmap-tools: add dependency on
 python-six
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgYWxsLAoKSnVzdCB3YW50ZWQgdG8gY2hlY2sgaWYgdGhlcmUgaXMgc3RpbGwgaW50ZXJlc3Qg
aW4gdGhpcyBwYXRjaD8gSSd2ZQpiZWVuIHVzaW5nIFlhbm4ncyBwcm9wb3NhbCBmb3IgYSBmZXcg
bW9udGhzIGFuZCBpdCBzZWVtcyB0byB3b3JrCnJlYWxseSB3ZWxsIGZvciBtZSwgYnV0IGl0IHdv
dWxkIGJlIHVzZWZ1bCBmb3IgbWUgdG8gaGF2ZSBpdCBpbgp1cHN0cmVhbSByYXRoZXIgdGhhbiBj
YXJyeWluZyBhcm91bmQgYSBsb2NhbCBwYXRjaC4KClRoYW5rcywKR3JlZ29yCgpPbiBUaHUsIEF1
ZyAyNCwgMjAyMyBhdCAxMjoyMOKAr1BNIFlhbm4gRS4gTU9SSU4gPHlhbm4ubW9yaW4uMTk5OEBm
cmVlLmZyPiB3cm90ZToKPgo+IFRob21hcywgQWxsLAo+Cj4gT24gMjAyMy0wOC0yMiAyMTo0NyAr
MDIwMCwgVGhvbWFzIFBldGF6em9uaSBzcGFrZSB0aHVzbHk6Cj4gPiBPbiBNb24sIDE0IEF1ZyAy
MDIzIDE0OjUyOjMzIC0wNzAwCj4gPiBHcmVnb3IgSGFhcyA8Z3JlZ29yaGFhczE5OTdAZ21haWwu
Y29tPiB3cm90ZToKPiA+IEZvciB0aGUgaG9zdCBwYWNrYWdlLCBJIGNhbiBpbmRlZWQgcmVwcm9k
dWNlIHRoZSBwcm9ibGVtLiBCdXQgSSB0aGluawo+ID4gdGhlIGlzc3VlIHJlYWxseSBpcyB0aGF0
IGluIHRoZSBmaW5hbCAkKEhPU1RfRElSKSwgd2Uga2VlcCB0aGUgc2hlYmFuZwo+ID4gb2YgdGhl
IFB5dGhvbiBpbnRlcnByZXRlciBwb2ludGluZyB0byB0aGUgcGVyLXBhY2thZ2UgZGlyZWN0b3J5
Lgo+ID4gSW5kZWVkLCBteSByZWFzb25pbmcgaXMgdGhhdCBvdGhlcndpc2Ugd2Ugd2lsbCBoYXZl
IG1hbnkgc2ltaWxhcgo+ID4gcHJvYmxlbXMgd2l0aCBvdGhlciBwYWNrYWdlcywgYXMgdGhpcyBp
cyBicmVha2luZyBhIGZ1bmRhbWVudGFsCj4gPiBhc3N1bXB0aW9uIGluIEJ1aWxkcm9vdC4KPiA+
Cj4gPiBJJ20gdGhpbmtpbmcgYWJvdXQgc29tZXRoaW5nIGxpa2UgdGhpczoKPiA+Cj4gPiBkaWZm
IC0tZ2l0IGEvTWFrZWZpbGUgYi9NYWtlZmlsZQo+ID4gaW5kZXggZjBmZjlhMTQ4MC4uMDBjZTY0
YWIxNSAxMDA2NDQKPiA+IC0tLSBhL01ha2VmaWxlCj4gPiArKysgYi9NYWtlZmlsZQo+ID4gQEAg
LTcxMyw2ICs3MTMsMTUgQEAgU1RBR0lOR19ESVJfRklMRVNfTElTVFMgPSAkKHNvcnQgJCh3aWxk
Y2FyZCAkKEJVSUxEX0RJUikvKi8uZmlsZXMtbGlzdC1zdGFnaW5nLnQKPiA+ICBob3N0LWZpbmFs
aXplOiAkKFBBQ0tBR0VTKSAkKEhPU1RfRElSKSAkKEhPU1RfRElSX1NZTUxJTkspCj4gPiAgICAg
ICAgIEAkKGNhbGwgTUVTU0FHRSwiRmluYWxpemluZyBob3N0IGRpcmVjdG9yeSIpCj4gPiAgICAg
ICAgICQoY2FsbCBwZXItcGFja2FnZS1yc3luYywkKHNvcnQgJChQQUNLQUdFUykpLGhvc3QsJChI
T1NUX0RJUikpCj4gPiAraWZlcSAoJChCUjJfUEVSX1BBQ0tBR0VfRElSRUNUT1JJRVMpLHkpCj4g
PiArICAgICAgICQoUSlncmVwIC0tYmluYXJ5LWZpbGVzPXdpdGhvdXQtbWF0Y2ggLWxyWiAnJChQ
RVJfUEFDS0FHRV9ESVIpL1teL11cKy9ob3N0JyAkKEhPU1RfRElSKSBcCj4gPiArICAgICAgIHx3
aGlsZSByZWFkIC1kICcnIGY7IGRvIFwKPiA+ICsgICAgICAgICAgICAgICBmaWxlIC1iIC0tbWlt
ZS10eXBlICIkJHtmfSIgfCBncmVwIC1xICdedGV4dC8nIHx8IGNvbnRpbnVlOyBcCj4gPiArICAg
ICAgICAgICAgICAgcHJpbnRmICclc1wwJyAiJCR7Zn0iOyBcCj4gPiArICAgICAgIGRvbmUgXAo+
ID4gKyAgICAgICB8eGFyZ3MgLTAgLS1uby1ydW4taWYtZW1wdHkgXAo+ID4gKyAgICAgICAgICAg
ICAgICQoU0VEKSAnczokKFBFUl9QQUNLQUdFX0RJUikvW14vXVwrL2hvc3Q6JChIT1NUX0RJUik6
ZycKPiA+ICtlbmRpZgo+ID4KPiA+ICAuUEhPTlk6IHN0YWdpbmctZmluYWxpemUKPiA+ICBzdGFn
aW5nLWZpbmFsaXplOiAkKFNUQUdJTkdfRElSX1NZTUxJTkspCj4gPgo+ID4gWWFubiwgd2hhdCBk
byB5b3UgdGhpbms/IChMb2dpYyBpcyB0YWtlbiBmcm9tIHBhY2thZ2UvcGtnLWdlbmVyaWMubWss
Cj4gPiB3aGljaCBkb2VzIHRoZSBjb252ZXJzaW9uIGZyb20gcGVyLXBhY2thZ2UgZGlyZWN0b3Jp
ZXMgb2YgZGVwZW5kZW5jaWVzCj4gPiB0byB0aGUgcGVyLXBhY2thZ2UgZGlyZWN0b3J5IG9mIHRo
ZSBwYWNrYWdlIGJlaW5nIGJ1aWx0LCB0aGUgbG9naWMgaGVyZQo+ID4gaXMgc2ltaWxhciwgYnV0
IHdlIHN3aXRjaCBmcm9tIHRoZSBwZXItcGFja2FnZSBkaXJlY3RvcmllcyB0byB0aGUKPiA+IGds
b2JhbCBob3N0IGRpcmVjdG9yeSkKPgo+IFRoZW4gd2Ugd2FudCB0byBhdm9pZCBjb2RlIGR1cGxp
Y2F0aW9uLCB3aHkgY2FuJ3Qgd2UgcmUtdXNlIHRoZSBleGlzdGluZwo+IFBQRF9GSVhVUF9QQVRI
UyBtYWNybz8KPgo+IEl0IG1pZ2h0IG5lZWQgYSBiaXQgb2YgdHdlYWtpbmcsIHRob3VnaDoKPgo+
ICAgLSBmaXJzdCwgd2Ugb25seSBuZWVkIHRvIGZpeHVwIHBhdGhzIGluICQoSE9TVF9ESVIpLCBh
bmQgdGhpcyBpcwo+ICAgICBhbHJlYWR5IHdoYXQgd2UgYXJlIGRvaW5nLgo+Cj4gICAtIHNlY29u
ZCwgd2Ugb25seSBuZWVkIHRvIGZpeCBwYXRoIGZvciBob3N0IHRvb2xzLCBsaWJzIGV0IGFsLiwg
c28KPiAgICAgdGhhdCB0aGV5IGNhbiBzdGlsbCBydW4sIGFuZCBwYXRocyBmb3Igc3RhZ2luZy8g
bGlicyBldCBhbC4sIHNvIHRoYXQKPiAgICAgd2UgY2FuIGxpbmsgYWdhaW5zdC4KPgo+IEhvd2V2
ZXIsIHRoYXQgc2Vjb25kIHBvaW50IGlzIG5vdCB3aGF0IHdlIGFyZSBkb2luZywgYXMgd2UgYXJl
IHR3ZWFraW5nCj4gZXZlcnl0aGluZyBhdCB0aGUgcm9vdCBvZiB0aGUgUFBEOgo+Cj4gICAgICQo
U0VEKSAnczokKFBFUl9QQUNLQUdFX0RJUikvW14vXVwrLzokKFBFUl9QQUNLQUdFX0RJUikvJCgk
KFBLRylfTkFNRSkvOmcnCj4KPiBGdXJ0aGVybW9yZSwgc3RhZ2luZy8gaXMgYSBzdWItZGlyZWN0
b3J5IG9mIGhvc3QvIGFuZCB3ZSBhbHJlYWR5IGFjY291bnQKPiBmb3IgdGhhdCBhcyB3ZSBhcmUg
b25seSBncmVwcGluZyBpbiAkKEhPU1RfRElSKS4gQnV0IHdpdGggdGhlIHNlZCwgd2UKPiByZXBs
YWNlIGEgc2hhbG9vd2VyIHBhdGggdGhhbiBIT1NUX0RJUi4KPgo+IFNvIEkgdGhpbmsgd2UgY2Fu
IGNoYW5nZSB0aGUgZXhpc3RpbmcgUFBEX0ZJWFVQX1BBVEhTIHRvOgo+Cj4gICAgICBkZWZpbmUg
UFBEX0ZJWFVQX1BBVEhTCj4gICAgICAgICAgICAgJChRKWdyZXAgLS1iaW5hcnktZmlsZXM9d2l0
aG91dC1tYXRjaCAtbHJaICckKFBFUl9QQUNLQUdFX0RJUikvW14vXVwrLycgJChIT1NUX0RJUikg
XAo+ICAgICAgICAgICAgIHx3aGlsZSByZWFkIC1kICcnIGY7IGRvIFwKPiAgICAgICAgICAgICAg
ICAgICAgIGZpbGUgLWIgLS1taW1lLXR5cGUgIiQke2Z9IiB8IGdyZXAgLXEgJ150ZXh0LycgfHwg
Y29udGludWU7IFwKPiAgICAgICAgICAgICAgICAgICAgIHByaW50ZiAnJXNcMCcgIiQke2Z9Ijsg
XAo+ICAgICAgICAgICAgIGRvbmUgXAo+ICAgICAgICAgICAgIHx4YXJncyAtMCAtLW5vLXJ1bi1p
Zi1lbXB0eSBcCj4gICAgIC0gICAgICAgICAgICAgICAkKFNFRCkgJ3M6JChQRVJfUEFDS0FHRV9E
SVIpL1teL11cKy86JChQRVJfUEFDS0FHRV9ESVIpLyQoJChQS0cpX05BTUUpLzpnJwo+ICAgICAr
ICAgICAgICAgICAgICAgJChTRUQpICdzOiQoUEVSX1BBQ0tBR0VfRElSKS9bXi9dXCsvaG9zdC86
JChIT1NUX0RJUikvOmcnCj4gICAgICBlbmRlZgo+Cj4gQW5kIHRoZW4sIHdlIGNhbiBleHBhbmQg
dGhhdCBtYWNybyBpbiBib3RoIGNvbnRleHRzOiBQUERfcnN5bmMgYW5kCj4gdGFyZ2V0LWZpbmFs
aXplLgo+Cj4gVGhvdWdodHM/Cj4KPiBSZWdhcmRzLAo+IFlhbm4gRS4gTU9SSU4uCj4KPiAtLQo+
IC4tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0t
LS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uCj4gfCAgWWFubiBFLiBNT1JJTiAgfCBSZWFsLVRpbWUg
RW1iZWRkZWQgfCAvIlwgQVNDSUkgUklCQk9OIHwgRXJpY3MnIGNvbnNwaXJhY3k6IHwKPiB8ICsz
MyA2NjIgMzc2IDA1NiB8IFNvZnR3YXJlICBEZXNpZ25lciB8IFwgLyBDQU1QQUlHTiAgICAgfCAg
X19fICAgICAgICAgICAgICAgfAo+IHwgKzMzIDU2MSAwOTkgNDI3IGAtLS0tLS0tLS0tLS0uLS0t
LS0tLTogIFggIEFHQUlOU1QgICAgICB8ICBcZS8gIFRoZXJlIGlzIG5vICB8Cj4gfCBodHRwOi8v
eW1vcmluLmlzLWEtZ2Vlay5vcmcvIHwgXy8qXF8gfCAvIFwgSFRNTCBNQUlMICAgIHwgICB2ICAg
Y29uc3BpcmFjeS4gIHwKPiAnLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS1e
LS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLS0tJwpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1
aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2J1aWxkcm9vdAo=
