Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E418EC55174
	for <buildroot@archiver.kernel.org>; Sun,  2 Aug 2026 19:49:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A8D6480982;
	Sun,  2 Aug 2026 19:49:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1HEYuyTfsqIC; Sun,  2 Aug 2026 19:49:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 24C7E808C8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785700166;
	bh=DDqBjqRJ67trexpFvmy8g6eTOB12xJS0LO0aMfs19WI=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=oLiW43a2z+KwM0Z+brBBxEgkNEElLy3zcOLN8Va3BfhsC86YP2pZvWoPNNOcAT7Jm
	 MotzAkgC8RHKd89ZEhG6rpqo/V86FFxXtdz9CyRz0dhkaQc1c3cVt2JfdLmn3Nicf2
	 zYIWB4t5wk481EMMjZOvOhdSJF2zldWgvJ6Qz8UD+J3i+EWkuV7Mxdmbc/3t+c4a5+
	 Dp9sa53yw2pUm7SKEcg589p28A6H4YBZ0KG/ziHDv1L+jaD+/ymIwfRGeG0A1Wt/ty
	 gjtFIgVMjnl+5eYMyyC6u5C/vK59EZXYe1rQQh5H+zE62e+eVbFPESiC3Yocv9gX6L
	 e7HJSNH8YOkIg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 24C7E808C8;
	Sun,  2 Aug 2026 19:49:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id B3ABC2CE
 for <buildroot@buildroot.org>; Sun,  2 Aug 2026 19:49:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9A68F6066E
 for <buildroot@buildroot.org>; Sun,  2 Aug 2026 19:49:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OeZspYrrh1VT for <buildroot@buildroot.org>;
 Sun,  2 Aug 2026 19:49:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A252B60618
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A252B60618
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A252B60618
 for <buildroot@buildroot.org>; Sun,  2 Aug 2026 19:49:23 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 7DC93B0055A;
 Sun,  2 Aug 2026 21:49:20 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 02 Aug 2026 21:49:20 +0200
MIME-Version: 1.0
Date: Sun, 02 Aug 2026 21:49:20 +0200
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org
In-Reply-To: <20260419120839.543152-1-ju.o@free.fr>
References: <20260419120839.543152-1-ju.o@free.fr>
User-Agent: Webmail Free/1.6.17
Message-ID: <96a5f6e1be30b7daa9d53d6265d23991@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1785700161;
 bh=7uxRV8HqGElENB+pP2rFxxpUIofTfoKFGZG7UE+YDc4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=oOTzfyDsb6SEj75hO5xkRFS//4yUdnh7vwX1/GQOuiL/xDcfDWXaLkfckedSg+xa0
 VTfqKcvXNAlZQcwpl3JViA4ESRn/yDskhS4fyjK6XnnPXUYCNa4lD/WdqNPex8UIl4
 KzY+AgFHFAIdSv1QS62oRttTIPGViZe5laSa3v7c/LFmSo1i/tWm1U1hI47FcYaTUQ
 5rwf02sy3vlxwEnUAqvGMIW4N4zpu+6DGZorO2uOvovL/dKacoDBoQZtKX7RG2mhYY
 JJwLoUV86vzucvaxpe0a1FTj6BF2/FSzbuBaW8u3xsTXg3zWaEIt/HGmZRmAgwvL0C
 8wOwzCzHEHyaA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=oOTzfyDs
Subject: Re: [Buildroot] [PATCH 1/1] package/perftest: bump to version
 26.01.5
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

On 19/04/2026 14:08, Julien Olivain via buildroot wrote:
> For changelog since version 24.07.0-0.44, see:
> https://github.com/linux-rdma/perftest/releases/tag/perftest-26.01.5
> 
> The tag name is now prefixed with "perftest-", so this commit
> updates _SITE accordingly.
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

Applied to master.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
