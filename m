Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C95FCA0EF5
	for <buildroot@archiver.kernel.org>; Tue, 19 Aug 2025 08:18:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2EDCA40742;
	Tue, 19 Aug 2025 08:18:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ryVJI04TS-0X; Tue, 19 Aug 2025 08:18:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 43336408C4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 43336408C4;
	Tue, 19 Aug 2025 08:18:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id A042DE2
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 08:18:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 92367608E9
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 08:18:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mBgXqe89CF5B for <buildroot@buildroot.org>;
 Tue, 19 Aug 2025 08:18:32 +0000 (UTC)
X-Greylist: delayed 2303 seconds by postgrey-1.37 at util1.osuosl.org;
 Tue, 19 Aug 2025 08:18:29 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 34E29608EA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 34E29608EA
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=213.97.179.56;
 helo=fanzine2.igalia.com; envelope-from=aperez@igalia.com; receiver=<UNKNOWN> 
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 34E29608EA
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 08:18:28 +0000 (UTC)
Received: from 91-153-34-249.elisa-laajakaista.fi ([91.153.34.249] helo=kodama)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uoGws-00GBWW-7c; Tue, 19 Aug 2025 09:40:02 +0200
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id 17dd9322;
 Tue, 19 Aug 2025 07:40:01 +0000 (UTC)
Date: Tue, 19 Aug 2025 10:39:57 +0300
Message-ID: <20250819103957.GC1455797@igalia.com>
From: Adrian Perez de Castro <aperez@igalia.com>
To: Henri Roosen <henri.roosen@ginzinger.com>
Cc: buildroot@buildroot.org, Henri Roosen <henri.roosen@ginzinger.com>
In-Reply-To: <20250818135142.1533405-1-henri.roosen@ginzinger.com>
References: <20250818135142.1533405-1-henri.roosen@ginzinger.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Type:MIME-Version:References:In-Reply-To:Subject:Cc:To:
 From:Message-ID:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8z3xMsaPRqDiGbvox8/qvBWO+NgMfQNG2TY69qt6lz4=; b=rNSJ/Pgl7gMPOx8gv+1oVqXk5W
 nh9V4hpkCJnVnlnrq5s2vXC8Gshf0ULC9wRcG0q0r3JBkTxDMDdOsJsd1Tf6Ta68MLD/oaa28Kxc/
 lDbgkEwcPWCZVADURjDwxhgtTdfNZFk3/hdjmDk0TYF0Ju/ha/OlRG0SPWIXWPckQZl7rLvZKd3uX
 n6RYUtXakP9Lto0yVp9ZAtZZl1ctUTxiPYLqWa4c7jqWR75NxRm8m9NzhhHzKTHIprFVV0Hf4UelZ
 mHZ8zNbcPXZ4BKa4tiSVWs06P1YENRkSv1tHa8cFjOJrDBonTVEQuk+woFODfxyvA3+IaNtdX5ffZ
 ygDsID6Q==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=igalia.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256
 header.s=20170329 header.b=rNSJ/Pgl
Subject: Re: [Buildroot] [PATCH 1/1] package/wpewebkit: needs host-cmake >=
 3.20
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
Content-Type: multipart/mixed; boundary="===============1765178951357484720=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============1765178951357484720==
Content-Type: multipart/signed; boundary="xMfXZRXSTPQvmBlX"; micalg="pgp-sha256"; protocol="application/pgp-signature"


--xMfXZRXSTPQvmBlX
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: base64

