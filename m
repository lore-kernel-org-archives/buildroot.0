Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8378CF58E7
	for <buildroot@archiver.kernel.org>; Fri, 20 Sep 2024 08:01:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F2DF84143F;
	Fri, 20 Sep 2024 08:01:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cT9S8gxS51DS; Fri, 20 Sep 2024 08:01:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 84DC8412A8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 84DC8412A8;
	Fri, 20 Sep 2024 08:01:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3BBB61BF82C
 for <buildroot@lists.busybox.net>; Fri, 20 Sep 2024 08:01:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2B6BD84C23
 for <buildroot@lists.busybox.net>; Fri, 20 Sep 2024 08:01:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qawv1NyHO9fd for <buildroot@lists.busybox.net>;
 Fri, 20 Sep 2024 08:01:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:660:530d:201::44; helo=mailgw-out1.grenoble.cnrs.fr;
 envelope-from=bonet@grenoble.cnrs.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A997584C1E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A997584C1E
Received: from mailgw-out1.grenoble.cnrs.fr (mailgw-out1.grenoble.cnrs.fr
 [IPv6:2001:660:530d:201::44])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A997584C1E
 for <buildroot@buildroot.org>; Fri, 20 Sep 2024 08:01:14 +0000 (UTC)
Received: from [147.173.65.159] (unknown [147.173.65.159])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mailgw-out1.grenoble.cnrs.fr (Postfix) with ESMTPSA id 5D8E5C1B4D
 for <buildroot@buildroot.org>; Fri, 20 Sep 2024 10:01:11 +0200 (CEST)
Message-ID: <e35baa79-3f30-4a85-b811-d3d662e6f96a@grenoble.cnrs.fr>
Date: Fri, 20 Sep 2024 10:01:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: buildroot@buildroot.org
References: <20240919202026.723863-1-yann.morin.1998@free.fr>
Content-Language: en-US
From: Edgar Bonet <bonet@grenoble.cnrs.fr>
In-Reply-To: <20240919202026.723863-1-yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=grenoble.cnrs.fr; 
 s=202106-grenoble.cnrs.fr; t=1726819271;
 bh=3nrIIOehsqa9MrKS4vpOTzcZVnK+gSCK/YZjRwJoAHY=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=herR+LbML3dfYW4M6g/JxOsmUQa2SnXQoR4ptKHV35Un+9eD26yLbOtlW7BX0xhYX
 +QyGCVjfFZiAlIQHHRnmsAJ9Lk2hDBHhOfReuUrAUbrYR1nzmJbv+ugDHUw4GMMd4F
 Yw///WEWOlmFRqS6LEy+iPCvv0pBe08m2qSmaw65ajZkYeqVxuWKx8saqsvsYNzfqZ
 nWCZoU9E9mHUWIdcNnqr1L08bVHFDac3D/L6YJvUhmCk7PmHEUFqrOTjTklqzLSInE
 BdFBEP5hpBA/brPD8B7U5BXrlpkhHkFDrLSSN0639XESLYqcmODtY3xw/u0RnrsYs8
 OteTnOxsZs2IA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=grenoble.cnrs.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=grenoble.cnrs.fr header.i=@grenoble.cnrs.fr
 header.a=rsa-sha256 header.s=202106-grenoble.cnrs.fr header.b=herR+LbM
Subject: Re: [Buildroot] [PATCH] configs: regenerate all defconfigs
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Buildroot people!

Yesterday, Yann E. MORIN wrote:
> This is a mechanical change, achieved by running:
>     $ for cfg in configs/*_defconfig; do
>         (make "${cfg##*/}" && make savedefconfig) || break
>       done

The problem with using `make savedefconfig` for this is that, if we are
using the latest supported kernel headers (currently 6.10), the line

    BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_10=y

gets removed from the defconfig. This is an issue because, whenever
Buildroot adds support for headers 6.11, the defconfig will
automatically default to those. In fact,
docs/manual/adding-board-support.adoc explicitly asks contributors to:

    set the custom kernel headers series to match your kernel version
    (+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_*+).

In this patch, the issue affects six defconfigs, namely:

    beagleplay_defconfig
    imx8mn_bsh_smm_s2_defconfig
    imx8mn_bsh_smm_s2_pro_defconfig
    mx6udoo_defconfig
    ti_am62x_sk_defconfig
    ti_am64x_sk_defconfig

Regards,

Edgar.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
