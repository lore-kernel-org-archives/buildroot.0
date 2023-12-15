Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9F55C4332F
	for <buildroot@archiver.kernel.org>; Fri, 15 Dec 2023 17:29:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 523614249D;
	Fri, 15 Dec 2023 17:29:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 523614249D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YPm03LXcy27S; Fri, 15 Dec 2023 17:29:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8B5E6417E6;
	Fri, 15 Dec 2023 17:29:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8B5E6417E6
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6AAFE1BF281
 for <buildroot@lists.busybox.net>; Fri, 15 Dec 2023 17:29:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 42330409B5
 for <buildroot@lists.busybox.net>; Fri, 15 Dec 2023 17:29:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 42330409B5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3CSq18v-fojN for <buildroot@lists.busybox.net>;
 Fri, 15 Dec 2023 17:29:43 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1EFF240323
 for <buildroot@buildroot.org>; Fri, 15 Dec 2023 17:29:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1EFF240323
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-40c2c65e6aaso10631815e9.2
 for <buildroot@buildroot.org>; Fri, 15 Dec 2023 09:29:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702661380; x=1703266180;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Tlfm6+vTYFO9xJgjkBSVyZ/3ypO8QkrpwiGwuZSOpoM=;
 b=XQmTHg8F2CBUdGTN/gDslEN9FjVtPiq2BH+kY1WRoY5xX/eX796w4oW+a3ebVDfSMj
 e05L0EUTAIU89rjtFMmkusvgGoyRfYDedHgbaFDQRyoLvNupFzY9aUbgq/GP/3JrNHf6
 H42gPn+JDQtk6AphnKLFxxPj7kwIEdYwLX/hYi/nhU2qyA6Nrt+/wngzvgDT02mYpUVZ
 hbugIbkOoePXvdB1enCApj8vJCoAZrl1lZWJha2SurLnmImTLYC0p4mvgOmuaYyFDim8
 y9GLhtLMJ6wRQOEvDJrFXAdiEA4nT6b9T0Yfczu9/qYMOyV9eZ9Uzc1ojNNPNZLFF/jn
 EMOg==
X-Gm-Message-State: AOJu0YyBpX/8WIt9u4bVw6YQC0OyB0G6um09dIWjOVcswkDQP6Wv/PF1
 o5PjgkbLvTU5RU/KqsgqJk3rOdhhLxdUSQ==
X-Google-Smtp-Source: AGHT+IGl13kZf9Fmxtn8lxckZLMHAeRtK2KgFnRR55WoquoWz4kuWK4FSD1NsEHzhfuDRktaIiRLkg==
X-Received: by 2002:a05:600c:20d:b0:40b:5e4a:4074 with SMTP id
 13-20020a05600c020d00b0040b5e4a4074mr6035654wmi.148.1702661380301; 
 Fri, 15 Dec 2023 09:29:40 -0800 (PST)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com.
 [209.85.218.48]) by smtp.gmail.com with ESMTPSA id
 cu1-20020a170906ba8100b00a1f65433d08sm10983242ejd.172.2023.12.15.09.29.39
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Dec 2023 09:29:39 -0800 (PST)
Received: by mail-ej1-f48.google.com with SMTP id
 a640c23a62f3a-9fa45e75ed9so103898466b.1
 for <buildroot@buildroot.org>; Fri, 15 Dec 2023 09:29:39 -0800 (PST)
X-Received: by 2002:a17:906:ca4c:b0:a19:a19a:ead9 with SMTP id
 jx12-20020a170906ca4c00b00a19a19aead9mr5427432ejb.146.1702661379177; Fri, 15
 Dec 2023 09:29:39 -0800 (PST)
MIME-Version: 1.0
References: <20231213164311.4180059-1-dario.binacchi@amarulasolutions.com>
 <20231213164311.4180059-9-dario.binacchi@amarulasolutions.com>
 <CAAE6iEUgwA3W75KRQ9oJLZx+rO-kcfSVC3kC9VWi0rG2fjHwKw@mail.gmail.com>
