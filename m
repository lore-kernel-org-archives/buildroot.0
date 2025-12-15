Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50EF4D5B874
	for <buildroot@archiver.kernel.org>; Mon, 15 Dec 2025 23:26:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5852F60F3A;
	Mon, 15 Dec 2025 23:26:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zymz93YHST3J; Mon, 15 Dec 2025 23:26:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 69D4760F2E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765841167;
	bh=IDysIud4lZ6WbpjwTz2aGGSoGIbU0PofvUP1OeiXVu0=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jRoE8Ci6BxczxwJpMHPUsOI6odRoez4M25iP88uoqlb4M1MDGdMMO7p2F6K96vT6y
	 gr+QeQLKxv7AZvyR1yWvgXTcrVU9fnFCGV7Cbd2PHEgeEq1IIUsZnxkl9u2eSp2yLv
	 66wr+3+SKSAJ/zETfgvDYSItHCnFTPFJ6rhrA6wXjOudcZSDVHcXQEDvXkC/D1JHfC
	 M91F8hl2oFIPWjKqKOUvCDW15FUvHl3svMiM/1U6ECNE7lzIvHKUQyuq9kMfUSWUli
	 CVt1tILPIihIIi0/FeldkIDFWCkkClGK4PCuVvY/yHL2Vsa1vBL/iyYtSq+YdHIn/9
	 krckRrby2F8dg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 69D4760F2E;
	Mon, 15 Dec 2025 23:26:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id BA269219
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 23:26:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B7B8240421
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 23:26:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id du9zEvMvrN6i for <buildroot@buildroot.org>;
 Mon, 15 Dec 2025 23:26:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=213.97.179.56;
 helo=fanzine2.igalia.com; envelope-from=aperez@igalia.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org EC44B403DB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EC44B403DB
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EC44B403DB
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 23:26:00 +0000 (UTC)
Received: from 81-197-150-176.elisa-laajakaista.fi ([81.197.150.176]
 helo=momiji) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1vVHww-00D9s8-R4; Tue, 16 Dec 2025 00:25:54 +0100
Received: from localhost (momiji [local])
 by momiji (OpenSMTPD) with ESMTPA id dbfe9f8f;
 Mon, 15 Dec 2025 23:25:52 +0000 (UTC)
Date: Tue, 16 Dec 2025 01:25:48 +0200
Message-ID: <20251216012548.GB229707@igalia.com>
From: Adrian Perez de Castro <aperez@igalia.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Cc: Buildroot List <buildroot@buildroot.org>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 =?UTF-8?B?R2HDq2w=?= PORTAY <gael.portay+rtone@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Martin Bark <martin@barkynet.com>
In-Reply-To: <20251215224952.1253359-9-thomas.petazzoni@bootlin.com>
References: <20251215224952.1253359-1-thomas.petazzoni@bootlin.com>
 <20251215224952.1253359-9-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Type:MIME-Version:References:In-Reply-To:Subject:Cc:To:
 From:Message-ID:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=bc8hVS35vkTtN3pbvulL/VHULhvaemrVEejZeu32AAQ=; b=QeaAEKQeP+osahQpYS7Lq4n/B+
 64NtYZ6IN/W00LHNez9Eaa+9weFzOc704utJ5fIqAKKguhGNLapkuJKDe2pMFw0rzx7Iiezgp7PGm
 8NaW37TQsFoDuwSTYm76nM3R4vMzMN5JarJOS78NAhXYfeKbGOjeGljCfPRk+cDERFHLFx12efZep
 0z1tr5Y+oINP2NjEc/GKei2UA17uHi65eFwnipnZ63GR7tWAnDLam7vOU7NmOu3pYko4T4VgZfoZs
 JEtr0qsJzDjYS8FnxFkC6ziSCvg7fbPXoQP3wdeW0/og8T+VWaICOyZudYsA+2629Q2HQP1pIXyiO
 4K8uHtMA==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=igalia.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256
 header.s=20170329 header.b=QeaAEKQe
Subject: Re: [Buildroot] [PATCH 08/13] package/libwpe: drop rpi-userland
 specific tweak
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
Content-Type: multipart/mixed; boundary="===============6919253701300560662=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============6919253701300560662==
Content-Type: multipart/signed; boundary="sCQTltW8rDTtQdRR"; micalg="pgp-sha256"; protocol="application/pgp-signature"


