Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EDDCCCD185
	for <buildroot@archiver.kernel.org>; Mon, 13 Oct 2025 19:54:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3D49080E95;
	Mon, 13 Oct 2025 19:54:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kLUcC68nn5jm; Mon, 13 Oct 2025 19:54:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3A67480E0E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3A67480E0E;
	Mon, 13 Oct 2025 19:54:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id C03DC294
 for <buildroot@buildroot.org>; Mon, 13 Oct 2025 19:54:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A6B8D80E0E
 for <buildroot@buildroot.org>; Mon, 13 Oct 2025 19:54:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iDbAOYWkD9fu for <buildroot@buildroot.org>;
 Mon, 13 Oct 2025 19:54:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=213.97.179.56;
 helo=fanzine2.igalia.com; envelope-from=aperez@igalia.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3233F80DBB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3233F80DBB
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3233F80DBB
 for <buildroot@buildroot.org>; Mon, 13 Oct 2025 19:54:40 +0000 (UTC)
Received: from 81-197-150-176.elisa-laajakaista.fi ([81.197.150.176]
 helo=momiji) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1v8Oct-0095VC-33; Mon, 13 Oct 2025 21:54:35 +0200
Received: from localhost (momiji [local])
 by momiji (OpenSMTPD) with ESMTPA id 50bd3c03;
 Mon, 13 Oct 2025 19:54:34 +0000 (UTC)
Date: Mon, 13 Oct 2025 22:54:34 +0300
Message-ID: <20251013225434.GI1422726@igalia.com>
From: Adrian Perez de Castro <aperez@igalia.com>
To: Peter Korsgaard <peter@korsgaard.com>
Cc: Thomas Devoogdt <thomas@devoogdt.com>, buildroot@buildroot.org
In-Reply-To: <87v7li9no5.fsf@dell.be.48ers.dk>
References: <20250916122005.30652-1-thomas@devoogdt.com>
 <87v7li9no5.fsf@dell.be.48ers.dk>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Type:MIME-Version:References:In-Reply-To:Subject:Cc:To:
 From:Message-ID:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ObnI9x/kBL1rUQIPJjDRO568lZgs0g9Fk5gA7lCnXH0=; b=XPEwjypInjQgUtl0WRRRK3WJze
 Q4QeLifoApfA/fD/sIRHwiVwjO5xjGlnciVynQxTs23+CN20ifMEm7Ss2dCgi/lkGV8T0hZkDxydr
 G1PWePBkZjt5+MIfUzh3O1RgfmdhCbstVqRtT6ViBVmPeB4JDxvtoh+gDM8wSMBz3UdfRSCcz2mNO
 iAHJtEumGKz1YCfIZjDqotfrJPuiLohv+4rzJDu0eTD8O+79eEzaKKeHmcsmNuSg9MTd2hw1xWm7R
 cWnNGYAwlcrGItq8fH+MkzokY9SaXLSPYMcz68I8LiAW4+QuFnx5g28X5B/TBusNy9wsf4CmbcUTU
 Iw7X6VUA==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=igalia.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256
 header.s=20170329 header.b=XPEwjypI
Subject: Re: [Buildroot] [PATCH v1] package/webkitgtk: bump to version 2.48.6
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
Content-Type: multipart/mixed; boundary="===============0599464600829587978=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============0599464600829587978==
Content-Type: multipart/signed; boundary="dlow6z2/hIIOJEo0"; micalg="pgp-sha256"; protocol="application/pgp-signature"


--dlow6z2/hIIOJEo0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: base64

SGkgYWxsLAoKT24gVHVlLCAxNiBTZXAgMjAyNSAyMTo1NjoyNiArMDIwMCBQZXRlciBLb3JzZ2Fh
cmQgPHBldGVyQGtvcnNnYWFyZC5jb20+IHdyb3RlOgo+ID4+Pj4+ICJUaG9tYXMiID09IFRob21h
cyBEZXZvb2dkdCA8dGhvbWFzQGRldm9vZ2R0LmNvbT4gd3JpdGVzOgo+IAo+ICA+IEZpeGVzIGEg
bnVtYmVyIG9mIGNyYXNoZXMuIFJlbGVhc2Ugbm90ZXM6Cj4gID4gIC0gaHR0cHM6Ly93ZWJraXRn
dGsub3JnLzIwMjUvMDcvMzAvd2Via2l0Z3RrMi40OC40LXJlbGVhc2VkLmh0bWwKPiAgPiAgLSBo
dHRwczovL3dlYmtpdGd0ay5vcmcvMjAyNS8wOC8wMS93ZWJraXRndGsyLjQ4LjUtcmVsZWFzZWQu
aHRtbAo+ICA+ICAtIGh0dHBzOi8vd2Via2l0Z3RrLm9yZy8yMDI1LzA5LzAzL3dlYmtpdGd0azIu
NDguNi1yZWxlYXNlZC5odG1sCj4gCj4gID4gQW5kIGJyaW5ncyBzb21lIHNlY3VyaXR5IGZpeGVz
LiBTZWN1cml0eSBhZHZpc29yeToKPiAKPiAgPiAgLSBodHRwczovL3dlYmtpdGd0ay5vcmcvc2Vj
dXJpdHkvV1NBLTIwMjUtMDAwNS5odG1sCj4gCj4gID4gU2lnbmVkLW9mZi1ieTogVGhvbWFzIERl
dm9vZ2R0IDx0aG9tYXNAZGV2b29nZHQuY29tPgo+IAo+IENvbW1pdHRlZCBhZnRlciBtYXJraW5n
IGl0IGFzIGEgc2VjdXJpdHkgYnVtcCwgdGhhbmtzLgo+IAo+IFdoYXQgYWJvdXQgd3Bld2Via2l0
PwoKTXkgcGxhbiB0byB1cGRhdGUgaXQgdG8gMi41MC4xIHdoaWNoIEkgaGF2ZSBqdXN0IHJlbGVh
c2VkIHRvZGF5IFsxXS4KIAoKQ2hlZXJzLArigJRBZHJpw6FuCgotLS0KWzFdIGh0dHBzOi8vd3Bl
d2Via2l0Lm9yZy9yZWxlYXNlL3dwZXdlYmtpdC0yLjUwLjEuaHRtbAo=

--dlow6z2/hIIOJEo0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABEIAB0WIQRao7wzT9fjNp58d7KRxVnb5MkSOwUCaO1Y+gAKCRCRxVnb5MkS
O4ZuAJ9ZgEVRide/QUU4HjTdyJsBCRxihQCdGZmFXih8AMGWlhg9UZhJy5/6Smw=
=faBO
-----END PGP SIGNATURE-----

--dlow6z2/hIIOJEo0--

--===============0599464600829587978==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0599464600829587978==--
