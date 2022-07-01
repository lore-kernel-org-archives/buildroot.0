Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E99FDC433EF
	for <buildroot@archiver.kernel.org>; Fri,  1 Jul 2022 11:33:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6694940B59;
	Fri,  1 Jul 2022 11:33:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6694940B59
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m9epsVqAUOkw; Fri,  1 Jul 2022 11:33:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6942E40AE4;
	Fri,  1 Jul 2022 11:33:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6942E40AE4
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 60CB11BF5DD
 for <buildroot@lists.busybox.net>; Fri,  1 Jul 2022 11:33:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3CAF581B04
 for <buildroot@lists.busybox.net>; Fri,  1 Jul 2022 11:33:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3CAF581B04
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TkEy8jOWrNXb for <buildroot@lists.busybox.net>;
 Fri,  1 Jul 2022 11:33:28 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4747081AAC
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4747081AAC
 for <buildroot@buildroot.org>; Fri,  1 Jul 2022 11:33:28 +0000 (UTC)
Received: from 135.224.60.213.dynamic.reverse-mundo-r.com ([213.60.224.135]
 helo=momiji) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA512__AES_256_GCM:256) (Exim)
 id 1o7Etp-00E6KA-QC; Fri, 01 Jul 2022 13:33:25 +0200
Received: from localhost (momiji [local])
 by momiji (OpenSMTPD) with ESMTPA id 4cd74357;
 Fri, 1 Jul 2022 11:33:22 +0000 (UTC)
Date: Fri, 1 Jul 2022 13:33:22 +0200
Message-ID: <20220701133322.GD636837@momiji>
From: Adrian Perez de Castro <aperez@igalia.com>
To: James Hilliard <james.hilliard1@gmail.com>
In-Reply-To: <20220627072336.2673298-1-james.hilliard1@gmail.com>
References: <20220627072336.2673298-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Type:MIME-Version:References:In-Reply-To:Subject:Cc:To:
 From:Message-ID:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=lpL8B5E12f7edD3Nz4jscNd8avSfU/Da88GQrsRb+v4=; b=qbcbrwfd3LyMfxnn8dzex3Vjy8
 s0ONld2hRweRRih3PVNsRo1kQ9I1mPhIREGfdPDnKYcokkzXsAyxo5FNosCyOMxy2uzI7P6Clgt2r
 nesWf2ifcOnMMtrMVtpvH58KF34tGcQUrRcXhl0BfXBqzJ4MP8foneBXgXvcCSJYiyawi8p5FswmJ
 ca0/6g5QBEkogzKi74s4deDsI3Z5RvXYdvk65SiOmcrr+p/yU0MoF2zpnJGeHMQr+L8cjqtmWuQv1
 VPLToVCdZKMvkPnNjzhDXesrY1Gjup6BfiARBPKv+3uy28xOLyZnHKhC+a2hlQl/Cp5A0eQUiVSKA
 h2yKUCnA==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com
 header.a=rsa-sha256 header.s=20170329 header.b=qbcbrwfd
Subject: Re: [Buildroot] [PATCH 1/1] package/{webkitgtk,
 wpewebkit}: select audiofx for multimedia
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
Content-Type: multipart/mixed; boundary="===============0176770470532836800=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============0176770470532836800==
Content-Type: multipart/signed; boundary="e6g8OYumhTWnqhg3"; micalg="pgp-sha1"; protocol="application/pgp-signature"


--e6g8OYumhTWnqhg3
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: base64

