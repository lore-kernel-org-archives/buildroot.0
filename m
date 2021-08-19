Return-Path: <SRS0=aU6e=NK=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93D2AC4338F
	for <buildroot@archiver.kernel.org>; Thu, 19 Aug 2021 14:17:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ECCC66113D
	for <buildroot@archiver.kernel.org>; Thu, 19 Aug 2021 14:17:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org ECCC66113D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A196A817B5;
	Thu, 19 Aug 2021 14:17:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gjKEezUlwxWJ; Thu, 19 Aug 2021 14:17:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3A9BC817FD;
	Thu, 19 Aug 2021 14:17:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A6B8B1BF42D
 for <buildroot@lists.busybox.net>; Thu, 19 Aug 2021 14:17:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A3402817B5
 for <buildroot@lists.busybox.net>; Thu, 19 Aug 2021 14:17:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D0UxR1Ur-1UC for <buildroot@lists.busybox.net>;
 Thu, 19 Aug 2021 14:17:13 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd12131.aruba.it (smtpcmd12131.aruba.it [62.149.156.131])
 by smtp1.osuosl.org (Postfix) with ESMTP id 25EB5817F2
 for <buildroot@buildroot.org>; Thu, 19 Aug 2021 14:17:12 +0000 (UTC)
Received: from smtpclient.apple ([151.37.233.39])
 by Aruba Outgoing Smtp  with ESMTPA
 id GiqymY2AMnxSqGiqzmP2JO; Thu, 19 Aug 2021 16:17:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1629382631; bh=VaPZcSWKOvxyBCQJ4qzYTC9Bp2XYgsU6EChy0wRcAuE=;
 h=Content-Type:From:Mime-Version:Subject:Date:To;
 b=ApWuA5MClrqINeutyrSd9DVXujBb2bxBnXu+Su7In/JvJyXHQ5Fo5nc/MWrNkpcl+
 BbOYKy9UlBNHPiNlaaeVPT/c/E79gepzi6S5LPOmVw9hx+MXQ6nyG8oNW2RK3KCeZ2
 PdAQFguiQq0vKmxTg1kUwhs8WlThs1okkugvt6GbhjmAg8n3csYrvggwr9bElmWgat
 Q1WcdcEKqLifalRwJHsXJFE1neaqTOJCHx7NSzz1EqY6ClQm4kETLH0Q80aRSS39uk
 +uNCy9moM4dRxN9EQqMBZqdyWS3lbHzhv15HhKNka6sb5txNQM8zQ2NLOCmm9/0yKT
 Ja1jU6RK+Pu+g==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Mime-Version: 1.0 (1.0)
Date: Thu, 19 Aug 2021 16:17:07 +0200
Message-Id: <D0EFDA7C-F755-488D-A723-036B954E5FD7@benettiengineering.com>
References: <20210819152458.1aedaae4@windsurf>
In-Reply-To: <20210819152458.1aedaae4@windsurf>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailer: iPhone Mail (18G82)
X-CMAE-Envelope: MS4wfEwn+xVy5zRyvCSuLnwmSYxNkpd4qmi7gqnQ48kZ3fdzXc4HDp1lFk9I+emCJmFcFRr9OzZtQKqPHDGueonpDSfloxNQyeEfxSqgYemEulNiSC8+U8nm
 uE1wQoI5Lp2Q9RYHkVDz2Ii8Fh82SDKe4h9rRahE+ykZ3bVqWapXZVMOnynyJs00hwss/etOyGMJfI3Mdauw06J39O541ahAFtxvlpQi7pBCCVOYUFoiba5o
 Dlai/rOFpSjZYGONtNVZNA==
