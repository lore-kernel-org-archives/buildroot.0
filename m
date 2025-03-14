Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 572FEC282EC
	for <buildroot@archiver.kernel.org>; Fri, 14 Mar 2025 17:57:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EFF976074F;
	Fri, 14 Mar 2025 17:57:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XSqG7RLIuscv; Fri, 14 Mar 2025 17:57:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1940660765
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1940660765;
	Fri, 14 Mar 2025 17:57:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 35694C8
 for <buildroot@buildroot.org>; Fri, 14 Mar 2025 17:57:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 304F1412FD
 for <buildroot@buildroot.org>; Fri, 14 Mar 2025 17:57:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NgcjXPxnu3V7 for <buildroot@buildroot.org>;
 Fri, 14 Mar 2025 17:57:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0F619412E2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0F619412E2
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0F619412E2
 for <buildroot@buildroot.org>; Fri, 14 Mar 2025 17:57:24 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id CC7D56013F;
 Fri, 14 Mar 2025 18:57:20 +0100 (CET)
Received: from 2a01:e0a:485:b220:8213:2270:4a8d:a1d5
 via 2a01:e0a:485:b220:8213:2270:4a8d:a1d5 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 14 Mar 2025 18:57:20 +0100
MIME-Version: 1.0
Date: Fri, 14 Mar 2025 18:57:20 +0100
From: Julien Olivain <ju.o@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20250313191535.2659102-1-bernd@kuhls.net>
References: <20250313191535.2659102-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.10
Message-ID: <b7c2164fc084abab749c2b16f7812a6f@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1741975042;
 bh=Bc0YDsrYyS+NDuaBKxTTTUj/PHU4coK6fZ03PEq7A58=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=MBIdB4tjfDaIrVks5HxVEFi4SK2SjWW1iwrRQrymT6/oiyA3aXt0KSuBIjtIZCkHB
 9dnA4+V6jdmDbDm6YzhW3AUcmSKdKIlP4zHyauG+LBX1sTlNsuWssZ6F3M3+8TwRBj
 4tC6WMFykWtvDrrm2JDlASXQGyiJlJzsCfZK5H0sPcyy49nHfudbGuiU4aIeekKzL0
 bmz23EN9G7TZYw4DIMJFurAjZQMHxuiK4mwa+JGSXzeYbTlCERNKQCEM2gFm4U+/ez
 nWdpuJCZgL1qlfejfikb94JBAPzvaCR13s2nQ6S/Wth8ez1noplpwGWHaNCI9p5BhC
 z7orK152zYu0g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=MBIdB4tj
Subject: Re: [Buildroot] [PATCH 1/1] package/php: security bump version to
 8.3.19
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

On 13/03/2025 20:15, Bernd Kuhls wrote:
> Changelog: https://www.php.net/ChangeLog-8.php#PHP_8_3
> 
> Release notes: https://news-web.php.net/php.announce/455
> "(The 8.3.18 release was skipped due to the erroneous omission of a
> non-security related patch.)"
> 
> Fixes CVE-2024-11235, CVE-2025-1219, CVE-2025-1736, CVE-2025-1861,
> CVE-2025-1734, and CVE-2025-1217.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
