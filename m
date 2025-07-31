Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA558C87FCC
	for <buildroot@archiver.kernel.org>; Thu, 31 Jul 2025 13:03:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 81EB94290E;
	Thu, 31 Jul 2025 13:03:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cB9w9lBQ_edI; Thu, 31 Jul 2025 13:03:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ACB3842905
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id ACB3842905;
	Thu, 31 Jul 2025 13:03:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0DBC0160
 for <buildroot@buildroot.org>; Thu, 31 Jul 2025 13:03:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F405361539
 for <buildroot@buildroot.org>; Thu, 31 Jul 2025 13:03:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TS6QjqtmZ_sP for <buildroot@buildroot.org>;
 Thu, 31 Jul 2025 13:03:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1BDE260888
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1BDE260888
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1BDE260888
 for <buildroot@buildroot.org>; Thu, 31 Jul 2025 13:03:32 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id E743B2003DD;
 Thu, 31 Jul 2025 15:03:24 +0200 (CEST)
Received: from [192.214.236.6:49058] via [192.214.236.6] by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 31 Jul 2025 15:03:24 +0200
MIME-Version: 1.0
Date: Thu, 31 Jul 2025 15:03:24 +0200
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, Kadambini Nema <kadambini.nema@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>, Romain Naour
 <romain.naour@gmail.com>
In-Reply-To: <20250730202455.1059438-1-thomas.petazzoni@bootlin.com>
References: <20250730202455.1059438-1-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <7cbb7926b7f6a185c80255d11d93068d@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1753967009;
 bh=HbWDzWER1sMrrsa7e1ift2sYWQlzlPcR75TAKocAWaI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=F7auc1100QEZcx/yHHWIsDgelL9nk/D+ij0a74LrYLBRGrFPVQHMhHKV3BoDgyCci
 r7CE/4TSsYzF/1r3oLcIaPht9tziaBWkg3uMJQeJlfhGxXFo4pGReQzUW+TYc6rWPv
 yJl6K7h9pmCnKyZ1sc7QTtH2Kwe86LcRC6KrWJ5yneiMCys4QTugy7vq1NWgkpREbx
 w8+wMJMmLz7iFNq9yRl89rOVAqz4UANTkydObg2wxbwvKlJ/S8ZYqozddIR8kXrpbP
 zlk6kgXEMaYzuYxderwcabPZyrJf4IhfEXm2JzqcX95XuVxsYp7IbAt572dtgRNnAV
 n+6lhOAN0rszQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=F7auc110
Subject: Re: [Buildroot] [PATCH] package/gcc: drop stale 13.3.0 patches
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

On 30/07/2025 22:24, Thomas Petazzoni via buildroot wrote:
> Commit 0b8b72d2fe2c8fa6a9d2859ceb8d29b6389cf894 bumped gcc 13.x from
> 13.3.0 to 13.4.0 but forgot to drop the gcc 13.3.0, so let's remove
> those patches.
> 
> Cc: Kadambini Nema <kadambini.nema@gmail.com>
> Fixes: 0b8b72d2fe2c8fa6a9d2859ceb8d29b6389cf894
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
