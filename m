Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89CE3C369D3
	for <buildroot@archiver.kernel.org>; Fri, 25 Apr 2025 16:21:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 58D56812E0;
	Fri, 25 Apr 2025 16:21:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j0p2TxLpWzwd; Fri, 25 Apr 2025 16:21:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8F7448125E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8F7448125E;
	Fri, 25 Apr 2025 16:21:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id A0448127
 for <buildroot@buildroot.org>; Fri, 25 Apr 2025 16:21:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 92A2E4025E
 for <buildroot@buildroot.org>; Fri, 25 Apr 2025 16:21:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id btqNQHH1cuC4 for <buildroot@buildroot.org>;
 Fri, 25 Apr 2025 16:21:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 96894409ED
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 96894409ED
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 96894409ED
 for <buildroot@buildroot.org>; Fri, 25 Apr 2025 16:21:15 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id A4582780504;
 Fri, 25 Apr 2025 18:21:12 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 25 Apr 2025 18:21:12 +0200
MIME-Version: 1.0
Date: Fri, 25 Apr 2025 18:21:12 +0200
From: Julien Olivain <ju.o@free.fr>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250424131654.136749-1-giulio.benetti@benettiengineering.com>
References: <20250424131654.136749-1-giulio.benetti@benettiengineering.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <61634d2f03b4d43dbdcace73ea09ebcc@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1745598073;
 bh=NwtT4QgQXO152s630042Dszqk/LOEWW65Wa7fkaNsNg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ROHpkqyU5o5cblWO2Rgf0pGrbxpPfuF/5g9TrjwUJ/djbWpZem4xrhSWjPfuSrRG5
 9WEjFEKdcgHDxgtxqnDfko2yrD8rn8wlGYcJBGp7NkXEcq9O+S8itTDo07QTD71wtZ
 0yRp2zsl2Mgve3qMN9RAuSe8/pFAFGXR3tQbBgzJXsEnNUSc1C3bqwsjFx2wvCMdqW
 cv1idYFEi1Ven8cZH1SHccxfj93KzJ0rwA6idrELe6AUltyxeBBJH3SnyK2kllbLlE
 Jvu1+lkmYxcWqxJ1FQiqeP0YRko3rDhK0d/mXRluVW6yVeFfJtejP41sL314YBidRd
 MPvf2LkGgEAdw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=ROHpkqyU
Subject: Re: [Buildroot] [PATCH] package/libfuse3: bump to version 3.17.2
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

On 24/04/2025 15:16, Giulio Benetti wrote:
> Release notes:
> https://github.com/libfuse/libfuse/releases/tag/fuse-3.17.2
> 
> Drop local patches that are upstreamed now.
> 
> Fixes:
> https://autobuild.buildroot.net/results/f3c/f3cfaa8ed63483858ffa32b719ea4be68ba6c4f3//
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
