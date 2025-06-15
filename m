Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92971C61CE8
	for <buildroot@archiver.kernel.org>; Sun, 15 Jun 2025 14:21:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6832560BF0;
	Sun, 15 Jun 2025 14:21:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u3MRP7lahvRS; Sun, 15 Jun 2025 14:21:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9AEA6608FE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9AEA6608FE;
	Sun, 15 Jun 2025 14:21:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1E44B1A4
 for <buildroot@buildroot.org>; Sun, 15 Jun 2025 14:21:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0FF9780E29
 for <buildroot@buildroot.org>; Sun, 15 Jun 2025 14:21:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ESKggLYf4R5T for <buildroot@buildroot.org>;
 Sun, 15 Jun 2025 14:21:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3DB2C80E24
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3DB2C80E24
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3DB2C80E24
 for <buildroot@buildroot.org>; Sun, 15 Jun 2025 14:21:46 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 5895D19F5C3;
 Sun, 15 Jun 2025 16:21:42 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 15 Jun 2025 16:21:42 +0200
MIME-Version: 1.0
Date: Sun, 15 Jun 2025 16:21:42 +0200
From: Julien Olivain <ju.o@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20250612165959.3474050-1-bernd@kuhls.net>
References: <20250612165959.3474050-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <27e47304a89c8065bc3e02b63fb61a85@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1749997303;
 bh=g8Hr8iZynUVNjzQSNKQ/rcH5IAzvxR60aDk+9k42bBM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=IjpRcCDI0KpqVdIsvWRDWmqBjIZfT5k1dV5TY6u6I7s5urqRIArzD+dMykGryigx0
 MNp59Qb226J6L5XMTMdg9G1ZKU1dAzgpaA7Wo43YR4l0kK69t0dqsaDyMyz2R3sUs5
 RogkZuppADMO8vQrXGFEKPaVbaWOzB313jzT09WpIYy6ZdDng+eqJhAr6J5Geq1Xfi
 hzQQsFXpbkhwQkgEaCexNut9AxpostULqq/L2H0UxE+YeeeZsrqiNj5OrCJ7xLL6OM
 +LK83i13Z7RWQHVMysQ28s83DI1vkDwmuajU6I6fUao6pB5KFWT1rKHcY6Vaxwo0Fb
 5KOcGgw67PpIQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=IjpRcCDI
Subject: Re: [Buildroot] [PATCH 1/1] package/libdrm: bump version to 2.4.125
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

On 12/06/2025 18:59, Bernd Kuhls wrote:
> Release notes:
> https://lists.x.org/archives/xorg-announce/2025-June/003606.html
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
