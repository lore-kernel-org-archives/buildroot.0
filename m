Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8B66C43334
	for <buildroot@archiver.kernel.org>; Thu, 23 Jun 2022 21:16:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 07764611BC;
	Thu, 23 Jun 2022 21:16:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 07764611BC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u851ZdWODa-r; Thu, 23 Jun 2022 21:16:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F317161176;
	Thu, 23 Jun 2022 21:16:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F317161176
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DBEBF1BF2E3
 for <buildroot@lists.busybox.net>; Thu, 23 Jun 2022 21:16:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C3AC961175
 for <buildroot@lists.busybox.net>; Thu, 23 Jun 2022 21:16:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C3AC961175
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1VSJiIbbDfmJ for <buildroot@lists.busybox.net>;
 Thu, 23 Jun 2022 21:16:48 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BB27360BA4
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BB27360BA4
 for <buildroot@buildroot.org>; Thu, 23 Jun 2022 21:16:47 +0000 (UTC)
Received: from 135.224.60.213.dynamic.reverse-mundo-r.com ([213.60.224.135]
 helo=momiji) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA512__AES_256_GCM:256) (Exim)
 id 1o4UBv-008eMv-AL; Thu, 23 Jun 2022 23:16:43 +0200
Received: from localhost (momiji [local])
 by momiji (OpenSMTPD) with ESMTPA id 8aa44442;
 Thu, 23 Jun 2022 21:16:33 +0000 (UTC)
Date: Thu, 23 Jun 2022 23:16:28 +0200
Message-ID: <20220623231628.GC3175@momiji>
From: Adrian Perez de Castro <aperez@igalia.com>
To: James Hilliard <james.hilliard1@gmail.com>
In-Reply-To: <20220623045526.2152211-1-james.hilliard1@gmail.com>
References: <20220623045526.2152211-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Type:MIME-Version:References:In-Reply-To:Subject:Cc:To:
 From:Message-ID:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=LxMuwvK7ypsq2nqirPbul40VAKo4gtz9ZdBPeS37fVE=; b=IEz51wBMQ4BuyuUI0qTkE/OFVz
 /Z0aTIaBA71lfj0MvPY51sznd8BGOLI+JMCg2spsRBma39aEikOsgN09pSq3IN1vSTcgUQ/Rm9nUX
 bfcJpvFf/6axCMXqz2vUEBftf8pph93O2stf6sFxVDYSe6GZ4CFkH2lYQ4x+iMv45DdgFp27Q5KQK
 /kYh4yd0cIdF1A3AbVEcVE0XxX+8yHbqDFxjW71NENMb70Uwplcx2JRJLsSkJv0y0h5dVqakO6ogJ
 CvaAsa1tb0aUHp+cqSX4uS1wJqhsyP6/Ive5Lm3rZv6fvOpHQVP6x8ut+JK6aJBMfN+HX2DUTD6ya
 OpcQfHfA==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com
 header.a=rsa-sha256 header.s=20170329 header.b=IEz51wBM
Subject: Re: [Buildroot] [PATCH 1/1] package/{webkitgtk,
 wpewebkit}: select debugutils for multimedia
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
Cc: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============3664668996848590761=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============3664668996848590761==
Content-Type: multipart/signed; boundary="DICMECd4pWSvH+9T"; micalg="pgp-sha1"; protocol="application/pgp-signature"


--DICMECd4pWSvH+9T
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: base64

