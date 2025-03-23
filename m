Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE18DC28B30
	for <buildroot@archiver.kernel.org>; Sun, 23 Mar 2025 10:32:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 72421607B7;
	Sun, 23 Mar 2025 10:32:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f3weFzzK7FlS; Sun, 23 Mar 2025 10:32:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A9CA160A45
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A9CA160A45;
	Sun, 23 Mar 2025 10:32:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id B8A851C9
 for <buildroot@buildroot.org>; Sun, 23 Mar 2025 10:32:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9E42A82101
 for <buildroot@buildroot.org>; Sun, 23 Mar 2025 10:32:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kvkrwlkzFj3l for <buildroot@buildroot.org>;
 Sun, 23 Mar 2025 10:32:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D9AE882100
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D9AE882100
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D9AE882100
 for <buildroot@buildroot.org>; Sun, 23 Mar 2025 10:32:48 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id D865319F54D;
 Sun, 23 Mar 2025 11:32:43 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:38090])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 23 Mar 2025 11:32:43 +0100
MIME-Version: 1.0
Date: Sun, 23 Mar 2025 11:32:43 +0100
From: Julien Olivain <ju.o@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250128171630.2446611-1-james.hilliard1@gmail.com>
References: <20250128171630.2446611-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <962b9162ad304ca0ef7befbd14f167e9@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1742725965;
 bh=9gQnCr3XInIgDNKoncwdjYM3CGO03Ok0oTwjhScIyKM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=pMsIOIAMbATVOD36YNemWo2pyGLb1PeCh8TOLd0e4YndI3CgShRCb447cRq36XIbX
 2MgVrULj67KNcTUTmEqJI55WB6fzAY1VzyZu/WuD53ZOH+K+812yY7cwxvQYWIZL7b
 Z0wmSxGG/ehuniMgfbpKDhhemtBa0j8S3Sql5U2JRKHwIChfNjzBQq9W0fEhLED69w
 IV9tiB/zVov3hHct8Ut8jdErNjv0kGKqiiDnjzbb5mCAvvfIakN+Vaf0HBBble59ql
 T0bDCLrkBMJRNdxlE5ejHHjlPugtR8a7JRGB/75IxJrpybpJHW0MAV97Lae9Gb10wq
 iECSk2ZNAJ8EQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=pMsIOIAM
Subject: Re: [Buildroot] [PATCH 1/1] package/python-proto-plus: bump to
 version 1.26.0
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

On 28/01/2025 18:16, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
