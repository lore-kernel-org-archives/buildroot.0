Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A692CD13CF
	for <buildroot@archiver.kernel.org>; Mon,  2 Sep 2024 20:15:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C6B0280DF4;
	Mon,  2 Sep 2024 20:15:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ALbg4EHf5gaQ; Mon,  2 Sep 2024 20:15:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B173580E04
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B173580E04;
	Mon,  2 Sep 2024 20:15:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 41AC51BF426
 for <buildroot@lists.busybox.net>; Mon,  2 Sep 2024 20:15:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3C26D405ED
 for <buildroot@lists.busybox.net>; Mon,  2 Sep 2024 20:15:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mIe19FjYLJnk for <buildroot@lists.busybox.net>;
 Mon,  2 Sep 2024 20:15:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=178.60.130.6;
 helo=fanzine2.igalia.com; envelope-from=aperez@igalia.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 06D4E40026
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 06D4E40026
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 06D4E40026
 for <buildroot@buildroot.org>; Mon,  2 Sep 2024 20:15:53 +0000 (UTC)
Received: from 91-152-140-108.elisa-laajakaista.fi ([91.152.140.108]
 helo=momiji) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1slDSq-008TRV-B7; Mon, 02 Sep 2024 22:15:51 +0200
Received: from localhost (momiji [local])
 by momiji (OpenSMTPD) with ESMTPA id ff7d2b36;
 Mon, 2 Sep 2024 20:15:51 +0000 (UTC)
Date: Mon, 2 Sep 2024 23:15:51 +0300
Message-ID: <20240902231551.GF1449890@igalia.com>
From: Adrian Perez de Castro <aperez@igalia.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20240802230832.27edaf28@windsurf>
References: <20240208095531.99049-1-aperez@igalia.com>
 <20240627193335.4069574-4-aperez@igalia.com>
 <20240802230832.27edaf28@windsurf>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Type:MIME-Version:References:In-Reply-To:Subject:Cc:To:
 From:Message-ID:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=U5kOll3mCY08VPRS2/lk8PTLpKuQ8f+eOqQmeVxR/dk=; b=qLQLsuiI8psHToJ1QNXQGylHyj
 dvIrvwvCb8YWdGhRK0tYsPbBhGrhcGEGT7yFvL71k7YhPKuJZoSDImrmzpQ07kdn/ilxktU6zY7nU
 PUQe1VFxJNJfuoh1yMdVTL/TL0NFW1UI6EbIZeu94DSHTlRjS2XudomBdG6l6Q3b21wd7LFmduvQr
 bFj0Q9RHdlCSlUtvtRd9OCBj4q65ft5I8sNtTsd67iXCGFgfD2nxwluyz5bIndaAJJZ/V9XaUx7nu
 yjq8T1/Tj4LO2+DJ02iOO1WXeiy/2EutC55ZAkCm1HEVPzrfKxsO3Eng61XwinREna+1LjzkeKMjg
 c/7MPKbg==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=igalia.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256
 header.s=20170329 header.b=qLQLsuiI
Subject: Re: [Buildroot] [PATCH v2 3/4] package/wpewebkit: do not depend on
 wpebackend-fdo
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
Cc: Samuel Martin <s.martin49@gmail.com>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============7993229210083768016=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============7993229210083768016==
Content-Type: multipart/signed; boundary="UiA151dvmCOEM+Zi"; micalg="pgp-ripemd160"; protocol="application/pgp-signature"


--UiA151dvmCOEM+Zi
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: base64

