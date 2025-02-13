Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8725C0219D
	for <buildroot@archiver.kernel.org>; Thu, 13 Feb 2025 08:19:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5919661175;
	Thu, 13 Feb 2025 08:19:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6zIxjjmmcbD2; Thu, 13 Feb 2025 08:19:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 30D8A6116A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 30D8A6116A;
	Thu, 13 Feb 2025 08:19:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1CD2A199
 for <buildroot@buildroot.org>; Thu, 13 Feb 2025 08:19:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 018A280EE2
 for <buildroot@buildroot.org>; Thu, 13 Feb 2025 08:19:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LDxUgZ8jcBT8 for <buildroot@buildroot.org>;
 Thu, 13 Feb 2025 08:19:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12d; helo=mail-lf1-x12d.google.com;
 envelope-from=fancp2007@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B539D80E93
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B539D80E93
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B539D80E93
 for <buildroot@buildroot.org>; Thu, 13 Feb 2025 08:19:40 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-54505c79649so456885e87.3
 for <buildroot@buildroot.org>; Thu, 13 Feb 2025 00:19:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739434778; x=1740039578;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4DMf2BFQELO75g6GnKdEb5Pv/qZc4cuKBm8SIoWjqcU=;
 b=tvka1jHn3eoxomyqmtOkK4eu9YLB+KOC6pWU1iW9+yAHdtq/ioe96+FKbreXfM90+s
 N+k4YBKToGw7iOCt9N3ms0YADGKQF58UKbvvgJdDTWb0z1iE3cIA/MqrJ4umf4GE/0eO
 bIYlzNMGt3G5w67+OhGQWD4RvR5yEtknZVqoNjFNoQAS+7X9IcTYzB2CN1GOoG601uKM
 ggqqig6EfpfH+APzo7DPtuXanfhZw7WWup8ivf/ReKM3S6MyZRaFTUvcY6VvMFjJzIDl
 IqnRPPrHAGKp0oT1aIhjxs6+eHkT2MeR8G+0cgsx9cEutJyfQMI2QRsSIxVy71rl/kby
 jLAQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVIHFI+xwCjR6tE6KFFbp2zKdG7r3VvIW6HY5Zb8LqVcIkrsDPwk4c33TNhC6w3Qh/Izj7SeHxm/Ds=@buildroot.org
X-Gm-Message-State: AOJu0Yzwc3vMPQ9+sc2IkvdDXpjNogG5/fec2R3cx7yOTj5Ss7lY163/
 PFF7Z/jGf9674gj2vC0NGoaG5NnSF5z36kVv2mak9Lck4ANIq3g8Ek0PWvBaUlCer0Z5PaBWP33
 ONolbh1njnOx04wJdMyNQwdAq79Q=
X-Gm-Gg: ASbGnctgygcqOOi7ijJ6CuEym2Z2AayHmVmZ5Ab1uy1pnj7k36wniUagMAW3rW6Q4u/
 aUAakXpt9NEkV3k9kx3JWXcXm/f9a3dNBs/p1WKjwXkpMAZUMO6RdtxBEooj7VO+gyPBTF0nZRA
 ==
X-Google-Smtp-Source: AGHT+IG8IFpToemCLvK5qg8nkJDFElfzeWlYf1QW8Px/fmXoe3zhLWW2YuOv5O3fhD4LmxS0M/mAOlZ7rC4dv30a7kw=
X-Received: by 2002:ac2:5f50:0:b0:545:10e1:b1c9 with SMTP id
 2adb3069b0e04-5451dd8fd9cmr603297e87.20.1739434777905; Thu, 13 Feb 2025
 00:19:37 -0800 (PST)
MIME-Version: 1.0
References: <20250212135027.759121-1-fancp2007@gmail.com>
 <87tt8znsuq.fsf@tarshish>
 <30ddb8d5-72c7-475c-a02e-6b9160cbaae9@gmx.de>
 <CAFkzVZYXo0EALs-dV=VgnSYhOh28YT9wip99UVutHcuesEfw2g@mail.gmail.com>
 <CA+R_depGhKXfGn2BUxGd+HkiWgY4ip2ZAm5ObwWJA4B6Bh4GpA@mail.gmail.com>