T24gTW9uLCAyNyBKdW4gMjAyMiAwMToyMzozNiAtMDYwMCBKYW1lcyBIaWxsaWFyZCA8amFtZXMu
aGlsbGlhcmQxQGdtYWlsLmNvbT4gd3JvdGU6Cj4gV2hlbiB1c2luZyB3ZWJraXQgd2l0aCBtdWx0
aW1lZGlhIHN1cHBvcnQgdGhlIHNjYWxldGVtcG8gZWxlbWVudCBtYXkKPiBiZSBuZWVkZWQsIHNl
bGVjdCB0aGUgYXVkaW9meCBwbHVnaW4gd2hpY2ggcHJvdmlkZXMgc2NhbGV0ZW1wby4KPiAKPiBG
aXhlcyBydW50aW1lIHdhcm5pbmc6Cj4gY3JlYXRlR1NUUGxheUJpbjogRmFpbGVkIHRvIGNyZWF0
ZSBzY2FsZXRlbXBvCj4gCj4gU2VlOgo+IGh0dHBzOi8vZ2l0aHViLmNvbS9XZWJLaXQvV2ViS2l0
L2Jsb2IvNzJiNTlhZDUwZTA3OTAzNzA3MzcyMmJiZGY0NjljMDk1MmUzOTlmYS9Tb3VyY2UvV2Vi
Q29yZS9wbGF0Zm9ybS9ncmFwaGljcy9nc3RyZWFtZXIvTWVkaWFQbGF5ZXJQcml2YXRlR1N0cmVh
bWVyLmNwcCNMMjgxMwo+IAo+IFNpZ25lZC1vZmYtYnk6IEphbWVzIEhpbGxpYXJkIDxqYW1lcy5o
aWxsaWFyZDFAZ21haWwuY29tPgoKQWNrZWQtYnk6IEFkcmlhbiBQZXJleiBkZSBDYXN0cm8gPGFw
ZXJlekBpZ2FsaWEuY29tPgoKPiAtLS0KPiAgcGFja2FnZS93ZWJraXRndGsvQ29uZmlnLmluIHwg
MSArCj4gIHBhY2thZ2Uvd3Bld2Via2l0L0NvbmZpZy5pbiB8IDEgKwo+ICAyIGZpbGVzIGNoYW5n
ZWQsIDIgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3dlYmtpdGd0ay9D
b25maWcuaW4gYi9wYWNrYWdlL3dlYmtpdGd0ay9Db25maWcuaW4KPiBpbmRleCAyNTc1MTA4MzYz
Li5kMGM3M2YzZjI5IDEwMDY0NAo+IC0tLSBhL3BhY2thZ2Uvd2Via2l0Z3RrL0NvbmZpZy5pbgo+
ICsrKyBiL3BhY2thZ2Uvd2Via2l0Z3RrL0NvbmZpZy5pbgo+IEBAIC0xMDcsNiArMTA3LDcgQEAg
Y29uZmlnIEJSMl9QQUNLQUdFX1dFQktJVEdUS19NVUxUSU1FRElBCj4gIAlzZWxlY3QgQlIyX1BB
Q0tBR0VfR1NUMV9QTFVHSU5TX0JBU0VfUExVR0lOX1ZJREVPU0NBTEUKPiAgCXNlbGVjdCBCUjJf
UEFDS0FHRV9HU1QxX1BMVUdJTlNfQkFTRV9QTFVHSU5fVk9MVU1FCj4gIAlzZWxlY3QgQlIyX1BB
Q0tBR0VfR1NUMV9QTFVHSU5TX0dPT0QKPiArCXNlbGVjdCBCUjJfUEFDS0FHRV9HU1QxX1BMVUdJ
TlNfR09PRF9QTFVHSU5fQVVESU9GWAo+ICAJc2VsZWN0IEJSMl9QQUNLQUdFX0dTVDFfUExVR0lO
U19HT09EX1BMVUdJTl9BVVRPREVURUNUCj4gIAlzZWxlY3QgQlIyX1BBQ0tBR0VfR1NUMV9QTFVH
SU5TX0dPT0RfUExVR0lOX0lTT01QNAo+ICAJc2VsZWN0IEJSMl9QQUNLQUdFX0dTVDFfUExVR0lO
U19HT09EX1BMVUdJTl9NQVRST1NLQQo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3dwZXdlYmtpdC9D
b25maWcuaW4gYi9wYWNrYWdlL3dwZXdlYmtpdC9Db25maWcuaW4KPiBpbmRleCBmNTBlMGRhMjFj
Li5hMjA1ZTYyNzZmIDEwMDY0NAo+IC0tLSBhL3BhY2thZ2Uvd3Bld2Via2l0L0NvbmZpZy5pbgo+
ICsrKyBiL3BhY2thZ2Uvd3Bld2Via2l0L0NvbmZpZy5pbgo+IEBAIC0xMDAsNiArMTAwLDcgQEAg
Y29uZmlnIEJSMl9QQUNLQUdFX1dQRVdFQktJVF9NVUxUSU1FRElBCj4gIAlzZWxlY3QgQlIyX1BB
Q0tBR0VfR1NUMV9QTFVHSU5TX0JBU0VfUExVR0lOX1ZJREVPU0NBTEUKPiAgCXNlbGVjdCBCUjJf
UEFDS0FHRV9HU1QxX1BMVUdJTlNfQkFTRV9QTFVHSU5fVk9MVU1FCj4gIAlzZWxlY3QgQlIyX1BB
Q0tBR0VfR1NUMV9QTFVHSU5TX0dPT0QKPiArCXNlbGVjdCBCUjJfUEFDS0FHRV9HU1QxX1BMVUdJ
TlNfR09PRF9QTFVHSU5fQVVESU9GWAo+ICAJc2VsZWN0IEJSMl9QQUNLQUdFX0dTVDFfUExVR0lO
U19HT09EX1BMVUdJTl9BVVRPREVURUNUCj4gIAlzZWxlY3QgQlIyX1BBQ0tBR0VfR1NUMV9QTFVH
SU5TX0dPT0RfUExVR0lOX0lTT01QNAo+ICAJc2VsZWN0IEJSMl9QQUNLQUdFX0dTVDFfUExVR0lO
U19HT09EX1BMVUdJTl9NQVRST1NLQQo+IC0tIAo+IDIuMzQuMQo+IAo+IF9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gYnVpbGRyb290IG1haWxpbmcgbGlz
dAo+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3Jn
L21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cj4gCgpDaGVlcnMsCuKAlEFkcmnDoW4K

--e6g8OYumhTWnqhg3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRao7wzT9fjNp58d7KRxVnb5MkSOwUCYr7bggAKCRCRxVnb5MkS
O7VcAJ9FZC+w2KIe6YZPFDLztMBVXRGdkgCfVws/3+mWvp3TSt7+FuGOji6/Twc=
=rfPx
-----END PGP SIGNATURE-----

--e6g8OYumhTWnqhg3--

--===============0176770470532836800==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0176770470532836800==--
