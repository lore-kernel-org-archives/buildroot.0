Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87C3CC52D6F
	for <buildroot@archiver.kernel.org>; Wed, 21 Aug 2024 09:07:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 16A2C60B1D;
	Wed, 21 Aug 2024 09:07:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cW2PBOsalLoP; Wed, 21 Aug 2024 09:07:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6802D60ADC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6802D60ADC;
	Wed, 21 Aug 2024 09:07:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CBFDF1BF3CB
 for <buildroot@lists.busybox.net>; Wed, 21 Aug 2024 09:07:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C6D0360AE3
 for <buildroot@lists.busybox.net>; Wed, 21 Aug 2024 09:07:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6gObTWDsF1mG for <buildroot@lists.busybox.net>;
 Wed, 21 Aug 2024 09:07:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6653C60ADC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6653C60ADC
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6653C60ADC
 for <buildroot@buildroot.org>; Wed, 21 Aug 2024 09:06:59 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 8688213F8A2;
 Wed, 21 Aug 2024 11:06:40 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 21 Aug 2024 11:06:40 +0200
Date: Wed, 21 Aug 2024 11:06:40 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Stephan Mueller <smueller@chronox.de>
Message-ID: <ZsWuIIXmjLobhEKn@landeda>
References: <20240821055146.46029-1-ende.tan@starfivetech.com>
 <ZsWXS9upE8YJCv8I@landeda> <2437694.qtHMqo9rXr@tauon.atsec.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2437694.qtHMqo9rXr@tauon.atsec.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1724231206;
 bh=EitR1RU//V5WvHyprkmNmD+gu//VLVHDbaFMj0tX+YU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=f1eSI67IZrxZm71YoOtVckZQJVz9jpo7vMhTrVMiaeyCSA0ezBdwy74oj7gAVMEGz
 1762sdcKqYkOE30/dfWEtKdeNeYSpBaffIWz74oGUch8lbodlts3bvxJp+YUDPREiB
 /mRkN7Ab8mDeWdewX6f9SBlydMWMCyAWU0dvy7eh1sMDI2XOQOGg24lWfNmXJH3Hfj
 RTPiQYdg6E0mV8okjTIvAnWMPrW3d6GxTmi+yq4slXSmuJ+46kcIfjWj8im+DijP2X
 rV2k079rw1CB9d8Q52JlQHFFpHs9n7yyGqNPs1NYnyw6mr8wE7o+bBiBsZuAkTsfJe
 766smo1wQpvjw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=f1eSI67I
Subject: Re: [Buildroot] [1/1] package/libkcapi: update site path
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
Cc: fontaine.fabrice@gmail.com, ende.tan@starfivetech.com,
 thomas.petazzoni@bootlin.com, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

