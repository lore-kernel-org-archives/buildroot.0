Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 293A9C5B56A
	for <buildroot@archiver.kernel.org>; Wed, 12 Aug 2026 07:08:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C24E481168;
	Wed, 12 Aug 2026 07:08:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YOZvc5RdZkuE; Wed, 12 Aug 2026 07:07:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A6A9781125
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786518479;
	bh=RL3x0ZlatPAMDrwTc1ntE8dDTU8micj0TTCDLUjzlgk=;
	h=Date:Cc:To:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=elLUWD5cspmDXRpB6wASFy6ExlkelRscdDxVPPeN0u5B1kIiv8fWm9BcWqC3ug7Wa
	 KVp39EcR/r72k8rnw/n4OQC+IiWVr0aeI7CY8hOKNGW6gQNwRJjjCeoVWVFzHVNgdm
	 Bqk+OuM0PDO8Yh37YbReu97tEJgaudxHwpJimtYmSZva8EN8097yD71lZwJKKfqYXL
	 zANS7Nu5Wxf9L3N624Wa9D37eHRbQ1BZjlSWWeX03vExg4+U9v8i2A8TMjMq4H+SlL
	 Ci92Uza4MuEe1LcvbE1YjwaqQpEiBaDBBy6sGJdFgtSG48pewouyVK4BI6xna0MIcc
	 KrJgUyHNyG+CA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A6A9781125;
	Wed, 12 Aug 2026 07:07:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id CFB9E3A4
 for <buildroot@buildroot.org>; Wed, 12 Aug 2026 07:07:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B5B4040809
 for <buildroot@buildroot.org>; Wed, 12 Aug 2026 07:07:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z0948lJHCj8n for <buildroot@buildroot.org>;
 Wed, 12 Aug 2026 07:07:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=alexis.lothore@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A244C403EA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A244C403EA
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A244C403EA
 for <buildroot@buildroot.org>; Wed, 12 Aug 2026 07:07:56 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 6C4361A15A7
 for <buildroot@buildroot.org>; Wed, 12 Aug 2026 07:07:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 402316045E;
 Wed, 12 Aug 2026 07:07:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id D2A4711C4C86A; 
 Wed, 12 Aug 2026 09:07:52 +0200 (CEST)
Mime-Version: 1.0
Date: Wed, 12 Aug 2026 09:07:52 +0200
Message-Id: <DKMRXZZLICJM.Z4H3U5DCRQ56@bootlin.com>
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>,
 <buildroot@buildroot.org>, "Nicolas Carrier"
 <nicolas.carrier@nav-timing.safrangroup.com>
To: "Thomas Perale" <thomas.perale@mind.be>, =?utf-8?q?Alexis_Lothor=C3=A9?=
 <alexis.lothore@bootlin.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <DKL9FUAMHEBJ.2DHVLMRHLWOGZ@bootlin.com>
 <20260810210451.30439-1-thomas.perale@mind.be>
In-Reply-To: <20260810210451.30439-1-thomas.perale@mind.be>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1786518473; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=SFwzDMOCVr3w0B804B/3rQixMqwQAy02pMIZt5x0CTA=;
 b=MSVk+zSmrkfaC9jNHWbPf9v5WTE7cgx1L4Vz9tEWjWZueMbRCGFdaPlc/IDM/GPwqoR1H1
 iAxoI+PD1N3+CBXIrH/lJWYU9hsJAj03Sd2VjzzZGVgAoueUY2X67VI0rO5o+d7fGFs/ga
 UNmPTAj7Xp016qHsiNHt7JAIa09D2bbrw1rR3ZxxksLMprowwX1VcAa2cwNeqtmt2YrNxD
 y+Kr1vZAFevuBaRoCGcOdb8uWpqsiYKOTW7UiK36/hu1xDNcZl6raAFBPB9PrVxmhFi8Dv
 rLfMLj8GXbINBut/7BDmIk8ReXPnzStSoP/DCHTqV6sVws9KH05ZEtrN7u1/xw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=MSVk+zSm
Subject: Re: [Buildroot] [PATCH 2/2] package/sass: new package
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

