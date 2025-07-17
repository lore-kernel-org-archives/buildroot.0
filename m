Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFF3BC83F1A
	for <buildroot@archiver.kernel.org>; Thu, 17 Jul 2025 20:24:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C306C407A0;
	Thu, 17 Jul 2025 20:24:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eckQeaIqsY4P; Thu, 17 Jul 2025 20:24:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F142E40CDB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F142E40CDB;
	Thu, 17 Jul 2025 20:24:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 389ED1A6
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:24:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1E74180B71
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:24:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3zbuWdhVw0V2 for <buildroot@buildroot.org>;
 Thu, 17 Jul 2025 20:24:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5DDAE80C8A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5DDAE80C8A
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5DDAE80C8A
 for <buildroot@busybox.net>; Thu, 17 Jul 2025 20:24:49 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 55624780511;
 Thu, 17 Jul 2025 22:24:45 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 17 Jul 2025 22:24:45 +0200
MIME-Version: 1.0
Date: Thu, 17 Jul 2025 22:24:45 +0200
To: Francois Perrad <francois.perrad@gadz.org>
Cc: buildroot@busybox.net
In-Reply-To: <20250716123029.1782874-1-francois.perrad@gadz.org>
References: <20250716123029.1782874-1-francois.perrad@gadz.org>
User-Agent: Webmail Free/1.6.11
Message-ID: <c5c2b88ea9fb16dcd2782dca2783013a@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1752783886;
 bh=1vQYdfIBdcq4Opj3QvcgZmS/dGdkiE+/D8h+iT+X5EU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=OSc4wg7ghHHIo8hyGmd5n9rl85KSO6NPHrLPj9Hvh77h0R7kGTxu2hIoMBiHGUyMc
 W5nUnaMBvinp12zjO14zY23J3mW2dmK6UHtF/ll2s71HQMjE8D3Y910XOrwBrKTDCQ
 AlJsxQyoBN9t3cmeiZL5NC8pIWGhtIfccXxivPIF3JxKJpage6FRvY/QYt9MivfBwt
 nV1dGrkI/8MXtKUJQVt9/ZLBnIfzyHp1AeBnqHGiFmHRWepjzPci7carqAUr8zbYeo
 mTLxj6zMNlscoTA+oUhfWXwDCDASV6qtju1hSyAG/GEM9T59MVPoyjMCkb6Caw3AuM
 RRp8yDmN6hMQQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=OSc4wg7g
Subject: Re: [Buildroot] [PATCH] configs/olimex_a20_olinuxino_lime*: bump
 Linux and U-Boot
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 16/07/2025 14:30, Francois Perrad via buildroot wrote:
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
