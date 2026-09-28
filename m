Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CC12C9833E
	for <buildroot@archiver.kernel.org>; Mon, 28 Sep 2026 08:55:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4B99D406D8;
	Mon, 28 Sep 2026 08:55:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YEwCy4ppMEi5; Mon, 28 Sep 2026 08:55:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 714E7406C7
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790585727;
	b=Xpb3an+g3O9NIMf9WAiXSh5/zLhnhNCTE4wSigUiE4trDQmG/k3W5k1yOtZe2Yq9hXiD
	 P6Zk+9cCVTmknzw/H6tZXS2HVcF9sE3gZ6UiZmLMT4VW6b1wO8Oyc1Jc9NhOZLm3mJtj0
	 8yDaPgM90Gabcqfq2eft2LApwg7/lxcq7yrBL4oivS0f39JjB6bKmbbGI5DugupvPHhzz
	 vWl3ii6KYEygDpMwuCC9UYym+CyBHvcw38a1TmxxHylraAPNItpuNDDG//rTfFJT1oCzW
	 fW1SRhHlDZswgC55PXGlQz37Y+BoOdtRJ2lLvMboMdIpDNj6oBF2/ksU1wCnvPOCZqQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790585727;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=bc9R1KGUsrMzOjQYZtv7igQLIv5ASbij/R2HaKEi9xA=;
	b=JzdZL3DVlfIJh1VvXZG2JBA+GVQFD6owG6IGquC6vR0h+hMFfx2ICcOx/9Apolz472TR
	 De/QXNvq95DUOUGqo0vr1Ne1WI8JV+ZKmLU84qy767zgtrN38+q/+2g9m0RxgTl7Y7sSN
	 jQTaDp1OzA5XNARVNNgcqlLkolFXGQ2+akQJn3kXOc3ReNeCB1VS4Aqiw/02b41RcHFNN
	 i2obyKcpMvtsTmYNF4dOgNznwPijM1veMRiIFXjSUNuhmsL/XQsTUBU6bH9f6wjUQeAUi
	 z+Ib6Uus9insyAec1MlmUQHL4INMWi7DzC3BS0hNtDmY+KhD/scQZwKB8Ag8X1a5/Cw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790585727;
	bh=bc9R1KGUsrMzOjQYZtv7igQLIv5ASbij/R2HaKEi9xA=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=GOd5f8BbtgPniVrF8hxYjR/Vopnhv9UC/XO4huSQbC0VsmLi6AD5GxWLTsQ0WLc02
	 rf8RMXYjNevpWvtYxmz25kUpTE+fOIG3aohOQOv6CVcqng4Yw16m0sytOuaRDq3z9p
	 PQGduKJ4ZiKp2D1a6UEiq2p+eRwE7Sk0PoNeX+kt8xaJjUEZ//wyltozS0RFjDma4s
	 CDcORG2RzS+c5tWMr95nENz+T+NPWTBwdi1ui0BF852TjYA3kQf79NF+caj2O6XP4g
	 mZdMPD8afXg14iv3dxpx3Xo3+F20uQeSSh2e7jF+Q9ezjr3tncQKigUmCHk9tKvQOL
	 MCJXnmRFxgwiA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 714E7406C7;
	Mon, 28 Sep 2026 08:55:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4D2D222B
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 08:55:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 38CD840189
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 08:55:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VLgtBuRMJebT for <buildroot@buildroot.org>;
 Mon, 28 Sep 2026 08:55:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 44A4C401D2
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790585724;
 b=h3vpjae86LsF5E14h8L1NMVrcQhSr0/NPsAjsclx15LVGlP3SkDthdd/zseu/IlVKMAA
 qrq4PzhSauBW+OLVby69V+JQei1fj9eqge82OFbrvS0XbzaGUJ+fq1Njg2q4tQ0/573og
 YSzDdpri8aa0x9qq/WJaYu3RWjAwNu7wpZIxrSfajnbBrtsTZ0PmcDdPnRUx/NHDfBbGN
 IgJJOh6A3zpCzv9cZmVpj4Ri+dD6ZzHtACDFTb58qkT2OcQOv3GbgBk+wHt8xf44kLw4B
 6Kwfibjo7DDUxCMJvkam7YqozmxQbX/LadMsiKPiAm75IqkLdDLKpL0U68tx0C7REFQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790585724;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=8+uIQ0Ry9UozodoJ9HqsELD3sCOaZ/xlf8z2nTd6X3o=;
 b=WxRPqem5JeLIW2uqOaR5FWyAOfTC56K21BxITIZlU366BNwRqOB5sZj/e7CHirmLiUTR
 UFiHSZzILlAF09o6irl+7MxyHd+CWBI9CKNF5Ns8rQpcg4GXK/hiTg9CyA/7BYkinwK68
 cijnt9qHZvgXKe5DUszvrBavdmgNN8ZgKKpQtsWW+lJppLv/kC/J1zCUGRlrh598Ht6j2
 +Ws8O2sVfz3KC+hVv6bhbUj+JW3TognCU4OpGyOI23DVM15M59OPlhv2EaghUG2hZyr7q
 RkL2yyed43n55Qk6NeRnoiUkWoR7OUR+OEVBHwaC4nJJAGAp58ZwJ0Dj6FVMuSwIeVA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=2JuTrhEY; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 44A4C401D2
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 08:55:24 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id C55BF1A0FD3;
 Mon, 28 Sep 2026 08:55:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 8AEB8601BD;
 Mon, 28 Sep 2026 08:55:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 2A35A102F1EA9; 
 Mon, 28 Sep 2026 10:55:19 +0200 (CEST)
Date: Mon, 28 Sep 2026 10:55:19 +0200
To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: buildroot@buildroot.org, Bernd Kuhls <bernd@kuhls.net>, 
 Will Newton <will.newton@gmail.com>
Message-ID: <aroq5mq_8nTxwbYv@windsurf>
References: <20260926133654.2836794-1-yegorslists@googlemail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260926133654.2836794-1-yegorslists@googlemail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] package/libmicrohttpd: fix build without
 thread support
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

Hello,

On Sat, Sep 26, 2026 at 03:36:54PM +0200, Yegor Yefremov via buildroot wrote:
> Add an upstream-submitted patch that moves connection_get_wait() out
> of the threads-only region, as MHD_get_timeout64() calls it
> unconditionally. Without it the build fails with
> --with-threads=none:
> 
> daemon.c:4524:18: error: implicit declaration of function 'connection_get_wait' [-Wimplicit-function-declaration]
> 
> Fixes:
> https://autobuild.buildroot.org/results/10f33829552059264104623353a9ec1584b08e4f
> 
> Assisted-by: Claude:claude-opus-5
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

Thanks a lot for the patch. However could you identify which commit
introduced this regression so that we know whether this fix should be
backported or not?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
