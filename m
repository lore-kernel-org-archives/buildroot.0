Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06F43C2A062
	for <buildroot@archiver.kernel.org>; Sun,  4 Jan 2026 14:25:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AA45E80E4C;
	Sun,  4 Jan 2026 14:25:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YkJUHej_Kmhl; Sun,  4 Jan 2026 14:25:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D1E6480E3E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767536717;
	bh=vwlIxdWsryJh/7h4kHwbmyRTjgGbDqHgtUD5qPmFbtA=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ZMng5TCKMfkvNr08Q2l2CLIw7apj/Nv0b8A6tJVyQGEElkaeUKxjyfXEW42EWanoB
	 ut9YTEIbA4U0d9XjcQUPOI1Ql6xlPYjc1w8z27mUQl3pjJrA/91xYpdZOsYftGCWko
	 ExiljFq4y8QLkVyYupsCqhTU9LOzBNWFv4Do58J5EyZ4EXMC1JGcoSXpDLrhaD+cvU
	 sLNePoFWFfadsmCWrnxYlOjNEiD/XlOZfFgAqB+L7fblb/XE6cH1xAnMB/UgvqO4zn
	 Y7mUGQWDTvCcIDnNZpoWDHCTyTN7IOScKNIeLHY9m5XK68o45GDw3Wnc7otV3frTvE
	 8hM8fDKARUoIg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D1E6480E3E;
	Sun,  4 Jan 2026 14:25:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 146182DF
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 14:25:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EEDA5401FF
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 14:25:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pUUt_VVpR8E4 for <buildroot@buildroot.org>;
 Sun,  4 Jan 2026 14:25:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E72AD4013F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E72AD4013F
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E72AD4013F
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 14:25:15 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 31561C1C96F
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 10:57:16 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 0CF566072B;
 Sun,  4 Jan 2026 10:57:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id CD88A113B0449; Sun,  4 Jan 2026 11:57:40 +0100 (CET)
Date: Sun, 4 Jan 2026 11:57:39 +0100
To: Romain Naour via buildroot <buildroot@buildroot.org>
Cc: Romain Naour <romain.naour@smile.fr>, Julien Olivain <ju.o@free.fr>,
 Dick Olsson <hi@senzilla.io>
Message-ID: <20260104115739.23c1d603@windsurf>
In-Reply-To: <e3a769b8-1e3b-475a-bc43-28fd74e9864d@smile.fr>
References: <20250630185854.9826-1-ju.o@free.fr>
 <e3a769b8-1e3b-475a-bc43-28fd74e9864d@smile.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767524261; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=biWZdJWO/irOXPab4QHirrTexUs+n1y3I6ZODotOaNA=;
 b=azgongs7ph8Dp8lX0Ar9agxYQG/Zyj4Bfbm0PFzLWCyzZV1uBHTke7aCPtQZm5slSu+fiv
 I0Kv9PvBZ9E0MGIcx3pQR9952LkcAzDslI+byMEUimzPpsY9pr8rcfWPU9/3FECaakWnke
 LSZFdVf6nIhiYoz+wbFCur+c1/gxNsSpdvaHiTiwXpW2nGu1Cwn/qNoVZa5CDk+pF8wSLA
 jpA3gsHTW32WtiC/cxUajW5d35eqIvFAvbDfViYBrD8ggODPIVLHTSMKELgEdqvSUidNOo
 Nj4ffs5uOtMWXibpynmt89wmlGq7yoyLB0kHole+1vmHUuWb9rEVsz0igu4Xtw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=azgongs7
Subject: Re: [Buildroot] [PATCH 1/1] boot/edk2: add a new Kconfig option to
 pass arbitrary build options
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

Hello Romain,

On Sat, 5 Jul 2025 23:32:17 +0200
Romain Naour via buildroot <buildroot@buildroot.org> wrote:

> >  EDK2_BUILD_OPTS += \
> > +	$(call qstrip,$(BR2_TARGET_EDK2_EXTRA_BUILD_OPTS)) \  
> 
> Maybe we should use a loop here adding "-D" with the options provided by
> BR2_TARGET_EDK2_EXTRA_BUILD_OPTS. Otherwise the user can add whatever he want
> that could conflict with other build arguments.

No, I disagree here. If there's an option to pass extra options I
expect it to pass all my extra options, as-is with no magic. Including
if that means that I can shoot myself in the foot by passing
conflicting options.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
