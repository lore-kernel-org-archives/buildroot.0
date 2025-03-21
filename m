Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48D13C36000
	for <buildroot@archiver.kernel.org>; Fri, 21 Mar 2025 20:25:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E5188424B9;
	Fri, 21 Mar 2025 20:25:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XngxTILHo6O1; Fri, 21 Mar 2025 20:25:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1AB93424B1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1AB93424B1;
	Fri, 21 Mar 2025 20:25:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id A309D12F
 for <buildroot@buildroot.org>; Fri, 21 Mar 2025 20:25:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 893B040B6A
 for <buildroot@buildroot.org>; Fri, 21 Mar 2025 20:25:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9NYwcS5Vnobl for <buildroot@buildroot.org>;
 Fri, 21 Mar 2025 20:25:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A8863424B1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A8863424B1
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A8863424B1
 for <buildroot@buildroot.org>; Fri, 21 Mar 2025 20:25:05 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 617A4B00539;
 Fri, 21 Mar 2025 21:25:01 +0100 (CET)
Received: from 2a01:e0a:485:b220:8213:2270:4a8d:a1d5
 via 2a01:e0a:485:b220:8213:2270:4a8d:a1d5 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 21 Mar 2025 21:25:01 +0100
MIME-Version: 1.0
Date: Fri, 21 Mar 2025 21:25:01 +0100
From: Julien Olivain <ju.o@free.fr>
To: =?UTF-8?Q?Fl=C3=A1vio_Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>
In-Reply-To: <20250321162108.1852085-1-flavio.tapajos@newtesc.com.br>
References: <20250321162108.1852085-1-flavio.tapajos@newtesc.com.br>
User-Agent: Webmail Free/1.6.10
Message-ID: <ce31e80f7d212d5fdd50f9bd875ef6ca@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1742588703;
 bh=2pG7indNKQqMYywpTNTF4Cbcmo5frlG4jd5JBsGQx2Q=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=q/3qDXrbSscyV4IT5RYQ3jrhqIbNABWAt3o9YCoqgOY8nIC2s5+fwt22OY1E5PdM7
 YqQy8YMO5umWQOyvY3H9depnJTNsNwaMOnbuEvC6N3+vLd963eBbRX3Pzq9MKobWbE
 9+OGCgv7DlHPmGPhwlaKwCpePUvybMVqTFrBU9Lj5x8u1p1M0PB32k5R5B2qF1JWUQ
 IlG90IQmFO9QZc31fplRU2/J9OhpOiAy2QlsHBNZNZyojtTsJ8iM2uuLh67GmYxyiD
 oigIeU7HjbkaRDBq20Zr50DxfFalzrJWo8KfK6AuzT+a8pXdZpWOrJRynG+Lwi1w0V
 DUQ22d6MHOotQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=q/3qDXrb
Subject: Re: [Buildroot] [PATCH 1/1] package/python-sqlalchemy: bump to
 version 2.0.39
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

T24gMjEvMDMvMjAyNSAxNzoyMSwgRmzDoXZpbyBUYXBhasOzcyB3cm90ZToKPiBGb3IgY2hhbmdl
IGxvZywgc2VlOgo+IGh0dHBzOi8vZG9jcy5zcWxhbGNoZW15Lm9yZy9lbi8yMC9jaGFuZ2Vsb2cv
Y2hhbmdlbG9nXzIwLmh0bWwjY2hhbmdlLTIuMC4zOQo+IAo+IFNpZ25lZC1vZmYtYnk6IEZsw6F2
aW8gVGFwYWrDs3MgPGZsYXZpby50YXBham9zQG5ld3Rlc2MuY29tLmJyPgoKQXBwbGllZCB0byBt
YXN0ZXIsIHRoYW5rcy4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRw
czovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
