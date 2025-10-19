Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BB87CCD183
	for <buildroot@archiver.kernel.org>; Sun, 19 Oct 2025 11:24:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5B8C382049;
	Sun, 19 Oct 2025 11:24:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d0mJ4lZacQMC; Sun, 19 Oct 2025 11:24:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1853281FD0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1853281FD0;
	Sun, 19 Oct 2025 11:24:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 911EE1CC
 for <buildroot@buildroot.org>; Sun, 19 Oct 2025 11:24:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7780F40A76
 for <buildroot@buildroot.org>; Sun, 19 Oct 2025 11:24:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q_oDGL6IU5MN for <buildroot@buildroot.org>;
 Sun, 19 Oct 2025 11:24:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4951B40A11
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4951B40A11
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4951B40A11
 for <buildroot@buildroot.org>; Sun, 19 Oct 2025 11:24:13 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 0798313F861;
 Sun, 19 Oct 2025 13:24:09 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 19 Oct 2025 13:24:09 +0200
MIME-Version: 1.0
Date: Sun, 19 Oct 2025 13:24:09 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Eric Le Bihan <eric.le.bihan.dev@free.fr>
In-Reply-To: <20251015193121.1386613-1-bernd@kuhls.net>
References: <20251015193121.1386613-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <a68c05bea98070eb4c5021033b05120e@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1760873052;
 bh=KeR5qAGagibjbijxrPGArTuE/EwCACg8VdDTLLv6yns=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=A0bSPrcenznIDi52gNaGR4OTiDRhuzCrbeU5OI2LCTYjW4jOqztzHC+exm4BETs+C
 ByYdrbhWEk+OI6R6PyiRQe/53AfBjjbvZOqDQQGStH6W+vFSM41hy2ZV8F1jUIlcoc
 HS0qg1VlEAk72nAvLqCd+8nqqJ/3jeaSFjn+ygJIfHCyV9004lQO9B0EBuj9v2mL5T
 8heTW3Ln4DQ9pZ6gDUzfk99QeiHUDZrCgMLnuOOECteblq9GGnerN7CFRH6GkNBiJY
 oyTFx1gi++m8wydkcG9Sh/x7niNNSrL5zrrGUOGcY1qyWdjrVlw4rE4zweCdLlk5He
 uvXYy/isOGHeA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=A0bSPrce
Subject: Re: [Buildroot] [PATCH 1/1] package/nvme: bump version to 2.15
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

On 15/10/2025 21:31, Bernd Kuhls wrote:
> Switched build system to meson and added dependency to libnvme:
> https://github.com/linux-nvme/nvme-cli/releases/tag/v2.0-rc0
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
