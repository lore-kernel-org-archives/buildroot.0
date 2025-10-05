Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC53DCAC5B8
	for <buildroot@archiver.kernel.org>; Sun,  5 Oct 2025 20:38:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 69DC283D43;
	Sun,  5 Oct 2025 20:38:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dmHQxKlD-O1w; Sun,  5 Oct 2025 20:37:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 68F19830C2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 68F19830C2;
	Sun,  5 Oct 2025 20:37:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 66970272
 for <buildroot@buildroot.org>; Sun,  5 Oct 2025 20:37:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 586FF40BB1
 for <buildroot@buildroot.org>; Sun,  5 Oct 2025 20:37:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RlcDbvoDftsh for <buildroot@buildroot.org>;
 Sun,  5 Oct 2025 20:37:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7D1CD40A29
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7D1CD40A29
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7D1CD40A29
 for <buildroot@buildroot.org>; Sun,  5 Oct 2025 20:37:57 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id E778613F861;
 Sun,  5 Oct 2025 22:37:53 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 05 Oct 2025 22:37:53 +0200
MIME-Version: 1.0
Date: Sun, 05 Oct 2025 22:37:53 +0200
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org
In-Reply-To: <20250928200636.277674-1-ju.o@free.fr>
References: <20250928200636.277674-1-ju.o@free.fr>
User-Agent: Webmail Free/1.6.11
Message-ID: <516de677e5bc21b9b8f6d4bea234d0c1@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1759696675;
 bh=kYhlADDqlPCfq8AnJ2gD4O1Ryfj2CtvUJ6trQG0quAw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=JOHX/Y+sb9PhhCT0ia3pgro+UjP0Fw4f7knEmBSbdB9q02DJThh9x0PC5966Mpyvk
 6OUQMQo9JRfz5PS/BsdxABN7gBJVFkIxHwJ0qVh5DJchFNKyxfe8tb3cbW2GzxIEo9
 N8k5QIxLka0/PwmsQzX44ZDsTRefOYL9pHIhblUL1m5KNdqiDuvcimd050a6+YLbTV
 1G6U1X6+BfRT2GDEHICC5X0Sf6Lh2WcJNiXBeuV4NiBWGchaz9MQFEV/WiCKqUaB0U
 2H5hNtAO+DQlqvJaABc2a/Hdh8jD6tT9wOIZAtR3pK5AdfBd8NEeVBgMQrqfHAP3nn
 A1N9TwUq58zkQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=JOHX/Y+s
Subject: Re: [Buildroot] [PATCH 1/1] package/vulkan-headers: needs C++
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

On 28/09/2025 22:06, Julien Olivain via buildroot wrote:
> Since Buildroot commit [1] "package/vulkan-{headers,loader,tools}:
> bump to 1.4.317 release", the vulkan-headers package is failing at
> configuration time with toolchains without C++ support, with error:
> 
>     The C++ compiler
>       "/bin/false"
>     is not able to compile a simple test program.
> 
> This is due to upstream commit [2], which added CXX to the CMake
> project file.
> 
> This commit fixes the issue by adding the C++ dependency.
> 
> Fixes:
> https://autobuild.buildroot.org/results/10f63398940d52be9a8ee306daf4203ceca25eb8
> 
> [1] 
> https://gitlab.com/buildroot.org/buildroot/-/commit/52664093dee0f280db191c391167848dc5b09745
> [2] 
> https://github.com/KhronosGroup/Vulkan-Headers/commit/85256c712ce9ee9755ae74faacc3e6a1d2c5eddf
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

Applied to master.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
