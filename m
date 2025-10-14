Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B3ADCCD184
	for <buildroot@archiver.kernel.org>; Tue, 14 Oct 2025 11:01:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 881D541684;
	Tue, 14 Oct 2025 11:01:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BQxR35emIAV5; Tue, 14 Oct 2025 11:01:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8EA0641680
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8EA0641680;
	Tue, 14 Oct 2025 11:01:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id EED4A1C9
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 11:01:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D55DA40D33
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 11:01:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0NB-D1lRem44 for <buildroot@buildroot.org>;
 Tue, 14 Oct 2025 11:01:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=213.97.179.56;
 helo=fanzine2.igalia.com; envelope-from=aperez@igalia.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4E4B6400C0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4E4B6400C0
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4E4B6400C0
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 11:01:11 +0000 (UTC)
Received: from 91-153-34-249.elisa-laajakaista.fi ([91.153.34.249] helo=kodama)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1v8cmC-009MkO-C2; Tue, 14 Oct 2025 13:01:08 +0200
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id 68fbd298;
 Tue, 14 Oct 2025 11:01:07 +0000 (UTC)
Date: Tue, 14 Oct 2025 14:01:03 +0300
Message-ID: <20251014140103.GF3402529@igalia.com>
From: Adrian Perez de Castro <aperez@igalia.com>
To: Julien Olivain <ju.o@free.fr>
Cc: Raphael Pavlidis <raphael.pavlidis@gmail.com>, buildroot@buildroot.org
In-Reply-To: <952c26d08945d7c798264805f7ae3cd9@free.fr>
References: <20250921181748.416113-1-raphael.pavlidis@gmail.com>
 <952c26d08945d7c798264805f7ae3cd9@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Type:MIME-Version:References:In-Reply-To:Subject:Cc:To:
 From:Message-ID:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ovAqlUT/TGK66W3sL6KHAweo5HH+etpq8a2XDHZoQ0c=; b=gXMep3jojgyyxms9aU8nWu8FQ8
 RtMfyr7bwea3XC2OygZliO9V0v+t60whYYhCBZTCYgSKZJf/pDy4N53geUS/rrY/J7tfk0s1/EtBC
 R6T+4HI7SehDw55JIyKcnHPyPENz83dpAJunq3OKGwjK/b7goTvfKgPWm2whK6l89Xp0FTpdJlipX
 O9Dpv7aMLj+LzOwI1x6L5BxVELf60Cq3MDNfAiDXGF0NVo7qgT5Kfg8+ePVrNmgqvRFOGNYBuJ/6j
 Mv9v8KoSN/XRLGEHsrHLhieo8vq8ZXiBYLHxGEmsp6r421lg7ML1seEyJsTxW+Nup+HB8gx040fY+
 kg19lV5Q==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=igalia.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256
 header.s=20170329 header.b=gXMep3jo
Subject: Re: [Buildroot] [PATCH v1 1/2] package/wlroots: bump to version
 0.19.0
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
Content-Type: multipart/mixed; boundary="===============2330175186916918516=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============2330175186916918516==
Content-Type: multipart/signed; boundary="h3f8BTpCZVIMVj6x"; micalg="pgp-sha256"; protocol="application/pgp-signature"


--h3f8BTpCZVIMVj6x
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: base64

