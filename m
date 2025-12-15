Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD374D5B85C
	for <buildroot@archiver.kernel.org>; Mon, 15 Dec 2025 23:46:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6C791405BE;
	Mon, 15 Dec 2025 23:46:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p72pUK7S0c1o; Mon, 15 Dec 2025 23:46:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 63A6F4058C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765842372;
	bh=RVb5WggINEhA3+9Y7ob0s5hFaiutdSewITrzwKO+f78=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HhN69CQwaeGNSs4rTtjndkVoKwea+HGXebmwJzzo244Sr3f78CUOFLDxAfXxoZ7OT
	 gq5ALukCSX5Q4/exWwoHbTL5Jm30nwzb6aagyzkaRvWBYzBw95oJvkvKWYgWctU8aD
	 m0VBza0sicSfkSP80Xyj//Osjxo2IabBbFM1vgOLCyoTeK8El4/8eHJThjICf2jaxw
	 mazLTAXPx/XWwInZ1CEFGi3e0U8yVXuBmimSwSMYq+l/0zCBtr1aMa6WQmEsyMhF58
	 ty7UYyiC6/HeCalrS23UBh5I2Egq1wwpVJyWBRgc/fqXOTNqtrL9hDhdRpvJE+wtxj
	 TySDeWDjll6hg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 63A6F4058C;
	Mon, 15 Dec 2025 23:46:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 53DF3219
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 23:46:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 39D9B81947
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 23:46:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RBTRF-i0CLU4 for <buildroot@buildroot.org>;
 Mon, 15 Dec 2025 23:46:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=213.97.179.56;
 helo=fanzine2.igalia.com; envelope-from=aperez@igalia.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8958580E36
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8958580E36
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8958580E36
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 23:46:08 +0000 (UTC)
Received: from 81-197-150-176.elisa-laajakaista.fi ([81.197.150.176]
 helo=momiji) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1vVIGR-00DAAG-Ns; Tue, 16 Dec 2025 00:46:03 +0100
Received: from localhost (momiji [local])
 by momiji (OpenSMTPD) with ESMTPA id a14bf630;
 Mon, 15 Dec 2025 23:46:02 +0000 (UTC)
Date: Tue, 16 Dec 2025 01:45:57 +0200
Message-ID: <20251216014557.GB378927@igalia.com>
From: Adrian Perez de Castro <aperez@igalia.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Cc: buildroot@buildroot.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Raphael Pavlidis <raphael.pavlidis@gmail.com>
In-Reply-To: <20251215225837.1257574-1-thomas.petazzoni@bootlin.com>
References: <20251215225837.1257574-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Type:MIME-Version:References:In-Reply-To:Subject:Cc:To:
 From:Message-ID:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=PRU2r8l5X5fSz6bXc0XEZRYmXVuqdceMdS3Tmbbbwj8=; b=k7iZWCdAmAvmG8t2cDbgcS/hU2
 OQch56fync9f0xGScwf1+tGmPxYG+1uYlwAPgzRaDWFKnjTGuk7MBWffqSEQDnnCf8E3AJr2/urK7
 nWn0qm+9HnWM6H5BGaJfXwZfnHfA/WeSCnECGvdn4Nq028FaRgxuHIg2usT1O2CO517DJGMqc04Ip
 OgClDzRKD+dMADHdLKe538bpZv54RADgJ/uZHoxmsnAfFzDFBoUHI/nZrkQhEokJcoFVxnhwDYtCU
 +cdhIdLMD5il2LiZCn6Vf0uO4C+S8LqmWKgMEs+C+juCRnBAVGLT2RZlbBr8ak1gyeaYP90SM8DgW
 nsrOo/2g==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=igalia.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256
 header.s=20170329 header.b=k7iZWCdA
Subject: Re: [Buildroot] [PATCH 1/2] package/cage: properly propagate
 wlroots dependencies
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
Content-Type: multipart/mixed; boundary="===============6590796628913686537=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============6590796628913686537==
Content-Type: multipart/signed; boundary="M6BlO0zD7F8dAHio"; micalg="pgp-sha256"; protocol="application/pgp-signature"


--M6BlO0zD7F8dAHio
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: base64

