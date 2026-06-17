Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09ADDCD98E1
	for <buildroot@archiver.kernel.org>; Wed, 17 Jun 2026 05:48:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 99DDD85C97;
	Wed, 17 Jun 2026 05:48:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OJoT6UjxJVEY; Wed, 17 Jun 2026 05:48:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4F08885C90
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781675283;
	bh=j2VM2wuOwJF84g0BEBklnBVrzQ3A1PFwZtBRlo90TaI=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cTYnni1KEQ/u7JkDHyaArGSVi5GgOcHU/4AqpvdvXp66fiwYgKVPYHt6dVOkPdfg8
	 WwvUevKz97cDJ/cYQ+p7dIFapaluYXLpYu+rLNvZT3QmeDCtIpoSl0rfTb90SEV50s
	 CiUbRJLQ66CWbLMVDGglfvlTg7OF9qAkzRViV2SDD/rNKf+FtJ6ykRFHz8UeMqD4Ws
	 SiWOsw9q2OUKiJ/TCOJx1D4YpSQ6mOPOwtuQy/2QzykTT59eedkWfxMbPjDuEunWnA
	 0YqyX26MBhSP3Ya8tT6pWojQfTZN3Fjgm/53o7OWN3xlT5WgMOK1OkD/l4qH9wfW/8
	 hAbpjF+VkJSOQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4F08885C90;
	Wed, 17 Jun 2026 05:48:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0360433C
 for <buildroot@buildroot.org>; Wed, 17 Jun 2026 05:48:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DD10F42A8B
 for <buildroot@buildroot.org>; Wed, 17 Jun 2026 05:48:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BmTp-gLuhu9j for <buildroot@buildroot.org>;
 Wed, 17 Jun 2026 05:48:01 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=84.110.109.230;
 helo=mail.tkos.co.il; envelope-from=baruch@tkos.co.il; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9913A41B83
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9913A41B83
Received: from mail.tkos.co.il (mail.tkos.co.il [84.110.109.230])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9913A41B83
 for <buildroot@buildroot.org>; Wed, 17 Jun 2026 05:48:00 +0000 (UTC)
Received: from localhost (unknown [10.0.8.2])
 by mail.tkos.co.il (Postfix) with ESMTP id AF607440868;
 Wed, 17 Jun 2026 08:46:40 +0300 (IDT)
From: Baruch Siach <baruch@tkos.co.il>
To: Neal Frager via buildroot <buildroot@buildroot.org>
Cc: Neal Frager <neal.frager@amd.com>,  ibai.erkiaga-elorza@amd.com,
 luca.ceresoli@bootlin.com,  brandon.maier@collins.com,  ju.o@free.fr,
 thomas.petazzoni@bootlin.com,  romain.naour@smile.fr,
 michal.simek@amd.com,  romain.naour@gmail.com
In-Reply-To: <20260617052225.2995453-1-neal.frager@amd.com> (Neal Frager via
 buildroot's message of "Wed, 17 Jun 2026 06:22:25 +0100")
References: <20260617052225.2995453-1-neal.frager@amd.com>
User-Agent: mu4e 1.12.15; emacs 30.2
Date: Wed, 17 Jun 2026 08:47:54 +0300
Message-ID: <87bjd9hg51.fsf@tarshish>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1781675200;
 bh=kxWx/GWnnWLOam0dGL64bQD8mOMMGrgJ2wPe7vQhTGo=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=DmMr4/RIWZXuEBYqJlyaGsgGIhAwJCrQ34reahKzQvsRC4uTetHLM/TqrrpHMdxtr
 uKi1QhRwoHN6VMQLw5gZhytx/sQK4GJUtrlOHsh9D07Lhj7wSm2HEOAOPH5e+kPR86
 dH9zrD6GcqbJSwWs8tRIqAyYdbaJaQOSvKCD5grCjyCfbfomTOK5H4dDTIlePkE/y7
 YaDm31eCrGDnld5VKiZapXLqB68LxF02fooeDr48ftjV69dDLkhGVk4zOth8j/YE73
 /b3CbEC5QfLXA7BROmfI3YzKm1tHF3rv2+JJmQtr6DEb/fZGr5szojjanXmp2pnO67
 H56kRqDYGABwQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=tkos.co.il
Subject: Re: [Buildroot] [PATCH v2 1/1] package/bootgen: bump to
 xilinx_v2026.1
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Neal,

On Wed, Jun 17 2026, Neal Frager via buildroot wrote:
> Bump bootgen to xilinx_v2026.1 release.
>
> The following patches are now included and can be removed:
> 0001-lms-hash-sigs-hss_param.c-add-stdio.h-include.patch
> 0002-flexlexer-use-embedded-win_include-flexlexer.h.patch
>
> bootgen xilinx_v2026.1 now requires C++ version 14, so the build command has
> been updated to reflect this.
>
> Add dependency on BR2_TOOLCHAIN_GCC_AT_LEAST_5 as gcc v5 is needed for C++
> version 14 support.
>
> Signed-off-by: Neal Frager <neal.frager@amd.com>
> ---

[...]

> diff --git a/package/bootgen/Config.in.host b/package/bootgen/Config.in.host
> index 0acb58dee0..151d6ae0a2 100644
> --- a/package/bootgen/Config.in.host
> +++ b/package/bootgen/Config.in.host
> @@ -1,5 +1,6 @@
>  config BR2_PACKAGE_HOST_BOOTGEN
>  	bool "host bootgen"
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # C++14

This is a host package. I think you need BR2_HOST_GCC_AT_LEAST_5 here.

>  	help
>  	  bootgen is a tool to generate a boot.bin firmware
>  	  for Xilinx versal, zynqmp and zynq product families.
> @@ -8,3 +9,6 @@ config BR2_PACKAGE_HOST_BOOTGEN
>  	  what is included with u-boot mkimage.
>  
>  	  https://github.com/Xilinx/bootgen
> +
> +comment "host-bootgen needs a host gcc >= 5"
> +	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_5

Comment is not needed for host dependencies. See manual section 18.2.4
(Dependencies on target and toolchain options).

baruch

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
