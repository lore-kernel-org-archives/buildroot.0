Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59117C982FE
	for <buildroot@archiver.kernel.org>; Fri, 16 Jan 2026 20:26:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 14DEA404E6;
	Fri, 16 Jan 2026 20:26:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xxv5WR2JtoSR; Fri, 16 Jan 2026 20:26:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C7CBA404CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768595185;
	bh=E1dudTo0NaO2xK/0xxC9ZInjzYk5nMHQCy75DuaRQLY=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=AbXW6eMM79T9O7Mwnf6autaAJ3mkWGPZoLL3Sn7aEO7d/JMXSw5yZ7UjkL7IP5PZ0
	 fJEaAfUrdbkYKpEuV0U7YCAtm4Wb2/t2w237mhWtp1scuLZ4q9ziGiwcwDHHFgj2qp
	 2mcpvtBrmpX8q4xe8R6/DxPbkVBUvnXDVQao0fVI7CVvfbKUu3O3rY62/atBhklsGe
	 M9wohm3vM6dxvChSKk/oNRowDu36KoXVLku+xjjqLHc7PQKMcYbzabjXfrv7TtjCUm
	 mYhMxBBDr+38UGreat8kZIxs31uXa9Jzr1bo3cmtXjjKgBTlZPY8YDTGYQBrIDnnF3
	 eH0IMCHGSOVug==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C7CBA404CC;
	Fri, 16 Jan 2026 20:26:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 974192CC
 for <buildroot@buildroot.org>; Fri, 16 Jan 2026 20:26:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7DD0B840C7
 for <buildroot@buildroot.org>; Fri, 16 Jan 2026 20:26:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CKmHsfCyl_9Q for <buildroot@buildroot.org>;
 Fri, 16 Jan 2026 20:26:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 732E4840C6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 732E4840C6
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 732E4840C6
 for <buildroot@buildroot.org>; Fri, 16 Jan 2026 20:26:23 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id CE3561A28CE
 for <buildroot@buildroot.org>; Fri, 16 Jan 2026 20:26:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id A51FF606F9;
 Fri, 16 Jan 2026 20:26:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 668D710B68DD2; Fri, 16 Jan 2026 21:26:20 +0100 (CET)
Date: Fri, 16 Jan 2026 21:26:19 +0100
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org, Dick Olsson <hi@senzilla.io>
Message-ID: <aWqe1ZLav1MTNa-T@windsurf>
References: <20260104134755.1786447-1-ju.o@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260104134755.1786447-1-ju.o@free.fr>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1768595181; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=7Rfkwd2Cm8DJjrIu7URqkry4rvcY2NbBJRMX7yMefqs=;
 b=F+wCUZpijCTJ3uyRp7uRSLPD42Z0OO+a80kGVQDG+tfsHKXsWYMDxWFy4jD7zKqyz+yJI6
 sDRWOD5XXyWOtZnbqEnzKJai3sDXbbqR51c7kRKJU1jt239OVsqJAPoesPdM6ANNHLWP+L
 LJ8dorX01uB9yfvdUCwLMpH5BYs2hJj9JRuCimlMBCZo9wZMV6xwS+lh0L+yIX/54pqVGr
 actWKUdIf38AQ07xor0dqA29RTVxWHCmzNPksHVBwlxaVGt9/pCQDxenUNkztG/1jwOY92
 tEbbI4VwR8Hr0y38tlWV/zrSOxI5UHNLCe6dtj9GWWjorElXjz9hZuk9XVFk2A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=F+wCUZpi
Subject: Re: [Buildroot] [PATCH v2 1/1] boot/edk2: add a new Kconfig option
 to pass arbitrary build options
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

Hello,

On Sun, Jan 04, 2026 at 02:47:55PM +0100, Julien Olivain via buildroot wrote:
> EDK2 build may include extra options. Those are usually in the form
> of "-D SOMEFLAG_ENABLE" and might be specific for a processor
> architecture or a platform. For example:
> "-D NETWORK_HTTP_BOOT_ENABLE", "-D NETWORK_TLS_ENABLE", ...
> 
> Those options are generally documented in their respective packages.
> See for example:
> https://github.com/tianocore/edk2/blob/master/OvmfPkg/README
> 
> This commit adds a new Kconfig string option to let the use define
> arbitrary build flags.
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

Thanks, applied to master!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
