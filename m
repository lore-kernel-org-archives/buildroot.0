Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F44FCCFA02
	for <buildroot@archiver.kernel.org>; Sun,  2 Nov 2025 10:10:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0D4C642652;
	Sun,  2 Nov 2025 10:10:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rfKn-cgtDPtX; Sun,  2 Nov 2025 10:10:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 35A2042646
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 35A2042646;
	Sun,  2 Nov 2025 10:10:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A97002A3
 for <buildroot@buildroot.org>; Sun,  2 Nov 2025 10:10:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9ACC06F545
 for <buildroot@buildroot.org>; Sun,  2 Nov 2025 10:10:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0q8xKluIvZW2 for <buildroot@buildroot.org>;
 Sun,  2 Nov 2025 10:10:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 244316F544
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 244316F544
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 244316F544
 for <buildroot@buildroot.org>; Sun,  2 Nov 2025 10:10:49 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 6FEFAB0051B;
 Sun,  2 Nov 2025 11:10:44 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 02 Nov 2025 11:10:44 +0100
MIME-Version: 1.0
Date: Sun, 02 Nov 2025 11:10:44 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Jarkko Sakkinen <jarkko@kernel.org>
In-Reply-To: <20251030195405.1475836-1-bernd@kuhls.net>
References: <20251030195405.1475836-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <964a9b1380f45f543c8dda8aca6c11c0@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1762078247;
 bh=GHhpTuafUlEiE7bapedootmLgKC2VNJrwzfWY4OH1BQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=eesPML7JlKiNo+hY94oHatMt5WKNFDqzbCXFOLBirzB51vSu7eYlxrLmMs+pvJEgl
 E41GPD/hm20DmxgtwqdihgZ8NRqOyH6n005h0ZE/P1OnYMD6oNbne/mg+uI2er9g/3
 1I6Q3d/lnq3Bav8dLq4P+wKtxO9F7QGbRGIUbulYT5+tv2HkHwDOJ4cLHnKk5DjEWB
 XZom2wQcXCLQH/vVvWyy8nIIj69Qh474ANRCKBfm5ODQdGjzQyPlWRuMqYohQ4vXTX
 hSxbiqdo2bTkhRYewebvlOw/WdOnxHydI0062iLlLNTUYF6yA1yRnG7w4/Vb912AGR
 0IckBF2OL99qQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=eesPML7J
Subject: Re: [Buildroot] [PATCH 1/2] package/quota: Fix building on musl
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

On 30/10/2025 20:54, Bernd Kuhls wrote:
> Add upstream commit to fix musl build.
> 
> Fixes:
> https://autobuild.buildroot.net/results/7de/7de6acab2b10d1b6b7d5e95104f1f2686bcd126b/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