SGVsbG8gVGhvbWFzLCBUaG9tYXMsCgpPbiBNb24gQXVnIDEwLCAyMDI2IGF0IDExOjA0IFBNIENF
U1QsIFRob21hcyBQZXJhbGUgd3JvdGU6Cj4gSGVsbG8sCj4KPiBJbiByZXBseSBvZjoKPj4gT24g
RnJpIEF1ZyA3LCAyMDI2IGF0IDE6NTUgUE0gQ0VTVCwgVGhvbWFzIFBlcmFsZSB3cm90ZToKClsu
Li5dCgo+PiBTbyBpbiB0aGlzIGNhc2UgSSd2ZSBnb3Qgbm8gcGFja2FnZS5qc29uLCBJIG9ubHkg
aGF2ZSBhIGNvbXBvc2VyLmpzb24KPj4gcmVxdWlyaW5nIG1pbmlfYXNzZXQsIGFuZCBtaW5pX2Fz
c2V0IGRvZXMgbm90IGF1dG9tYXRpY2FsbHkgcHVsbCB0aG9zZQo+PiBkZXBlbmRlbmNpZXMuIE1p
bmktYXNzZXQgaXMgY29uZmlndXJlZCB0aHJvdWdoIGEgLmluaSBmaWxlLCBpbiB3aGljaCB3ZQo+
PiBjYW4gdXNlIGRpZmZlcmVudCAiZmlsdGVycyIgKGVnOiBTYXNzKSwgYW5kIGVhY2ggZmlsdGVy
IGhhcyBkaWZmZXJlbnQKPj4gcmVxdWlyZW1lbnRzLCBidXQgaXQgaXMgdXAgdG8gdGhlIHVzZXIg
dG8gYnJpbmcgdGhvc2UgZGVwZW5kZW5jaWVzIG9uCj4+IGhvc3QuIE9uZSB0aGluZyB0aGF0IEkg
Y2FuIGNoZWNrIGhvd2V2ZXIsIGNsb3NlIHRvIHlvdXIgc3VnZ2VzdGlvbiwgaXMKPj4gd2hldGhl
ciB0aGVyZSBpcyBhIGRpZmZlcmVudCBDU1MgImZpbHRlciIgdGhhdCBjb3VsZCBiZSBicm91Z2h0
Cj4+IGF1dG9tYXRpY2FsbHkgYnkgY29tcG9zZXIgYW5kIHRoYXQgZ2VuZXJhdGVzIHNvbWV0aGlu
ZyBjbG9zZSB0byB3aGF0Cj4+ICJ3ZWJhcHAiIGlzIGN1cnJlbnRseSBvdXRwdXR0aW5nLgo+Cj4g
SSBzZWUsIHRoYW5rcyBmb3IgdGhlIGNsYXJpZmljYXRpb24uIEkgZGlkbid0IGtub3cgYWJvdXQg
J21pbmktYXNzZXQnLgo+IEkgdGhpbmsgeW91ciBwcm9qZWN0IGNhbiBzdGlsbCBkZWZpbmUgYSBw
YWNrYWdlLmpzb24gZm9yIHRoZSAnZnJvbnRlbmQnIHBhcnQKPiB3aXRoIHVnbGlmeSBhbmQgc2Fz
cyBkZXYgZGVwZW5kZW5jaWVzIGFuZCBtYWtlICdtaW5pLWFzc2V0cycgcG9pbnQgdG8gdGhlCj4g
J25vZGVfbW9kdWxlcycgZGlyZWN0b3J5IGxvY2FsICJiaW4iLgo+IEJ1dCBpZiB5b3UgZG9uJ3Qg
d2FudCB0byByZWx5IG9uICdwYWNrYWdlLmpzb24nIG9yIHdhbnQgdmVuZG9yaW5nIHRoZW4gdGhl
IGJlc3QKPiBjaG9pY2UgaXMgcHJvYmFibHkgYWRkaW5nIHRoZSBwYWNrYWdlIHRvIEJ1aWxkcm9v
dCBpbmRlZWQuCgpBIHNtYWxsIHVwZGF0ZSBvbiB0aGlzOgoKV2hpbGUgZXhwbG9yaW5nIHRoZSBv
cHRpb24gb2YgbWFraW5nIHRoZSB3ZWJhcHAgYnVpbGQgc3lzdGVtIG1hbmFnZSB0aGUKZGVwZW5k
ZW5jaWVzIGluc3RhbGxhdGlvbiAoYXMgVGhvbWFzIFBlcmFsZSBzdWdnZXN0ZWQpLCB3ZSBmb3Vu
ZCBvdXQKdGhhdCB3ZSBtYXkgYmUgYWJsZSB0byBoYW5kbGUgdGhvc2UgZGlyZWN0bHkgd2l0aCBj
b21wb3Nlciwgd2l0aG91dApoYXZpbmcgdG8gYWRkIGEgcGFja2FnZS5qc29uOiB0aGVyZSBzZWVt
cyB0byBiZSBhbHRlcm5hdGl2ZXMgdG8gc2FzcyBhbmQKdWdsaWZ5anMgdGhhdCBhcmUgcGFja2Fn
ZWQgZGlyZWN0bHkgYXMgcGhwIG1vZHVsZXMgIChhbmQgc28sIHRoYXQgY2FuIGJlCnB1bGxlZCBk
aXJlY3RseSB3aXRoIGNvbXBvc2VyIGluc3RhbGwpIGFuZCB0aGF0IG1pbmktYXNzZXQgc3VwcG9y
dHM6Ci0gc2FzcyAtPiBzY3NzcGhwCi0gdWdsaWZ5anMgLT4ganNocmluawoKU29tZSBxdWljayBQ
b0MgdmFsaWRhdGVkIHRoYXQgd2UgYXJlIGFibGUgdG8gZ2VuZXJhdGUgY29ycmVjdGx5IHRoZQpm
cm9udGVuZCBhc3NldHMgd2l0aCB0aG9zZSBhbHRlcm5hdGl2ZXMsIHNvIHdlIHdpbGwgbGlrZWx5
IGdvIHRoaXMgd2F5CmFuZCBnZXQgcmlkIG9mIHRob3NlIGN1c3RvbSBucG0gaG9zdCBwYWNrYWdl
cy4KCklmIHdlIGV2ZXIgaGFwcGVuIHRvIGZpbmFsbHkgbmVlZCB0aG9zZSBucG0gbW9kdWxlcywg
VGhvbWFzIFBldGF6em9uaQphbHNvIGhpbnRlZCBtZSBhYm91dCB0aGUgbnBtIGZldGNoZXIgbWVj
aGFuaXNtIGltcGxlbWVudGVkIGluIGJpdGJha2UKKFsxXSkgdGhhdCBjb3VsZCBiZSBpbnNwaXJl
ZCBmcm9tIGFuZCBwb3J0ZWQgdG8gYnVpbGRyb290LgoKVGhpcyBzZXJpZXMgY2FuIHRoZW4gYmUg
ZHJvcHBlZDsgdGhhbmtzIGFueXdheSBmb3IgdGFraW5nIHRpbWUgdG8gcmV2aWV3Cml0LCBhbmQg
Zm9yIHRoZSBkaXNjdXNzaW9ucy9zdWdnZXN0aW9ucyAhCgpBbGV4aXMKClsxXSBodHRwczovL2Rv
Y3MueW9jdG9wcm9qZWN0Lm9yZy9iaXRiYWtlLzIuMTgvYml0YmFrZS11c2VyLW1hbnVhbC9iaXRi
YWtlLXVzZXItbWFudWFsLWZldGNoaW5nLmh0bWwjbnBtLWZldGNoZXItbnBtCgo+IEJlc3QgcmVn
YXJkcywKPiBQRVJBTEUgVGhvbWFzCgoKCgotLSAKQWxleGlzIExvdGhvcsOpLCBCb290bGluCkVt
YmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcKaHR0cHM6Ly9ib290bGluLmNvbQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290
IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxk
cm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
