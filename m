Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDB19CA1012
	for <buildroot@archiver.kernel.org>; Wed,  3 Sep 2025 21:41:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 993C7849D2;
	Wed,  3 Sep 2025 21:41:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qtTxOGX7qEKp; Wed,  3 Sep 2025 21:41:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BC259849D6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BC259849D6;
	Wed,  3 Sep 2025 21:41:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0E582106
 for <buildroot@buildroot.org>; Wed,  3 Sep 2025 21:41:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E541D849D3
 for <buildroot@buildroot.org>; Wed,  3 Sep 2025 21:41:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fskXJBGFg-Vr for <buildroot@buildroot.org>;
 Wed,  3 Sep 2025 21:41:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org AB582849D8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AB582849D8
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AB582849D8
 for <buildroot@buildroot.org>; Wed,  3 Sep 2025 21:41:03 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 8DBA119F54D;
 Wed,  3 Sep 2025 23:40:57 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 03 Sep 2025 23:40:57 +0200
MIME-Version: 1.0
Date: Wed, 03 Sep 2025 23:40:57 +0200
To: Michael Nosthoff <buildroot@heine.tech>
Cc: buildroot@buildroot.org, Semyon Kolganov <semenak94@mail.ru>
In-Reply-To: <20250902065929.924677-2-buildroot@heine.tech>
References: <20250902065929.924677-2-buildroot@heine.tech>
User-Agent: Webmail Free/1.6.11
Message-ID: <add1608bcff4979f9297677f365de5eb@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1756935659;
 bh=3Z0S2Sm1UQH34QBF02fzoq6Wwx+fkuXdQRtliN7Wjbw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Uz3IXkhzV7YCSja8zFKyPJgNY+mWfWfpMxHOcqiT4zGVXFlf6OUmm+nLH5o4sRXV6
 qTPPTjq5Ur2obunQ4tpKpVf3wmVz5NjrvtPeCyOBuHsilUHRp82siT9U9RY73rlfi2
 AtIxzDkr8+5H2WwO1oAJAnWi4ex2F2W/ncvGjKntfw+I9Iyh0vmjnyWa6/Q3umw9eH
 KfNA7coSaCkP5Kk6k2AAziABqwOL4nXQ6ok+SxtN0pROCrjdHw5zsqpeyaj/Kf3bmU
 /jl7lc1YytOQbKWNpgPECUb1dVia+YPkP4mKsHaRtN7InrpodGLwGtrzaGqIiCmM4q
 OfTdHOf+MctOg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=Uz3IXkhz
Subject: Re: [Buildroot] [PATCH] package/fmt: bump to version 11.2.0
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

On 02/09/2025 08:59, Michael Nosthoff via buildroot wrote:
> Release notes of major releases since 11.0.2:
> 
> https://github.com/fmtlib/fmt/releases/tag/11.1.0
> https://github.com/fmtlib/fmt/releases/tag/11.2.0
> 
> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>

Applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
