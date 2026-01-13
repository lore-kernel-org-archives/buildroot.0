Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B752D2502E
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 19:48:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D943C84413;
	Tue, 13 Jan 2026 19:48:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eHznCVNuIxSs; Tue, 13 Jan 2026 19:48:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E8C2D84428
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768333690;
	bh=5rtTibjqxtcy5tzgDu5T8jc2JX7/iBx7nmDvOyuhkJE=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=doMJO5LXjyDnTnrQxN70YaffKp+PWYlH5HGv0Sy+nO0t0NiA1xKmDVIxNK3FqxVua
	 KkdOmcmDIYGS2FLHitbOrlCiJPsQBKysfLdm2zfRvmqQzS/eEjhO1lBUEaLikrVboK
	 SvGpm1QEFeGvicSXB3gk/84ZSFyi5uSBAjRXyCSPhg+pdUzt0JQnqCh/+66jgkayEp
	 2L5ZMI3Mo7Ekln55AhfJHKC49fLaX24dO8Q0sG9nNR4/m67uaA2O9T0GvpHrMj4qsU
	 00lmsNuMYbnwjw3LVijkm7LexUuYLEBxbzE62KFdkDCr7wzVp4HvoQSJeebIo8WmOj
	 xx7OHwl4ZJNog==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E8C2D84428;
	Tue, 13 Jan 2026 19:48:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 11E461C3
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:48:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 031DF40E4F
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:48:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sjacZB_AOQ_j for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 19:48:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E66EF40E3D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E66EF40E3D
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E66EF40E3D
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:48:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id EF13AB97A885; Tue, 13 Jan 2026 20:48:03 +0100 (CET)
To: Quentin Schulz <foss+buildroot@0leil.net>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Tue, 13 Jan 2026 20:48:02 +0100
Message-ID: <20260113194802.100332-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251124-uboot-env-rename-v1-1-7ac5a21da6e2@cherry.de>
References: <20251124-uboot-env-rename-v1-1-7ac5a21da6e2@cherry.de>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1768333684; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=vw0y+eVezdeNe+48YRZ15khnkJwycMDuvx86iOwjsSY=;
 b=HU8mkU67JGFDtx099Kem2OjpG9jVQ/hQoKK78F/HSdHaLlbChEEQ+hq5IueUMG3vFqhu9G
 6MZJEtYccbsynX3Er97F2hLbUA88fSA+FVvG//tlxDA784rzcz6uJ1rFVM7UDgZ0jU8Hal
 7zkOK3zeox61a1vjHTD7kQusuEpxeZagv7iSaBjR5scqFz/G6Sh1FVG4+EX/3/C6SODeTT
 0S+rCRGmZ30i15PocBBcyA2sQbmRTAfP25o/BRlBBikMtmztWgIiSjc23Y+WIkg3F06o4o
 MHQl+L1VsY1H1EDsy5bJHHZFHjTBWTaL3bCopPbt+Mjp0v5k1u9VxicShJm48Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=HU8mkU67
Subject: Re: [Buildroot] [PATCH] boot/uboot: fix externally provided env
 file not used on 2025.10
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> fb5235239aad ("env: Rename DEFAULT_ENV_FILE to
> ENV_DEFAULT_ENV_TEXT_FILE") renamed the Kconfig symbols and thus we need
> to adapt the U-Boot package in Buildroot to support it.
> 
> Fixes: 128c26f2875d ("boot/uboot: bump to version 2025.10")
> Reported-by: Ozan Durgut <ozandurgut.2001@hotmail.com>
> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>

Applied to 2025.11.x. Thanks

> ---
> Only roughly build tested, warp7_defconfig modified:
> - to use Kconfig for U-Boot,
> - to add a dummy environment text file,
> 
> Built 2025.07 and 2025.10 and checked with make uboot-menuconfig that
> the variable in U-Boot was appropriately set.
> ---
>  boot/uboot/uboot.mk | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
> index 7bd0937df2..8dad710bf3 100644
> --- a/boot/uboot/uboot.mk
> +++ b/boot/uboot/uboot.mk
> @@ -409,8 +409,12 @@ UBOOT_KCONFIG_OPTS = $(UBOOT_MAKE_OPTS) HOSTCC="$(HOSTCC_NOCCACHE)" HOSTLDFLAGS=
>  ifeq ($(BR2_TARGET_UBOOT_DEFAULT_ENV_FILE_ENABLED),y)
>  UBOOT_DEFAULT_ENV_FILE = $(call qstrip,$(BR2_TARGET_UBOOT_DEFAULT_ENV_FILE))
>  define UBOOT_KCONFIG_DEFAULT_ENV_FILE
> +	# Pre-2025.10
>  	$(call KCONFIG_SET_OPT,CONFIG_USE_DEFAULT_ENV_FILE,y)
>  	$(call KCONFIG_SET_OPT,CONFIG_DEFAULT_ENV_FILE,"$(shell readlink -f $(UBOOT_DEFAULT_ENV_FILE))")
> +	# 2025.10 and later
> +	$(call KCONFIG_SET_OPT,CONFIG_ENV_USE_DEFAULT_ENV_TEXT_FILE,y)
> +	$(call KCONFIG_SET_OPT,CONFIG_ENV_DEFAULT_ENV_TEXT_FILE,"$(shell readlink -f $(UBOOT_DEFAULT_ENV_FILE))")
>  endef
>  endif
>  endif # BR2_TARGET_UBOOT_BUILD_SYSTEM_LEGACY
> 
> ---
> base-commit: c8cb1a238de5a803228f12ad32b36cae2acfc778
> change-id: 20251124-uboot-env-rename-f88169496f13
> 
> Best regards,
> -- 
> Quentin Schulz <quentin.schulz@cherry.de>
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