Subject: Re: [Buildroot] [PATCH v2] DEVELOPERS: add myself to toolchain topic
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Cj4gSWwgZ2lvcm5vIDE5IGFnbyAyMDIxLCBhbGxlIG9yZSAxNToyNSwgVGhvbWFzIFBldGF6em9u
aSA8dGhvbWFzLnBldGF6em9uaUBib290bGluLmNvbT4gaGEgc2NyaXR0bzoKPiAKPiDvu79PbiBU
aHUsIDE5IEF1ZyAyMDIxIDAwOjIzOjQwICswMjAwCj4gR2l1bGlvIEJlbmV0dGkgPGdpdWxpby5i
ZW5ldHRpQGJlbmV0dGllbmdpbmVlcmluZy5jb20+IHdyb3RlOgo+IAo+Pj4+IGRpZmYgLS1naXQg
YS9ERVZFTE9QRVJTIGIvREVWRUxPUEVSUwo+Pj4+IGluZGV4IGFmOTdkZTAyZGUuLjg3NGQ0NzM1
MmMgMTAwNjQ0Cj4+Pj4gLS0tIGEvREVWRUxPUEVSUwo+Pj4+ICsrKyBiL0RFVkVMT1BFUlMKPj4+
PiBAQCAtMTA2MCw2ICsxMDYwLDcgQEAgRjogICAgcGFja2FnZS9uZnMtdXRpbHMvCj4+Pj4gIEY6
ICAgIHBhY2thZ2Uvc3VueGktbWFsaS1tYWlubGluZS8KPj4+PiAgRjogICAgcGFja2FnZS9zdW54
aS1tYWxpLW1haW5saW5lLWRyaXZlci8KPj4+PiAgRjogICAgcGFja2FnZS91ZGlza3MvCj4+Pj4g
K0Y6ICAgIHRvb2xjaGFpbi8gIAo+Pj4gCj4+PiBGb3IgaW50ZXJuYWwgdG9vbGNoYWlucywgdG9v
bGNoYWluLyBkb2Vzbid0IGhhdmUgbXVjaC4gSXQncyByZWFsbHkKPj4+IHBhY2thZ2UvZ2NjLCBw
YWNrYWdlL2JpbnV0aWxzLCBwYWNrYWdlL2dkYiwgcGFja2FnZS9nbGliYywKPj4+IHBhY2thZ2Uv
dWNsaWJjIGFuZCBwYWNrYWdlL211c2wgdGhhdCBtYXR0ZXIgdGhlIG1vc3QuICAKPj4gCj4+IEFo
IHllcy4gQnV0IGFsc28gSSB0b3VjaCBsb3Qgb2YgdGltZXIgdG9vbGNoYWluL0NvbmZpZy5pbiB0
byBjcmVhdGUgbmV3IAo+PiBidWdzLiBJIHdvdWxkIGFkZCB0aGF0IGZpbGUgdG9vIElNSE8uCj4g
Cj4gSSBkaWRuJ3QgbWVhbiB0aGF0IHlvdSBzaG91bGQgbm90IGFkZCB0b29sY2hhaW4vLiBJIHN1
Z2dlc3RlZCB0aGF0IGluCj4gYWRkaXRpb24gdG8gdG9vbGNoYWluLywgeW91IHNob3VsZCBwcm9i
YWJseSBhbHNvIGFkZCB0aGUgcmVsZXZhbnQKPiBwYWNrYWdlcyBpbnZvbHZlZCBpbiB0aGUgdG9v
bGNoYWluIGJ1aWxkIChnY2MsIGJpbnV0aWxzLCBnZGIsIEMKPiBsaWJyYXJpZXMpLgoKQWggb2ss
IEkgY291bGRu4oCZdCB1bmRlcnN0YW5kIHRoYXQgcGFydC4gVGhlbiBJIGFkZCBiaW51dGlscyBh
bmQgZ2NjIHBhY2thZ2VzIHRvbyBhbmQgc2VuZCB2Mi4KVGhhbmsgeW91IGZvciBjbGFyaWZ5aW5n
IDotKQoKQmVzdCByZWdhcmRzCkdpdWxpbwoKPiAKPiBCZXN0IHJlZ2FyZHMsCj4gCj4gVGhvbWFz
IFBldGF6em9uaQo+IC0tIAo+IFRob21hcyBQZXRhenpvbmksIGNvLW93bmVyIGFuZCBDRU8sIEJv
b3RsaW4KPiBFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nCj4gaHR0cHM6Ly9i
b290bGluLmNvbQo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+IGJ1aWxkcm9vdEBidXN5Ym94Lm5ldAo+IGh0
dHA6Ly9saXN0cy5idXN5Ym94Lm5ldC9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxp
bmcgbGlzdApidWlsZHJvb3RAYnVzeWJveC5uZXQKaHR0cDovL2xpc3RzLmJ1c3lib3gubmV0L21h
aWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
