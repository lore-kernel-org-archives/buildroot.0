Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 506D3C83F34
	for <buildroot@archiver.kernel.org>; Sat, 19 Jul 2025 12:45:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EE29884602;
	Sat, 19 Jul 2025 12:45:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Kwt4faDvhye5; Sat, 19 Jul 2025 12:45:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 23EE583AB5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 23EE583AB5;
	Sat, 19 Jul 2025 12:45:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6F5D9DA
 for <buildroot@buildroot.org>; Sat, 19 Jul 2025 12:45:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 523B460D84
 for <buildroot@buildroot.org>; Sat, 19 Jul 2025 12:45:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k92CglbNCTQU for <buildroot@buildroot.org>;
 Sat, 19 Jul 2025 12:45:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 61E1B60C2E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 61E1B60C2E
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 61E1B60C2E
 for <buildroot@buildroot.org>; Sat, 19 Jul 2025 12:45:56 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 473DF19F54D;
 Sat, 19 Jul 2025 14:45:51 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 19 Jul 2025 14:45:51 +0200
MIME-Version: 1.0
Date: Sat, 19 Jul 2025 14:45:51 +0200
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250718183534.1973124-1-giulio.benetti@benettiengineering.com>
References: <20250718183534.1973124-1-giulio.benetti@benettiengineering.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <6d0435682fca7fd01a97cbbf315d9049@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1752929153;
 bh=osZC74yBKzRueczo7PICwazDXIl2xRLl2JEMTrYQn5I=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=SMe5XAt6HkSxllqVhgRDw4NwNK3WpgXz7bxMfRCoqF6p45o3xp2cF8j1gM1blJtko
 aMO2pycSVHm4IN31uLIotRLRzMhRo8wJLnIeOE8DDF3fb7wuEjcMLLDFV4O/tikHfR
 YBBqnkYTSIVUzFhZJD18CL2WOYfSngCP/RTAhLbCFPpiq9yMdHzw7nkHDUZJCulLiJ
 Kw450sA4gEtfZdmAPfj3X2NZR1o4auqAg5WrqMNmsg4PNBwjPaX89tJu+BFhU3WFLA
 jp25Pm5Y3bItpmVrwHacyJCrERJ1NOvcCXRjwKX2B3q/a83HNtkgn/WaapNaJOe9yn
 IebsECdDGCYsA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=SMe5XAt6
Subject: Re: [Buildroot] [PATCH] package/sunxi-mali-utgard-driver: bump to
 version 2025-07-18
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

On 18/07/2025 20:35, Giulio Benetti wrote:
> This version builds up to Linux 6.15.
> URL has moved to github benetti-engineering-sas to let's modify
> accordingly.
> 
> Fixes:
> still not occured
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to master, thanks.

For info, I added extra info in the commit log, see:
https://gitlab.com/buildroot.org/buildroot/-/commit/2bc9a3bf7e154d084ae630bc38972eb8bbcc4cf9

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
