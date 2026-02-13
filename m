Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7768EEA860
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 17:26:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7173A406E0;
	Fri, 13 Feb 2026 17:26:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HAoTZHC5Jzvz; Fri, 13 Feb 2026 17:26:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4877140677
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771003584;
	bh=FRxpKViBHHeaiWh0ZeD2fZ3AcKvvfuRhSQxh1fFATUM=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=aGQWkSqElGXktci6cqdeglLB2ngCXgVjjPAmO3SLQN8u4Az4EJuBImEwNgpw5vuB8
	 oo3ZVwVu4BGfgDbJr2o02ZIFiVk5t1RLXpgIvtNf7ANLn9HAKdbXMPiCblyghuQjnn
	 u2CsSW7IJstuhB9J08Su/pS/n45pm3eQwzKDUaADOuTc3xZ5FgvNu5QI+qfaERP4EA
	 mHs7zb63K47hp8zFXdp1tc19dZHs384IqvD4Qo5tYG13WwUDo4hTde/ehg5Zw5Hryj
	 pjyQMNWbFIq83wKrMnOKZMSnaVMT68Uc57MbL4/9J/ppgyavAVgY724HygUfeoM0vd
	 XT6OI/b0TxkDA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4877140677;
	Fri, 13 Feb 2026 17:26:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id D3DF669
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 17:26:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B881484532
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 17:26:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Eb7zA8AVOWxy for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 17:26:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9FBAC844F5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9FBAC844F5
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9FBAC844F5
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 17:26:21 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 9D2282003D0;
 Fri, 13 Feb 2026 18:26:15 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 13 Feb 2026 18:26:15 +0100
MIME-Version: 1.0
Date: Fri, 13 Feb 2026 18:26:15 +0100
To: Thomas Richard <thomas.richard@bootlin.com>
Cc: buildroot@buildroot.org, Marleen Vos <marleen.vos@mind.be>
In-Reply-To: <20260210142845.1736028-1-thomas.richard@bootlin.com>
References: <20260210142845.1736028-1-thomas.richard@bootlin.com>
User-Agent: Webmail Free/1.6.13
Message-ID: <325cdcb2a47872aa2e850518f8d4fc58@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1771003577;
 bh=4/ODXJ1n+d6urIZ6feYo+H26l0cmwe1Zm8EvvpnUr8E=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=jJKzzscqRVyfEfxg8noLquIErSS4i44bTmlA0pqbCS7yOcRkkBMdwmh53oP0uk2pd
 NJAuuAgfRlLn1o/Tdu9Gxr6scOKKXu5O81vK0+voLtOGA+MBRMh2vG3K01LBlNpUQ/
 nQsZF9gxSrhb8IoKr1J8JVR9P+zsNmCIunCApr3RJ8e2YEL+I7O7xMQGWnwU4V99jG
 LLRFjZ5gRLisM9Ntz7FItcTzrTcnx+j886c2gK1hZEHPAOTHBeX64yVwX3O4d4hK85
 d9MSBq1SaPePJtUYiuDOsrn7CWqIZ3bf4ubCQlOhoUCY1JZE+xBA0HuMklq3AJp1cr
 6fHedkIbcv4eg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=jJKzzscq
Subject: Re: [Buildroot] [PATCH 1/1]
 board/stmicroelectronics/stm32mp135f-dk: fix silent crash in U-Boot
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

Hi Thomas,

Thanks for the patch.

It generates errors when running the command
"utils/docker-run make check-package". See below.