T24gTW9uLCAxNSBEZWMgMjAyNSAyMzo1ODozNSArMDEwMCBUaG9tYXMgUGV0YXp6b25pIHZpYSBi
dWlsZHJvb3QgPGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnPiB3cm90ZToKPiBDb21taXQgMDBmYjNh
NTdjYmFlZGI4ZGY0M2Y3NWYwZTg5MTQyM2MxZWY3ZDhjNiBhZGRlZCBhIHdscm9vdHMgLT4KPiBs
aWJnYm0gZGVwZW5kZW5jeSwgYnV0IGZvcmdvdCB0byBwcm9wYWdhdGUgaXQgdG8gcGFja2FnZS9j
YWdlLgo+IAo+IEZpeGVzOgo+IAo+ICAgaHR0cHM6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm5ldC9y
ZXN1bHRzL2RjMTg1YzNkNDg4NmU5Y2ZkOWU2ZjQ2YjUwYjg2NGU1YjJmMjg2MDUvCj4gCj4gQ2M6
IFJhcGhhZWwgUGF2bGlkaXMgPHJhcGhhZWwucGF2bGlkaXNAZ21haWwuY29tPgo+IFNpZ25lZC1v
ZmYtYnk6IFRob21hcyBQZXRhenpvbmkgPHRob21hcy5wZXRhenpvbmlAYm9vdGxpbi5jb20+CgpS
ZXZpZXdlZC1ieTogQWRyaWFuIFBlcmV6IGRlIENhc3RybyA8YXBlcmV6QGlnYWxpYS5jb20+Cgo+
IC0tLQo+ICBwYWNrYWdlL2NhZ2UvQ29uZmlnLmluIHwgNCArKystCj4gIDEgZmlsZSBjaGFuZ2Vk
LCAzIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvcGFja2Fn
ZS9jYWdlL0NvbmZpZy5pbiBiL3BhY2thZ2UvY2FnZS9Db25maWcuaW4KPiBpbmRleCA0ZjgyM2M3
NjhjLi45NWM2ODczMmVkIDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvY2FnZS9Db25maWcuaW4KPiAr
KysgYi9wYWNrYWdlL2NhZ2UvQ29uZmlnLmluCj4gQEAgLTEsNiArMSw3IEBACj4gLWNvbW1lbnQg
ImNhZ2UgbmVlZHMgdWRldiwgRUdMIGFuZCBPcGVuR0wgRVMgc3VwcG9ydCIKPiArY29tbWVudCAi
Y2FnZSBuZWVkcyB1ZGV2LCBFR0wsIE9wZW5HTCBFUyBhbmQgR0JNIHN1cHBvcnQiCj4gIAlkZXBl
bmRzIG9uICFCUjJfUEFDS0FHRV9IQVNfTElCRUdMIHx8IFwKPiAgCQkhQlIyX1BBQ0tBR0VfSEFT
X0xJQkdMRVMgfHwgXAo+ICsJCSFCUjJfUEFDS0FHRV9IQVNfTElCR0JNIHx8IFwKPiAgCQkhQlIy
X1BBQ0tBR0VfSEFTX1VERVYKPiAgCj4gIGNvbW1lbnQgImNhZ2UgbmVlZHMgYSB0b29sY2hhaW4g
dy8gdGhyZWFkcywgZHluYW1pYyBsaWJyYXJ5Igo+IEBAIC0xMyw2ICsxNCw3IEBAIGNvbmZpZyBC
UjJfUEFDS0FHRV9DQUdFCj4gIAlkZXBlbmRzIG9uIEJSMl9UT09MQ0hBSU5fSEFTX1RIUkVBRFMg
IyB3bHJvb3RzCj4gIAlkZXBlbmRzIG9uIEJSMl9QQUNLQUdFX0hBU19MSUJFR0wgIyB3bHJvb3Rz
Cj4gIAlkZXBlbmRzIG9uIEJSMl9QQUNLQUdFX0hBU19MSUJHTEVTICMgd2xyb290cwo+ICsJZGVw
ZW5kcyBvbiBCUjJfUEFDS0FHRV9IQVNfTElCR0JNICMgd2xyb290cwo+ICAJZGVwZW5kcyBvbiBC
UjJfUEFDS0FHRV9IQVNfVURFViAjIHdscm9vdHMKPiAgCXNlbGVjdCBCUjJfUEFDS0FHRV9XTFJP
T1RTCj4gIAloZWxwCj4gLS0gCj4gMi41Mi4wCj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gYnVpbGRy
b290QGJ1aWxkcm9vdC5vcmcKPiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9idWlsZHJvb3QKPiAKCkNoZWVycywK4oCUQWRyacOhbgo=

--M6BlO0zD7F8dAHio
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABEIAB0WIQRao7wzT9fjNp58d7KRxVnb5MkSOwUCaUCdtQAKCRCRxVnb5MkS
O7RNAJ45aYIjFAH1vl9Q3dXGYxLUiPngkACcDQRa1IgLJlTPyy2/OM1YkLb6rVA=
=g+p7
-----END PGP SIGNATURE-----

--M6BlO0zD7F8dAHio--

--===============6590796628913686537==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6590796628913686537==--
