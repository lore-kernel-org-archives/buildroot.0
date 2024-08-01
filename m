Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF5E1C3DA7F
	for <buildroot@archiver.kernel.org>; Thu,  1 Aug 2024 21:45:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 75AFB81364;
	Thu,  1 Aug 2024 21:45:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pgvmW_xaZH_P; Thu,  1 Aug 2024 21:45:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C6CBC81403
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C6CBC81403;
	Thu,  1 Aug 2024 21:45:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EA6241BF3F0
 for <buildroot@lists.busybox.net>; Thu,  1 Aug 2024 21:45:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E4292409E0
 for <buildroot@lists.busybox.net>; Thu,  1 Aug 2024 21:45:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nkWgZxrR4Ypa for <buildroot@lists.busybox.net>;
 Thu,  1 Aug 2024 21:45:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A010440998
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A010440998
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A010440998
 for <buildroot@buildroot.org>; Thu,  1 Aug 2024 21:45:18 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D8FF5FF803;
 Thu,  1 Aug 2024 21:45:16 +0000 (UTC)
Date: Thu, 1 Aug 2024 23:45:16 +0200
To: Kris Bahnsen via buildroot <buildroot@buildroot.org>
Message-ID: <20240801234516.6660ecc5@windsurf>
In-Reply-To: <20240731235828.1793055-1-kris@embeddedTS.com>
References: <20240731235828.1793055-1-kris@embeddedTS.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1722548717;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=E0aINsCuU8PrNAwRp+iXunReSnBgWVdJ78lP0PHHGLU=;
 b=S/5Ee2x/MLyuy7mMaHxx3PCaNqxXQM5VD51/UAESfBJ/9cyzjhJi0DZ1X73zIwO+ryvUfB
 JvtMel+F47vEMJLOVqwL3tc7xzAI/dfMhhpjMP/Lws8hyRgvIdC6kDBQNZ2nhbI7+y8vLA
 zSjH5lGa+M6Of9XbeycYsN52yrvnRBNmEpUL99go1d1ejH1l+6jWIy2C3RjH2dCD/o28zw
 WYV6jRQqtgFOWyYLhUoe7kB2UQsUno0PvqUdLId9Von01ud+fivfJd/C57/2OYLX1yjzf+
 1byjsbT8D1oaADuhxlZfABtOapgCuSfgRV/FM7xwwGkoEfxiD+Z6Kx8mYu8iGQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=S/5Ee2x/
Subject: Re: [Buildroot] [PATCH 1/1] package/wilc-firmware: bump to 16.3
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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
Cc: Ludovic Desroches <ludovic.desroches@microchip.com>,
 Kris Bahnsen <kris@embeddedTS.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 31 Jul 2024 23:58:28 +0000
Kris Bahnsen via buildroot <buildroot@buildroot.org> wrote:

> Wraps up firmware 16.2 and 16.3
> 
> Changelog from https://github.com/linux4wilc/firmware/releases:
> - Fixed the transmission issue for the large data blocks
> - Unified driver codebase for the ATWILC & nextGen products.
> - Fix for Powersave state issue when network interface is down
>   (using 'ifconfig wlan0 down') and 'up' again.
> - Migrated the ATWILC driver codebase to Kernel 6.6
> 
> Signed-off-by: Kris Bahnsen <kris@embeddedTS.com>
> ---
>  package/wilc-firmware/wilc-firmware.hash | 2 +-
>  package/wilc-firmware/wilc-firmware.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

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
