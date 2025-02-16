Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56780C02198
	for <buildroot@archiver.kernel.org>; Sun, 16 Feb 2025 17:24:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E96CD4080F;
	Sun, 16 Feb 2025 17:24:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G-BErXksop82; Sun, 16 Feb 2025 17:24:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DA16940813
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DA16940813;
	Sun, 16 Feb 2025 17:24:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 05DEC72
 for <buildroot@buildroot.org>; Sun, 16 Feb 2025 17:24:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E91624083F
 for <buildroot@buildroot.org>; Sun, 16 Feb 2025 17:24:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IZCkdrCpLI1m for <buildroot@buildroot.org>;
 Sun, 16 Feb 2025 17:24:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D6C234080F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D6C234080F
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D6C234080F
 for <buildroot@buildroot.org>; Sun, 16 Feb 2025 17:24:00 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 87C7F78035B;
 Sun, 16 Feb 2025 18:23:56 +0100 (CET)
Received: from 2a01:e0a:485:b220:8213:2270:4a8d:a1d5
 via 2a01:e0a:485:b220:8213:2270:4a8d:a1d5 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 16 Feb 2025 18:23:56 +0100
MIME-Version: 1.0
Date: Sun, 16 Feb 2025 18:23:56 +0100
From: Julien Olivain <ju.o@free.fr>
To: Gilles Talis <gilles.talis@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250216153441.2706067-3-gilles.talis@gmail.com>
References: <20250216153441.2706067-1-gilles.talis@gmail.com>
 <20250216153441.2706067-3-gilles.talis@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <a536283f70715b8bc24aaddc073b757a@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1739726637;
 bh=s7HN4SfknziuS8ObPwUd1bTux5+avV8DFiQDUrwbt54=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=BLqIFf0oya8aUI0D3QQFmsbxRTTg+xT3oFhw8WCusevAsjbsmUdey4BlZ5TuckT4h
 Ro/n82Jiomt9u8K4Xy/02IbIwOzy28XjRwYJ4J6zlyJnupTtNjW6ge6dhu7tot7P2e
 R2vCxrRvTcm1FtgNgPgfIK+0M+E895LYyI7f5acblkY7C5+d5zCAw5e2jAXSlVbGF2
 OBQ9HhCo6q1j0adi89EFqHLCTt6XGVTcZ2DjSBxftPyN3wtSSdfzEb09lxaus3C87J
 DSNZwuzAXt6DQ3eZm4UZI2Oj7O+2bIxMHWgJhLxMuxhPGWvVKjkzKmPegFp6xcF19f
 AdexcVpOe7RWA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=BLqIFf0o
Subject: Re: [Buildroot] [PATCH] package/httping: bump to version
 ffb9201042813c58d020df41697f6445df96f438
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
> Use the latest upstream verified commit.
> Also fixes multiple issues like:
> https://autobuild.buildroot.org/results/fe33a0d9cfa242cbcda0c5fb759b84efc6662097
> 
> that were due to the usage of OpenSSL deprecated routines
> (ERR_remove_state and ENGINE_cleanup)
[...]
> Signed-off-by: Gilles Talis <gilles.talis@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
