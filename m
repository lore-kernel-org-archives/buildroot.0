Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4FF3107BCE2
	for <buildroot@archiver.kernel.org>; Fri, 13 Mar 2026 21:42:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 94B4B40EB1;
	Fri, 13 Mar 2026 21:42:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bPQ7iEvb9Frh; Fri, 13 Mar 2026 21:42:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E230440E97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773438144;
	bh=CCGKhP5V39//ZpYvnuekb6CLpRHTaujBKLLImjqvvUg=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=i6liuwL9DuTBnS7lc3b447/8bKel6+VJ5EQhnLykdBsVIsCm+PGIKZt5qiE03gP7j
	 zHklAf406wC/979T1RFtEFJ0y1lnFnqRzllxPPpLY1oWL++aXaQk6wiKBm41r0jdHI
	 kD6qpf6eoBBoIi9HHN50wl3Y+8rNWy/hRrYe/28XpLZs0yxCO0nePsgvaFTFEeR5yg
	 G2XRluzWNjf+IU6L5RX7vF0YuJgo4GmaX2WtwJmvtsKniFgU8vxY+vlkRYRUxNTrED
	 Y6zu2P0zj6EGzXvmRY0F4ZRlcZ2UNqLHffMSQDDDm+pwQkvOSEeP7Hzixc7jnO0+rK
	 qATcK/twxxTqw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E230440E97;
	Fri, 13 Mar 2026 21:42:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 77A73786
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 21:42:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5D503814BF
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 21:42:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OEmKB2w6hrBM for <buildroot@buildroot.org>;
 Fri, 13 Mar 2026 21:42:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8520A814BC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8520A814BC
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8520A814BC
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 21:42:21 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 3D183B00563;
 Fri, 13 Mar 2026 22:42:18 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 13 Mar 2026 22:42:18 +0100
MIME-Version: 1.0
Date: Fri, 13 Mar 2026 22:42:18 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20260313205720.4037961-1-giulio.benetti@benettiengineering.com>
References: <20260313205720.4037961-1-giulio.benetti@benettiengineering.com>
User-Agent: Webmail Free/1.6.13
Message-ID: <b77836fcb8ae87d57f41b445646f6d60@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1773438139;
 bh=sJ/YY0i0b7UASfO6PzcUe/307jou1VDCwCRR3xqh6Wk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=S7MoCz6x4oMcIjrWZ7EjihLBKq1bRrBNDsSg3LuVe8BHOOO5X3NJFNBAmBwWgMNkS
 3r9YWBtYfCzi9rG/anZPlpBtP0JzPhstCo4MGuB5Eo+rck8UNNNHfgqOyMZ1R/h6k1
 s8r9aotV4kABP/Hi/p5XRRgQQxlD3VKasvebYeF7gRm0xmtKtVFWFYNYybLDOBH6V0
 7mL3lqB1TBDdobRCsOEAs3utT5oH1G2sV7j9JNSrU4SSxRRSHiEt6+5dmceyoi3mqV
 kfR6vaMyqm1UaBAxAnCN8xdQ94aoJ/IiR+qh92l6j4N967aOfwWRZNtMnJnOF9Zps9
 r1s9vDxCWc3Fw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=S7MoCz6x
Subject: Re: [Buildroot] [PATCH] package/harfbuzz: bump version to 13.1.1
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

On 13/03/2026 21:57, Giulio Benetti wrote:
> https://github.com/harfbuzz/harfbuzz/blob/13.1.1/NEWS
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
