Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FC5FE8FDA2
	for <buildroot@archiver.kernel.org>; Fri, 26 Dec 2025 12:46:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 17CE940967;
	Fri, 26 Dec 2025 12:46:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E16Za2erAyl0; Fri, 26 Dec 2025 12:46:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0AD1540963
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766753192;
	bh=d1cqbnfX84A0VpRqqon964etb3k1jcchX/iBMX6kVSk=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=qkOQv0bzlA84jzF39qwTsJ6JlJ6OZ3hU5oFnc8szZtaZWSCHqJFnSkCmPTby5+0CG
	 0ZmLmW7QXJcXrG1KEzNutL26VJewHFP/Aqt1MuCXUoYcDUeTVxDgnI4WLhtA/DGVJB
	 WPWEgfnQnJIjLLgxp7fUkBuawzZRfz6E+V2bklttDLAeuf5wzPJX5esfJsKQWHORFL
	 morGzRi2sl/p1mcYS6k3CRfSmwujam1ItPvz5LQfrAB4rkcyvVGOFgwlYSxLErjG8H
	 aCrzJQrgxOxkCJErrd/yQxNUonk0RUVBZHe5syP7tqJR6wltg/FpC6Cq9CLd6IjYgr
	 kZpO4j+E7THRA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0AD1540963;
	Fri, 26 Dec 2025 12:46:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A26CDB9
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 12:46:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 93C4A80E83
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 12:46:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LZI9yRaYsD2G for <buildroot@buildroot.org>;
 Fri, 26 Dec 2025 12:46:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8788680D6C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8788680D6C
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8788680D6C
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 12:46:29 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id C0E2C13F88D;
 Fri, 26 Dec 2025 13:46:26 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 26 Dec 2025 13:46:26 +0100
MIME-Version: 1.0
Date: Fri, 26 Dec 2025 13:46:26 +0100
To: Peter Korsgaard <peter@korsgaard.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20251225143225.161851-1-peter@korsgaard.com>
References: <20251225143225.161851-1-peter@korsgaard.com>
User-Agent: Webmail Free/1.6.12
Message-ID: <233c186f4be1688ba68776dd70bb0650@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1766753187;
 bh=QlyvpKplLksizk9p3nG0jSRmwf4jFsu8HJJY5KL4y14=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=WHNdeYzleSP+ug8LrsBXkZmMvfS53Gk3I3cN4Rr1o6SfsgIrEockbgEpS2/lqzexb
 VUf6WGghQPy5w5j1XWW6HeudmXEQSWWDLPkDZiqtFFLBs7iZevEW4MMRve7Nwbn+qI
 bB6euXIlkLtQHyoeBYinM1cZow+Jk0rDghmT9ej6OwbB0NKzEEl36GjdybMpfn9S7q
 MgCMIYrAzz6M/RnEt3V8LP6BdB/1rZYBbDhNpSv45TRQ89ACv6HGfCtyDSf/FVbUn/
 C8Tgse3kh2zDPrUOngEiZTgrkZmNLs4TN9tvPxiIIWFkJr5T4UYoYiLU1c/gxxEA6S
 pXqrD6Lybjunw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=WHNdeYzl
Subject: Re: [Buildroot] [PATCH] package/dump1090: bump version to 10.2
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

On 25/12/2025 15:32, Peter Korsgaard wrote:
> Drop now upstreamed patch 0001:
> https://github.com/flightaware/dump1090/commit/84d68c628508360c47aa47691ec9d98dc6026ed5
> 
> And rename remaining patches.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