SGVsbG8sCgpPbiBXZWQsIDIyIEp1biAyMDIyIDIyOjU1OjI2IC0wNjAwIEphbWVzIEhpbGxpYXJk
IDxqYW1lcy5oaWxsaWFyZDFAZ21haWwuY29tPiB3cm90ZToKPiBXaGVuIHVzaW5nIHdlYmtpdCB3
aXRoIG11bHRpbWVkaWEgc3VwcG9ydCB0aGUgZmFrZXZpZGVvc2luayBlbGVtZW50Cj4gaXMgdXNl
ZCBpbiBzb21lIHBsYWNlcywgYXMgc3VjaCB3ZSBzaG91bGQgc2VsZWN0IGRlYnVndXRpbHMgd2hp
Y2gKPiBwcm92aWRlcyBmYWtldmlkZW9zaW5rIHdoZW4gYnVpbGRpbmcgd2l0aCBtdWx0aW1lZGlh
IHN1cHBvcnQuCgpNYWtlcyBzZW5zZS4gV2hpbGUgdGhlcmUgaXMgYSBmYWxsYmFjayBmb3Igd2hl
biBmYWtldmlkZW9zaW5rIGlzIG5vdAphdmFpbGFibGUsIGl0J3Mgc2xpZ2h0bHkgbGVzcyBlZmZp
Y2llbnQuIEFsc28gdGhlIGZhbGxiYWNrIGRpZG4ndCB3b3JrCmluIHZlcnNpb25zIDwyLjM2LjAg
YW5kIFdlYktpdCBjcmFzaGVkIGluc3RlYWQuCgo+IFNlZToKPiBodHRwczovL2dpdGh1Yi5jb20v
V2ViS2l0L1dlYktpdC9ibG9iLzEyMDg2YmNkZTdhMjk2YTA3ZGJiNGFjNmQyZmYwMDMwYjI5NzMw
NWEvU291cmNlL1dlYkNvcmUvcGxhdGZvcm0vZ3JhcGhpY3MvZ3N0cmVhbWVyL01lZGlhUGxheWVy
UHJpdmF0ZUdTdHJlYW1lci5jcHAjTDM4NjMKPiAKPiBBZGRpdGlvbmFsbHkgd2Via2l0IG1heSBh
bHNvIHVzZSB0aGUgZnBzZGlzcGxheXNpbmsgZWxlbWVudCB3aGljaAo+IGlzIGFsc28gcHJvdmlk
ZWQgYnkgZGVidWd1dGlscy4KPiAKPiBTZWU6Cj4gaHR0cHM6Ly9naXRodWIuY29tL1dlYktpdC9X
ZWJLaXQvYmxvYi8xMjA4NmJjZGU3YTI5NmEwN2RiYjRhYzZkMmZmMDAzMGIyOTczMDVhL1NvdXJj
ZS9XZWJDb3JlL3BsYXRmb3JtL2dyYXBoaWNzL2dzdHJlYW1lci9NZWRpYVBsYXllclByaXZhdGVH
U3RyZWFtZXIuY3BwI0wzODk3Cj4gCj4gU2lnbmVkLW9mZi1ieTogSmFtZXMgSGlsbGlhcmQgPGph
bWVzLmhpbGxpYXJkMUBnbWFpbC5jb20+CgpBY2tlZC1ieTogQWRyaWFuIFBlcmV6IGRlIENhc3Ry
byA8YXBlcmV6QGlnYWxpYS5jb20+Cgo+IC0tLQo+ICBwYWNrYWdlL3dlYmtpdGd0ay9Db25maWcu
aW4gfCAxICsKPiAgcGFja2FnZS93cGV3ZWJraXQvQ29uZmlnLmluIHwgMSArCj4gIDIgZmlsZXMg
Y2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2Uvd2Via2l0
Z3RrL0NvbmZpZy5pbiBiL3BhY2thZ2Uvd2Via2l0Z3RrL0NvbmZpZy5pbgo+IGluZGV4IDA1Mjgw
MGM4Y2YuLjI1NzUxMDgzNjMgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS93ZWJraXRndGsvQ29uZmln
LmluCj4gKysrIGIvcGFja2FnZS93ZWJraXRndGsvQ29uZmlnLmluCj4gQEAgLTk1LDYgKzk1LDcg
QEAgY29uZmlnIEJSMl9QQUNLQUdFX1dFQktJVEdUS19NVUxUSU1FRElBCj4gIAlib29sICJtdWx0
aW1lZGlhIHN1cHBvcnQiCj4gIAlzZWxlY3QgQlIyX1BBQ0tBR0VfR1NUUkVBTUVSMQo+ICAJc2Vs
ZWN0IEJSMl9QQUNLQUdFX0dTVDFfUExVR0lOU19CQUQKPiArCXNlbGVjdCBCUjJfUEFDS0FHRV9H
U1QxX1BMVUdJTlNfQkFEX1BMVUdJTl9ERUJVR1VUSUxTCj4gIAlzZWxlY3QgQlIyX1BBQ0tBR0Vf
R1NUMV9QTFVHSU5TX0JBRF9QTFVHSU5fTVBFR1RTREVNVVgKPiAgCXNlbGVjdCBCUjJfUEFDS0FH
RV9HU1QxX1BMVUdJTlNfQkFTRQo+ICAJc2VsZWN0IEJSMl9QQUNLQUdFX0dTVDFfUExVR0lOU19C
QVNFX1BMVUdJTl9BTFNBCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2Uvd3Bld2Via2l0L0NvbmZpZy5p
biBiL3BhY2thZ2Uvd3Bld2Via2l0L0NvbmZpZy5pbgo+IGluZGV4IDhlODBjNzMzMDIuLmY1MGUw
ZGEyMWMgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS93cGV3ZWJraXQvQ29uZmlnLmluCj4gKysrIGIv
cGFja2FnZS93cGV3ZWJraXQvQ29uZmlnLmluCj4gQEAgLTg4LDYgKzg4LDcgQEAgY29uZmlnIEJS
Ml9QQUNLQUdFX1dQRVdFQktJVF9NVUxUSU1FRElBCj4gIAlib29sICJtdWx0aW1lZGlhIHN1cHBv
cnQiCj4gIAlzZWxlY3QgQlIyX1BBQ0tBR0VfR1NUUkVBTUVSMQo+ICAJc2VsZWN0IEJSMl9QQUNL
QUdFX0dTVDFfUExVR0lOU19CQUQKPiArCXNlbGVjdCBCUjJfUEFDS0FHRV9HU1QxX1BMVUdJTlNf
QkFEX1BMVUdJTl9ERUJVR1VUSUxTCj4gIAlzZWxlY3QgQlIyX1BBQ0tBR0VfR1NUMV9QTFVHSU5T
X0JBRF9QTFVHSU5fTVBFR1RTREVNVVgKPiAgCXNlbGVjdCBCUjJfUEFDS0FHRV9HU1QxX1BMVUdJ
TlNfQkFTRQo+ICAJc2VsZWN0IEJSMl9QQUNLQUdFX0dTVDFfUExVR0lOU19CQVNFX1BMVUdJTl9B
TFNBCj4gLS0gCj4gMi4zNC4xCj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gYnVpbGRyb290QGJ1aWxk
cm9vdC5vcmcKPiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9i
dWlsZHJvb3QKPiAKCkNoZWVycywK4oCUQWRyacOhbgo=

--DICMECd4pWSvH+9T
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRao7wzT9fjNp58d7KRxVnb5MkSOwUCYrTYLAAKCRCRxVnb5MkS
O7FRAJ4vSNPi0V35KnYHvqSQmn+NUKggBQCeNLkmCS7LiyDt9dCe5UFpQpnZNrc=
=RijH
-----END PGP SIGNATURE-----

--DICMECd4pWSvH+9T--

--===============3664668996848590761==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3664668996848590761==--
