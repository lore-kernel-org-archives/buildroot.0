Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE10ACAC5A7
	for <buildroot@archiver.kernel.org>; Sun, 21 Sep 2025 11:54:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5C9B9810A6;
	Sun, 21 Sep 2025 11:54:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R_ncKV5gp-Im; Sun, 21 Sep 2025 11:54:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 68D688108F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 68D688108F;
	Sun, 21 Sep 2025 11:54:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 45E79E7
 for <buildroot@buildroot.org>; Sun, 21 Sep 2025 11:54:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 430AB40684
 for <buildroot@buildroot.org>; Sun, 21 Sep 2025 11:54:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kD4VKQcoz4Zq for <buildroot@buildroot.org>;
 Sun, 21 Sep 2025 11:54:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::b2e; helo=mail-yb1-xb2e.google.com;
 envelope-from=softwarej@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1AA394008A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1AA394008A
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com
 [IPv6:2607:f8b0:4864:20::b2e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1AA394008A
 for <buildroot@buildroot.org>; Sun, 21 Sep 2025 11:54:25 +0000 (UTC)
Received: by mail-yb1-xb2e.google.com with SMTP id
 3f1490d57ef6-ea5d856ac28so2432732276.1
 for <buildroot@buildroot.org>; Sun, 21 Sep 2025 04:54:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758455665; x=1759060465;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SVZW4Cfj1lCt7+H8iJY04+YAxfoF/oFdPeAfBz+lI0E=;
 b=sJymgCMQ4YJhrdhzydnYsY9ZBlHubne4bZ3K9xpWSkqhHD2RYgUqiq4Fuyg0Ix523y
 k7bqu0kXCuvKxgfGEqByQO0fpXFRTa2Zuxk8w2uW5jvdgRlzvVWmqjfRgaoa4gwGp4Qi
 S6ZQtkU7geaaRlVsutvwqNtH3FzgtvPTZ6yjaLZCINOh2TpVzDzAC86GPjxtU3udF6Hy
 qVP3AyXhsdMoPvNNOZY4OCTp3p6kRW9niCRoQPOa5H3hze5NSegmTOCWbbGebBiWVzWm
 6/OwoS6wh1zOs3ZTYE3fqWpDPPZ25ll5onfrFr96P9pTDG4WpbneYWAyUXIQ5qlQ8j36
 4ldA==
X-Gm-Message-State: AOJu0YzR3a3dN91pHPD+nZ3J8ZpaCl4ygwzhrOXktXPxNjhUqfwoV12n
 ITCkS0l0jVFUWoAZnwHs0evlj1akJNXmI0pV9cmFnKkyNhLbfvNadPUM+06VOB7IkwnMwY5uxI5
 iiLSfI8Y+xyHf9bBItNnaAY9ZG88NbPbZ1BnU
X-Gm-Gg: ASbGncv8A0NNp7eGpHgvr50TWqv7sGH+X3yZBeTy1PAxDS0g3hFHj/IwtWnIcLFPzkN
 XdmDSjvWEjm8zgLtXlXxoqPLudtBi4J5Py01NfVhsd2av5I1cQu/TKKoc2a3SaZwdLOjtbQYIdA
 Z5o3p5zpDRKZoViLTb0etmGfVOrR2lpTx36vvpnCa754DSQamlOGjuKtMOnk49mBhdcsIgdVLs7
 UGHCbQ=
X-Google-Smtp-Source: AGHT+IG/r9fuBqPqTINQIbaA3APvaVaqX+MX21Wv9vxw3TZc3B3DkUIA7dG3wqUjMNNqZWxtUpyXDuYrky8+D4Qt2xo=
X-Received: by 2002:a05:690c:7481:b0:735:6fbc:596c with SMTP id
 00721157ae682-73d31415f87mr94118217b3.12.1758455664574; Sun, 21 Sep 2025
 04:54:24 -0700 (PDT)
MIME-Version: 1.0
References: <20250920155803.829424-1-romain.naour@smile.fr>
In-Reply-To: <20250920155803.829424-1-romain.naour@smile.fr>
From: =?UTF-8?Q?Jos=C3=A9_Luis_Salvador_Rufo?= <salvador.joseluis@gmail.com>
Date: Sun, 21 Sep 2025 13:54:13 +0200
X-Gm-Features: AS18NWDl9zooicm_qH7H5jIm0FyomMf_JtGFRSQKCql8z_gZWE249jMuA1VMJug
Message-ID: <CAH+XeQYrem1jmpiaf5VMuTUEwiQD9qQKiJfCm_3ajLJOLmr4EA@mail.gmail.com>
To: Romain Naour <romain.naour@smile.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758455665; x=1759060465; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SVZW4Cfj1lCt7+H8iJY04+YAxfoF/oFdPeAfBz+lI0E=;
 b=fg230CCUIZdJDA4mvz2W+tXzRNCMXn9V5j+T1iYGeDSUp6MYkhBr/Al+MAMrN9FjXV
 2eM0gMqI2JyXmhbZVHNqUQkP4gPiV1U694blZHrF3nUW7X2y6fqwJy+eg1Q276S4r3E7
 EluH9J0gzOm/sUq5gbdkvl6KFJ/KzQJdTWoKDtvkxmfUqFeOYjX5XsiwZKI9hyRGC0oI
 qycWwlsQXVDmL/pKXmBFADgdLGABZcS6TVNcQDQcIXtG4PlnAF82aDKlxUPAZdvts15B
 KkRNNqkUlBqewPgVNrZCiH10YRiVbn3q3FsgJyPOusmLDepPL7dlNo5M2ERQMXu3FWGp
 L4Yg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=fg230CCU
Subject: Re: [Buildroot] [PATCHv2] support/testing: TestZfsUclibc: use
 internal backend for uClibc-ng toolchain
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhhbmsgeW91IGFsbCEKCkVsIHPDoWIsIDIwIHNlcHQgMjAyNSBhIGxhcyAxNzo1OCwgUm9tYWlu
IE5hb3VyCig8cm9tYWluLm5hb3VyQHNtaWxlLmZyPikgZXNjcmliacOzOgo+Cj4gQXMgcmVwb3J0
ZWQgb24gdGhlIG1haWxpbmcgbGlzdCBbMV0gd2hpbGUgaW52ZXN0aWdhdGluZyB0aGUKPiBUZXN0
WmZzVWNsaWJjIEdpdGxhYi1DSSBmYWlsdXJlLCB0aGUgcHl0aG9uIDMuMTMgaW50ZXJwcmV0ZXIg
aXRzZWYKPiBzZWdmYXVsdCBhdCBydW50aW1lOgo+Cj4gICBGYXRhbCBQeXRob24gZXJyb3I6IF9Q
eVRocmVhZFN0YXRlX0F0dGFjaDogbm9uLU5VTEwgb2xkIHRocmVhZCBzdGF0ZQo+ICAgUHl0aG9u
IHJ1bnRpbWUgc3RhdGU6IHByZWluaXRpYWxpemVkCj4gICBUaHJlYWQgMHhTZWdtZW50YXRpb24g
ZmF1bHQKPgo+IFRoaXMgaXNzdWUgaXMgcmVsYXRlZCB0byB0aGUgcHl0aG9uIDMuMTMgdmVyc2lv
biBidW1wIFsyXSB3ZXJlIHNldmVyYWwKPiBpbnRlcm5hbCBjaGFuZ2VzIHdlcmUgYWRkZWQgWzNd
IHRvIHN1cHBvcnQgUEVQIDcwMyBbNF0uCj4gUEVQIDc5MyBpcyBhYm91dCBDUHl0aG9u4oCZcyBn
bG9iYWwgaW50ZXJwcmV0ZXIgbG9jayAo4oCcR0lM4oCdKSByZW1vdmFsCj4gZm9yIG11bHRpLXRo
cmVhZHMgc3VwcG9ydCB0aGF0IHJlcXVpcmVzIGEgd29ya2luZyBDMTEgInRocmVhZF9sb2NhbCIK
PiBmb3IgdGhyZWFkLWxvY2FsIHN0b3JhZ2UgWzVdLgo+Cj4gVGhlIG5ldyB1Y2xpYmMtbmcgMS4w
LjU1IHJlbGVhc2UgY29udGFpbnMgYSBmaXggZm9yIHRoaXMgaXNzdWUgWzZdLgo+Cj4gU2luY2Ug
dGhlIHByZWJ1aWx0IEJvb3RsaW5nIGFhcmNoNjQgdWNsaWJjIHN0YWJsZSAyMDI1LjA4LTEgaXMg
YmFzZWQKPiBvbiBwcmV2aW91cyB1Q2xpYmMtbmcgcmVsZWFzZSAoMS4wLjU0KSB3ZSBoYXZlIHRv
IHVzZSB0aGUgaW50ZXJuYWwKPiB0b29sY2hhaW4gYmFja2VuZCB0byBidWlsZCBhIG5ldyB1Q2xp
YmMtbmcgdG9vbGNoYWluIHVzaW5nIHVjbGliYy1uZwo+IDEuMC41NS4KPgo+IEZpeGVzOgo+IGh0
dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJvb3Qub3JnL2J1aWxkcm9vdC8tL2pvYnMvMTEyNzExMjQ4
NTkgKFRlc3RaZnNVY2xpYmMpCj4KPiBbMV0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYnVpbGRy
b290LzdhNGQyNDVkLTE1NTYtNDNjOS04OTk3LTZiMWY3OTFhZmJmZUBnbWFpbC5jb20vIChUZXN0
WmZzVWNsaWJjKQo+IFsyXSBkNjNlMjA3ZWI4NjkwNjNmODJjODY3NjU4Njc2YzI5MDNiZWIwOGNi
Cj4gWzNdIGh0dHBzOi8vZ2l0aHViLmNvbS9weXRob24vY3B5dGhvbi9jb21taXQvNmU5N2E5NjQ3
YWUwMjhmYWNiMzkyZDEyZmMyNDk3MzUwMzY5M2JkNgo+IFs0XSBodHRwczovL3BlcHMucHl0aG9u
Lm9yZy9wZXAtMDcwMy8KPiBbNV0gaHR0cHM6Ly9nY2MuZ251Lm9yZy9vbmxpbmVkb2NzL2djYy0x
NS4xLjAvZ2NjL1RocmVhZC1Mb2NhbC5odG1sCj4gWzZdIGh0dHBzOi8vZ2l0aHViLmNvbS93Yngt
Z2l0aHViL3VjbGliYy1uZy9jb21taXQvOTRjMTI5N2Q1MjI2M2UyMGNkOTcxNTYwMWFmYTM3ZjQ5
ZDAwOGQ5Mwo+Cj4gQ2M6IEpvc8OpIEx1aXMgU2FsdmFkb3IgUnVmbyA8c2FsdmFkb3Iuam9zZWx1
aXNAZ21haWwuY29tPgpUZXN0ZWQtYnk6IEpvc8OpIEx1aXMgU2FsdmFkb3IgUnVmbyA8c2FsdmFk
b3Iuam9zZWx1aXNAZ21haWwuY29tPgo+IENjOiBXYWxkZW1hciBCcm9ka29yYiA8d2J4QG9wZW5h
ZGsub3JnPgo+IFNpZ25lZC1vZmYtYnk6IFJvbWFpbiBOYW91ciA8cm9tYWluLm5hb3VyQHNtaWxl
LmZyPgo+IC0tLQo+IHYyOiBGb2xsb3dpbmcgdGhlIHVDbGliYy1uZyAxLjAuNTUgcmVsZWFzZSwg
dXBkYXRlIFRlc3RaZnNVY2xpYmMgY2hhbmdlcwo+ICAgICB0byB1c2UgaW50ZXJuYWwgdG9vbGNo
YWluIGJhY2tlbmQuCj4gICAgIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2J1aWxkcm9vdC9hTTJm
REwxSUhneFg3YXJ6QHdhbGRlbWFyLWJyb2Rrb3JiLmRlL1QvI3UKPiAtLS0KPiAgc3VwcG9ydC90
ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF96ZnMucHkgfCAxMyArKysrKysrKysrKy0tCj4gIDEg
ZmlsZSBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAt
LWdpdCBhL3N1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfemZzLnB5IGIvc3VwcG9y
dC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF96ZnMucHkKPiBpbmRleCAxYjkwN2FjNGRlLi5j
MjE4Y2MzNmE4IDEwMDY0NAo+IC0tLSBhL3N1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rl
c3RfemZzLnB5Cj4gKysrIGIvc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF96ZnMu
cHkKPiBAQCAtNzQsOSArNzQsMTggQEAgY2xhc3MgVGVzdFpmc0dsaWJjKFRlc3RaZnNCYXNlKToK
Pgo+Cj4gIGNsYXNzIFRlc3RaZnNVY2xpYmMoVGVzdFpmc0Jhc2UpOgo+IC0gICAgY29uZmlnID0g
VGVzdFpmc0Jhc2UuY29uZmlnICsgXAo+ICsgICAgIyBUaGUgQm9vdGxpbmcgYWFyY2g2NCB1Y2xp
YmMgc3RhYmxlIDIwMjUuMDgtMSBuZWVkcyB0byBiZQo+ICsgICAgIyByZWJ1aWxkIHdpdGggdUNs
aWJjLW5nIDEuMC41NS4KPiArICAgICMgU2VlOiBodHRwczovL2dpdGh1Yi5jb20vd2J4LWdpdGh1
Yi91Y2xpYmMtbmcvY29tbWl0Lzk0YzEyOTdkNTIyNjNlMjBjZDk3MTU2MDFhZmEzN2Y0OWQwMDhk
OTMKPiArICAgIGNvbmZpZyA9IFRlc3RaZnNCYXNlLmNvbmZpZy5yZXBsYWNlKCdCUjJfVE9PTENI
QUlOX0VYVEVSTkFMPXlcbicsICcnKQo+ICsgICAgY29uZmlnID0gY29uZmlnLnJlcGxhY2UoJ0JS
Ml9UT09MQ0hBSU5fRVhURVJOQUxfQk9PVExJTj15XG4nLCAnJykgKyBcCj4gICAgICAgICAgIiIi
Cj4gLSAgICAgICAgQlIyX1RPT0xDSEFJTl9FWFRFUk5BTF9CT09UTElOX0FBUkNINjRfVUNMSUJD
X1NUQUJMRT15Cj4gKyAgICAgICAgQlIyX1RPT0xDSEFJTl9CVUlMRFJPT1RfVUNMSUJDPXkKPiAr
ICAgICAgICBCUjJfS0VSTkVMX0hFQURFUlNfNV80PXkKPiArICAgICAgICBCUjJfVE9PTENIQUlO
X0JVSUxEUk9PVF9MT0NBTEU9eQo+ICsgICAgICAgIEJSMl9QVEhSRUFEX0RFQlVHPXkKPiArICAg
ICAgICBCUjJfVE9PTENIQUlOX0JVSUxEUk9PVF9DWFg9eQo+ICsgICAgICAgIEJSMl9HQ0NfRU5B
QkxFX09QRU5NUD15Cj4gICAgICAgICAgIiIiCj4KPiAgICAgIGRlZiB0ZXN0X3J1bihzZWxmKToK
PiAtLQo+IDIuNTEuMAo+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0
cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
