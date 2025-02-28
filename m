Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F1FDC282C5
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 22:39:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2E9FD7054E;
	Fri, 28 Feb 2025 22:37:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qu2XuRCl7dwX; Fri, 28 Feb 2025 22:37:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 46D5270A12
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 46D5270A12;
	Fri, 28 Feb 2025 22:32:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4D2DC1CB
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 22:31:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1009E441A7
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 22:11:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p1HYv5HYrhkv for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 22:11:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5AF6949CAC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5AF6949CAC
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5AF6949CAC
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 21:03:03 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id E26142003CC;
 Fri, 28 Feb 2025 22:02:57 +0100 (CET)
Received: from 2a01:e0a:485:b220:8213:2270:4a8d:a1d5
 via 2a01:e0a:485:b220:8213:2270:4a8d:a1d5 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 28 Feb 2025 22:02:57 +0100
MIME-Version: 1.0
Date: Fri, 28 Feb 2025 22:02:57 +0100
From: Julien Olivain <ju.o@free.fr>
To: Fiona Klute <fiona.klute@gmx.de>
Cc: buildroot@buildroot.org, Ricardo Martincoski
 <ricardo.martincoski@datacom.com.br>
In-Reply-To: <20250217153127.1363472-2-fiona.klute@gmx.de>
References: <20250217153127.1363472-1-fiona.klute@gmx.de>
 <20250217153127.1363472-2-fiona.klute@gmx.de>
User-Agent: Webmail Free/1.6.10
Message-ID: <81df7c1059c279de0fde65d96ff8ff37@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1740776580;
 bh=rPR2jjem7KYRfVGRKfWe4qWBuGrOM8hVrYUpA8XNvVE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=eH0dPZY/5aa9ddkN4OjWeaV6yDJbqC17a1BP+jIi3ZK+Vihwbjgi5G7uC8B1q1JL+
 ORCSowt6tFxaWm/dmGy2A+3EzGtQ4pKyiNa+hANeUtNxax2zyXo48Z0iWqvgZTVcDD
 9VAIsjoqqbDdIXYRKrsw1AV363gPEIC1rL7jtxtfoE5msf9RflxtiCGFQ4r5rzSzbm
 eIUSWcQNmt0QFTssb1b+DSewnrv7TgypL+S6Xw0FrYnIUL2Ixm+GDMHYLMTYI7sh9x
 pMzOKfMPSx9UhLfi+SdvYLGwtU5OpOztrmSNuYJzSnfpTfHqn4ImtpWj231yGsnKLQ
 adWG6jXq4GaEw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=eH0dPZY/
Subject: Re: [Buildroot] [PATCH v6 1/6] package/nftables: add init script
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

On 17/02/2025 16:31, Fiona Klute via buildroot wrote:
> From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>
> 
> The init script handles an nftables ruleset file with support for
> atomic reloading. By default the ruleset is expected in
> /etc/nftables.conf, the location can be changed in
> /etc/default/nftables. If the ruleset file does not exist, the script
> does nothing and shows a warning about that fact.
> 
> Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>

Series applied to next, thanks!
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
