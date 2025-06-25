Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AF70C7EE2A
	for <buildroot@archiver.kernel.org>; Wed, 25 Jun 2025 17:16:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3F0DD8420D;
	Wed, 25 Jun 2025 17:16:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IZDynV0nUCdu; Wed, 25 Jun 2025 17:16:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 805808420E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 805808420E;
	Wed, 25 Jun 2025 17:16:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id C1464154
 for <buildroot@buildroot.org>; Wed, 25 Jun 2025 17:16:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A5A7B41E9C
 for <buildroot@buildroot.org>; Wed, 25 Jun 2025 17:16:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id spPb5XfMyzUL for <buildroot@buildroot.org>;
 Wed, 25 Jun 2025 17:16:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org DE8E741E25
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DE8E741E25
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DE8E741E25
 for <buildroot@buildroot.org>; Wed, 25 Jun 2025 17:16:55 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id BC2122003C8;
 Wed, 25 Jun 2025 19:16:51 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 25 Jun 2025 19:16:51 +0200
MIME-Version: 1.0
Date: Wed, 25 Jun 2025 19:16:51 +0200
To: =?UTF-8?Q?Rapha=C3=ABl_M=C3=A9lotte?= <raphael.melotte@mind.be>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>
In-Reply-To: <20250624143236.1286191-1-raphael.melotte@mind.be>
References: <20250624143236.1286191-1-raphael.melotte@mind.be>
User-Agent: Webmail Free/1.6.11
Message-ID: <459d672c55638405f010e790d37629ce@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1750871814;
 bh=jVYxTYvvUJgXpg62OllTlgTvxW7M+WBzWBMmpmRfADM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=tbC6i0pD0fPpXGaJPJ0M9MYyFKwzW1mA4GRLG6v+4z/cmb9rPzKMfMUcz+XwhLons
 X8Qu7e9s4NqnV+7A1WyklOCEk+Fo64fHcEsyvaxsEV3GrxrGykEi/L3E0ylNVFpfkL
 dnFXP1NqpJUry6k7A7i9TWLyRBC5NUUIoxMTkD3nycvlyesKb8CNPm/0qal1nYmdF8
 xX2xWhh4qgV2/YUZajl230HBag7+fTsnqtexSR9Z2I0ZWHjA2LvJYKyNip3W/39Aou
 8kc9l1ynEuJvD1BsEpiQKm9cC1mMUIM71tE2a+7tdTVc9cGuOpSUWHk0AivTU03/+O
 qEubmHq+rrD4g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=tbC6i0pD
Subject: Re: [Buildroot] [PATCH 1/1] package/python-s3transfer: bump to
 version 0.13.0
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

T24gMjQvMDYvMjAyNSAxNjozMiwgUmFwaGHDq2wgTcOpbG90dGUgdmlhIGJ1aWxkcm9vdCB3cm90
ZToKPiBDaGFuZ2Vsb2c6Cj4gaHR0cHM6Ly9naXRodWIuY29tL2JvdG8vczN0cmFuc2Zlci9ibG9i
LzAuMTMuMC9DSEFOR0VMT0cucnN0Cj4gCj4gU2lnbmVkLW9mZi1ieTogUmFwaGHDq2wgTcOpbG90
dGUgPHJhcGhhZWwubWVsb3R0ZUBtaW5kLmJlPgoKQXBwbGllZCB0byBtYXN0ZXIsIHRoYW5rcy4K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290
IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxk
cm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
