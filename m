Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1D5AC7618E
	for <buildroot@archiver.kernel.org>; Mon, 24 Apr 2023 12:48:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9964D40761;
	Mon, 24 Apr 2023 12:48:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9964D40761
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Sj_BtWn82E5G; Mon, 24 Apr 2023 12:48:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5A04F402D9;
	Mon, 24 Apr 2023 12:48:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5A04F402D9
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 278161C2AA3
 for <buildroot@lists.busybox.net>; Mon, 24 Apr 2023 12:48:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EF7F0402D9
 for <buildroot@lists.busybox.net>; Mon, 24 Apr 2023 12:48:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EF7F0402D9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VuXAcD3STVA2 for <buildroot@lists.busybox.net>;
 Mon, 24 Apr 2023 12:48:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7B7234029B
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7B7234029B
 for <buildroot@buildroot.org>; Mon, 24 Apr 2023 12:48:16 +0000 (UTC)
Received: from 91-153-34-68.elisa-laajakaista.fi ([91.153.34.68] helo=kodama)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA512__AES_256_GCM:256) (Exim)
 id 1pqvc6-00AsYX-8v
 for <buildroot@buildroot.org>; Mon, 24 Apr 2023 14:48:14 +0200
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id 533d971c
 for <buildroot@buildroot.org>; Mon, 24 Apr 2023 12:48:13 +0000 (UTC)
Date: Mon, 24 Apr 2023 15:48:09 +0300
Message-ID: <20230424154809.GB49383@igalia.com>
From: Adrian Perez de Castro <aperez@igalia.com>
To: buildroot@buildroot.org
In-Reply-To: <20230424124558.29248-1-aperez@igalia.com>
References: <20230424124558.29248-1-aperez@igalia.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Type:MIME-Version:References:In-Reply-To:Subject:To:
 From:Message-ID:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=fvFaEXQ9AGfxDulaJ/1GyA1RpqszwCwtudAlQExPavA=; b=IjJUKyU6qtCBxEaolEWbGUkQFt
 B/u2d8ABmMbr2ULKP96PVBxxiKqIFSXltJ7jnLwxVpNvIDJW7Mr4CTPPdjVfQpQuF9i6V1Lsr0xN+
 3Ei/qXpA935ZElTozVdB0MMyPc7m8vG9TN85ng7zvefJSCCQpAkLg9SK3tLOscBBYWuQgIq+7xVbL
 goKGRqWqOnf3ZfK53HMt76KHZ+Tao6l1tRcL9QqAua/f3m3o26q/hA+95NDC8uXUxin0FDKmE9WUP
 y2DCv8pEdfb5r7pUPpOZ5rSVvUlZzdqSw5SzC1K3T8CVWAb6ln859PGCTEMaNatTT7XFwNQHrUrOH
 R3x45WkQ==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com
 header.a=rsa-sha256 header.s=20170329 header.b=IjJUKyU6
Subject: Re: [Buildroot] [PATCH] package/webkitgtk: security bump to version
 2.38.6
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
Content-Type: multipart/mixed; boundary="===============8349173969304786728=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============8349173969304786728==
Content-Type: multipart/signed; boundary="EMuj8jWTE0X2HhNw"; micalg="pgp-ripemd160"; protocol="application/pgp-signature"


--EMuj8jWTE0X2HhNw
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: base64

