Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CFD8CFD637
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 14:10:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F1E1B8169A;
	Wed,  7 Jan 2026 14:10:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IaxIQNA5gmKw; Wed,  7 Jan 2026 14:10:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6507B821BA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767795019;
	bh=AeZZC2HoXida98gZor44pg+YKFl2uvammNYOr3/4AFU=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=nFmsjDd5oCFhnx96gtaJk4uzAXPaIyeuu18jt8OjRKmaSJSDULWOCD5TxGipIBlma
	 EF6wrUvHIKZWRRLYdRjy1nBqoz6BrauA77cCpbmDy4B/WDFFwYhgbv5xClxw6I7/KP
	 AxhPHEQn5fTtou60GDrjm36oAMwB8/7G254O7F8lexoDIKWz3ttvdCHsH4MYHOjRy/
	 L6iMsgRiOxFAChdb2/Q36GeuNez9u5eay5AvWYVbff0OFe/VaOIh+CdyPMJ1eHRz6M
	 o50RIFhCxIbjNCxBVWrWt3XCxMYTF2F0NLEih68buP+6MEgrCKeiFdZqAw3F4N9cQg
	 eEIcXLDGdRE6A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6507B821BA;
	Wed,  7 Jan 2026 14:10:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8A9E5436
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 14:10:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 71F89400A5
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 14:10:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1eFaPai1BMiF for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 14:10:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5D88B4007C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5D88B4007C
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5D88B4007C
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 14:10:17 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 40D581A26DA;
 Wed,  7 Jan 2026 14:10:15 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 16119606F8;
 Wed,  7 Jan 2026 14:10:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 6C005103C803C; Wed,  7 Jan 2026 15:10:14 +0100 (CET)
Date: Wed, 7 Jan 2026 15:10:13 +0100
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org
Message-ID: <20260107151013.77f36eb4@windsurf>
In-Reply-To: <20260107113153.395738-1-dario.binacchi@amarulasolutions.com>
References: <20260107113153.395738-1-dario.binacchi@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767795014; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=R0msSiNPbhNpyE1zbpM/5zVEJVBHu87XcKoz0DKQuQc=;
 b=0ksznaNbqN2LB5FtVS7OaiBAfvuJVPYhqOmsL7GhNNSOECIiGrZPATjldnf9CNlu2uo58+
 GvjPh46gWG0qWTipOO3nFtNg9mn6StyNgrrMcy2RgGnn9ycmzZrPdcpJEBQQUrA7uC+VjS
 ph5vftnKiabSfe58nP4MGcxhYK+JGLkqcHUio82/q389kErXNBWMhRoyt4QxfdTarWin6v
 zQiFVifcAWC990OgDlWCorbOAiNaF0XPv06+dYS9Sbb6/RxDC4vEFtAMtZLOHblBgj9KT9
 IpVkhJoxCbY6s3KwMLDsjv3LAU2m7QMm5cOvy+VDxMdvxUaNAC7LvkZCwnpaUQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=0ksznaNb
Subject: Re: [Buildroot] [PATCH 1/1] boot/uboot: bump to version 2026.01
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

On Wed,  7 Jan 2026 12:31:53 +0100
Dario Binacchi <dario.binacchi@amarulasolutions.com> wrote:

> Release announcement:
> https://lists.denx.de/pipermail/u-boot/2026-January/606771.html
> 
> Changelog:
> https://github.com/u-boot/u-boot/compare/v2025.10...v2026.01
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
>  boot/uboot/Config.in  | 6 +++---
>  boot/uboot/uboot.hash | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
