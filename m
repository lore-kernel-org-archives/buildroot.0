Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D33AC982FE
	for <buildroot@archiver.kernel.org>; Fri, 16 Jan 2026 21:03:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0E68F84AE0;
	Fri, 16 Jan 2026 21:03:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fLxjL4S39Hac; Fri, 16 Jan 2026 21:03:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 359D284AE5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768597386;
	bh=Fu1lNxaprpKuTsT36V6Z5z0nUOdUvtsi69hjjwq1ZI8=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Wu6yN02sxEPs+gYIouePIvY+W/NCgATgeyUQhWac9/0PfI/2CXuFypmSMHZiFQ2gg
	 E10KKB/MkFgF10nv3C7qQ7PBOl82LYhZ3DKsJ0dc3n8bJYJ2b0TI1Y9DiTW3hhJjP+
	 qQtz3+SauLnKwLfd0xxy1LCmPOeGYgLZ+T37QPqDOoqUO7a1wm7vO3MGNGCClUDoZ6
	 7+SO9bWFjKQXBAn0RcgjVwAUI8R16tW/U/Z2lTHg2/I8tv3Po/HcwpO2PVEMZxBVYb
	 nuLmCW1efmb8qwpRny0xmBe9FkcvGP+O9fTLtK3Zz2vAUW84R82WGNS8wQAbhVWYv0
	 XKDn5/9Zqs3CQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 359D284AE5;
	Fri, 16 Jan 2026 21:03:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 01385223
 for <buildroot@buildroot.org>; Fri, 16 Jan 2026 21:03:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E6C5341A7B
 for <buildroot@buildroot.org>; Fri, 16 Jan 2026 21:03:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ozkUKPjJZvc3 for <buildroot@buildroot.org>;
 Fri, 16 Jan 2026 21:03:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E14ED41A74
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E14ED41A74
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E14ED41A74
 for <buildroot@buildroot.org>; Fri, 16 Jan 2026 21:03:03 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id DC85AC1E48C
 for <buildroot@buildroot.org>; Fri, 16 Jan 2026 21:02:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 9293F606F9;
 Fri, 16 Jan 2026 21:03:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id C671110B68DE8; Fri, 16 Jan 2026 22:03:00 +0100 (CET)
Date: Fri, 16 Jan 2026 22:03:00 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
Message-ID: <aWqndmK6qs8v6RP8@windsurf>
References: <20260115180056.284506-1-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260115180056.284506-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1768597381; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=+G/mQfztWH/1jH2rfcHPo6wEXY38n6+OZ0lhzSqsItE=;
 b=Hh9WfG7/p5i+61KN+Rg71U/7UMBrSj5rqzqs5RfVahs1xLfmqcxr39NhhSnoFejUyikOsO
 yi9oeIooye+z61XgBpS0k1F+mw00BuAcR7D+vbN1BLPRFzzEMupHSnmrzNBJ/CQO688BiP
 5zVll713ZOUUZk8yZ+E8n3clXqra5GHSsDdx+3DsF8XTk/XqAumtK2xlJwk1imWedczXrl
 ENfyzkABqg2I2U7qpT3pUNGBXgiGGjPMab19enn0jLZrtMibYrbemmXyrkxkqGKjmsa89h
 Y6GYT8eK90kiclJbBxOEcl2gN/Iq23rLn+PKzhSxE+8tXRsFjaNckLV6eWFEeg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=Hh9WfG7/
Subject: Re: [Buildroot] [PATCH 1/1] package/lsof: fix build failure due to
 missing BR2_PACKAGE_LIBTIRPC_RPCDB
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

On Thu, Jan 15, 2026 at 07:00:56PM +0100, Bernd Kuhls wrote:
> Package lsof requires libtirpc rpcdb option enabled with non-glibc
> toolchains since the bump of libtirpc to version 1.3.7 with buildroot
> commit 3f3d6e43de9b4aac7df8545fd811171256f878d3 which includes upstream
> commit:
> https://git.linux-nfs.org/?p=steved/libtirpc.git;a=commit;h=7cea8ad66aecc21e6caae330b5d31075af399193
> 
> Fixes:
> https://autobuild.buildroot.net/results/59e/59e0cc2692a8a7d587f5a4da90ec268237141dab/
> 
> /home/autobuild/autobuild/instance-10/output-1/host/lib/gcc/arc-buildroot-linux-uclibc/14.2.0/../../../../arc-buildroot-linux-uclibc/bin/ld:
>  print.c:(.text+0x166): undefined reference to `getrpcbynumber'
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
