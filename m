Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67423D5AE45
	for <buildroot@archiver.kernel.org>; Sat, 13 Dec 2025 11:48:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6D19260D73;
	Sat, 13 Dec 2025 11:48:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eq-oLw2N0TtO; Sat, 13 Dec 2025 11:48:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 85E4A60C13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765626515;
	bh=WT3JgFb17Y9Az6mVgJdWjefqNykVwU64rU18Hi3MsGQ=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=C/gyhqkMD6OBrKCOdQeNZwIZEMGuFCOoqjYqIC74ti7w/h/L15ArSG2X7QmtztnRo
	 tNZVDBdj6cyQli/gNg8LtaO3giVyDzyurKgKFC8ABrq14YVItXFC6/ikYXWxV8tTSH
	 M0fntdkK6GOLo41fZPrO5uCE47dvh7I0CXcXMJXFfXGXglGQgVqnphI2Z8mx7Ln6Si
	 5gO+SEBQjTJeaOwg6dYeELnIuUlJTE/Xu2QsuYukib+RuAP0cafYExjVrLD+6pp+HR
	 tpxUosz+vxmbwxi5KbIsZ0Jks2RR1fceKJx/MfwM3HL+0sjMIwn9VOGn0P2ptVm+wZ
	 0ho8ikhe3C3FQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 85E4A60C13;
	Sat, 13 Dec 2025 11:48:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7BAF213D
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 11:48:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 75B9583231
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 11:48:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vpjeOgSym5Jr for <buildroot@buildroot.org>;
 Sat, 13 Dec 2025 11:48:31 +0000 (UTC)
X-Greylist: delayed 1255 seconds by postgrey-1.37 at util1.osuosl.org;
 Sat, 13 Dec 2025 11:48:28 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 11EDB816E3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 11EDB816E3
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=213.97.179.56;
 helo=fanzine2.igalia.com; envelope-from=aperez@igalia.com; receiver=<UNKNOWN> 
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 11EDB816E3
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 11:48:28 +0000 (UTC)
Received: from 81-197-150-176.elisa-laajakaista.fi ([81.197.150.176]
 helo=momiji) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1vUNmb-00CLdQ-Ew; Sat, 13 Dec 2025 12:27:29 +0100
Received: from localhost (momiji [local])
 by momiji (OpenSMTPD) with ESMTPA id 3e5755c1;
 Sat, 13 Dec 2025 11:27:27 +0000 (UTC)
Date: Sat, 13 Dec 2025 13:27:24 +0200
Message-ID: <20251213132724.GB3288322@igalia.com>
From: Adrian Perez de Castro <aperez@igalia.com>
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
In-Reply-To: <20251213100754.198163-1-thomas.perale@mind.be>
References: <20251213100754.198163-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Type:MIME-Version:References:In-Reply-To:Subject:Cc:To:
 From:Message-ID:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=mBgjNDHCIks3P0Mwpanved0T/c13ekITBPS+IKzVkU8=; b=PGkzaTYiNKvqnSJ4QEuvLZGLCn
 N5hEZgjEujcOvng+5CTC3YBxX3845NMYMH8qbrx2OfJ70Ww6elVT9ND51M+C95k9JzRYOR9pJj7KR
 NJZYDUTjAV2KEJemNBSZnsMx1U2eGyvf7QfOE0jeCfcEp5ZHtn6/7RafVvrUOju8mcn9pqNGZrrYQ
 E6dy4S5dWkbpSCKy6KBb3DMUo2vtraYxJn+4QS2gvP5s6LOxQFv1GzPe8qfLX81JCRm7pdRuv9e6m
 JYrOPKx8xyb7eXXfRqNf+sle6Pp4/JBb/t6/CKdlp2mf+smggU2lSfXEublPzCGraa159v+PJnQO0
 Gy2DVXDw==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=igalia.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256
 header.s=20170329 header.b=PGkzaTYi
Subject: Re: [Buildroot] [2025.02.x,
 PATCH] package/sysprof: remove 'debuginfod' config symbol
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
Content-Type: multipart/mixed; boundary="===============5092149110340994569=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============5092149110340994569==
Content-Type: multipart/signed; boundary="wyLp08cr5jZsYMpw"; micalg="pgp-sha256"; protocol="application/pgp-signature"


--wyLp08cr5jZsYMpw
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: base64

