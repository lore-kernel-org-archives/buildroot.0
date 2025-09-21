Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44D9FCAC59A
	for <buildroot@archiver.kernel.org>; Sun, 21 Sep 2025 19:35:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 03C604141D;
	Sun, 21 Sep 2025 19:35:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p21vxtI3O5qu; Sun, 21 Sep 2025 19:35:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 366BE41413
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 366BE41413;
	Sun, 21 Sep 2025 19:35:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 834CFD3
 for <buildroot@buildroot.org>; Sun, 21 Sep 2025 19:35:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7538541413
 for <buildroot@buildroot.org>; Sun, 21 Sep 2025 19:35:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bUOLzecOz_PZ for <buildroot@buildroot.org>;
 Sun, 21 Sep 2025 19:35:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 80C7D413FE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 80C7D413FE
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 80C7D413FE
 for <buildroot@buildroot.org>; Sun, 21 Sep 2025 19:35:53 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id EAB51B0055E;
 Sun, 21 Sep 2025 21:35:49 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 21 Sep 2025 21:35:49 +0200
MIME-Version: 1.0
Date: Sun, 21 Sep 2025 21:35:49 +0200
To: Raphael Pavlidis <raphael.pavlidis@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250921184708.557546-1-raphael.pavlidis@gmail.com>
References: <20250921184708.557546-1-raphael.pavlidis@gmail.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <fc4c4fd79128bb1e0402ad261dc5cab5@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1758483351;
 bh=0hx77uBPs6rHEU/emZpQ8gimtUqgnkANb8/mLLL6ju8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Cv0kKv7wgQgT0A3fU07BMphHSQJkQ3DM2FyXEI3XMLtTxFQAlTCzW98Mbicx40+It
 GKzi8ZHKiNgUgLOvdm344SdzOmPW4MU+8j5tMRSPTswVPocgtqBhaw7i+Y+bDryLZP
 fGZZnKan0AmLxImTIlJqsOSe5xA/mkfm06XZwrl8HojhZkzPGSWAl2A5VCLhQ6kaqT
 S35UxTXbJOfWd/AtvxAAPRyGt4ec0FdD9QfzRuCkoRi327pBoU+6n3bL6o/eFg1wbC
 PruZF57y5i5ilXO0JzFVgU8tm+qqD4YTBR3Mmsw76qLpConB/Fww7aLMNK3qRNAwxd
 QCaP2bwtAQmRw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Cv0kKv7w
Subject: Re: [Buildroot] [PATCH v1 1/1] package/shadow: bump to version
 4.18.0
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

On 21/09/2025 20:47, Raphael Pavlidis wrote:
> Changelog:
> https://github.com/shadow-maint/shadow/releases/tag/4.18.0
> Signed-off-by: Raphael Pavlidis <raphael.pavlidis@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
