Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 525A0CAC5B8
	for <buildroot@archiver.kernel.org>; Tue, 30 Sep 2025 20:05:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 244B06108A;
	Tue, 30 Sep 2025 20:05:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5ZL9xGv39D-N; Tue, 30 Sep 2025 20:05:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1CDF061073
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1CDF061073;
	Tue, 30 Sep 2025 20:05:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id BAFC9111
 for <buildroot@buildroot.org>; Tue, 30 Sep 2025 20:05:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AC9DB40CEA
 for <buildroot@buildroot.org>; Tue, 30 Sep 2025 20:05:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lhP3LiFroWz4 for <buildroot@buildroot.org>;
 Tue, 30 Sep 2025 20:05:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E618040CF1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E618040CF1
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E618040CF1
 for <buildroot@buildroot.org>; Tue, 30 Sep 2025 20:05:28 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id EA67060137;
 Tue, 30 Sep 2025 22:05:25 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 30 Sep 2025 22:05:25 +0200
MIME-Version: 1.0
Date: Tue, 30 Sep 2025 22:05:25 +0200
To: Fabio Estevam <festevam@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250930122237.2005049-1-festevam@gmail.com>
References: <20250930122237.2005049-1-festevam@gmail.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <c3bca3f31c5fcacf7bf6aca157d3c533@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1759262727;
 bh=ItyaD6r0N6hYLAmEPTTrcBP9SlEFxmB1iUNOCltAIkI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=VtyuaDImfaueeG5BApHr0cxitLKbpSLFTWzTJfbJmZvHT2eH4TcKPm2Zh4F1OSPcS
 0WcmcdSRsfyEqSBLX+HSBcW9bjO5gpZ0itb1OsqjdlZN9tHPSfWYvNQh1ObYmKGuOb
 1/LHfmTclc4AMFslFiBHxEGssD9GVijfofKijIdnugJjDsQY91GprpOiX97ne9jqws
 ywysMcMMByyzSA84rsUHeBWhVsLazj6sQSVOwHgTcdGHWblzQmjnJgLBIFltVprOcK
 heYYGGKQW9/LhrDf5oBwP5vP1hG0OzsAWtFCq0rDyxl9rinyhbI0V0e2Qkc4EFbYjn
 uwvhsEJrNYcvg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=VtyuaDIm
Subject: Re: [Buildroot] [PATCH] package/crucible: bump to version 2025.05.28
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

On 30/09/2025 14:22, Fabio Estevam wrote:
> Bump to version 2025.05.28.
> 
> Signed-off-by: Fabio Estevam <festevam@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
