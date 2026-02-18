Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84688E9A04D
	for <buildroot@archiver.kernel.org>; Wed, 18 Feb 2026 23:13:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1A080817EB;
	Wed, 18 Feb 2026 23:13:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id otWwxSxVZViS; Wed, 18 Feb 2026 23:13:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 93CBB817BA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771456386;
	bh=gdI8wthlqINlfSTehIABHXiCfLNeans0N0c4jbzrnws=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Z/bHBwcFeT24E4sjVlumZHCmyuHGjxD7bERZ9QtuskrIjDys3oZZEaYI+/+FoRxyp
	 1qPE0laT130DUD5z+07gkfLF0N32iKx9bk+NQF7j31Zyb3XlTV4HHVowp8AtV6obDn
	 +i0PAf7yO1Lolv4tfoEfgreax1ldyFSVQjJZRQMADZDMm8FxPB+YemN7P4rGtwgQyY
	 9Zb0l7wGLxalX2fTIHRstnDXmfM0LH1W08UkTcKIRYx8s03edxpJgNG+rwTOcaokHo
	 BDlZoLuXQpieOwq++rsfXwTxk5H7UVVApSH8mCRlkzAtbUCag4sElnE+ALEMGmrGsN
	 h9Z1UoWtBXcZQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 93CBB817BA;
	Wed, 18 Feb 2026 23:13:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id D182D206
 for <buildroot@buildroot.org>; Wed, 18 Feb 2026 23:13:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C34C84035B
 for <buildroot@buildroot.org>; Wed, 18 Feb 2026 23:13:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UtTHCeqOuE53 for <buildroot@buildroot.org>;
 Wed, 18 Feb 2026 23:13:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=213.97.179.56;
 helo=fanzine2.igalia.com; envelope-from=aperez@igalia.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 875AC403A8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 875AC403A8
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 875AC403A8
 for <buildroot@buildroot.org>; Wed, 18 Feb 2026 23:13:04 +0000 (UTC)
Received: from 81-197-150-176.elisa-laajakaista.fi ([81.197.150.176]
 helo=momiji) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1vsqDR-002FIq-Vm; Wed, 18 Feb 2026 23:40:18 +0100
Received: from localhost (momiji [local])
 by momiji (OpenSMTPD) with ESMTPA id 4f821b39;
 Wed, 18 Feb 2026 22:40:10 +0000 (UTC)
Date: Thu, 19 Feb 2026 00:40:05 +0200
Message-ID: <20260219004005.GB212936@igalia.com>
From: Adrian Perez de Castro <aperez@igalia.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Julien Olivain <ju.o@free.fr>
In-Reply-To: <20260218195812.2983207-1-bernd@kuhls.net>
References: <20260218195812.2983207-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Type:MIME-Version:References:In-Reply-To:Subject:Cc:To:
 From:Message-ID:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=yMBvi4E6RHazRNTZ+Kq5B7o4Pus/NL1C75iLZvJ4ovs=; b=LdN4MdH1c6HH4vpGn2FGkqwYY5
 qH10teWq5PTIG9VFBh2GGO0lzi5bvPLLLwxZf2eBSEmifctesUPnfIxqF5z2oV7jEUefUv/zIDdt9
 xnx28YT9qKQlpu9i6zyVSO8szw5lEW2j/SDhCwKexkPFwqfnW7LE8xiAopARtdojJEVH3fSIkt97u
 rZRNUD3c+pXbH4G+ooSFNr7fKeTn9hKLIOmIrk7DDd9+bxKa6C1yWMkHIx2MzzKkpWId38bCQW6iY
 zCYYP1z5ITi9p63m84278cyV1u9rWiP/7cmCirT50jxfe9Ah4xBSEHzofxSZfQXemfAmW2UZ+D6hi
 Fp/rTrsQ==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=igalia.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256
 header.s=20170329 header.b=LdN4MdH1
Subject: Re: [Buildroot] [PATCH 1/2] package/wpewebkit: add dependencies to
 fontconfig & freetype
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
Content-Type: multipart/mixed; boundary="===============9216651035346582330=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============9216651035346582330==
Content-Type: multipart/signed; boundary="xtjyPIKJsilYXRaA"; micalg="pgp-sha256"; protocol="application/pgp-signature"


--xtjyPIKJsilYXRaA
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: base64

