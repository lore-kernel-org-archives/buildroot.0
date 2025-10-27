Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A49FCCF9EA
	for <buildroot@archiver.kernel.org>; Mon, 27 Oct 2025 13:31:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 376BA83DEE;
	Mon, 27 Oct 2025 13:31:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SDAtOTMGsqe3; Mon, 27 Oct 2025 13:31:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 52F4783E45
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 52F4783E45;
	Mon, 27 Oct 2025 13:31:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 712F7976
 for <buildroot@buildroot.org>; Mon, 27 Oct 2025 13:31:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 630D041403
 for <buildroot@buildroot.org>; Mon, 27 Oct 2025 13:31:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3x2qXR1TrXSg for <buildroot@buildroot.org>;
 Mon, 27 Oct 2025 13:31:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=213.97.179.56;
 helo=fanzine2.igalia.com; envelope-from=aperez@igalia.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5145B413E0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5145B413E0
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5145B413E0
 for <buildroot@buildroot.org>; Mon, 27 Oct 2025 13:31:04 +0000 (UTC)
Received: from 81-197-150-176.elisa-laajakaista.fi ([81.197.150.176]
 helo=momiji) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1vDNJN-00Flb0-7d; Mon, 27 Oct 2025 14:31:01 +0100
Received: from localhost (momiji [local])
 by momiji (OpenSMTPD) with ESMTPA id ea460869;
 Mon, 27 Oct 2025 13:31:00 +0000 (UTC)
Date: Mon, 27 Oct 2025 15:31:00 +0200
Message-ID: <20251027153100.GD121268@igalia.com>
From: Adrian Perez de Castro <aperez@igalia.com>
To: Thomas Devoogdt <thomas@devoogdt.com>
Cc: buildroot@buildroot.org, Thomas Devoogdt <thomas.devoogdt@barco.com>
In-Reply-To: <20251025143512.78812-2-thomas@devoogdt.com>
References: <20251025143512.78812-1-thomas@devoogdt.com>
 <20251025143512.78812-2-thomas@devoogdt.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Type:MIME-Version:References:In-Reply-To:Subject:Cc:To:
 From:Message-ID:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Ka02qmJpGcm8BBqjNIy61UglsS3Y2TFennwGrPV/w1A=; b=e4PgHNcwOHGxy912fFYSGnU8Dz
 eoDFalPrYpCc9XgFd/SnU4GKQNq4hvtIdMLprp4B+LcOVYWVbyzIbiZgjX7H9YyRNPkFTbTginSw2
 8QCnrMFHN5UklEbpKIEq+Jq99IIR6DpniQM2Wr67s4x7db0WVbGh02SYWMh/BYx9zl+F8SV42l9mp
 w4bi5StrW8cGQ9EqJY/WcsZO9JBU1BTaqBTP4OChQWSK4CB0XXd6qPCFi6ZdUBlm4LHec8wqsBTSA
 8hGvxRv3f9nEUQHFzWBw8OTfFSgYS6aHvduNrtCwRC1KIWzPZ8tlHClM023aL6zoSMo9q+ihz2S59
 UfcZOtKQ==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=igalia.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256
 header.s=20170329 header.b=e4PgHNcw
Subject: Re: [Buildroot] [PATCH v1] package/webkitgtk: disable internal
 ccache configuration
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
Content-Type: multipart/mixed; boundary="===============2233490946885203204=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============2233490946885203204==
Content-Type: multipart/signed; boundary="P+K3Y5YdiW1VlJFS"; micalg="pgp-sha256"; protocol="application/pgp-signature"


--P+K3Y5YdiW1VlJFS
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: base64

