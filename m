Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3D1EC83F26
	for <buildroot@archiver.kernel.org>; Thu, 24 Jul 2025 19:25:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B989641A55;
	Thu, 24 Jul 2025 19:25:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VRxijYjVr5X8; Thu, 24 Jul 2025 19:25:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0025E41A5F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0025E41A5F;
	Thu, 24 Jul 2025 19:25:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4C526B83
 for <buildroot@buildroot.org>; Thu, 24 Jul 2025 19:25:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3252340516
 for <buildroot@buildroot.org>; Thu, 24 Jul 2025 19:25:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x21fnTeVZwbK for <buildroot@buildroot.org>;
 Thu, 24 Jul 2025 19:25:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6443140514
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6443140514
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6443140514
 for <buildroot@buildroot.org>; Thu, 24 Jul 2025 19:25:39 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id D142878035E;
 Thu, 24 Jul 2025 21:25:34 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 24 Jul 2025 21:25:34 +0200
MIME-Version: 1.0
Date: Thu, 24 Jul 2025 21:25:34 +0200
To: yegorslists@googlemail.com
Cc: buildroot@buildroot.org, "Wojciech M . Zabolotny" <wzab01@gmail.com>
In-Reply-To: <20250724061810.3677507-1-yegorslists@googlemail.com>
References: <20250724061810.3677507-1-yegorslists@googlemail.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <4d4ca97e60650a8e054bb3b5bf4da9a1@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1753385137;
 bh=hHP/4O1nY0MNZpexLdl1/djbQKjF8Bdgn6C1HaLhMl0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=FdV3g2XpHYHhfUSeUZ4YnmiFxPDd3PCS2yVWIWaWbWUKukoaeNdv8Fqa8FEWy3ZV+
 SnoabQDmIV9EvZRrdW/+nPsHJWW/iPon22JRyq/7JaymT5WUcdP/BXPcxiSEWe8hsS
 fCl2+DlpmS2+YfnQZuPvvY1j9qzCKQ7Aiw4nwxXixb6UKFXGfTXx2gGEz9ZQQ4YSPv
 g1SyErfUxVFTYYeqPB0ZdT+6bJtI5cH0UrzofsA8uL1K472JnutdkQ3thOagCXXZ9L
 Wpse6fh5DcOkVvwdeJ4iaXcaZbFsUDNjxLxmy/fog2YKsNFWrFA+2g+bPUje78yIah
 Gr/uTXWEaO3MQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=FdV3g2Xp
Subject: Re: [Buildroot] [PATCH] package/avrdude: remove the obsolete hook
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

On 24/07/2025 08:18, yegorslists--- via buildroot wrote:
> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> CMake recipe doesn't create a backup of the avrdude.conf.
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
