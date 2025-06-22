Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DF5FC7115A
	for <buildroot@archiver.kernel.org>; Sun, 22 Jun 2025 11:47:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 18B4B81E35;
	Sun, 22 Jun 2025 11:47:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QtgEPBq-ljwE; Sun, 22 Jun 2025 11:47:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 64FE081E3A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 64FE081E3A;
	Sun, 22 Jun 2025 11:47:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7EA6E12C
 for <buildroot@buildroot.org>; Sun, 22 Jun 2025 11:47:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 70CB460BCE
 for <buildroot@buildroot.org>; Sun, 22 Jun 2025 11:47:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iaYxyW2g5aI8 for <buildroot@buildroot.org>;
 Sun, 22 Jun 2025 11:47:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A73E860B26
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A73E860B26
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A73E860B26
 for <buildroot@buildroot.org>; Sun, 22 Jun 2025 11:47:28 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 694732003D3;
 Sun, 22 Jun 2025 13:47:23 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 22 Jun 2025 13:47:23 +0200
MIME-Version: 1.0
Date: Sun, 22 Jun 2025 13:47:23 +0200
From: Julien Olivain <ju.o@free.fr>
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: buildroot@buildroot.org, Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Heiko Thiery <heiko.thiery@gmail.com>
In-Reply-To: <20250618142825.758131-4-alex.bennee@linaro.org>
References: <20250618142825.758131-1-alex.bennee@linaro.org>
 <20250618142825.758131-4-alex.bennee@linaro.org>
User-Agent: Webmail Free/1.6.11
Message-ID: <8d2c6354ff9cf8ce64e8753204aaabfb@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1750592846;
 bh=xLAmjKVeYCnDp3kJxRYaQDE96Z8/MlZMze/ja1A2Oec=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=BsgOFmBjUi+XnXha2Kqmrd7vA+Lr3jLK+yt6nUGBjJnw6vvoZhcrPbQbphhUxe02r
 izlRcBw9yx3xjZR4Yv1UUyY6hVV9qvqY8kDjCLAG1YyihxOrrGTKUmg/XKYfJYNlYO
 EEg36w47Fj9qhwhTOEaedwGlFA8EHFyX5hBRJ3BopDkjBs1Rnm3pmnok9jwdIo1lvk
 FOu47LnIAIe8Fo/wu66cNgAhczN5EjjR6mny+TeK2fMJ0l9vJ47mIHDlakaGiTL+TF
 hbE3NU95kHy3gjNaiIcOS3s0slcrbkfGxO/qEQBBcfj7rwxOOSr8aMyUs24ycweXP7
 ucS5lLZf01J1g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=BsgOFmBj
Subject: Re: [Buildroot] [PATCH v7 3/4] package/vkmark: add vkmark
 benchmarking tool
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

SGkgQWxleCwKCk9uIDE4LzA2LzIwMjUgMTY6MjgsIEFsZXggQmVubsOpZSB3cm90ZToKPiBXZSBi
dWlsZCBmcm9tIGEgcmVjZW50IEhFQUQgdG8gZW5zdXJlIHdlIGhhdmUgdGhlIGZpeGVzIHRvIGJl
dHRlcgo+IGhhbmRsZSB0aGUgbWlzc2luZyBLSFJfZGlzcGxheSBleHRlbnNpb24uCj4gCj4gU2ln
bmVkLW9mZi1ieTogQWxleCBCZW5uw6llIDxhbGV4LmJlbm5lZUBsaW5hcm8ub3JnPgoKVGhpcyBw
YXRjaCBzdGlsbCBoYXMgdGhlICJ2bC54bWwiIGlzc3VlIHJlcG9ydGVkIGluIHRoZQpwcmV2aW91
cyB2ZXJzaW9uLiBTZWU6Cmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2J1aWxkcm9vdC8zOWIxMjI1
OGRjYjFhYzc3NjhkMDU3OWJiODA2NDdmMEBmcmVlLmZyLwoKWW91IGNhbiByZXByb2R1Y2UgdGhl
IGlzc3VlIGJ5IHJ1bm5pbmcgdGhlIHJ1bnRpbWUgdGVzdCBpbiB0aGUKQnVpbGRyb290IGRvY2tl
ciByZWZlcmVuY2UgaW1hZ2UuIEZvciBleGFtcGxlLCB1c2luZyB0aGUgY29tbWFuZDoKCiAgICAg
dXRpbHMvZG9ja2VyLXJ1biBzdXBwb3J0L3Rlc3RpbmcvcnVuLXRlc3RzIFwKICAgICAgICAgLWsg
LWQgZGwgLW8gb3V0cHV0X2ZvbGRlciB0ZXN0cy5wYWNrYWdlLnRlc3RfdmttYXJrCgpJIHNlZSB0
aGF0IHRoZSBQUiBbMV0gaGFzIGJlZW4gbWVyZ2VkIHVwc3RyZWFtLiBTbyBtYXliZSB5b3UgY291
bGQKanVzdCB1cGRhdGUgdG8gYSBjb21taXQgaW5jbHVkaW5nIHRoaXMgZml4PwoKQmVzdCByZWdh
cmRzLAoKSnVsaWVuLgoKWzFdIGh0dHBzOi8vZ2l0aHViLmNvbS92a21hcmsvdmttYXJrL3B1bGwv
NzYKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRy
b290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1
aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
