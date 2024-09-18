Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6DF2CCD18B
	for <buildroot@archiver.kernel.org>; Wed, 18 Sep 2024 08:27:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5597581E88;
	Wed, 18 Sep 2024 08:27:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TWXYZPnASxbb; Wed, 18 Sep 2024 08:27:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5A75284169
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5A75284169;
	Wed, 18 Sep 2024 08:27:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A87491BF2A7
 for <buildroot@lists.busybox.net>; Wed, 18 Sep 2024 08:27:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A475F60688
 for <buildroot@lists.busybox.net>; Wed, 18 Sep 2024 08:27:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x-PoPtiOSLME for <buildroot@lists.busybox.net>;
 Wed, 18 Sep 2024 08:27:30 +0000 (UTC)
Received-SPF: Pass (sender SPF authorized) identity=helo;
 client-ip=217.70.178.240; helo=mslow1.mail.gandi.net;
 envelope-from=jeanmichel.hautbois@yoseli.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 11F6B60668
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 11F6B60668
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 11F6B60668
 for <buildroot@buildroot.org>; Wed, 18 Sep 2024 08:27:29 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::223])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id A8F97C35AB
 for <buildroot@buildroot.org>; Wed, 18 Sep 2024 08:27:18 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9B09C6000B;
 Wed, 18 Sep 2024 08:27:12 +0000 (UTC)
Message-ID: <7e1b2292-d854-4c50-80f2-3bf59f5d11ca@yoseli.org>
Date: Wed, 18 Sep 2024 10:27:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20240410171211.1633127-1-jeanmichel.hautbois@yoseli.org>
 <20240410171211.1633127-2-jeanmichel.hautbois@yoseli.org>
 <20240410215656.1756a37e@windsurf>
