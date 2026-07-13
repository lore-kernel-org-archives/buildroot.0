Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1834EC43458
	for <buildroot@archiver.kernel.org>; Mon, 13 Jul 2026 08:43:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BD89340699;
	Mon, 13 Jul 2026 08:43:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6OXR6OFlozKm; Mon, 13 Jul 2026 08:43:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CAFB54070B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783932196;
	bh=yBTfzoUPg2bMOR/ufkq30nKZoSVouva9eGd5wKQB7rk=;
	h=Date:Cc:To:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=rRzLzuO/1sBokfRj3aanhTfpq1ev/3cGD8ckPurUsrEbaLV434jcznRab7tESriyk
	 lo9eveSUEcix3ptsSbOiN/dEtE3ZB9ZsNyDM87NpKWbTu9K358OZiaqf/KcsVUMNRw
	 z5pGsm2uCmAEDrI+g1/14VFpxArW8Twc0yB5t+a/N5lcE0Lru6ikU8yQ2drxyN8INz
	 B4p0F78RDFkjQU/6ZPJFF7yqqKwe5nzLAFkl0Rh67yoVNNXtx6qxdnA91UIqNCnPIM
	 9xgaAAGLX+Uya3Oric7qHS+gNPHG1e1pfPsRRy7OLVPeBRTcrKGSSmVTcmmQhPeA2Z
	 +gFvVbNxZ1wRA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CAFB54070B;
	Mon, 13 Jul 2026 08:43:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 037C7128
 for <buildroot@buildroot.org>; Mon, 13 Jul 2026 08:43:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DD89A40257
 for <buildroot@buildroot.org>; Mon, 13 Jul 2026 08:43:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2Mmq7DRfp1Bt for <buildroot@buildroot.org>;
 Mon, 13 Jul 2026 08:43:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=alexis.lothore@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C4A2C4009B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C4A2C4009B
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C4A2C4009B
 for <buildroot@buildroot.org>; Mon, 13 Jul 2026 08:43:12 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 729701A0F92
 for <buildroot@buildroot.org>; Mon, 13 Jul 2026 08:43:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 45E9D60341;
 Mon, 13 Jul 2026 08:43:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id CC2FF11BD00F9; 
 Mon, 13 Jul 2026 10:43:08 +0200 (CEST)
Mime-Version: 1.0
Date: Mon, 13 Jul 2026 10:43:08 +0200
Message-Id: <DJXB6LIB5J0P.1NKJC0MR4B5EO@bootlin.com>
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>, "Bernd Kuhls"
 <bernd@kuhls.net>
To: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>,
 <buildroot@buildroot.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260713-libxmslxec-bump-v1-1-8e29a316202f@bootlin.com>
In-Reply-To: <20260713-libxmslxec-bump-v1-1-8e29a316202f@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1783932189; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=MffF6XRrCi4blqDeHqq2eNsKVl0hvRpP5J/bHPGxCOA=;
 b=Kwd1tx8xeHN089bWJEkdfL80zZ/3iZ7V31TLHs+9VzZee9HtjFFo5nLC4zgJVWpLYMkNgD
 MJEGrmPCucn+7JN2NAUxXCcXRIiby1HM0bC7DC0A1FeAp4aYVGxPCSwS3wTmj6wHFqTqDg
 XTLtUMLwRX/Z7r3YQ1hpSGKduwbEwyM3XLbRC43MM7SQPj1pzpPqx7XyWrM9YDG7b5leZT
 EP4EUQ7t57fcSx37bVeiPmDAmma9e+xigiNShsfe2uMuFIZDyhXj0aLZZHadqq60jF71sZ
 CMOBWCdLw1yFGJOaJ+n2keLdPjEpFtF9VDGyM24UGwHluv6VvNZ10fv5pnb+og==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=Kwd1tx8x
