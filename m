Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40E57C36002
	for <buildroot@archiver.kernel.org>; Mon, 24 Mar 2025 20:00:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F26DB60C24;
	Mon, 24 Mar 2025 20:00:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 11iNNKo5tE71; Mon, 24 Mar 2025 20:00:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2DFC760C14
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2DFC760C14;
	Mon, 24 Mar 2025 20:00:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4A402E0
 for <buildroot@buildroot.org>; Mon, 24 Mar 2025 20:00:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3C1D740BFF
 for <buildroot@buildroot.org>; Mon, 24 Mar 2025 20:00:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ofAjcbjjJ0y3 for <buildroot@buildroot.org>;
 Mon, 24 Mar 2025 20:00:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2E2D44056A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2E2D44056A
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2E2D44056A
 for <buildroot@buildroot.org>; Mon, 24 Mar 2025 20:00:09 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id A0714780511;
 Mon, 24 Mar 2025 21:00:04 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:57018])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 24 Mar 2025 21:00:04 +0100
MIME-Version: 1.0
Date: Mon, 24 Mar 2025 21:00:04 +0100
From: Julien Olivain <ju.o@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Mauro Condarelli <mc5686@mclink.it>
In-Reply-To: <20250323190351.3335904-1-bernd@kuhls.net>
References: <20250323190351.3335904-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.10
Message-ID: <23b61889c058463a2e8964eede8fe49e@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1742846406;
 bh=aXv4jzLf+1S62FgCigXcPlquKZE5UbZmmgTTI1pwWqw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=dA/Lq53+NOqrJ1tC2FXD555cfDZNELOz1ZKo8AQy14rCNLEzPoYgRZH8eS81iU2ff
 Jqrlkvr/PpIKaxaAFzXZ6QjlYJH56a+C2GFkyEFqG1CBDocoKJ33oZ8Jdzs6dq0G0x
 1eFC/6HjMEtlVHVIgC/PEW0uHAtOB9S5LtHBAA6Jb/VSVBeGm+BfpcltIQcVSc7jSt
 hsBvrUUr4ZRgG7S/zEj9hFXvteqqLmk5uUZ3JSsJVcSTExjU2+Z3GEjwPUt0tvjD5p
 NiOjF2Yfo3+RMGKeEj6WyLbGspKqDDEGJW+hLjOd0CisS/OZiRw9L6u8fcQl+8kfTU
 /4Ah0d6QL9Rcw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=dA/Lq53+
Subject: Re: [Buildroot] [PATCH 1/1] package/mc: bump version to 4.8.33
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

On 23/03/2025 20:03, Bernd Kuhls wrote:
> Changelog: https://github.com/MidnightCommander/mc/blob/master/doc/NEWS
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
