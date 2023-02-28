Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6371EC64ED6
	for <buildroot@archiver.kernel.org>; Tue, 28 Feb 2023 17:03:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0657F8198D;
	Tue, 28 Feb 2023 17:03:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0657F8198D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v67Po6xOjX13; Tue, 28 Feb 2023 17:03:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5FCA481A34;
	Tue, 28 Feb 2023 17:03:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5FCA481A34
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A704A1BF20F
 for <buildroot@lists.busybox.net>; Tue, 28 Feb 2023 17:03:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8007A818A2
 for <buildroot@lists.busybox.net>; Tue, 28 Feb 2023 17:03:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8007A818A2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fCY-ZCQlxD9K for <buildroot@lists.busybox.net>;
 Tue, 28 Feb 2023 17:03:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 569D88132F
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 569D88132F
 for <buildroot@buildroot.org>; Tue, 28 Feb 2023 17:03:31 +0000 (UTC)
Received: by mail-pj1-x102b.google.com with SMTP id
 m3-20020a17090ade0300b00229eec90a7fso2034247pjv.0
 for <buildroot@buildroot.org>; Tue, 28 Feb 2023 09:03:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677603811;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2fcdJLuwCLoThyAxFa8e2pzCQMZ//EliAemy9/v4GeQ=;
 b=Pz9dI7zHBWyp3u2ONvqM/o6vCx3dzajSd5I7gkkVj6jJEIJw+42j/VHrBMo1h5Y5gG
 PRKe3W0KtcZq7CLn0HiLBubFoU0esHKOpWltKHZYm/2QG+toaJsByZUU8TK9ffYwnmtt
 xlWPbsuzkiCJFnGShdGu1MPgBIBumspUJ4135pkiX/9r8RO5yQaZGQ+XaXuxLTYtvrOj
 5C302vw5UAKFiMW+apeCUnF/nmdyyHOr7fsCKn9/OJy+Tuya4j/7kCbxpXq+WGTEoaB8
 prGjX4cvXFYHRelwMfkL6mdmziS2loB/qd4OHkntXciDmVJ94eHK2p7s3Ul4cVBSuzz+
 /bCQ==
X-Gm-Message-State: AO0yUKXn0MwIZ0Uxwpn5fBnhokWR9JY/f3aebnLZ5/C15MHVPCLKDHbc
 Pd7C7kv/1u0H1KMWQXtN6EX3aW3sBLLA5paHUvbW+g==
X-Google-Smtp-Source: AK7set8AykJ6LAQy+5jl1RnY/37fC51ecC8lbruYmT0X56HHd9QjfD3VDcOn58Zb3cGEtU6MYVDx2cZT51uCeJPh8gU=
X-Received: by 2002:a17:903:1d1:b0:19c:cb32:bfef with SMTP id
 e17-20020a17090301d100b0019ccb32bfefmr1340664plh.3.1677603810658; Tue, 28 Feb
 2023 09:03:30 -0800 (PST)
MIME-Version: 1.0
References: <20221224171920.11256-1-raphael.pavlidis@gmail.com>
 <20230222232157.380b6109@windsurf>
 <20230228130843.GC32199@carcass.dev.6wind.com>
 <CANqv2T3GWoqn6an34HQUW6njK2g=YZCqvoDMh-kfKooVacRMpA@mail.gmail.com>
 <886d6be9-94ba-2bc9-5583-4c9400bf3a76@gmail.com>
In-Reply-To: <886d6be9-94ba-2bc9-5583-4c9400bf3a76@gmail.com>
From: stephane gonauer <stephane.gonauer@6wind.com>
Date: Tue, 28 Feb 2023 18:03:20 +0100
Message-ID: <CANqv2T2r0sbnwdMinzdw7ryw9CUsx=jwCD0hvA3FT2mxVFQz8g@mail.gmail.com>
To: Raphael Pavlidis <raphael.pavlidis@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=6wind.com; s=google; t=1677603811;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2fcdJLuwCLoThyAxFa8e2pzCQMZ//EliAemy9/v4GeQ=;
 b=Z9RVWuTCuewJl/rUmxaH0fKpN4LCjPw46qZsdd4JQy0oh4+b2oSufo+vW8aOA95BeL
 XK16QOpQu2s1x9pynyfZ0ruOE7QcB5f/a5CXNPLmjE3kz9KTa2Jn9lLeViAmsrKdMtmr
 9HLlIC6Cd3Xa9yRgd6Il1t6ImP9wf7gYl3d29a7xUJmSNZoRhV+oDxAc3g1YDYHRLj3+
 6g7kjcoIe4X8HdvrjMVa4owr6Lw7Up+GZFkL5BqAp2HuBKhwX2tolBZulMUT1kkMo+9Z
 XKQO+hZooehFBHH6W88ZlauX9+anjer6Czl84Oer2tRPRsmokKHfrLhg0b1rVPd54BuY
 +X+w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=6wind.com header.i=@6wind.com
 header.a=rsa-sha256 header.s=google header.b=Z9RVWuTC
