Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E3A6CEE35A
	for <buildroot@archiver.kernel.org>; Tue, 18 Nov 2025 22:04:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C33CF41BE7;
	Tue, 18 Nov 2025 22:04:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KCplNCKcEYAm; Tue, 18 Nov 2025 22:04:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F2BA841B95
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F2BA841B95;
	Tue, 18 Nov 2025 22:04:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3C728158
 for <buildroot@buildroot.org>; Tue, 18 Nov 2025 22:04:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2195C61B8F
 for <buildroot@buildroot.org>; Tue, 18 Nov 2025 22:04:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RC3xIwzFB1ta for <buildroot@buildroot.org>;
 Tue, 18 Nov 2025 22:03:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 51F3B61ADF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 51F3B61ADF
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 51F3B61ADF
 for <buildroot@buildroot.org>; Tue, 18 Nov 2025 22:03:59 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 7D5C820041E;
 Tue, 18 Nov 2025 23:03:54 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 18 Nov 2025 23:03:54 +0100
MIME-Version: 1.0
Date: Tue, 18 Nov 2025 23:03:54 +0100
To: =?UTF-8?Q?Jos=C3=A9_Luis_Salvador_Rufo?= <salvador.joseluis@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20251118204725.1186221-2-salvador.joseluis@gmail.com>
References: <20251118204725.1186221-2-salvador.joseluis@gmail.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <7c020c6fca2ca38fc5e7601fecbf2956@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1763503435;
 bh=t9IeRAhB1ciVu1rITmRwXduo7JIyys7hLm1KyMMxQH8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=cb+6VaIX40DXfTecN3+jS7k8a0jpjJl3QiMyEMl6o5aAq1CR+Rb+yzBJj46aPFhwX
 sJPY5GBu0chOcTiRGLtdQ+us6K/NiWX12jv6Mbch26jiWrbLCGnZebuE+/dOtgzQD6
 1CmYZstMX+VSzmMTEwDB3jjLI/mILyEcPdLChQONjMWcJ1uIshq3aIPGTc5ZkFsupf
 ZlnHQ0CKYfxaOdMGAH8Gh8lq4gzHESH29t0f2ViiRi7ELKEs54Pr6AEx0lD+XMr1jW
 A0e1FX+iXpcBu7aUb5creenisgQGri4gqQxTGopZs0MCeaufkf0ucy0PKbLWNv5JwL
 vNykiWH3vzZkQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=cb+6VaIX
Subject: Re: [Buildroot] [PATCH 1/1] package/zfs: bump version to 2.3.5
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gMTgvMTEvMjAyNSAyMTo0NywgSm9zw6kgTHVpcyBTYWx2YWRvciBSdWZvIHdyb3RlOgo+IEZv
ciByZWxlYXNlIG5vdGUsIHNlZToKPiBodHRwczovL2dpdGh1Yi5jb20vb3Blbnpmcy96ZnMvcmVs
ZWFzZXMvdGFnL3pmcy0yLjMuNQo+IAo+IFNpZ25lZC1vZmYtYnk6IEpvc8OpIEx1aXMgU2FsdmFk
b3IgUnVmbyA8c2FsdmFkb3Iuam9zZWx1aXNAZ21haWwuY29tPgoKQXBwbGllZCB0byBtYXN0ZXIs
IHRoYW5rcy4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xp
c3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
