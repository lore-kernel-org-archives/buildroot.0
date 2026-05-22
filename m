Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53310CD5BB1
	for <buildroot@archiver.kernel.org>; Fri, 22 May 2026 11:30:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B86DE8536B;
	Fri, 22 May 2026 11:30:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8sgSUwO3FLEq; Fri, 22 May 2026 11:30:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 525D68534A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779449420;
	bh=rLVOFxe4YziaVFbSlVrwnXRr74ZKeiMSFwXW/EA7VnY=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DhkYhf5YwVWjL1CFklApBRn2xc9ws4Ri9jItt4/thpzaGkmHCLBjjnH9dgKBBNDCT
	 ntL8QhU86WOIlqnj4QOvevla5Xb3RWM77Z90UCESte7VfpCj/fzVE/MGhxoTRI0QFt
	 4XTTsOxgVBWcyj+0IzPUX7nX1649jzFPh6aN58Pks67bNzonf19UF06sbKL01di8ag
	 YyVTMxEYJuDHDcXBs9DBxfB1PcV3vaKcnKpv+m39ozwoDuoyR5qUdOnJsRxb+LZQ50
	 PhuRkqyxS+KC1SgMOKnKe1SoCSRYdNkk+ImlH/MpkEFgpVT68gqgwCG9cw1Aql3vAm
	 skUlSr7MXapTA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 525D68534A;
	Fri, 22 May 2026 11:30:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id D82B83B9
 for <buildroot@buildroot.org>; Fri, 22 May 2026 11:30:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C3DF48534A
 for <buildroot@buildroot.org>; Fri, 22 May 2026 11:30:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LJbZxYbPckpM for <buildroot@buildroot.org>;
 Fri, 22 May 2026 11:30:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::c2a; helo=mail-oo1-xc2a.google.com;
 envelope-from=joseph.kogut@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0211685348
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0211685348
Received: from mail-oo1-xc2a.google.com (mail-oo1-xc2a.google.com
 [IPv6:2607:f8b0:4864:20::c2a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0211685348
 for <buildroot@buildroot.org>; Fri, 22 May 2026 11:30:18 +0000 (UTC)
Received: by mail-oo1-xc2a.google.com with SMTP id
 006d021491bc7-69d77a7e28eso772155eaf.2
 for <buildroot@buildroot.org>; Fri, 22 May 2026 04:30:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779449417; cv=none;
 d=google.com; s=arc-20240605;
 b=YLQl4gPRPbaFFF8bCN8w1nI1NPhvPZyHZxnUXodof36Ex6apE7DDr3fZqwf0AknldZ
 e39a6V1JRcL2LRdfhzIyqxQp39oeAnOuXzlU3xi68TQGjt17PaSNx4y3O/SVPyEuGSOx
 O2sJrDbnaviZhK1GRU+3wAuIV5+NU5hFkGQ9lerAFE4k9Rhqhkxfk7Ch9S9ICdVuyzIp
 /ItcpiAIgt4elokd9X+Ixqp3Je/8i9a+w5hMJ81Uqzm7aIX7Wmptuorw+D8Yj6Fw6oj7
 AX7MBk+JKzlmmGLRavOymVaJgmzEpNqCVklofxg7UoIreJ6JgNsCBsbnwmEbWMF9WpPU
 DSIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=cHwcIosGuu2meRGvg8De00qez3M4w03hz2Rlnln9+Lk=;
 fh=I4P7DB3IEMGfKF4XS7p6fy0ZkU+/rl9KxnXFSk/s7Ks=;
 b=HaeCzBc4zu9rv7/GJ2H2PnwDzO5yniz7Q7o/Ci8Rv22Bd69GeB21HkLGnZKbtl2nXW
 ZNaxV8ygbJun8LJ8VH1tVxWDmIOv/31kShin35Ya2a7mN/WpbAQ2SJNaF3iD0SgIpAtd
 2Okbv7pELbfwKQFurrv0xN++qD5gVOk88WDO/yZn9sNhwELUZWaqcgol/AwGbVm22jrm
 /7gdABbjNnVTOLNoCuT5UPp6dHXCUb+bEUzz8lygz7LPLrG3zTzjqOBuXgoi4JeQnrXb
 QKXMGSkYzoGr/EF/MLF9MCcgq5mcwPohTRaDij5hMuB38q4l6uEXO1f5A8PWpHx8NNdz
 MvKw==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779449417; x=1780054217;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=cHwcIosGuu2meRGvg8De00qez3M4w03hz2Rlnln9+Lk=;
 b=DZnA3aJslQSz5Y/PRdC+h1LzgXWUBdtQaOYSKYy8Th5iZyg9wv49+NwnB5LiEeUimc
 ez5cdIKy8g/PI1gKz6WY8MiGn9iAD0lRwlfcgvOT3l2H/EI5zkXY+OlIbkNui6CMSF6s
 jIjrMVEwzl5psA00T5RGvsXt4Hkb+dcwPwcq65rL8SjRV91VXnEnru4xZEyzR8S311M7
 wLunBSJ8tlrrD/lEdH8Nj2U7WH2Jy6NSHDZf2MuHmspTnUuSruxf3QqzZx/xB+X6XtYd
 70aj8Gll50dZSxXCnnwvhUdHcMDvaJJofwD1FGTtwxtRXJRxbYhjJs3BdN7XnBIJPUPu
 +6Mg==
X-Gm-Message-State: AOJu0YyJYhagT5595pBk9pzl/3dSXF+DlBwUAY9fzLe8ceXZGNR8GNgx
 DvvQwS9MziGHyBbDGIwmssffg/06nnA1bqf0xYk2omtLHEfUBAd+r5/Vt1kRe8loP1WxhvH9AX8
 nHJQU4Gvfodg9+0GdYNTdv49/o5/gF3M=
X-Gm-Gg: Acq92OEetMFzZt7teo2yi7wF5Y8G7cvJlFrOdYHBWui4HvpO4fVsTi2eCKa4z6ZchLZ
 R1VLePOpGOAszFd5euPOB7CF/vuTy0rqcXyLJYCb3w0zYGb2IBVv+pLDb4Jlx30TBF9aBmI8RnJ
 6qb6375abGzLwMi6Wxt8Y5rZP6/wiVdPy0aUbdxEybPxfuC8aDtiHaPTllNZCN1yPfKLEIBfy80
 eaFzpK6VfjsTrrsjsSY5wQ5pgjHMGPdhmIdyDQPRMzo2TJYJp0NFEOClEWwZti8+iARY/KFDzLT
 mbl++qe8l5i+EaUeMX39gq1aP6TtA5u63J1IGDx0
X-Received: by 2002:a05:6820:1f05:b0:69b:bf80:2db3 with SMTP id
 006d021491bc7-69d7ec8a6aamr1589278eaf.44.1779449417615; Fri, 22 May 2026
 04:30:17 -0700 (PDT)
MIME-Version: 1.0
References: <20260515-virglrenderer-v7-0-1f1814b65ccd@gmail.com>
 <20260515-virglrenderer-v7-7-1f1814b65ccd@gmail.com>
 <3bca72e7-9bc3-42d8-a642-dfb70cd0a473@rnout.be>
 <CAMWSM7giP4eAmNeDb9SNf9Z+nVxm3h9jn3q8pe1CzG8Pep5TFw@mail.gmail.com>
In-Reply-To: <CAMWSM7giP4eAmNeDb9SNf9Z+nVxm3h9jn3q8pe1CzG8Pep5TFw@mail.gmail.com>
From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Fri, 22 May 2026 06:29:41 -0500
X-Gm-Features: AVHnY4Ij1kTcOcpumQMLPuRGtxXiThjttout6rAW6GKhAu25aoosnLuJr38SLIY
Message-ID: <CAMWSM7hTvW0Uh7=yLv6SfQW0EiKZkyzY1J5nSgqf0sqeGNOFcw@mail.gmail.com>
To: Arnout Vandecappelle <arnout@rnout.be>
Cc: buildroot <buildroot@buildroot.org>,
 Adrian Perez de Castro <aperez@igalia.com>, 
 Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Romain Naour <romain.naour@gmail.com>, 
 Raphael Pavlidis <raphael.pavlidis@gmail.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1779449417; x=1780054217; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cHwcIosGuu2meRGvg8De00qez3M4w03hz2Rlnln9+Lk=;
 b=BXicX4MqcW5biZMCh7Om2DTfsGsDcHnlhtKnfZSUZaJ+Twh40wO7BqqiNWTvGBOAbW
 Xmp4Xd+kJsWNxccpNrfyz27XsCP6NyvUpmPUhXX4IhLykohfBGaHf12rW4J61bIfsZH+
 3sxguWxT8i2+Fzj1xp5J6+yvKSNN9LVmfO38pzvhfsWy+1CpRcemEZPMBZkd6xcWMHOY
 j2yFDvv0RT8oIkxiQ9YKB49ZkuhiAZDxw2GZmZqx4DmtIxaatMy5DC27D82JkvIQjaod
 f9pEBN3bvJ5MmhnIERN93p6VdQNYTszxyKS73HMFfEbHj3KgcvI/G2yCYvvu2SBReO7u
 +AVA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=BXicX4Mq
Subject: Re: [Buildroot] [PATCH v7 7/8] package/qemu: add virglrenderer
 integration
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

T24gVGh1LCBNYXkgMjEsIDIwMjYgYXQgMzo1MeKAr1BNIEpvc2VwaCBLb2d1dCA8am9zZXBoLmtv
Z3V0QGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBIZWxsbyBBcm5vdXQsCj4KPiBPbiBUaHUsIE1heSAy
MSwgMjAyNiwgMTU6MjQgQXJub3V0IFZhbmRlY2FwcGVsbGUgPGFybm91dEBybm91dC5iZT4gd3Jv
dGU6Cj4+Cj4+Cj4+Cj4+IE9uIDE2LzA1LzIwMjYgMDQ6MDMsIEpvc2VwaCBLb2d1dCB3cm90ZToK
Pj4gPiBBZGQgb3B0aW9uYWwgdmlyZ2xyZW5kZXJlciBpbnRlZ3JhdGlvbiwgYWxvbmcgd2l0aCBl
bmFibGluZyBPcGVuR0wgd2hlbgo+PiA+IG5lY2Vzc2FyeS4KPj4gPgo+PiA+IGh0dHBzOi8vcWVt
dS5yZWFkdGhlZG9jcy5pby9lbi92MTAuMC4zL3N5c3RlbS9kZXZpY2VzL3ZpcnRpby1ncHUuaHRt
bCN2aXJ0aW8tZ3B1LXZpcmdscmVuZGVyZXIKPj4gPgo+PiA+IFNpZ25lZC1vZmYtYnk6IEpvc2Vw
aCBLb2d1dCA8am9zZXBoLmtvZ3V0QGdtYWlsLmNvbT4KPj4gPiAtLS0KPj4gPiAgIHBhY2thZ2Uv
cWVtdS9Db25maWcuaW4gfCAyMSArKysrKysrKysrKysrKysrKysrKysKPj4gPiAgIHBhY2thZ2Uv
cWVtdS9xZW11Lm1rICAgfCAgNyArKysrKysrCj4+ID4gICAyIGZpbGVzIGNoYW5nZWQsIDI4IGlu
c2VydGlvbnMoKykKPj4gPgo+PiA+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3FlbXUvQ29uZmlnLmlu
IGIvcGFja2FnZS9xZW11L0NvbmZpZy5pbgo+PiA+IGluZGV4IGQ0ZTRlMzdhM2UuLmRiYWU3YzRk
ZTQgMTAwNjQ0Cj4+ID4gLS0tIGEvcGFja2FnZS9xZW11L0NvbmZpZy5pbgo+PiA+ICsrKyBiL3Bh
Y2thZ2UvcWVtdS9Db25maWcuaW4KPj4gPiBAQCAtMTI2LDYgKzEyNiwyNyBAQCBjb25maWcgQlIy
X1BBQ0tBR0VfUUVNVV9PUEVOR0wKPj4gPiAgIGNvbW1lbnQgIk9wZW5HTCBzdXBwb3J0IG5lZWRz
IGFuIE9wZW5HTCBhbmQvb3IgT3BlbkdMIEVHTCBiYWNrZW5kIgo+PiA+ICAgICAgIGRlcGVuZHMg
b24gIShCUjJfUEFDS0FHRV9IQVNfTElCRUdMIHx8IEJSMl9QQUNLQUdFX0hBU19MSUJHTCkKPj4g
Pgo+PiA+ICtjb25maWcgQlIyX1BBQ0tBR0VfUUVNVV9WSVJHTFJFTkRFUkVSCj4+ID4gKyAgICAg
Ym9vbCAiRW5hYmxlIHZpcmdscmVuZGVyZXIiCj4+ID4gKyAgICAgZGVwZW5kcyBvbiBCUjJfUEFD
S0FHRV9IQVNfTElCRUdMIHx8IEJSMl9QQUNLQUdFX0hBU19MSUJHTAo+PiA+ICsgICAgIHNlbGVj
dCBCUjJfUEFDS0FHRV9RRU1VX09QRU5HTAo+PiA+ICsgICAgIHNlbGVjdCBCUjJfUEFDS0FHRV9W
SVJHTFJFTkRFUkVSCj4+ID4gKyAgICAgaGVscAo+PiA+ICsgICAgICAgU2F5ICd5JyB0byBlbmFi
bGUgcWVtdSBzdXBwb3J0IGZvciB2aXJnbHJlbmRlcmVyLgo+PiA+ICsgICAgICAgdmlyZ2xyZW5k
ZXJlciBiYWNrZW5kcyBzdWNoIGFzIHZpcmdsLCB2ZW51cywgb3IgRFJNIG5hdGl2ZQo+PiA+ICsg
ICAgICAgY29udGV4dCBhcmUgY29uZmlndXJlZCB1bmRlciB0aGUgdmlyZ2xyZW5kZXJlciBwYWNr
YWdlLgo+PiA+ICsKPj4gPiArICAgICAgIFJ1biBxZW11IHdpdGggYC1kZXZpY2UgdmlydGlvLWdw
dS1nbGAKPj4gPiArCj4+ID4gKyAgICAgICBodHRwczovL3FlbXUucmVhZHRoZWRvY3MuaW8vZW4v
djEwLjAuMy9zeXN0ZW0vZGV2aWNlcy92aXJ0aW8tZ3B1Lmh0bWwjdmlydGlvLWdwdS12aXJnbHJl
bmRlcmVyCj4+ID4gKwo+PiA+ICtjb21tZW50ICJ2aXJnbHJlbmRlcmVyIG5lZWRzIE9wZW5HTCBh
Y2NlbGVyYXRlZCBkaXNwbGF5IGZyb250ZW5kIHN1cHBvcnQiCj4+ID4gKyAgICAgZGVwZW5kcyBv
biAhKEJSMl9QQUNLQUdFX0hBU19MSUJFR0wgfHwgQlIyX1BBQ0tBR0VfSEFTX0xJQkdMKQo+PiA+
ICsKPj4gPiArY29tbWVudCAidmlyZ2xyZW5kZXJlciBuZWVkcyB2aXJnbCwgdmVudXMsIG9yIGEg
RFJNIGJhY2tlbmQgZm9yIGd1ZXN0IGFjY2VsZXJhdGlvbiIKPj4gPiArICAgICBkZXBlbmRzIG9u
IEJSMl9QQUNLQUdFX1FFTVVfVklSR0xSRU5ERVJFUgo+PiA+ICsgICAgIGRlcGVuZHMgb24gIUJS
Ml9QQUNLQUdFX1ZJUkdMUkVOREVSRVJfSEFTX0JBQ0tFTkQKPj4KPj4gICBEb2VzIGl0IGFjdHVh
bGx5IHdvcmsgaWYgeW91IGhhdmUgYSBEUk0gYmFja2VuZCBidXQgbm8gdmlyZ2wgb3IgdmVudXM/
IEknbQo+PiBjb25mdXNlZCBhZ2Fpbi4uLgo+Cj4KPgo+IFllcywgaXQgZG9lcyBhY3R1YWxseSB3
b3JrLiBJIHVuZGVyc3RhbmQgeW91ciBjb25mdXNpb24gdGhvdWdoLiA6KQo+Cj4gVEw7RFI6IFZp
ckdMIGZvcndhcmRzIE9wZW5HTCB0byB0aGUgaG9zdCwgVmVudXMgZG9lcyB0aGUgc2FtZSBidXQg
Zm9yIFZ1bGthbi4gVGhlIGhvc3QgcmVxdWlyZW1lbnQgaXMgT3BlbkdMIG9yIFZ1bGthbiBzdXBw
b3J0Lgo+Cj4gRFJNIGJhY2tlbmRzIGFyZSB1c2VkIGluIGNvbWJpbmF0aW9uIHdpdGggdGhlIG5h
dGl2ZSBVTUQgKHJhZGVvbnNpLCBpMTkxNSwgZnJlZWRyZW5vLCBldGMuKSBydW5uaW5nIGluc2lk
ZSB0aGUgZ3Vlc3QsIHdoaWNoIGdlbmVyYWxseSBwcm92aWRlIGJvdGggR0wgYW5kIFZ1bGthbiwg
d2l0aCBiZXR0ZXIgc2VjdXJpdHkgYW5kIGxlc3Mgb3ZlcmhlYWQuIEhvd2V2ZXIsIHlvdSBuZWVk
IHNwZWNpZmljIEdQVSBoYXJkd2FyZSBvbiB0aGUgaG9zdCwgd2hpY2ggaXMgd2h5IHRoZSB0ZXN0
IHVzZXMgVmlyR0wuCj4KPiBCZXN0LAo+IEpvc2VwaAoKU29ycnkgZm9yIHRoZSBIVE1MIG1lc3Nh
Z2UuIDovCgpUaGF0J3Mgd2hhdCBJIGdldCBmb3IgdHJ5aW5nIHRvIHJlcGx5IHRvIGEgbWVzc2Fn
ZSB3aXRoIG15IHBob25lJ3MgZW1haWwgY2xpZW50LgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBi
dWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2J1aWxkcm9vdAo=