--sCQTltW8rDTtQdRR
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: base64

SGksCgpPbiBNb24sIDE1IERlYyAyMDI1IDIzOjQ5OjQwICswMTAwIFRob21hcyBQZXRhenpvbmkg
dmlhIGJ1aWxkcm9vdCA8YnVpbGRyb290QGJ1aWxkcm9vdC5vcmc+IHdyb3RlOgo+IEFzIHdlJ3Jl
IGFib3V0IHRvIHJlbW92ZSB0aGUgcnBpLXVzZXJsYW5kIHBhY2thZ2UsIGRyb3AgdGhlIHNwZWNp
YWwKPiB0d2VhayBmb3IgaXQgZnJvbSBwYWNrYWdlL2xpYndwZS4KPiAKPiBTaWduZWQtb2ZmLWJ5
OiBUaG9tYXMgUGV0YXp6b25pIDx0aG9tYXMucGV0YXp6b25pQGJvb3RsaW4uY29tPgoKUmV2aWV3
ZWQtYnk6IEFkcmlhbiBQZXJleiBkZSBDYXN0cm8gPGFwZXJlekBpZ2FsaWEuY29tPgoKPiAtLS0K
PiAgcGFja2FnZS9saWJ3cGUvbGlid3BlLm1rIHwgNiAtLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQs
IDYgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvbGlid3BlL2xpYndwZS5t
ayBiL3BhY2thZ2UvbGlid3BlL2xpYndwZS5tawo+IGluZGV4IGQ4ZDJjYWEwOGEuLjVkMWFkMjdh
ZGQgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9saWJ3cGUvbGlid3BlLm1rCj4gKysrIGIvcGFja2Fn
ZS9saWJ3cGUvbGlid3BlLm1rCj4gQEAgLTE2LDEwICsxNiw0IEBAIExJQldQRV9ERVBFTkRFTkNJ
RVMgPSBsaWJlZ2wgbGlieGtiY29tbW9uCj4gIExJQldQRV9DRkxBR1MgPSAkKFRBUkdFVF9DRkxB
R1MpCj4gIExJQldQRV9DWFhGTEFHUyA9ICQoVEFSR0VUX0NYWEZMQUdTKQo+ICAKPiAtIyBXb3Jr
YXJvdW5kIGZvciBodHRwczovL2dpdGh1Yi5jb20vcmFzcGJlcnJ5cGkvdXNlcmxhbmQvaXNzdWVz
LzMxNgo+IC1pZmVxICgkKEJSMl9QQUNLQUdFX1JQSV9VU0VSTEFORCkseSkKPiAtTElCV1BFX0NG
TEFHUyArPSAtRF9HTlVfU09VUkNFCj4gLUxJQldQRV9DWFhGTEFHUyArPSAtRF9HTlVfU09VUkNF
Cj4gLWVuZGlmCj4gLQoKSSBkb24ndCBldmVuIHJlbWVtYmVyIHdoZW4gaXQgd2FzIHRoZSBsYXN0
IHRpbWUgSSB0cmllZCBidWlsZGluZyBhbgppbWFnZSBmb3Igd3Bld2Via2l0IHVzaW5nIHJwaS11
c2VybGFuZCB1c2luZyB1cHN0cmVhbSBCdWlsZHJvb3QsIGV2ZW4hCkl0IGlzIGdvb2QgdG8gc2Vl
IHNvbWUgY3J1ZnQgZ28gYXdheSA9KQoKPiAgJChldmFsICQobWVzb24tcGFja2FnZSkpCj4gLS0g
Cj4gMi41Mi4wCj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcK
PiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
PiAKCkNoZWVycywK4oCUQWRyacOhbgo=

--sCQTltW8rDTtQdRR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABEIAB0WIQRao7wzT9fjNp58d7KRxVnb5MkSOwUCaUCY/AAKCRCRxVnb5MkS
O+D9AJwPsmmNZ1TtGrWjnn/TJHjyG7sPjQCeKe6oAQQOoeDxN8pbXidPf9nHHYI=
=wnTm
-----END PGP SIGNATURE-----

--sCQTltW8rDTtQdRR--

--===============6919253701300560662==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6919253701300560662==--