SGVsbG8gUmFwaGFlbCBhbmQgSnVsaWVuLAoKT24gVHVlLCAyMyBTZXAgMjAyNSAyMjoxNjoxOCAr
MDIwMCBKdWxpZW4gT2xpdmFpbiB2aWEgYnVpbGRyb290IDxidWlsZHJvb3RAYnVpbGRyb290Lm9y
Zz4gd3JvdGU6CiAKPiBUaGFua3MgZm9yIHRoZSBwYXRjaC4KPiAKPiBPbiAyMS8wOS8yMDI1IDIw
OjE3LCBSYXBoYWVsIFBhdmxpZGlzIHdyb3RlOgo+ID4gQ2hhbmdlbG9nOgo+ID4gaHR0cHM6Ly9n
aXRsYWIuZnJlZWRlc2t0b3Aub3JnL3dscm9vdHMvd2xyb290cy8tL3JlbGVhc2VzLzAuMTkuMAo+
ID4gU2lnbmVkLW9mZi1ieTogUmFwaGFlbCBQYXZsaWRpcyA8cmFwaGFlbC5wYXZsaWRpc0BnbWFp
bC5jb20+Cj4gPiAtLS0KPiA+ICBwYWNrYWdlL3dscm9vdHMvd2xyb290cy5oYXNoIHwgNCArKy0t
Cj4gPiAgcGFja2FnZS93bHJvb3RzL3dscm9vdHMubWsgICB8IDIgKy0KPiA+ICAyIGZpbGVzIGNo
YW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPiA+IAo+IFsuLi5dCj4gPiBk
aWZmIC0tZ2l0IGEvcGFja2FnZS93bHJvb3RzL3dscm9vdHMubWsgYi9wYWNrYWdlL3dscm9vdHMv
d2xyb290cy5tawo+ID4gaW5kZXggODFmNzZmY2RjNy4uNjg5NjYyZjUzNiAxMDA2NDQKPiA+IC0t
LSBhL3BhY2thZ2Uvd2xyb290cy93bHJvb3RzLm1rCj4gPiArKysgYi9wYWNrYWdlL3dscm9vdHMv
d2xyb290cy5tawo+ID4gQEAgLTQsNyArNCw3IEBACj4gPiAgIwo+ID4gIAo+ID4gIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMKPiA+IAo+ID4gLVdMUk9PVFNfVkVSU0lPTiA9IDAuMTguMgo+ID4gK1dM
Uk9PVFNfVkVSU0lPTiA9IDAuMTkuMAo+IAo+IFVwZGF0aW5nIHdscm9vdHMgdG8gMC4xOS4wIGJy
ZWFrcyBjYWdlIDAuMi4wIGR1ZSB0byB0aGUgYnJlYWtpbmcgY2hhbmdlcyAKPiBkZXNjcmliZWQK
PiBpbiB0aGUgcmVsZWFzZSBub3RlLgo+IAo+IENvdWxkIHlvdSBhbHNvIHNlbmQgYSBwYXRjaCB0
aGF0IGJ1bXBzIGNhZ2UgdG8KPiB2MC4yLjAtMTUtZzJlNTkzZmU1YThhMjE4NmE1NThjZWI0MTQ2
NzQ3NzVlNGJhNWQyYjEKPiBvciBncmVhdGVyLCBwbGVhc2U/IChubyBuZWVkIHRvIHJlc2VuZCB0
aGlzIHNlcmllcykKCk9yLCBldmVuIGJldHRlciwgdXBkYXRlIHRvIENhZ2UgMC4yLjEsIHdoaWNo
IGNhbiBiZSBidWlsdCBhZ2FpbnN0Cndscm9vdHMgMC4xOS54LCBhcyBwZXIgdGhlIHJlbGVhc2Ug
bm90ZXM6CgogIGh0dHBzOi8vZ2l0aHViLmNvbS9jYWdlLWtpb3NrL2NhZ2UvcmVsZWFzZXMvdGFn
L3YwLjIuMQogCj4gPiAgV0xST09UU19TSVRFID0gCj4gPiBodHRwczovL2dpdGxhYi5mcmVlZGVz
a3RvcC5vcmcvd2xyb290cy93bHJvb3RzLy0vcmVsZWFzZXMvJChXTFJPT1RTX1ZFUlNJT04pL2Rv
d25sb2Fkcwo+ID4gIFdMUk9PVFNfTElDRU5TRSA9IE1JVAo+ID4gIFdMUk9PVFNfTElDRU5TRV9G
SUxFUyA9IExJQ0VOU0UKPiA+IC0tCj4gPiAyLjUxLjAKPiAKPiBCZXN0IHJlZ2FyZHMsCj4gCj4g
SnVsaWVuLgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Cj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4gaHR0
cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cj4gCgpD
aGVlcnMsCuKAlEFkcmnDoW4K

--h3f8BTpCZVIMVj6x
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABEIAB0WIQRao7wzT9fjNp58d7KRxVnb5MkSOwUCaO4tbwAKCRCRxVnb5MkS
Oy8lAJ900eJy0TSJksjaR8M1n2ZQye1QYQCffrpxN/mRYxjouOdDvomxmIiWnY0=
=89CR
-----END PGP SIGNATURE-----

--h3f8BTpCZVIMVj6x--

--===============2330175186916918516==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2330175186916918516==--
