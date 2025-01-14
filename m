Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA6CEC02183
	for <buildroot@archiver.kernel.org>; Tue, 14 Jan 2025 22:15:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9C89740405;
	Tue, 14 Jan 2025 22:15:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nTqqyA-2H_nU; Tue, 14 Jan 2025 22:15:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7ED124049B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7ED124049B;
	Tue, 14 Jan 2025 22:15:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8D11AB8B
 for <buildroot@buildroot.org>; Tue, 14 Jan 2025 22:15:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6999E40473
 for <buildroot@buildroot.org>; Tue, 14 Jan 2025 22:15:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JFNcCdrsezoc for <buildroot@buildroot.org>;
 Tue, 14 Jan 2025 22:15:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7758C40329
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7758C40329
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7758C40329
 for <buildroot@buildroot.org>; Tue, 14 Jan 2025 22:15:52 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 2F25F19F59C;
 Tue, 14 Jan 2025 23:15:47 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:35620])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 14 Jan 2025 23:15:47 +0100
MIME-Version: 1.0
Date: Tue, 14 Jan 2025 23:15:47 +0100
From: Julien Olivain <ju.o@free.fr>
To: Romain Naour <romain.naour@smile.fr>
Cc: buildroot@buildroot.org, Antoine Coutant <antoine.coutant@smile.fr>
In-Reply-To: <20250113130322.3962035-1-romain.naour@smile.fr>
References: <20250113130322.3962035-1-romain.naour@smile.fr>
User-Agent: Webmail Free/1.6.9
Message-ID: <d04d59de856e75c1faf18c4388ffbf00@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1736892949;
 bh=j5vI5aO1dc2eAzc8IlNUIEr9Icl8sEHxsMKxhqY258k=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=f1+S+JdyxZx9bA+G6yaCws31Zk2YSkToUDaUmMhOPVSgLKdn6uuiUBtfDx3ISRCct
 xmaRAGTsHkYIWHwu7tQ3CctmlPaghCgV0hSV7rhfIYy6W70NRUSB668lDUgQ1OerL2
 4Dt9vXBJ74x2tNHPOSAT31d5vBigl9QnFdAZaIO5tzxbgHVngPR72vjT+333fvkBKk
 RorXupPIIEfG9c0pMKUaOs+dWzQopyF/FXwsd+YR+lryla5BGrVrJbd72q0qSzalZN
 v5th5vF/+0YHVYB3frvfoBH5CYVaYWyvc8btpCcJ2C4ncc36fceHu+fQPrO5VyJsma
 o8rPG4y4T9OIQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=f1+S+Jdy
Subject: Re: [Buildroot] [PATCH 1/6]
 toolchain/toolchain-external/toolchain-external-arm-arm: fix
 BR2_ARCH_NEEDS_GCC_AT_LEAST_X guard
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

On 13/01/2025 14:03, Romain Naour via buildroot wrote:
> BR2_ARCH_NEEDS_GCC_AT_LEAST_X guards has been introduced by [1] to
> prevent selecting an external toolchain that did not support the GCC
> arch tuning the user had selected.
> 
> But it was not updated while updating to to version 13.2-rel1.
> 
> Fixes: 0dd599d171df7852ae801173c8212976e50b09e1
> 
> [1] eed1670d8a6f0899f5fdfc26bd6d1609ebc19c7a
> 
> Cc: Antoine Coutant <antoine.coutant@smile.fr>
> Signed-off-by: Romain Naour <romain.naour@smile.fr>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
