Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA17DC3ABBE
	for <buildroot@archiver.kernel.org>; Thu,  8 May 2025 17:11:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BAE634129D;
	Thu,  8 May 2025 17:11:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M0q7lgC-vUSe; Thu,  8 May 2025 17:11:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 03C5C412BC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 03C5C412BC;
	Thu,  8 May 2025 17:11:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id DAC531A9
 for <buildroot@buildroot.org>; Thu,  8 May 2025 17:11:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CBE65412C2
 for <buildroot@buildroot.org>; Thu,  8 May 2025 17:11:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v5C9V1wLCAfq for <buildroot@buildroot.org>;
 Thu,  8 May 2025 17:11:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3E22440C33
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3E22440C33
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3E22440C33
 for <buildroot@buildroot.org>; Thu,  8 May 2025 17:11:40 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 162F913F8A9;
 Thu,  8 May 2025 19:11:36 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 08 May 2025 19:11:36 +0200
MIME-Version: 1.0
Date: Thu, 08 May 2025 19:11:36 +0200
From: Julien Olivain <ju.o@free.fr>
To: Florian Larysch <fl@n621.de>
Cc: buildroot@buildroot.org
In-Reply-To: <20250507185311.7581-1-fl@n621.de>
References: <20250507185311.7581-1-fl@n621.de>
User-Agent: Webmail Free/1.6.10
Message-ID: <e059ed18e7573ffc296449c40d4f3ee2@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1746724298;
 bh=6jZxv07Qb29UEHRSjsO9sxkc78uQdk72/Nw0lB8fQZo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=WJn++9sEcLrte9hvM1n223iBJKuCll+T0v5ZbShk2Ir3qKMioJCs4Ovw9UU4tyTrJ
 R7numuF3SMO8TGrPjYkrBnvnsO7GhREyrLPFDxPnsX728uTpsiCEkGTdvJk5a91lDm
 oPyQknTfI+X8GOH73lB3UOvUshLvEpzZS418uQaHeYij2mpA0ZKKJgivORWuItjjCF
 GFWP/64Z4/N9eW7IfzS8SSqd4Egdz8N1zr9mY7T5TFEXURn5FTHDarfsO+09yVq9Lx
 LIL639GHSZHmU77/FhwScbhwty3/u2Hzb+3IvWSUutGjuKyGkQ2jhHGxbi/5ax0Kxq
 +cnQcIJeGfrww==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=WJn++9sE
Subject: Re: [Buildroot] [PATCH 1/1] package/bash: fix build with host GCC 15
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

On 07/05/2025 20:53, Florian Larysch wrote:
> bash uses K&R function declarations which have been removed in C23.
> 
> Since part of the build process (like the mkbuiltins helper) is written
> in C, building bash now fails on hosts with GCC 15 (which defaults to
> C23).
> 
> Since properly fixing this on the source code level is a larger
> endeavor, just set the C standard to an old enough version for now.
> 
> Signed-off-by: Florian Larysch <fl@n621.de>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
