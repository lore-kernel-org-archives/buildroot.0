Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BBE2CD6E52
	for <buildroot@archiver.kernel.org>; Sun, 31 May 2026 14:38:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0BDF1429DD;
	Sun, 31 May 2026 14:38:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L41hQdLzHbNe; Sun, 31 May 2026 14:38:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7EEAC429C5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780238312;
	bh=N/Jo9zQUY3OZ7GVhlXQv5Wtxg0Tsb2cSqxSVSvqtmyg=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=kbacVXkIwVl6/jAQemNhrh05OHi3JDCAe1HMi3SSa86ewAefMqi2vyx5S69nonSdF
	 sdr6cSn5KAQFSM5scexKd13h3q5YqzErcLeC3mF3/ztp3hCJ1+QTU/j6scUjUWGghW
	 SD6yD4rONYqgm0LnzKt80Qna8RRQrMrUWhiA517GUcT4+7lYrFPa+rAHR3o1E66Leu
	 N7ZbLhlFlDQubFhu2UFMY7lNlJbT51RkMP5LTk6umCiKGhh4Xmso4QjYCVN37jhcSI
	 wisn+eJBX/8An7bv8KYJSBxQxkPPzDLF6rVfJQaKHFycx5ePGd113yauaUm6OL0HPj
	 j6MP03qJje3mw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7EEAC429C5;
	Sun, 31 May 2026 14:38:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9B54F2AA
 for <buildroot@buildroot.org>; Sun, 31 May 2026 14:38:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8C58C40233
 for <buildroot@buildroot.org>; Sun, 31 May 2026 14:38:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U9l7yR2OQ0uF for <buildroot@buildroot.org>;
 Sun, 31 May 2026 14:38:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C491F40183
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C491F40183
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C491F40183
 for <buildroot@buildroot.org>; Sun, 31 May 2026 14:38:29 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id DDBF619F5BA;
 Sun, 31 May 2026 16:38:24 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 31 May 2026 16:38:24 +0200
MIME-Version: 1.0
Date: Sun, 31 May 2026 16:38:24 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Dimitrios Siganos <dimitris@siganos.org>
In-Reply-To: <20260531141830.2898251-1-bernd@kuhls.net>
References: <20260531141830.2898251-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <f30f72b55105ba0286e3d4e8329d5545@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1780238307;
 bh=edGDYFKZuybXafLS5PHrD1JuFCcXG0N93DUzxXXZHoQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=exDLRh1R8a/P9t69xJVAUZPanX+ja+SVHec7VMyrMbw6bJtZiZDSDb1fQNzukkW1m
 D/t0ecexe6vBVzRdeASq5cN9wePbe15BQChw1XFJ+S8jeR49YTWLcpcefqNteEkyCF
 5l3rvJfw3rqkVGcbXaEuD5vpyK6qPy8bQtPbaIk+HGncvzl34UC8b/DWEPNU7d4VeG
 R78Kx6EM8ChcZYGzKsH/RWnK63xae42iBnqKzPPY4tun93rLMje/uEBWWyKi3s81+z
 OKqomoaNzRfBBZnKvd4fKPNsM16rcunfv59zucoonjUXzmv9FieXNvqdSnBlVoiJIH
 9s8XV8PzoDmnw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=exDLRh1R
Subject: Re: [Buildroot] [PATCH 1/1] package/wireless-regdb: bump version to
 2026.05.30
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

On 31/05/2026 16:18, Bernd Kuhls wrote:
> https://lists.infradead.org/pipermail/wireless-regdb/2026-May/001917.html
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
