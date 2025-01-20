Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B699C02181
	for <buildroot@archiver.kernel.org>; Mon, 20 Jan 2025 20:59:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3A18583EC2;
	Mon, 20 Jan 2025 20:59:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lrMUcPCEIQVZ; Mon, 20 Jan 2025 20:59:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5436383ED0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5436383ED0;
	Mon, 20 Jan 2025 20:59:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9C51795B
 for <buildroot@buildroot.org>; Mon, 20 Jan 2025 20:59:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 97B7B83ED0
 for <buildroot@buildroot.org>; Mon, 20 Jan 2025 20:59:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g_CDJ0iEkE6W for <buildroot@buildroot.org>;
 Mon, 20 Jan 2025 20:59:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=luca.ceresoli@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4C57383EC2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4C57383EC2
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4C57383EC2
 for <buildroot@buildroot.org>; Mon, 20 Jan 2025 20:59:47 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id F401D20003;
 Mon, 20 Jan 2025 20:59:43 +0000 (UTC)
Date: Mon, 20 Jan 2025 21:59:42 +0100
To: "Frager, Neal" <neal.frager@amd.com>
Message-ID: <20250120215942.28dcf7a8@booty>
In-Reply-To: <SA1PR12MB56151FFC38BE2D8926ECBDBAF01B2@SA1PR12MB5615.namprd12.prod.outlook.com>
References: <20250117080009.774814-1-neal.frager@amd.com>
 <20250117080009.774814-4-neal.frager@amd.com>
 <SA1PR12MB56151FFC38BE2D8926ECBDBAF01B2@SA1PR12MB5615.namprd12.prod.outlook.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: luca.ceresoli@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1737406784;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Kt3ZngspZBkT3W4xB8AGz5Yjn6OdJqPUPCSrfzqh2ok=;
 b=YfaIZMzTAzXz8E5T0efEqHKX3S5ewmuQiEA1qZsqRGwTdWrIYdFoCZHyAPcqoG+6umYaep
 2dIHVvpE9r27TTG0IOqqaghyopttwv/y8Hi7aRUIq8MEEUDj3raT9neFVVbSnLWTj+1NAA
 6F2I5gi5Puawv7QlI3iDhmfaL+GqS4V9u0zL87QyUm4uf7dImGLZuj/7Y11hColZ6N9ce8
 KQtxVS/N3dFy7qp/pls6dbajD19E1+7b5Sz70EMTkz4GOq5WF8Cdvf0dBCz3yb7f3gDzY6
 zKBJkv7baIRxorpiP0sfak3BcWJDSie0p47uWM34ZuI7wvoKLH/ZFKjPQp+rPw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=YfaIZMzT
Subject: Re: [Buildroot] [PATCH v5 4/6] configs/zynqmp_*: migrate to binman
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
Cc: "Erkiaga Elorza, Ibai" <ibai.erkiaga-elorza@amd.com>,
 "brandon.maier@collins.com" <brandon.maier@collins.com>,
 "ju.o@free.fr" <ju.o@free.fr>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>,
 "romain.naour@smile.fr" <romain.naour@smile.fr>, "Simek,
 Michal" <michal.simek@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 17 Jan 2025 08:26:54 +0000
"Frager, Neal" <neal.frager@amd.com> wrote:

> Hi Luca,
> 
> > This patch migrates the zynqmp defconfigs to binman applying the necessary
> > upstream uboot patches.  
> 
> > With binman, u-boot can now build the correct u-boot.itb files for kria
> > natively.  So the post-build fixup scripts are no longer needed and can
> > be removed.  
> 
> > Signed-off-by: Neal Frager <neal.frager@amd.com>
> > ---
> > V1->V2:
> >  - new to patch series
> > V2->V3:
> >  - squashed patch that removes the kria post-build fixup scripts
> > V3->V4:
> >  - no changes
> > V4->V5:
> >  - rebase Buildroot for zynqmp_kria defconfig changes  
> 
> -- SNIP ---
> 
> Since bumping the zynqmp and kria defconfigs to Linux 6.6.60, I needed to
> rebase this patch of the series, so it can apply to master.
> 
> Since absolutely nothing else changed, I kept your reviewed-by and tested-by
> comments on patches 1-3 of the series, but since technically patch 4 is
> "slightly" different, I removed the comments from patches 4-6 of the series.
> 
> You are welcome to re-add them once you have tested the rebased series.
> 
> Please let me know if you have any questions.

Patches 4-6 look as good as in v4.

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