In-Reply-To: <CA+R_depGhKXfGn2BUxGd+HkiWgY4ip2ZAm5ObwWJA4B6Bh4GpA@mail.gmail.com>
From: Scott Fan <fancp2007@gmail.com>
Date: Thu, 13 Feb 2025 16:19:26 +0800
X-Gm-Features: AWEUYZkSqldpOWEzPX40jL8azqGo9cRQTwAbcs0CTC8Re8_Y7I5-OgLajcCEnGA
Message-ID: <CAFkzVZaAP3iZRZf0e072CQgHiTiTrdL-ndTV9JWBsfYpy2dhYA@mail.gmail.com>
To: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Cc: Fiona Klute <fiona.klute@gmx.de>, Bernd Kuhls <bernd@kuhls.net>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739434778; x=1740039578; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4DMf2BFQELO75g6GnKdEb5Pv/qZc4cuKBm8SIoWjqcU=;
 b=Naz6LW6xE3pQx88FZPbG5IIt/g2UBw7zaxwKYeyXgTiyy8xay2aVla48biRmNqjeie
 NUK6jI7mr6FqjauxTF91vAQ8sUhGmvtwr0N5j+0fQmu02ZuP4DRogWG6qOVwiDT9uNuw
 ibWWZbezWQleLcwSpUu8gV15J1qX9PszcFlS9pUGFXY59AsIWLBy4OP6VQumuIqRDajH
 aY3QIv85Pnl3tNkY7cpadOLgTyoa7q3/mD2Dk7OEzYgX++N9DQh19j2AeNkboUPh5EYG
 6cMMyxjeJUDXA1inxG+vO4ArUPmYzrrpa050rwPRjpkMSpLkrKSOBgFRTtsyQFFKDqve
 Yo1g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Naz6LW6x
Subject: Re: [Buildroot] [PATCH] package/sqlite: fix build issue since bump
 to 3.49.0
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

