Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6744ECD13CF
	for <buildroot@archiver.kernel.org>; Mon,  2 Sep 2024 20:29:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1A0AA80B41;
	Mon,  2 Sep 2024 20:29:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ajLHqVO0h5tS; Mon,  2 Sep 2024 20:29:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1505F80AFB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1505F80AFB;
	Mon,  2 Sep 2024 20:29:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 282E51BF426
 for <buildroot@lists.busybox.net>; Mon,  2 Sep 2024 20:29:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1572380AF4
 for <buildroot@lists.busybox.net>; Mon,  2 Sep 2024 20:29:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gY5lkN6zP-KV for <buildroot@lists.busybox.net>;
 Mon,  2 Sep 2024 20:29:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=178.60.130.6;
 helo=fanzine2.igalia.com; envelope-from=aperez@igalia.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org AA5B880AD9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AA5B880AD9
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AA5B880AD9
 for <buildroot@buildroot.org>; Mon,  2 Sep 2024 20:29:52 +0000 (UTC)
Received: from 91-152-140-108.elisa-laajakaista.fi ([91.152.140.108]
 helo=momiji) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1slDgN-008Tcz-1A; Mon, 02 Sep 2024 22:29:50 +0200
Received: from localhost (momiji [local])
 by momiji (OpenSMTPD) with ESMTPA id 8d653296;
 Mon, 2 Sep 2024 20:29:49 +0000 (UTC)
Date: Mon, 2 Sep 2024 23:29:49 +0300
Message-ID: <20240902232949.GJ1449890@igalia.com>
From: Adrian Perez de Castro <aperez@igalia.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20240823165640.6f40aa58@windsurf>
References: <20240823122919.3325906-1-aperez@igalia.com>
 <20240823165640.6f40aa58@windsurf>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Type:MIME-Version:References:In-Reply-To:Subject:Cc:To:
 From:Message-ID:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=4ipI5CO6Bh9zv7OgGLDOR8VrHrKhgA6gQSJ/xuVc9ns=; b=Jhwf4gtedQd3dLGF3fi0az6DYE
 96YZtGcqw1yeUqk77ly2DWagTkWfzQI0YWfWW/2PIJy32Ke7DwLCUwhDjdO/jaSuEZBhxVCkoEzTG
 ycMissQNld+hJx8BbOmN7QRr7XCzaDCN36BWuD54Gd1kCCqBJ//f//8CsErOUt5a4grNNWtWJIyW6
 pxVwX8LGi9BgCclpZ5qLrQV/OGK/Dmv6q+x38sy1V49d+lwPSXhM5I6I3QTIAH+DQggb3qUWKeuM5
 FNPjcn8GlDOfur06KlsA2sJd8pdnp7n/tiR7kfil3iPw8feTN9aOC2jzoCC8VJ14ZOlkHUHbwmHuR
 5c4ZF4rQ==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=igalia.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256
 header.s=20170329 header.b=Jhwf4gte
Subject: Re: [Buildroot] [PATCH] package/wpewebkit: disable JIT for all MIPS
 CPUs
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
Cc: buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============7859930646621140189=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============7859930646621140189==
Content-Type: multipart/signed; boundary="kH8EUB+gyR1bJnm0"; micalg="pgp-ripemd160"; protocol="application/pgp-signature"


--kH8EUB+gyR1bJnm0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: base64