In-Reply-To: <CAAE6iEUgwA3W75KRQ9oJLZx+rO-kcfSVC3kC9VWi0rG2fjHwKw@mail.gmail.com>
From: Bryce Johnson <bryce@redpinelabs.com>
Date: Fri, 15 Dec 2023 10:29:27 -0700
X-Gmail-Original-Message-ID: <CADXxVSL0YMRqEwVs=_2f4ej_jGasc0pbBAy9QZOKWRva+0DbJw@mail.gmail.com>
Message-ID: <CADXxVSL0YMRqEwVs=_2f4ej_jGasc0pbBAy9QZOKWRva+0DbJw@mail.gmail.com>
To: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
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
Cc: Michael Trimarchi <michael@amarulasolutions.com>,
 Asaf Kahlon <asafka7@gmail.com>, Xuanhao Shi <X15000177@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

WWVzIEkgaGFkIHJ1biBpbnRvIHRoZSBzYW1lIHRoaW5nLiBJIGdvdCBhcm91bmQgaXQgYnkgYWRk
aW5nIHRoZQpgYXB0LWdldCBpbnN0YWxsIHN3aWdgIG9uIG15IGhvc3QsIGJ1dCB0aGUgYWJvdmUg
bG9va3MgbGlrZSBhIG11Y2gKYmV0dGVyIHdheSB0byBmaXggaXQuCgpPbiBUaHUsIERlYyAxNCwg
MjAyMyBhdCAxMjo1M+KAr1BNIEZyYW7Dp29pcyBQZXJyYWQKPGZyYW5jb2lzLnBlcnJhZEBnYWR6
Lm9yZz4gd3JvdGU6Cj4KPgo+Cj4gTGUgbWVyLiAxMyBkw6ljLiAyMDIzIMOgIDE3OjQ1LCBEYXJp
byBCaW5hY2NoaSA8ZGFyaW8uYmluYWNjaGlAYW1hcnVsYXNvbHV0aW9ucy5jb20+IGEgw6ljcml0
IDoKPj4KPj4gUmVjZW50IHZlcnNpb24gb2YgVS1Cb290IHVzZSBiaW5tYW4gdG8gcHJvdmlkZSBh
IG1lY2hhbmlzbSBmb3IgYnVpbGRpbmcKPj4gaW1hZ2VzLCBmcm9tIHNpbXBsZSBTUEwgKyBVLUJv
b3QgY29tYmluYXRpb25zLCB0byBtb3JlIGNvbXBsZXgKPj4gYXJyYW5nZW1lbnRzIHdpdGggbWFu
eSBwYXJ0cy4KPj4KPj4gVGhlIHBhdGNoIHNldCB0aGUgQklOTUFOX0lORElSUyBlbnZpcm9ubWVu
dCB2YXJpYWJsZSB0byBwcm92aWRlIHRoZQo+PiBkaXJlY3RvcnkgdG8gc2VhcmNoIGZvciBiaW5h
cnkgYmxvYnMgYW5kIHNlbGVjdCB0aGUgcGFja2FnZXMgcmVxdWlyZWQgYnkKPj4gYmlubWFuLgo+
Pgo+PiBDby1kZXZlbG9wZWQtYnk6IE1pY2hhZWwgVHJpbWFyY2hpIDxtaWNoYWVsQGFtYXJ1bGFz
b2x1dGlvbnMuY29tPgo+PiBTaWduZWQtb2ZmLWJ5OiBNaWNoYWVsIFRyaW1hcmNoaSA8bWljaGFl
bEBhbWFydWxhc29sdXRpb25zLmNvbT4KPj4gU2lnbmVkLW9mZi1ieTogRGFyaW8gQmluYWNjaGkg
PGRhcmlvLmJpbmFjY2hpQGFtYXJ1bGFzb2x1dGlvbnMuY29tPgo+Pgo+PiAtLS0KPj4KPj4gQ2hh
bmdlcyBpbiB2MjoKPj4gLSBDaGFuZ2UgY29tbWl0IG1lc3NhZ2UKPj4gLSBBZGQgQlIyX1RBUkdF
VF9USV9LM19SNV9MT0FERVJfVVNFX0JJTk1BTiBvcHRpb24KPj4gLSBTZWxlY3QgcGFja2FnZXMg
cmVxdWlyZWQgYnkgYmlubWFuIGlmCj4+ICAgQlIyX1RBUkdFVF9USV9LM19SNV9MT0FERVJfVVNF
X0JJTk1BTiBpcyBlbmFibGVkCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IERhcmlvIEJpbmFjY2hpIDxk
YXJpby5iaW5hY2NoaUBhbWFydWxhc29sdXRpb25zLmNvbT4KPj4gLS0tCj4+ICBib290L3RpLWsz
LXI1LWxvYWRlci9Db25maWcuaW4gICAgICAgICAgfCAxMyArKysrKysrKysrKysrCj4+ICBib290
L3RpLWszLXI1LWxvYWRlci90aS1rMy1yNS1sb2FkZXIubWsgfCAgMSArCj4+ICAyIGZpbGVzIGNo
YW5nZWQsIDE0IGluc2VydGlvbnMoKykKPj4KPj4gZGlmZiAtLWdpdCBhL2Jvb3QvdGktazMtcjUt
bG9hZGVyL0NvbmZpZy5pbiBiL2Jvb3QvdGktazMtcjUtbG9hZGVyL0NvbmZpZy5pbgo+PiBpbmRl
eCA4YzgzNjhhMWE1YTguLmE0MGVhZWQ5NDY3YiAxMDA2NDQKPj4gLS0tIGEvYm9vdC90aS1rMy1y
NS1sb2FkZXIvQ29uZmlnLmluCj4+ICsrKyBiL2Jvb3QvdGktazMtcjUtbG9hZGVyL0NvbmZpZy5p
bgo+PiBAQCAtOTMsNCArOTMsMTcgQEAgY29uZmlnIEJSMl9UQVJHRVRfVElfSzNfUjVfTE9BREVS
X0NVU1RPTV9DT05GSUdfRklMRQo+PiAgICAgICAgIGhlbHAKPj4gICAgICAgICAgIFBhdGggdG8g
dGhlIFRJIEszIFI1IExvYWRlciBjb25maWd1cmF0aW9uIGZpbGUuCj4+Cj4+ICtjb25maWcgQlIy
X1RBUkdFVF9USV9LM19SNV9MT0FERVJfVVNFX0JJTk1BTgo+PiArICAgICAgIGJvb2wgIlUtQm9v
dCB1c2VzIGJpbm1hbiIKPj4gKyAgICAgICBzZWxlY3QgQlIyX1RBUkdFVF9VQk9PVF9ORUVEU19Q
WUxJQkZEVAo+PiArICAgICAgIHNlbGVjdCBCUjJfUEFDS0FHRV9IT1NUX1BZVEhPTl9BVFRSUwo+
PiArICAgICAgIHNlbGVjdCBCUjJfUEFDS0FHRV9IT1NUX1BZVEhPTl9KU09OU0NIRU1BCj4+ICsg
ICAgICAgc2VsZWN0IEJSMl9QQUNLQUdFX0hPU1RfUFlUSE9OX0pTT05TQ0hFTUFfU1BFQ0lGSUNB
VElPTlMKPj4gKyAgICAgICBzZWxlY3QgQlIyX1BBQ0tBR0VfSE9TVF9QWVRIT05fUFlZQU1MCj4+
ICsgICAgICAgc2VsZWN0IEJSMl9QQUNLQUdFX0hPU1RfUFlUSE9OX1JFRkVSRU5DSU5HCj4+ICsg
ICAgICAgc2VsZWN0IEJSMl9QQUNLQUdFX0hPU1RfUFlUSE9OX1JQRFNfUFkKPgo+Cj4gdGhlc2Ug
c2VsZWN0IHN0YXRlbWVudHMgbmVlZCB0aGVpciBjb3VudGVycGFydCBhcyBkZXBlbmRlbmNpZXMg
aW4gLm1rCj4KPiBmb3IgdGhpcyByZWFzb24sIHRoZSBidWlsZCBmYWlscyB3aXRoIHRoaXMgbWVz
c2FnZToKPiAgICBlcnJvcjogY29tbWFuZCAnc3dpZycgZmFpbGVkOiBObyBzdWNoIGZpbGUgb3Ig
ZGlyZWN0b3J5Cj4KPiBub3RlOiB0aGUgYnVpbGQgaXMgc3VjY2Vzc2Z1bCB3aGVuIGl0IHN0YXJ0
cyBhZnRlciB0aGUgYnVpbGQgb2YgdWJvb3Qgd2hpY2ggZGVwZW5kcyBvbiBob3N0LXB5dGhvbi1w
eWxpYmZkdCBhbmQgaG9zdC1zd2lnCj4KPiBGcmFuw6dvaXMKPgo+IGlmZXEgKCQoQlIyX1RBUkdF
VF9VQk9PVF9ORUVEU19QWUxJQkZEVCkseSkgICAgIyBsaWtlIGluIHVib290Lm1rCj4gVElfSzNf
UjVfTE9BREVSX0RFUEVOREVOQ0lFUyArPSBob3N0LXB5dGhvbi1weWxpYmZkdAo+IGVuZGlmCj4K
PiBpZmVxICgkKEJSMl9UQVJHRVRfVElfSzNfUjVfTE9BREVSX1VTRV9CSU5NQU4pLHkpICAgICMg
bmV3IHBhY2thZ2VzCj4gVElfSzNfUjVfTE9BREVSX0RFUEVOREVOQ0lFUyArPSBcCj4gICAgIGhv
c3QtcHl0aG9uLWpzb25zY2hlbWEgXAo+ICAgICBob3N0LXB5dGhvbi1qc29uc2NoZW1hLXNwZWNp
ZmlhY3Rpb25zIFwKPiAgICAgaG9zdC1weXRob24tcHl5YW1sIFwKPiAgICAgaG9zdC1weXRob24t
cmVmZXJlbmNpbmcgXAo+ICAgICBob3N0LXB5dGhvbi1ycGRzLXB5Cj4gZW5kaWYKPgo+Cj4+ICsg
ICAgICAgaGVscAo+PiArICAgICAgICAgU2VsZWN0IHRoaXMgb3B0aW9uIGlmIHlvdXIgVS1Cb290
IHZlcnNpb24gdXNlcyBiaW5tYW4KPj4gKyAgICAgICAgIGZvciBidWlsZGluZyBpbWFnZXMuCj4+
ICsKPj4gIGVuZGlmCj4+IGRpZmYgLS1naXQgYS9ib290L3RpLWszLXI1LWxvYWRlci90aS1rMy1y
NS1sb2FkZXIubWsgYi9ib290L3RpLWszLXI1LWxvYWRlci90aS1rMy1yNS1sb2FkZXIubWsKPj4g
aW5kZXggMGZmY2I4MjM1ZjJlLi5kNWVjOGZhOGJhOTYgMTAwNjQ0Cj4+IC0tLSBhL2Jvb3QvdGkt
azMtcjUtbG9hZGVyL3RpLWszLXI1LWxvYWRlci5tawo+PiArKysgYi9ib290L3RpLWszLXI1LWxv
YWRlci90aS1rMy1yNS1sb2FkZXIubWsKPj4gQEAgLTU4LDYgKzU4LDcgQEAgVElfSzNfUjVfTE9B
REVSX01BS0VfT1BUUyA9IFwKPj4gICAgICAgICBDUk9TU19DT01QSUxFPSQoSE9TVF9ESVIpL2Jp
bi9hcm0tbm9uZS1lYWJpLSBcCj4+ICAgICAgICAgQVJDSD1hcm0gXAo+PiAgICAgICAgIEhPU1RD
Qz0iJChIT1NUQ0MpICQoc3Vic3QgLUkvLC1pc3lzdGVtIC8sJChzdWJzdCAtSSAvLC1pc3lzdGVt
IC8sJChIT1NUX0NGTEFHUykpKSIgXAo+PiArICAgICAgIEJJTk1BTl9JTkRJUlM9JChCSU5BUklF
U19ESVIpIFwKPj4gICAgICAgICBIT1NUTERGTEFHUz0iJChIT1NUX0xERkxBR1MpIgo+Pgo+PiAg
ZGVmaW5lIFRJX0szX1I1X0xPQURFUl9CVUlMRF9DTURTCj4+IC0tCj4+IDIuNDMuMAo+Pgo+PiBf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+PiBidWlsZHJv
b3QgbWFpbGluZyBsaXN0Cj4+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4+IGh0dHBzOi8vbGlz
dHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo+Cj4gX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBidWlsZHJvb3QgbWFpbGlu
ZyBsaXN0Cj4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKPiBodHRwczovL2xpc3RzLmJ1aWxkcm9v
dC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RA
YnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5m
by9idWlsZHJvb3QK
