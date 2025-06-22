Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61B49C7115C
	for <buildroot@archiver.kernel.org>; Sun, 22 Jun 2025 09:45:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 338CE4076A;
	Sun, 22 Jun 2025 09:45:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SO9KxZX82S9h; Sun, 22 Jun 2025 09:45:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BE87D40517
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BE87D40517;
	Sun, 22 Jun 2025 09:45:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 47F91C8
 for <buildroot@buildroot.org>; Sun, 22 Jun 2025 09:45:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3970260D87
 for <buildroot@buildroot.org>; Sun, 22 Jun 2025 09:45:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KDNX2MmVsvHz for <buildroot@buildroot.org>;
 Sun, 22 Jun 2025 09:45:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6C21B60BA7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6C21B60BA7
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6C21B60BA7
 for <buildroot@buildroot.org>; Sun, 22 Jun 2025 09:45:04 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id B1B4413F86A;
 Sun, 22 Jun 2025 11:45:00 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 22 Jun 2025 11:45:00 +0200
MIME-Version: 1.0
Date: Sun, 22 Jun 2025 11:45:00 +0200
From: Julien Olivain <ju.o@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20250621173019.3992829-1-bernd@kuhls.net>
References: <20250621173019.3992829-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <354f51759498fe2a3086ba233104e327@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1750585501;
 bh=JSgaQtRnqUVBM6Yl9gw9tgyGFumKfRHZHbbyzLbeqfk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=QqOTcspXQTqi1IcJGcrId9XaXPepZRNAYlcxWrQitb908XdMfpwn3+P34Kcq2wxE3
 R3Jwgvod0nujqweSUq0MCpU4bf4MtUjJISVaPPnoxmCHDY//YN2KNi+1iPILBENkRf
 2NMelNf5mL0+yXqMM1dUXF8t+BpBsWZBRmFpstcxuSk898TnPn5Hyn5gGK0aShJM2x
 uxKQwf22ffwzdWPUFZUXh3Dm+oR25UOun4dDOIqSqLYQEOfR9JpkrsFYbnTKIJrPgw
 C/2lVE86NYaF2GiBOIvo8ypwQhqnuk1L53XejPBRboQG0ZVH80xXjS5jf69g6xRKjC
 Zky9dBtyynAlQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=QqOTcspX
Subject: Re: [Buildroot] [PATCH 1/1] package/opencv3: bump version to 3.4.20
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

On 21/06/2025 19:30, Bernd Kuhls wrote:
> Changelog:
> https://github.com/opencv/opencv/wiki/OpenCV-Change-Logs-v2.2%E2%80%90v4.10#version3420
> 
> Updated license hash due to copyright year bump:
> https://github.com/opencv/opencv/commit/7b7774476e92247c801309387df2ea64465976e3
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