U3RlcGhhbiwgQWxsLAoKT24gMjAyNC0wOC0yMSAxMDoxOCArMDIwMCwgU3RlcGhhbiBNdWVsbGVy
IHNwYWtlIHRodXNseToKPiBBbSBNaXR0d29jaCwgMjEuIEF1Z3VzdCAyMDI0LCAwOToyOToxNSBN
RVNaIHNjaHJpZWIgWWFubiBFLiBNT1JJTjoKPiA+IE9uIDIwMjQtMDgtMjEgMTM6NTEgKzA4MDAs
IGVuZGUudGFuQHN0YXJmaXZldGVjaC5jb20gc3Bha2UgdGh1c2x5Ogo+ID4gPiBGcm9tOiBUYW4g
RW4gRGUgPGVuZGUudGFuQHN0YXJmaXZldGVjaC5jb20+Cj4gPiA+IFVwZGF0ZSB0aGUgc2l0ZSBw
YXRoIHRvIHJlZmxlY3QgdGhlIHJlY2VudCBvcmdhbml6YXRpb25hbCBjaGFuZ2VzIG9uIHRoZQo+
ID4gPiBjaHJvbm94LmRlIHdlYnNpdGUuClstLVNOSVAtLV0KPiA+IFRoaXMgaXMgYW5ub3lpbmcs
IGJlY2F1c2UgdCBtZWFucyB0aGUgVVJMIHdlIHVzZSBpcyB3cm9uZyBhcyBzb29uIGFzIGEKPiA+
IG5ld2VyIHJlbGVhc2UgaXMgY3V0IGFuZCBwdWJsaXNoZWQsIGFuZCB0aHVzIGFsbCBwcmV2aW91
cyBCdWlsZHJvb3QKPiA+IHZlcnNpb25zIHN1ZGRlbmx5IHN0b3AgYmVpbmcgYWJsZSB0byBkb3du
bG9hZCB0aGUgbGlia2NhcGkgdmVyc2lvbiB0aGV5Cj4gPiBrbmV3IGFib3V0Li4uCj4gT2sgZG8g
eW91IHdhbnQgbWUgdG8gbWFrZSB0aGUgb2xkIHZlcnNpb25zIGF2YWlsYWJsZSBhbHNvIHdpdGgg
dGhlIHRoZSAKPiB2ZXJzaW9uaW5nIHNjaGVtYT8KClRoYXQgd291bGQgYmUgYXdlc29tZSBpZiB5
b3UgY291bGQgcHJvdmlkZSBzdGFibGUgVVJMcywgaW5kZWVkIQoKPiA+IEkgd291bGQgc3VnZ2Vz
dCB3ZSBzd2l0Y2ggdG8gdXNpbmcgdGhlaXIgR2l0SHViIHJlcG8gYXMgdGhlIHNvdXJjZSwgYW5k
Cj4gPiB1c2luZyBnaXQgZm9yIHRoZSBkb3dubG9hZC4KPiBUaGF0IHdvdWxkIHdvcmsgdG9vLiBJ
IGFtIG9wZW4gZm9yIHN1Z2dlc3Rpb25zLgoKSWYgeW91IGNhbiBwcm92aWRlIHN0YWJsZSBVUkxz
LCB0aGF0IHdvdWxkIGJlIGJldHRlci4KClRoYW5rcyBhIGxvdCBmb3IgdGhlIGZlZWRiYWNrLCBh
bmQgZm9yIGNvbnNpZGVyaW5nIG91ciBuZWVkcyEg8J+RjQoKUmVnYXJkcywKWWFubiBFLiBNT1JJ
Ti4KCj4gPiA+IEZpeGVzOgo+ID4gPiAtCj4gPiA+IGh0dHA6Ly9hdXRvYnVpbGQuYnVpbGRyb290
Lm9yZy9yZXN1bHRzLzc3MjQzNjMzNzgzYWMyZDAzN2QxNWQ3ZTljMDEzODQ3ODEKPiA+ID4gZmU3
MDBlCj4gPiA+IAo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBUYW4gRW4gRGUgPGVuZGUudGFuQHN0YXJm
aXZldGVjaC5jb20+Cj4gPiAKPiA+IEluIHRoZSBtZWFudGltZSwgYXBwbGllZCB0byBtYXN0ZXIs
IHRoYW5rcy4KPiA+IAo+ID4gUmVnYXJkcywKPiA+IFlhbm4gRS4gTU9SSU4uCj4gPiAKPiA+ID4g
LS0tCj4gPiA+IAo+ID4gPiAgcGFja2FnZS9saWJrY2FwaS9saWJrY2FwaS5tayB8IDIgKy0KPiA+
ID4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+ID4gPiAK
PiA+ID4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvbGlia2NhcGkvbGlia2NhcGkubWsgYi9wYWNrYWdl
L2xpYmtjYXBpL2xpYmtjYXBpLm1rCj4gPiA+IGluZGV4IDExNDYyZDZlMmEuLjdhNzlkZDU1YWUg
MTAwNjQ0Cj4gPiA+IC0tLSBhL3BhY2thZ2UvbGlia2NhcGkvbGlia2NhcGkubWsKPiA+ID4gKysr
IGIvcGFja2FnZS9saWJrY2FwaS9saWJrY2FwaS5tawo+ID4gPiBAQCAtNiw3ICs2LDcgQEAKPiA+
ID4gCj4gPiA+ICBMSUJLQ0FQSV9WRVJTSU9OID0gMS41LjAKPiA+ID4gIExJQktDQVBJX1NPVVJD
RSA9IGxpYmtjYXBpLSQoTElCS0NBUElfVkVSU0lPTikudGFyLnh6Cj4gPiA+IAo+ID4gPiAtTElC
S0NBUElfU0lURSA9IGh0dHA6Ly93d3cuY2hyb25veC5kZS9saWJrY2FwaQo+ID4gPiArTElCS0NB
UElfU0lURSA9Cj4gPiA+IGh0dHA6Ly93d3cuY2hyb25veC5kZS9saWJrY2FwaS9yZWxlYXNlcy8k
KExJQktDQVBJX1ZFUlNJT04pPiAKPiA+ID4gIExJQktDQVBJX0FVVE9SRUNPTkYgPSBZRVMKPiA+
ID4gIExJQktDQVBJX0lOU1RBTExfU1RBR0lORyA9IFlFUwo+ID4gPiAgTElCS0NBUElfTElDRU5T
RSA9IEJTRC0zLUNsYXVzZSAobGlicmFyeSksIEJTRC0zLUNsYXVzZSBvciBHUEwtMi4wCj4gPiA+
ICAocHJvZ3JhbXMpCj4gCj4gCj4gQ2lhbwo+IFN0ZXBoYW4KPiAKPiAKCi0tIAouLS0tLS0tLS0t
LS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0t
LS0tLS0tLS0tLS0tLgp8ICBZYW5uIEUuIE1PUklOICB8IFJlYWwtVGltZSBFbWJlZGRlZCB8IC8i
XCBBU0NJSSBSSUJCT04gfCBFcmljcycgY29uc3BpcmFjeTogfAp8ICszMyA2NjIgMzc2IDA1NiB8
IFNvZnR3YXJlICBEZXNpZ25lciB8IFwgLyBDQU1QQUlHTiAgICAgfCAgX19fICAgICAgICAgICAg
ICAgfAp8ICszMyA1NjEgMDk5IDQyNyBgLS0tLS0tLS0tLS0tLi0tLS0tLS06ICBYICBBR0FJTlNU
ICAgICAgfCAgXGUvICBUaGVyZSBpcyBubyAgfAp8IGh0dHA6Ly95bW9yaW4uaXMtYS1nZWVrLm9y
Zy8gfCBfLypcXyB8IC8gXCBIVE1MIE1BSUwgICAgfCAgIHYgICBjb25zcGlyYWN5LiAgfAonLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tXi0t
LS0tLS0tLS0tLS0tLS0tLS0tJwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3Jn
Cmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