On 10/02/2026 15:28, Thomas Richard via buildroot wrote:
> Backport upstream patches to fix a silent crash in U-Boot on
> STM32MP135F-DK.
> 
> Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
> ---
>  ...d-SCMI-clocks-in-rcc-node-for-stm32m.patch |   57 +
>  ...te-clock-management-for-STM32MP13-25.patch | 1546 +++++++++++++++++
>  2 files changed, 1603 insertions(+)
>  create mode 100644 
> board/stmicroelectronics/common/stm32mp1xx/patches/uboot/001-ARM-dts-stm32-Add-SCMI-clocks-in-rcc-node-for-stm32m.patch
>  create mode 100644 
> board/stmicroelectronics/common/stm32mp1xx/patches/uboot/002-clk-stm32-Update-clock-management-for-STM32MP13-25.patch
> 
> diff --git 
> a/board/stmicroelectronics/common/stm32mp1xx/patches/uboot/001-ARM-dts-stm32-Add-SCMI-clocks-in-rcc-node-for-stm32m.patch 
> b/board/stmicroelectronics/common/stm32mp1xx/patches/uboot/001-ARM-dts-stm32-Add-SCMI-clocks-in-rcc-node-for-stm32m.patch
> new file mode 100644
> index 0000000000..a1550476f1
> --- /dev/null
> +++ 
> b/board/stmicroelectronics/common/stm32mp1xx/patches/uboot/001-ARM-dts-stm32-Add-SCMI-clocks-in-rcc-node-for-stm32m.patch
> @@ -0,0 +1,57 @@
> +From 7795c5ec6a608a104cf41331cbd387d39f7f6f49 Mon Sep 17 00:00:00 2001
> +From: Patrice Chotard <patrice.chotard@foss.st.com>
> +Date: Fri, 16 Jan 2026 19:57:26 +0100
> +Subject: [PATCH] ARM: dts: stm32: Add SCMI clocks in rcc node for
> + stm32mp131.dtsi
> +
> +Add SCMI clocks. These clocks are used as parent clocks and are
> +referenced by their rcc's node position in clk-stm32mp13.c
> +
> +Fixes: fdb1bffe2827 ("clk: scmi: Postpone clock name resolution")
> +Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> +Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>

To make maintenance easier, we ask in Buildroot to add an "Upstream:"
tag for make tracking easier. For example:

Upstream: 
https://source.denx.de/u-boot/u-boot/-/commit/7795c5ec6a608a104cf41331cbd387d39f7f6f49

Since you manipulated this patch yourself, you should also add your 
line:
Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>

> +---
> + arch/arm/dts/stm32mp13-u-boot.dtsi | 27 +++++++++++++++++++++++++++
> + 1 file changed, 27 insertions(+)
[...]
> diff --git 
> a/board/stmicroelectronics/common/stm32mp1xx/patches/uboot/002-clk-stm32-Update-clock-management-for-STM32MP13-25.patch 
> b/board/stmicroelectronics/common/stm32mp1xx/patches/uboot/002-clk-stm32-Update-clock-management-for-STM32MP13-25.patch
> new file mode 100644
> index 0000000000..e9c2c7b1f5
> --- /dev/null
> +++ 
> b/board/stmicroelectronics/common/stm32mp1xx/patches/uboot/002-clk-stm32-Update-clock-management-for-STM32MP13-25.patch
> @@ -0,0 +1,1546 @@
> +From 213f927a59288bbaa4b141c593424c3b205b5e6c Mon Sep 17 00:00:00 2001
> +From: Patrice Chotard <patrice.chotard@foss.st.com>
> +Date: Fri, 16 Jan 2026 19:57:27 +0100
> +Subject: [PATCH] clk: stm32: Update clock management for STM32MP13/25
> +
> +During clock's registration, clock's name are used to establish parent 
> -
> +child relation. On STM32MP13 and STM32MP25, most of SCMI clocks are 
> parent
> +clocks.
> +
> +Since commit fdb1bffe2827 ("clk: scmi: Postpone clock name 
> resolution"),
> +all scmi clocks are named by default "scmi-%zu" until they are 
> enabled,
> +it breaks clocks registration and boot process for STM32MP13/25
> +platforms.
> +
> +Rework the STM32 core clock driver and STM32MP13/25 clock description
> +to use clock index instead of their real name.
> +
> +Introduce struct clk_parent_data which allows to identify parent clock
> +either by index or by name. Name is only used for particular clocks
> +provided by IP which are clock provider as i2s/i2s_ckin, 
> usb0/ck_usbo_48m,
> +and ltdc/ck_ker_ltdc.
> +
> +STM32_GATE() and STM32_COMPOSITE_NOMUX macros are updated in order to
> +use parent clock index.
> +
> +As STM32MP13 supports both SPL and SCMI boot, keep using an array
> +with clock's name for SPL.
> +
> +Fixes: fdb1bffe2827 ("clk: scmi: Postpone clock name resolution")
> +Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> +Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>

Same comment here:

Upstream: 
https://source.denx.de/u-boot/u-boot/-/commit/213f927a59288bbaa4b141c593424c3b205b5e6c
Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>

Could you send an updated patch please?

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
