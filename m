Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42CC2CD37AA
	for <buildroot@archiver.kernel.org>; Tue,  3 Sep 2024 19:34:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F005D6085B;
	Tue,  3 Sep 2024 19:34:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 82RDTDru_MoP; Tue,  3 Sep 2024 19:34:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 63DCC60889
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 63DCC60889;
	Tue,  3 Sep 2024 19:34:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 278181BF344
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 19:34:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 228F380F5B
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 19:34:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pKzF3Lb1ITBZ for <buildroot@lists.busybox.net>;
 Tue,  3 Sep 2024 19:34:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62f; helo=mail-ej1-x62f.google.com;
 envelope-from=michael@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E978480F4D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E978480F4D
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E978480F4D
 for <buildroot@buildroot.org>; Tue,  3 Sep 2024 19:34:13 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a867a564911so682720066b.2
 for <buildroot@buildroot.org>; Tue, 03 Sep 2024 12:34:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725392052; x=1725996852;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gCWmhmZbnzMifzHm2y79urXKSe1+OC7y/c6xiac+Bj0=;
 b=TkNo2x6I+g+g85Zo90ckqxra2chamzt8LHYsoUq/Rl/7n7tPbjV+vBL2Zg4LJ9twTG
 EguLGJ/y/mNfizS0tVrmUz2l7P/+1ubkTA+QqdbPK3e0ZUsljIrgCibwwD1BiXDV/AGe
 xfUSLfDwIWGM8YKX5p/dqr900AlhE9j7I4gLYy1aLNEUCzuv8LSukZXuzGRzNiMrueyL
 79WHN+IeRai/Q/UHmUoIHT4fBbjwhy161Lz7DX3M0zL4s+YQCRJYCT37u4NRIfcsfw5P
 1IdAGxImTajJ2u8TS3NOrHDRUGt2vBDdI/BMOD9+E6WBl8P7XxObuuiDi1WdWVJCi5Ck
 eKAg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVfE5PHzRqtLLVHr5+lpHt6ctrNuM3DP3pH3whZtdBDgBRL0M3vOoC6lKfZRvNMRxpsC6wBWPtWG3g=@buildroot.org
X-Gm-Message-State: AOJu0YxoR1IsMu9AZckB4piGK9Om+XLBY5cmc1rR0LKMC1NfgJ8EVuj6
 ebIZU7JThadCWBMPaXUTsDP4SnEkHknay8zvwQQAXYFrXK4ztFoARoDXxUBHzfEMUg2XsfrfHen
 0aUgBGinsgP5D7qW2zEVptPD13dAL4/x3ZXmgWBUov9fAc3hDP2U=
X-Google-Smtp-Source: AGHT+IGsslvoIy+xyp59TjekcMIj7If3CsXcmcW+/g4GH2yx97+t0ROjLqtiCdQj0LEUfaCgSVNULic1FVfF+l3rIhU=
X-Received: by 2002:a17:906:730a:b0:a86:a4b1:d2b8 with SMTP id
 a640c23a62f3a-a89b93da137mr750411166b.4.1725392050964; Tue, 03 Sep 2024
 12:34:10 -0700 (PDT)
MIME-Version: 1.0
References: <20240903085745.2594893-1-michael@amarulasolutions.com>
 <20240903205015.06fd36ac@windsurf> <ZtdibkjGC5Zl7_DB@landeda>
In-Reply-To: <ZtdibkjGC5Zl7_DB@landeda>
From: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Date: Tue, 3 Sep 2024 21:34:00 +0200
Message-ID: <CAOf5uwnogJjN5memGqd=0+ryAhLqL+Gfj-qtPozr+sgG1=S7DA@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1725392052; x=1725996852;
 darn=buildroot.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gCWmhmZbnzMifzHm2y79urXKSe1+OC7y/c6xiac+Bj0=;
 b=gLaHiZs32mcd6BUqWC3YBAVb9Ytzm9KzBLtjhnH1T1f6Zgc9n2gPDOW4P9YvN9khEC
 0so1z9VAtw/cXK0/kHzt4iNS+Lsbv/vzp9zkl7RWE8SyfrRn4rsC6E2Z2eQ/fdYapa/x
 4XCTGEUyvoPPQoXMf/2Jn6pKtK4oOFIgzlg9Q=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=gLaHiZs3
