Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 859A3C5B552
	for <buildroot@archiver.kernel.org>; Mon,  9 Jun 2025 21:36:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5622F41DD8;
	Mon,  9 Jun 2025 21:36:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J_O48lKgr-Hu; Mon,  9 Jun 2025 21:36:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9449441DE1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9449441DE1;
	Mon,  9 Jun 2025 21:36:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 650FECD
 for <buildroot@buildroot.org>; Mon,  9 Jun 2025 21:36:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 548EF41DE1
 for <buildroot@buildroot.org>; Mon,  9 Jun 2025 21:36:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MWVQdweW_5zM for <buildroot@buildroot.org>;
 Mon,  9 Jun 2025 21:36:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4FE7B41DD8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4FE7B41DD8
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4FE7B41DD8
 for <buildroot@buildroot.org>; Mon,  9 Jun 2025 21:36:43 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 38F2719F57E;
 Mon,  9 Jun 2025 23:36:33 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 09 Jun 2025 23:36:33 +0200
MIME-Version: 1.0
Date: Mon, 09 Jun 2025 23:36:33 +0200
From: Julien Olivain <ju.o@free.fr>
To: Neal Frager <neal.frager@amd.com>
Cc: buildroot@buildroot.org, ibai.erkiaga-elorza@amd.com,
 luca.ceresoli@bootlin.com, brandon.maier@collins.com,
 thomas.petazzoni@bootlin.com, romain.naour@smile.fr, michal.simek@amd.com
In-Reply-To: <20250602135056.404165-1-neal.frager@amd.com>
References: <20250602135056.404165-1-neal.frager@amd.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <8902c231686bbdd1587d44d53d707759@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1749505000;
 bh=Y89+rKoOQweSqJtO9VlDUkYqM/EZ0lQTyt80aliTIio=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=neRnXHFUwDGjJ4wLmIKVigp+sJ990N+WtWVnG9iyGyC5j+EThTJCfcQY3BWKRq6A3
 MDOHlSCcr1h2q5WYiTjLC00Q4TXbsgYsWsaHTEe3UDkVBrgtGffiQsJBf6C0k6Zk1+
 WS7RiQJhAEUbuGNfYBMae9M5FsWctZ5IXem5kEYqsQfjLqk3svvcTkeas29Z8W/phB
 Hjp7l6GeW2cutcIXFO6ejS2T2H6UCugAoAJH4XYstUxMQZZTD/YRRQfRy/MDANCs5g
 89utZMGM2jSwG8g+6I5MIDle6xT6HuTAJ5BiRIfE/wH9JeDH411O2kB4trMdy3A2ys
 LWyIPNJeXCyag==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=neRnXHFU
Subject: Re: [Buildroot] [PATCH v1 1/5] board/xilinx: add xilinx_v2025.1
 support
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

On 02/06/2025 15:50, Neal Frager via buildroot wrote:
> Add hashes for xilinx_v2025.1 release.
> 
> xilinx_v2025.1 release includes:
>  - atf 2.12
>  - linux 6.12.10
>  - uboot 2025.01
> 
> In addition, the xilinx_v2025.1 linux kernel release tag has a Kconfig 
> leak
> of the CONFIG_XILINX_AIE option.  This patch adds a patch that is 
> specific to
> the Xilinx Linux 6.12.10 release which fixes the problem by moving the 
> changes
> implemented by the CONFIG_XILINX_AIE option from the exposed uapi 
> header file
> to the Linux internal header file.
> 
> The patch has been added to the board/xilinx/linux_6.12/patches 
> directory, so
> that it will only be applied when a user specifies they wish to build 
> the
> xilinx_v2025.1 release or they use a defconfig that has migrated to 
> this
> release.
> 
> Since the header file that causes the issue is not yet mainline, this 
> patch
> has been "upstreamed" to the Xilinx linux-xlnx repo via the AMD 
> internal jira
> process.
> 
> Upstream: internal AMD jira process
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>

Series applied to next, thanks.

For info, I fixed two minor check-package errors. See:
https://gitlab.com/buildroot.org/buildroot/-/commit/93c4e7bdbfd50d4ac1bb23ff48147728881eda7a

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
