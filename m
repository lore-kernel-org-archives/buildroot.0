Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6580CC3DA4A
	for <buildroot@archiver.kernel.org>; Fri,  2 Aug 2024 18:00:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2BC0080F03;
	Fri,  2 Aug 2024 18:00:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lJ64UK5wIVra; Fri,  2 Aug 2024 18:00:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1A1E68134E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1A1E68134E;
	Fri,  2 Aug 2024 18:00:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 61D641BF41C
 for <buildroot@lists.busybox.net>; Fri,  2 Aug 2024 18:00:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4B7358134E
 for <buildroot@lists.busybox.net>; Fri,  2 Aug 2024 18:00:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cpuEVY9JaUzF for <buildroot@lists.busybox.net>;
 Fri,  2 Aug 2024 18:00:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::102b; helo=mail-pj1-x102b.google.com;
 envelope-from=jcmvbkbc@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3C43E80F03
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3C43E80F03
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3C43E80F03
 for <buildroot@buildroot.org>; Fri,  2 Aug 2024 18:00:15 +0000 (UTC)
Received: by mail-pj1-x102b.google.com with SMTP id
 98e67ed59e1d1-2cd2f89825fso5903052a91.1
 for <buildroot@buildroot.org>; Fri, 02 Aug 2024 11:00:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722621614; x=1723226414;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dHmsA5JK6oIMiW9A917vNEvuJPmz08WYx1k2qA41Tmc=;
 b=oTRCiRIUQGFM73LDqfqSVU5Ff3rSNL5AtzqvYxXG7kKyuZbfj+4m1GZ7CPoFwvy6/t
 R2QyY+Xd0XhW5WNEWa5v46E2lh714a2zJSNb1oMp2HzLcy+MI9IEY01k2kT2DfdI+CNF
 lotspl9aqVL1hhz6hElAfeIhptJugXPhcPmmR22flB1gb6bpBN9osSvXO3H17OWaPubf
 cry0Jg16RAlLP63OHpq7vexbKsXjIWXzTVvdCHPuqdRHbe/BzFz3+PlPzQdksPgfbNkr
 C5WAgqSJfEb/cEazwLBoAydTFi3dGkZn6loOe88qsTjOg2Pc30j4ynvOwJBRq59XxckN
 2bag==
X-Gm-Message-State: AOJu0Yz0KRK0zDxI1uz0EVyLEdoMWzQQa0JZu8UJcb0e9hu6+pVqf71Y
 lKKBaiEZDA7hInJmS7JS80pWZAP5/WS+u5J1ry/Lc89CmkbDRnzJozkMdVERpa3S9ITj22ErXKy
 Pzn73FO7l65EyYZD9xebEAmOzMDp/Kv/v
X-Google-Smtp-Source: AGHT+IGPq8+AcIJZgI/4SLHOu8LBV7eB1FLBA/buZQnatvJbMOUUPx3A6X93MQuQnaNDH4XkgGnYpfJcxSKH2k+bu8w=
X-Received: by 2002:a17:90a:f312:b0:2c9:7616:dec7 with SMTP id
 98e67ed59e1d1-2cff93c581cmr5171127a91.6.1722621614381; Fri, 02 Aug 2024
 11:00:14 -0700 (PDT)
MIME-Version: 1.0
References: <20240802170713.2790A83B45@busybox.osuosl.org>
 <CAMo8BfK7FSn8imzqjTW8BLS7mPk6HLTKvCM4aBFaJw93z-ZpmQ@mail.gmail.com>
 <20240802194315.2de20808@windsurf>
In-Reply-To: <20240802194315.2de20808@windsurf>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Fri, 2 Aug 2024 11:00:02 -0700
Message-ID: <CAMo8Bf+5XSQyEp1ZP1UbqL7DF=VLfWbUuA-3OFY9M7WENn0GaA@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1722621614; x=1723226414; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dHmsA5JK6oIMiW9A917vNEvuJPmz08WYx1k2qA41Tmc=;
 b=QpELPGQWBeyBWWQCYrxmIzJa5hEzpAvCk2fMyzXdZd/wVgKouAVnhH3KmxiLJSsSrs
 5Q23McAMmNPPVYf9EOygZ1c2jk4bAhIxA1vmzNp+V5qYfs61CVmx9Xlh3H8OXtHtlH+R
 pNXKNbs9DeKGkttFghIHM5Q51xY4hBMPG1QbQWIWwMLMb+KEslHYN6+9HLu4Vr8kzpT5
 dt8bY1W9V9jsbMbVbe9XjLzhNNMboNY1EzdT8Iu04DMOsJi8jXccltvI4E1IuZzWcoHE
 v+lDI1hIXNaWm4nGmgtI+90xPI3wQo6u50VN7Mdl6KgDhAU1nM3QJtEG7Fr/LfTses5g
 G+rw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=QpELPGQW
