Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DF9BC021B8
	for <buildroot@archiver.kernel.org>; Wed, 26 Feb 2025 21:34:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 026186104E;
	Wed, 26 Feb 2025 21:34:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vGRUxu6MIZ1R; Wed, 26 Feb 2025 21:34:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 232F36109A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 232F36109A;
	Wed, 26 Feb 2025 21:34:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B6ACE94F
 for <buildroot@buildroot.org>; Wed, 26 Feb 2025 21:34:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A55804139B
 for <buildroot@buildroot.org>; Wed, 26 Feb 2025 21:34:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zD_-fTEJV6Kx for <buildroot@buildroot.org>;
 Wed, 26 Feb 2025 21:34:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8C8AF41393
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8C8AF41393
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8C8AF41393
 for <buildroot@buildroot.org>; Wed, 26 Feb 2025 21:34:45 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 142CD19F522;
 Wed, 26 Feb 2025 22:34:41 +0100 (CET)
Received: from 2a01:e0a:485:b220:8213:2270:4a8d:a1d5
 via 2a01:e0a:485:b220:8213:2270:4a8d:a1d5 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 26 Feb 2025 22:34:40 +0100
MIME-Version: 1.0
Date: Wed, 26 Feb 2025 22:34:40 +0100
From: Julien Olivain <ju.o@free.fr>
To: Fabio Estevam <festevam@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250226205144.1843356-1-festevam@gmail.com>
References: <20250226205144.1843356-1-festevam@gmail.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <653e59841ccb147b93e0d411cc7d2e62@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1740605682;
 bh=9gMWuDCrHbFwPMAVgO/L7yCz/lAc192eXkwpdhF1kJU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=icZ2AlmY38CYj5gZYwtQwx9tfu9PyvuawhWV5B3t/fYwBRvauaertZYc0LZQ8E6AF
 xMs82XNcRdEw9MgC97aylzDUBF5JU9JQTwC/YwOvAFnR3OMumUy1u9fG3AXx6x+JXI
 PXdL/5JLOOwiCZwK4EmMLlxZ/aEHoYBESTPbBqj0fd7p17fTsXVcjuXMNi8e7gtrfc
 qMlttpZzqn8nt/EuHUNsH4+GiwGmqVuil8Wkh45+JTIY3iWxp40xJaM8H+v5kAEgz0
 i/xFFWIGlUNPu7HVrEwo6O4H4c4cXQyddwvjv4UW5Ibwoxhew3q5SMeLFWx+nocS0T
 Fbs7uYMQyHhJg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=icZ2AlmY
Subject: Re: [Buildroot] [PATCH 1/2] package/freescale-imx: Allow firmware
 installation on i.MX93
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

On 26/02/2025 21:51, Fabio Estevam wrote:
> Currently, the LPDDR firmware binaries do not get installed into the
> U-Boot mainline directory, causing U-Boot build to fail for i.MX93.
> 
> Fix this problem by expanding the BR2_PACKAGE_FIRMWARE_IMX_NEEDS_DDR_FW
> checks to also take BR2_PACKAGE_FIRMWARE_IMX_NEEDS_DDR_FW_IMX9 into 
> account.
> 
> Signed-off-by: Fabio Estevam <festevam@gmail.com>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
