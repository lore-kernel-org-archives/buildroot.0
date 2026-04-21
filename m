Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D2E7F94CA1
	for <buildroot@archiver.kernel.org>; Tue, 21 Apr 2026 17:44:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 39FA16080E;
	Tue, 21 Apr 2026 17:44:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kVUcWfrP80C4; Tue, 21 Apr 2026 17:44:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A6BE960807
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776793477;
	bh=F5RCPxSDu1WSRYq6WpwRJiYBlKgLQO7RshfjwF+8aYg=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=i5k4YUog76o+ExHgTGDchrHC2zLa3vHZtyitZ9b7SrKaCHjy2+HTJla6yvJq2UNYc
	 32u7t/isBZe0Tf1v97LgQk6kfCkbEqhy3womXcPuc3kM+iHNfPaGAAiJer49rAIjrl
	 JjMmQn2r4zW4MI9re3pRzLdD2JiNxxnKOJzlodXPxcSeuGpEcyqk/NqGO/SnWjoGPg
	 dKosdkcga7P1rDe3IVubgileNOlkqP2eJCcBJtpfyhFzSKYteZy0i+4/35eT2W9tLB
	 NowIq6HYibclQneuCIfnqWhmjT9fhTNMWNAnemDZVtwpVOXWwmPG/sf1XJDI0frAU6
	 vW0Bu3A4Cj8tA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A6BE960807;
	Tue, 21 Apr 2026 17:44:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 876B7257
 for <buildroot@buildroot.org>; Tue, 21 Apr 2026 17:44:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7942D83E49
 for <buildroot@buildroot.org>; Tue, 21 Apr 2026 17:44:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yROJdRjRhjuX for <buildroot@buildroot.org>;
 Tue, 21 Apr 2026 17:44:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=213.97.179.56;
 helo=fanzine2.igalia.com; envelope-from=aperez@igalia.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6A57683E2A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6A57683E2A
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6A57683E2A
 for <buildroot@buildroot.org>; Tue, 21 Apr 2026 17:44:31 +0000 (UTC)
Received: from 81-197-150-176.elisa-laajakaista.fi ([81.197.150.176]
 helo=momiji) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1wFF98-0022Ly-Ia; Tue, 21 Apr 2026 19:44:26 +0200
Received: from localhost (momiji [local])
 by momiji (OpenSMTPD) with ESMTPA id 03af63a4;
 Tue, 21 Apr 2026 17:44:25 +0000 (UTC)
Date: Tue, 21 Apr 2026 20:44:25 +0300
Message-ID: <20260421204425.GD3419825@igalia.com>
From: Adrian Perez de Castro <aperez@igalia.com>
To: Thomas Devoogdt <thomas@devoogdt.com>
Cc: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>,
 Thomas Devoogdt <thomas.devoogdt@barco.com>,
 Thomas Devoogdt <thomas@devoogdt.com>
In-Reply-To: <CACXRmJjbyhWrvtRVpn2L0oEpn+UZzfK-=ca=L6z0yT8BJusjaA@mail.gmail.com>
References: <CACXRmJjbyhWrvtRVpn2L0oEpn+UZzfK-=ca=L6z0yT8BJusjaA@mail.gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Type:MIME-Version:References:In-Reply-To:Subject:Cc:To:
 From:Message-ID:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=OQnC8MXYIPNv1KAkMFq3UmvGSWPGHQAIM49OubTGcfk=; b=rY+2EasTifLuPdD1FGKVG7jOYz
 tP85ltS4GPNgp4pf2PHau4mJyvNvyhzVueFGVC6QGoYHazVEhzL9AaN0QWM/2PuJ7ymnn+vd+bdgX
 oBO15c91IR7fXB+XpwEOA35H93B9gFRUvaXW4kcYWkSvW3GyKHRDPQmrfkqVLVy3LtJCTfgioCiJX
 uhOUGH4HydT92/HKbvzUK46jLXS57v4ykhgEfP4S+IocNblSR/bHl4s4ofZWjAFgqdzitWiADBoxj
 KKyWraCG2Hkrbu21uTHyY7igjpZpKfDdgH7fDdYMEZTfDACE7s7CT4wyLK9VUUuTca7ZmF14LX9uR
 L719pccQ==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=igalia.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256
 header.s=20170329 header.b=rY+2EasT
Subject: Re: [Buildroot] [PATCH v1] package/webkitgtk: bump to 2.52.3
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
Content-Type: multipart/mixed; boundary="===============0323539948698614158=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============0323539948698614158==
Content-Type: multipart/signed; boundary="B/q2rB5t7ZXxsnTy"; micalg="pgp-sha256"; protocol="application/pgp-signature"


--B/q2rB5t7ZXxsnTy
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: base64

SGkgVGhvbWFzLAoKT24gVHVlLCAyMSBBcHIgMjAyNiAxNDozNzoyOSArMDIwMCBUaG9tYXMgRGV2
b29nZHQgPHRob21hc0BkZXZvb2dkdC5jb20+IHdyb3RlOgoKPiBZZXMsIEkgbWlzc2VkIHlvdXIg
cGF0Y2guIEkgd2lsbCBtYXJrIG15IG93biBwYXRjaCBhcyBzdXBlcnNlZWRlZC4gRmluZSB0bwo+
IGtlZXAgVVNFX0dTVFJFQU1FUl9HTCBmcm9tIHdoZXJlIGl0IGlzLgoKTm8gcHJvYmxlbSBhdCBh
bGwsIGl0IGNvdWxkIGhhcHBlbiB0byBhbnlvbmUgPSkKCj4gQ2FuIHlvdSBhbHJlYWR5IHRha2Ug
dGhlIDAwMDEtSlNDLUZpeC1FTkFCTEUtSklULWJ1aWxkLnBhdGNoIHRvIHlvdXIgd2Via2l0Cj4g
YnVtcCwgb3Igd2lsbCB5b3UgdXBkYXRlIHRoZSBwYXRjaCB3aXRoIDIuNTIuNCBvbmNlIHJlbGVh
c2VkPwoKSSB3aWxsIGRvIGJvdGg6IGZpcnN0IHNlbmQgYSB2MiB3aXRoIHRoZSBwYXRjaCBhZGRl
ZCwgYW5kIHRoZW4gYmFja3BvcnQKaXQgdG8gdGhlIHN0YWJsZSBicmFuY2ggdG8gaGF2ZSBpdCBp
bmNsdWRlZCBpbiAuNCBhcyB3ZWxsLgoKQ2hlZXJzLArigJRBZHJpw6FuCg==

--B/q2rB5t7ZXxsnTy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABEIAB0WIQRao7wzT9fjNp58d7KRxVnb5MkSOwUCaee3eQAKCRCRxVnb5MkS
OytmAJ0aD+k8126cb7nWd9w9kC5zMHyKEgCffaJaPsGkGDl+oiR5neMjmqpHdsg=
=rcCv
-----END PGP SIGNATURE-----

--B/q2rB5t7ZXxsnTy--

--===============0323539948698614158==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0323539948698614158==--
