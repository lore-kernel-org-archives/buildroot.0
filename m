Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BF5EC28B30
	for <buildroot@archiver.kernel.org>; Thu, 20 Mar 2025 22:18:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D42FF83AA7;
	Thu, 20 Mar 2025 22:18:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oTwV8boG3WKc; Thu, 20 Mar 2025 22:18:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0FBB283280
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0FBB283280;
	Thu, 20 Mar 2025 22:18:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id BC1F61A4
 for <buildroot@buildroot.org>; Thu, 20 Mar 2025 22:18:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AD44E83A9A
 for <buildroot@buildroot.org>; Thu, 20 Mar 2025 22:18:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OypoZqmpo-G9 for <buildroot@buildroot.org>;
 Thu, 20 Mar 2025 22:18:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DD0AE83280
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DD0AE83280
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DD0AE83280
 for <buildroot@buildroot.org>; Thu, 20 Mar 2025 22:18:46 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id C2BDF19F522;
 Thu, 20 Mar 2025 23:18:43 +0100 (CET)
Received: from 2a01:e0a:485:b220:8213:2270:4a8d:a1d5
 via 2a01:e0a:485:b220:8213:2270:4a8d:a1d5 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 20 Mar 2025 23:18:43 +0100
MIME-Version: 1.0
Date: Thu, 20 Mar 2025 23:18:43 +0100
From: Julien Olivain <ju.o@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250317214028.3047061-1-james.hilliard1@gmail.com>
References: <20250317214028.3047061-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <02e92df608daaf3323d3260352ce54ab@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1742509124;
 bh=V2PfxMThX/QANR+Y/e+VKyyPfo2pdYC372ESOk8sPGM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=p+xTQIPgxsXOZrqamEeIECDDwQomgrcQL0EWd5TZNajd5yPmViP6AGm9VS2TzOIiS
 pNb7Jb+HfJ9l6ek59yZytb1tNAQqvkcXRd91BmHu9jG87qzwv+zjPejoL6v4gdGt9A
 U1dXJqkkSzOFQEofZdRuced1CmNWUR5YKwwyf1yXAkCZBjBUFEOI6MDsY8DVawYHXJ
 HYPFHaIuZ2Q4MRsfI0wf6rEgAXqHR234ilYl9kSaCrIsiSaxEmhH/QshyxEqUoGAu/
 J1dfbWzLYPzCJanszzTdS6Vi0EpLlbH7hy6YAwGWCJ9aMPY7rt38VdRWTpk7NeJYNw
 a5/dtI+k9sBFA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=p+xTQIPg
Subject: Re: [Buildroot] [PATCH 1/1] package/python-aiohttp-cors: bump to
 version 0.8.0
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

On 17/03/2025 22:40, James Hilliard wrote:
> License hash changed due to formatting changes:
> https://github.com/aio-libs/aiohttp-cors/commit/c4a4ead0df64eaa266ba36660a8a841370bf07cd
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
