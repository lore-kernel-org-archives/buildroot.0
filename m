Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 386D0C83F25
	for <buildroot@archiver.kernel.org>; Mon, 21 Jul 2025 21:05:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 07559428A3;
	Mon, 21 Jul 2025 21:05:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xGwfmi1-0nXN; Mon, 21 Jul 2025 21:05:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2775B4289D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2775B4289D;
	Mon, 21 Jul 2025 21:05:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id B94AEE0
 for <buildroot@buildroot.org>; Mon, 21 Jul 2025 21:05:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AB3844024A
 for <buildroot@buildroot.org>; Mon, 21 Jul 2025 21:05:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bBhUPs9Tt1bb for <buildroot@buildroot.org>;
 Mon, 21 Jul 2025 21:05:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0C88C40282
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0C88C40282
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0C88C40282
 for <buildroot@buildroot.org>; Mon, 21 Jul 2025 21:05:49 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 0E9F7780372;
 Mon, 21 Jul 2025 23:04:56 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 21 Jul 2025 23:04:56 +0200
MIME-Version: 1.0
Date: Mon, 21 Jul 2025 23:04:56 +0200
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>,
 Kris Bahnsen <kris@embeddedts.com>, Louis Aussedat
 <aussedat.louis@gmail.com>, Sergey Matyukevich <geomatsi@gmail.com>
In-Reply-To: <20250701190841.714026-6-giulio.benetti@benettiengineering.com>
References: <20250701190841.714026-1-giulio.benetti@benettiengineering.com>
 <20250701190841.714026-6-giulio.benetti@benettiengineering.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <60dec1cacf69ed6b2d393f623ffa10a2@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1753131902;
 bh=sKY8V1F3RQ5ePxpFkoi69q8gDw9B90LBaCDXmR3OWy0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=uLW/QOugZUaLuCXyE6igX3aIulwGrChYWyVxOCfjEWOzPgqZ7GDynPIHouhEfL0os
 nIQLaXnmjHDYhrlbBKQYozvczDV8NWCuozvZuy6W94wDaK4cGBTJPbcsSDIGaqW/cq
 uv1jQcQnWJSR+FIbYT38n5aw79F5hMfaoQn8EE6D+rICxYYlzMhwBBjHhdhJ8CcQIb
 08QyFX+FfV73ywsM8UFQUEJLKWbmqw4v6KjZ5jdbGyoj3b2i5bocvBDS90blSFqcWC
 wgKHymetkauS4AMLKOoVPMt6VPU/tVAoWqsE+kQyiRP8NAJInyjCyX+JoVXEKNaBkQ
 GLhMNI07PedbQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=uLW/QOug
Subject: Re: [Buildroot] [PATCH] package/wilc-driver: fix build failure with
 Linux 6.15
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

On 01/07/2025 21:08, Giulio Benetti wrote:
> Add 2 local patches pending upstream to fix build failure with Linux 
> 6.15.
> 
> Fixes:
> still not occured.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
