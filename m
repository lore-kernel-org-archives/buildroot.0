Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 727FEE7719A
	for <buildroot@archiver.kernel.org>; Sat, 11 Jan 2025 18:35:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2458181163;
	Sat, 11 Jan 2025 18:35:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PRl4g2BGn0nZ; Sat, 11 Jan 2025 18:35:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4487E811D3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4487E811D3;
	Sat, 11 Jan 2025 18:35:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 95DD7940
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 18:35:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 80590400F9
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 18:35:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 931xy3nD5CZr for <buildroot@buildroot.org>;
 Sat, 11 Jan 2025 18:35:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B80FC40017
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B80FC40017
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B80FC40017
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 18:35:08 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id E5F8513F8A9;
 Sat, 11 Jan 2025 19:35:05 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:50694])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 11 Jan 2025 19:35:05 +0100
MIME-Version: 1.0
Date: Sat, 11 Jan 2025 19:35:05 +0100
From: Julien Olivain <ju.o@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250111161654.2871290-1-james.hilliard1@gmail.com>
References: <20250111161654.2871290-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <fdf88faa2309ed720e3033d2bc9f26d1@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1736620507;
 bh=MzYEr0htcZtP+CM3/Yc1VTeIFjG64yk5wQbqcoJ2yt8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=pdiSJV/ZleTyrQFVj/xDEbJHLCl/n/Q9XMrH3kZJJsdVFkJjsoN5aZVky39TtgJt1
 C0HfgRzFqKm2I/yCevDvQSNDp03xt3pGzujmlMsbPNTTq/NIbbqLNTAvrwg8B4Gzwu
 6Aftz0Nxgv67nxysaimKxjCxyYqy+vp10hsdkYnVsJguoXq8dp4yW8i9uTh3Pt7Sz3
 KfRTY2NQIT2psTISTdmTulkWTyY7iWR+kAOj06gYH9S6ZpPIEr7I5aMmWHNKtyc1LQ
 6gCnkW6o9+DmVWddDJrkFyW4uiCGN4X3Q5xMynN+Tg25LkxUmYxbD1WAY2B5uCKMW2
 DyfBbsE4NaXYA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=pdiSJV/Z
Subject: Re: [Buildroot] [PATCH 1/1] package/python-pyspnego: bump to
 version 0.11.2
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

On 11/01/2025 17:16, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
