Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB7B3C021B2
	for <buildroot@archiver.kernel.org>; Sat, 22 Feb 2025 11:10:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 71B89406DC;
	Sat, 22 Feb 2025 11:10:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GAvTtBJuY6aT; Sat, 22 Feb 2025 11:10:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 669124056B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 669124056B;
	Sat, 22 Feb 2025 11:10:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id D1955F11
 for <buildroot@buildroot.org>; Sat, 22 Feb 2025 11:10:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B6B17810C3
 for <buildroot@buildroot.org>; Sat, 22 Feb 2025 11:10:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aGOVQ5FiDpc4 for <buildroot@buildroot.org>;
 Sat, 22 Feb 2025 11:10:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B4A3781067
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B4A3781067
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B4A3781067
 for <buildroot@buildroot.org>; Sat, 22 Feb 2025 11:10:46 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id F38EDB0051E;
 Sat, 22 Feb 2025 12:10:43 +0100 (CET)
Received: from 2a01:e0a:485:b220:8213:2270:4a8d:a1d5
 via 2a01:e0a:485:b220:8213:2270:4a8d:a1d5 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 22 Feb 2025 12:10:43 +0100
MIME-Version: 1.0
Date: Sat, 22 Feb 2025 12:10:43 +0100
From: Julien Olivain <ju.o@free.fr>
To: =?UTF-8?Q?Nuno_Gon=C3=A7alves?= <nunog@fr24.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250221135432.9124-1-nunog@fr24.com>
References: <20250221135432.9124-1-nunog@fr24.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <73da5f950550dfa7b5ba1d3e94fc186a@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1740222645;
 bh=rlcnEcMsGXym8T6bgKdPpMs4rlTzEuHQA5kzeGRvDxU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=D3wEoIFBP4qIxMCQ8LeFWuRDW0JGmzwhQm3ulTdBO1tqJz9IDeFfP/2aVIoDyfmct
 N/dtU4J6UbfW9qVP5UFypmVLXcrDXNaud0C4bEz8w9Z7yOo96ZlUoM+bOsdxngoxvA
 R588B2h2JmlIkqg56kNgwsiZvvGAwzsNRiXNXDzencC4alFMy9YXx+RAPabMS6ibeQ
 mwXuhxtbGr5+2ms22qu/aVaVTxJnGwqA0KPmIAV0FEmUoMfwXpA47h21yel89vKo0J
 1DdxisMpK0X2FDTOhsEMFpkUI/Qd0V687100N8cFvOF6Yfmyl6CcX/YiQYdzf5CJHL
 gdFru+LcJsXdQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=D3wEoIFB
Subject: Re: [Buildroot] [PATCH] package/zstd: bump to version 1.5.7
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

T24gMjEvMDIvMjAyNSAxNDo1NCwgTnVubyBHb27Dp2FsdmVzIHZpYSBidWlsZHJvb3Qgd3JvdGU6
Cj4gU2lnbmVkLW9mZi1ieTogTnVubyBHb27Dp2FsdmVzIDxudW5vZ0BmcjI0LmNvbT4KCkFwcGxp
ZWQgdG8gbWFzdGVyLCB0aGFua3MuCgpJIGFkZGVkIGEgbGluayB0byB0aGUgcmVsZWFzZSBub3Rl
LgoKQmVzdCByZWdhcmRzLAoKSnVsaWVuLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJv
b3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxk
cm9vdAo=
