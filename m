Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39BF7C7EE29
	for <buildroot@archiver.kernel.org>; Tue, 13 Jun 2023 05:56:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7AE5F60DF6;
	Tue, 13 Jun 2023 05:56:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7AE5F60DF6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GMJtsgVdxO81; Tue, 13 Jun 2023 05:56:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4CE3C60E28;
	Tue, 13 Jun 2023 05:56:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4CE3C60E28
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2B5A11BF361
 for <buildroot@lists.busybox.net>; Tue, 13 Jun 2023 05:56:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F294C822D8
 for <buildroot@lists.busybox.net>; Tue, 13 Jun 2023 05:56:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F294C822D8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hjKMOFLYfWpx for <buildroot@lists.busybox.net>;
 Tue, 13 Jun 2023 05:56:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8242682268
Received: from mail-qv1-xf35.google.com (mail-qv1-xf35.google.com
 [IPv6:2607:f8b0:4864:20::f35])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8242682268
 for <buildroot@buildroot.org>; Tue, 13 Jun 2023 05:56:30 +0000 (UTC)
Received: by mail-qv1-xf35.google.com with SMTP id
 6a1803df08f44-5ed99ebe076so5893786d6.2
 for <buildroot@buildroot.org>; Mon, 12 Jun 2023 22:56:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686635789; x=1689227789;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QjREdKNNnX1q7Q9+IhWhqHD8O5k7en0jNHrx66u0Ydg=;
 b=RQMRVEAfi3idlT/Suv4lrsYU6yRL0r8JLuFc+u6DV9m5gDOdnt7McN43rY30E78vbf
 a7WQgxolg8+1k5pOkgUFvR+wETT5BOzKtD2IJ0s+x6IPBqrymibXX8ZzY+VRM7c41WHn
 HcSi0f6HhgI/kP9DnmK/ak5ZRF5R7QmAIB469cu9qJYPga5/OiOY7JTLSA+wsRQstcKG
 oxJAEAqBtOih0nWUXUhskhEU03A5GF96FUbgeBL87Qj9oZ3KSu7Ga4qI6HOf9YuG2xsP
 O8FgAM0F3TZZ1FyX3x8X7/EnkzeL9zDX4+LnsIFg/rUiypXnFWmvT/jZJ/7o5MZhC22R
 +gHQ==
X-Gm-Message-State: AC+VfDy9L5BB2DaV7XF4zHj1Xo1thbm4cJAtrNRa86OsGN1p/bGL+Mh6
 1AaHMOwzVijI6TYjc3UQD7XD1uyQIJjl224I9EI=
X-Google-Smtp-Source: ACHHUZ4d4IbP5Zh3pNNggx162A7vZ1bTGZ7MIrKJ5kUZk0q9j/JdPO/g3BuUQykTKlYb8gaNHn+iiqCxw1cujOxSI6g=
X-Received: by 2002:ad4:5aad:0:b0:62d:ef3a:465f with SMTP id
 u13-20020ad45aad000000b0062def3a465fmr4614378qvg.0.1686635789264; Mon, 12 Jun
 2023 22:56:29 -0700 (PDT)
MIME-Version: 1.0
References: <70cc5213bb4d4e4d8e4b21b1c7122daf@ti.com>
 <20230608063000.882363-1-patrick.oppenlander@gmail.com>
 <b043f10789294e3d9bdb56e551933c69@ti.com>
 <20230608155955.m7rqwkencyowlvqo@dasso>
In-Reply-To: <20230608155955.m7rqwkencyowlvqo@dasso>
From: Patrick Oppenlander <patrick.oppenlander@gmail.com>
Date: Tue, 13 Jun 2023 15:56:18 +1000
Message-ID: <CAEg67GkqywVus_0fWEXOj9xEi0VQBoyWdL9GeGj+P1zp0KQpsg@mail.gmail.com>
To: Andreas Dannenberg <dannenberg@ti.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686635789; x=1689227789;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QjREdKNNnX1q7Q9+IhWhqHD8O5k7en0jNHrx66u0Ydg=;
 b=SfawxpNLDRy86hzTlI5EGDP/0TyRBVLsDsZnGuPt0dGQ7IXzCp8npI/IUSaz75gL3D
 1P1i/7xCWwEKKmGL1qeNWBiVS8F9KaA/ftFcScKgVrCGgUIpst1h4vwB717Y9BOmiblE
 ZBaLZEGWddIbF8sDdt7lj4baImI1oxL6c0dHRl5+XO2P5w2739Wk3242MWQgGw6wMLMy
 wMDKU8uNy2SIVRGg5VaSaJb+f/2WLHYjOFX7OojM0W/aNs36ok0/hpoYCFjp+XGS+dsB
 aWlpSrvrfe1IwvbFNiBukn/ckMlJxgL0lfm5RCUGySEJHKDYHsKwSqE5WsNyfmZTzap6
 NQMQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=SfawxpNL
