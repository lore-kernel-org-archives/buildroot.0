Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40A5DC4167B
	for <buildroot@archiver.kernel.org>; Tue, 14 Nov 2023 13:07:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9FA4F82105;
	Tue, 14 Nov 2023 13:07:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9FA4F82105
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GWhmJgLl2xz2; Tue, 14 Nov 2023 13:07:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0235D82106;
	Tue, 14 Nov 2023 13:07:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0235D82106
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 60BB11BF2B4
 for <buildroot@lists.busybox.net>; Tue, 14 Nov 2023 13:07:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 39C4E41DEC
 for <buildroot@lists.busybox.net>; Tue, 14 Nov 2023 13:07:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 39C4E41DEC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8237lVoN4SRL for <buildroot@lists.busybox.net>;
 Tue, 14 Nov 2023 13:07:03 +0000 (UTC)
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2502941DD0
 for <buildroot@buildroot.org>; Tue, 14 Nov 2023 13:07:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2502941DD0
Received: from 91-153-34-210.elisa-laajakaista.fi ([91.153.34.210] helo=kodama)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1r2t85-0036G6-MZ; Tue, 14 Nov 2023 14:06:57 +0100
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id 3b7b647a;
 Tue, 14 Nov 2023 13:06:56 +0000 (UTC)
Date: Tue, 14 Nov 2023 15:06:52 +0200
Message-ID: <20231114150652.GB1974649@igalia.com>
From: Adrian Perez de Castro <aperez@igalia.com>
To: Thomas Devoogdt <thomas@devoogdt.com>
In-Reply-To: <20231110164617.569602-1-thomas@devoogdt.com>
References: <Thomas Devoogdt
 <20231001165218.1960930-3-thomas.devoogdt@barco.com>
 <20231110164617.569602-1-thomas@devoogdt.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Type:MIME-Version:References:In-Reply-To:Subject:Cc:To:
 From:Message-ID:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=1IHoQ58VY8SKjmOgZ0+cR4gku0OPFrVjGbzf8DIjwRw=; b=bKYIVZd6vfwEuQiTpoGV+/iETc
 HkaaEo+BSY89EeZIQ+UZJsLYH5s12izE+CNIDst7y0Vc2QVIUUxMUUjLTABWkmNLk2NU23E+n85h+
 PwanTdQgaL1n5LWmCheR/A1ymetpy1AF9ltW5wNyEgh8xoMpbzkeOv/f2wf1fpKRmuVAyl36VHH7Q
 chF0qAkU7WVkET3w0HVoJK5ZztQCtZ6iVSTICpbDRiqpESFefJPFs/Z5iSUN4kYHR12A8eepjs9iX
 GiETaNbkqAzDD+z49m6lqiLCiV9X/USIy4aOa0Cslg6r1yhi48DOKfItdNHfcMw+kFsi9KPYj2kPC
 mjxfylng==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com
 header.a=rsa-sha256 header.s=20170329 header.b=bKYIVZd6
Subject: Re: [Buildroot] [PATCH v5 1/3] package/webkitgtk: make gbm support
 optional
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
Cc: Thomas Devoogdt <thomas@devoogdt.com>,
 Thomas Devoogdt <thomas.devoogdt@barco.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============1426175999553136480=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============1426175999553136480==
Content-Type: multipart/signed; boundary="e/0TNWqn/ZeCz1nd"; micalg="pgp-ripemd160"; protocol="application/pgp-signature"


--e/0TNWqn/ZeCz1nd
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: base64

