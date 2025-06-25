Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0183CC77B7C
	for <buildroot@archiver.kernel.org>; Wed, 25 Jun 2025 17:13:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C93C841EFA;
	Wed, 25 Jun 2025 17:13:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oAS6CK4bkrMu; Wed, 25 Jun 2025 17:13:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1F08C41EFB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1F08C41EFB;
	Wed, 25 Jun 2025 17:13:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 905CE43F
 for <buildroot@buildroot.org>; Wed, 25 Jun 2025 17:13:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 825BF40401
 for <buildroot@buildroot.org>; Wed, 25 Jun 2025 17:13:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LH1oMSx9RP85 for <buildroot@buildroot.org>;
 Wed, 25 Jun 2025 17:13:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E8B2A40111
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E8B2A40111
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E8B2A40111
 for <buildroot@buildroot.org>; Wed, 25 Jun 2025 17:13:36 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id EDD31B0051E;
 Wed, 25 Jun 2025 19:13:33 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 25 Jun 2025 19:13:33 +0200
MIME-Version: 1.0
Date: Wed, 25 Jun 2025 19:13:33 +0200
To: =?UTF-8?Q?Rapha=C3=ABl_M=C3=A9lotte?= <raphael.melotte@mind.be>
Cc: buildroot@buildroot.org
In-Reply-To: <20250624090905.287792-1-raphael.melotte@mind.be>
References: <20250624090905.287792-1-raphael.melotte@mind.be>
User-Agent: Webmail Free/1.6.11
Message-ID: <96ccb4d66dc1e0035f5dc1497b2b6fb7@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1750871615;
 bh=i6azYxiaG+nqWkjNBYtGJwOSzayzZ00ye4vlmtcmzZg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=t80kZYXrRLj2fCErAuPD/AR0E0mL6cANeEFSqo8b7NWMsv7lRjR7S0ypfYK9xMD0T
 ur5W/QXUtkWjFaWCkueAzXRliekMPa4/Yiq4qCFwufc6MjTKsMI9YHXtwSu5xWlCl6
 pDoKuyKYbtWHkXXKQFAy99Dbra51QMZKcf8vvLkN/wykyt+t0bgtTQqv3fUjfhR6yo
 S/ye1LLHss2pocG03JFKGNJlacapqGs65gnwcWzw/bJc1/y1NBn7HNTKRcI6xMDua6
 45UWqxwfzh1zLWY9bP2Br2l7WnQtBuozjq8DT0oLgi6JkRALU/b6LleaDyf20wKB9F
 +mgn0jvPliliA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=t80kZYXr
Subject: Re: [Buildroot] [PATCH 1/1] package/mupdf: update homepage URL
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

T24gMjQvMDYvMjAyNSAxMTowOSwgUmFwaGHDq2wgTcOpbG90dGUgdmlhIGJ1aWxkcm9vdCB3cm90
ZToKPiBUaGUgY3VycmVudCBob21lcGFnZSBVUkwgbGVhZHMgdG8gYW4gSFRUUCA0MDQgZXJyb3Iu
Cj4gCj4gRml4IGl0IGJ5IHVzaW5nIHRoZSBob21lcGFnZSBVUkwgY3VycmVudGx5IG1lbnRpb25l
ZCBpbiBtdXBkZidzIGdpdAo+IHJlcG9zaXRvcnkuCj4gCj4gU2lnbmVkLW9mZi1ieTogUmFwaGHD
q2wgTcOpbG90dGUgPHJhcGhhZWwubWVsb3R0ZUBtaW5kLmJlPgoKQXBwbGllZCB0byBtYXN0ZXIs
IHRoYW5rcy4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xp
c3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