SGVsbG8gVGhvbWFzLAoKT24gRnJpLCAyMyBBdWcgMjAyNCAxNjo1Njo0MCArMDIwMCBUaG9tYXMg
UGV0YXp6b25pIHZpYSBidWlsZHJvb3QgPGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnPiB3cm90ZToK
Cj4gT24gRnJpLCAyMyBBdWcgMjAyNCAxNToyOToxNiArMDMwMAo+IEFkcmlhbiBQZXJleiBkZSBD
YXN0cm8gPGFwZXJlekBpZ2FsaWEuY29tPiB3cm90ZToKPiAKPiA+IC0jIEpJVCBpcyBub3Qgc3Vw
cG9ydGVkIGZvciBNSVBTIHI2LCBidXQgdGhlIFdlYktpdCBidWlsZCBzeXN0ZW0gZG9lcyBub3QK
PiA+IC0jIGhhdmUgYSBjaGVjayBmb3IgdGhlc2UgcHJvY2Vzc29ycy4gVGhlIHNhbWUgZ29lcyBm
b3IgQVJNdjUgYW5kIEFSTXY2Lgo+ID4gLSMgRGlzYWJsZSBKSVQgZm9yY2libHkgaGVyZSBhbmQg
dXNlIHRoZSBDTG9vcCBpbnRlcnByZXRlciBpbnN0ZWFkLgo+ID4gKyMgSklUIGlzIG5vdCBzdXBw
b3J0ZWQgZm9yIE1JUFMsIEFSTXY1LCBhbmQgQVJNdjYsIGJ1dCB0aGUgV2ViS2l0IGJ1aWxkCj4g
PiArIyBzeXN0ZW0gZG9lcyBub3QgaGF2ZSBhIGNoZWNrIGZvciB0aGVzZSBwcm9jZXNzb3JzLgo+
ID4gICMKPiA+ICsjIERpc2FibGUgSklUIGZvcmNpYmx5IGhlcmUgYW5kIHVzZSB0aGUgQ0xvb3Ag
aW50ZXJwcmV0ZXIgaW5zdGVhZC4KPiA+ICAjIEFsc28sIHdlIGhhdmUgdG8gZGlzYWJsZSB0aGUg
c2FtcGxpbmcgcHJvZmlsZXIgYW5kIFdlYkFzc2VtYmx5LCB3aGljaAo+ID4gICMgZG8gTk9UIHdv
cmsgd2l0aCBFTkFCTEVfQ19MT09QLgo+ID4gICMKPiA+IC0jIFVwc3RyZWFtIGJ1Z3M6IGh0dHBz
Oi8vYnVncy53ZWJraXQub3JnL3Nob3dfYnVnLmNnaT9pZD0xOTEyNTgKPiA+IC0jICAgICAgICAg
ICAgICAgIGh0dHBzOi8vYnVncy53ZWJraXQub3JnL3Nob3dfYnVnLmNnaT9pZD0xNzI3NjUKPiA+
IC0jICAgICAgICAgICAgICAgIGh0dHBzOi8vYnVncy53ZWJraXQub3JnL3Nob3dfYnVnLmNnaT9p
ZD0yNjUyMTgKPiA+ICsjIFVwc3RyZWFtIGJ1ZzogaHR0cHM6Ly9idWdzLndlYmtpdC5vcmcvc2hv
d19idWcuY2dpP2lkPTI3ODU1OQo+ID4gICMKPiA+IC1pZmVxICgkKEJSMl9BUk1fQ1BVX0FSTVY1
KSQoQlIyX0FSTV9DUFVfQVJNVjYpJChCUjJfTUlQU19DUFVfTUlQUzMyUjYpJChCUjJfTUlQU19D
UFVfTUlQUzY0UjYpLHkpCj4gPiAraWZlcSAoJChCUjJfQVJNX0NQVV9BUk1WNSkkKEJSMl9BUk1f
Q1BVX0FSTVY2KSQoQlIyX21pcHMpJChCUjJfbWlwc2VsKSx5KQo+IAo+IEJ1dCB0aGVuIGRvIHdl
IGFjdHVhbGx5IG5lZWQgYSBjaGFuZ2U/Cj4gCj4gS2VlcCBpbiBtaW5kIHRoYXQgaGVyZSB3ZSBh
cmUgb25seSBkaXNhYmxpbmcgSklUIGV4cGxpY2l0bHkgZm9yIEFSTXY1LAo+IEFSTXY2IGFuZCBN
SVBTMzJSNi9NSVBTNjRSNiBiZWNhdXNlIHRoZXkgd2VyZSBtaXNkZXRlY3RlZCBhcyBzdXBwb3J0
ZWQKPiBieSB3cGV3ZWJraXQuIEluZGVlZCB3cGV3ZWtpdCBzdXBwb3J0ZWQgQVJNIGFuZCBNSVBT
LCBidXQgbm90IHNvbWUKPiB2YXJpYW50cyBvZiBpdC4KPiAKPiBGb3IgYWxsIG90aGVyIGFyY2hp
dGVjdHVyZXMsIHdlIGRvIG5vdGhpbmcsIGFuZCB3cGV3ZWJpdCBwcm9wZXJseQo+IGRlY2lkZXMg
d2hldGhlciBpdCBzdXBwb3J0cyBKSVQgb3Igbm90LiBTbyBpZiBKSVQgc3VwcG9ydCBmb3IgTUlQ
UyBoYXMKPiBiZWVuIGRyb3BwZWQgSSBiZWxpZXZlIHRoZSBjb3JyZWN0IGNoYW5nZSBpczoKPiAK
PiAtaWZlcSAoJChCUjJfQVJNX0NQVV9BUk1WNSkkKEJSMl9BUk1fQ1BVX0FSTVY2KSQoQlIyX01J
UFNfQ1BVX01JUFMzMlI2KSQoQlIyX01JUFNfQ1BVX01JUFM2NFI2KSx5KQo+ICtpZmVxICgkKEJS
Ml9BUk1fQ1BVX0FSTVY1KSQoQlIyX0FSTV9DUFVfQVJNVjYpLHkpCj4gCj4gYnV0IG9ubHkgb2Yg
Y291cnNlIG9uY2Ugd2UgdXNlIGEgdmVyc2lvbiBvZiB3cGV3ZWJraXQgdGhhdCByZWFsbHkgaGFz
Cj4gZHJvcHBlZCBNSVBTIHN1cHBvcnQuCgpJIGFtIGNvbmZpZGVudCB0aGF0IHRoZSAyLjQ0Lngg
ZG9lcyBub3QgaW5jbHVkZSBNSVBTIEpJVCBzdXBwb3J0IGluCkphdmFTY3JpcHRDb3JlLCBidXQg
d2hlbiB3b3JraW5nIHRoaXMgSSBjb3VsZCBub3QganVzdCByZW1vdmUgdGhlCiQoQlIyX01JUFNf
KikgY2hlY2tzIGJlY2F1c2UgdGhlIGJ1aWxkIGZhaWxlZC4gV2hpY2ggaXMgYW5vdGhlciByZWFz
b24Kd2h5IEkgZmlsZWQgaHR0cHM6Ly9idWdzLndlYmtpdC5vcmcvc2hvd19idWcuY2dpP2lkPTI3
ODU1OSB0byB1cGRhdGUKdGhlIGNoZWNrcyBpbiBXZWJLaXQncyBDTWFrZSBidWlsZCBzeXN0ZW0u
CiAKPiBBcyBzdWNoLCB5b3VyIGNoYW5nZSB3b3VsZCBwb3RlbnRpYWxseSBicmVhazogaXQgcmUt
ZW5hYmxlcyBKSVQgb24KPiBCUjJfTUlQU19DUFVfTUlQUzY0UjY9eSwgYmVjYXVzZSB5b3UgZGlz
YWJsZSBmb3IgQlIyX21pcHMgYW5kCj4gQlIyX21pcHNlbCBidXQgdGhlcmUgYXJlIHRoZSAzMi1i
aXQgdmFyaWFudHMgb2YgTUlQUywgYW5kIHNvCj4gQlIyX01JUFNfQ1BVX01JUFM2NFI2PXkgd291
bGQgYWdhaW4gYWxsb3cgSklULgoKTXkgaW50ZW50aW9uIHdhcyB0byBhbHdheXMgbWFrZSB0aGUg
QnVpbGRyb290IHBhY2thZ2luZyBkaXNhYmxlIEpJVApzdXBwb3J0IG9uIGJvdGggMzItIGFuZCA2
NC1iaXQgTUlQUy4gSSBkaWRuJ3Qgbm90aWNlIHRoYXQgQlIyX21pcHNbZWxdCm9ubHkgY292ZXJl
ZCB0aGUgMzItYml0IG9uZXMuCgo+IENvdWxkIHlvdSBjbGFyaWZ5IGlmIHdlIGhhdmUgYWxyZWFk
eSB1cGRhdGVkIHRvIGEgdmVyc2lvbiBvZiB3cGV3ZWJraXQKPiB0aGF0IGhhcyBkcm9wcGVkIE1J
UFMgc3VwcG9ydCBmb3IgSklUPyBJZiBzbywgd2Ugc2hvdWxkIHNpbXBseSBhcHBseQo+IHRoZSBz
aW1wbGVyIGNoYW5nZSBhYm92ZS4KCkknbGwgZG91YmxlIGNoZWNrIGFnYWluIGJ1dCBJIGFtIG5v
dCAxMDAlIHN1cmUgd2UgY2FuIHVzZSB0aGUgc2ltcGxlcgpjaGVjay4gSWRlYWxseSwgd2Ugc2hv
dWxkbid0IG5lZWQgYSBjaGVjayBpbiB0aGUgQnVpbGRyb290IHBhY2thZ2luZwphbmQgbXkgdWx0
aW1hdGUgZ29hbCBpcyB0byBoYXZlIFdlYktpdCdzIENNYWtlIGJ1aWxkIHN5c3RlbSBjb25maWd1
cmUKaXRzZWxmIGNvcnJlY3RseSBzbyB3ZSBjYW4gcmVtb3ZlIHRoZSBhZC1ob2MgY2hlY2tzIGlu
IEJ1aWxkcm9vdC4KCkNoZWVycywK4oCUQWRyacOhbgo=

--kH8EUB+gyR1bJnm0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABEDAB0WIQRao7wzT9fjNp58d7KRxVnb5MkSOwUCZtYgPQAKCRCRxVnb5MkS
O/ZUAJ4uIR0+kcO2EZfLbsMwMnLq1G6+eACggDfMM74cH/0fvcSAjOAdu6CsKvM=
=zrQV
-----END PGP SIGNATURE-----

--kH8EUB+gyR1bJnm0--

--===============7859930646621140189==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7859930646621140189==--
