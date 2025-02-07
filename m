Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EBC4C0219D
	for <buildroot@archiver.kernel.org>; Fri,  7 Feb 2025 21:50:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0ECE56071B;
	Fri,  7 Feb 2025 21:50:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QHoma1yUEEXF; Fri,  7 Feb 2025 21:49:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4187B61288
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4187B61288;
	Fri,  7 Feb 2025 21:49:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id A399FCF
 for <buildroot@buildroot.org>; Fri,  7 Feb 2025 21:49:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 92BAC42CE7
 for <buildroot@buildroot.org>; Fri,  7 Feb 2025 21:49:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HRTTfIbs7XWM for <buildroot@buildroot.org>;
 Fri,  7 Feb 2025 21:49:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6C14E42CB0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6C14E42CB0
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6C14E42CB0
 for <buildroot@buildroot.org>; Fri,  7 Feb 2025 21:49:56 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 659B92003C8;
 Fri,  7 Feb 2025 22:49:53 +0100 (CET)
Received: from 94.105.106.182.dyn.edpnet.net ([94.105.106.182:46674])
 via 94.105.106.182.dyn.edpnet.net ([94.105.106.182])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 07 Feb 2025 22:49:53 +0100
MIME-Version: 1.0
Date: Fri, 07 Feb 2025 22:49:53 +0100
From: Julien Olivain <ju.o@free.fr>
To: =?UTF-8?Q?S=C3=A9bastien_Szymanski?= <sebastien.szymanski@armadeus.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250207-nxp-mwifiex-fix-v1-1-6d0e9a7a7892@armadeus.com>
References: <20250207-nxp-mwifiex-fix-v1-0-6d0e9a7a7892@armadeus.com>
 <20250207-nxp-mwifiex-fix-v1-1-6d0e9a7a7892@armadeus.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <a773ffc48d09263d5ab00259f6e63701@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1738964994;
 bh=AFPtRfgtg6n9hIA3YqniRTRxt4qfs3BLooyV3LSIOUs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=RVgDAV+OeflxHOwY90EYfoTNl/H8SmmYu16JzAB3Rm+dEHUiRLCQpd6/DkkrGqGP2
 7yvyhmxnS8C1FHDr2mYhkhYFpTWTmCpoYan5fSPt0lTzV1hBo6Pz2ro1izayTe1dxR
 tTBa4SQZIuzKvW75yuedWBJS2EDbpHBzD0APntZce/AK4Rv7wpDNS/B74w2w47gWHS
 XzCE2HtjFTN8rq7dfvnHbDX05Xc5cAypD2MimbNnL77mvwQIlfCWhtqWGqc8CJM2rQ
 LuttflSmzYGmvnOzcDKE4mGRPDkDx9wASfesjoPbu9yZtq3n2UWrTPVbphJvcefeNn
 VpS/aRdEUvRGA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=RVgDAV+O
Subject: Re: [Buildroot] [PATCH 1/2] package/nxp-mwifiex: fix build failure
 on s390x
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gMDcvMDIvMjAyNSAxNjo0OCwgU8OpYmFzdGllbiBTenltYW5za2kgd3JvdGU6Cj4gczM5MHgg
ZG9lc24ndCBzdXBwb3J0IFdpLUZpIG9uIExpbnV4IHNvIGxldCdzIGRpc2FibGUgdGhlIHBhY2th
Z2UgZm9yIAo+IHN1Y2gKPiBhcmNoaXRlY3R1cmUuCj4gCj4gRml4ZXM6IAo+IGh0dHBzOi8vYXV0
b2J1aWxkLmJ1aWxkcm9vdC5vcmcvcmVzdWx0cy80NGFlZjlkNzQ4NTdkOTNkOTBjZWZiMWQ1OTEx
MGU4NTdmZjRkZmFmCj4gCj4gU2lnbmVkLW9mZi1ieTogU8OpYmFzdGllbiBTenltYW5za2kgPHNl
YmFzdGllbi5zenltYW5za2lAYXJtYWRldXMuY29tPgoKU2VyaWVzIGFwcGxpZWQgdG8gbWFzdGVy
LCB0aGFua3MuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9s
aXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