T24gU2F0LCAyNSBPY3QgMjAyNSAxNjozNToxMiArMDIwMCBUaG9tYXMgRGV2b29nZHQgPHRob21h
c0BkZXZvb2dkdC5jb20+IHdyb3RlOgo+IEZyb206IFRob21hcyBEZXZvb2dkdCA8dGhvbWFzLmRl
dm9vZ2R0QGJhcmNvLmNvbT4KPiAKPiBXZWJLaXQncyBhdXRvLWNvbmZpZ3VyZWQgY2NhY2hlIHJl
c3VsdHMgaW4gMTAwJSBjYWNoZSBtaXNzZXMuCj4gRGlzYWJsZSBXZWJLaXQncyBpbnRlcm5hbCBj
Y2FjaGUgc2V0dXAgWzFdIHNpbmNlIEJ1aWxkcm9vdAo+IGFscmVhZHkgbWFuYWdlcyB0aGUgY2Nh
Y2hlIGluIHRvb2xjaGFpbi90b29sY2hhaW4td3JhcHBlci5jLgo+IAo+IFsxXSBodHRwczovL2dp
dGh1Yi5jb20vV2ViS2l0L1dlYktpdC9ibG9iL3dlYmtpdGd0ay0yLjUwLjEvU291cmNlL2NtYWtl
L1dlYktpdENDYWNoZS5jbWFrZQo+IAo+IFNpZ25lZC1vZmYtYnk6IFRob21hcyBEZXZvb2dkdCA8
dGhvbWFzLmRldm9vZ2R0QGJhcmNvLmNvbT4KCkFja2VkLWJ5OiBBZHJpYW4gUGVyZXogZGUgQ2Fz
dHJvIDxhcGVyZXpAaWdhbGlhLmNvbT4KCj4gLS0tCj4gIHBhY2thZ2Uvd2Via2l0Z3RrL3dlYmtp
dGd0ay5tayB8IDQgKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCj4gCj4g
ZGlmZiAtLWdpdCBhL3BhY2thZ2Uvd2Via2l0Z3RrL3dlYmtpdGd0ay5tayBiL3BhY2thZ2Uvd2Vi
a2l0Z3RrL3dlYmtpdGd0ay5tawo+IGluZGV4IDBiNmExMzgzY2EuLmZlY2NhMzUyOWQgMTAwNjQ0
Cj4gLS0tIGEvcGFja2FnZS93ZWJraXRndGsvd2Via2l0Z3RrLm1rCj4gKysrIGIvcGFja2FnZS93
ZWJraXRndGsvd2Via2l0Z3RrLm1rCj4gQEAgLTE5LDYgKzE5LDEwIEBAIFdFQktJVEdUS19ERVBF
TkRFTkNJRVMgPSBob3N0LXJ1YnkgaG9zdC1weXRob24zIGhvc3QtZ3BlcmYgaG9zdC11bmlmZGVm
IFwKPiAgCj4gIFdFQktJVEdUS19DTUFLRV9CQUNLRU5EID0gbmluamEKPiAgCj4gKyMgQnVpbGRy
b290IGFkZHMgc3VwcG9ydCBmb3IgY2NhY2hlIHRocm91Z2ggaXRzCj4gKyMgdG9vbGNoYWluLXdy
YXBwZXIsIHNvIHRlbGwgd2Via2l0Z3RrIG5vdCB0byBtZXNzIHdpdGggaXQuCj4gK1dFQktJVEdU
S19DT05GX0VOViA9IFdLX1VTRV9DQ0FDSEU9Tk8KPiArCj4gIFdFQktJVEdUS19DT05GX09QVFMg
PSBcCj4gIAktREVOQUJMRV9BUElfVEVTVFM9T0ZGIFwKPiAgCS1ERU5BQkxFX0RPQ1VNRU5UQVRJ
T049T0ZGIFwKPiAtLSAKPiAyLjQzLjAKPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwo+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPiBidWlsZHJvb3RA
YnVpbGRyb290Lm9yZwo+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2J1aWxkcm9vdAo+IAoKQ2hlZXJzLArigJRBZHJpw6FuCg==

--P+K3Y5YdiW1VlJFS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABEIAB0WIQRao7wzT9fjNp58d7KRxVnb5MkSOwUCaP90FAAKCRCRxVnb5MkS
O/SPAJ9SkUL+h2cOI9OShxS0+9kVOl647gCfetXXDWB0iadohht5hUHh0y9VzCA=
=rmOp
-----END PGP SIGNATURE-----

--P+K3Y5YdiW1VlJFS--

--===============2233490946885203204==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2233490946885203204==--