Subject: Re: [Buildroot] [PATCH v7 0/3] add support for TI's AM64x boards
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
Cc: "Brattlof, Bryan" <bb@ti.com>, "Davis, Andrew" <afd@ti.com>,
 "X15000177@gmail.com" <X15000177@gmail.com>, "ju.o@free.fr" <ju.o@free.fr>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>,
 "giulio.benetti@benettiengineering.com"
 <giulio.benetti@benettiengineering.com>,
 "romain.naour@gmail.com" <romain.naour@gmail.com>, "Gadiyar,
 Anand" <gadiyar@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gRnJpLCBKdW4gOSwgMjAyMyBhdCAyOjAw4oCvQU0gQW5kcmVhcyBEYW5uZW5iZXJnIDxkYW5u
ZW5iZXJnQHRpLmNvbT4gd3JvdGU6Cj4KPiBBbGwsCj4KPiBPbiBUaHUsIEp1biAwOCwgMjAyMyBh
dCAwMToyOTowMlBNICswMDAwLCBHYWRpeWFyLCBBbmFuZCB2aWEgYnVpbGRyb290IHdyb3RlOgo+
ID4gPiBGcm9tOiBwYXRyaWNrLm9wcGVubGFuZGVyQGdtYWlsLmNvbSA8cGF0cmljay5vcHBlbmxh
bmRlckBnbWFpbC5jb20+Cj4gPiA+Cj4gPiA+IEhpLAo+ID4gPgo+ID4gPiBJJ20gbG9va2luZyB0
byB1c2UgYnVpbGRyb290IHdpdGggYSBQSFlURUMgcGh5Q09SRS1BTTY0eCBTT00gd2hpY2ggaXMg
YmFzZWQgb24KPiA+ID4gdGhlIHNhbWUgVEkgcGFydCBhcyB0aGUgU0stQU02NC9TSy1BTTY0Qi4g
SGFwcHkgdG8gcG9zdCBwYXRjaGVzIGlmIEkgaGFwcGVuIHRvIGJlIHN1Y2Nlc3NmdWwuCj4gPiA+
Cj4gPiA+IElkZWFsbHkgaXQgd291bGQgYmUgZWFzaWVzdCB0byBidWlsZCBzdXBwb3J0IGZvciB0
aGUgU09NIG9uIHRvcCBvZiB0aGVzZQo+ID4gPiBwYXRjaGVzLiBJcyB0aGlzIHNlcmllcyBzdGls
bCBhbGl2ZT8KPiA+Cj4gPiBIaSBQYXRyaWNrLAo+ID4KPiA+IEkgZ2F2ZSB1cCBhZnRlciB0aGUg
bGFzdCByb3VuZCBvZiByZXZpZXcgY29tbWVudHMsIGJ1dCB0aGVyZSBpcyBzb21lb25lCj4gPiBh
dCBUSSB3aG8gaGFzIHRha2VuIGl0IHVwIGFnYWluIHJlY2VudGx5Lgo+ID4KPiA+IFRoZXkncmUg
Zm9jdXNpbmcgb24gdGhlIEFNNjJ4IGluY2x1ZGluZyBvdGhlciBnb29kaWVzIGxpa2UgZGlzcGxh
eSBhbmQgR1BVLCBhbmQKPiA+IGhhcyBhIHdvcmtpbmcgYmFzZWxpbmUuIEhlIHdhcyBwbGFubmlu
ZyB0byBwb3N0IHRoZSBzZXJpZXMgdXBzdHJlYW0gc2hvcnRseSBhZnRlci4KPgo+IEkgd29yayBm
b3IgVEkgYW5kIGhhdmUgc2luY2UgcGlja2VkIHVwIHRoZSB3b3JrIG9uIHRoZSB2NyBwYXRjaCBz
ZXJpZXMKPiB0aGF0IEFuYW5kIGFuZCBvdGhlcnMgbGFzdCB3b3JrZWQgb24uIEkndmUgYmVlbiBm
b3J3YXJkIHBvcnRpbmcgdGhlCj4gZXhpc2l0aW5nIHBhdGNoZXMgb24gdG9wIG9mIHRoZSBsYXRl
c3QgJ21hc3RlcicgY29tbWl0LCBkb2luZyBzb21lCj4gZnVydGhlciBjbGVhbnVwIGFsc28gY29u
c2lkZXJpbmcgdjcgZmVlZGJhY2ssIHBsdXMgbWFraW5nIGVuaGFuY2VtZW50cwo+IG5lZWRlZCB0
byBiZXR0ZXIgc3VwcG9ydCBUSSBLMyBTb0NzLiBJJ3ZlIGFsc28gYWRkZWQgQU02Mnggc3VwcG9y
dCwgYW5kCj4gY3VycmVudGx5IHdvcmtpbmcgb24gYWRkaW5nIEdQVSBzdXBwb3J0IGZvciBBTTYy
eCAoSSBoYXZlIGl0IGFscmVhZHkKPiB3b3JraW5nIGJlaW5nIGFibGUgdG8gcnVuIFdlc3RvbiBh
bmQgQ2hvY29sYXRlIERvb20gZm9yIHRlc3RpbmcKPiBwdXJwb3NlcywganVzdCBuZWVkcyBzb21l
IG1vcmUgY2xlYW51cCkuCj4KPiBNeSBpbnRlcm1lZGlhdGUgd29yayBpcyBwb3N0ZWQgaGVyZSBb
MV0gdG9nZXRoZXIgd2l0aCBzb21lIGluc3RydWN0aW9ucwo+IGFuZCBob3cgdG8gZ2V0IGl0IHRv
IHdvcmsgZm9yIGFueWJvZHkgaW50ZXJlc3RlZCBpbiB0aGUgZnVsbCBzb2x1dGlvbgo+ICp0b2Rh
eSouCgpUaGFua3MuIEkgd2FzIGFibGUgdG8gZ2V0IHRoZSBQSFlURUMgYm9hcmQgd29ya2luZyB1
c2luZyB5b3VyIHBhdGNoZXMKYXMgYSBzdGFydGluZyBwb2ludC4KCj4gTXkgcGxhbiBpcyBvbmNl
IEdQVSBzdXBwb3J0IGlzIGNvbXBsZXRlIGFuZCBjbGVhbmVkIHVwIEknbGwgcG9zdCBhIHY4Cj4g
c2VyaWVzIHRvIHRoaXMgbWFpbGluZyBsaXN0IGhlcmUgd2l0aCBldmVyeXRoaW5nIGluIGl0LCBh
bmQgd29yayB3aXRoCj4gdGhlIGNvbW11bml0eSBvbiBhbnkgZnVydGhlciBjbGVhbnVwIHRoYXQg
bWF5IGJlIG5lZWRlZC4gSSBleHBlY3QgdG8gYmUKPiBhYmxlIHRvIHN0YXJ0IHRoaXMgcHJvY2Vz
cyBuZXh0IHdlZWsuIFNvIEknZCBhcHByZWNpYXRlIGlmIHdlIGNhbgo+IHJlZnJhaW4gZnJvbSBw
b3N0aW5nIGFkZGl0aW9uYWwgVEkgSzMgcGF0Y2hlcyB1bnRpbCB0aGVuLgo+Cj4gT25jZSBtZXJn
ZWQsIHRoZSB0ZW1wb3JhcnkgcGFnZSBbMV0gd2lsbCBnZXQgdXBkYXRlZCBhbmQvb3IgZGlzbWFu
dGxlZC4KPiBJdCBpcyBjZXJ0YWlubHkgbm90IG1lYW50IHRvIGJlIGEgImZvcmtlZCBzb2x1dGlv
biIgb2Ygc29ydHMsIGFuZCB3YXMKPiBvbmx5IGludGVuZGVkIHRvIGJlIGEgc3RvcC1nYXAgbWVh
c3VyZSBmb3Igc29tZSBpbW1lZGlhdGUgY3VzdG9tZXIgbmVlZHMKPiB3ZSBoYWQgaGVyZSBhdCBU
SS4KCkkgbG9vayBmb3J3YXJkIHRvIHNlZWluZyBpdCBtZXJnZWQsCgpQYXRyaWNrCgo+IFRoYW5r
cywKPgo+IC0tCj4gQW5kcmVhcyBEYW5uZW5iZXJnCj4gVGV4YXMgSW5zdHJ1bWVudHMgSW5jCj4K
PiBbMV0gaHR0cHM6Ly9lMmUudGkuY29tL3N1cHBvcnQvcHJvY2Vzc29ycy1ncm91cC9wcm9jZXNz
b3JzL2YvcHJvY2Vzc29ycy1mb3J1bS8xMjI2ODE1L2ZhcS1idWlsZHJvb3Qtc3VwcG9ydC1mb3It
c2l0YXJhLWFtNjJ4LWFtNjJheC1hbTY0eC1kZXZpY2VzCj4KPiA+Cj4gPiBUaGUgc2VyaWVzIDcg
c2hvdWxkIHN0aWxsIHdvcmsgZnVuY3Rpb25hbGx5LiBBbGwgdGhlIHJldmlldyBjb21tZW50cyB3
ZXJlCj4gPiB2YWxpZCB0aG91Z2ggYW5kIG1pZ2h0IGJlIGVhc3kgdG8gYWRkcmVzcyBpZiB5b3Ug
d2FudCB0byBzdGFydCBmcm9tIHRoZXJlLgo+ID4KPiA+IFNpbmNlIHRoZXJlIGlzIGNvbW11bml0
eSBpbnRlcmVzdCBpbiBoYXZpbmcgQU02NHggc3VwcG9ydCwgSSB3b3VsZCBsb3ZlIHRvCj4gPiB0
YWtlIHRoaXMgdXAgYWdhaW4uCj4gPgo+ID4gQmVzdCBSZWdhcmRzLAo+ID4gQW5hbmQKPiA+IF9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gPiBidWlsZHJv
b3QgbWFpbGluZyBsaXN0Cj4gPiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+ID4gaHR0cHM6Ly9s
aXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxp
c3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21h
aWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
