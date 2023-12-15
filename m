Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C87BC4167B
	for <buildroot@archiver.kernel.org>; Fri, 15 Dec 2023 18:37:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E2A2D610AD;
	Fri, 15 Dec 2023 18:37:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E2A2D610AD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 44baz3mEdtq1; Fri, 15 Dec 2023 18:37:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1C4E8610A5;
	Fri, 15 Dec 2023 18:37:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1C4E8610A5
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B17491BF2B6
 for <buildroot@lists.busybox.net>; Fri, 15 Dec 2023 18:37:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 892334246D
 for <buildroot@lists.busybox.net>; Fri, 15 Dec 2023 18:37:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 892334246D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3X46QmBSuhM6 for <buildroot@lists.busybox.net>;
 Fri, 15 Dec 2023 18:37:14 +0000 (UTC)
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com
 [IPv6:2607:f8b0:4864:20::b32])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6445642461
 for <buildroot@buildroot.org>; Fri, 15 Dec 2023 18:37:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6445642461
Received: by mail-yb1-xb32.google.com with SMTP id
 3f1490d57ef6-dbcfd620827so692609276.0
 for <buildroot@buildroot.org>; Fri, 15 Dec 2023 10:37:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702665433; x=1703270233;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XfHxvHc1rScgPXaWiFNsaRlCKajNMh8X0HQhp2S+oqY=;
 b=VqSfkcS/qyJhvP8JuiZZ2WhytPa7Ozei85vydGqJLbPr1JTS09rrNJUR5rZJ2Gr0wi
 P+zSpkCFJ7hahEIQet63xF8RHHR+3lRCAX7QK5DqwfH2HqVik9wEmSRf8caRkHAgY/zp
 wBFh+PGkPPsX9rfCdbDHjyG9f5MFYE8pg0UVid93Qo0oSFq+kbVKzbw4I2hRLzWUCarl
 u44kQiJ5wqNCDCF17iAdAkHWdhG67f63TRh//PdTqCnlqRS4ONL+WbsKkL/nieWbJ/+e
 B/eeF0I7ZW0FgwkPVnLOM/QSq73FAui0lLC+KdNYXiikEb4SJpJbgaIU20UJAbXJLRxu
 No9A==
X-Gm-Message-State: AOJu0YyVvesDRjGru23Qw1bcoGh7S3x4kU8g46me1SVaOmmaqttCro0n
 v0gC1RZCoFI4+nbJrsh0gKo6jtaR5QbdpJYRK5Zx9w==
X-Google-Smtp-Source: AGHT+IHhyFeUPtJOqTSm6I5nzt50NbTv6TKKJidSCu4yO8noFXhzdZvtCjBPLhV+tAk94N1kkw4hEZDMyCpIAdTuwwg=
X-Received: by 2002:a05:6902:534:b0:db3:64d3:b6b6 with SMTP id
 y20-20020a056902053400b00db364d3b6b6mr7833310ybs.28.1702665433208; Fri, 15
 Dec 2023 10:37:13 -0800 (PST)
MIME-Version: 1.0
References: <20231213164311.4180059-1-dario.binacchi@amarulasolutions.com>
 <20231213164311.4180059-9-dario.binacchi@amarulasolutions.com>
 <CAAE6iEUgwA3W75KRQ9oJLZx+rO-kcfSVC3kC9VWi0rG2fjHwKw@mail.gmail.com>
In-Reply-To: <CAAE6iEUgwA3W75KRQ9oJLZx+rO-kcfSVC3kC9VWi0rG2fjHwKw@mail.gmail.com>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Fri, 15 Dec 2023 19:37:02 +0100
Message-ID: <CABGWkvqnX014hO26WPefrdKiAyz53krwF3zsrghzRpDx_oK2PQ@mail.gmail.com>
To: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1702665433; x=1703270233;
 darn=buildroot.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XfHxvHc1rScgPXaWiFNsaRlCKajNMh8X0HQhp2S+oqY=;
 b=rh36dEO3I6NP/Sb3icwUcO+HZl7omMj07ASa4236kbZmkB7ZpAPfqfjdNcnj6WyfkH
 ZE/+gko1QwcvNXnEwXyL0LQVjwHVA8zvEUEqO6yt3UTziDcHSNZ9C9ccd3jszEAhKKjA
 Rdl2kurJkfVHqOlpjlpNuF9b8JatZbPKypXFc=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=rh36dEO3
