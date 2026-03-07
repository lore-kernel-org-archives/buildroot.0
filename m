Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9332FC9EDA
	for <buildroot@archiver.kernel.org>; Sat,  7 Mar 2026 10:08:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7245E84264;
	Sat,  7 Mar 2026 10:08:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X19L7jI2F3bs; Sat,  7 Mar 2026 10:08:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3AAFF84250
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772878132;
	bh=qTKzpF2LFaImiW5RUfAJK3AYSIqcQWYCgD6lR6iCx+M=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=g8K99akxsbLNLHj74Wi1WqbklduUxJjUPidaWahgvKyGeA93/1+WW2ScYkLbQATGG
	 xLqCmQLHLAnK6e/8sj+87DhY0U1FR+sKDdrvlxVp8UaHeGI4US6RbhAiZpqEpQ1w3m
	 p+6u5QUKY2GXX8jBBg/ornJs4WRxJTj7aqtVFMZAZT2pKS6eXH5FgQs5lPCtpus1Mp
	 2y2v2887F4UEXZDsG/Xl2xD55YLkeXa92Z8wvaZ8RLgQ4VXVseQyRVWX+Y8N+Yhfb5
	 JvT7P946ObKsGnY1H164PPdt3TvAYm0r80opRZuW5acDC8z4G/vonWoEGutkA0/0Oe
	 Pt9lonoWgRWYA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3AAFF84250;
	Sat,  7 Mar 2026 10:08:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1A4C6223
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 10:08:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 008CE41C60
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 10:08:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kRJaZlnrqWLp for <buildroot@buildroot.org>;
 Sat,  7 Mar 2026 10:08:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org F120C41E6B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F120C41E6B
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F120C41E6B
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 10:08:48 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id E3B8C5FFB4;
 Sat,  7 Mar 2026 11:08:44 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 07 Mar 2026 11:08:42 +0100
MIME-Version: 1.0
Date: Sat, 07 Mar 2026 11:08:42 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Joseph Kogut <joseph.kogut@gmail.com>
In-Reply-To: <20260304180755.3735471-1-james.hilliard1@gmail.com>
References: <20260304180755.3735471-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.13
Message-ID: <7db81d264235bd7b783e5bff6cc20d9e@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1772878127;
 bh=UnRl99QpauxsASXYA4xikpn6bozNrEGAMiorpKY9RyE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=A9ZZOw0pgjRU3oZObzTx5wGfj2Bw+yTyOkQwfbMDf8XTcnXo1mutXRsXY8kuUCltf
 8fde3wnN+A/Fl3WXOGiH+ZWNIEB1r/uKt4WGbSTsn6VJjSSzG0q7GEr2FDkRT0M2G2
 6FIe+g+1m9hqeRHm5uS4LquEQhFq3MWvuxsSHtpnUbcTMXVsOdNvsfqiRe/G1jO1zj
 ydsVxnV2xaQz77sX2G/WyWozHuNrAz55aOwccMAcx/PQjnOfFK+J+ACSzx9aVavK6p
 cah0Jqi4PSg2KtoRo14YUGcdQdyQ7gVy1uUmGtV3ZcEfYSrRonolRdLS5dJfOM481g
 NY/u5OOoFe7VA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=A9ZZOw0p
Subject: Re: [Buildroot] [PATCH 1/1] package/python-sentry-sdk: bump to
 version 2.54.0
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

On 04/03/2026 19:07, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
