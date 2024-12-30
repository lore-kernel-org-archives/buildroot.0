Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D4A9E77188
	for <buildroot@archiver.kernel.org>; Mon, 30 Dec 2024 19:52:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D680B80A87;
	Mon, 30 Dec 2024 19:52:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i1D-_YDe6TgK; Mon, 30 Dec 2024 19:52:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0743C80F2B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0743C80F2B;
	Mon, 30 Dec 2024 19:52:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id B54BA968
 for <buildroot@buildroot.org>; Mon, 30 Dec 2024 19:52:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A44E080F2B
 for <buildroot@buildroot.org>; Mon, 30 Dec 2024 19:52:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dOB0_tKQuo2F for <buildroot@buildroot.org>;
 Mon, 30 Dec 2024 19:52:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C251280A87
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C251280A87
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C251280A87
 for <buildroot@buildroot.net>; Mon, 30 Dec 2024 19:52:38 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 1A7BE78050C;
 Mon, 30 Dec 2024 20:52:34 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:60550])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 30 Dec 2024 20:52:34 +0100
MIME-Version: 1.0
Date: Mon, 30 Dec 2024 20:52:34 +0100
From: Julien Olivain <ju.o@free.fr>
To: Nicola Di Lieto <nicola.dilieto@gmail.com>
Cc: buildroot@buildroot.net
In-Reply-To: <Z3JtFjEAZq8HvhgS@einstein.dilieto.eu>
References: <Z3JtFjEAZq8HvhgS@einstein.dilieto.eu>
User-Agent: Webmail Free/1.6.9
Message-ID: <9469b4c029e7a403d2946901c7540e3a@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1735588355;
 bh=+FdeOC3LTP8Nikrt4HK2O4EzN1ZCFJ9gy/FORsFPP8w=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=fvPDj9R9+87q6CQsYXGaza5oeLkCETcs9W4DTOJNQowJJRcUyD+kw6WoeYWZhv+Iw
 Mmv20vZSt3Y+cxbewlev1wexjwoW/A/ohAwIliExDpwGfu4liemOXKIzyXHJ4e/RVC
 eci0uNLIZJJiG3Up29Y781EyfX0U+UvKasuMOzjnbRPvqMXyvnVHGeirh5BvqtQ3V/
 llHRWSP7K21edX77xGVHnYzSfT1C06xC1MllHCJ6HISjIYE3OlDNbjC9Z46MyuncgW
 79zMd8M6BwmojPYOOTAgtfTCFdDnKF19wXTxDbkATQnW743zWqzFEohF89w81bp1BS
 xaj6+QL5YZJAw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=fvPDj9R9
Subject: Re: [Buildroot] [PATCH] package/uacme: bump version to 1.7.6
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

On 30/12/2024 10:51, Nicola Di Lieto wrote:
> Also removed 0001-Fix-cross-compilation.patch which is included in
> version 1.7.6
> 
> Signed-off-by: Nicola Di Lieto <nicola.dilieto@gmail.com>

Applied to master, thanks.

For info, I added link to the change log.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