Subject: Re: [Buildroot] [git commit] package/chicken: move literals into
 text section for xtensa architecture
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
Cc: Woodrow Douglass <wdouglass@carnegierobotics.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gRnJpLCBBdWcgMiwgMjAyNCBhdCAxMDo0M+KAr0FNIFRob21hcyBQZXRhenpvbmkKPHRob21h
cy5wZXRhenpvbmlAYm9vdGxpbi5jb20+IHdyb3RlOgo+IE9uIEZyaSwgMiBBdWcgMjAyNCAxMDoy
NDoyMCAtMDcwMAo+IE1heCBGaWxpcHBvdiA8amNtdmJrYmNAZ21haWwuY29tPiB3cm90ZToKPgo+
ID4gPiArK2lmZXEgKCQoQVJDSCkseHRlbnNhKQo+ID4gPiArK0NfQ09NUElMRVJfT1BUSU9OUyAr
PSAtbXRleHQtc2VjdGlvbi1saXRlcmFscwo+ID4gPiArK0xJTktFUl9PUFRJT05TICs9IC1tdGV4
dC1zZWN0aW9uLWxpdGVyYWxzCj4gPgo+ID4gVGhlcmUncyBhIHN0cm9uZ2VyIHZlcnNpb24gb2Yg
dGhpcyBvcHRpb24sIC1tYXV0by1saXRwb29scywgaW4gdGhlIHh0ZW5zYQo+ID4gVEFSR0VUX0FC
SSBhbmQgaXQgaXMgcGFzc2VkIHRvIHRoZSBUQVJHRVRfQ0ZMQUdTLiBXaHkgZG9lcwo+ID4gdGhp
cyBwYWNrYWdlIG5lZWQgc3BlY2lhbCB0cmVhdG1lbnQ/Cj4KPiBJdCBjYXVzZXMgYnVpbGQgZmFp
bHVyZXM6Cj4KPiAgIGh0dHA6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm5ldC9yZXN1bHRzL2NlMzYx
NzBkNjdjNDcwMmYzNGJlZTAyNWQ4YTQ2ZTUyNjljNDU3M2UvCgpJIHNlZSB0aGUgZm9sbG93aW5n
IGluIHRoZSBidWlsZC1lbmQubG9nOgoKL2hvbWUvYXV0b2J1aWxkL2F1dG9idWlsZC9pbnN0YW5j
ZS0yL291dHB1dC0xL3Blci1wYWNrYWdlL2NoaWNrZW4vaG9zdC9iaW4veHRlbnNhLWJ1aWxkcm9v
dC1saW51eC11Y2xpYmMtZ2NjCi1mbm8tc3RyaWN0LWFsaWFzaW5nIC1md3JhcHYgLURIQVZFX0NI
SUNLRU5fQ09ORklHX0gKLURDX0VOQUJMRV9QVEFCTEVTIC1jIC1PcyAtZm9taXQtZnJhbWUtcG9p
bnRlciAtZlBJQyAtRFBJQwotRENfQlVJTERJTkdfTElCQ0hJQ0tFTiBsaWJyYXJ5LmMgLW8gbGli
cmFyeS5vIC1JLiAtSS4vCgpUaGVyZSdzIG5vIFRBUkdFVF9DRkxBR1MgaW4gdGhpcyBjb21tYW5k
IGxpbmUuCgo+IFRoZXJlJ3Mgc29tZSBleHBsYW5hdGlvbiBmcm9tIHRoZSBwYXRjaCBjb250cmli
dXRvciBpbiB0aGUgY29tbWl0Cj4gbWVzc2FnZSBCVFc6Cj4KPiAgICAgVGhpcyBzb2x2ZXMgYSBi
dWlsZCBwcm9ibGVtIC0tIGJ5IGRlZmF1bHQgeHRlbnNhLWdjYyBwdXRzIGxpdGVyYWxzIGluIGEK
PiAgICAgZGlmZmVyZW50IHNlY3Rpb24gb2YgbWVtb3J5IHRoZW4gdGhlIHByb2dyYW0gdGV4dCwg
YW5kIGNoaWNrZW4gaXMgYSB2ZXJ5Cj4gICAgIGxpdGVyYWwtaGVhdnkgcHJvZ3JhbSwgc28gdGhl
eSBkb24ndCBhbGwgZml0IHRoZXJlLiBUaGlzIGF2b2lkcyB0aGF0IHByb2JsZW0uCgp4dGVuc2Eg
VEFSR0VUX0FCSSBmbGFnIC1tYXV0by1saXRwb29sIGlzIHRoZXJlIHRvIGFkZHJlc3MgdGhpcyBz
cGVjaWZpYyBpc3N1ZS4KCi0tIApUaGFua3MuCi0tIE1heApfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9v
dEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2J1aWxkcm9vdAo=
