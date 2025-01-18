Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 010AFC02185
	for <buildroot@archiver.kernel.org>; Sat, 18 Jan 2025 18:34:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B492942985;
	Sat, 18 Jan 2025 18:34:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Zx_9aX4_OTII; Sat, 18 Jan 2025 18:34:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A3FAD42987
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A3FAD42987;
	Sat, 18 Jan 2025 18:34:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 617CBB89
 for <buildroot@buildroot.org>; Sat, 18 Jan 2025 18:34:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4AB5241672
 for <buildroot@buildroot.org>; Sat, 18 Jan 2025 18:34:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xbyEvBQQh1VT for <buildroot@buildroot.org>;
 Sat, 18 Jan 2025 18:34:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1460B4163E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1460B4163E
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1460B4163E
 for <buildroot@buildroot.org>; Sat, 18 Jan 2025 18:34:45 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 99A9F2003CC;
 Sat, 18 Jan 2025 19:34:40 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:37406])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 18 Jan 2025 19:34:40 +0100
MIME-Version: 1.0
Date: Sat, 18 Jan 2025 19:34:40 +0100
From: Julien Olivain <ju.o@free.fr>
To: =?UTF-8?Q?Vincent_Stehl=C3=A9?= <vincent.stehle@laposte.net>
Cc: buildroot@buildroot.org, Alistair Francis <alistair@alistair23.me>
In-Reply-To: <20250118143332.27240-1-vincent.stehle@laposte.net>
References: <20250118143332.27240-1-vincent.stehle@laposte.net>
User-Agent: Webmail Free/1.6.9
Message-ID: <44df69437f2553c4a142f1c83eb4a8bd@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1737225282;
 bh=LImRUZmtx06OkxnnPAAR4+XP0sFD/jZlMt/G8bWq5o0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=n7M8EfwsulQ6fOGIjU2Lb72obHN9ko9grluPCwzML7h8UzjOM+f3sssyKK+ihxShZ
 n6v/cHObMa0NNCsS/SUX6EKpzrz1sxnIQW8riKDuP1Gz5iKmEb/jpewNi26cRR2rIK
 oebAc6yrZ5AjIeThu7iCwuTGTyCzAmAgjCWkqVFa7n1+8QD+I+jZgtqajkoCJRkr4H
 5gAkWEOTg2LPCHfYxtopQFzwpHW5XrUbADAwFfigbEmIKTu1AwBAvNKNF7Dztij+GZ
 mz86SWDwRITUPPngZ5Vb4Um8yNnpdaaYCE2zcfcEDwgxwOysVf6VM/BQlBzG7dQrNv
 u1nc1Gnm1j61w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=n7M8Efws
Subject: Re: [Buildroot] [PATCH] package/xen: fix build for gcc 14 and
 aarch64
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

SGkgVmluY2VudCwKCk9uIDE4LzAxLzIwMjUgMTU6MzMsIFZpbmNlbnQgU3RlaGzDqSB2aWEgYnVp
bGRyb290IHdyb3RlOgo+IEJhY2twb3J0IHR3byBjb21taXRzIGZyb20gdXBzdHJlYW0gWGVuIHRv
IGZpeCB0aGUgYnVpbGQgZm9yIEFBcmNoNjQgCj4gd2l0aAo+IGdjYyAxNC4KPiAKPiBUaGlzIHJl
cGFpcnMgdGVzdHMucGFja2FnZS50ZXN0X3hlbi5UZXN0WGVuLCB3aGljaCB1c2VzIGFuIGV4dGVy
bmFsCj4gQUFyY2g2NCB0b29sY2hhaW4gdGhhdCBoYXMgYmVlbiByZWNlbnRseSB1cGdyYWRlZCB0
byBnY2MgMTQuCj4gCj4gU2lnbmVkLW9mZi1ieTogVmluY2VudCBTdGVobMOpIDx2aW5jZW50LnN0
ZWhsZUBsYXBvc3RlLm5ldD4KPiBDYzogQWxpc3RhaXIgRnJhbmNpcyA8YWxpc3RhaXJAYWxpc3Rh
aXIyMy5tZT4KCkkgYXBwbGllZCB0aGlzIHBhdGNoIHRvIG1hc3RlciBhZnRlciBmZXcgY2hhbmdl
czoKSSBiYXNpY2FsbHkgZml4ZWQgdGhlICJtYWtlIGNoZWNrLXBhY2thZ2UiIGVycm9ycyBhbmQg
YWRkZWQKc29tZSBpbmZvIGluIHRoZSBjb21taXQgbG9nLCBzZWU6Cmh0dHBzOi8vZ2l0bGFiLmNv
bS9idWlsZHJvb3Qub3JnL2J1aWxkcm9vdC8tL2NvbW1pdC9lYTU1YWEyODE5YzgzZGMzODQxMzFi
NmNhNDRmZmJmOTk3NzI2ZjJjCgpCZXN0IHJlZ2FyZHMsCgpKdWxpZW4uCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QK
YnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxt
YW4vbGlzdGluZm8vYnVpbGRyb290Cg==
