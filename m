Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3BB2CCD1A5
	for <buildroot@archiver.kernel.org>; Sun, 26 Oct 2025 16:38:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 64AC460B0C;
	Sun, 26 Oct 2025 16:38:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lpAowbh5xUSS; Sun, 26 Oct 2025 16:38:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 27AB460AA5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 27AB460AA5;
	Sun, 26 Oct 2025 16:38:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5E5CA15F
 for <buildroot@buildroot.org>; Sun, 26 Oct 2025 16:38:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 509244009E
 for <buildroot@buildroot.org>; Sun, 26 Oct 2025 16:38:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W1XZdH4a2Q_B for <buildroot@buildroot.org>;
 Sun, 26 Oct 2025 16:38:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 374E940080
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 374E940080
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 374E940080
 for <buildroot@buildroot.org>; Sun, 26 Oct 2025 16:38:20 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 83DF8B00539;
 Sun, 26 Oct 2025 17:38:17 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 26 Oct 2025 17:38:17 +0100
MIME-Version: 1.0
Date: Sun, 26 Oct 2025 17:38:17 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20251025070552.3338312-1-bernd@kuhls.net>
References: <20251025070552.3338312-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <3b768b43987dc2d752f494d125e29c58@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1761496698;
 bh=Km7OLSMjUlUmMBp4EmijLN3gnQiTKDKK78s3oBKkuW0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=P16Sqmak71aBAp1t/PGk7Dgr0rv863dyj+xWe+wOtDNDhkLPjzlxfzmKdstraBvPa
 4+Y3UbeOafQZBEqImZPoO9ZxYSfM610zOhs2LXsUFT34hzZSDxwolMc56N/X9m3PAd
 yxMo0dI449Uh5RHCGxT4NnIBemV5lWUQansLWpX++HTlkHhYH3930gtho07v71z33g
 CpxxYVNbKRroUQWdUwAwBNzuwQxPDnrBQPtG79r6IhvnuHOIJKRW//SGm42yW3iS7y
 MrZynEml0C2NarPIoAMumgWWuJM8VYEVYPOrP2qRzqXuAEGqE86/K6Hj8360A+mV8J
 wvvZwBrEVKy7g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=P16Sqmak
Subject: Re: [Buildroot] [PATCH 1/1] package/php: bump version to 8.4.14
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

On 25/10/2025 09:05, Bernd Kuhls wrote:
> Release notes:
> https://www.php.net/releases/8.4/en.php
> https://news-web.php.net/php.announce/471
> 
> Changelog: https://www.php.net/ChangeLog-8.php#PHP_8_4
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
