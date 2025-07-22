Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ACF1C83F1A
	for <buildroot@archiver.kernel.org>; Tue, 22 Jul 2025 17:10:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2287961201;
	Tue, 22 Jul 2025 17:10:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TSrhlW47VZzn; Tue, 22 Jul 2025 17:10:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6C1EF611BE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6C1EF611BE;
	Tue, 22 Jul 2025 17:10:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7DF39E0
 for <buildroot@buildroot.org>; Tue, 22 Jul 2025 17:10:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6EEE3807C5
 for <buildroot@buildroot.org>; Tue, 22 Jul 2025 17:10:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7AqvBNqB5kGO for <buildroot@buildroot.org>;
 Tue, 22 Jul 2025 17:10:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BE836807C4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BE836807C4
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BE836807C4
 for <buildroot@buildroot.org>; Tue, 22 Jul 2025 17:10:17 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id C9AAE60143;
 Tue, 22 Jul 2025 19:10:14 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 22 Jul 2025 19:10:14 +0200
MIME-Version: 1.0
Date: Tue, 22 Jul 2025 19:10:14 +0200
To: Markus Mayer <mmayer@broadcom.com>
Cc: Buildroot Mailing List <buildroot@buildroot.org>
In-Reply-To: <20250722004829.1101836-1-mmayer@broadcom.com>
References: <20250722004829.1101836-1-mmayer@broadcom.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <910502cf3da657ab4846b47f3f7a459b@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1753204215;
 bh=AA9nrvbsB/dhomHdzDGH0YLIGgnAu/J0+yKi37dglG0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=QM4vaqOluPV1B8RXiCekd+JP9Xd3nDfnEGu6co9B4eUOWMAzamr2Y/qTyGBILBIiQ
 ZdijxKDeAEWfvdzwSn5jJZ/3o5djlSizQTlI/GHxyYkohys//8tUsRUvTrUU9qlWy7
 nixYucZi1hsw401uOdUxGdQp8hVc/od3YSeZaAGiQBmrugVU1LCfTWJ6AS3EP6sxe1
 +GPpUV1HLZdemQWqenIby+KM9ZQ9kolMNWAGV6G6ePBC19JSL5+jnR9lyGnJpgW/pF
 SU75hyosnsg4g0v86YICiWSIwjQy6CDsb8O7bFT69He6T5KPCWnruQav9nl0kB1/yI
 AKJYEq8I8pXzA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=QM4vaqOl
Subject: Re: [Buildroot] [PATCH] toolchain/toolchain-wrapper.c: fix
 indentation
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

On 22/07/2025 02:48, Markus Mayer via buildroot wrote:
> A recent commit introduced a few lines that were indented with spaces
> rather than a tab. Rectify this.
> 
> Fixes: 00b30f887ac2 ("toolchain-wrapper.c: get rid of EXCLUSIVE_ARGS")
> Signed-off-by: Markus Mayer <mmayer@broadcom.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
