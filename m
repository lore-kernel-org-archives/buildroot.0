Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57D19EED626
	for <buildroot@archiver.kernel.org>; Thu,  1 Jan 2026 17:34:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 262E8810CE;
	Thu,  1 Jan 2026 17:34:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DG5y2Igg-lc1; Thu,  1 Jan 2026 17:34:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 728A18109E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767288849;
	bh=JJOtIAw182z4HjnV4Inen1saNL8YVusHQNFed9+AC+0=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=QCSKBY/B0W7t9Id6TshVe20W4wAF923X5vQ0uS+dM+nHnUC2lI0ZOaAPHdK3RbQ15
	 7t3+CRydd3Mi67CB3FwXwj+LWJBRcMeFmKtnRY+KDzuhVtj60+MG2cxB97a6lH5hlQ
	 Wkyz/kdarnM5TY7k0q6fjZeAmLd88xql/5JITAb04fDw2umLH1kRMh9nI3tNigBlYa
	 49gJY7eQLFXRxFAyOX+0YyKC2wDjiuCK7olM8MBFVIbKyISKQzO4pEQ1uLah76Xlg9
	 UQZc5LeS4T+eYcC2nXIeprcss0lqxDgbRbFQ4+pic4zqh8nGlGZySOhQCLsVzsBPzQ
	 Bn5Kx0r744Ftw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 728A18109E;
	Thu,  1 Jan 2026 17:34:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id B2DD019D
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 17:34:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 998F840539
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 17:34:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QNwCo_FXS8QB for <buildroot@buildroot.org>;
 Thu,  1 Jan 2026 17:34:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C61E94047A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C61E94047A
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C61E94047A
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 17:34:06 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 67FF84E41EDE
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 17:34:04 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 27A2E60749;
 Thu,  1 Jan 2026 17:34:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 2E14A113B0712; Thu,  1 Jan 2026 18:34:02 +0100 (CET)
Date: Thu, 1 Jan 2026 18:34:01 +0100
To: Alexander Shirokov <shirokovalexs@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <20260101183401.6d399150@windsurf>
In-Reply-To: <20250923102642.304379-1-shirokovalexs@gmail.com>
References: <20250728131926.848832-1-shirokovalexs@gmail.com>
 <20250923102642.304379-1-shirokovalexs@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767288843; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=hdgoO3tPjnfdT3uUQuTr0tlxzXGWxpmg3JbeAI5PGMA=;
 b=VOKWykMuOT778ObAvEKO17f1C2Hm+Arow0vNJtNRymkrvRul5lHApchT37FYwuY0dcCAw9
 5N69NkCCl8JcC127PQE18JL58YNRsyULEBlKk3KI+wGrgimtt8yHUxun82ax6b9xAxAtMi
 IVHGkQOlbTQNWRVQYo+TotAlCNnyspbVXwMX5xQ9IUVUhkhhFjV0MVco9rAKUlwdF/Sspj
 gS0LSndwztKzQ5JtT4Ctlx3KwzkdeL+Q/GU2UmLiVQ1Io0NPD7nB+DnSYi5PFgrqI6+gxY
 sOGT/DW+qgi2GZ0K999/bgAzKxM5GMA/Vlprke+psI6bIBfiZAMPV/jwBJPPeQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=VOKWykMu
Subject: Re: [Buildroot] [v4,1/1] package/zellij: new package
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Alexander,

Sorry for the delay!

On Tue, 23 Sep 2025 12:26:42 +0200
Alexander Shirokov <shirokovalexs@gmail.com> wrote:

> An advanced terminal multiplexer with batteries included. Supports
> layouts, floating and stacked panes, plugins, and customization.
> Provides rich functionality out of the box.
> 
> Zellij is aimed at developers, operations-oriented users, and anyone who
> loves the terminal.
> 
> https://github.com/zellij-org/zellij
> 
> Signed-off-by: Alexander Shirokov <shirokovalexs@gmail.com>

I've finally applied your patch, with one fix:

> +ZELLIJ_VERSION = 0.43.1
> +ZELLIJ_SITE = $(call github,zellij-org,zellij,v$(ZELLIJ_VERSION))
> +ZELLIJ_LICENSE = MIT
> +ZELLIJ_LICENSE_FILES = LICENSE

This file does not exist: it's LICENSE.md.

Make sure to test "make legal-info" with your package enabled to detect
this kind of issue.

Thanks again for your contribution!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
