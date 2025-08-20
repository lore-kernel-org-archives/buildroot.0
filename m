Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54364CA0EE4
	for <buildroot@archiver.kernel.org>; Wed, 20 Aug 2025 16:38:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2A3F5834DE;
	Wed, 20 Aug 2025 16:38:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EYH0T5kHMJoY; Wed, 20 Aug 2025 16:38:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4BADA82F3D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4BADA82F3D;
	Wed, 20 Aug 2025 16:38:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8AADBDE6
 for <buildroot@buildroot.org>; Wed, 20 Aug 2025 16:38:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 716C440704
 for <buildroot@buildroot.org>; Wed, 20 Aug 2025 16:38:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id op6J8d_BA8HU for <buildroot@buildroot.org>;
 Wed, 20 Aug 2025 16:38:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9253740C93
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9253740C93
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9253740C93
 for <buildroot@buildroot.org>; Wed, 20 Aug 2025 16:38:46 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 4FA245FFB1;
 Wed, 20 Aug 2025 18:38:42 +0200 (CEST)
Received: from 2001:18c0:a22:bf00:5c2b:f296:f108:6612
 via 2001:18c0:a22:bf00:5c2b:f296:f108:6612 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 20 Aug 2025 18:38:42 +0200
MIME-Version: 1.0
Date: Wed, 20 Aug 2025 18:38:42 +0200
To: Peter Korsgaard <peter@korsgaard.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250820071127.3466191-1-peter@korsgaard.com>
References: <20250820071127.3466191-1-peter@korsgaard.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <79783657ca50fc71919901c7428ae728@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1755707923;
 bh=dVeLse+Lvpmey/TadJluy4XPB/IGIQVDAyGADEFzD7I=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=V49blI4CgornL98x3tDC3JSgR1pz2B9hlVhY6BmjGnpn40cwjj/QFP4cVVpD416VH
 cM3H/62nj2TVKS6JyPQTuQK/g0wHOBeY8fRJef5kwuKCCeo8eu9Oa7HOs11tuqD0P/
 03ImrZMQo0U+iAYS3jaiDarYHm378v21TSC2P1Zsoy3xiWVTPuhzU272gjwheohjHn
 rgJoXPxglWP2RjjyO+Mb0h9Gu7rev4kIEveZ4KE8Q+pQ0xdFAfn19xET03Zs1LTXG3
 U5nRCgM5S4KF0q/WqJ7HRrr6Qnr1uHp0/ylVgmzZZdRtxikvE/eA3Hr3fdTio6+gG1
 Tggob5uF2xMkw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=V49blI4C
Subject: Re: [Buildroot] [PATCH 01/11] package/gstreamer1: bump to version
 1.24.13
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

On 20/08/2025 09:11, Peter Korsgaard wrote:
> For various bugfixes. For details, see the release notes:
> https://gstreamer.freedesktop.org/releases/1.24/
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Provided this gstreamer bump series is mostly bugfixes only,
and it is including security fixes, and also the release note
mention that "it _should_ be safe to update from 1.24.x",
I applied it to master.

Thanks!

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