Subject: Re: [Buildroot] [PATCH v4 1/1] package/shadow: new package
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGksCgpZZXMgaXQgYWxzbyBvY2N1cnMgd2l0aCAgQlIyX1BBQ0tBR0VfTElOVVhfUEFNICoqYW5k
KiogQlIyX1BBQ0tBR0VfU0hBRE9XCnNoYWRvdyBkb2Vzbid0IGluc3RhbGwgL2V0Yy9wYW0uZC9z
eXN0ZW0tYXV0aAoKTWFudWFsbHkgYWRkaW5nIHRoZSBvbmUgaXNzdWVkIGZyb20gc3lzdGVtZCBp
bnRvIHRoZSB0YXJnZXQgZm9sZGVyCnNvbHZlcyB0aGUgaXNzdWUuCgpXaGF0IHdvdWxkIGJlIHRo
ZSBnb29kIHdheSB0byBnbyA/CkFkZGluZyBhIHBhdGNoIHRoYXQgaW5zdGFsbHMgYSBzeXN0ZW0t
YXV0aCB0byB0aGUgc2hhZG93IHBhY2thZ2UgPyBBbmQKdGhlbiB3aGF0IHNob3VsZCBiZSBpdHMg
Y29udGVudCA/IFRoZSBzYW1lIGFzIHRoZSBzeXN0ZW1kIGZpbGUgPwoKU3TDqXBoYW5lCgpMZSBt
YXIuIDI4IGbDqXZyLiAyMDIzIMOgIDE3OjUxLCBSYXBoYWVsIFBhdmxpZGlzCjxyYXBoYWVsLnBh
dmxpZGlzQGdtYWlsLmNvbT4gYSDDqWNyaXQgOgo+Cj4gSGkgU3RlcGhhbmUsCj4KPiBPbiAyOC4w
Mi4yMyAxNTozOCwgc3RlcGhhbmUgZ29uYXVlciB3cm90ZToKPiA+IEhpLAo+ID4KPiBbU05JUF0K
PiA+Cj4gPiBUaGUgaXNzdWUgY2FuIGJlIHJlcHJvZHVjZSB3aXRoIGEgc2ltcGxlciBjb25maWd1
cmF0aW9uLiBFbmFibGluZyBib3RoCj4gPiBCUjJfUEFDS0FHRV9MSU5VWF9QQU0gYW5kIEJSMl9Q
QUNLQUdFX1NIQURPVyBicmVha3MgdGhlIGxvZ2luLgo+ID4gSGVyZSBmb2xsb3cgYSBkZWZjb25m
aWcgdGhhdCByZXByb2R1Y2VzIHRoZSBpc3N1ZSA6Cj4KPiBEb2VzIGl0IG9ubHkgaGFwcGVucyBp
ZiBCUjJfUEFDS0FHRV9MSU5VWF9QQU0gKiphbmQqKiBCUjJfUEFDS0FHRV9TSEFET1cKPiBpcyBl
bmFibGVkPwo+Cj4gPgo+ID4gL2V0Yy9wYW0uZCByZWZlcmVuY2UgYSBzeXN0ZW0tYXV0aCB0aGF0
IGlzIG5vdCBwcmVzZW50IGFueXdoZXJlIGluIHRoZQo+ID4gYnVpbGQgZGlyZWN0b3J5LiBUaGlz
IG1pZ2h0IGJlIHRoZSByb290IGNhdXNlIGJ1dCBJJ20gbm90IHN1cmUgaG93IHRvCj4gPiBwcm9w
ZXJseSB0ZXN0Lgo+Cj4gSWYgc3lzdGVtLWF1dGggaXMgb25seSBsb2NhdGVkIGluIC91c3Ivc2hh
cmUvZmFjdG9yeS9ldGMvcGFtLmQvIGFuZCBub3QKPiBhbHNvIGluIC9ldGMvcGFtLmQvIGR1cmlu
ZyBib290IHRoZW4gc29tZXRoaW5nIGlzIHdyb25nIHdpdGggdGhlCj4gc3lzdGVtZC10bXBmaWxl
cyBzZXJ2aWNlLgo+Cj4gPgo+ID4gLS0tLS0tLS0tLS0tLS0tCj4gPiB1aWxkcm9vdC9jb25maWdz
JCBjYXQgcWVtdV94ODZfNjRfZGVmY29uZmlnCj4gPiBCUjJfeDg2XzY0PXkKPiBbU05JUF0KPgo+
IEkgYW0gbm90IHNvIGZpdCBpbiBxZW11LiBDYW4geW91IHByb3ZpZGUgbWUgdGhlIHFlbXUgY29t
bWFuZCwgc28gSSBjYW4KPiByZXByb2R1Y2UgaXQsIHBsZWFzZT8KPgo+Cj4gVGhhbmtzLAo+IFJh
cGhhZWwgUGF2bGlkaXMKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRw
czovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
