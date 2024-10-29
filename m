Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6B4AD3A697
	for <buildroot@archiver.kernel.org>; Tue, 29 Oct 2024 20:24:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9399880B04;
	Tue, 29 Oct 2024 20:24:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BxwNL_-7cu1V; Tue, 29 Oct 2024 20:24:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A9D1B80B1C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A9D1B80B1C;
	Tue, 29 Oct 2024 20:24:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id D9F364969
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 20:24:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BB1FC60657
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 20:24:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g1mlKEO_bMlf for <buildroot@buildroot.org>;
 Tue, 29 Oct 2024 20:24:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9B44960647
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9B44960647
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9B44960647
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 20:24:07 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id F129F1C0003;
 Tue, 29 Oct 2024 20:24:05 +0000 (UTC)
Date: Tue, 29 Oct 2024 21:24:05 +0100
To: Fiona Klute via buildroot <buildroot@buildroot.org>
Cc: Fiona Klute <fiona.klute@gmx.de>
Message-ID: <20241029212405.1b72714a@windsurf>
In-Reply-To: <20241029190420.2381778-1-fiona.klute@gmx.de>
References: <20241029190420.2381778-1-fiona.klute@gmx.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1730233446;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GNuTAnVLKil6pM4513p1q9Oua+8fphGuBcmDFTdJdag=;
 b=YPB2R2FEWtcwioZjDWt3OnOoc0nl80dD0+8BFMWqECpm4or/sJO/ktfBFPlEjqbZk2bQ6y
 fbKiIZLT6jhax3b1pP2RE/bk8fa7dI5qTM9CwCycNSluSVw6jN7s/SM2sMjvUaopv/G6BC
 QbIrplx2N0WdugUGP+f07Zba1hyusv3iXW6TF/65If/1Nw3wYQMUy/hDu9K9eOYEWEZSPT
 JTD22NcMUo4aFI773efFOj++CDDp5fEd8EftVN+pJJ4axRTQa/XRXiae0yQXxFo1Av0kPD
 hMhjVDI0h81grhyd8gxMMBt+32q0H6UdNnW4CGU/4nxQCJpZMMF0K/myhCwoSA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=YPB2R2FE
Subject: Re: [Buildroot] [PATCH 1/2] package/chrony: rewrite start script
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

On Tue, 29 Oct 2024 20:04:19 +0100
Fiona Klute via buildroot <buildroot@buildroot.org> wrote:

> From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>
> 
> This patch brings package/chrony/S49chronyd in line with the start
> script standards. Note that users will need to update the location of
> any script config from /etc/default/chrony to /etc/default/chronyd.
> 
> One deviation from the standard remains (and thus the check-package
> override): The PID file is placed in /var/run/chrony/$DAEMON.pid. This
> is necessary because chronyd drops privileges, and would not be able
> to delete the PID file from root-owned /var/run on shutdown.
> 
> Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
> ---
> I'm happy to drop the config rename if it's considered too disruptive,
> but it's a simple rename, so I hope it's fine.

Both patches, applied, thanks! I also wondered a bit about the rename,
and thought it was OK. We'll see if users complain.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
