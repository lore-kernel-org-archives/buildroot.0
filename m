Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0FBFCD3428
	for <buildroot@archiver.kernel.org>; Wed, 12 Nov 2025 16:42:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1A77760E36;
	Wed, 12 Nov 2025 16:42:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qF-ztc0uoBSh; Wed, 12 Nov 2025 16:42:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8CF1060E18
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8CF1060E18;
	Wed, 12 Nov 2025 16:42:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 93B39FA
 for <buildroot@buildroot.org>; Wed, 12 Nov 2025 16:42:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7928182784
 for <buildroot@buildroot.org>; Wed, 12 Nov 2025 16:42:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ErQ55nEnisKZ for <buildroot@buildroot.org>;
 Wed, 12 Nov 2025 16:42:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=luca.ceresoli@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7127F82779
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7127F82779
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7127F82779
 for <buildroot@buildroot.org>; Wed, 12 Nov 2025 16:41:59 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 2EFBB4E41671;
 Wed, 12 Nov 2025 16:41:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id E7D9C6070B;
 Wed, 12 Nov 2025 16:41:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 6EAE1102F1CEF; Wed, 12 Nov 2025 17:41:51 +0100 (CET)
Mime-Version: 1.0
Date: Wed, 12 Nov 2025 17:41:50 +0100
Message-Id: <DE6V6QTL9BNK.1MWWL0RKSB8BU@bootlin.com>
To: "Neal Frager" <neal.frager@amd.com>, <buildroot@buildroot.org>
X-Mailer: aerc 0.20.1
References: <20251112103353.2021040-1-neal.frager@amd.com>
In-Reply-To: <20251112103353.2021040-1-neal.frager@amd.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1762965716; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=ebGHBdvKLg6NNu0HJS3G/iy6K59RqMmezb9EFT+M5uw=;
 b=zHNZcebR0TlmECV0JmA0Mjm5R+YBxzyATuuM/L0Ey7sCZ38VfyL5y06eIsh8xoCNf03S60
 LC89I0bm46n2bTI7CzIdblesq2W5GvebRF5+/rtGSHKz4tLCrYADG02XngNJLyRS9Kyflc
 wV4VOh81bJ82DYyBBQm9svy+RwSLP7GFDf1/CpgkelEZ7j5dDPJRm/VN0WUYZDXwnINNXm
 MAiF8Tm2KXIWpmR0xlbi/VtmTl8x95pEt5JslYNk37VmlZ5FyxirJhokLl8pc+dMBwL2jH
 GSjJoKuvA2HMGilzUnqV4tiLwr5pWcLIaniB81hNfq4e9oOVjhxdg9CcMmpfSQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=zHNZcebR
Subject: Re: [Buildroot] [PATCH v1 1/1] boot/xilinx-prebuilt: add support
 for kria-common
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
From: Luca Ceresoli via buildroot <buildroot@buildroot.org>
Reply-To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: ibai.erkiaga-elorza@amd.com, yann.morin@orange.com,
 brandon.maier@collins.com, manikanta.sreeram@amd.com, ju.o@free.fr,
 thomas.petazzoni@bootlin.com, romain.naour@smile.fr, michal.simek@amd.com,
 romain.naour@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Neal,

On Wed Nov 12, 2025 at 11:33 AM CET, Neal Frager wrote:
> With the next release tag of xilinx-prebuilt version xilinx_v2025.2, the kria
> pmufw.elf images will be merged into a single directory called 'kria-common'.
>
> To keep backwards compatibility, this update checks to see if the old
> <board-name>-kria path exists, and will copy the pmufw.elf from either the old
> path or the new path accordingly.  This way, users can still use any version
> of xilinx-prebuilt, and the package will still install the correct pmufw.elf.
>
> Signed-off-by: Neal Frager <neal.frager@amd.com>

Is it just me, or conventions in these files are changing frequently? :-(

Anyway, the patch looks good:
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
