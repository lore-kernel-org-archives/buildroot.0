Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7863AC53200
	for <buildroot@archiver.kernel.org>; Wed, 29 Jul 2026 18:58:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 381E16072E;
	Wed, 29 Jul 2026 18:58:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xqRbAuREfS20; Wed, 29 Jul 2026 18:58:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AEF3B606EF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785351484;
	bh=1SL8v2aRFYslSnDsG9XivXI+e/nCxovkMC1oE/zYIIo=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=nPTj699xOTdC7SPBME2ZdcUf7if8FsnAwBPEshfDVfOCA6qj6ecB/SpaxYJWzkzMU
	 UpvETbJOarNY2K1hMK503qDM1V9/lmlcRWFROPWBvFIbxGLtNZfTJjH6P/Ked36inn
	 UczTtyFFcjPDtZ2H9uZV5+cg8DqS5Gc6yksOazxRaq1BXLW1fHAcVFJh1Kik8ra58Z
	 K19JBaVzpsFCpjOXrD3dHEa/WSHzl/9yaMKKD7wIpVoes9MnGpctAaJFn8PCpcTnog
	 47/lD4bj8CYP9muFL8wqZwSKxWgXa1Zgq0v+2PywjFEU0tKR9fFYGn4nKPUEJCDSvh
	 gT4UcNraq0Gqg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AEF3B606EF;
	Wed, 29 Jul 2026 18:58:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0717E27C
 for <buildroot@buildroot.org>; Wed, 29 Jul 2026 18:58:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E11D780E59
 for <buildroot@buildroot.org>; Wed, 29 Jul 2026 18:58:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oo5y0BpNuyQ0 for <buildroot@buildroot.org>;
 Wed, 29 Jul 2026 18:58:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CC0D180E46
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CC0D180E46
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CC0D180E46
 for <buildroot@buildroot.org>; Wed, 29 Jul 2026 18:58:01 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id A04BC19F54D;
 Wed, 29 Jul 2026 20:57:57 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 29 Jul 2026 20:57:57 +0200
MIME-Version: 1.0
Date: Wed, 29 Jul 2026 20:57:57 +0200
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org, Fabio Estevam <festevam@gmail.com>
In-Reply-To: <20260726204646.3149810-1-ju.o@free.fr>
References: <20260726204646.3149810-1-ju.o@free.fr>
User-Agent: Webmail Free/1.6.17
Message-ID: <2bfbf869669316d22df218ba4644f765@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1785351479;
 bh=NfjHoyoLNo8z9lO3W1G09vbh56mpReIPEIT+U8/BI3c=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Jp2snXXa5mPhm/M28FaYUAauqHIi9k4FY0itNn8Gh7dLjWpGni291az4xy6ysIn1I
 4uA3FOBlABcE9nxvym6NgAslflqLY0XlmvXYJKD56NxDdUrCSmlxwXaXyFyNA4FYJI
 TuvhHTm90gONlCMsYyhsMTZw1WR3B2lZPGH+zXdR3OBujAfM6F7VunIHjtEUmXn5qH
 G8K3KOh1U1MJMaj4iVzBtfmEntspv2V6dH0KXruZBqyA9+f4ELqrhtEm7Si4GqwH/s
 4t9Fs3Aix9GLMikAhnlJRisckpOObfQ+UfEJQ0fhRaDZf5DVzRlJJ9ZpoGw4RqekUx
 XWUh5a1SsUMVw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Jp2snXXa
Subject: Re: [Buildroot] [PATCH 1/1] configs/freescale_imx91frdm: bump
 U-Boot, TF-A and Linux
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

On 26/07/2026 22:46, Julien Olivain via buildroot wrote:
> Since Buildroot commit [1] "package/gcc: switch to GCC 15.x as the
> default", compiling freescale_imx91frdm_defconfig fails in TF-A with
> error:
> 
>     include/drivers/nxp/trdc/imx_trdc.h:7: error: header guard 
> 'IMX_TRDC_H' followed by '#define' of a different macro 
> [-Werror=header-guard]
>         7 | #ifndef IMX_TRDC_H
>     include/drivers/nxp/trdc/imx_trdc.h:8: note: 'IMX_XRDC_H' is 
> defined here; did you mean 'IMX_TRDC_H'?
>         8 | #define IMX_XRDC_H
> 
> The issue happen because this defconfig is using a Buildroot
> (internal) toolchain which uses gcc version 15 by default.
> 
> This issue was fixed upstream in [2], first included in TF-A v2.13.
> 
> This commit updates U-Boot, TF-A and Linux to use the NXP
> tag lf-6.18.20-2.0.0, which include this fixes.
> 
> Note that, as described in the commit log of [3] which was used as a
> base for this defconfig, U-Boot and Linux were forks. Now the
> necessary patches are included in the vendor BSP, this commit
> switches those repos to use the vendor ones.
> 
> This commit also removes the linux-headers.hash custom hash file
> which was never needed, because the defconfig used an external
> toolchain.
> 
> Also, due to the upstream uboot commit [4], this commit adds a uboot
> config fragment to disable CONFIG_EFI_CAPSULE_AUTHENTICATE, to
> remove the dependency on the command "cert-to-efi-sig-list", provided
> the host efitools package, which is not yet in Buildroot.
> 
> This commit was run tested on board 700-94610 Rev A1.
> 
> [1] 
> https://gitlab.com/buildroot.org/buildroot/-/commit/a75b8623f5515d99bec48f96586115953150558e
> [2] 
> https://git.trustedfirmware.org/plugins/gitiles/TF-A/trusted-firmware-a.git/+/2e9198d0e0cbe9546348dd0a71ff6c3d2061d4eb%5E%21/
> [3] 
> https://gitlab.com/buildroot.org/buildroot/-/commit/2e05f22ff862192a7e512d0db0486351bba94ae8
> [4] 
> https://git.u-boot-project.org/u-boot/u-boot/-/commit/fd58c275f6ba524101ba0990e53f5a11ac390bd0
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

Applied to master.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