Content-Language: en-US
In-Reply-To: <20240410215656.1756a37e@windsurf>
X-GND-Sasl: jeanmichel.hautbois@yoseli.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=yoseli.org; s=gm1; t=1726648033;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9mFvRLtQPo8ABa0J2l430cjX8q/ElYSo7LSF72uTigM=;
 b=LdXigaPHGiwFjyRVknDeZqzwjou+7U6aPSrRqR5oQpdfXeboPlC+ladBX9nCDF2f4tDZsW
 P+kXzFDxhX9yh34q3RcB/bVHH0ixKZBw4QAbpagFWKErHTTzqhSldgjJxfwlXKLwGsh8fT
 EQoqPyKbX2T1WCV63nUJsGswXnpnooeZtUxutjj5YkBIaNWjdpE2rTpZGADL6sCdRw/ChW
 hs/3de8vI1FGlyp44ycQzEFizCEPAJBSjrTt1up+VKk/wz9NEYKhnh944POgVQRNSO38vV
 2Mxi1n1PDKUfcGd6GivkN64VwfgfA8pcJMUVov0+NkqxJ+W2yR8Xa8hz7RWPNQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=yoseli.org
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=yoseli.org header.i=@yoseli.org header.a=rsa-sha256
 header.s=gm1 header.b=LdXigaPH
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 yann.morin.1998@free.fr, buildroot@buildroot.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgVGhvbWFzLAoKT24gMTAvMDQvMjAyNCAyMTo1NiwgVGhvbWFzIFBldGF6em9uaSB3cm90ZToK
PiBIZWxsbywKPiAKPiBPbiBXZWQsIDEwIEFwciAyMDI0IDE5OjEyOjA5ICswMjAwCj4gSmVhbi1N
aWNoZWwgSGF1dGJvaXMgPGplYW5taWNoZWwuaGF1dGJvaXNAeW9zZWxpLm9yZz4gd3JvdGU6Cj4g
Cj4+IFRoZSBtNjhrIGZhbWlseSBvbnkgaGFzIG9uZSBDb2xkZmlyZSB2YXJpYW50LCBuYW1lbHkg
dGhlIDUyMDguIEFkZCB0aGUKPj4gc3VwcG9ydCBmb3IgdGhlIE1DRjU0NDF4IENQVSBmYW1pbHkg
aW4gdGhlIGNvbmZpZ3VyYXRpb24gZmlsZS4KPj4gVGhpcyBjb3ZlcnMgTUNGNTQ0MTAsIE1DRjU0
NDE1LCBNQ0Y1NDQxNiwgTUNGNTQ0MTcgYW5kIE1DRjU0NDE4Lgo+IAo+IEludGVyZXN0aW5nLiBJ
IGFsd2F5cyB0aG91Z2h0IHRoYXQgQ29sZGZpcmUgbWVhbnQgIm5vIE1NVSIgYW5kIDY4awo+IG1l
YW50ICJNTVUiLCBidXQgSSB3YXMgd3JvbmcuIFRoZSBmYW1pbHkgb2YgNjhrIGFuZCBjb2xkZmly
ZSBpcyBxdWl0ZQo+IG1lc3N5LCBkaWZmaWN1bHQgdG8gZmluZCBjbGVhciBhbmQgcmVsaWFibGUg
c291cmNlcyBvZiBpbmZvcm1hdGlvbi4KPiAKPj4gK2NvbmZpZyBCUjJfR0NDX1RBUkdFVF9BUkNI
Cj4+ICsJZGVmYXVsdCAiY2YiICAgICAgICAgICAgaWYgQlIyX202OGtfY2Y1NDQxeAo+IAo+IFRo
ZSBwcm9ibGVtIHdpdGggdGhpcyBpcyB0aGF0ICJjZiIgaXMgbm90IGEgdmFsaWQgdmFsdWUgZm9y
IGdjYyAtbWFyY2g9Cj4gb3B0aW9uLiBMb29rIGF0IHRoZSBkb2N1bWVudGF0aW9uIGF0Ogo+IGh0
dHBzOi8vZ2NjLmdudS5vcmcvb25saW5lZG9jcy9nY2MtMTMuMi4wL2djYy9NNjgweDAtT3B0aW9u
cy5odG1sCj4gCj4gVGhlIHZhbGlkIHZhbHVlcyBvZiAtbWFyY2ggYXJlOgo+IAo+ICAgIFBlcm1p
c3NpYmxlIHZhbHVlcyBvZiBhcmNoIGZvciBNNjgweDAgYXJjaGl0ZWN0dXJlcyBhcmU6IOKAmDY4
MDAw4oCZLAo+ICAgIOKAmDY4MDEw4oCZLCDigJg2ODAyMOKAmSwg4oCYNjgwMzDigJksIOKAmDY4
MDQw4oCZLCDigJg2ODA2MOKAmSBhbmQg4oCYY3B1MzLigJkuIENvbGRGaXJlCj4gICAgYXJjaGl0
ZWN0dXJlcyBhcmUgc2VsZWN0ZWQgYWNjb3JkaW5nIHRvIEZyZWVzY2FsZeKAmXMgSVNBIGNsYXNz
aWZpY2F0aW9uCj4gICAgYW5kIHRoZSBwZXJtaXNzaWJsZSB2YWx1ZXMgYXJlOiDigJhpc2Fh4oCZ
LCDigJhpc2FhcGx1c+KAmSwg4oCYaXNhYuKAmSBhbmQKPiAgICDigJhpc2Fj4oCZLgo+IAo+IFdo
YXQgaGFwcGVucyB3aGVuIHlvdSBkb24ndCBzcGVjaWZ5IC1tYXJjaD8gRG8geW91IGtub3cgd2hp
Y2ggb2YgaXNhYSwKPiBpc2FhcGx1cywgaXNhYiBhbmQgaXNhYyB0aGUgTUNGNTQ0MXggY29ycmVz
cG9uZHMgdG8/Cj4gCgpBZnRlciBhIGxvb29vbmcgdGltZSwgSSBmaW5hbGx5IGZvdW5kIGEgYml0
IG9mIHRpbWUgdG8gbG9vayBkZWVwZXIgaW50byBpdC4KSWYgSSBkb24ndCBzcGVjaWZ5IFRBUkdF
VF9BUkNILCBtdWx0aWxpYnMgZmFpbHMgdG8gYnVpbGQ6Ci4uLy4uL2djYy9jb25maWcvbTY4ay90
LW1saWJzOjQ1OiAqKiogRXJyb3IgZGVmYXVsdCBjcHUgJ21jZjU0NDU1JyBpcyAKbm90IGluIG11
bHRpbGliIHNldCAnbTY4MDIwIG02ODA0MCBtNjgwNjAnLiAgU3RvcC4KClRoaXMgbGluZSBpcyBj
YWxsZWQgYnkgdGhlIGdlbmVyYXRlZCBNYWtlZmlsZSBhdCBidWlsZCB0aW1lOgp0bWFrZV9maWxl
PSAkKHNyY2RpcikvY29uZmlnL202OGsvdC1tNjhrICQoc3JjZGlyKS9jb25maWcvbTY4ay90LW9w
dHMgCiQoc3JjZGlyKS9jb25maWcvdC1zbGliZ2NjICQoc3JjZGlyKS9jb25maWcvdC1saW51eCAK
JChzcmNkaXIpL2NvbmZpZy90LWdsaWJjICQoc3JjZGlyKS9jb25maWcvbTY4ay90LWxpbnV4IAok
KHNyY2RpcikvY29uZmlnL202OGsvdC1tbGlicyAkKHNyY2RpcikvY29uZmlnL3QtdWNsaWIKClRo
ZSBsaW5lIHNob3VsZCBzdGFydCB3aXRoICQoc3JjZGlyKS9jb25maWcvbTY4ay90LWNmIGFuZCBu
b3QgCiQoc3JjZGlyKS9jb25maWcvbTY4ay90LW02OGsKCkNoYW5naW5nIHRoZSBjcHUgdG8gbWNm
NTQ0MTggZG9lcyBub3QgY2hhbmdlIGFueXRoaW5nIGhlcmUsIGFzIGluc3RlYWQgCm9mIHVzaW5n
IHRoZSBjZiBwYXJ0cyB3ZSBhcmUgbG9va2luZyBmb3IgbTY4ayBvbmVzICEKCk5vdywgdGhlIGlz
YWMgbWF5IG5vdCBiZSB0aGUgY29ycmVjdCBmaXggZWl0aGVyLi4uCkknbSBvcGVuZWQgdG8gc3Vn
Z2VzdGlvbnMgYW5kIGNhbiB0ZXN0IHF1aXRlIGVhc2lseSA6LSkuCgpUaGFua3MsCkpNCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWls
aW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qu
b3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
