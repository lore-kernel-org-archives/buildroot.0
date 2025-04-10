Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61B7EC3601E
	for <buildroot@archiver.kernel.org>; Thu, 10 Apr 2025 20:04:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2401A60797;
	Thu, 10 Apr 2025 20:04:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sOCWaCnjslOI; Thu, 10 Apr 2025 20:04:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5950760873
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5950760873;
	Thu, 10 Apr 2025 20:04:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 63984193
 for <buildroot@buildroot.org>; Thu, 10 Apr 2025 20:04:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 547FE4174B
 for <buildroot@buildroot.org>; Thu, 10 Apr 2025 20:04:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5JMROHcBp7na for <buildroot@buildroot.org>;
 Thu, 10 Apr 2025 20:04:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 683FA403E5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 683FA403E5
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 683FA403E5
 for <buildroot@buildroot.org>; Thu, 10 Apr 2025 20:04:46 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 541AE780316;
 Thu, 10 Apr 2025 22:04:42 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 10 Apr 2025 22:04:42 +0200
MIME-Version: 1.0
Date: Thu, 10 Apr 2025 22:04:42 +0200
From: Julien Olivain <ju.o@free.fr>
To: Meena Murthy <meena.murthy@amarulasolutions.com>
Cc: buildroot@buildroot.org, linux-amarula@amarulasolutions.com
In-Reply-To: <20250409073750.1561127-2-meena.murthy@amarulasolutions.com>
References: <20250409073750.1561127-2-meena.murthy@amarulasolutions.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <3d4363ff23adcd7a852ab55ab3ad9b3e@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1744315484;
 bh=mNpUddgt91qg41U2SLfkG1lQJBxs2v80l/NLPmkjL/E=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=tpH/QYMMPPCU/Ld+rZQLJRoLjI5H+873uh0aXh1TdIAmCYehkE3m9CGH9XIHZJ2nK
 oVaRFx3khZ+FUGoDgSPwdl6Ga6R7RfpwVijJctT7bK50dHYAAFakFW02TuW28sNmzA
 DdcXUKIQWRcLEWy5+5aEoP/jeWcznK2mc+HuFQXTodoGnk9GJ4bVWuKXk8QfeExoT0
 ecq+QFR5h0UQrdvodIbftHx9RsBBxbFi9+K7Ex3LUSb5UBwE1dBCYQ7Sv8UZ2cOFv0
 8Zje22ZJx8t7RIL2hIUTAXKD7ZcAeatGyNDMNbTmZJ8vUpsI6e18ARxI+TAB26Ktgk
 YkvZUto5ueUSA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=tpH/QYMM
Subject: Re: [Buildroot] [PATCH] configs/engicam_px30_core: bump Linux to
 6.12.22 and U-Boot to 2025.04
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

On 09/04/2025 09:37, Meena Murthy wrote:
> The patch bumps the Linux kernel to version 6.12.22 and U-Boot to
> version 2025.04.
> 
> Signed-off-by: Meena Murthy <meena.murthy@amarulasolutions.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
