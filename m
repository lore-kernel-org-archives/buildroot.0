Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1AE5CCD18C
	for <buildroot@archiver.kernel.org>; Fri, 10 Oct 2025 12:04:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A91DD82F96;
	Fri, 10 Oct 2025 12:04:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id URYa1-3yzrj8; Fri, 10 Oct 2025 12:04:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C2AC982FEA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C2AC982FEA;
	Fri, 10 Oct 2025 12:04:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4503A14B
 for <buildroot@buildroot.org>; Fri, 10 Oct 2025 12:04:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 36A3482C5E
 for <buildroot@buildroot.org>; Fri, 10 Oct 2025 12:04:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q1Du-QWl3yaf for <buildroot@buildroot.org>;
 Fri, 10 Oct 2025 12:04:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3B1D782AA2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3B1D782AA2
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3B1D782AA2
 for <buildroot@buildroot.org>; Fri, 10 Oct 2025 12:04:57 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 6761B5FFB4;
 Fri, 10 Oct 2025 14:04:53 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 10 Oct 2025 14:04:53 +0200
MIME-Version: 1.0
Date: Fri, 10 Oct 2025 14:04:53 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org, linux-amarula@amarulasolutions.com
In-Reply-To: <20251009164012.4185381-1-dario.binacchi@amarulasolutions.com>
References: <20251009164012.4185381-1-dario.binacchi@amarulasolutions.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <a825fe1d8760a66e503626e7b5a382c9@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1760097895;
 bh=WjC/u2mnh9eWs+UCj55C8y+aCh39v97NvHFH+3MYqFs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=pcSuKLB1obklXe3dEqPJWGheaSZ5dzBDIl6feSAMnM4I8ZmVJoIEW5IyonTmij+WN
 KMbkVSw1a5wbQS/dOwPI7xmTC74twoZUDmg6Wfhv6lg83LdMg6ihuKcEewLCylIx0P
 7jOkFc5uxZCRFFBPlVZUGbhDuSJQI9n3gsVuNnRWMvdKqt6kzA0I/L+yw/ADOQcxl6
 vc6HhliJAneleE+MSIujKT5S+u0PypmLnl1P0Bg+WbCxpg+uHjJKFd6O/s3iqQgq/j
 S2CYfFaD/Udnl4Zone7g/bsf92pvrDHF1FU5TwixjDRTMa3OGo5vt+V2NVrecdTkoB
 2St+vnlQXQClw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=pcSuKLB1
Subject: Re: [Buildroot] [PATCH 1/1] package/gsl: bump to version 2.8
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

On 09/10/2025 18:40, Dario Binacchi wrote:
> Release notes:
> https://cgit.git.savannah.gnu.org/cgit/gsl.git/tree/NEWS?h=release-2-8
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
