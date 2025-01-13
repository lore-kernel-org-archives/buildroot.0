Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E36DC02180
	for <buildroot@archiver.kernel.org>; Mon, 13 Jan 2025 20:36:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1B25C60807;
	Mon, 13 Jan 2025 20:36:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Kj2ySx-LjQqt; Mon, 13 Jan 2025 20:36:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2DB9460812
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2DB9460812;
	Mon, 13 Jan 2025 20:36:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8D210940
 for <buildroot@buildroot.org>; Mon, 13 Jan 2025 20:36:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7ADF860807
 for <buildroot@buildroot.org>; Mon, 13 Jan 2025 20:36:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XyoGw8viYaGR for <buildroot@buildroot.org>;
 Mon, 13 Jan 2025 20:36:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C13A260812
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C13A260812
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C13A260812
 for <buildroot@buildroot.org>; Mon, 13 Jan 2025 20:36:31 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 605F113F879;
 Mon, 13 Jan 2025 21:36:23 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:33766])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 13 Jan 2025 21:36:23 +0100
MIME-Version: 1.0
Date: Mon, 13 Jan 2025 21:36:23 +0100
From: Julien Olivain <ju.o@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Buildroot List <buildroot@buildroot.org>, Alexey Brodkin
 <Alexey.Brodkin@synopsys.com>, Yuriy Kolerov <Yuriy.Kolerov@synopsys.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>, Romain Naour
 <romain.naour@gmail.com>
In-Reply-To: <20250113082350.241613-1-thomas.petazzoni@bootlin.com>
References: <20250113082350.241613-1-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <15f4d8fcf7410068378e82f7cadad563@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1736800588;
 bh=WdbCRPDmknKwUzqc5haxjHUUSnTNHJww/rbUdZpKNTg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=PN4W/7t8ak5BA3T8z1HgIvUkRZS6ScvHb56oJgqH4sC5GQKCRsRPTd7HhdqBKcM+E
 lj5vpAErRwbSNvYTrCCB1akYULaJ6wHG89TQqjRVmFNqkQj4bq+TbETR2vCm/dqYa0
 YyxWCwvMjbxx3xTCOwS5S9NC1l3DS8nxYUzM2KsUcJyfkzqk0NLYqRjDAArciD00Aa
 FLVd5it3t8GWwfj4wvTL46hZUFAm1jWJPP/K1VcgqD46mjzbcAvT5XJfypQE8fQbgg
 Pr3NM3IQ5xfW/2lxl3ucazURXtZGTEHC/SO/YVU/YCCb/iFdi2YAycP/fcurbqkdVM
 vWOApr5YWbYSw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=PN4W/7t8
Subject: Re: [Buildroot] [PATCH 1/2]
 toolchain/toolchain-external/toolchain-external-synopsys-arc: fix condition
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

On 13/01/2025 09:23, Thomas Petazzoni wrote:
> The option BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC just depends on
> BR2_arc, but the choice of toolchains that appears once
> BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC=y only has choices for:
> 
> 	depends on BR2_arc750d || BR2_arc770d
> 
> and
> 
> 	depends on BR2_archs38_64mpy || BR2_archs38_full || \
> 		BR2_archs4x_rel31 || BR2_archs4x
> 
> which means that if you have a BR2_archs38=y configuration, you end up
> with no choice of toolchain, and the build fails with "No C library
> selected". Fix this by making sure BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC
> can only be selected when an actual toolchain is available.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
