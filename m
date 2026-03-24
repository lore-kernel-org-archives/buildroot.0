Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08143FEC0FC
	for <buildroot@archiver.kernel.org>; Tue, 24 Mar 2026 21:02:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4C041407B7;
	Tue, 24 Mar 2026 21:02:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YJ-2zWRYCZAA; Tue, 24 Mar 2026 21:02:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4E3924073B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774386134;
	bh=aKp2wNHSvOWTHEepJUaPJ00xJnhKq/1iAZRyFrN7Gtc=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=KmR5kaEFna4oHoX8evu3SVLELOZZ+ATQ67lUTKu0VXcNph56V8yxPthFgq7skYqKc
	 Z7EDhKkloGVELqOKDSCL6qdIaaIB7ayEJl2s2GTie8RNWRE+kf2XK2QiF1KwSkdpra
	 vXn3WZSaJxjxnWNeMk2tsgzMMnsfkb4QPjNZ369hd3lEF4caaYQC2Yig6HX0l32BaJ
	 mWs2U1THJzAjKuK2TRPxATlgMKPgGTNFAfamX/RD0kUlCaAy1+bZ55sIlQEYmhXv9m
	 Xc7pGddOxwjaLcArQBO274NulMpEy4KZQ0EZIffQwjj3lbl3/B5dGUr2sm9hu77Nep
	 7XCPOxBR6jeLA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4E3924073B;
	Tue, 24 Mar 2026 21:02:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id F137AF4
 for <buildroot@buildroot.org>; Tue, 24 Mar 2026 21:02:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CE74A83BCD
 for <buildroot@buildroot.org>; Tue, 24 Mar 2026 21:02:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0RBtnirqgxjO for <buildroot@buildroot.org>;
 Tue, 24 Mar 2026 21:02:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7DE2C83BCA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7DE2C83BCA
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7DE2C83BCA
 for <buildroot@buildroot.org>; Tue, 24 Mar 2026 21:02:10 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 6AE5A60129;
 Tue, 24 Mar 2026 22:02:06 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 24 Mar 2026 22:02:06 +0100
MIME-Version: 1.0
Date: Tue, 24 Mar 2026 22:02:06 +0100
To: =?UTF-8?Q?Vincent_Stehl=C3=A9?= <vincent.stehle@arm.com>
Cc: buildroot@buildroot.org, Dick Olsson <hi@senzilla.io>
In-Reply-To: <20260324150239.21226-1-vincent.stehle@arm.com>
References: <20260324150239.21226-1-vincent.stehle@arm.com>
User-Agent: Webmail Free/1.6.14
Message-ID: <adb6127aed029fa1673e6fc3c684e5aa@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1774386128;
 bh=p3fv0BwO4CWuuP5TTKKlYCyjeuKNOkpvlMC6+z6VozI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=KQ2KR6WsVcbo1yP5ZvB+woA2Ct7OQiizPor00dGFpawpEgjuvrXzS/Gmk7kJvKA7r
 YwADM7zDFP5W9Ooei6W7/55/RrMSXJ8c3vOxI02PmYr+87Ckro6Eub5HAjIIIMFLrx
 fyu9b3nHznNoYnwCEhHlz1yK3UC826QJJJhnQPHEF1pbj3JZkcOzIRpdJkHjkzdH7f
 uCpbFF8UdfniWGusUsXLAYjkZuEZ4AUEdApKewxvW4f8uwOuB8ECj5yFP5JKN6XHwP
 Wd2m94Ir6M49bpdRv0TIhs/+Dtpa/A236V0dAsnI9nVkvjsnOc+ici+sB1CXEuteni
 wh9QxJab8HhSg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=KQ2KR6Ws
Subject: Re: [Buildroot] [PATCH] boot/edk2: fix build with gcc 15
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

SGkgVmluY2VudCwKCk9uIDI0LzAzLzIwMjYgMTY6MDIsIFZpbmNlbnQgU3RlaGzDqSB3cm90ZToK
PiBUaGUgZWRrMiBwYWNrYWdlIGZhaWxzIHRvIGJ1aWxkIHdpdGggZ2NjIDE1LCB3aXRoIHRoZSBm
b2xsb3dpbmcgZXJyb3I6Cj4gCj4gICBFZmlSb20uYzo3ODoxNzogZXJyb3I6IGFzc2lnbm1lbnQg
ZGlzY2FyZHMgJ2NvbnN0JyBxdWFsaWZpZXIgZnJvbSAKPiBwb2ludGVyIHRhcmdldCB0eXBlIFst
V2Vycm9yPWRpc2NhcmRlZC1xdWFsaWZpZXJzXQo+IAo+IENoZXJyeS1waWNrIG9uZSBwYXRjaCBm
cm9tIGVkazItc3RhYmxlMjAyNjAyIHRvIGZpeCB0aGlzLgo+IAo+IFRoaXMgY2FuIGJlIHZlcmlm
aWVkIHdpdGggdGhlIHRlc3RzLmJvb3QudGVzdF9lZGsyIHB5dGhvbiB0ZXN0cy4KPiAKPiBTaWdu
ZWQtb2ZmLWJ5OiBWaW5jZW50IFN0ZWhsw6kgPHZpbmNlbnQuc3RlaGxlQGFybS5jb20+Cj4gQ2M6
IERpY2sgT2xzc29uIDxoaUBzZW56aWxsYS5pbz4KClRoZSB0ZXN0IGluIHRoZSBDSSBpcyB1c2lu
ZyAodGFyZ2V0KSBnY2MgMTUgYW5kIHdhcyB3b3JraW5nIGZpbmU6Cmh0dHBzOi8vZ2l0bGFiLmNv
bS9idWlsZHJvb3Qub3JnL2J1aWxkcm9vdC8tL2pvYnMvMTM1OTg5NzU1ODUKClNvIEkgaW52ZXN0
aWdhdGVkIGEgYml0IG1vcmUgYW5kIGZvdW5kIHRoZSBpc3N1ZSB3YXMgYWN0dWFsbHkKaGFwcGVu
aW5nIHdpdGggKmhvc3QqIGdjYyAxNSAqYW5kIGdsaWJjIDIuNDMqLiBTbyBJIHVwZGF0ZWQgdGhl
CmNvbW1pdCB0aXRsZSB0byByZWZsZWN0IHRoYXQgYW5kIGFwcGxpZWQgdG8gbWFzdGVyLCB0aGFu
a3MhCgpTZWU6Cmh0dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJvb3Qub3JnL2J1aWxkcm9vdC8tL2Nv
bW1pdC9kMThmN2UwOTE2MmFjM2RiZTQ1MzhmZDBlMmEzZTVlYzE5MmU4OGE0CgpCZXN0IHJlZ2Fy
ZHMsCgpKdWxpZW4uCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6
Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