Subject: Re: [Buildroot] [PATCH] package/libxmlsec1: bump version to 1.3.12
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
From: =?utf-8?q?Alexis_Lothor=C3=A9_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gTW9uIEp1bCAxMywgMjAyNiBhdCAxMDozNyBBTSBDRVNULCBBbGV4aXMgTG90aG9yw6kgd3Jv
dGU6Cj4gVXBkYXRlIGxpYnhtbHNlYyBmcm9tIDEuMy45IHRvIDEuMy4xMi4gVGhlIHBhY2thZ2Ug
dGhlbiBuZWVkcyBhIGZldwo+IGFkanVzdG1lbnRzOgo+IC0gdGhlcmUgYXJlIHVuZGVmaW5lZCBy
ZWZlcmVuY2VzIHRvIHhtbERlYnVnRHVtcERvY3VtZW50IChbMV0pOgo+Cj4gICB1bml0X3Rlc3Rz
L3RyYW5zZm9ybV9oZWxwZXJzX3VuaXRfdGVzdHMuYzoyOTE6OTogZXJyb3I6IGltcGxpY2l0Cj4g
ICBkZWNsYXJhdGlvbiBvZiBmdW5jdGlvbiDigJh4bWxEZWJ1Z0R1bXBEb2N1bWVudOKAmQo+ICAg
Wy1XaW1wbGljaXQtZnVuY3Rpb24tZGVjbGFyYXRpb25dCj4KPiBUaGlzIGlzIGR1ZSB0byB4bWxz
ZWMxIHVuaXQgdGVzdHMgYmVpbmcgYnVpbHQgc3lzdGVtYXRpY2FsbHksIGFuZAo+IGRlcGVuZGlu
ZyBvbiBsaWJ4bWwyIGJlaW5nIGJ1aWx0IHdpdGggLS13aXRoLWRlYnVnLCBzbyBwYXRjaAo+IGFw
cHMvTWFrZWZpbGUuYW0gYWNjb3JkaW5nbHkgYXQgYnVpbGQgdGltZSB0byBkaXNhYmxlIHVuaXQg
dGVzdHMgYnVpbGQuCj4KPiAtIHRoZSBidWlsZCBjYW4gZmFpbCB3aXRoIG9sZGVyIEdDQyB2ZXJz
aW9ucyBkdWUgdG8gYW4gdW5pbXBsZW1lbnRlZAo+ICAgcGFyYW1ldGVyIChbMl0pOgo+Cj4gICBh
YXJjaDY0LWxpbnV4LWdjYy5icl9yZWFsOiBlcnJvcjogdW5yZWNvZ25pemVkIGNvbW1hbmQgbGlu
ZSBvcHRpb24gXAo+ICAg4oCYLVdmb3JtYXQtb3ZlcmZsb3c9MuKAmTsgZGlkIHlvdSBtZWFuIOKA
mC1Xc3RyaWN0LW92ZXJmbG93PeKAmT8KPgo+IFRoaXMgZm9ybWF0LW92ZXJmbG93IHBhcmFtZXRl
ciBoYXMgYmVlbiBpbXBsZW1lbnRlZCBpbiBHQ0MgNywgc28gbWFrZQo+IHRoZSBwYWNrYWdlIGRl
cGVuZCBvbiBHQ0MgPj0gNy4gQW5vdGhlciBzb2x1dGlvbiBjb3VsZCBoYXZlIGJlZW4gdG8KPiBw
YXNzIC0tZGlzYWJsZS1wZWRhbnRpYyB0byB0aGUgcGFja2FnZSdzIGNvbmZpZ3VyZSwgYnV0IHRo
YXQgc291bmRzIGEKPiBiaXQgc3Ryb25nIGp1c3QgdG8gZGlzYWJsZSBhIHBhcmFtZXRlciB0aGF0
IGhhcyBiZWVuIGV4aXNpdGluZyBmb3IKPiBhbG1vc3QgMTAgeWVhcnMuCj4KPiAtIHRoZSBidWls
ZCBjYW4gZmFpbCBvbiBtaXNzaW5nIGF0b21pY3MgKFszXSk6Cj4KPiAgIFsuLi5dL2Jvb3RsaW4t
bTY4ay01MjA4LXVjbGliYy9ob3N0L29wdC9leHQtdG9vbGNoYWluL202OGstYnVpbGRyb290LXVj
bGludXgtdWNsaWJjL2Jpbi9sZC5yZWFsOgo+ICAgWy4uLl0vYm9vdGxpbi1tNjhrLTUyMDgtdWNs
aWJjL2hvc3QvYmluLy4uL202OGstYnVpbGRyb290LXVjbGludXgtdWNsaWJjL3N5c3Jvb3QvdXNy
L2xpYi9saWJjcnlwdG8uYShsaWJjcnlwdG8tbGliLXRocmVhZHNfcHRocmVhZC5vKToKPiAgIGlu
IGZ1bmN0aW9uIGBDUllQVE9fYXRvbWljX3N0b3JlJzogdGhyZWFkc19wdGhyZWFkLmM6KC50ZXh0
KzB4Y2QyKToKPiAgIHVuZGVmaW5lZCByZWZlcmVuY2UgdG8gYF9fYXRvbWljX2lzX2xvY2tfZnJl
ZScKPgo+IFNvIG1ha2UgdGhlIHBhY2thZ2UgZGVwZW5kIG9uIGxpYmF0b21pYwo+Cj4gWzFdIGh0
dHBzOi8vZ2l0bGFiLmNvbS9qb2xpdmFpbi9idWlsZHJvb3QvLS9waXBlbGluZXMvMjUyNzUyNzAz
NAo+IFsyXSBodHRwczovL2dpdGxhYi5jb20vam9saXZhaW4vYnVpbGRyb290Ly0vam9icy8xNDQ0
OTY4MTYxNQo+IFszXSBodHRwczovL2dpdGxhYi5jb20vam9saXZhaW4vYnVpbGRyb290Ly0vam9i
cy8xNDQ0OTY4MTYyMQo+Cj4gU2lnbmVkLW9mZi1ieTogQWxleGlzIExvdGhvcsOpIDxhbGV4aXMu
bG90aG9yZUBib290bGluLmNvbT4KCkFhYWFhYW5kIEkgZm9yZ290IEJlcm5kJ3MgU29CIGFuZCBD
by1kZXZlbG9wZWQtYnksIGRlc3BpdGUgbWVudGlvbmluZwp0aG9zZSBiZWxvdy4gVGhleSB3aWxs
IGJlIGluY2x1ZGVkIGluIHYyLCBkZXBlbmRpbmcgb24gdGhlIGZlZWRiYWNrLgoKPiAtLS0KPiBU
aGlzIHBhdGNoIGZvbGxvd3MgQmVybmQgS3VobHMnIGF0dGVtcHQgdG8gdXBncmFkZSBsaWJ4bWxz
ZWMxIHRvIDEuMy4xMQo+IGZyb20gYSBmZXcgbW9udGhzIGFnbzoKPgo+IGh0dHBzOi8vbG9yZS5r
ZXJuZWwub3JnL2J1aWxkcm9vdC8yMDI2MDUxOTE4NTczMi4xMDI5NDAyLTEtYmVybmRAa3VobHMu
bmV0Lwo+Cj4gQmVybmQsIEkgdGhlbiB0b29rIHRoZSBsaWJlcnR5IHRvIGFkZCB5b3VyIFNvQiBh
bmQgQ28tRGV2ZWxvcGVkLWJ5IGZvcgo+IHRoZSB1bml0IHRlc3QgZGlzYWJsaW5nIHBhcnQsIHBs
ZWFzZSBsZXQgbWUga25vdyBpZiB0aGF0J3Mgbm90IG9rLgo+IC0tLQo+ICBwYWNrYWdlL2xpYnht
bHNlYzEvQ29uZmlnLmluICAgICAgIHwgIDUgKysrKysKPiAgcGFja2FnZS9saWJ4bWxzZWMxL2xp
YnhtbHNlYzEuaGFzaCB8ICAyICstCj4gIHBhY2thZ2UvbGlieG1sc2VjMS9saWJ4bWxzZWMxLm1r
ICAgfCAxMCArKysrKysrKystCj4gIDMgZmlsZXMgY2hhbmdlZCwgMTUgaW5zZXJ0aW9ucygrKSwg
MiBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2xpYnhtbHNlYzEvQ29uZmln
LmluIGIvcGFja2FnZS9saWJ4bWxzZWMxL0NvbmZpZy5pbgo+IGluZGV4IDRhNjg2ODUzYWUwZS4u
NzgyZTZjZWQ3Y2U5IDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvbGlieG1sc2VjMS9Db25maWcuaW4K
PiArKysgYi9wYWNrYWdlL2xpYnhtbHNlYzEvQ29uZmlnLmluCj4gQEAgLTEsNSArMSw3IEBACj4g
IGNvbmZpZyBCUjJfUEFDS0FHRV9MSUJYTUxTRUMxCj4gIAlib29sICJsaWJ4bWxzZWMxIgo+ICsJ
ZGVwZW5kcyBvbiBCUjJfVE9PTENIQUlOX0dDQ19BVF9MRUFTVF83ICMtV2Zvcm1hdC1vdmVyZmxv
dwo+ICsJZGVwZW5kcyBvbiBCUjJfVE9PTENIQUlOX0hBU19BVE9NSUMKPiAgCXNlbGVjdCBCUjJf
UEFDS0FHRV9PUEVOU1NMCj4gIAlzZWxlY3QgQlIyX1BBQ0tBR0VfTElCWE1MMgo+ICAJaGVscAo+
IEBAIC0xMCwzICsxMiw2IEBAIGNvbmZpZyBCUjJfUEFDS0FHRV9MSUJYTUxTRUMxCj4gIAo+ICAJ
ICBodHRwczovL3d3dy5hbGVrc2V5LmNvbS94bWxzZWMvCj4gIAkgIGh0dHBzOi8vZ2l0aHViLmNv
bS9sc2gxMjMveG1sc2VjCj4gKwo+ICtjb21tZW50ICJsaWJ4bWxzZWMxIG5lZWRzIGEgdG9vbGNo
YWluIHcvIGdjYyA+PSA3Igo+ICsJZGVwZW5kcyBvbiAgIUJSMl9UT09MQ0hBSU5fR0NDX0FUX0xF
QVNUXzcgfHwgIUJSMl9UT09MQ0hBSU5fSEFTX0FUT01JQwo+IGRpZmYgLS1naXQgYS9wYWNrYWdl
L2xpYnhtbHNlYzEvbGlieG1sc2VjMS5oYXNoIGIvcGFja2FnZS9saWJ4bWxzZWMxL2xpYnhtbHNl
YzEuaGFzaAo+IGluZGV4IDllMGU2N2U3MzIyZS4uN2YzNGMyODk4NDFiIDEwMDY0NAo+IC0tLSBh
L3BhY2thZ2UvbGlieG1sc2VjMS9saWJ4bWxzZWMxLmhhc2gKPiArKysgYi9wYWNrYWdlL2xpYnht
bHNlYzEvbGlieG1sc2VjMS5oYXNoCj4gQEAgLTEsMyArMSwzIEBACj4gICMgTG9jYWxseSBjb21w
dXRlZAo+IC1zaGEyNTYgIGE2MzFjOGNkN2E2Yjg2ZTZhZGI5ZjViOTM1ZDQ1YTljZjk3NjhiM2Ni
MDkwZDQ2MWU4ZWI5ZDA0M2NmOWI2MmYgIHhtbHNlYzEtMS4zLjkudGFyLmd6Cj4gK3NoYTI1NiAg
MjQwNDUxOTlhZjEyZDkzZmU1ZmRiYmJmN2UzODZlODIzZTQ4NDIwNzFlOTQzMmUyYjkwYWMxMDhi
ODg5YTkyMyAgeG1sc2VjMS0xLjMuMTIudGFyLmd6Cj4gIHNoYTI1NiAgZDVlOTM4ODUzNDI1NjM2
MGM2YTAwOWQ0ZjE5YWIyYjhkNmVjMGFhN2ZmMzJhNTFlMjJkODk5ZWQ3YmViNWM0OCAgQ29weXJp
Z2h0Cj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvbGlieG1sc2VjMS9saWJ4bWxzZWMxLm1rIGIvcGFj
a2FnZS9saWJ4bWxzZWMxL2xpYnhtbHNlYzEubWsKPiBpbmRleCAyOTIyMmJjMTZmZmQuLjg4ZjBh
ZTlmZDk0ZiAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL2xpYnhtbHNlYzEvbGlieG1sc2VjMS5tawo+
ICsrKyBiL3BhY2thZ2UvbGlieG1sc2VjMS9saWJ4bWxzZWMxLm1rCj4gQEAgLTQsNyArNCw3IEBA
Cj4gICMKPiAgIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKPiAgCj4gLUxJQlhNTFNFQzFfVkVSU0lP
TiA9IDEuMy45Cj4gK0xJQlhNTFNFQzFfVkVSU0lPTiA9IDEuMy4xMgo+ICBMSUJYTUxTRUMxX1NP
VVJDRSA9IHhtbHNlYzEtJChMSUJYTUxTRUMxX1ZFUlNJT04pLnRhci5nego+ICBMSUJYTUxTRUMx
X1NJVEUgPSBodHRwczovL2dpdGh1Yi5jb20vbHNoMTIzL3htbHNlYy9yZWxlYXNlcy9kb3dubG9h
ZC8kKExJQlhNTFNFQzFfVkVSU0lPTikKPiAgTElCWE1MU0VDMV9MSUNFTlNFID0gTUlUCj4gQEAg
LTIyLDYgKzIyLDE0IEBAIExJQlhNTFNFQzFfQ09ORl9PUFRTID0gXAo+ICAJLS13aXRob3V0LW5z
cyBcCj4gIAktLWRpc2FibGUtZGVzCj4gIAo+ICsjIHhtbHNlY191bml0X3Rlc3RzIG5lZWRzIHht
bERlYnVnRHVtcERvY3VtZW50KCkgZnJvbSBsaWJ4bWwyIHdoaWNoIGlzIG5vdAo+ICsjIHByZXNl
bnQgaW4gYnVpbGRyb290IGJlY2F1c2UgbGlieG1sMiBpcyBidWlsZCB3aXRoIC13aXRob3V0LWRl
YnVnCj4gK2RlZmluZSBMSUJYTUxTRUMxX0RJU0FCTEVfVU5JVF9URVNUUwo+ICsJJChTRUQpICdz
L25vaW5zdF9QUk9HUkFNUyA9IHhtbHNlY191bml0X3Rlc3RzL25vaW5zdF9QUk9HUkFNUyA9Lycg
XAo+ICsJCSQoQEQpL2FwcHMvTWFrZWZpbGUuYW0KPiArZW5kZWYKPiArTElCWE1MU0VDMV9QT1NU
X1BBVENIX0hPT0tTICs9IExJQlhNTFNFQzFfRElTQUJMRV9VTklUX1RFU1RTCj4gKwo+ICBIT1NU
X0xJQlhNTFNFQzFfQ09ORl9PUFRTID0gXAo+ICAJLS1lbmFibGUtY3J5cHRvLWRsPW5vIFwKPiAg
CS0td2l0aC1vcGVuc3NsIFwKPgo+IC0tLQo+IGJhc2UtY29tbWl0OiBkMmE2NTk5ZjdiODViYTY0
YjY1NDJhZGE1NjQ1N2ViYTZlMmJlMzY0Cj4gY2hhbmdlLWlkOiAyMDI2MDcxMy1saWJ4bXNseGVj
LWJ1bXAtMTQ0ZmQ2MGJlZmYyCj4KPiBCZXN0IHJlZ2FyZHMsCj4gLS0gIAo+IEFsZXhpcyBMb3Ro
b3LDqSA8YWxleGlzLmxvdGhvcmVAYm9vdGxpbi5jb20+CgoKCgotLSAKQWxleGlzIExvdGhvcsOp
LCBCb290bGluCkVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcKaHR0cHM6Ly9i
b290bGluLmNvbQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczov
L2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