SGksCgpJIGhhZCB0ZXN0ZWQgdGhlIHBhdGNoIHYyIHdpdGggdGhlIGRlZmNvbmZpZzoKJCBjYXQg
ZGVmY29uZmlnCkJSMl9hYXJjaDY0PXkKQlIyX1RPT0xDSEFJTl9CVUlMRFJPT1RfQ1hYPXkKQlIy
X1BBQ0tBR0VfTkZTX1VUSUxTPXkKCkV2ZXJ5dGhpbmcgaXMgT0suIFRoZSAic3FsaXRlIiBhbmQg
Imhvc3Qtc3FsaXRlIiB0YXJnZXRzIHRoYXQgdGhlCm5mc191dGlscyBwYWNrYWdlIGRlcGVuZHMg
b24gYXJlIGJvdGggY29tcGlsZWQgYW5kIHBhc3NlZC4KCgpTY290dCBGYW4KCk9uIFRodSwgRmVi
IDEzLCAyMDI1IGF0IDI6MznigK9QTSBSb3kgS29sbGVuIFN2ZW5kc2VuCjxyb3lrb2xsZW5zdmVu
ZHNlbkBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gSGksCj4KPiBGaXhlczoKPiAyMDI1LTAyLTEzVDA2
OjQ4OjE4ID4+PiBzcWxpdGUgMy40OS4wIENvbmZpZ3VyaW5nCj4gLi4uCj4gMjAyNS0wMi0xM1Qw
Njo0ODoxOSBFcnJvcjogVW5rbm93biBvcHRpb24gLS10YXJnZXQKPgo+IFRlc3RlZC1CeTogUm95
IEtvbGxlbiBTdmVuZHNlbiA8cm95a29sbGVuc3ZlbmRzZW5AZ21haWwuY29tPgo+Cj4KPiB0b3Iu
IDEzLiBmZWIuIDIwMjUga2wuIDA0OjU5IHNrcmV2IFNjb3R0IEZhbiA8ZmFuY3AyMDA3QGdtYWls
LmNvbT46Cj4+Cj4+IEhpCj4+Cj4+IE9uIFdlZCwgRmViIDEyLCAyMDI1IGF0IDExOjQ34oCvUE0g
RmlvbmEgS2x1dGUgdmlhIGJ1aWxkcm9vdAo+PiA8YnVpbGRyb290QGJ1aWxkcm9vdC5vcmc+IHdy
b3RlOgo+PiA+Cj4+ID4gSGkgU2NvdHQsIEJhcnVjaCEKPj4gPgo+PiA+IEFtIDEyLjAyLjI1IHVt
IDE1OjI0IHNjaHJpZWIgQmFydWNoIFNpYWNoIHZpYSBidWlsZHJvb3Q6Cj4+ID4gPiBIaSBTY290
dCwKPj4gPiA+Cj4+ID4gPiBPbiBXZWQsIEZlYiAxMiAyMDI1LCBTY290dCBGYW4gd3JvdGU6Cj4+
ID4gPj4gQXMgb2YgcmVsZWFzZSAzLjQ5LjAsIHRoZSBhdXRob3IgaGFzIHJlcGxhY2VkIHRoZSBj
b25maWd1cmUgc2NyaXB0IHVzZWQgaW4KPj4gPiA+PiB0aGUgcHJlY29tcGlsZWQgYW1hbGdhbWF0
aW9uIHRhcmJhbGwgd2l0aCBBdXRvc2V0dXAgaW5zdGVhZCBvZiBBdXRvdG9vbHMuCj4+ID4gPj4K
Pj4gPiA+PiBGaXhlczoKPj4gPiA+PiAgICBodHRwczovL2F1dG9idWlsZC5idWlsZHJvb3Qub3Jn
Lz9yZWFzb249c3FsaXRlLTMuNDkuMAo+PiA+ID4+Cj4+ID4gPj4gU2lnbmVkLW9mZi1ieTogU2Nv
dHQgRmFuIDxmYW5jcDIwMDdAZ21haWwuY29tPgo+PiA+Cj4+ID4gVG9nZXRoZXIgd2l0aCB0aGUg
Imhvc3QtZ2VuZXJpYy1wYWNrYWdlIiBCYXJ1Y2ggcG9pbnRlZCBvdXQgdGhpcyBmaXhlZAo+PiA+
IG15IGJ1aWxkLCB0aGFua3MhIE9uZSB0aGluZyBsb29rcyBvZGQgdGhvdWdoLCBzZWUgYmVsb3cu
Cj4+Cj4+IEkgd2lsbCBhZGQgdGhlIG1pc3NpbmcgY29uZmlndXJhdGlvbnMgZm9yIHRoZSAiaG9z
dC1nZW5lcmljLXBhY2thZ2UiLgo+Pgo+PiA+Cj4+ID4gQmVzdCByZWdhcmRzLAo+PiA+IEZpb25h
Cj4+ID4KPj4gPiA+PiAtLS0KPj4gPiA+PiAgIHBhY2thZ2Uvc3FsaXRlL3NxbGl0ZS5tayB8IDU5
ICsrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0KPj4gPiA+PiAgIDEgZmls
ZSBjaGFuZ2VkLCAzNiBpbnNlcnRpb25zKCspLCAyMyBkZWxldGlvbnMoLSkKPj4gPiA+Pgo+PiA+
ID4+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3NxbGl0ZS9zcWxpdGUubWsgYi9wYWNrYWdlL3NxbGl0
ZS9zcWxpdGUubWsKPj4gPiA+PiBpbmRleCBhMjNmNmUxZDY2Li4zMDM4NWY5ODIxIDEwMDY0NAo+
PiA+ID4+IC0tLSBhL3BhY2thZ2Uvc3FsaXRlL3NxbGl0ZS5tawo+PiA+ID4+ICsrKyBiL3BhY2th
Z2Uvc3FsaXRlL3NxbGl0ZS5tawo+PiA+ID4+IEBAIC0yMSwxNCArMjEsNiBAQCBpZmVxICgkKEJS
Ml9QQUNLQUdFX1NRTElURV9FTkFCTEVfQ09MVU1OX01FVEFEQVRBKSx5KQo+PiA+ID4+ICAgU1FM
SVRFX0NGTEFHUyArPSAtRFNRTElURV9FTkFCTEVfQ09MVU1OX01FVEFEQVRBCj4+ID4gPj4gICBl
bmRpZgo+PiA+ID4+Cj4+ID4gPj4gLWlmZXEgKCQoQlIyX1BBQ0tBR0VfU1FMSVRFX0VOQUJMRV9G
VFMzKSx5KQo+PiA+ID4+IC1TUUxJVEVfQ0ZMQUdTICs9IC1EU1FMSVRFX0VOQUJMRV9GVFMzCj4+
ID4gPj4gLWVuZGlmCj4+ID4gPj4gLQo+PiA+ID4+IC1pZmVxICgkKEJSMl9QQUNLQUdFX1NRTElU
RV9FTkFCTEVfSlNPTjEpLHkpCj4+ID4gPj4gLVNRTElURV9DRkxBR1MgKz0gLURTUUxJVEVfRU5B
QkxFX0pTT04xCj4+ID4gPj4gLWVuZGlmCj4+ID4gPj4gLQo+PiA+ID4+ICAgaWZlcSAoJChCUjJf
UEFDS0FHRV9TUUxJVEVfRU5BQkxFX1VOTE9DS19OT1RJRlkpLHkpCj4+ID4gPj4gICBTUUxJVEVf
Q0ZMQUdTICs9IC1EU1FMSVRFX0VOQUJMRV9VTkxPQ0tfTk9USUZZCj4+ID4gPj4gICBlbmRpZgo+
PiA+ID4+IEBAIC01MCwzMCArNDIsNTEgQEAgZWxzZQo+PiA+ID4+ICAgU1FMSVRFX0NGTEFHUyAr
PSAkKHN1YnN0IC1PZmFzdCwtTzMsJChUQVJHRVRfQ0ZMQUdTKSkKPj4gPiA+PiAgIGVuZGlmCj4+
ID4gPj4KPj4gPiA+PiAtU1FMSVRFX0NPTkZfRU5WID0gQ0ZMQUdTPSIkKFNRTElURV9DRkxBR1Mp
Igo+PiA+ID4+IC0KPj4gPiA+PiAtaWZlcSAoJChCUjJfU1RBVElDX0xJQlMpLHkpCj4+ID4gPj4g
LVNRTElURV9DT05GX09QVFMgKz0gLS1lbmFibGUtZHluYW1pYy1leHRlbnNpb25zPW5vCj4+ID4g
Pj4gLWVsc2UKPj4gPiA+PiAtU1FMSVRFX0NPTkZfT1BUUyArPSAtLWRpc2FibGUtc3RhdGljLXNo
ZWxsCj4+ID4gPj4gLWVuZGlmCj4+ID4gPj4gLQo+PiA+ID4+ICAgaWZlcSAoJChCUjJfVE9PTENI
QUlOX0hBU19USFJFQURTKSx5KQo+PiA+ID4+IC1TUUxJVEVfQ09ORl9PUFRTICs9IC0tZW5hYmxl
LXRocmVhZHNhZmUKPj4gPiA+PiArU1FMSVRFX0NGTEFHUyArPSAtRFNRTElURV9USFJFQURTQUZF
PTEKPj4gPiA+PiAgIGVsc2UKPj4gPiA+PiAgIFNRTElURV9DT05GX09QVFMgKz0gLS1kaXNhYmxl
LXRocmVhZHNhZmUKPj4gPiA+PiAtU1FMSVRFX0NGTEFHUyArPSAtRFNRTElURV9USFJFQURTQUZF
PTAKPj4gPiA+PiAgIGVuZGlmCj4+ID4KPj4gPiBXaHkgZG9lcyAtLWRpc2FibGUtdGhyZWFkc2Fm
ZSByZW1haW4sIHdoaWxlIC0tZW5hYmxlLXRocmVhZHNhZmUgaXMKPj4gPiByZW1vdmVkIGluIHRo
ZSBvdGhlciBicmFuY2gsIGFuZCAtRFNRTElURV9USFJFQURTQUZFPTAgcmVtb3ZlZCB3aGlsZQo+
PiA+IC1EU1FMSVRFX1RIUkVBRFNBRkU9MSBpcyBhZGRlZCBpbiB0aGUgb3RoZXIgYnJhbmNoPyBU
aGF0IHNlZW1zCj4+ID4gaW5jb25zaXN0ZW50LiBNeSBzZXR1cCBoYXMgQlIyX1RPT0xDSEFJTl9I
QVNfVEhSRUFEUz15LCBzbyBJIGNhbiBvbmx5Cj4+ID4gY29uZmlybSB0aGUgYnJhbmNoIHdpdGgg
dGhyZWFkcyB3b3Jrcy4KPj4KPj4gV2hlbiB1c2luZyB0aGUgLi9jb25maWd1cmUgLS1oZWxwIGNv
bW1hbmQgaW4gdGhlIHJlbGVhc2UgMy40OS4wIHRvCj4+IHZpZXcgdGhlIHVzYWdlLCB5b3UgY2Fu
IG9ubHkgc2VlIHRoZSAtLWRpc2FibGUtdGhyZWFkc2FmZSBvcHRpb24sIGJ1dAo+PiBub3QgdGhl
IC0tZW5hYmxlLXRocmVhZHNhZmUgb3B0aW9uLiBBdXRvc2V0dXAgd2lsbCBhdXRvbWF0aWNhbGx5
Cj4+IGRldGVjdCB3aGV0aGVyIHRocmVhZHMgYXJlIHN1cHBvcnRlZCBhbmQgc2V0IFNRTElURV9U
SFJFQURTQUZFIHRvIDEgb3IKPj4gMC4gSWYgdGhyZWFkcyBhcmUgc3VwcG9ydGVkLCBTUUxJVEVf
VEhSRUFEU0FGRT0xIGlzIGF1dG9tYXRpY2FsbHkgc2V0Cj4+IGJ5IGRlZmF1bHQsIGJ1dCB5b3Ug
Y2FuIGZvcmNlIFNRTElURV9USFJFQURTQUZFPTAgd2l0aCB0aGUKPj4gLS1kaXNhYmxlLXRocmVh
ZHNhZmUgb3B0aW9uLgo+Pgo+PiBJbiBteSBvcGluaW9uLCBBdXRvc2V0dXAgaGFzIGFscmVhZHkg
ZG9uZSB3aGF0IGl0IHNob3VsZCBkby4gSSB3aWxsCj4+IGRlbGV0ZSB0aGUgbGluZXMgcmVsYXRl
ZCB0byB0aHJlYWQgc2FmZXR5IG9wdGlvbnMgaW4gdGhlIHNxbGl0ZS5tawo+PiBmaWxlLgo+Pgo+
Pgo+PiA+Cj4+ID4gPj4gICBpZmVxICgkKEJSMl9QQUNLQUdFX05DVVJTRVMpJChCUjJfUEFDS0FH
RV9SRUFETElORSkseXkpCj4+ID4gPj4gICBTUUxJVEVfREVQRU5ERU5DSUVTICs9IG5jdXJzZXMg
cmVhZGxpbmUKPj4gPiA+PiAtU1FMSVRFX0NPTkZfT1BUUyArPSAtLWRpc2FibGUtZWRpdGxpbmUg
LS1lbmFibGUtcmVhZGxpbmUKPj4gPiA+PiAgIGVsc2UgaWZlcSAoJChCUjJfUEFDS0FHRV9MSUJF
RElUKSx5KQo+PiA+ID4+ICAgU1FMSVRFX0RFUEVOREVOQ0lFUyArPSBsaWJlZGl0Cj4+ID4gPj4g
LVNRTElURV9DT05GX09QVFMgKz0gLS1lbmFibGUtZWRpdGxpbmUgLS1kaXNhYmxlLXJlYWRsaW5l
Cj4+ID4gPj4gK1NRTElURV9DT05GX09QVFMgKz0gLS1kaXNhYmxlLXJlYWRsaW5lIC0tZWRpdGxp
bmUKPj4gPiA+PiAgIGVsc2UKPj4gPiA+PiAtU1FMSVRFX0NPTkZfT1BUUyArPSAtLWRpc2FibGUt
ZWRpdGxpbmUgLS1kaXNhYmxlLXJlYWRsaW5lCj4+ID4gPj4gK1NRTElURV9DT05GX09QVFMgKz0g
LS1kaXNhYmxlLXJlYWRsaW5lCj4+ID4gPj4gICBlbmRpZgo+PiA+ID4+Cj4+ID4gPj4gLSQoZXZh
bCAkKGF1dG90b29scy1wYWNrYWdlKSkKPj4gPiA+PiAtJChldmFsICQoaG9zdC1hdXRvdG9vbHMt
cGFja2FnZSkpCj4+ID4gPj4gK2lmZXEgKCQoQlIyX1BBQ0tBR0VfU1FMSVRFX0VOQUJMRV9GVFMz
KSx5KQo+PiA+ID4+ICtTUUxJVEVfQ09ORl9PUFRTICs9IC0tZnRzMwo+PiA+ID4+ICtlbmRpZgo+
PiA+ID4+ICsKPj4gPiA+PiAraWZlcSAoJChCUjJfUEFDS0FHRV9TUUxJVEVfRU5BQkxFX0pTT04x
KSwpCj4+ID4gPj4gK1NRTElURV9DT05GX09QVFMgKz0gLS1kaXNhYmxlLWpzb24KPj4gPiA+PiAr
ZW5kaWYKPj4gPiA+PiArCj4+ID4gPj4gK1NRTElURV9DT05GX0VOViA9IENGTEFHUz0iJChTUUxJ
VEVfQ0ZMQUdTKSIKPj4gPiA+PiArCj4+ID4gPj4gK2RlZmluZSBTUUxJVEVfQ09ORklHVVJFX0NN
RFMKPj4gPiA+PiArICAgIChjZCAkKEBEKTsgJChUQVJHRVRfQ09ORklHVVJFX09QVFMpICQoU1FM
SVRFX0NPTkZfRU5WKSAuL2NvbmZpZ3VyZSBcCj4+ID4gPj4gKyAgICAgICAgICAgIC0tcHJlZml4
PS91c3IgXAo+PiA+ID4+ICsgICAgICAgICAgICAtLWhvc3Q9IiQoR05VX1RBUkdFVF9OQU1FKSIg
XAo+PiA+ID4+ICsgICAgICAgICAgICAtLWJ1aWxkPSIkKEdOVV9IT1NUX05BTUUpIiBcCj4+ID4g
Pj4gKyAgICAgICAgICAgIC0tc3lzcm9vdD0iJChTVEFHSU5HX0RJUikiIFwKPj4gPiA+PiArICAg
ICAgICAgICAgJChTUUxJVEVfQ09ORl9PUFRTKSBcCj4+ID4gPj4gKyAgICApCj4+ID4gPj4gK2Vu
ZGVmCj4+ID4gPj4gKwo+PiA+ID4+ICtkZWZpbmUgU1FMSVRFX0JVSUxEX0NNRFMKPj4gPiA+PiAr
ICAgICQoVEFSR0VUX01BS0VfRU5WKSAkKE1BS0UpIC1DICQoQEQpCj4+ID4gPj4gK2VuZGVmCj4+
ID4gPj4gKwo+PiA+ID4+ICtkZWZpbmUgU1FMSVRFX0lOU1RBTExfU1RBR0lOR19DTURTCj4+ID4g
Pj4gKyAgICAkKFRBUkdFVF9NQUtFX0VOVikgJChNQUtFKSBERVNURElSPSIkKFNUQUdJTkdfRElS
KSIgLUMgJChARCkgaW5zdGFsbAo+PiA+ID4+ICtlbmRlZgo+PiA+ID4+ICsKPj4gPiA+PiArZGVm
aW5lIFNRTElURV9JTlNUQUxMX1RBUkdFVF9DTURTCj4+ID4gPj4gKyAgICAkKFRBUkdFVF9NQUtF
X0VOVikgJChNQUtFKSBERVNURElSPSIkKFRBUkdFVF9ESVIpIiAtQyAkKEBEKSBpbnN0YWxsCj4+
ID4gPj4gK2VuZGVmCj4+ID4gPj4gKwo+PiA+ID4+ICskKGV2YWwgJChnZW5lcmljLXBhY2thZ2Up
KQo+PiA+ID4KPj4gPiA+IFdlIGFsc28gbmVlZCBob3N0LWdlbmVyaWMtcGFja2FnZSB0byByZXBs
YWNlIHRoZSBob3N0LWF1dG90b29scy1wYWNrYWdlCj4+ID4gPiByZW1vdmVkIGFib3ZlLgo+PiA+
ID4KPj4gPiA+IGJhcnVjaAo+PiA+ID4KPj4gPgo+PiA+IF9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCj4+ID4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+PiA+
IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4+ID4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3Jn
L21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cj4+IF9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCj4+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPj4gYnVpbGRy
b290QGJ1aWxkcm9vdC5vcmcKPj4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4v
bGlzdGluZm8vYnVpbGRyb290Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcK
aHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