Subject: Re: [Buildroot] [PATCH v2 08/11] boot/ti-k3-r5-loader: set binman
 environment
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
Cc: Asaf Kahlon <asafka7@gmail.com>, Xuanhao Shi <X15000177@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Michael Trimarchi <michael@amarulasolutions.com>, bryce@redpinelabs.com,
 Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgRnJhbsOnb2lzLAoKT24gVGh1LCBEZWMgMTQsIDIwMjMgYXQgODo1M+KAr1BNIEZyYW7Dp29p
cyBQZXJyYWQKPGZyYW5jb2lzLnBlcnJhZEBnYWR6Lm9yZz4gd3JvdGU6Cj4KPgo+Cj4gTGUgbWVy
LiAxMyBkw6ljLiAyMDIzIMOgIDE3OjQ1LCBEYXJpbyBCaW5hY2NoaSA8ZGFyaW8uYmluYWNjaGlA
YW1hcnVsYXNvbHV0aW9ucy5jb20+IGEgw6ljcml0IDoKPj4KPj4gUmVjZW50IHZlcnNpb24gb2Yg
VS1Cb290IHVzZSBiaW5tYW4gdG8gcHJvdmlkZSBhIG1lY2hhbmlzbSBmb3IgYnVpbGRpbmcKPj4g
aW1hZ2VzLCBmcm9tIHNpbXBsZSBTUEwgKyBVLUJvb3QgY29tYmluYXRpb25zLCB0byBtb3JlIGNv
bXBsZXgKPj4gYXJyYW5nZW1lbnRzIHdpdGggbWFueSBwYXJ0cy4KPj4KPj4gVGhlIHBhdGNoIHNl
dCB0aGUgQklOTUFOX0lORElSUyBlbnZpcm9ubWVudCB2YXJpYWJsZSB0byBwcm92aWRlIHRoZQo+
PiBkaXJlY3RvcnkgdG8gc2VhcmNoIGZvciBiaW5hcnkgYmxvYnMgYW5kIHNlbGVjdCB0aGUgcGFj
a2FnZXMgcmVxdWlyZWQgYnkKPj4gYmlubWFuLgo+Pgo+PiBDby1kZXZlbG9wZWQtYnk6IE1pY2hh
ZWwgVHJpbWFyY2hpIDxtaWNoYWVsQGFtYXJ1bGFzb2x1dGlvbnMuY29tPgo+PiBTaWduZWQtb2Zm
LWJ5OiBNaWNoYWVsIFRyaW1hcmNoaSA8bWljaGFlbEBhbWFydWxhc29sdXRpb25zLmNvbT4KPj4g
U2lnbmVkLW9mZi1ieTogRGFyaW8gQmluYWNjaGkgPGRhcmlvLmJpbmFjY2hpQGFtYXJ1bGFzb2x1
dGlvbnMuY29tPgo+Pgo+PiAtLS0KPj4KPj4gQ2hhbmdlcyBpbiB2MjoKPj4gLSBDaGFuZ2UgY29t
bWl0IG1lc3NhZ2UKPj4gLSBBZGQgQlIyX1RBUkdFVF9USV9LM19SNV9MT0FERVJfVVNFX0JJTk1B
TiBvcHRpb24KPj4gLSBTZWxlY3QgcGFja2FnZXMgcmVxdWlyZWQgYnkgYmlubWFuIGlmCj4+ICAg
QlIyX1RBUkdFVF9USV9LM19SNV9MT0FERVJfVVNFX0JJTk1BTiBpcyBlbmFibGVkCj4+Cj4+IFNp
Z25lZC1vZmYtYnk6IERhcmlvIEJpbmFjY2hpIDxkYXJpby5iaW5hY2NoaUBhbWFydWxhc29sdXRp
b25zLmNvbT4KPj4gLS0tCj4+ICBib290L3RpLWszLXI1LWxvYWRlci9Db25maWcuaW4gICAgICAg
ICAgfCAxMyArKysrKysrKysrKysrCj4+ICBib290L3RpLWszLXI1LWxvYWRlci90aS1rMy1yNS1s
b2FkZXIubWsgfCAgMSArCj4+ICAyIGZpbGVzIGNoYW5nZWQsIDE0IGluc2VydGlvbnMoKykKPj4K
Pj4gZGlmZiAtLWdpdCBhL2Jvb3QvdGktazMtcjUtbG9hZGVyL0NvbmZpZy5pbiBiL2Jvb3QvdGkt
azMtcjUtbG9hZGVyL0NvbmZpZy5pbgo+PiBpbmRleCA4YzgzNjhhMWE1YTguLmE0MGVhZWQ5NDY3
YiAxMDA2NDQKPj4gLS0tIGEvYm9vdC90aS1rMy1yNS1sb2FkZXIvQ29uZmlnLmluCj4+ICsrKyBi
L2Jvb3QvdGktazMtcjUtbG9hZGVyL0NvbmZpZy5pbgo+PiBAQCAtOTMsNCArOTMsMTcgQEAgY29u
ZmlnIEJSMl9UQVJHRVRfVElfSzNfUjVfTE9BREVSX0NVU1RPTV9DT05GSUdfRklMRQo+PiAgICAg
ICAgIGhlbHAKPj4gICAgICAgICAgIFBhdGggdG8gdGhlIFRJIEszIFI1IExvYWRlciBjb25maWd1
cmF0aW9uIGZpbGUuCj4+Cj4+ICtjb25maWcgQlIyX1RBUkdFVF9USV9LM19SNV9MT0FERVJfVVNF
X0JJTk1BTgo+PiArICAgICAgIGJvb2wgIlUtQm9vdCB1c2VzIGJpbm1hbiIKPj4gKyAgICAgICBz
ZWxlY3QgQlIyX1RBUkdFVF9VQk9PVF9ORUVEU19QWUxJQkZEVAo+PiArICAgICAgIHNlbGVjdCBC
UjJfUEFDS0FHRV9IT1NUX1BZVEhPTl9BVFRSUwo+PiArICAgICAgIHNlbGVjdCBCUjJfUEFDS0FH
RV9IT1NUX1BZVEhPTl9KU09OU0NIRU1BCj4+ICsgICAgICAgc2VsZWN0IEJSMl9QQUNLQUdFX0hP
U1RfUFlUSE9OX0pTT05TQ0hFTUFfU1BFQ0lGSUNBVElPTlMKPj4gKyAgICAgICBzZWxlY3QgQlIy
X1BBQ0tBR0VfSE9TVF9QWVRIT05fUFlZQU1MCj4+ICsgICAgICAgc2VsZWN0IEJSMl9QQUNLQUdF
X0hPU1RfUFlUSE9OX1JFRkVSRU5DSU5HCj4+ICsgICAgICAgc2VsZWN0IEJSMl9QQUNLQUdFX0hP
U1RfUFlUSE9OX1JQRFNfUFkKPgo+Cj4gdGhlc2Ugc2VsZWN0IHN0YXRlbWVudHMgbmVlZCB0aGVp
ciBjb3VudGVycGFydCBhcyBkZXBlbmRlbmNpZXMgaW4gLm1rCgpTb3JyeSwgSSBmb3Jnb3QgaXQK
Cj4KPiBmb3IgdGhpcyByZWFzb24sIHRoZSBidWlsZCBmYWlscyB3aXRoIHRoaXMgbWVzc2FnZToK
PiAgICBlcnJvcjogY29tbWFuZCAnc3dpZycgZmFpbGVkOiBObyBzdWNoIGZpbGUgb3IgZGlyZWN0
b3J5Cj4KPiBub3RlOiB0aGUgYnVpbGQgaXMgc3VjY2Vzc2Z1bCB3aGVuIGl0IHN0YXJ0cyBhZnRl
ciB0aGUgYnVpbGQgb2YgdWJvb3Qgd2hpY2ggZGVwZW5kcyBvbiBob3N0LXB5dGhvbi1weWxpYmZk
dCBhbmQgaG9zdC1zd2lnCj4KPiBGcmFuw6dvaXMKPgo+IGlmZXEgKCQoQlIyX1RBUkdFVF9VQk9P
VF9ORUVEU19QWUxJQkZEVCkseSkgICAgIyBsaWtlIGluIHVib290Lm1rCj4gVElfSzNfUjVfTE9B
REVSX0RFUEVOREVOQ0lFUyArPSBob3N0LXB5dGhvbi1weWxpYmZkdAo+IGVuZGlmCj4KPiBpZmVx
ICgkKEJSMl9UQVJHRVRfVElfSzNfUjVfTE9BREVSX1VTRV9CSU5NQU4pLHkpICAgICMgbmV3IHBh
Y2thZ2VzCj4gVElfSzNfUjVfTE9BREVSX0RFUEVOREVOQ0lFUyArPSBcCj4gICAgIGhvc3QtcHl0
aG9uLWpzb25zY2hlbWEgXAo+ICAgICBob3N0LXB5dGhvbi1qc29uc2NoZW1hLXNwZWNpZmlhY3Rp
b25zIFwKPiAgICAgaG9zdC1weXRob24tcHl5YW1sIFwKPiAgICAgaG9zdC1weXRob24tcmVmZXJl
bmNpbmcgXAo+ICAgICBob3N0LXB5dGhvbi1ycGRzLXB5Cj4gZW5kaWYKClRoYW5rcyBmb3IgeW91
ciBzdWdnZXN0aW9ucywKdmVyeSBhcHByZWNpYXRlZAoKRGFyaW8KCj4KPgo+PiArICAgICAgIGhl
bHAKPj4gKyAgICAgICAgIFNlbGVjdCB0aGlzIG9wdGlvbiBpZiB5b3VyIFUtQm9vdCB2ZXJzaW9u
IHVzZXMgYmlubWFuCj4+ICsgICAgICAgICBmb3IgYnVpbGRpbmcgaW1hZ2VzLgo+PiArCj4+ICBl
bmRpZgo+PiBkaWZmIC0tZ2l0IGEvYm9vdC90aS1rMy1yNS1sb2FkZXIvdGktazMtcjUtbG9hZGVy
Lm1rIGIvYm9vdC90aS1rMy1yNS1sb2FkZXIvdGktazMtcjUtbG9hZGVyLm1rCj4+IGluZGV4IDBm
ZmNiODIzNWYyZS4uZDVlYzhmYThiYTk2IDEwMDY0NAo+PiAtLS0gYS9ib290L3RpLWszLXI1LWxv
YWRlci90aS1rMy1yNS1sb2FkZXIubWsKPj4gKysrIGIvYm9vdC90aS1rMy1yNS1sb2FkZXIvdGkt
azMtcjUtbG9hZGVyLm1rCj4+IEBAIC01OCw2ICs1OCw3IEBAIFRJX0szX1I1X0xPQURFUl9NQUtF
X09QVFMgPSBcCj4+ICAgICAgICAgQ1JPU1NfQ09NUElMRT0kKEhPU1RfRElSKS9iaW4vYXJtLW5v
bmUtZWFiaS0gXAo+PiAgICAgICAgIEFSQ0g9YXJtIFwKPj4gICAgICAgICBIT1NUQ0M9IiQoSE9T
VENDKSAkKHN1YnN0IC1JLywtaXN5c3RlbSAvLCQoc3Vic3QgLUkgLywtaXN5c3RlbSAvLCQoSE9T
VF9DRkxBR1MpKSkiIFwKPj4gKyAgICAgICBCSU5NQU5fSU5ESVJTPSQoQklOQVJJRVNfRElSKSBc
Cj4+ICAgICAgICAgSE9TVExERkxBR1M9IiQoSE9TVF9MREZMQUdTKSIKPj4KPj4gIGRlZmluZSBU
SV9LM19SNV9MT0FERVJfQlVJTERfQ01EUwo+PiAtLQo+PiAyLjQzLjAKPj4KPj4gX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPj4gYnVpbGRyb290IG1haWxp
bmcgbGlzdAo+PiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+PiBodHRwczovL2xpc3RzLmJ1aWxk
cm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKCgoKLS0gCgpEYXJpbyBCaW5hY2No
aQoKU2VuaW9yIEVtYmVkZGVkIExpbnV4IERldmVsb3BlcgoKZGFyaW8uYmluYWNjaGlAYW1hcnVs
YXNvbHV0aW9ucy5jb20KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KCgpBbWFy
dWxhIFNvbHV0aW9ucyBTUkwKClZpYSBMZSBDYW5ldmFyZSAzMCwgMzExMDAgVHJldmlzbywgVmVu
ZXRvLCBJVAoKVC4gKzM5IDA0MiAyNDMgNTMxMAppbmZvQGFtYXJ1bGFzb2x1dGlvbnMuY29tCgp3
d3cuYW1hcnVsYXNvbHV0aW9ucy5jb20KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290
Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJv
b3QK
