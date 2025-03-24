Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E279C36002
	for <buildroot@archiver.kernel.org>; Mon, 24 Mar 2025 20:35:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DBD3A40BD9;
	Mon, 24 Mar 2025 20:35:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0S6kBFHz00Fd; Mon, 24 Mar 2025 20:35:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2B0B94038E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2B0B94038E;
	Mon, 24 Mar 2025 20:35:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id BE834E0
 for <buildroot@buildroot.org>; Mon, 24 Mar 2025 20:35:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AFF9480E0A
 for <buildroot@buildroot.org>; Mon, 24 Mar 2025 20:35:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Zz9YKyNcN54I for <buildroot@buildroot.org>;
 Mon, 24 Mar 2025 20:35:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C279F80A7A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C279F80A7A
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C279F80A7A
 for <buildroot@buildroot.org>; Mon, 24 Mar 2025 20:35:02 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 0F768B00579;
 Mon, 24 Mar 2025 21:34:59 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:53814])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 24 Mar 2025 21:34:59 +0100
MIME-Version: 1.0
Date: Mon, 24 Mar 2025 21:34:59 +0100
From: Julien Olivain <ju.o@free.fr>
To: Maxim Kochetkov <fido_max@inbox.ru>
Cc: buildroot@buildroot.org
In-Reply-To: <20250324071254.173452-1-fido_max@inbox.ru>
References: <20250324071254.173452-1-fido_max@inbox.ru>
User-Agent: Webmail Free/1.6.10
Message-ID: <cc51107151767895e0f8d7f123bb527e@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1742848501;
 bh=T5iePxGUqqU+yyrlUn5pg2IIrJKUAGRLJqIZH8YNLKA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Z5eWIVvC4s0Q46gvy8bZtavZG6uyahQtvkV8QUNWAxK2uUtXKUYTMUcaTnhVYC36L
 0LevGbNvlVYtpnep08efyqVbZQVIDmxW9m2tLquhVkinwcBrA5qIM4GoKI4I1a9xVv
 3Cbdyfdzb1XzE50CIgBaBDzoZ6tOGaaHGIAKUr9OTtQxrswdRUb7Tt8Fvt+e+qbhRG
 ChNwuUiUkyJEnJ2ji4ESMhHP91rkWMwfMAGcRw10lWZgy98hikITj07dKpLoliZhRM
 K7JHagjZdO+JpO/EeUp+hnVWPCARDCSzm7/t/iJ2/hMpDk4naI/hMUTbK+mq0I+MaM
 CpFzZo02E88LQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Z5eWIVvC
Subject: Re: [Buildroot] [PATCH 1/1] package/libgeos: bump version to 3.13.1
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

On 24/03/2025 08:12, Maxim Kochetkov via buildroot wrote:
> Changelog: https://github.com/libgeos/geos/releases/tag/3.13.1
> 
> Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
