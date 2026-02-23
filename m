Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49DA5EA4FBB
	for <buildroot@archiver.kernel.org>; Mon, 23 Feb 2026 13:13:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 44839607D3;
	Mon, 23 Feb 2026 13:13:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iHHnZjR5Uhjm; Mon, 23 Feb 2026 13:13:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 92182607C7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771852386;
	bh=RK+7fogJIT+7VByUozkT1klCDp6pu094zd0voWYPmJE=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QyLqS7GP5pGkjMEySX7D9fvz9a8hPajhIk2QwSx0qFWhnCDQDhrqCiiSv7l5jV1+v
	 5ru7FRpbVd5f0maXk2r6T6OGzO9X0c4Yb46pbnE8ehgzZgxtiCE6OSuPc+rxZWfgFu
	 sV3jKT8B8l+K0cM2i4zVVqEkO88UMmIlS+tbLo+Gn19KurZwWxT7+n2KLFsGwPrmpH
	 Kk4zlZyJ65/GBi+kaH0AEO9x3j2mXhykBJQNfF/jUPKgZRBoaNWNOBIUwvvRz5ATFP
	 NPAy7ucw9t5mSb9fHd7gzh5MVeF7NMZVNCdION+YwJ7/wtYkVl0dQP3HtDwpa5Dg4j
	 +/XR2BJ5YOChw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 92182607C7;
	Mon, 23 Feb 2026 13:13:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 41151237
 for <buildroot@buildroot.org>; Mon, 23 Feb 2026 13:13:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 26E8640A7B
 for <buildroot@buildroot.org>; Mon, 23 Feb 2026 13:13:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id katIUlhmEkYp for <buildroot@buildroot.org>;
 Mon, 23 Feb 2026 13:13:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=213.97.179.56;
 helo=fanzine2.igalia.com; envelope-from=aperez@igalia.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D68A640725
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D68A640725
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D68A640725
 for <buildroot@buildroot.org>; Mon, 23 Feb 2026 13:13:03 +0000 (UTC)
Received: from 91-154-227-245.elisa-laajakaista.fi ([91.154.227.245]
 helo=kodama) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1vuVkD-004EwX-NU; Mon, 23 Feb 2026 14:13:01 +0100
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id d750ff65;
 Mon, 23 Feb 2026 13:13:00 +0000 (UTC)
Date: Mon, 23 Feb 2026 15:13:00 +0200
Message-ID: <20260223151300.GG2359969@igalia.com>
From: Adrian Perez de Castro <aperez@igalia.com>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Bernd Kuhls <bernd@kuhls.net>,
 Romain Naour <romain.naour@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>
In-Reply-To: <20260218063123.546067-2-james.hilliard1@gmail.com>
References: <20260218063123.546067-1-james.hilliard1@gmail.com>
 <20260218063123.546067-2-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Type:MIME-Version:References:In-Reply-To:Subject:Cc:To:
 From:Message-ID:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=EheR1fdCf4HxIAtqPmUBhyMVktcZIiotgGh0RxtNNC8=; b=aiZ6ekKmXCkAHZBosdbCAaqqOm
 FoFYiIWIlJYLu28aX1tn7Kq65YSfYz4VaysUwSUdtmrk2GpLGedM3v8GqFvyUepLkK1eAPRz2T2Ph
 DeJPguGVGooDYq9yoH/1mHAc29GV/1AaQo/sL3OETg+7TYFsjw8Dp2C2sk+CAFXmFDQXRb6kX4h8k
 JKr7QLpH+XJQ8NkeMQLPzj6gcPIDQrNZzAXCOBYS6Qkc8hs+6jsE3CPoBTUFLDrBpReWPbFedaRdB
 26Z++6OdmSN2I6IYKZeKc0W8NMt3j13Tgy2rgkoXFSqmT5+wv7BHtVcdY88XIldiGfSvInm4Lz3uA
 4FHxk4Mw==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=igalia.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256
 header.s=20170329 header.b=aiZ6ekKm
Subject: Re: [Buildroot] [PATCH 2/2] package/wpebackend-fdo: fix
 EGL_NOT_INITIALIZED crash
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
Content-Type: multipart/mixed; boundary="===============1463715291527065603=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============1463715291527065603==
Content-Type: multipart/signed; boundary="N+GPIgIuQHVtVijM"; micalg="pgp-sha256"; protocol="application/pgp-signature"


--N+GPIgIuQHVtVijM
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: base64

