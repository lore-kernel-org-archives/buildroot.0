Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4092ACCD1AB
	for <buildroot@archiver.kernel.org>; Wed, 22 Oct 2025 19:58:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0983F8407C;
	Wed, 22 Oct 2025 19:58:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZPfcTzqTZNoN; Wed, 22 Oct 2025 19:58:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 42AF483F80
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 42AF483F80;
	Wed, 22 Oct 2025 19:58:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id C0CEA43F
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 19:58:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BDAA483F80
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 19:58:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q-m1s0L3Ziua for <buildroot@buildroot.org>;
 Wed, 22 Oct 2025 19:58:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C869F81AC4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C869F81AC4
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C869F81AC4
 for <buildroot@busybox.net>; Wed, 22 Oct 2025 19:58:40 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 34B15780331;
 Wed, 22 Oct 2025 21:58:37 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 22 Oct 2025 21:58:37 +0200
MIME-Version: 1.0
Date: Wed, 22 Oct 2025 21:58:37 +0200
To: Francois Perrad <francois.perrad@gadz.org>
Cc: buildroot@busybox.net
In-Reply-To: <20251022133908.230789-1-francois.perrad@gadz.org>
References: <20251022133908.230789-1-francois.perrad@gadz.org>
User-Agent: Webmail Free/1.6.11
Message-ID: <13f069842ef0da7bfe74fdc5a3b70615@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1761163118;
 bh=2+98AxVyLWhgPOP9VZIjpVo+bpF1es32NZ/4YX07Xjw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=XT6izUruFATVRweAzEyHxfmZu8oZdz/MBTebvaBhCTgMY6DdlenSlQlDnP3NlNk6x
 wrjajZU2tFwE2Z7bOwcFgHI2TJbz7dKQ6IU/u0Q40SlIe5BZzNhPUqDJBueR0EDDCe
 qYaQBohuEZ4BlyYcf0piWKdkKeMEDF77Hjbbr1Bik6uNsKQUPojJc48TtD6hdPIkBH
 hc35yFN2v38ynERBZ/9/0iHIUY9KSiwkBVt/ccHLHMGTKMfmDjOPa626FgXnQ/r/T5
 tRfVpiQNEb6LWncnYX7gajKNqyFM0d1igO70zow3KXL9FRISGEG3TVgHdWeNu8efPw
 gX1f4m7RBqu0Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=XT6izUru
Subject: Re: [Buildroot] [PATCH] package/at-spi2-core: bump to version 2.58.1
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

On 22/10/2025 15:39, Francois Perrad via buildroot wrote:
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
