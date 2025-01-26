Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ADFBC02181
	for <buildroot@archiver.kernel.org>; Sun, 26 Jan 2025 15:39:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1398F40647;
	Sun, 26 Jan 2025 15:39:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2UzphO_7X5iw; Sun, 26 Jan 2025 15:39:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CF1D8408DF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CF1D8408DF;
	Sun, 26 Jan 2025 15:39:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 69C5BF10
 for <buildroot@buildroot.org>; Sun, 26 Jan 2025 15:39:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3F91D4048C
 for <buildroot@buildroot.org>; Sun, 26 Jan 2025 15:39:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id REJy1srJugbe for <buildroot@buildroot.org>;
 Sun, 26 Jan 2025 15:39:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3E92540630
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3E92540630
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3E92540630
 for <buildroot@buildroot.org>; Sun, 26 Jan 2025 15:39:47 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id AFEB76012D;
 Sun, 26 Jan 2025 16:39:42 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:58664])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 26 Jan 2025 16:39:42 +0100
MIME-Version: 1.0
Date: Sun, 26 Jan 2025 16:39:42 +0100
From: Julien Olivain <ju.o@free.fr>
To: Sergey Matyukevich <geomatsi@gmail.com>
In-Reply-To: <20250126113141.3258643-1-geomatsi@gmail.com>
References: <20250126113141.3258643-1-geomatsi@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <c658d1dc7535cb64b92d0052531dbb77@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1737905985;
 bh=EdcFuWbDUmiR5TIju/v1ATGxuEq2WBKUo6G4Iut8lKs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=UBONNiRNzCyGfYc46TFPvNzcVlN0/BmrwLUzCNmnD+p6xcc/AI3JL1NLZFZCgoS/C
 VZIqtSLHlp8s9c1BVtc23k3XtCs2I2cv4fpz/Cx23cYQ+KzwzSsjIO5mdqVX6zaQqJ
 MkJF6QSZjwtZTvDyaXiZs7y2r4Dn2ZBGXG7N4sroNtLQZ/GfCaguJyiJBTkycZlW3C
 XUTkcwdNkioHvvyuHGTMfHatDa7WdNYy2wszwiu2h55Tma09U3y98g7eHQPmStSDWD
 RCUCo6b+gc/rNenzzj1VT3V0t/LvRbkmAcDLpm0QeOjSLEjmvpnDQMMNnVKm+fo+j9
 M6bDP8fxXD6KQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=UBONNiRN
Subject: Re: [Buildroot] [PATCH 1/1] board/orangepi/orangepi-5-plus: fix
 genimage.cfg
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
Cc: buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 26/01/2025 12:31, Sergey Matyukevich wrote:
> At the moment, Buildroot provides genimage v18. However that version
> does not yet include the GUID shortcut for 'u-boot-env' partition type.
> This convenient change is relatively new (see [1]) and can be expected
> in v19. For now, use the GUID value directly.
> 
> [1] 
> https://github.com/pengutronix/genimage/commit/3e0a2aea8d10431f8c8f652129f73544cfa16af2
> 
> Fixes: 057012eb2c2c ("configs/orangepi_5_plus: new board")
> 
> Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