T24gVHVlLCAxNyBGZWIgMjAyNiAyMzozMToyMyAtMDcwMCBKYW1lcyBIaWxsaWFyZCA8amFtZXMu
aGlsbGlhcmQxQGdtYWlsLmNvbT4gd3JvdGU6Cj4gQ29tbWl0IDRjZDRiMmUxZTZlODgxNjU1NWRi
Mzg3NzFkMThkYWFkNDZkZjNhNmMgdXBkYXRlZCBtZXNhM2QKPiBwYXN0IHZlcnNpb24gMjUuMi4w
IHdoaWNoIGRlcHJlY2F0ZWQgdGhlIGxlZ2FjeSB3YXlsYW5kCj4gRUdMX1dMX2JpbmRfd2F5bGFu
ZF9kaXNwbGF5IGludGVyZmFjZSwgYXMgd3BlYmFja2VuZC1mZG8KPiBjdXJyZW50bHkgc3RpbGwg
cmVsaWVzIG9uIHRoaXMgZnVuY3Rpb25hbGl0eSBlbnN1cmUgdGhhdCB3ZQo+IGVuYWJsZSBFR0xf
V0xfYmluZF93YXlsYW5kX2Rpc3BsYXkgaW4gbWVzYTNkLgo+IAo+IEZpeGVzOgo+ICAtIGh0dHBz
Oi8vbG9yZS5rZXJuZWwub3JnL2FsbC9DQUR2VGo0cFlmMHV5bXJrWlV1V2dhaFdLPXBtNUNnVEpM
NVUrZ3did0tFeEsxc281akFAbWFpbC5nbWFpbC5jb20vCj4gCj4gU2lnbmVkLW9mZi1ieTogSmFt
ZXMgSGlsbGlhcmQgPGphbWVzLmhpbGxpYXJkMUBnbWFpbC5jb20+CgpBY2tlZC1ieTogQWRyaWFu
IFBlcmV6IGRlIENhc3RybyA8YXBlcmV6QGlnYWxpYS5jb20+Cgo+IC0tLQo+ICBwYWNrYWdlL3dw
ZWJhY2tlbmQtZmRvL0NvbmZpZy5pbiB8IDEgKwo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKykKPiAKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS93cGViYWNrZW5kLWZkby9Db25maWcuaW4g
Yi9wYWNrYWdlL3dwZWJhY2tlbmQtZmRvL0NvbmZpZy5pbgo+IGluZGV4IDliNGRkMjg3NDEuLmJk
MGFiNTQyMWUgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS93cGViYWNrZW5kLWZkby9Db25maWcuaW4K
PiArKysgYi9wYWNrYWdlL3dwZWJhY2tlbmQtZmRvL0NvbmZpZy5pbgo+IEBAIC0xNCw2ICsxNCw3
IEBAIGNvbmZpZyBCUjJfUEFDS0FHRV9XUEVCQUNLRU5EX0ZETwo+ICAJc2VsZWN0IEJSMl9QQUNL
QUdFX0xJQkdMSUIyCj4gIAlzZWxlY3QgQlIyX1BBQ0tBR0VfTElCV1BFCj4gIAlzZWxlY3QgQlIy
X1BBQ0tBR0VfV0FZTEFORAo+ICsJc2VsZWN0IEJSMl9QQUNLQUdFX01FU0EzRF9MRUdBQ1lfQklO
RF9XQVlMQU5EX0RJU1BMQVkgaWYgQlIyX1BBQ0tBR0VfTUVTQTNECj4gIAloZWxwCj4gIAkgIFdQ
RUJhY2tlbmQgaW50ZXJmYWNlIHVzaW5nIGZyZWVkZXNrdG9wLm9yZyBBUEkuCj4gIAo+IC0tIAo+
IDIuNDMuMAo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4g
aHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cj4g
CgpDaGVlcnMsCuKAlEFkcmnDoW4K

--N+GPIgIuQHVtVijM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABEIAB0WIQRao7wzT9fjNp58d7KRxVnb5MkSOwUCaZxSXAAKCRCRxVnb5MkS
O3UnAJwIeNqZokFKBRwgkKhB4JYGBEn6awCdFCuj6yujoHLeQYbo/CjGoAEm8pY=
=DYMw
-----END PGP SIGNATURE-----

--N+GPIgIuQHVtVijM--

--===============1463715291527065603==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1463715291527065603==--
