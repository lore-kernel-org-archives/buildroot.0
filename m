Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 015E2E77188
	for <buildroot@archiver.kernel.org>; Sun, 22 Dec 2024 17:18:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BB4DF607A4;
	Sun, 22 Dec 2024 17:18:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7cJG-7LYDFDT; Sun, 22 Dec 2024 17:18:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C280F607B8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C280F607B8;
	Sun, 22 Dec 2024 17:18:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id ABA575E
 for <buildroot@buildroot.org>; Sun, 22 Dec 2024 17:18:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7FC1181F7D
 for <buildroot@buildroot.org>; Sun, 22 Dec 2024 17:18:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YHWD74YRbhZA for <buildroot@buildroot.org>;
 Sun, 22 Dec 2024 17:18:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9A5A981F7C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9A5A981F7C
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9A5A981F7C
 for <buildroot@buildroot.org>; Sun, 22 Dec 2024 17:18:33 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 9CAFC2003EF;
 Sun, 22 Dec 2024 18:18:29 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:43394])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 22 Dec 2024 18:18:29 +0100
MIME-Version: 1.0
Date: Sun, 22 Dec 2024 18:18:29 +0100
From: Julien Olivain <ju.o@free.fr>
To: yegorslists@googlemail.com
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>
In-Reply-To: <20241212070845.1623350-1-yegorslists@googlemail.com>
References: <20241212070845.1623350-1-yegorslists@googlemail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <304e172f4f4c2ba80d065a676727e7c3@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1734887911;
 bh=7t4qxOpsjmuDgcrC/in+R8lmYW/Onf0sXFobsdsy8Uk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=FHlhDdE2VVEWPMbCP86cpu+CJsprQz3g2hV1gcjAMC7PQm/Om6hipdXbIYUQnXTid
 NkCo5dntW/jsB00RA1asblHEiQNoq4bEJF+vVet8XQAUuylk2NwZq4KGEJhvC+eHr1
 KJ/uqisO9TAGNLiwF11mc4jQjQ//zeK4CFnL7VhFsC5RrmVt3lMscyLVrwKiqV5mlP
 /XI7knfu+FjgVjj2IhdHuIoybZ+FCQ4tTv7eNVs8NdpO20b7RCkHWqAQBdwJWkggb3
 LujXv5SLPbsP0fxmeJYCJf4ffrH357eOv3NLyfGHSu1v3UFWgkhGfPxUM8lfCT+6zz
 oYzdeEx5rG54A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=FHlhDdE2
Subject: Re: [Buildroot] [PATCH] package/python-autocommand: remove licence
 declaration
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

Hi Yegor,

On 12/12/2024 08:08, yegorslists--- via buildroot wrote:
> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> Remove license declaration and rely instead on Trove classifiers
> and LICENSE being included.
> 
> Fixes:
> https://autobuild.buildroot.org/results/6af310ba0f114020781fdcf71d3169ea3083478c/
> 
> Upstream URL:
> https://github.com/Lucretiel/autocommand/pull/33
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

For info, I merged the patch from Thomas [1] in [2] which was containing
the information asked by Peter in [3].

Best regards,

Julien.

[1] 
https://patchwork.ozlabs.org/project/buildroot/patch/20241222162615.1872897-1-thomas.petazzoni@bootlin.com/
[2] 
https://gitlab.com/buildroot.org/buildroot/-/commit/621ebccf3f1ca70443160103ae12ab3ea89f63bd
[3] 
https://lore.kernel.org/buildroot/4bd5b931-b405-4b17-9e58-b637e4a49afb@korsgaard.com/

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
