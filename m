Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 221D5C369AB
	for <buildroot@archiver.kernel.org>; Mon, 21 Apr 2025 16:09:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DB888403E5;
	Mon, 21 Apr 2025 16:09:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Lf8XIwpZBEam; Mon, 21 Apr 2025 16:09:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2C110403FB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2C110403FB;
	Mon, 21 Apr 2025 16:09:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3DEB51A0
 for <buildroot@buildroot.org>; Mon, 21 Apr 2025 16:09:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3B5F940445
 for <buildroot@buildroot.org>; Mon, 21 Apr 2025 16:09:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xQoKRSJh6e9q for <buildroot@buildroot.org>;
 Mon, 21 Apr 2025 16:09:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 922FC403D7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 922FC403D7
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 922FC403D7
 for <buildroot@buildroot.org>; Mon, 21 Apr 2025 16:09:50 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 9D0BF2003CE;
 Mon, 21 Apr 2025 18:09:46 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 21 Apr 2025 18:09:46 +0200
MIME-Version: 1.0
Date: Mon, 21 Apr 2025 18:09:46 +0200
From: Julien Olivain <ju.o@free.fr>
To: =?UTF-8?Q?Rapha=C3=ABl_M=C3=A9lotte?= <raphael.melotte@mind.be>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>
In-Reply-To: <20250415151755.865635-1-raphael.melotte@mind.be>
References: <20250415151755.865635-1-raphael.melotte@mind.be>
User-Agent: Webmail Free/1.6.10
Message-ID: <fea1263b8a3561813b4beb18f1681da3@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1745251788;
 bh=LBTaZV0xqS0yBJj4zWDmiWSdAIkKgmeeDomgwUi776U=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=JsII+41VilHYv1srvkY6uuzmammBqszUqhlrAz1SOf09qPH30aRMlPw3NTh/Cv+SQ
 yBPdkIAqanhku6/MV2LSyWwUw45201MnsIiIevNp+dhhS/nPNx/z5DJSCp+aQoa0N1
 I4cBsrhKDbfAUmwJ1KKqv6gqCMSZ8831Fd9qFEm4UoZYkHStsRs2Bn00h5y7ReAPms
 5tMOHxTsg9DETHmmI9LXOE8svAnvIg2Tt8NqjvhW5+iOTuroJBmvN4ot3tYrGkzrkd
 JE7J77sJPcMJvO10rhOf+RHEr3rewisme0lKlknCgBpD6juoJUMQ4Pf7Ay8ZiubFdg
 8xf5hk1BcM/7w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=JsII+41V
Subject: Re: [Buildroot] [PATCH 1/1] package/python-s3transfer: bump to
 version 0.11.4
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

T24gMTUvMDQvMjAyNSAxNzoxNywgUmFwaGHDq2wgTcOpbG90dGUgdmlhIGJ1aWxkcm9vdCB3cm90
ZToKPiBTaWduZWQtb2ZmLWJ5OiBSYXBoYcOrbCBNw6lsb3R0ZSA8cmFwaGFlbC5tZWxvdHRlQG1p
bmQuYmU+CgpBcHBsaWVkIHRvIG1hc3RlciwgdGhhbmtzLgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9v
dEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2J1aWxkcm9vdAo=
