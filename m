Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF949CE9D65
	for <buildroot@archiver.kernel.org>; Tue,  6 Jan 2026 15:43:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 833454041D;
	Tue,  6 Jan 2026 15:43:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oPRsz1fgRhDB; Tue,  6 Jan 2026 15:43:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B2CDF4042F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767714206;
	bh=r0x/mulwtFq8N6j7e+NEN20ay4zymcn/l7q87TJ9Xig=;
	h=Date:To:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=L/2LQPbM+ZLAfXfn1CgTFBY7+X45mFGSNyQL0mduHERIIoqSLO/6q87S5OTRVVR1Y
	 Ih3musYxlGrJ/oJitAI4ptCGddP3aen8//7Ka+bzsCUoXuG/3Nzr5Yuf/qPaJXPNrE
	 aMCMkncnWEYz/6qbiSaFJDWtsGgz7rKa2X07d5Q6Wd7yydeBALwcAus+h58kefqa81
	 xrkI/z4TKr2yVBcwV97wCFVWPmwut/Xhbm0/MCm01zYOUDGRpCfY3/I3Jzx34GzqPm
	 QVwBp60GwShkW8Mb/hgA4nEYb1L1maBtVXmCk9dteR04kkoWfmGOnsskT3HAkz2COI
	 9riIxEsGEo9WA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B2CDF4042F;
	Tue,  6 Jan 2026 15:43:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2742FE7
 for <buildroot@buildroot.org>; Tue,  6 Jan 2026 15:43:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 181A560B23
 for <buildroot@buildroot.org>; Tue,  6 Jan 2026 15:43:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5ssQ_SEQgZvD for <buildroot@buildroot.org>;
 Tue,  6 Jan 2026 15:43:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3877D607DD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3877D607DD
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3877D607DD
 for <buildroot@buildroot.org>; Tue,  6 Jan 2026 15:43:23 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 14FCB1A26A2
 for <buildroot@buildroot.org>; Tue,  6 Jan 2026 15:43:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id DD43260739;
 Tue,  6 Jan 2026 15:43:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id E6E2C103C86E1; Tue,  6 Jan 2026 16:43:15 +0100 (CET)
Date: Tue, 6 Jan 2026 16:43:14 +0100
To: Heiko Thiery <heiko.thiery@gmail.com>
Message-ID: <20260106164314.142d9032@windsurf>
In-Reply-To: <20260106151022.29135-1-heiko.thiery@gmail.com>
References: <20260106151022.29135-1-heiko.thiery@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767714200; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=u/WTe6n8WQa6F3JYQW3Opjr6UmGsnst0dCbqCEsE3/g=;
 b=XbITkt3kAr6yKkwcW51jSYJl+X4TY7N9lT/RNKGEyjfiW4wvmE6FhCNx0jN5SXLeXLPwLt
 O5WMj1/loHJnGAJNgZ6N/ojHZUV5iRnVgZepPKARviQAxs1gY3jB2BcoYRTnE7/W3RcTsI
 vml8TGtUYw0hoSPruAcuSujRpoTJrjqWagBXe2lwTS32PfkyPGkF9iDJCVtVn+pD0h+keL
 GymwA63NRLbO18zXmXBrY1gF1yenP8gdKEoe1AGtvbN4kBZXIFpqWoyvFTj2osdwxxqtMG
 aNHm9X+z6fCBfVpOBWz9ycfqEelrCgkD1ubQByidZw13ZkO/avl5RfKQ07jN3g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=XbITkt3k
Subject: Re: [Buildroot] [PATCH v3] package/uboot-tools: use uboot host tool
 printinitialenv to extract env
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Matt Weber <matthew.weber@rockwellcollins.com>,
 Michael Walle <michael@walle.cc>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Heiko,

On Tue,  6 Jan 2026 16:10:23 +0100
Heiko Thiery <heiko.thiery@gmail.com> wrote:

> diff --git a/package/uboot-tools/uboot-tools.mk b/package/uboot-tools/uboot-tools.mk
> index 1925047ccd..69e03f40d8 100644
> --- a/package/uboot-tools/uboot-tools.mk
> +++ b/package/uboot-tools/uboot-tools.mk
> @@ -154,10 +154,11 @@ HOST_UBOOT_TOOLS_DEPENDENCIES += uboot
>  ifeq ($(UBOOT_TOOLS_GENERATE_ENV_FILE),)
>  UBOOT_TOOLS_GENERATE_ENV_FILE = $(@D)/boot-env-defaults.txt
>  define HOST_UBOOT_TOOLS_GENERATE_ENV_DEFAULTS
> -	CROSS_COMPILE="$(TARGET_CROSS)" \
> -		$(UBOOT_SRCDIR)/scripts/get_default_envs.sh \
> -		$(UBOOT_SRCDIR) \
> -		> $(UBOOT_TOOLS_GENERATE_ENV_FILE)  
> +	if [ -x $(UBOOT_SRCDIR)/tools/printinitialenv ]; then \
> +		$(UBOOT_SRCDIR)/tools/printinitialenv > $(UBOOT_TOOLS_GENERATE_ENV_FILE); \
> +	else \
> +		CROSS_COMPILE="$(TARGET_CROSS)" $(UBOOT_SRCDIR)/scripts/get_default_envs.sh > $(UBOOT_SRCDIR); \

The redirect is still broken here, this command line is not correct, as
it's not the same as it used to be.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
