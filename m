Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5DD5E77197
	for <buildroot@archiver.kernel.org>; Tue,  7 Jan 2025 17:24:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6BFB180EFE;
	Tue,  7 Jan 2025 17:24:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4scxP3cWc1yu; Tue,  7 Jan 2025 17:24:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0F7A580F09
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0F7A580F09;
	Tue,  7 Jan 2025 17:24:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id AEF63DB4
 for <buildroot@buildroot.org>; Tue,  7 Jan 2025 17:24:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9C43D606F3
 for <buildroot@buildroot.org>; Tue,  7 Jan 2025 17:24:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zn_VIzjlXlHW for <buildroot@buildroot.org>;
 Tue,  7 Jan 2025 17:24:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=luca.ceresoli@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 37FDE606F2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 37FDE606F2
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 37FDE606F2
 for <buildroot@buildroot.org>; Tue,  7 Jan 2025 17:24:28 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D9A861C0006;
 Tue,  7 Jan 2025 17:24:26 +0000 (UTC)
Date: Tue, 7 Jan 2025 18:24:25 +0100
To: Neal Frager <neal.frager@amd.com>
Message-ID: <20250107182425.14145f2e@booty>
In-Reply-To: <20250107063136.787314-4-neal.frager@amd.com>
References: <20250107063136.787314-1-neal.frager@amd.com>
 <20250107063136.787314-4-neal.frager@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: luca.ceresoli@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1736270667;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bo6NUNZnNksVPLUMqShFpabiHWINDE+o6FbozOxpEAI=;
 b=iNtHLIUIvO1qm+IwggQizudkMNU1SVoAFlXfBFSKibAsAX4XUtetrtE4uxLdR2nk+lcaiJ
 Y63/7nakb9+0gdTxgSOOIlHcTLkV1f+niEa4VtgqU7ecID2NAq6upPf/bea5Xg9b9UQ0GB
 QRpNcQbo4msq8FREVdkzxbY9MaAmnxktLkvTgm/ozJat5gaUEmVbGLZyqzpl24/Jqat5S/
 UM9mRdHDRc1g886860eX/aWiglGqS2E3N36rHoj0pUdOf1geGHrEBk4Bb/B0DOY3UeVSvw
 bPG0wy1VjGVOBu2DIdNm70H1hX53s2JCwkIGT9Z3gq28y9GlX3dm/yKGzxQNjA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=iNtHLIUI
Subject: Re: [Buildroot] [PATCH v4 4/6] configs/zynqmp_*: migrate to binman
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
Cc: brandon.maier@collins.com, ju.o@free.fr, thomas.petazzoni@bootlin.com,
 buildroot@buildroot.org, romain.naour@smile.fr, michal.simek@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 7 Jan 2025 06:31:34 +0000
Neal Frager <neal.frager@amd.com> wrote:

> This patch migrates the zynqmp defconfigs to binman applying the necessary
> upstream uboot patches.
> 
> With binman, u-boot can now build the correct u-boot.itb files for kria
> natively.  So the post-build fixup scripts are no longer needed and can
> be removed.
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>

[Tested on Kria KV260 starter kit]
Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
