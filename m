Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81FC1C02198
	for <buildroot@archiver.kernel.org>; Sun, 16 Feb 2025 17:34:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4E40281414;
	Sun, 16 Feb 2025 17:34:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lQpoR1V09h2b; Sun, 16 Feb 2025 17:34:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4F81F8142B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4F81F8142B;
	Sun, 16 Feb 2025 17:34:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6BD19DE
 for <buildroot@buildroot.org>; Sun, 16 Feb 2025 17:34:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5B23340903
 for <buildroot@buildroot.org>; Sun, 16 Feb 2025 17:34:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LKP-Q7yVVkmX for <buildroot@buildroot.org>;
 Sun, 16 Feb 2025 17:34:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 42B254077B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 42B254077B
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 42B254077B
 for <buildroot@buildroot.org>; Sun, 16 Feb 2025 17:34:52 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 8145419F738;
 Sun, 16 Feb 2025 18:34:49 +0100 (CET)
Received: from 2a01:e0a:485:b220:8213:2270:4a8d:a1d5
 via 2a01:e0a:485:b220:8213:2270:4a8d:a1d5 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 16 Feb 2025 18:34:49 +0100
MIME-Version: 1.0
Date: Sun, 16 Feb 2025 18:34:49 +0100
From: Julien Olivain <ju.o@free.fr>
To: Gilles Talis <gilles.talis@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250216153441.2706067-6-gilles.talis@gmail.com>
References: <20250216153441.2706067-1-gilles.talis@gmail.com>
 <20250216153441.2706067-6-gilles.talis@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <482e2e19422b9bb5922b3a381670cdc4@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1739727290;
 bh=ZX2vyTee9MhzAQGOHbCxJgypX1sDyadIWEt/RGsxvpg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=U2qtVTMp1oIU0yYiiZe2ytPuDVhNmlAjFDtMVJp2kPubwXNqxafz08M10XyyUo3R8
 wbJUK1bGWjIEOtV24N3ODZatsD/YSiAKny2sf7AjVc72FH4RI0xw5MrTX3PXxB0UUO
 RXEjaa88B2srUT075NfXY9ESR6U5gWnUgNHehluTdnRvhzeloZONLwpmsaXLtOpVDg
 7G6Zpcn+vn/me0y+WdoH+H+CircP2f8D1ju24VcDjD4N2rrEsL7OwgByNe2VgWRE32
 Ty6MgW1BWPwRslswJ9bItA59KZErglQ+BVRFHbtSUwi1BBedWED7KdecpFUSUinqQ8
 aRfbPLQswqZ7w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=U2qtVTMp
Subject: Re: [Buildroot] [PATCH] package/webp: bump to version 1.5.0
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 16/02/2025 16:34, Gilles Talis wrote:
> ChangeLog (concise version):
> https://github.com/webmproject/libwebp/blob/main/NEWS
> 
> ChangeLog (detailed version):
> https://github.com/webmproject/libwebp/blob/main/ChangeLog
> 
> Signed-off-by: Gilles Talis <gilles.talis@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
