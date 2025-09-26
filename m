Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA64CCAC5AE
	for <buildroot@archiver.kernel.org>; Fri, 26 Sep 2025 17:25:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8A9CB84381;
	Fri, 26 Sep 2025 17:25:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LcB1DpYA--XE; Fri, 26 Sep 2025 17:25:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AC3ED84431
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AC3ED84431;
	Fri, 26 Sep 2025 17:25:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id B3795177
 for <buildroot@buildroot.org>; Fri, 26 Sep 2025 17:25:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A593041E30
 for <buildroot@buildroot.org>; Fri, 26 Sep 2025 17:25:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Luqwbis5evw1 for <buildroot@buildroot.org>;
 Fri, 26 Sep 2025 17:25:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E5B0C406F5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E5B0C406F5
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E5B0C406F5
 for <buildroot@buildroot.org>; Fri, 26 Sep 2025 17:25:07 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 78BCEB00548;
 Fri, 26 Sep 2025 19:24:56 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 26 Sep 2025 19:24:56 +0200
MIME-Version: 1.0
Date: Fri, 26 Sep 2025 19:24:56 +0200
To: Neal Frager <neal.frager@amd.com>
Cc: buildroot@buildroot.org, ibai.erkiaga-elorza@amd.com,
 luca.ceresoli@bootlin.com, yann.morin@orange.com, brandon.maier@collins.com,
 thomas.petazzoni@bootlin.com, romain.naour@smile.fr, michal.simek@amd.com,
 romain.naour@gmail.com
In-Reply-To: <20250901080249.454090-1-neal.frager@amd.com>
References: <20250901080249.454090-1-neal.frager@amd.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <288e4e3207c7d674cdbd9a9fc6378351@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1758907506;
 bh=m5FykdMf+ztDEY680sAl91CczKeUsMs9S6il3tNR34Q=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ZfBrYYGwBuxCXwuS0NOBAjbwiEMW57fkpKoSwpeuPxfHEwxWQaY2dSH1Y/QsVEAsK
 zLmFqxPfR9nfxccMyv/hVZ34Sh9+k7mUB+z0PzkqPbmEC/KLXeRy9VABgnP7A8J1tj
 heV6GKcsXb9I3lKy6+DJsO8iRhrhIxbVcM3O7QOiFzI57i9uTqp4icimE1Q3E82JdA
 rNNu9mKhMnlUrxNDdBbcy+38cy5tZdTshYmVTS7iV/pIhA5yHt328jNwqDTuskUICG
 JNncBHNuRmg80IW9iEk88fCL4EKbZkszkF1gGx0X8YffkqlMm0RMKvT75ylA1bhnWr
 PZ39siOXw91rg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ZfBrYYGw
Subject: Re: [Buildroot] [PATCH v7 1/5] boot: add
 BR2_TARGET_XILINX_FIRMWARE_ARCH_SUPPORTS
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

On 01/09/2025 10:02, Neal Frager via buildroot wrote:
> Currently, the xilinx-embeddedsw and xilinx-prebuilt packages are 
> appearing
> for any aarch64 processor. As all Xilinx processors that need these 
> packages
> are ARM Cortex-A53 or ARM Cortex-A72, this means that these packages 
> are
> often appearing as options for non-Xilinx platforms.
> 
> To reduce this occurrence, this patch creates a new symbol
> BR2_TARGET_XILINX_FIRMWARE_ARCH_SUPPORTS to limit the appearance of the
> xilinx-embeddedsw and xilinx-prebuilt boot packages to only platforms 
> based
> on the BR2_cortex_a53 or BR2_cortex_a72 CPU and aarch64 architecture.
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
