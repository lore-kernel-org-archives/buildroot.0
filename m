Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97095CD11C2
	for <buildroot@archiver.kernel.org>; Wed, 10 Apr 2024 19:57:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 447D741713;
	Wed, 10 Apr 2024 19:57:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hhMC6vez9B9d; Wed, 10 Apr 2024 19:57:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 238C84036E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 238C84036E;
	Wed, 10 Apr 2024 19:57:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DEAF31BF59A
 for <buildroot@lists.busybox.net>; Wed, 10 Apr 2024 19:57:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D800E404CA
 for <buildroot@lists.busybox.net>; Wed, 10 Apr 2024 19:57:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KBaAvat3jeMW for <buildroot@lists.busybox.net>;
 Wed, 10 Apr 2024 19:57:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 580F9404C6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 580F9404C6
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 580F9404C6
 for <buildroot@buildroot.org>; Wed, 10 Apr 2024 19:57:00 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C07D740003;
 Wed, 10 Apr 2024 19:56:57 +0000 (UTC)
Date: Wed, 10 Apr 2024 21:56:56 +0200
To: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
Message-ID: <20240410215656.1756a37e@windsurf>
In-Reply-To: <20240410171211.1633127-2-jeanmichel.hautbois@yoseli.org>
References: <20240410171211.1633127-1-jeanmichel.hautbois@yoseli.org>
 <20240410171211.1633127-2-jeanmichel.hautbois@yoseli.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1712779018;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=X+cfYvGodu9f2NZ3CyhfAqKYNaJBZh3fAsyrKtN5M5s=;
 b=TecSLAmTU4/dYEUVHleIuL2UacnEm6zP5Bwr8pgpBrPOYLbYKpIl24/FPxS30d3clYiqJZ
 H9TIYPyDEa32heW4rSUKhgjXYsa+MH7pk4QIVE9Pzndt3kPBMUW/V26IbSEvOIYxlCapWI
 5wTQW/NTZYB1YyBBpTKQkCSq59drvioKb527horTNakeX1p4KHcbfuQ6qoN+78zGaPfM0B
 dl2J7pLATHA+gX5BwA/p/X1EDRHKjJ2GOXeeRrHGlOAhlN0tPHlml3M4tsyhmXoQJ0TVYP
 ZFRGy0Qxi7AwTiayuquEqDNYgup+8KUyX6+2KG8x2UTVBBneYZmKFs23W1JKZQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=TecSLAmT
Subject: Re: [Buildroot] [PATCH v2 1/3] arch: add support for mcf5441x
 Colfdire
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 yann.morin.1998@free.fr, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8sCgpPbiBXZWQsIDEwIEFwciAyMDI0IDE5OjEyOjA5ICswMjAwCkplYW4tTWljaGVsIEhh
dXRib2lzIDxqZWFubWljaGVsLmhhdXRib2lzQHlvc2VsaS5vcmc+IHdyb3RlOgoKPiBUaGUgbTY4
ayBmYW1pbHkgb255IGhhcyBvbmUgQ29sZGZpcmUgdmFyaWFudCwgbmFtZWx5IHRoZSA1MjA4LiBB
ZGQgdGhlCj4gc3VwcG9ydCBmb3IgdGhlIE1DRjU0NDF4IENQVSBmYW1pbHkgaW4gdGhlIGNvbmZp
Z3VyYXRpb24gZmlsZS4KPiBUaGlzIGNvdmVycyBNQ0Y1NDQxMCwgTUNGNTQ0MTUsIE1DRjU0NDE2
LCBNQ0Y1NDQxNyBhbmQgTUNGNTQ0MTguCgpJbnRlcmVzdGluZy4gSSBhbHdheXMgdGhvdWdodCB0
aGF0IENvbGRmaXJlIG1lYW50ICJubyBNTVUiIGFuZCA2OGsKbWVhbnQgIk1NVSIsIGJ1dCBJIHdh
cyB3cm9uZy4gVGhlIGZhbWlseSBvZiA2OGsgYW5kIGNvbGRmaXJlIGlzIHF1aXRlCm1lc3N5LCBk
aWZmaWN1bHQgdG8gZmluZCBjbGVhciBhbmQgcmVsaWFibGUgc291cmNlcyBvZiBpbmZvcm1hdGlv
bi4KCj4gK2NvbmZpZyBCUjJfR0NDX1RBUkdFVF9BUkNICj4gKwlkZWZhdWx0ICJjZiIgICAgICAg
ICAgICBpZiBCUjJfbTY4a19jZjU0NDF4CgpUaGUgcHJvYmxlbSB3aXRoIHRoaXMgaXMgdGhhdCAi
Y2YiIGlzIG5vdCBhIHZhbGlkIHZhbHVlIGZvciBnY2MgLW1hcmNoPQpvcHRpb24uIExvb2sgYXQg
dGhlIGRvY3VtZW50YXRpb24gYXQ6Cmh0dHBzOi8vZ2NjLmdudS5vcmcvb25saW5lZG9jcy9nY2Mt
MTMuMi4wL2djYy9NNjgweDAtT3B0aW9ucy5odG1sCgpUaGUgdmFsaWQgdmFsdWVzIG9mIC1tYXJj
aCBhcmU6CgogIFBlcm1pc3NpYmxlIHZhbHVlcyBvZiBhcmNoIGZvciBNNjgweDAgYXJjaGl0ZWN0
dXJlcyBhcmU6IOKAmDY4MDAw4oCZLAogIOKAmDY4MDEw4oCZLCDigJg2ODAyMOKAmSwg4oCYNjgw
MzDigJksIOKAmDY4MDQw4oCZLCDigJg2ODA2MOKAmSBhbmQg4oCYY3B1MzLigJkuIENvbGRGaXJl
CiAgYXJjaGl0ZWN0dXJlcyBhcmUgc2VsZWN0ZWQgYWNjb3JkaW5nIHRvIEZyZWVzY2FsZeKAmXMg
SVNBIGNsYXNzaWZpY2F0aW9uCiAgYW5kIHRoZSBwZXJtaXNzaWJsZSB2YWx1ZXMgYXJlOiDigJhp
c2Fh4oCZLCDigJhpc2FhcGx1c+KAmSwg4oCYaXNhYuKAmSBhbmQKICDigJhpc2Fj4oCZLiAKCldo
YXQgaGFwcGVucyB3aGVuIHlvdSBkb24ndCBzcGVjaWZ5IC1tYXJjaD8gRG8geW91IGtub3cgd2hp
Y2ggb2YgaXNhYSwKaXNhYXBsdXMsIGlzYWIgYW5kIGlzYWMgdGhlIE1DRjU0NDF4IGNvcnJlc3Bv
bmRzIHRvPwoKQmVzdCByZWdhcmRzLAoKVGhvbWFzCi0tIApUaG9tYXMgUGV0YXp6b25pLCBjby1v
d25lciBhbmQgQ0VPLCBCb290bGluCkVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJp
bmcgYW5kIHRyYWluaW5nCmh0dHBzOi8vYm9vdGxpbi5jb20KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJv
b3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0
aW5mby9idWlsZHJvb3QK