T24gTW9uLCAyNCBBcHIgMjAyMyAxNTo0NTo1OCArMDMwMCBBZHJpYW4gUGVyZXogZGUgQ2FzdHJv
IDxhcGVyZXpAaWdhbGlhLmNvbT4gd3JvdGU6Cj4gQnVnZml4IHJlbGVhc2Ugd2l0aCBtYW55IHNl
Y3VyaXR5IGZpeGVzLCBpbmNsdWRpbmcgKGJ1dCBub3QgbGltaXRlZCB0bykKPiBwYXRjaGVzIGZv
ciBDVkUtMjAyMy0yNTM1OCwgQ1ZFLTIwMjItMDEwOCwgQ1ZFLTIwMjItMzI4ODUsCj4gQ1ZFLTIw
MjMtMjc5MzIsIENWRS0yMDIzLTI3OTU0LCBhbmQgQ1ZFLTIwMjMtMjgyMDUuCj4gCj4gUmVsZWFz
ZSBub3RlczoKPiAKPiAgIGh0dHBzOi8vd3Bld2Via2l0Lm9yZy9yZWxlYXNlL3dwZXdlYmtpdC0y
LjM4LjYuaHRtbAo+IAo+IEFjY29tcGFueWluZyBzZWN1cml0eSBhZHZpc29yeToKPiAKPiAgIGh0
dHBzOi8vd3Bld2Via2l0Lm9yZy9zZWN1cml0eS9XU0EtMjAyMy0wMDAzLmh0bWwKClRoZSBsaW5r
cyBhcmUgd3JvbmcsIEkgd2lsbCByZS1zdWJtaXQgd2l0aCB0aGUgY29ycmVjdCBvbmVzIHBvaW50
aW5nIHRvCndlYmtpdGd0ay5vcmcgTzotKQogCj4gU2lnbmVkLW9mZi1ieTogQWRyaWFuIFBlcmV6
IGRlIENhc3RybyA8YXBlcmV6QGlnYWxpYS5jb20+Cj4gLS0tCj4gIHBhY2thZ2Uvd2Via2l0Z3Rr
L3dlYmtpdGd0ay5oYXNoIHwgOCArKysrLS0tLQo+ICBwYWNrYWdlL3dlYmtpdGd0ay93ZWJraXRn
dGsubWsgICB8IDIgKy0KPiAgMiBmaWxlcyBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDUgZGVs
ZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2Uvd2Via2l0Z3RrL3dlYmtpdGd0ay5o
YXNoIGIvcGFja2FnZS93ZWJraXRndGsvd2Via2l0Z3RrLmhhc2gKPiBpbmRleCBjNzcxMjk3YjVh
Li4zYmM1MjFlNDQ1IDEwMDY0NAo+IC0tLSBhL3BhY2thZ2Uvd2Via2l0Z3RrL3dlYmtpdGd0ay5o
YXNoCj4gKysrIGIvcGFja2FnZS93ZWJraXRndGsvd2Via2l0Z3RrLmhhc2gKPiBAQCAtMSw3ICsx
LDcgQEAKPiAtIyBGcm9tIGh0dHBzOi8vd2Via2l0Z3RrLm9yZy9yZWxlYXNlcy93ZWJraXRndGst
Mi4zOC41LnRhci54ei5zdW1zCj4gLW1kNSAgZGUwNWQzMTRhM2VjYjVmYjM4MzVlNGQ4NGY4ZjQ2
NmQgIHdlYmtpdGd0ay0yLjM4LjUudGFyLnh6Cj4gLXNoYTEgIDE3NzQzOTBjNjI4YmIzYTUyNGQ0
ZWQ3NmYxMWRlNGE4NzgwNzhkYjYgIHdlYmtpdGd0ay0yLjM4LjUudGFyLnh6Cj4gLXNoYTI1NiAg
NDBjMjBjNDMwMjIyNzRkZjU4OTNmMjJiMTA1NGZhODk0YzNlZWEwNTczODliYjA4YWVlMDhjNWIw
YmIwYzFhNyAgd2Via2l0Z3RrLTIuMzguNS50YXIueHoKPiArIyBGcm9tIGh0dHBzOi8vd2Via2l0
Z3RrLm9yZy9yZWxlYXNlcy93ZWJraXRndGstMi4zOC42LnRhci54ei5zdW1zCj4gK21kNSAgYTUw
MjkwZmRjODA4NDJiMWFlOGJlMWUxMTQ3YjU2NzkgIHdlYmtpdGd0ay0yLjM4LjYudGFyLnh6Cj4g
K3NoYTEgIDRkZmIzZDk2ZjYyMWZjNjMzZmYzNDdlMDgzZTQyOTg5MzU1MWZiMjYgIHdlYmtpdGd0
ay0yLjM4LjYudGFyLnh6Cj4gK3NoYTI1NiAgMWM2MTRjOTU4OTM4OWRiMWE3OWVhOWJhNDI5M2Ji
ZThhYzNhYjBhMjIzNGNhYzcwMDkzNWZhZTA3MjRhZDQ4YiAgd2Via2l0Z3RrLTIuMzguNi50YXIu
eHoKPiAgCj4gICMgSGFzaGVzIGZvciBsaWNlbnNlIGZpbGVzOgo+ICBzaGEyNTYgIDBiNWQzYTdj
YzMyNTk0MjU2NzM3M2IwZWNkNzU3ZDA3YzEzMmUwZWJkN2M5N2JmYzYzZjdlMWE3NjA5NGVkYjQg
IFNvdXJjZS9XZWJDb3JlL0xJQ0VOU0UtQVBQTEUKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS93ZWJr
aXRndGsvd2Via2l0Z3RrLm1rIGIvcGFja2FnZS93ZWJraXRndGsvd2Via2l0Z3RrLm1rCj4gaW5k
ZXggMDlkYmU5NmE2Zi4uMjkyM2IxZmU1MiAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL3dlYmtpdGd0
ay93ZWJraXRndGsubWsKPiArKysgYi9wYWNrYWdlL3dlYmtpdGd0ay93ZWJraXRndGsubWsKPiBA
QCAtNCw3ICs0LDcgQEAKPiAgIwo+ICAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwo+ICAKPiAtV0VC
S0lUR1RLX1ZFUlNJT04gPSAyLjM4LjUKPiArV0VCS0lUR1RLX1ZFUlNJT04gPSAyLjM4LjYKPiAg
V0VCS0lUR1RLX1NJVEUgPSBodHRwczovL3d3dy53ZWJraXRndGsub3JnL3JlbGVhc2VzCj4gIFdF
QktJVEdUS19TT1VSQ0UgPSB3ZWJraXRndGstJChXRUJLSVRHVEtfVkVSU0lPTikudGFyLnh6Cj4g
IFdFQktJVEdUS19JTlNUQUxMX1NUQUdJTkcgPSBZRVMKPiAtLSAKPiAyLjQwLjAKPiAKPiBfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGJ1aWxkcm9vdCBt
YWlsaW5nIGxpc3QKPiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+IGh0dHBzOi8vbGlzdHMuYnVp
bGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo+IAoKQ2hlZXJzLArigJRBZHJp
w6FuCg==

--EMuj8jWTE0X2HhNw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABEDAB0WIQRao7wzT9fjNp58d7KRxVnb5MkSOwUCZEZ6iQAKCRCRxVnb5MkS
O8pHAJwI81/y654W0oq/RO95/3KUmKhOhwCfeECvqfzObZjSpkwEzCGq3AaF4rw=
=8kst
-----END PGP SIGNATURE-----

--EMuj8jWTE0X2HhNw--

--===============8349173969304786728==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8349173969304786728==--
