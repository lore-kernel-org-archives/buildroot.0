Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77966CCFA00
	for <buildroot@archiver.kernel.org>; Sat,  1 Nov 2025 18:35:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1E6F441BCC;
	Sat,  1 Nov 2025 18:35:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X952ptRDTUsT; Sat,  1 Nov 2025 18:35:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 50EB241BC4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 50EB241BC4;
	Sat,  1 Nov 2025 18:35:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 28A0793D
 for <buildroot@buildroot.org>; Sat,  1 Nov 2025 18:35:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 19E5241BC4
 for <buildroot@buildroot.org>; Sat,  1 Nov 2025 18:35:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MGzlBJDTf28l for <buildroot@buildroot.org>;
 Sat,  1 Nov 2025 18:35:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 561EF419AB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 561EF419AB
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 561EF419AB
 for <buildroot@buildroot.org>; Sat,  1 Nov 2025 18:35:17 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id B4CE813F879;
 Sat,  1 Nov 2025 19:35:13 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 01 Nov 2025 19:35:13 +0100
MIME-Version: 1.0
Date: Sat, 01 Nov 2025 19:35:13 +0100
To: Peter Korsgaard <peter@korsgaard.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20251014061621.80231-1-peter@korsgaard.com>
References: <20251014061621.80231-1-peter@korsgaard.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <226adbc8fb8e18f3896f4ea068db74f1@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1762022114;
 bh=NRz+PmIOhOUGxY1v6686Db3nYxRUoPkikgRmRSFujys=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=DaOlWooK0GA4ZDNb/PAq21PiN70HRSoGzjEZjYdivFpIq+3Sc/1O0RbfCHOCVyqYR
 +x4fgCCV6SjVqoOSMWfyEXR7rMHHic7NBTet03X/g9wDaTmEZCq+qtD5wxBm8pPFa1
 J8Izd8ZvAQGGmQcAP24LJuBpAYRVtt5p3Mz+45+gZ5PnjfyY2B3uBjmi9Znvw2FRKG
 SFjrXpJAVowkGjpbX/yAwovO0T6ctzb7XZXya/7kQvpNoyK1CJ8fNgdkfUXfOomFKP
 U/iayUgY2NYz80vUYC+NpqXJ29RzaTL4SJjuo7qsJHV778+PSIhPcWD41oNPfjudL4
 DiHz6xjo+KrZQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=DaOlWooK
Subject: Re: [Buildroot] [PATCH] package/gstd: bump to version 0.15.2
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

On 14/10/2025 08:16, Peter Korsgaard wrote:
> Bugfix release:
> https://github.com/RidgeRun/gstd-1.x/releases/tag/v0.15.2
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
