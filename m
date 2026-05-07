Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 816CCCD3442
	for <buildroot@archiver.kernel.org>; Thu,  7 May 2026 20:09:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 42499608CB;
	Thu,  7 May 2026 20:09:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RMuZZYfC3Umw; Thu,  7 May 2026 20:09:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 683FD60A74
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778184542;
	bh=PrvNgGIyTrvOY0TLSV3eSY5YH0K4px23d5K0B4gvex8=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=bHSL61Q7J5Cm99TMXZ6ZzqGs8tkXZKqNWXkulw82pPZNE0bYyec7rXslNEpwqrTL5
	 DAOQm4HqdOe7cQKkpXRgWZzRPjjrwQsjfjUwkdCngwQCYW3+3e7s8m9czdCQk4MDdD
	 YU35kDkDnt/zvAWp6LzIdLjjLA6Iqxgtv1H6xEoE/3EbO5QCJORSeOrYwFxxZzhR8o
	 gJDsjAvpRmyLOHhG2BE3yy1+sb+0O1b2x4lT07WbbNcd8Ejwa8rhR5Fv7jldosQt1x
	 U+e934pxzQix7FARItTSwE61KkOH+gcw8E7RWQr+Xt6WCsnyqGxSJOeXPoyDmjNWkn
	 aTh4Vz9xpxYww==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 683FD60A74;
	Thu,  7 May 2026 20:09:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id BFF85317
 for <buildroot@buildroot.org>; Thu,  7 May 2026 20:09:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A586D83D2E
 for <buildroot@buildroot.org>; Thu,  7 May 2026 20:09:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j0HMj0oiZlUh for <buildroot@buildroot.org>;
 Thu,  7 May 2026 20:09:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D13CF83CC8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D13CF83CC8
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D13CF83CC8
 for <buildroot@buildroot.org>; Thu,  7 May 2026 20:08:59 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 2F89B13F8A9;
 Thu,  7 May 2026 22:08:55 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 07 May 2026 22:08:55 +0200
MIME-Version: 1.0
Date: Thu, 07 May 2026 22:08:55 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Dimitrios Siganos <dimitris@siganos.org>
In-Reply-To: <20260507171905.3974201-1-bernd@kuhls.net>
References: <20260507171905.3974201-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <8178437398c75b73adf32b71f6ba70fd@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1778184537;
 bh=P4G/IRmoY7BMUT6++J+ETvCU1XA+09h2BOyWz+BHIKM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=EBaHu1LvRxoqDOFkU/1U6oZp9zbrZk8N1pBMdhWnrFYx8CGIMzfMNO1Ls/Ur1hpOw
 zng4ORHYsLJ+gdKCA1cGLg5P8sUCI+RLU/u+Odva17zHeFC4cFNQEJ6ysMN+9dk6Jo
 elfsQzWS1zITJqdhmPmGoPpUdAnL+VODDYjbGW9chJbgoFaLpH5NMryTAGpCR8g7dI
 lVLLozadWz8z9aJ8Mm34Cv9cmiWjSnRkY4EwqZg0U7GBT1xtFJ/w0regUdbm4CD6p1
 yWo075BTx7hiA8i3isI2KAROHzHRYHu24/Z+qOfzXjcYyZpT3DNtPL7VZA2Vx8TORJ
 WWx2muxuWBzvA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=EBaHu1Lv
Subject: Re: [Buildroot] [PATCH 1/1] package/wireless-regdb: bump version to
 2026.03.18
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

On 07/05/2026 19:19, Bernd Kuhls wrote:
> https://lists.infradead.org/pipermail/wireless-regdb/2026-March/001844.html
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