T24gU2F0LCAxMyBEZWMgMjAyNSAxMTowNzo1NCArMDEwMCBUaG9tYXMgUGVyYWxlIDx0aG9tYXMu
cGVyYWxlQG1pbmQuYmU+IHdyb3RlOgo+IENvbW1pdCBbMV0gd2FzIGVycm9uZW91c2x5IHBpY2tl
ZCBiZWNhdXNlIGl0IG1lbnRpb25lZCBjb21taXQgWzJdLCB3aGljaAo+IGlzIHByZXNlbnQgaW4g
dGhlIExUUyBicmFuY2guCj4gCj4gSW4gZmFjdCwgdGhlICdkZWJ1Z2luZm9kJyBvcHRpb24gd2Fz
IGludHJvZHVjZWQgaW4gdGhlIHN5c3Byb2YgcGFja2FnZSBpbgo+IHZlcnNpb24gNDguMCAoc2Vl
IFszXSBhbmQgQnVpbGRyb290IGNvbW1pdCBbNF0pLCB3aGljaCB3YXMgbm90IHBpY2tlZCBpbiB0
aGUKPiBMVFMgYnJhbmNoLgo+IAo+IFRoaXMgcGF0Y2ggcmV2ZXJ0cyBjb21taXQgWzFdIGFuZCBy
ZW1vdmVzIHRoZSBvcHRpb24gaXQgaW50cm9kdWNlZCwgd2hpY2gKPiBkb2VzIG5vdCBleGlzdCBp
biBzeXNwcm9mIDQ3LjIuCj4gCj4gWzFdIDI2ZmQ4ZWIyMTcgcGFja2FnZS9zeXNwcm9mOiBkaXNh
YmxlIGRlYnVnaW5mb2Qgc3VwcG9ydAo+IFsyXSA1MmM1YzYwNTBjIHBhY2thZ2UvZWxmdXRpbHM6
IGJ1bXAgdG8gdmVyc2lvbiAwLjE4MQo+IFszXSBodHRwczovL2dpdGxhYi5nbm9tZS5vcmcvR05P
TUUvc3lzcHJvZi8tL2NvbW1pdC9kMjQ3MWQ0YmY1NzFjM2E3YzhkNzQzYTk2YzkyMDdkNzQ4ZDc2
M2U4Cj4gWzRdIGU3NDM3NTlhNTIgcGFja2FnZS9zeXNwcm9mOiBidW1wIHRvIHZlcnNpb24gNDgu
MAo+IAo+IEZpeGVzOiBodHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJvb3Qv
LS9pc3N1ZXMvMTUyCj4gU2lnbmVkLW9mZi1ieTogVGhvbWFzIFBlcmFsZSA8dGhvbWFzLnBlcmFs
ZUBtaW5kLmJlPgoKQWNrZWQtYnk6IEFkcmlhbiBQZXJleiBkZSBDYXN0cm8gPGFwZXJlekBpZ2Fs
aWEuY29tPgoKPiAtLS0KPiAgcGFja2FnZS9zeXNwcm9mL3N5c3Byb2YubWsgfCAxIC0KPiAgMSBm
aWxlIGNoYW5nZWQsIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9zeXNw
cm9mL3N5c3Byb2YubWsgYi9wYWNrYWdlL3N5c3Byb2Yvc3lzcHJvZi5tawo+IGluZGV4IDRlNjcw
NjE0NTIuLjdmMWJhNGM2M2QgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9zeXNwcm9mL3N5c3Byb2Yu
bWsKPiArKysgYi9wYWNrYWdlL3N5c3Byb2Yvc3lzcHJvZi5tawo+IEBAIC0xMiw3ICsxMiw2IEBA
IFNZU1BST0ZfTElDRU5TRSA9IEdQTC0zLjArCj4gIFNZU1BST0ZfTElDRU5TRV9GSUxFUyA9IENP
UFlJTkcKPiAgU1lTUFJPRl9ERVBFTkRFTkNJRVMgPSBlbGZ1dGlscyBsaWJnbGliMiBsaWJkZXgg
bGlidW53aW5kIGpzb24tZ2xpYiBwb2xraXQKPiAgU1lTUFJPRl9DT05GX09QVFMgPSBcCj4gLQkt
RGRlYnVnaW5mb2Q9ZGlzYWJsZWQgXAo+ICAJLURkZXZlbG9wbWVudD1mYWxzZSBcCj4gIAktRGV4
YW1wbGVzPWZhbHNlIFwKPiAgCS1EZ3RrPWZhbHNlIFwKPiAtLSAKPiAyLjUyLjAKPiAKPiAKCkNo
ZWVycywK4oCUQWRyacOhbgo=

--wyLp08cr5jZsYMpw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABEIAB0WIQRao7wzT9fjNp58d7KRxVnb5MkSOwUCaT1NnAAKCRCRxVnb5MkS
OwE3AJ92QjDn9HxdQSrBMNHM61XZthCHJwCfZiMsQ2fQCEBNIl3TGO7G2DP3MZI=
=7V3m
-----END PGP SIGNATURE-----

--wyLp08cr5jZsYMpw--

--===============5092149110340994569==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5092149110340994569==--
