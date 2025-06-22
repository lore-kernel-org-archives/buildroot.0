Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 188ACC7115A
	for <buildroot@archiver.kernel.org>; Sun, 22 Jun 2025 10:10:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C436140896;
	Sun, 22 Jun 2025 10:10:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c-eYoMm67j47; Sun, 22 Jun 2025 10:10:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 14EA64090B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 14EA64090B;
	Sun, 22 Jun 2025 10:10:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 890DD12C
 for <buildroot@buildroot.org>; Sun, 22 Jun 2025 10:10:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6FB7481DF0
 for <buildroot@buildroot.org>; Sun, 22 Jun 2025 10:10:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RiCZa3JzMJI7 for <buildroot@buildroot.org>;
 Sun, 22 Jun 2025 10:10:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9DE3281C19
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9DE3281C19
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9DE3281C19
 for <buildroot@buildroot.org>; Sun, 22 Jun 2025 10:10:14 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 21D9419F5A5;
 Sun, 22 Jun 2025 12:10:08 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 22 Jun 2025 12:10:08 +0200
MIME-Version: 1.0
Date: Sun, 22 Jun 2025 12:10:08 +0200
From: Julien Olivain <ju.o@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Kieran Bingham
 <kieran.bingham@ideasonboard.com>, Marcus Folkesson
 <marcus.folkesson@gmail.com>
In-Reply-To: <20250621173125.4042686-1-bernd@kuhls.net>
References: <20250621173125.4042686-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <0348f71ce650bc93737e88174f270655@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1750587011;
 bh=BCyyYdu9d9NR1k+/avlVrOraBxB+6YXzuvrBGbBxK4s=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=oXiZ5oE2qaKr+ED8N8yuEBFWWTXCDnmrzHyxqoVXzzQOTSy9tM/gicKyurmoW1I2E
 PBFhKmr2PAR9Hm6PKLISkrgb/z69bg5Mmf/XyYNIv6NR+WXWfYK6r5ACFalffqAWY7
 QQbTwTj/Fm1M/MBgq5UL0MIyZRBFmRzojB8bpTVMfXP/V6sX8SkUhFBfUf/J6zf3g2
 Qqhp9J/i4u/UTUsAiI6lFJJu21Y7A1S/JTx9PDG8NySOUTqvYCaoD5LryWbfHUyl/v
 bJ4WV6H9/yNthjdFKHoqRuON3tNXeL+AYvpB9g9cRnA9Pzddze0IStPfhNEGUguDpl
 7RAnTqix3TJOA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=oXiZ5oE2
Subject: Re: [Buildroot] [PATCH 1/2] package/libcamera: bump version to 0.5.1
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

On 21/06/2025 19:31, Bernd Kuhls wrote:
> Removed patches which are included in this release.
> 
> Release notes: https://git.linuxtv.org/libcamera.git/tag/?h=v0.5.1
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
