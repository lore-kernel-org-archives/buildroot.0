Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63398CAC5BB
	for <buildroot@archiver.kernel.org>; Wed,  1 Oct 2025 20:31:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1F184614B4;
	Wed,  1 Oct 2025 20:31:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e3I9S3V5wC5T; Wed,  1 Oct 2025 20:30:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1313C614AD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1313C614AD;
	Wed,  1 Oct 2025 20:30:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1076ACC0
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 20:30:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 01973412D6
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 20:30:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6YGjeoeX4lsu for <buildroot@buildroot.org>;
 Wed,  1 Oct 2025 20:30:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 25EBB41272
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 25EBB41272
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 25EBB41272
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 20:30:49 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 8E51719F57B;
 Wed,  1 Oct 2025 22:30:42 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 01 Oct 2025 22:30:42 +0200
MIME-Version: 1.0
Date: Wed, 01 Oct 2025 22:30:42 +0200
To: Robert Marko <robimarko@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20251001122655.994103-1-robimarko@gmail.com>
References: <20251001122655.994103-1-robimarko@gmail.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <a9f896b42834556ce646b718ec70943d@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1759350643;
 bh=5Y9QwMGuwViF9amGPlkgrwyAnurxXW0+tApGXjDVgdQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=kAAWvLnbyNwDBWpxn/3P4uvVz/V1YpsD7c3MBOLYKuMZY0pCZkkFNjCKXXuC/pW0C
 rxxt023+Z1hqLjl2hg8QJHvurtHSXeL7gIMXPhkAyoCsvf0I+wXfaCzjQ07K032ym6
 SUMw5dpN2VXu2GmpJcLWlQ1w/Qnogtwiw03sQwOod99Xhh8APWLbKh+MaTdAgZrU9W
 9Yr3j9AGHLfuhPn7rvFHqRv3HRIWjllrsPFyCtxHMRPdfOpERmWMa+G6MSLwJRHjdn
 HdCrWqRLppgCxziFBF7qrDelqmcbqAOfQVP6+Tj1wMz/K8caZyhChkLn8Tqa5WvzNI
 jnju6vvCaipjw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=kAAWvLnb
Subject: Re: [Buildroot] [PATCH 1/1] package/mdio-tools: enable
 CONFIG_MDIO_BUS
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

On 01/10/2025 14:26, Robert Marko wrote:
> CONFIG_MDIO_BUS was previously a hidden symbol that was selected by
> CONFIG_MDIO_DEVICE, however since kernel 6.16 this changed.
> 
> CONFIG_MDIO_DEVICE was dropped and now CONFIG_MDIO_BUS is visible and 
> must
> be directly selected[1].
> 
> So, enable CONFIG_MDIO_BUS directly as otherwise building mdio-tools 
> can
> fail with:
> ERROR: modpost: "mdio_find_bus" [mdio-netlink.ko] undefined!
> ERROR: modpost: "__mdiobus_write" [mdio-netlink.ko] undefined!
> ERROR: modpost: "__mdiobus_read" [mdio-netlink.ko] undefined!
> ERROR: modpost: "__mdiobus_c45_read" [mdio-netlink.ko] undefined!
> ERROR: modpost: "__mdiobus_c45_write" [mdio-netlink.ko] undefined!
> 
> [1] 
> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?h=v6.16.9&id=31be641d74267d98317ef5a2b90e6200511cabb3
> Fixes: 
> https://autobuild.buildroot.org/results/8595997794a2f603fcef95b559f60f83abfe4d83/
> 
> Signed-off-by: Robert Marko <robimarko@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
