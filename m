Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 843F9FD9E0A
	for <buildroot@archiver.kernel.org>; Thu, 26 Feb 2026 21:00:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A908B407B5;
	Thu, 26 Feb 2026 21:00:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lBFfh_HJnk8w; Thu, 26 Feb 2026 21:00:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4B855407A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772139657;
	bh=s5QSJkbXrc8ZDbg0uHoAMkVs02Z4VlYNw/3eaeaodak=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=IDq9Q9w6C70H9E4EeN51IVF4S7p5KAmhdTCdwq5VpX+0qQl5v5of234SmAowlAJ0Q
	 PrKAbmMr8+abA5yTMCvpdNW6XVYtde3ETI9JHNQVbxZcQPHUSzehBVAavBfGigF+3n
	 Fba74lxrIJXlVfozZCfdtVnCsIjfuGqc6QbyaNTAhaY/78zR2Cvi3rTvv0v50A8g8N
	 R1Hn1+D9ecmWDMkpmzbnM2VDnaPXFgMoA1jh2WH9uPUD/DDSJr9dIz12u6oYJ1BGhg
	 qJUX+vCkpKThsKXEsa++Qd5rYgqxo0kRyisN63QLW8MO27WJLpPXq9639kx63wCS+L
	 HW/DZZS8n/9yA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4B855407A8;
	Thu, 26 Feb 2026 21:00:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0AD821F3
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 21:00:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F08B26075E
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 21:00:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ySbE68hzgPnG for <buildroot@buildroot.org>;
 Thu, 26 Feb 2026 21:00:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 15BA16072E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 15BA16072E
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 15BA16072E
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 21:00:54 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id F16F72003AE;
 Thu, 26 Feb 2026 22:00:41 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 26 Feb 2026 22:00:41 +0100
MIME-Version: 1.0
Date: Thu, 26 Feb 2026 22:00:41 +0100
To: Neal Frager <neal.frager@amd.com>
Cc: buildroot@buildroot.org, akbar.anthony.rezvanpour@amd.com,
 ibai.erkiaga-elorza@amd.com, luca.ceresoli@bootlin.com,
 yann.morin@orange.com, brandon.maier@collins.com,
 thomas.petazzoni@bootlin.com, romain.naour@smile.fr, michal.simek@amd.com,
 romain.naour@gmail.com
In-Reply-To: <20260226070623.3826260-1-neal.frager@amd.com>
References: <20260226070623.3826260-1-neal.frager@amd.com>
User-Agent: Webmail Free/1.6.13
Message-ID: <3879e8c94f9229e731bcce284f6771c1@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1772139653;
 bh=MrB3mNwzGwZ+8+A9B1lZ8UoZMdGFdykqDLCz0OxtusU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=pjNrcfG+fXeWQXha94QeClXjbnxreFbeXrAcedJoob0DmlQ9Sf2CwZb3ozQcYpKAM
 iWtvVqNJLo19br2i0P705//r84s+Rx3oZFZdthcsWo60ah7ePwOn1+lNdq9/CBc9oC
 fEQ87PYXNYmo/pAushhfGXc1pCq8RhHVILX1/hZFpdH6rkTGQMaVMWe2Uj5I4Ekzol
 NQeuRPjtkmM5WGv3wgR4/6WUbD2Bzp5kGVx2yDADJ8LsP39pUgJTOnpNX6LLa67GUs
 p3dEzQ2S3djTcfxD4UTSmeDoyLU24Ex38lUB1rmbBkCj32W7y4sYH50XodxZ5NNEOZ
 McwoSj5hs27ug==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=pjNrcfG+
Subject: Re: [Buildroot] [PATCH v1 1/1] configs/versal_vpk120_defconfig: new
 defconfig
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 26/02/2026 08:06, Neal Frager via buildroot wrote:
> Add versal_vpk120_defconfig for vpk120 evaluation board.  This board 
> has a
> Versal Premium VP1202 soc, and this defconfig further extends the 
> portfolio
> of example defconfigs for Xilinx Versal SoC products.
> 
> More details about the evaluation board can be found here:
> https://www.amd.com/en/products/adaptive-socs-and-fpgas/evaluation-boards/vpk120.html
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>

Applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