SGVsbG8gSGVucmksCgpPbiBNb24sIDE4IEF1ZyAyMDI1IDE1OjUxOjQyICswMjAwIEhlbnJpIFJv
b3NlbiA8aGVucmkucm9vc2VuQGdpbnppbmdlci5jb20+IHdyb3RlOgo+IFNpbmNlIGNvbW1pdC0y
ODgyY2Y0YWU2NDkgKCJwYWNrYWdlL3dwZXdlYmtpdDogc2VjdXJpdHkgYnVtcCB0byB2ZXJzaW9u
Cj4gMi40OC4zIikgd3Bld2Via2l0IGRlcGVuZHMgb24gY21ha2UgMy4yMC4KPiBGaXhlcyBidWls
ZCBvbiBjdXJyZW50IERlYmlhbiBMVFMgKGJ1bGxzZXllKSB3aGljaCBoYXMgb25seSAzLjE4LjQu
CgpUaGlzIGlzIGEgZ29vZCBjYXRjaCwgdGhhbmtzIQoKPiA+Pj4gd3Bld2Via2l0IDIuNDguMyBD
b25maWd1cmluZwo+IC4uLgo+IENNYWtlIEVycm9yIGF0IENNYWtlTGlzdHMudHh0OjkgKGNtYWtl
X21pbmltdW1fcmVxdWlyZWQpOgo+ICAgQ01ha2UgMy4yMCBvciBoaWdoZXIgaXMgcmVxdWlyZWQu
ICBZb3UgYXJlIHJ1bm5pbmcgdmVyc2lvbiAzLjE4LjQKPiAtLSBDb25maWd1cmluZyBpbmNvbXBs
ZXRlLCBlcnJvcnMgb2NjdXJyZWQhCj4gbWFrZTogKioqIFtwYWNrYWdlL3BrZy1nZW5lcmljLm1r
OjI2MzogLy4uL2J1aWxkcm9vdC9vdXRwdXQvYnVpbGQvd3Bld2Via2l0LTIuNDguMy8uc3RhbXBf
Y29uZmlndXJlZF0gRXJyb3IgMQo+IAo+IEZpeGVzOiAyODgyY2Y0YWU2NDlmN2Q1ZTljZWU3MmY4
NGU2NzIzMjhmNTUwODQ1Cj4gU2lnbmVkLW9mZi1ieTogSGVucmkgUm9vc2VuIDxoZW5yaS5yb29z
ZW5AZ2luemluZ2VyLmNvbT4KCkFja2VkLUJ5OiBBZHJpYW4gUGVyZXogZGUgQ2FzdHJvIDxhcGVy
ZXpAaWdhbGlhLmNvbT4KCj4gLS0tCj4gIHBhY2thZ2Uvd3Bld2Via2l0L0NvbmZpZy5pbiB8IDEg
Kwo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPiAKPiBkaWZmIC0tZ2l0IGEvcGFj
a2FnZS93cGV3ZWJraXQvQ29uZmlnLmluIGIvcGFja2FnZS93cGV3ZWJraXQvQ29uZmlnLmluCj4g
aW5kZXggOTY5NTkwNDgyYy4uNWNiYmE0Mzc5MiAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL3dwZXdl
YmtpdC9Db25maWcuaW4KPiArKysgYi9wYWNrYWdlL3dwZXdlYmtpdC9Db25maWcuaW4KPiBAQCAt
NDEsNiArNDEsNyBAQCBjb25maWcgQlIyX1BBQ0tBR0VfV1BFV0VCS0lUCj4gIAlkZXBlbmRzIG9u
IEJSMl9QQUNLQUdFX0hBU19MSUJHTEVTICMgbGliZXBveHkKPiAgCWRlcGVuZHMgb24gQlIyX1BB
Q0tBR0VfSEFTX0xJQkVHTCAjIGxpYmVwb3h5Cj4gIAlkZXBlbmRzIG9uIEJSMl9QQUNLQUdFX1dQ
RVdFQktJVF9BUkNIX1NVUFBPUlRTCj4gKwlzZWxlY3QgQlIyX0hPU1RfQ01BS0VfQVRfTEVBU1Rf
M18yMAo+ICAJc2VsZWN0IEJSMl9QQUNLQUdFX0NBSVJPIGlmIEJSMl9FTkRJQU4gPSAiQklHIgo+
ICAJc2VsZWN0IEJSMl9QQUNLQUdFX0NBSVJPX1BORyBpZiBCUjJfRU5ESUFOID0gIkJJRyIKPiAg
CXNlbGVjdCBCUjJfUEFDS0FHRV9IQVJGQlVaWgo+IC0tIAo+IDIuMzkuNQo+IAo+IF9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gYnVpbGRyb290IG1haWxp
bmcgbGlzdAo+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4gaHR0cHM6Ly9saXN0cy5idWlsZHJv
b3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cj4gCgpDaGVlcnMsCuKAlEFkcmnDoW4K


--xMfXZRXSTPQvmBlX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABEIAB0WIQRao7wzT9fjNp58d7KRxVnb5MkSOwUCaKQqTQAKCRCRxVnb5MkS
O8PiAJoDQIfKYb6T4wp1P1rSmiGbI+5u5wCdFeBiUaJrxyZvQxT4fRgrmQpM918=
=Rbad
-----END PGP SIGNATURE-----

--xMfXZRXSTPQvmBlX--

--===============1765178951357484720==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1765178951357484720==--