Subject: Re: [Buildroot] [PATCH V2 1/2] scripts/cve: Avoid to do a complete
 clone of cve git repository
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
Cc: linux-amarula@amarulasolutions.com,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgWWFubgoKT24gVHVlLCBTZXAgMywgMjAyNCBhdCA5OjI04oCvUE0gWWFubiBFLiBNT1JJTiA8
eWFubi5tb3Jpbi4xOTk4QGZyZWUuZnI+IHdyb3RlOgo+Cj4gTWljaGFlbCwgQWxsLAo+Cj4gT24g
MjAyNC0wOS0wMyAyMDo1MCArMDIwMCwgVGhvbWFzIFBldGF6em9uaSB2aWEgYnVpbGRyb290IHNw
YWtlIHRodXNseToKPiA+IE9uIFR1ZSwgIDMgU2VwIDIwMjQgMTA6NTc6NDQgKzAyMDAKPiA+IE1p
Y2hhZWwgVHJpbWFyY2hpIDxtaWNoYWVsQGFtYXJ1bGFzb2x1dGlvbnMuY29tPiB3cm90ZToKPiA+
Cj4gPiA+IEp1c3QgYSBzaW1wbGUgY2xvbmUgYW5kIHB1bGwgd2l0aCAtLWRlcHRoIDEgc2hvdWxk
IGJlIGVub3VnaCB0byBwYXJzZSB0aGUKPiA+ID4gY3ZlIGFuZCBnZW5lcmF0ZSB0aGUgcGtnLXN0
YXRzIHJlcG9ydC4KPiA+ID4KPiA+ID4gRnJvbSBhIGZ1bGwgY2xvbmUgYW5kIGEgZGVwdGgtMSBj
bG9uZSwgYW5kIHRoZSBzaXplIGRlbHRhIGlzIDIuOUdpQiB2cy4gMi4yR2lCLgo+ID4gPiBUaGUg
ZG93bmxvYWQgc2l6ZSBkb2VzIGNoYW5nZTogZnJvbSA5ODMuNTVNaUIgZG93biB0byAyNzAuNzhN
aUIuCj4gPiA+IGl0J3MgYSBuZXQgdGltZSB3aW4gdG9vOiAybTE3cyB2cyAxbWluN3MgKG9uIGEg
MTAwTWJwcyBsaW5rKS4KPiA+ID4KPiA+ID4gU2lnbmVkLW9mZi1ieTogTWljaGFlbCBUcmltYXJj
aGkgPG1pY2hhZWxAYW1hcnVsYXNvbHV0aW9ucy5jb20+Cj4gPiA+IC0tLQo+ID4gPiBWMS0+VjI6
Cj4gPiA+ICAgICAtIEFkZCBzdGF0aXN0aWNzIGZyb20gWWFubiBFLiBNb3Jpbgo+ID4gPiAgICAg
LSBVc2UgZ2l0IHB1bGwgLS1kZXB0aCAxIGZvciB1cGRhdGUgdGhlIHJlcG8KPiA+Cj4gPiBBcHBs
aWVkIHRvIG5leHQsIHRoYW5rcyEKPgo+IEkgZG9uJ3QgdW5kZXJzdGFuZDogTWljaGFlbCBzYWlk
IGluIHRoZSBmaXJzdCBpdGVyYXRpb24gdGhhdCB3ZSBzaG91bGQKPiBkcm9wIHRoZSBwYWNrYWdl
Ogo+ICAgICBodHRwczovL2xvcmUua2VybmVsLm9yZy9idWlsZHJvb3QvQ0FPZjV1dz1tNExPazk3
T1QxZFRQPTItdVA2UVoxV1F5SGZLWVNRbVdDaXJEYXhYdmdRQG1haWwuZ21haWwuY29tLwo+Cj4g
T25seSB0aGUgZmlyc3QgY2xvbmUgaXMgc2xvdywgdGhlIGZvbGxvd2luZyBjYWxscyB3aWxsIGp1
c3QgcHVsbCAobW9zdGx5Cj4gbm90aGluZyBtb3N0IG9mIHRoZSB0aW1lKSwgc28gdGhlIG9wdGlt
aXNhdGlvbiBpcyBub3QgcmVhbGx5IHdvcnRoIGl0Lgo+Cj4gQWxzbywgaW4gdGhlIGRvd25sb2Fk
IGJhY2tlbmQgZm9yIGdpdCwgd2Ugc3RvcHBlZCBkb2luZyBzaGFsbG93IGNsb25lCj4gYmVjYXVz
ZSB0aGV5IHdlcmUgY2F1c2luZyBpc3N1ZXMgKGJ1dCBtaWdodCBub3QgYmUgYXBwbGljYWJsZSBo
ZXJlKS4KPgoKSSBoYXZlIHJlcG9zdGVkIGl0LCBmaXhpbmcgdGhlIHB1bGwuIFlhbm4gaWYgeW91
IHJlYWxseSBkb24ndCBsaWtlIGl0LApwZW9wbGUgY2FuIGRyb3AsIHJldmVydAoKTWljaGFlbAoK
PiBBbnl3YXksIHRvbyBsYXRlLCB0aGF0J3MgYmVlbiBhcHBsaWVkLi4uCj4KPiBSZWdhcmRzLAo+
IFlhbm4gRS4gTU9SSU4uCj4KPiAtLQo+IC4tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0t
LS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uCj4gfCAgWWFu
biBFLiBNT1JJTiAgfCBSZWFsLVRpbWUgRW1iZWRkZWQgfCAvIlwgQVNDSUkgUklCQk9OIHwgRXJp
Y3MnIGNvbnNwaXJhY3k6IHwKPiB8ICszMyA2NjIgMzc2IDA1NiB8IFNvZnR3YXJlICBEZXNpZ25l
ciB8IFwgLyBDQU1QQUlHTiAgICAgfCAgX19fICAgICAgICAgICAgICAgfAo+IHwgKzMzIDU2MSAw
OTkgNDI3IGAtLS0tLS0tLS0tLS0uLS0tLS0tLTogIFggIEFHQUlOU1QgICAgICB8ICBcZS8gIFRo
ZXJlIGlzIG5vICB8Cj4gfCBodHRwOi8veW1vcmluLmlzLWEtZ2Vlay5vcmcvIHwgXy8qXF8gfCAv
IFwgSFRNTCBNQUlMICAgIHwgICB2ICAgY29uc3BpcmFjeS4gIHwKPiAnLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tXi0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS0tLS0tLS0t
LS0tLS0tJwoKCgotLSAKTWljaGFlbCBOYXp6YXJlbm8gVHJpbWFyY2hpCkNvLUZvdW5kZXIgJiBD
aGllZiBFeGVjdXRpdmUgT2ZmaWNlcgpNLiArMzkgMzQ3IDkxMyAyMTcwCm1pY2hhZWxAYW1hcnVs
YXNvbHV0aW9ucy5jb20KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwoKQW1hcnVs
YSBTb2x1dGlvbnMgQlYKSm9vcCBHZWVzaW5rd2VnIDEyNSwgMTExNCBBQiwgQW1zdGVyZGFtLCBO
TApULiArMzEgKDApODUgMTExIDkxNzIKaW5mb0BhbWFydWxhc29sdXRpb25zLmNvbQp3d3cuYW1h
cnVsYXNvbHV0aW9ucy5jb20KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpo
dHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
