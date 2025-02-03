Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED081C02192
	for <buildroot@archiver.kernel.org>; Mon,  3 Feb 2025 17:53:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8B55B403D9;
	Mon,  3 Feb 2025 17:53:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oQV7h5Y3Ugtl; Mon,  3 Feb 2025 17:53:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ABECC404EF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id ABECC404EF;
	Mon,  3 Feb 2025 17:53:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A99A112A
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 17:53:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 97FAD605AD
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 17:53:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QdDlumoQy2v5 for <buildroot@buildroot.org>;
 Mon,  3 Feb 2025 17:53:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 141CB605D1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 141CB605D1
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 141CB605D1
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 17:53:39 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 1ACB219F5AF;
 Mon,  3 Feb 2025 18:53:36 +0100 (CET)
Received: from 94.105.106.182.dyn.edpnet.net ([94.105.106.182:56118])
 via 94.105.106.182.dyn.edpnet.net ([94.105.106.182])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 03 Feb 2025 18:53:36 +0100
MIME-Version: 1.0
Date: Mon, 03 Feb 2025 18:53:36 +0100
From: Julien Olivain <ju.o@free.fr>
To: Akhilesh Nema <nemaakhilesh@gmail.com>
Cc: buildroot@buildroot.org, Brandon Maier <brandon.maier@collins.com>
In-Reply-To: <20250130103003.15795-1-nemaakhilesh@gmail.com>
References: <20250130103003.15795-1-nemaakhilesh@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <48aee5b49bb3172631abd80d20800bb1@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1738605218;
 bh=ws/096vKwuFj1zrAKTWDRpG+Fb8jCA1SphQM0+xXrwQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=CmDwMxQPlfhHZyM5ikaIaOD1MOXtuH/62bndbDMx/qeAXRE+F2O/+G/EqBwxpmu6H
 ozOwB0lnWJN/EBhJAghI51lc6v6pli6Cv3TCITQ4MjLNo3uog5kQpzC0tzmhjq+EtH
 WetBZu70hiCc1rasB7km4t/BGhJZ4lX1N9KNwFr6UImLJPGY2EX97Ak4hcmnanU89I
 hkyNQVZ2+yJrmNl2TS2sRiBpyqRsqZIb1+hMP2vceNNWBXajJI2igKeYafbtwfmfBI
 yI+UhRmrzxuJ0BD1w/2vnpHYK9NM889bUZyHzIx1YgxouJZmOajfoqjKH6guMzwREO
 znU3QOG0BcDcw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=CmDwMxQP
Subject: Re: [Buildroot] [PATCH 1/1] configs/ls1043a-rdb: new defconfig
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

On 30/01/2025 11:30, Akhilesh Nema wrote:
> This is a reference design board for the NXP LS1043A SoC.
> 
> The config is heavily based on the ls1046a-frwy_defconfig.
> 
> see 
> https://www.nxp.com/design/design-center/development-boards-and-designs/LS1043A-RDB
> 
> Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
