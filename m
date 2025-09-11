Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AD1CCAC587
	for <buildroot@archiver.kernel.org>; Thu, 11 Sep 2025 17:23:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 04F7C42341;
	Thu, 11 Sep 2025 17:23:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C9OkIgbjEGN9; Thu, 11 Sep 2025 17:23:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1BA9E4233E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1BA9E4233E;
	Thu, 11 Sep 2025 17:23:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1662D234
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 17:23:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 085994233E
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 17:23:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lKXdMe7g11ZL for <buildroot@buildroot.org>;
 Thu, 11 Sep 2025 17:23:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::936; helo=mail-ua1-x936.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3097C4233B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3097C4233B
Received: from mail-ua1-x936.google.com (mail-ua1-x936.google.com
 [IPv6:2607:f8b0:4864:20::936])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3097C4233B
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 17:23:10 +0000 (UTC)
Received: by mail-ua1-x936.google.com with SMTP id
 a1e0cc1a2514c-89018e9f902so548573241.0
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 10:23:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757611389; x=1758216189;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0dwqmVtdno8rXqJ1Eaogqlx2XTuBGMA6QUZCIC105OI=;
 b=F1tWJknmo3k2rsMl/op0Ap+I4mizpEzk9GRVoUc2ryAN6ddxyaXshBtSgQP7B+niis
 BBvT4snJ8m2UZswx04tyAHSgfd2hTy9jibsVH4Sd/pzDFEu2s6ujvBj+b3JFbY2w1jJj
 VbBLGUBMW2V1WJZdnudX2xhoML7eOLl6xjnDg+4Jn5AnrLGIn9siLWz3vPzr+C+AmKMD
 vUbOJVf3I2LNJMhy8NXNSjeY2mv+yP3fJvD/DKVz2rdFJw4PBaCd17fdBIz8ph8saUr7
 sTEKeFcf1I4dDxb6zr+Q5kjEU5cisdgAQwfSFb4nY0tMx5H8h4783flyfqfYE8FApGDO
 CEPg==
X-Gm-Message-State: AOJu0Yy6MYvVOBdWMk/4FW2XQ8mZsFltJS25SkJgkJbh8ojMbytd2Qin
 Ua1X9DQkaZcAW0/JKev9z8q0iGlLGY311VqQPfDR7quYZpZA8L0YyvYmuDO5hMiAiC/lDixLx/o
 YisXduDS0FfYfvtG9Pw/0S60OtkyKk7c=
X-Gm-Gg: ASbGncvGdrSDakcigusVOzxuiLXa6vImCwDmpk5SFLmxxmGeQrds4I5Ih8sfiJp+mgk
 8yaMy8PRc8au4wipPZS1huf+cT5UmmXGrwsal3sE4y3msOBFfDHHLi1YclCk03b4u14Al7Ty53J
 /0Kq7X0pAavH0Hj2LHrK95JJV4vjkmCmpmrn9/R/48oT8BKCiM7Nuc3s3CdK7whLV6fF7apM367
 JT1TXNs
X-Google-Smtp-Source: AGHT+IE9dQaErhqv1bu5pBtdAIzUP0jdTqaPObxWzcAvgMrxwxLn6Z7sotIWoG23zOzL2khHs/EY7nlPRN4GxQHpyw0=
X-Received: by 2002:a05:6102:4243:b0:522:255d:4d2e with SMTP id
 ada2fe7eead31-55608ea0ec5mr228917137.7.1757611388631; Thu, 11 Sep 2025
 10:23:08 -0700 (PDT)
MIME-Version: 1.0
References: <20250910183458.1288165-1-james.hilliard1@gmail.com>
 <CA+h8R2ozbY7zf0=x+gP=bgruLYOK7qW1Ex5Sa0x_h_gaqqHrwg@mail.gmail.com>
 <CADvTj4pVPa=j0BrhiJMoiYBmzq_uXbUtUw-xEqdNoWUCkam+VQ@mail.gmail.com>
 <CA+h8R2rhgRvEegJ4a7MZX+iKqqdswN6xRxds0rPu12eh50jvSQ@mail.gmail.com>
 <CADvTj4pzNug8M53i6c2bMcZgKc0_LXrQG22cJ4NA=OSv-qHKJA@mail.gmail.com>
 <CA+h8R2qh53rU4g6_m4EAc+4qPxZZTBXu_-osrojNLMf0HR_+vQ@mail.gmail.com>
 <CA+h8R2o5cONixvA2Gat9=OptwG1XoqURWe87aBa1gZ6NRbQUqw@mail.gmail.com>
