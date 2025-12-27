Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A13AE92716
	for <buildroot@archiver.kernel.org>; Sat, 27 Dec 2025 21:39:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5A2C740661;
	Sat, 27 Dec 2025 21:39:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FVJXs4LJIixb; Sat, 27 Dec 2025 21:39:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B9E5540638
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766871575;
	bh=D1VEmuTQu2IIIb4R3gKms4sLYvasoO36UHiJYI3X4Ro=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=QxXQFgeDayDhqU4cfAhaeK6qR2cp5EpUuhIG3UEkK0GRZ5F0u1XzSVYwjF/cevoHX
	 XfkkysoD3WyIEzQNyiUhR5RoAiKxZBigMuUbOSmReBwWF2f/YTVbDapZ6zI9rHXTxn
	 9q5shm6/j2RKgniwGPsG4DYMeztbywHejsyOrPW5H9/SzpI1zdgTGJYpgzixEgwjGB
	 NFIU5heoyVHCjGn1+IJzRxch4ygGtG+tqdkyA52Jxf/5rfvjmus/g9KUA6iVppSSTF
	 oaFevYlLk7N5Y8DQqT9vgmSiQfQl0dlOiLDCoYBw7enETf9VH51hjFkr+jUz7x/rW9
	 gShhzYbcsim9Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B9E5540638;
	Sat, 27 Dec 2025 21:39:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2DCE4119
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 21:39:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 18F9780F54
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 21:39:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 32iuC1QdUa77 for <buildroot@buildroot.org>;
 Sat, 27 Dec 2025 21:39:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2D1C680D25
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2D1C680D25
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2D1C680D25
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 21:39:33 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 5F1265FFAA;
 Sat, 27 Dec 2025 22:39:29 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 27 Dec 2025 22:39:29 +0100
MIME-Version: 1.0
Date: Sat, 27 Dec 2025 22:39:29 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org, Sergey Matyukevich <geomatsi@gmail.com>
In-Reply-To: <20251214211534.2541224-1-giulio.benetti@benettiengineering.com>
References: <20251214211534.2541224-1-giulio.benetti@benettiengineering.com>
User-Agent: Webmail Free/1.6.12
Message-ID: <5c8413af4f66767e5c3b1f4e0853aabb@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1766871571;
 bh=mB2wt/Jf2sDvmK/AjD4iQ978HZN5ykgXIoC1UruhRnY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=JvDqfYwnMOUCD5vesuSPRH7oA/xmHyH9xD5yNSujpjdTtxNgohZ/5xZCPF9K6G9rS
 wmNppX16zlKQLV+Sx/nn0QFhtrX209nuh2+4zqqhsfKMhE3y/ZEKNuEcbslc89Xu4a
 kN/7uORFsJz7g7bCVp7tEfDontuUiS1YhvM1anVj0hOvVeqJPapwjZynlNcvxXqLBg
 9xbcceJj6HWDiCMicOQodRQUwC6hR5xuMjT6S8hfCAGnxzLgB/eeVzbLiOe4LsmnZS
 ByPeJWw6sE97KqBkRTeAAWJthdq2euf5sKqD410K3IK3VXy8fQ7bPZJBppUEQeHPsf
 QuNHkcmiZvlcQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=JvDqfYwn
Subject: Re: [Buildroot] [PATCH] package/xr819-xradio: fix build failure due
 to local patch
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

Hi Giulio,

On 14/12/2025 22:15, Giulio Benetti wrote:
> Local patch hasn't been removed while bumping package version resulting
> into build failure. So let's drop local path to fix build failure.

You are not saying which Buildroot commit bumped the package version 
without
removing the package patch. I believe you are referring to:
https://patchwork.ozlabs.org/project/buildroot/patch/20251012223047.3323531-1-giulio.benetti@benettiengineering.com/

This patch was not merged in Buildroot, until now.
I just applied it in:
https://gitlab.com/buildroot.org/buildroot/-/commit/d60dc5e6184dd2740fb33f6bc7aa8c6a76b35d7b

So I believe this patch is not needed anymore.

> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
