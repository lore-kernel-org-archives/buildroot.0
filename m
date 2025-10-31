Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 399ABCCF9F8
	for <buildroot@archiver.kernel.org>; Fri, 31 Oct 2025 22:30:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BAD5E61AFF;
	Fri, 31 Oct 2025 22:30:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lnCJ31mzMmpO; Fri, 31 Oct 2025 22:30:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E4AE661AEF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E4AE661AEF;
	Fri, 31 Oct 2025 22:30:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E7FB5CD
 for <buildroot@buildroot.org>; Fri, 31 Oct 2025 22:30:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D997B84469
 for <buildroot@buildroot.org>; Fri, 31 Oct 2025 22:30:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GrdBv_YzJlvZ for <buildroot@buildroot.org>;
 Fri, 31 Oct 2025 22:30:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2A34C84398
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2A34C84398
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2A34C84398
 for <buildroot@buildroot.org>; Fri, 31 Oct 2025 22:30:24 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 0FBDF19F57B;
 Fri, 31 Oct 2025 23:30:21 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 31 Oct 2025 23:30:21 +0100
MIME-Version: 1.0
Date: Fri, 31 Oct 2025 23:30:21 +0100
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20251031112858.2351416-1-dario.binacchi@amarulasolutions.com>
References: <20251031112858.2351416-1-dario.binacchi@amarulasolutions.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <2961275b61419e3f5191e949427fec4d@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1761949823;
 bh=WKP4D61UB7Sh9Vy6FePpqce71NzBFpDBeNRa43Vldrg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=fTT1NI9w13aMqAJzv+1WrJ/j+tUFdMlPxMhk8F9z+5zHEaCzaRHB6v9BqH0XQKNrq
 JCrCtGg2zCZLAeymVI5Y18dHqffISxerF+E/Afuu8vI2VLs9KNUZgwFZlf1HAGAYEv
 eE/xppngHS3pzdOmBxsSJOHEsPlFpF+8ixvTuxo3wPNc0Lo9kRRuD0BEvAcO9rQZ9E
 U/mQIIpz+CZhuknHmcxmyODor5CgNw/cinbDsWoDT/6Dwv2ZzBA5WB6GQfpkwOkcUo
 gYbTlTHNp+dngZUkQOf28TFjf4ERjsaeaLX+dW+A4YbeDcjS+C4fNkMGOKq2OKpVOi
 TWADF1wEECDIw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=fTT1NI9w
Subject: Re: [Buildroot] [PATCH 1/1] package/bcm2835: bump version to 1.75
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

On 31/10/2025 12:28, Dario Binacchi wrote:
> 1.74 Timeout in bcm2835_i2c_write() increased by a factor of 10 because
>      some users have reported spurious timeouts at slow speeds.
> 
> 1.75 Patches to bcm2835_aux_spi_transfernb() from Sean Goff to deal 
> with
>      the case where the process is interrupted between filling the TX
>      FIFO and reading the RX FIFO.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
