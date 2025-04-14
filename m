Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B12C0C369B2
	for <buildroot@archiver.kernel.org>; Mon, 14 Apr 2025 21:39:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 58B7F60E18;
	Mon, 14 Apr 2025 21:39:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4bWgvKlotVE7; Mon, 14 Apr 2025 21:39:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 95CAF608DC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 95CAF608DC;
	Mon, 14 Apr 2025 21:39:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B05D2200
 for <buildroot@buildroot.org>; Mon, 14 Apr 2025 21:39:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A240540DC2
 for <buildroot@buildroot.org>; Mon, 14 Apr 2025 21:39:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d5mVD41dywIY for <buildroot@buildroot.org>;
 Mon, 14 Apr 2025 21:39:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E333240D89
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E333240D89
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E333240D89
 for <buildroot@buildroot.org>; Mon, 14 Apr 2025 21:39:35 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id A39F45FFB7;
 Mon, 14 Apr 2025 23:39:30 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 14 Apr 2025 23:39:30 +0200
MIME-Version: 1.0
Date: Mon, 14 Apr 2025 23:39:30 +0200
From: Julien Olivain <ju.o@free.fr>
To: Peter Korsgaard <peter@korsgaard.com>
Cc: buildroot@buildroot.org, Bernd Kuhls <bernd@kuhls.net>
In-Reply-To: <20250414205359.1717253-1-peter@korsgaard.com>
References: <20250414205359.1717253-1-peter@korsgaard.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <45b38c05189ed398db75efff6f46e7ed@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1744666772;
 bh=X7AXC1P5v7sKppbZQ4O0E3turtzQ5AXjRT5QStusPYg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=pTk+0Iyz0shMHelAiwTOxlqVTHu8pOBNp0GFCozKTrKAKzvmYJyjK+VDQLvL0p7I7
 ta446L5pXkOz6MWCcgCjhnaGL6a/YQO/ht6PW1zSntyZ3KWvmqdWhuan9DB09wQA/3
 UY/ZXfUZduc+orwvfGTg7u7qEHzl9MvzfqWT34ItAf6IUCtw4sqZB3TnJLPLT+x5Yk
 OOkwn1Mf2ajNnmUbBuiPN0Rd+D7Hu79O9g8pahKjjpB2O750DSRoLKAHBm1FI21mgK
 PCCNKjvAShfdCIeFcxho852hWzLqzAVdOfSBeZxd8cLroDdX2+hpCqLA7nZjoo8jlx
 jqvWelKhSNITg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=pTk+0Iyz
Subject: Re: [Buildroot] [PATCH] package/ghostscript: security bump to
 version 10.05.0
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

On 14/04/2025 22:53, Peter Korsgaard wrote:
> Fixes the following security issues:
[...]
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
