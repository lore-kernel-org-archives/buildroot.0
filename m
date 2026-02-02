Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 474E9E73151
	for <buildroot@archiver.kernel.org>; Mon,  2 Feb 2026 10:19:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1862160714;
	Mon,  2 Feb 2026 10:19:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x4EfGmZPNW2t; Mon,  2 Feb 2026 10:19:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 456D460722
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770027548;
	bh=Lz487maBZT18oQ4kZH5YJZrcrI62AIs0kyItwPtmLLM=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=QDlY/1T7hXJL4zKg634vwdLLzxaMnZU9U19Ox3UKMtW0gLz31NN9mKp4nPFlHyztn
	 beuJLwnU6M+ZI/wanP+IJ+dw1uHydDY8ccEljhrpU+LeNcua4mHUdf7aezUP/oIe+d
	 w54EVPx2rR4HK07IpVQj1Rfbeo4hLTvadlkP+ennTJTpbn3oX4pfi2bSzokGHwAaKp
	 2xjLcL2UOV8DTczL9D97reHKDuZQJetHorYFCIctpOY+oitCCbeX5rggZ5EE7ZLtKA
	 4uFBY1l/Hw/WBX82SYajb7W3leyM4Tksb0xdF1Akf2CZ3agZY5Lgju2WTqOF+lRt7h
	 k9bPFh6upRTIw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 456D460722;
	Mon,  2 Feb 2026 10:19:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id D95CD1E0
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 10:19:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C895960714
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 10:19:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id evlcE-F8nHIt for <buildroot@buildroot.org>;
 Mon,  2 Feb 2026 10:19:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B7C9560B60
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B7C9560B60
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B7C9560B60
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 10:19:04 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id A45371A2B9D;
 Mon,  2 Feb 2026 10:19:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 7A74860767;
 Mon,  2 Feb 2026 10:19:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 7E846119A8888; Mon,  2 Feb 2026 11:19:00 +0100 (CET)
Date: Mon, 2 Feb 2026 11:18:59 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org, Leon Anavi <leon.anavi@konsulko.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Fabrice Goucem <fabrice.goucem@oss.nxp.com>, 
 Jagan Teki <jagan@amarulasolutions.com>,
 Lothar Felten <lothar.felten@gmail.com>, 
 Fabio Estevam <festevam@gmail.com>
Message-ID: <aYB56_Edh3i-LICF@windsurf>
References: <20260114195451.3978704-1-giulio.benetti@benettiengineering.com>
 <20260114195451.3978704-6-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260114195451.3978704-6-giulio.benetti@benettiengineering.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1770027541; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=lTaT41kKLguhGeHeyei4noBkAUEXssDeMd7HRyisjaM=;
 b=D+L3b343Rd1swhZRcyhdRJ9EtCsRKaGmoqyY+iVhBxiGM/RmUKvRA9g3mCPjV77d6DzdmH
 r3h2hJNRQDF40Ev0UyaslzTUlMxPO7Z7lXL/HTeqxGB6vPVqp73Vf5KfFBt/ptWd1Yo0ko
 msKGbXdx5ooXe545KRe0bCBks2QpeMQUu4jj/vgVg5E5vAGIL2ncVTAywjA0dKawSdYjFA
 q2Qa85rSAu/flknwnDKw0J9XRNH6vQsDks25Xy0SRJA1BDoCEccCda1mI3+kkTIvhAb2O/
 Fzx5GSf64dck6dSTsuiDk+KgfIRwhrLxZoeMmHAmL3Qu1DXBO1LljL7lzLSkrg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=D+L3b343
Subject: Re: [Buildroot] [PATCH 05/17] configs/bananapi_m2_ultra: bump Linux
 to 6.18.5 and U-Boot to 2026.01
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

On Wed, Jan 14, 2026 at 08:54:38PM +0100, Giulio Benetti wrote:
> The patch:
> * bumps Linux kernel to version 6.18.5
> * bumps U-Boot to version 2026.01
> * forces check hashes
> * switches to extlinux

It was already using extlinux it seems?

Also patch causes:

WARNING: configs/bananapi_m2_ultra_defconfig:0: lib_defconfig.ForceCheckHash was expected to fail, did you fix the file and forget to update .checkpackageignore?

> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> 
> m2 ultra sq

Messed up rebase? :-)

> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
