Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AFC3C3ABC3
	for <buildroot@archiver.kernel.org>; Fri,  9 May 2025 14:37:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4C6998109C;
	Fri,  9 May 2025 14:37:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gAIEFLOfXKc0; Fri,  9 May 2025 14:37:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8A875827C6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8A875827C6;
	Fri,  9 May 2025 14:37:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9B249E2
 for <buildroot@buildroot.org>; Fri,  9 May 2025 14:37:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8C334405ED
 for <buildroot@buildroot.org>; Fri,  9 May 2025 14:37:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aypjMTW0_pAK for <buildroot@buildroot.org>;
 Fri,  9 May 2025 14:37:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org BC3CC40563
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BC3CC40563
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BC3CC40563
 for <buildroot@buildroot.org>; Fri,  9 May 2025 14:37:08 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id E27922003A4;
 Fri,  9 May 2025 16:37:03 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 09 May 2025 16:37:03 +0200
MIME-Version: 1.0
Date: Fri, 09 May 2025 16:37:03 +0200
From: Julien Olivain <ju.o@free.fr>
To: Kadambini Nema <kadambini.nema@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250501095013.100849-1-kadambini.nema@gmail.com>
References: <20250501095013.100849-1-kadambini.nema@gmail.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <70609e1ef387911a4d4524aaeb18c080@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1746801425;
 bh=o1681WZg1VZVW+8cyBsJuOZJ6y9nV0KA0w3In2CLhQU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=rdW48wheJUQ9NNeU9OuUlgcio1CumonJB0iOgS2GSAStXbmF9s8b0Dn+Cv806XyNx
 4L/C897RV6jz3s+v/TLi9tiwZmNKtJdY4HEPz+aXV/wno51d+MC43ZcOU5lj8i3eBp
 67gg2/KkNxd9QwECMzJqIGF8wBniG2epc8UjnrKv+2bf/k3sXfoelbYBshh6x96wzQ
 EvN4U3mzwrcmT7LSeBLDR6pQMhhTrk75sl8raTlxij4Rb1tVF3FCOopf5B3QePYrGp
 lLrg7QGTAB+bo+o6UfYP6EqhXZwMTA1JSODwqqkkAVXorZ69WMrQIKaBmIqN7OABoc
 5UAPaJd4ddkyA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=rdW48whe
Subject: Re: [Buildroot] [PATCH 1/1] package/pcre2: bump version to 10.45
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

T24gMDEvMDUvMjAyNSAxMTo1MCwgS2FkYW1iaW5pIE5lbWEgd3JvdGU6Cj4gUmVsZWFzZSBub3Rl
czoKPiBodHRwczovL2dpdGh1Yi5jb20vUENSRTJQcm9qZWN0L3BjcmUyL3JlbGVhc2VzL3RhZy9w
Y3JlMi0xMC40NQo+IGh0dHBzOi8vZ2l0aHViLmNvbS9QQ1JFMlByb2plY3QvcGNyZTIvYmxvYi9w
Y3JlMi0xMC40NS9ORVdTI0w0Cj4gCj4gQ2hhbmdlbG9nOgo+IGh0dHBzOi8vZ2l0aHViLmNvbS9Q
Q1JFMlByb2plY3QvcGNyZTIvYmxvYi9yZWxlYXNlL3BjcmUyLTEwLjQ1L0NoYW5nZUxvZyNMMTAK
PiAKPiBMSUNFTkNFIGZpbGUgcmVuYW1lZCB0byDigI5MSUNFTkNFLm1kLgo+IFVwZGF0ZSBoYXNo
IG9mIHRoZSDigI5MSUNFTkNFLm1kLiAoQWRkaXRpb24gb2YgZGV0YWlscyBvbiBuZXcgCj4gbWFp
bnRhaW5lcnNoaXApLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEthZGFtYmluaSBOZW1hIDxrYWRhbWJp
bmkubmVtYUBnbWFpbC5jb20+CgpBcHBsaWVkIHRvIG1hc3RlciwgdGhhbmtzLgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBs
aXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
