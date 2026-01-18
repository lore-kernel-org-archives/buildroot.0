Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13A39C98315
	for <buildroot@archiver.kernel.org>; Sun, 18 Jan 2026 21:52:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C523C80C15;
	Sun, 18 Jan 2026 21:52:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bZ_-El9zpi_a; Sun, 18 Jan 2026 21:52:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E020A80BE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768773124;
	bh=/BubxDeOtfqatnsbsudWw76wIbUltOmXJXt4jostvjI=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=e4ap9gLqsBiCus2LvqDRDHQDki5ar5kTW/px3xfkcg1C9/tB9aLPOnQrg1tQ9YeCW
	 j+OI1aS3prgr+kJmW3y/iegaEqzZai3x8h0bGqWrVcJsRzrcklPQTgpMaOyhbFoa0y
	 2Nk3i/vfMwSv+qAZL8hJqdUTixeEZMuSKTCMnoyNTuz3ysdfBG9lKeplcSp8qkIuSK
	 nFVBLpsLIoWUV4mo4kKJlgd+IVKGusZArsmsA5maFKCEPfOaqbVHZfqF2oickMsw4n
	 TOHoADhKT6eVFln3USAyxG0if1bkiVBlF7ziJNsLg1t3DHfKLmo1lF+IAilsMg9dzU
	 8I421CePrQc6A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E020A80BE8;
	Sun, 18 Jan 2026 21:52:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5D3462CE
 for <buildroot@buildroot.org>; Sun, 18 Jan 2026 21:52:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4DC31606E8
 for <buildroot@buildroot.org>; Sun, 18 Jan 2026 21:52:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9jgRYhZW8zZ1 for <buildroot@buildroot.org>;
 Sun, 18 Jan 2026 21:52:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2C2ED605AA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2C2ED605AA
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2C2ED605AA
 for <buildroot@buildroot.org>; Sun, 18 Jan 2026 21:52:01 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 68BDA1A2930
 for <buildroot@buildroot.org>; Sun, 18 Jan 2026 21:51:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 3EBC8606E7;
 Sun, 18 Jan 2026 21:51:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 98BCE10B694C5; Sun, 18 Jan 2026 22:51:58 +0100 (CET)
Date: Sun, 18 Jan 2026 22:51:58 +0100
To: Vincent Jardin <vjardin@free.fr>
Cc: buildroot@buildroot.org
Message-ID: <aW1VzqqhZjs7cVDj@windsurf>
References: <20260107234505.0810d964@windsurf>
 <20260118213120.69615-1-vjardin@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260118213120.69615-1-vjardin@free.fr>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1768773118; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=sQU/aSh9XknXYTrmPkAZAAUEJWmEgaWAWGILRttJhec=;
 b=gsLFyedkeIlQJ/ZP/3s75+5gnymn3ugt55yjPUSV+4ViDpY1UmOSWQc0AKjtLtyn+KSmKS
 fNHXrga+80GUd0LInHdQqUulVh6iELN5hf/ubISSPoYyZSqq8pszgXJRCx/9pWE29p5ib0
 Bj2cglO53mp/+fZWwLPI9Cz8WpeuOCp2yTWTq+3mEZvGRoKdDnb8rOwcuXoyf6LOwcLPUe
 n6r8qNo1bM+CrTWA9yeGFhVdHNLGinGvFmU4b1QF09SfJpxPk3OF1tcFoovSaSq2TwWAaz
 6Z5k0akproMNyBqDe5vTApjuY60dDwEFKmODeYYb+euz0KAv4SJ1OxuxfXrUEA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=gsLFyedk
Subject: Re: [Buildroot] [PATCH v1 0/1] package/sysrepo: fix build on riscv32
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

Hello Vincent,

On Sun, Jan 18, 2026 at 10:31:19PM +0100, Vincent Jardin wrote:
> This patch fixes sysrepo build on riscv32, where glibc doesn't define
> SYS_futex (only SYS_futex_time64), causing the build to fail.
> 
> The fix uses pthread-based condition variables instead of futex on
> this architecture by setting -DSR_COND_IMPL=sr_cond_pthread.
> 
> This issue affects all sysrepo versions on riscv32 glibc configurations,
> including the 2025.02 LTS branch (sysrepo 3.6.11), so this fix should
> be backported.

Just to save you some time: sending a cover letter for a series
composed of a single patch is not necessary. A cover letter is only
needed when the series grows beyond one patch *and* some introduction
explanation is needed.

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
