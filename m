Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34068C678DB
	for <buildroot@archiver.kernel.org>; Sat,  4 Mar 2023 22:52:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8796460FA9;
	Sat,  4 Mar 2023 22:52:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8796460FA9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id apFJfklogxD1; Sat,  4 Mar 2023 22:52:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B494C60FA4;
	Sat,  4 Mar 2023 22:52:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B494C60FA4
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C08E71BF591
 for <buildroot@lists.busybox.net>; Sat,  4 Mar 2023 22:52:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 99F7281D35
 for <buildroot@lists.busybox.net>; Sat,  4 Mar 2023 22:52:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 99F7281D35
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D4C6o7mF-YSM for <buildroot@lists.busybox.net>;
 Sat,  4 Mar 2023 22:52:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A71F781D0B
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A71F781D0B
 for <buildroot@buildroot.org>; Sat,  4 Mar 2023 22:52:12 +0000 (UTC)
Received: from 91-152-140-132.elisa-laajakaista.fi ([91.152.140.132]
 helo=momiji.lan) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA512__AES_256_GCM:256) (Exim)
 id 1pYaja-0054pT-Ea; Sat, 04 Mar 2023 23:52:10 +0100
Received: from localhost (momiji.lan [local])
 by momiji.lan (OpenSMTPD) with ESMTPA id d4cd971a;
 Sat, 4 Mar 2023 22:52:09 +0000 (UTC)
Date: Sun, 5 Mar 2023 00:52:09 +0200
Message-ID: <20230305005209.GD46585@igalia.com>
From: Adrian Perez de Castro <aperez@igalia.com>
To: buildroot@buildroot.org
In-Reply-To: <20230304221145.3222530-1-aperez@igalia.com>
References: <20230304221145.3222530-1-aperez@igalia.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Type:MIME-Version:References:In-Reply-To:Subject:Cc:To:
 From:Message-ID:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=EbbffGWIXZmsDHAFUeb7WSiDIRt0r49ntGwcTyewVqA=; b=lMnLjd9b+7/oeoP0J54XMga6Kq
 QIuh1IiMEOL80U1e1UTFp/HWv9+ovT06aguD/Cc+TZ9xleSnhrAdg/d7fzmSexg245XIMj+bwLXDG
 o6KGHC6JU4iNgnrWjihE7UAFUt6gqDdbnw0wR5UXKAOzcYH6dVwak4RERTCPSo1+Yl6ay6C3LNedC
 zIrj1P6xsp9nvFS1RYRdyKEqMgzfUFVR41qZGuXVE1jUkxBH8ZidVC2ESdjM25IUF2N5JSsgSAzSv
 CJ1T2uAABE2uUQ79v81Z77r4Og/+VOXHFdvfQFEWXqskaIl3fjFnCNMGmW6JV9f/0uIdKQ8fq4la6
 jQUJAAXw==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com
 header.a=rsa-sha256 header.s=20170329 header.b=lMnLjd9b
Subject: Re: [Buildroot] [PATCH] package/wpebackend-fdo: bump to version
 1.14.1
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
Content-Type: multipart/mixed; boundary="===============2853201323911327511=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============2853201323911327511==
Content-Type: multipart/signed; boundary="5WO8p4FjSZSplE8a"; micalg="pgp-ripemd160"; protocol="application/pgp-signature"


--5WO8p4FjSZSplE8a
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: base64

SGksCgooQWRkZWQgUGV0ZXIgaW4gQ0MuKQoKT24gU3VuLCAwNSBNYXIgMjAyMyAwMDoxMTo0NSAr
MDIwMCBBZHJpYW4gUGVyZXogZGUgQ2FzdHJvIDxhcGVyZXpAaWdhbGlhLmNvbT4gd3JvdGU6Cgo+
IFRoaXMgaXMgYSBidWdmaXggcmVsZWFzZSB3aGljaCBpbmNsdWRlcyBpbXBvcnRhbnQgZml4ZXMg
d2hpY2ggc29sdmUgYQo+IG1lbW9yeSBsZWFrIGFuZCBoaXR0aW5nIGEgc2l0dWF0aW9uIHdoZXJl
IHRoZSBvdXRwdXQgbm8gbG9uZ2VyIGdldHMKPiB1cGRhdGVkLiBSZWxlYXNlIG5vdGVzOgo+IAo+
ICAgaHR0cHM6Ly93cGV3ZWJraXQub3JnL3JlbGVhc2Uvd3BlYmFja2VuZC1mZG8tMS4xNC4xLmh0
bWwKPiAKPiBTaWduZWQtb2ZmLWJ5OiBBZHJpYW4gUGVyZXogZGUgQ2FzdHJvIDxhcGVyZXpAaWdh
bGlhLmNvbT4KPiAtLS0KPiAgcGFja2FnZS93cGViYWNrZW5kLWZkby93cGViYWNrZW5kLWZkby5o
YXNoIHwgOCArKysrLS0tLQo+ICBwYWNrYWdlL3dwZWJhY2tlbmQtZmRvL3dwZWJhY2tlbmQtZmRv
Lm1rICAgfCAyICstCj4gIDIgZmlsZXMgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCA1IGRlbGV0
aW9ucygtKQoKSXQgd291bGQgYmUgKnZlcnkgZGVzaXJhYmxlKiB0byBoYXZlIHRoaXMgdXBkYXRl
IGluIHN0YWJsZSBicmFuY2hlcyBhcyB3ZWxsLApiZWNhdXNlIHRoaXMgY29udGFpbnMgYnVnIGZp
eGVzIHdoaWNoIG1ha2UgV2ViS2l0e0dUSyxXUEV9IGFjdHVhbGx5IHVzYWJsZQppbiBzb21lIGNh
c2VzIChlLmcuIGxvbmcgcnVubmluZyBpbnN0YW5jZXMpLgoKQ2hlZXJzLArigJRBZHJpw6FuCg==

--5WO8p4FjSZSplE8a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABEDAB0WIQRao7wzT9fjNp58d7KRxVnb5MkSOwUCZAPLmQAKCRCRxVnb5MkS
OwWZAJ9licQ9BpbrAetStTJzUIqxOAcJ+ACfSb+2WMlwOLB5WdZkCtwRo5UEzbg=
=Lj4p
-----END PGP SIGNATURE-----

--5WO8p4FjSZSplE8a--

--===============2853201323911327511==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2853201323911327511==--