T24gV2VkLCAxOCBGZWIgMjAyNiAyMDo1ODoxMSArMDEwMCBCZXJuZCBLdWhscyA8YmVybmRAa3Vo
bHMubmV0PiB3cm90ZToKPiBCdWlsZHJvb3QgY29tbWl0IDI4ODJjZjRhZTY0OWY3ZDVlOWNlZTcy
Zjg0ZTY3MjMyOGY1NTA4NDUgYnVtcGVkIHRoZQo+IHBhY2thZ2UgZnJvbSAyLjQ0LjQgdG8gMi40
OC4zLiBUaGlzIGJ1bXAgaW5jbHVkZXMgdXBzdHJlYW0gY29tbWl0Cj4gaHR0cHM6Ly9naXRodWIu
Y29tL1dlYktpdC9XZWJLaXQvY29tbWl0LzNiNTRlNDVkNjNiODRmOGFiOGQ3MDE3OTE4NGM0NWJl
NzgzODY2MjIKPiB3aGljaCB3YXMgYWRkZWQgdG8gd3Bld2Via2l0IDIuNDUuMToKPiBodHRwczov
L3dwZXdlYmtpdC5vcmcvcmVsZWFzZS93cGV3ZWJraXQtMi40NS4xLmh0bWwKPiAiVXNlIFNraWEg
YnkgZGVmYXVsdCBpbnN0ZWFkIG9mIENhaXJvIGZvciByZW5kZXJpbmcuIgo+IAo+IFRoZSB1cHN0
cmVhbSBjb21taXQgaW5jbHVkZXMgZGVwZW5kZW5jaWVzIHRvIGZvbnRjb25maWcgJiBmcmVldHlw
ZSB3aGljaAo+IHdlcmUgbm90IGFkZGVkIHRvIGJ1aWxkcm9vdCBhbmQgY2F1c2UgYnVpbGQgZXJy
b3JzIHdpdGggdGhpcyBkZWZjb25maWc6Cj4gCj4gQlIyX2FhcmNoNjQ9eQo+IEJSMl9UT09MQ0hB
SU5fRVhURVJOQUw9eQo+IEJSMl9UT09MQ0hBSU5fRVhURVJOQUxfQk9PVExJTj15Cj4gQlIyX1BF
Ul9QQUNLQUdFX0RJUkVDVE9SSUVTPXkKPiBCUjJfUEFDS0FHRV9NRVNBM0Q9eQo+IEJSMl9QQUNL
QUdFX01FU0EzRF9HQUxMSVVNX0RSSVZFUl9TT0ZUUElQRT15Cj4gQlIyX1BBQ0tBR0VfTUVTQTNE
X09QRU5HTF9FR0w9eQo+IEJSMl9QQUNLQUdFX01FU0EzRF9PUEVOR0xfRVM9eQo+IEJSMl9QQUNL
QUdFX1dQRVdFQktJVD15Cj4gQlIyX1BBQ0tBR0VfV1BFV0VCS0lUX1NBTkRCT1g9eQo+IEJSMl9Q
QUNLQUdFX1dQRVdFQktJVF9NVUxUSU1FRElBPXkKPiBCUjJfUEFDS0FHRV9XUEVXRUJLSVRfTUVE
SUFfU1RSRUFNPXkKPiBCUjJfUEFDS0FHRV9XUEVXRUJLSVRfV0VCRFJJVkVSPXkKPiAKPiBSZXBv
cnRlZC1ieTogSnVsaWVuIE9saXZhaW4gPGp1Lm9AZnJlZS5mcj4KPiBbaHR0cHM6Ly9wYXRjaHdv
cmsub3psYWJzLm9yZy9wcm9qZWN0L2J1aWxkcm9vdC9wYXRjaC8yMDI1MTAxNzEzMTAzNS4yMjQ3
MzktMS1hcGVyZXpAaWdhbGlhLmNvbS8jMzU5OTk5OV0KPiBTaWduZWQtb2ZmLWJ5OiBCZXJuZCBL
dWhscyA8YmVybmRAa3VobHMubmV0PgoKQWNrZWQtYnk6IEFkcmlhbiBQZXJleiBkZSBDYXN0cm8g
PGFwZXJlekBpZ2FsaWEuY29tPgoKPiAtLS0KPiAgcGFja2FnZS93cGV3ZWJraXQvQ29uZmlnLmlu
ICAgIHwgMiArKwo+ICBwYWNrYWdlL3dwZXdlYmtpdC93cGV3ZWJraXQubWsgfCAxICsKPiAgMiBm
aWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS93
cGV3ZWJraXQvQ29uZmlnLmluIGIvcGFja2FnZS93cGV3ZWJraXQvQ29uZmlnLmluCj4gaW5kZXgg
NzNiYTRlNmJkZi4uYzg2MDJmMWRlNiAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL3dwZXdlYmtpdC9D
b25maWcuaW4KPiArKysgYi9wYWNrYWdlL3dwZXdlYmtpdC9Db25maWcuaW4KPiBAQCAtNDQsNiAr
NDQsOCBAQCBjb25maWcgQlIyX1BBQ0tBR0VfV1BFV0VCS0lUCj4gIAlzZWxlY3QgQlIyX0hPU1Rf
Q01BS0VfQVRfTEVBU1RfM18yMAo+ICAJc2VsZWN0IEJSMl9QQUNLQUdFX0NBSVJPIGlmIEJSMl9F
TkRJQU4gPSAiQklHIgo+ICAJc2VsZWN0IEJSMl9QQUNLQUdFX0NBSVJPX1BORyBpZiBCUjJfRU5E
SUFOID0gIkJJRyIKPiArCXNlbGVjdCBCUjJfUEFDS0FHRV9GT05UQ09ORklHIGlmIEJSMl9FTkRJ
QU4gPSAiTElUVExFIgo+ICsJc2VsZWN0IEJSMl9QQUNLQUdFX0ZSRUVUWVBFIGlmIEJSMl9FTkRJ
QU4gPSAiTElUVExFIgo+ICAJc2VsZWN0IEJSMl9QQUNLQUdFX0hBUkZCVVpaCj4gIAlzZWxlY3Qg
QlIyX1BBQ0tBR0VfSUNVCj4gIAlzZWxlY3QgQlIyX1BBQ0tBR0VfSlBFRwo+IGRpZmYgLS1naXQg
YS9wYWNrYWdlL3dwZXdlYmtpdC93cGV3ZWJraXQubWsgYi9wYWNrYWdlL3dwZXdlYmtpdC93cGV3
ZWJraXQubWsKPiBpbmRleCAxNWEyZWE5M2U4Li4zMWFiYTJhMGI5IDEwMDY0NAo+IC0tLSBhL3Bh
Y2thZ2Uvd3Bld2Via2l0L3dwZXdlYmtpdC5tawo+ICsrKyBiL3BhY2thZ2Uvd3Bld2Via2l0L3dw
ZXdlYmtpdC5tawo+IEBAIC00MCw2ICs0MCw3IEBAIGlmZXEgKCQoQlIyX0VORElBTiksIkJJRyIp
Cj4gIFdQRVdFQktJVF9ERVBFTkRFTkNJRVMgKz0gY2Fpcm8KPiAgV1BFV0VCS0lUX0NPTkZfT1BU
UyArPSAtRFVTRV9TS0lBPU9GRgo+ICBlbHNlCj4gK1dQRVdFQktJVF9ERVBFTkRFTkNJRVMgKz0g
Zm9udGNvbmZpZyBmcmVldHlwZQo+ICBXUEVXRUJLSVRfQ09ORl9PUFRTICs9IC1EVVNFX1NLSUE9
T04KPiAgZW5kaWYKPiAgCj4gLS0gCj4gMi40Ny4zCj4gCj4gX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gYnVp
bGRyb290QGJ1aWxkcm9vdC5vcmcKPiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1h
bi9saXN0aW5mby9idWlsZHJvb3QKPiAKCkNoZWVycywK4oCUQWRyacOhbgo=

--xtjyPIKJsilYXRaA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABEIAB0WIQRao7wzT9fjNp58d7KRxVnb5MkSOwUCaZY/xQAKCRCRxVnb5MkS
O5glAJ4is3pMEqpsfeErsnDyfzER5uGthgCfRMa/txtiAbjnwIXUrSaqESeT+CU=
=p33X
-----END PGP SIGNATURE-----

--xtjyPIKJsilYXRaA--

--===============9216651035346582330==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============9216651035346582330==--