SGksCgpPbiBGcmksIDAyIEF1ZyAyMDI0IDIzOjA4OjMyICswMjAwIFRob21hcyBQZXRhenpvbmkg
dmlhIGJ1aWxkcm9vdCA8YnVpbGRyb290QGJ1aWxkcm9vdC5vcmc+IHdyb3RlOgoKPiBPbiBUaHUs
IDI3IEp1biAyMDI0IDIyOjMzOjMxICswMzAwCj4gQWRyaWFuIFBlcmV6IGRlIENhc3RybyA8YXBl
cmV6QGlnYWxpYS5jb20+IHdyb3RlOgo+IAo+ID4gUmVtb3ZlIHRoZSB3cGV3ZWJraXQgcGFja2Fn
ZSBkZXBlbmRlbmN5IG9uIHdwZWJhY2tlbmQtZmRvLCBhcyBpdCBpcyBub3QKPiA+IG5lZWRlZCBh
dCBhbGwgZHVyaW5nIHRoZSBidWlsZC4gV2hhdCBpcyBuZWVkZWQgaXMgYSBXUEUgYmFja2VuZCBh
dCBydW4KPiA+IHRpbWUsIHdoaWNoIG1heSBiZSBwcm92aWRlZCBieSB3cGViYWNrZW5kLWZkbyBv
ciB3cGViYWNrZW5kLXJkay4gVG8KPiA+IHJlZmxlY3QgdGhpcywgd2UgbWFrZSB3cGV3ZWJraXQg
ZGVwZW5kIG9uIGVpdGhlciBiZWluZyBzZWxlY3RlZC4KPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTog
QWRyaWFuIFBlcmV6IGRlIENhc3RybyA8YXBlcmV6QGlnYWxpYS5jb20+Cj4gPiAtLS0KPiA+ICBw
YWNrYWdlL3dwZXdlYmtpdC9Db25maWcuaW4gICAgfCA5ICsrKystLS0tLQo+ID4gIHBhY2thZ2Uv
d3Bld2Via2l0L3dwZXdlYmtpdC5tayB8IDIgKy0KPiA+ICAyIGZpbGVzIGNoYW5nZWQsIDUgaW5z
ZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKPiA+IAo+ID4gLS0tCj4gPiB2MSAtPiB2MjoKPiA+
IC0gUmVtb3ZlIG9wZW5qcGVnIGRlcGVuZGVuY3ksIHdoaWNoIGhhcyBiZWVuIGRyb3BwZWQgaW4g
Mi40NC54Cj4gPiAKPiA+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3dwZXdlYmtpdC9Db25maWcuaW4g
Yi9wYWNrYWdlL3dwZXdlYmtpdC9Db25maWcuaW4KPiA+IGluZGV4IGU0YjAzMjBlMWRhLi5jNTVi
ODI3ZTJiOCAxMDA2NDQKPiA+IC0tLSBhL3BhY2thZ2Uvd3Bld2Via2l0L0NvbmZpZy5pbgo+ID4g
KysrIGIvcGFja2FnZS93cGV3ZWJraXQvQ29uZmlnLmluCj4gPiBAQCAtMjQsMTEgKzI0LDExIEBA
IGNvbW1lbnQgIndwZXdlYmtpdCBuZWVkcyBhIHRvb2xjaGFpbiB3LyBDKyssIHdjaGFyLCB0aHJl
YWRzLCBkeW5hbWljIGxpYnJhcnksIGdjCj4gPiAgCQl8fCAhQlIyX1RPT0xDSEFJTl9HQ0NfQVRf
TEVBU1RfMTAgXAo+ID4gIAkJfHwgIUJSMl9IT1NUX0dDQ19BVF9MRUFTVF80XzkKPiA+ICAKPiA+
IC1jb21tZW50ICJ3cGV3ZWJraXQgbmVlZHMgYW4gT3BlbkdMIEVTIHcvIEVHTC1jYXBhYmxlIFdh
eWxhbmQgYmFja2VuZCIKPiA+ICtjb21tZW50ICJ3cGV3ZWJraXQgbmVlZHMgYW4gT3BlbkdMIEVT
IHcvIEVHTC1jYXBhYmxlIGltcGxlbWVudGF0aW9uIGFuZCBhbiBXUEUgYmFja2VuZCIKPiA+ICAJ
ZGVwZW5kcyBvbiBCUjJfUEFDS0FHRV9XUEVXRUJLSVRfQVJDSF9TVVBQT1JUUwo+ID4gIAlkZXBl
bmRzIG9uICFCUjJfQklORk1UX0ZMQVQKPiA+IC0JZGVwZW5kcyBvbiAhQlIyX1BBQ0tBR0VfSEFT
X0xJQkdMRVMgfHwgIUJSMl9QQUNLQUdFX0hBU19MSUJFR0wgXAo+ID4gLQkJfHwgIUJSMl9QQUNL
QUdFX0hBU19MSUJFR0xfV0FZTEFORAo+ID4gKwlkZXBlbmRzIG9uICFCUjJfUEFDS0FHRV9IQVNf
TElCR0xFUyB8fCAhQlIyX1BBQ0tBR0VfSEFTX0xJQkVHTAo+ID4gKwlkZXBlbmRzIG9uICFCUjJf
UEFDS0FHRV9XUEVCQUNLRU5EX0ZETyAmJiAhQlIyX1BBQ0tBR0VfV1BFQkFDS0VORF9SREsKPiAK
PiBJIHRoaW5rIHdlIHdpbGwgd2FudCB0byBzZWxlY3Qgb25lLCBzZWUgYmVsb3cuCiAKSW5kZWVk
LCBJIGRpZG4ndCBjb21lIHVwIG15c2VsZiB3aXRoIGEgZ29vZCB3YXkgb2YgbWFraW5nIHN1cmUg
YXQgbGVhc3QKb25lIGlzIHBpY2tlZC4uLgogIAo+ID4gIGNvbmZpZyBCUjJfUEFDS0FHRV9XUEVX
RUJLSVQKPiA+ICAJYm9vbCAid3Bld2Via2l0Igo+ID4gQEAgLTQxLDggKzQxLDggQEAgY29uZmln
IEJSMl9QQUNLQUdFX1dQRVdFQktJVAo+ID4gIAlkZXBlbmRzIG9uIEJSMl9VU0VfV0NIQVIgIyBp
Y3UsIGxpYnNvdXAzCj4gPiAgCWRlcGVuZHMgb24gQlIyX1BBQ0tBR0VfSEFTX0xJQkdMRVMgIyBs
aWJlcG94eQo+ID4gIAlkZXBlbmRzIG9uIEJSMl9QQUNLQUdFX0hBU19MSUJFR0wgIyBsaWJlcG94
eQo+ID4gLQlkZXBlbmRzIG9uIEJSMl9QQUNLQUdFX0hBU19MSUJFR0xfV0FZTEFORCAjIHdwZWJh
Y2tlbmQtZmRvCj4gPiAgCWRlcGVuZHMgb24gQlIyX1BBQ0tBR0VfV1BFV0VCS0lUX0FSQ0hfU1VQ
UE9SVFMKPiA+ICsJZGVwZW5kcyBvbiBCUjJfUEFDS0FHRV9XUEVCQUNLRU5EX0ZETyB8fCBCUjJf
UEFDS0FHRV9XUEVCQUNLRU5EX1JESwo+IAo+IFBsZWFzZSB1c2UgaW5zdGVhZDoKPiAKPiAJc2Vs
ZWN0IEJSMl9QQUNLQUdFX1dQRUJBQ0tFTkRfRkRPIGlmICFCUjJfUEFDS0FHRV9XUEVCQUNLRU5E
X1JESyAjIHJ1bnRpbWUKPiAKPiB0aGlzIHdpbGwgZW5zdXJlIHRoYXQgYXQgbGVhc3Qgb25lIGlz
IHNlbGVjdGVkLCB0YWtpbmcgYnkgZGVmYXVsdAo+IHdwZWJhY2tlbmQtZmRvLCBidXQgYWxsb3dp
bmcgdGhlIHVzZXIgdG8gZW5hYmxlIHdwZWJhY2tlbmQtcmRrIChhbmQKPiBkaXNhYmxlIHdwZWJh
Y2tlbmQtZmRvKS4KCi4uLmFuZCBubyBpZGVhIHdoeSB0aGlzIGRpZG4ndCBjcm9zcyBteSBtaW5k
LiBUaGFua3MgZm9yIHRoZSBzdWdnZXN0aW9uLAp0aGlzIGlzIHRoZSByaWdodCB0aGluZyB0byBk
by4KIAo+IEFsc28gdGhlICIjIHJ1bnRpbWUiIGNvbW1lbnQgaXMgaW1wb3J0YW50LCBiZWNhdXNl
IGl0IGV4cGxhaW5zIHdoeSBhbgo+IG9wdGlvbiBpcyBzZWxlY3RlZCwgYnV0IG5vdCBhZGRlZCB0
byB0aGUgYnVpbGQgZGVwZW5kZW5jaWVzIG9mIHRoZQo+IHBhY2thZ2UuCgpUSUwsIHRoYW5rcy4K
CkNoZWVycywK4oCUQWRyacOhbgo=

--UiA151dvmCOEM+Zi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABEDAB0WIQRao7wzT9fjNp58d7KRxVnb5MkSOwUCZtYc9wAKCRCRxVnb5MkS
O8jdAJ9ZLuPYIfbcSv0jp24dz2AbdGTI7gCeO1oDKsHszEs7hLXQI7vH4nFAW30=
=xTDw
-----END PGP SIGNATURE-----

--UiA151dvmCOEM+Zi--

--===============7993229210083768016==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7993229210083768016==--
