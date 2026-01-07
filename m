Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49CE6D0D151
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 17:54:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 233A0409D5;
	Wed,  7 Jan 2026 17:54:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4w_a-ABK4CDj; Wed,  7 Jan 2026 17:54:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4788F40A89
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808466;
	bh=hyj5DjDUswjtmVsOW51S6qFiweizLJZhZTBq1MJ4aww=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=leTceD4ENgI7FWH4hS1WwaA4ovD5N7r90Nmv+O5PiBJsIbl9r+Lv2k8xIsudohhKw
	 bx2djuyfCfmED8d9nqhdLffHYa3Ohz1LZyot831mUlubm7CmoqO+X45FdF90f61H++
	 rE7h9CDEEbqOqCGOPeMGNzFSs619egY5Ot+AAtlqRD7Pi8e5iQdTohtJ7o9Xq+CQb9
	 z2lknnSEOkXp/3s+u/ite/935ctGZ3is/yQkyL9xwwPyPr8sTCryIzhH+Eu7MtELJm
	 5y9VZe7JIhGq9tHq3djc/8/HFzeV+SsTysObNu6+IfCZBwYW0JlVl8/HoXLJPHW01j
	 llSMpr0/VXKQg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4788F40A89;
	Wed,  7 Jan 2026 17:54:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id BE4D725B
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:54:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A516A40160
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:54:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6QA6QmF2wc3X for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 17:54:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9FDBB40128
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9FDBB40128
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9FDBB40128
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:54:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id B72ECB97A596; Wed,  7 Jan 2026 18:54:21 +0100 (CET)
To: Fiona Klute <fiona.klute@gmx.de>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Wed,  7 Jan 2026 18:54:18 +0100
Message-ID: <20260107175418.229361-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251116202053.3276072-1-fiona.klute@gmx.de>
References: <20251116202053.3276072-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1767808461; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=na9Q91ZL8TRRiDyO4WxoLuFSvrVtrooGhRYjbDFpGFo=;
 b=QarZxCbZrRLOOL59KH5bXLUG9bsCu557MWXhmBTtzcpIfcOcBc6tKEJmOdrF/tLZ5GV4oJ
 dPpceIhR9gSQBf2TiK1A6+MazoQy8chugPnKwpSBCpPmt5buXt/jXX99ZK1BydmLq5UlYr
 Ni+C3V3pbMKIgJPlX6QPbyyVrSZEReLoIFVqeET8xwUnA8+nn2E0MRkzlIWN/zLfq09CKX
 5u9J/BmvCOp019m3d/5v7m5Dld5qcshscDiOqjmG6S2vkTrU8KbzRh0fcJe8fTvvgTmAvT
 2b7i3+ho4zzBbEtVmjDYiiLjdRcljQW8i2yIAP4Ndm4UdJcWETmADtE68NOzgA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=QarZxCbZ
Subject: Re: [Buildroot] [PATCH 1/3] package/uboot-tools: include FIT print
 support if FIT support is enabled
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
> Otherwise "dumpimage -l" produces only a newline when processing a FIT
> image.
> 
> Signed-off-by: Fiona Klute <fiona.klute@gmx.de>

Applied to 2025.11.x. Thanks

> ---
>  package/uboot-tools/uboot-tools.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/uboot-tools/uboot-tools.mk b/package/uboot-tools/uboot-tools.mk
> index 37ccd7b953..1135fb9c03 100644
> --- a/package/uboot-tools/uboot-tools.mk
> +++ b/package/uboot-tools/uboot-tools.mk
> @@ -32,6 +32,7 @@ define UBOOT_TOOLS_CONFIGURE_CMDS
>  	touch $(@D)/include/config/auto.conf
>  	mkdir -p $(@D)/include/generated
>  	$(if $(BR2_PACKAGE_UBOOT_TOOLS_FIT_SUPPORT),$(UBOOT_TOOLS_ENABLE_HASH_ALGOS))
> +	$(if $(BR2_PACKAGE_UBOOT_TOOLS_FIT_SUPPORT),echo '#define CONFIG_TOOLS_FIT_PRINT 1' >> $(@D)/include/generated/autoconf.h)
>  	echo $(if $(BR2_PACKAGE_UBOOT_TOOLS_FIT_SIGNATURE_SUPPORT),'#define CONFIG_FIT_SIGNATURE 1') >> $(@D)/include/generated/autoconf.h
>  	mkdir -p $(@D)/include/asm
>  	touch $(@D)/include/asm/linkage.h
> @@ -124,6 +125,7 @@ define HOST_UBOOT_TOOLS_CONFIGURE_CMDS
>  	touch $(@D)/include/config/auto.conf
>  	mkdir -p $(@D)/include/generated
>  	$(if $(BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT),$(UBOOT_TOOLS_ENABLE_HASH_ALGOS))
> +	$(if $(BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT),echo '#define CONFIG_TOOLS_FIT_PRINT 1' >> $(@D)/include/generated/autoconf.h)
>  	echo $(if $(BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SIGNATURE_SUPPORT),'#define CONFIG_FIT_SIGNATURE 1') >> $(@D)/include/generated/autoconf.h
>  	mkdir -p $(@D)/include/asm
>  	touch $(@D)/include/asm/linkage.h
> -- 
> 2.51.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
