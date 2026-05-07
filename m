Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B5B4CD343F
	for <buildroot@archiver.kernel.org>; Thu,  7 May 2026 20:20:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CDCE7610E1;
	Thu,  7 May 2026 20:20:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A0IIUAbA1xYW; Thu,  7 May 2026 20:20:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0891A60E0A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778185239;
	bh=GC8l21vL4lHox8SP+HFusG6uCb3QqXL9X09KJOvuRLM=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=cfHtYdy5UCfjL0rIfWz2VB6mIlae0SBUIJ8krT19Yj/Ix0meeKqs8FOoRgl9HwOQi
	 71U9BtBTefvkjs5U1pn0gHr3iw4iBPlAD7hPT9FRgw1u12jh1cwrJT6iSRKRTiXMCr
	 rRyqeDEOWNUoQBxCh/ZoAgSqwy0CTX9AhSO00v12slEZZONAXvvyWBgHJJhrcnzFmq
	 fLWXhENJA6r3AjUFeGyBgE+iSDGMWrEiHYzMFLYgqcLQFjJXVbNBCJrJhmwI1cdY4W
	 OP3pTJrQwFsaHfoxxSz8PnGml81NYMIs4/Dy/eHpMXBMYc4+XDITUr3nwteC960ci8
	 Q85E4JxwjGD3g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0891A60E0A;
	Thu,  7 May 2026 20:20:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 21E342FA
 for <buildroot@buildroot.org>; Thu,  7 May 2026 20:20:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 13469411F6
 for <buildroot@buildroot.org>; Thu,  7 May 2026 20:20:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zdKuiJRupoFh for <buildroot@buildroot.org>;
 Thu,  7 May 2026 20:20:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 105E5411F5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 105E5411F5
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 105E5411F5
 for <buildroot@buildroot.org>; Thu,  7 May 2026 20:20:36 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 2879DB00572;
 Thu,  7 May 2026 22:20:34 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 07 May 2026 22:20:34 +0200
MIME-Version: 1.0
Date: Thu, 07 May 2026 22:20:34 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260507174031.4074853-1-bernd@kuhls.net>
References: <20260507174031.4074853-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <3ae7fca231522af435cdb5e95310e47d@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1778185235;
 bh=rlcZ8tpwEaIhk1uC8YtSIzhN1oQBlyBDdnaWwK3GsFs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=f9FdKPH3GpTGP14099OBM7CKQO7zM+/VMGeGoWQ/noqyXZBB1S73rrOEu5+NIKtiX
 Fe8ISxMA+tR2qDkFSs43wo+9zRo6ueUNjbUAjgb2XepeUDu+L02BAljLXD6tGL5SvG
 lqBs+ZcJ+McAF8vn+7Op/iZeWdwCnpXj0ZZjPb5e2EX3mvJuOoE4UMwRdpi7OTq0ew
 0o3vBwWo4791Xrg0rMxkV86bu3zOsQCNrRBGAW4kWjG2+2r4fcd30bMTpPLh0innei
 uqNOhcc7ZHhsMtEF64Pencb9ZaQpBgQvPMu7zAR5BNiszG/h+IzUvLY0VZoHgPU2pZ
 Ip5D11afw/XOg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=f9FdKPH3
Subject: Re: [Buildroot] [PATCH 1/1] package/tor: security bump version to
 0.4.9.8
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

On 07/05/2026 19:40, Bernd Kuhls wrote:
> Version 0.4.9.7 fixes the following security bugs:
> https://gitlab.torproject.org/tpo/core/tor/-/blob/tor-0.4.9.7/ReleaseNotes
> 
> Fixes TROVE-2026-011, TROVE-2026-010, TROVE-2026-009, TROVE-2026-008,
> TROVE-2026-007, TROVE-2026-006:
> https://gitlab.torproject.org/tpo/core/team/-/wikis/NetworkTeam/TROVE
> 
> Version 0.4.9.8 fixes a bug introduced by the bump to 0.4.9.7:
> https://gitlab.torproject.org/tpo/core/tor/-/blob/tor-0.4.9.8/ReleaseNotes
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
