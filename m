Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAE3ACFC51F
	for <buildroot@archiver.kernel.org>; Sat, 22 Nov 2025 16:16:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7F10D40B70;
	Sat, 22 Nov 2025 16:16:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sQ9qKSW4YZUt; Sat, 22 Nov 2025 16:16:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1736B40B3F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1736B40B3F;
	Sat, 22 Nov 2025 16:16:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 50C3E34E
 for <buildroot@buildroot.org>; Sat, 22 Nov 2025 16:16:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 366B8404C5
 for <buildroot@buildroot.org>; Sat, 22 Nov 2025 16:16:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0H8Tuunt3K72 for <buildroot@buildroot.org>;
 Sat, 22 Nov 2025 16:16:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 62E4740382
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 62E4740382
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 62E4740382
 for <buildroot@buildroot.org>; Sat, 22 Nov 2025 16:16:44 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 3E1AB60136;
 Sat, 22 Nov 2025 17:16:41 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 22 Nov 2025 17:16:41 +0100
MIME-Version: 1.0
Date: Sat, 22 Nov 2025 17:16:41 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20251120211747.1687323-1-bernd@kuhls.net>
References: <20251120211747.1687323-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <d463db72b480a97d99f1e5e9217289c0@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1763828202;
 bh=SjGTNsgqDLSrNruNbE10bCehNsCyYzZ0wgQB0afKoGk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=VpLAjGz561098v5Bfpi3bWK8Y+dlkkRe7v+ggm50VVggCVWcW04w/E1vgoeUahMkX
 qdH3Prv7Tnw7p2kYTnmg2gMFvksTgzN/eZecOiaPmnn5tV1UdcmbMLr3CIgNFwI2Bj
 uApI08ONv0B+Tov3XloJ1AERRr0FryfKoySKAsAxq9EowNPgjs/VLOxbVbWOSTQxE0
 6A0fj80+B5CXBtmT83krv/MABK6+JIFXEaus+UsrTOmf0YSarxEW5u3pOmdmgqSiK/
 70xJdOk75KvT1G5ObsIXG9Cv3n9Rk6gnrDac7B1X4c+hTs+8kiW8rOADMxct9mDvb8
 50TMnwjqYlCLA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=VpLAjGz5
Subject: Re: [Buildroot] [PATCH 1/1] package/php-memcached: bump version to
 3.4.0
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

On 20/11/2025 22:17, Bernd Kuhls wrote:
> Changelog: https://pecl.php.net/package-changelog.php?package=memcached
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