In-Reply-To: <CA+h8R2o5cONixvA2Gat9=OptwG1XoqURWe87aBa1gZ6NRbQUqw@mail.gmail.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 11 Sep 2025 11:22:57 -0600
X-Gm-Features: AS18NWDAZY8WXIb8WOIhs_quQ99QgZVrlBCqSuMUSqiO9TTPT7-U41Dk9UGU6qo
Message-ID: <CADvTj4pnRPf1ZCRKuAs7p0pVMm8bPLiMuexhxFn4JcR9G=G5JQ@mail.gmail.com>
To: Christian Stewart <christian@aperture.us>
Cc: buildroot@buildroot.org, Thomas Perale <thomas.perale@mind.be>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757611389; x=1758216189; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0dwqmVtdno8rXqJ1Eaogqlx2XTuBGMA6QUZCIC105OI=;
 b=W5TQTAWSVQH5yfB3Q7dIRpNjlKwgQNIlgG8hMPabmVBK/4P4fRqyohA1aaRiapX9dG
 hY1vDoQiUH6VOExlvyzfnSf98PZmTCpxr1+NyEx0zfvs502MFzBGxHGRts0nQ0LlBQM6
 ZPI/ra8rceOdXuHzW240cPZh+vCn/myD2/xhuWudSdXpmuN5qf4i85u/ykWCvsYNREWk
 K8TImUFmu0KgO8bn1e18XowT1f/X0srmtzebSjX7VuqrYrNV2V9RxxgpeWkLfsRqRZVT
 5QdBxf5XK3k36LjTTEhmWZfEt9g2sdkMHX53OHYG9T5vstu+SDvSGT33cjEjaiolmke3
 StHg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=W5TQTAWS
Subject: Re: [Buildroot] [PATCH 1/2] package/go: bump to version 1.25.1
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

T24gV2VkLCBTZXAgMTAsIDIwMjUgYXQgNDoyOeKAr1BNIENocmlzdGlhbiBTdGV3YXJ0IDxjaHJp
c3RpYW5AYXBlcnR1cmUudXM+IHdyb3RlOgo+Cj4gSmFtZXMsCj4KPiBPbiBXZWQsIFNlcCAxMCwg
MjAyNSBhdCAzOjIy4oCvUE0gQ2hyaXN0aWFuIFN0ZXdhcnQgPGNocmlzdGlhbkBhcGVydHVyZS51
cz4gd3JvdGU6Cj4gPgo+ID4gSGkgSmFtZXMsCj4gPgo+ID4gT24gV2VkLCBTZXAgMTAsIDIwMjUg
YXQgMjo1OeKAr1BNIEphbWVzIEhpbGxpYXJkCj4gPiA8amFtZXMuaGlsbGlhcmQxQGdtYWlsLmNv
bT4gd3JvdGU6Cj4gPiA+Cj4gPiA+IE9uIFdlZCwgU2VwIDEwLCAyMDI1IGF0IDM6NTPigK9QTSBD
aHJpc3RpYW4gU3Rld2FydCA8Y2hyaXN0aWFuQGFwZXJ0dXJlLnVzPiB3cm90ZToKPiA+ID4gPiBq
dXN0IGJlY2F1c2UgdGhpcyB3YXkgaWYgd2UgbmVlZCBnbzEuMjQgZm9yIHNvbWUgcmVhc29uLCBh
IHVzZXIgY2FuCj4gPiA+ID4gcmV2ZXJ0IHRoZSBnbzEuMjUgY29tbWl0Lgo+ID4gPgo+ID4gPiBT
ZWVtcyBraW5kYSBwb2ludGxlc3Mgc2luY2UgdGhlcmUgc2hvdWxkbid0IGJlIGFueSByZWFzb24g
dG8gdXNlIGdvMS4yNCwKPiA+ID4gYnV0IGRvZXNuJ3QgcmVhbGx5IG1hdHRlciB0byBtZS4KPiA+
ID4KPiA+ID4gPiBJZiBwb3NzaWJsZSBsZXQgbWUga25vdyB3aGF0IGNvbmZpZyBjaGFuZ2VzIHRo
ZXJlIHdlcmUuLi4gSSBjb3VsZAo+ID4gPiA+IHJlc3RydWN0dXJlIHlvdXIgY29tbWl0IHRoaXMg
d2F5IGZvciB5b3UgaWYgeW91IGxpa2UgYXMgd2VsbC4KPiA+ID4KPiA+ID4gSWYgeW91IHNxdWFz
aCB5b3VyIDMgY29tbWl0cyBhbmQgY29tcGFyZSB0aGF0IGFnYWluc3QgbXkgcGF0Y2gsIGl0Cj4g
PiA+IHNob3VsZCBiZSBtb3JlIG9idmlvdXMgd2hhdCBhbGwgdGhvc2UgY2hhbmdlcyBhcmUuCj4g
Pgo+ID4gSSBkaWQgZG8gdGhlIGRpZmYgYXMgeW91IHNhaWQgYW5kIHRoZXJlIGFyZSBubyBjb25m
aWcgY2hhbmdlcyAvCj4gPiBkaWZmZXJlbmNlcyB0byBub3RlIG90aGVyIHRoYW4gdGhlIHZlcnNp
b24gIyBvbiBzdGFnZTQuCj4KPiAuLi4gTXkgYmFkLCBJIGRpZCB0aGUgZGlmZiB3cm9uZy4uLiBp
IHNlZSB3aGF0IHlvdSdyZSBzYXlpbmcgbm93Li4KPgo+IE9rLCBJIHdpbGwgbWFyayBteSBjb21t
aXRzIGFzIHN1cGVyY2VkZWQgYW5kIHdlIGNhbiBnbyB3aXRoIHlvdXJzLgoKU291bmRzIGdvb2Qs
IGRpZCB5b3UgZ2V0IGEgY2hhbmNlIHRvIHRlc3QgbXkgcGF0Y2g/CgpXb3VsZCBiZSBnb29kIHRv
IGhhdmUgYSB0ZXN0ZWQtYnkgZm9yIGl0LgoKPgo+IFRoYW5rcywKPiBDaHJpc3RpYW4KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxp
bmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5v
cmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
