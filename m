Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74928C83F26
	for <buildroot@archiver.kernel.org>; Thu, 24 Jul 2025 20:14:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4224E614BF;
	Thu, 24 Jul 2025 20:14:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f-q0aJ3bCt9d; Thu, 24 Jul 2025 20:14:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 74E7061490
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 74E7061490;
	Thu, 24 Jul 2025 20:14:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 55752115
 for <buildroot@buildroot.org>; Thu, 24 Jul 2025 20:14:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 46FA140546
 for <buildroot@buildroot.org>; Thu, 24 Jul 2025 20:14:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JX-JkhvfOamL for <buildroot@buildroot.org>;
 Thu, 24 Jul 2025 20:14:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org AE1AF40187
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AE1AF40187
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AE1AF40187
 for <buildroot@buildroot.org>; Thu, 24 Jul 2025 20:14:11 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 5ECC25FFB7;
 Thu, 24 Jul 2025 22:14:06 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 24 Jul 2025 22:14:06 +0200
MIME-Version: 1.0
Date: Thu, 24 Jul 2025 22:14:06 +0200
To: =?UTF-8?Q?Vincent_Stehl=C3=A9?= <vincent.stehle@arm.com>
Cc: buildroot@buildroot.org, Masahiro Yamada <yamada.masahiro@socionext.com>
In-Reply-To: <20250724140124.1276139-1-vincent.stehle@arm.com>
References: <20250724140124.1276139-1-vincent.stehle@arm.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <556d3de331e840e5d9143137157e3b05@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1753388048;
 bh=3yCMaI5wDsiLZzstmg4JVTGOi7IqMs7rZxW5NdpPAZI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=qnmzpsUWI8glQHzOzNGI9APGMxadeAtEcjWfBaUcndXWzX/E+9Qp8sT1TCc4PO53t
 l/W4VN2j/86CnrnudboNLxU5JqOpzj8uviaf1M7OTk3NEDcbcarzSDY/3QVmPl8tLW
 5NbIGMh32vmWQlbUZp7SU4Xruk6kJp6gke3qOenUVh2BTlWMx2QNnY2Q9FdbhuVP0B
 CCUkoXLcJx7XnFaS2d0ujcCeca7cbIzzHAft7sVlBVkuDjbhS6hm6Kz1l4b6iJVAvK
 9JNnrRMMbctLP4u8BrkD8IA/zv/3JVxdAzFireB+/ZU9KcCINq+hci9F9FNUGPCXj7
 o/KvDP7seztzQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=qnmzpsUW
Subject: Re: [Buildroot] [PATCH] configs/arm_foundationv8: bump to Linux
 6.15 and model 11.29
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

T24gMjQvMDcvMjAyNSAxNjowMSwgVmluY2VudCBTdGVobMOpIHdyb3RlOgo+IC0gQnVtcCBMaW51
eCBrZXJuZWwgdG8gdjYuMTUuNyBhbmQgdXBkYXRlIHRoZSBoYXNoIGZpbGUuCj4gLSBCdW1wIHRo
ZSBtb2RlbCBpbiB0aGUgcmVhZG1lIHRvIHZlcnNpb24gMTEuMjkgYnVpbGQgMjcuCj4gCj4gV2hp
bGUgYXQgaXQsIGFkanVzdCB0aGUgbW9kZWwncyBwYXRoIGluIHRoZSByZWFkbWUgdG8gdGFrZSB0
aGUgaG9zdAo+IGFyY2hpdGVjdHVyZSBpbnRvIGFjY291bnQuCj4gCj4gU2lnbmVkLW9mZi1ieTog
VmluY2VudCBTdGVobMOpIDx2aW5jZW50LnN0ZWhsZUBhcm0uY29tPgo+IENjOiBNYXNhaGlybyBZ
YW1hZGEgPHlhbWFkYS5tYXNhaGlyb0Bzb2Npb25leHQuY29tPgoKQXBwbGllZCB0byBtYXN0ZXIs
IHRoYW5rcy4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xp
c3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
