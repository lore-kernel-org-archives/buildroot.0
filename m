Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03190F436BE
	for <buildroot@archiver.kernel.org>; Fri, 17 Apr 2026 16:55:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A764140750;
	Fri, 17 Apr 2026 16:55:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 25uR508YGATf; Fri, 17 Apr 2026 16:55:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 93C7640722
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776444906;
	bh=l2QWNCn+hAC4hJj89+pOmYTPejOj3s0TD8NJWFWD93c=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=S7uCUV6hNPn1GFH5C1zSbcVgUDnv2dis88sc8NRrf0WsbXiqOUINwDQhHo5d8ZoCJ
	 rBAh+gciEhrjA5NQ6z4ueds3o5nl/annO3YQxzYH9+wjA7YNvAToZ/2p7pd+O5KaeU
	 lcCkG0ugcQsEbm5tYe4/SA/1BxYf4XLG7D3W+ZHrdvBF8X3hQ6XkUrYMQhZVaUVSs6
	 qmbK3EICOmWqYckMG/1Wi6EF1CJ6Fc1DQOYlFG3I3UzIrcoB31X7PeGz3FNV9UrQ0k
	 ICe6jGJcWEdQBja/wcWodk1ViyD4ehJDcG6tdOizSjF2VSSI90G9P/JRN2oQItGDi7
	 Ms7vRH2HkPDKg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 93C7640722;
	Fri, 17 Apr 2026 16:55:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id D81ED396
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 16:55:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C9FA740722
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 16:55:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VsWYAdpfHs3c for <buildroot@buildroot.org>;
 Fri, 17 Apr 2026 16:55:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=213.97.179.56;
 helo=fanzine2.igalia.com; envelope-from=aperez@igalia.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9405D40702
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9405D40702
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9405D40702
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 16:54:59 +0000 (UTC)
Received: from 91-154-227-245.elisa-laajakaista.fi ([91.154.227.245]
 helo=kodama) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1wDmT1-00HZcy-NJ; Fri, 17 Apr 2026 18:54:55 +0200
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id 0eaf4c01;
 Fri, 17 Apr 2026 16:54:53 +0000 (UTC)
Date: Fri, 17 Apr 2026 19:54:39 +0300
Message-ID: <20260417195439.GB1667711@igalia.com>
From: Adrian Perez de Castro <aperez@igalia.com>
To: Thomas Devoogdt <thomas@devoogdt.com>
Cc: buildroot@buildroot.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Thomas Devoogdt <thomas.devoogdt@barco.com>
In-Reply-To: <20260417142244.18803-1-thomas@devoogdt.com>
References: <20260417142244.18803-1-thomas@devoogdt.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Type:MIME-Version:References:In-Reply-To:Subject:Cc:To:
 From:Message-ID:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=nj2m7HSq7EPlwERYO7HnJ4T8VuXT1YhskV6OpwEduB4=; b=OHCDmrC1DTZW+bgwa6yz+9/Y8k
 dvjeAj5ZdvbY7OpAk6C9ypweLvP0+4xZq2hk/k/ZxJQjAEMm3psnk+1YeiB1bhQOE/9ONZv3FyjKc
 DNZaz0che8WxPJnmLSNTMcjUXKDZA4rwZpiMkdhuspfsjl7dKMPC9Bi1peCWkrGbw3CL2PI0tVWta
 YRYaAZ8HwhnQzAEVa/L6ohw29fAcBZXLB5OMvDR1OWiBgNWXbJPAETXQkB/P4bBSAJAYza7K70CjF
 oLLUrM4Im8iEASGtKeFGBshElU1ifZUoMJVVPgnv++5+zdStsLgjnZw2M1E1CZMU0yyuXboyiHe1U
 opHBtoyQ==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=igalia.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256
 header.s=20170329 header.b=OHCDmrC1
Subject: Re: [Buildroot] [PATCH v1 1/2] package/wayland-protocols: bump to
 1.48
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
Content-Type: multipart/mixed; boundary="===============7562501276764707647=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============7562501276764707647==
Content-Type: multipart/signed; boundary="jPs5CN+TGjQl9XzC"; micalg="pgp-sha256"; protocol="application/pgp-signature"


--jPs5CN+TGjQl9XzC
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: base64

SGVsbG8gVGhvbWFzLCBhbGwsCgpPbiBGcmksIDE3IEFwciAyMDI2IDE2OjIyOjQzICswMjAwIFRo
b21hcyBEZXZvb2dkdCA8dGhvbWFzQGRldm9vZ2R0LmNvbT4gd3JvdGU6Cj4gRnJvbTogVGhvbWFz
IERldm9vZ2R0IDx0aG9tYXMuZGV2b29nZHRAYmFyY28uY29tPgo+IAo+IEFubm91bmNlbWVudDoK
PiAKPiAtIDEuNDY6IGh0dHBzOi8vbG9yZS5mcmVlZGVza3RvcC5vcmcvd2F5bGFuZC1kZXZlbC9B
elRLaDZKZXd3ZlVCRkthT1M4NkRUNG9iSVNwdjViNWJqRmdoWEd3WXJNUHlrNld4cHo2SDRfdHJS
Y0VPeUY5VnBWVi0wcDEtVVROdjdfZXNqTzZwcHc1U3lJeUd4V0I4UjV4SV9TSllmQT1AZW1lcnNp
b24uZnIvVC8jdQo+IC0gMS40NzogaHR0cHM6Ly9sb3JlLmZyZWVkZXNrdG9wLm9yZy93YXlsYW5k
LWRldmVsL2FVQXFxa2h5djYtT0t2VW9AZ21haWwuY29tLwo+IC0gMS40ODogaHR0cHM6Ly9sb3Jl
LmZyZWVkZXNrdG9wLm9yZy93YXlsYW5kLWRldmVsL2FjME5BUEJGYWZoY2d6RTNAZ21haWwuY29t
Lwo+IAo+IFNpZ25lZC1vZmYtYnk6IFRob21hcyBEZXZvb2dkdCA8dGhvbWFzLmRldm9vZ2R0QGJh
cmNvLmNvbT4KClJldmlld2VkLWJ5OiBBZHJpYW4gUGVyZXogZGUgQ2FzdHJvIDxhcGVyZXpAaWdh
bGlhLmNvbT4KCkkgd2FzIHBsYW5uaW5nIHRvIHNlbmQgYmFzaWNhbGx5IHRoZSBzYW1lIHBhdGNo
LCBhcyBwYXJ0IG9mIGEgc2VyaWVzCnRvIHVwZGF0ZSB3bHJvb3RzIGFuZCBjYWdlIHRoYXQgSSBh
bSBwcmVwYXJpbmcuLi4gdGhlcmVmb3JlIHBhdGNoIExHVE0uCkkgbWF5IHNlbmQgbXkgc2VyaWVz
IGFueXdheSwgdG8gYmUgbWVyZ2VkIGFmdGVyIHRoaXMgb25lIDopCgpDaGVlcnMsCuKAlEFkcmnD
oW4K

--jPs5CN+TGjQl9XzC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABEIAB0WIQRao7wzT9fjNp58d7KRxVnb5MkSOwUCaeJlzwAKCRCRxVnb5MkS
O7DxAJ46ulRZa2CdwdsgtpT/mDxI2oK24gCdFSt+O7w6RqnobtNihVFDgNaqiCw=
=Jncy
-----END PGP SIGNATURE-----

--jPs5CN+TGjQl9XzC--

--===============7562501276764707647==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7562501276764707647==--
