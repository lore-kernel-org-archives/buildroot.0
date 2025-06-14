Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB4DCC7114A
	for <buildroot@archiver.kernel.org>; Sat, 14 Jun 2025 21:47:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8FCC940613;
	Sat, 14 Jun 2025 21:47:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bm6LI52HEwRt; Sat, 14 Jun 2025 21:47:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D4F4640625
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D4F4640625;
	Sat, 14 Jun 2025 21:47:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id E3931151
 for <buildroot@buildroot.org>; Sat, 14 Jun 2025 21:47:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DD3A640613
 for <buildroot@buildroot.org>; Sat, 14 Jun 2025 21:47:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KUk_W4f-orQc for <buildroot@buildroot.org>;
 Sat, 14 Jun 2025 21:47:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 037BF40625
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 037BF40625
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 037BF40625
 for <buildroot@buildroot.org>; Sat, 14 Jun 2025 21:47:14 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 676C413F880;
 Sat, 14 Jun 2025 23:47:04 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 14 Jun 2025 23:47:04 +0200
MIME-Version: 1.0
Date: Sat, 14 Jun 2025 23:47:04 +0200
From: Julien Olivain <ju.o@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Daniel Lang <dalang@gmx.at>, Joseph Kogut
 <joseph.kogut@gmail.com>, Romain Naour <romain.naour@gmail.com>, Valentin
 Korenblit <valentinkorenblit@gmail.com>, El Mehdi YOUNES
 <elmehdi.younes@smile.fr>
In-Reply-To: <20250614134927.688175-1-bernd@kuhls.net>
References: <20250614134927.688175-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <2841e0eb1f7b7a9b2f490f9ea40601dc@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1749937632;
 bh=Rd9Rp55QdaoZ5pI01gUwA5jj5pAtWofBK3WXEt6LISE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=b8XXyQo+qzOBf9Grfx343SGJ/DPDWrp5D2Jo24oPM0ijfavejAclh1E+6RXCx53jQ
 503sT9Rjh20YL45PE/4D0Q1rRNutcAKFGaOypKXeqzlkUFFdMIn+HNqk68ve0cVwcH
 PlnQuhL4AOy1WgZX9ALR7127jwxmCoP9oZw5p0ya/l/mcRhQFVHCczzaa8Pk02F+9w
 o2Q0cxmQ/qtjQkbSZGuTSW7pbpNR4Unol82nMQkyT7ltMNvHZog1QlJI3466TI0n8k
 QM67LOEzgAey0y3eG6xJ5IAgmVhL2JYP82IwjY/FfFjkgfFwltT58Az7Bv5ROHlRgP
 GSvKONv9Wko9g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=b8XXyQo+
Subject: Re: [Buildroot] [PATCH 1/1] package/llvm-project: bump to version
 20.1.7
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

On 14/06/2025 15:49, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