T24gRnJpLCAxMCBOb3YgMjAyMyAxNzo0NjoxNSArMDEwMCBUaG9tYXMgRGV2b29nZHQgPHRob21h
c0BkZXZvb2dkdC5jb20+IHdyb3RlOgo+IFRoaXMgd2FzIGFkZGVkIHVwc3RyZWFtIGluIGNvbW1p
dDoKPiAKPiBodHRwczovL2dpdGh1Yi5jb20vV2ViS2l0L1dlYktpdC9jb21taXQvMjJlNGMwMzg2
NjA1ZDg0ZjQyZjJkNDZmZDIwYmRjNDZlMzA3ODQ5OAo+IAo+IFRoZSAnVVNFX09QRU5HTF9PUl9F
UycgZmxhZyBpcyBkZWZhdWx0IE9OLCB3aGljaCB3aWxsIGVuYWJsZSAnVVNFX0dCTScsCj4gc28g
ZW5zdXJlIHRoYXQgd2UgdW5zZXQgJ1VTRV9HQk0nIGlmIHdlIGRvbid0IGhhdmUgbGliZ2JtLgo+
IAo+IFNpZ25lZC1vZmYtYnk6IFRob21hcyBEZXZvb2dkdCA8dGhvbWFzLmRldm9vZ2R0QGJhcmNv
LmNvbT4KClRlc3RlZC1ieTogQWRyaWFuIFBlcmV6IGRlIENhc3RybyA8YXBlcmV6QGlnYWxpYS5j
b20+Cgo+IC0tLQo+IHYyLDMsNCw1OiBubyBjaGFuZ2UKPiAtLS0KPiAgcGFja2FnZS93ZWJraXRn
dGsvd2Via2l0Z3RrLm1rIHwgNyArKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlv
bnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS93ZWJraXRndGsvd2Via2l0Z3RrLm1rIGIv
cGFja2FnZS93ZWJraXRndGsvd2Via2l0Z3RrLm1rCj4gaW5kZXggYmI2ZGYzZDU5Mi4uODhiZGZh
ZTI3YiAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL3dlYmtpdGd0ay93ZWJraXRndGsubWsKPiArKysg
Yi9wYWNrYWdlL3dlYmtpdGd0ay93ZWJraXRndGsubWsKPiBAQCAtODgsNiArODgsMTMgQEAgZWxz
ZQo+ICBXRUJLSVRHVEtfQ09ORl9PUFRTICs9IC1ERU5BQkxFX0dMRVMyPU9GRgo+ICBlbmRpZgo+
ICAKPiAraWZlcSAoJChCUjJfUEFDS0FHRV9IQVNfTElCR0JNKSx5KQo+ICtXRUJLSVRHVEtfQ09O
Rl9PUFRTICs9IC1EVVNFX0dCTT1PTgo+ICtXRUJLSVRHVEtfREVQRU5ERU5DSUVTICs9IGxpYmdi
bQo+ICtlbHNlCj4gK1dFQktJVEdUS19DT05GX09QVFMgKz0gLURVU0VfR0JNPU9GRgo+ICtlbmRp
Zgo+ICsKPiAgaWZlcSAoJChCUjJfUEFDS0FHRV9MSUJHVEszX1gxMSkseSkKPiAgV0VCS0lUR1RL
X0NPTkZfT1BUUyArPSAtREVOQUJMRV9YMTFfVEFSR0VUPU9OCj4gIFdFQktJVEdUS19ERVBFTkRF
TkNJRVMgKz0gbGliZ2wgXAo+IC0tIAo+IDIuMzQuMQo+IAo+IF9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+IGJ1
aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxt
YW4vbGlzdGluZm8vYnVpbGRyb290Cj4gCgpDaGVlcnMsCuKAlEFkcmnDoW4K

--e/0TNWqn/ZeCz1nd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABEDAB0WIQRao7wzT9fjNp58d7KRxVnb5MkSOwUCZVNw7AAKCRCRxVnb5MkS
O+cTAJ9sYjrnDAQ4ncM7VsvQcTvdIVdD2gCfVsaDm/d0aM8Rv22Rkoxspxsdo4U=
=0a30
-----END PGP SIGNATURE-----

--e/0TNWqn/ZeCz1nd--

--===============1426175999553136480==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1426175999553136480==--
