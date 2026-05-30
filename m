Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A031CD6E49
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 14:56:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 091356F56B;
	Sat, 30 May 2026 14:56:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Mk4tJApUjS2v; Sat, 30 May 2026 14:56:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9F3C06F4CE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780152977;
	bh=3cNssAmTLbGNpBF+arVuuynzF0AHA45mm/uK81pOeXE=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=sK8kgzKWPT5woolfaOHMlsdtVwWB7ZasNkLSjxjfxPGpQuGXwd97gH6XO6YGphdOP
	 sbGGcCrWkUVAaGnWQ1JMw//PTmUQFhqMJ8IPexZaSXskueCSVPKEx8/XQ49Ud3QCSY
	 3tltHzWogL2XMZbOo3m+5ySO00ONL8Sz1cEdF8jKK4WTkKew8vSHKkhXJ3s0Lu/GKz
	 KpvmNRur3ngSECodjFcm7LkLjdZyR/8y8jUzMoMrxUirWJsVU0wgL4T3THevyG78Vb
	 zfMFeN7MmNH1S3IcwbjyJTJYlfL+SiwgY3jSil6ZKcAUKpC42z/xdUvXgI6O8cUbSG
	 a3uxyi8faIdSw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9F3C06F4CE;
	Sat, 30 May 2026 14:56:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id BFB7CF4
 for <buildroot@buildroot.org>; Sat, 30 May 2026 14:56:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B19CB4081C
 for <buildroot@buildroot.org>; Sat, 30 May 2026 14:56:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4UgksP1_TlY0 for <buildroot@buildroot.org>;
 Sat, 30 May 2026 14:56:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org AD29040814
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AD29040814
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AD29040814
 for <buildroot@buildroot.org>; Sat, 30 May 2026 14:56:14 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 09EEB4E42DA3;
 Sat, 30 May 2026 14:56:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id CC4676073B;
 Sat, 30 May 2026 14:56:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 0B11E10888CD8; 
 Sat, 30 May 2026 16:56:11 +0200 (CEST)
Date: Sat, 30 May 2026 16:56:11 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
Message-ID: <ahr6f7WHDnFqxUl4@windsurf>
References: <20260408171741.3533520-1-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260408171741.3533520-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1780152972; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=GFuCLFQ1w03tKfD1fxX2WyxBKYG3jmwKczkfMeg/R9Q=;
 b=k3/RiIoxud8n3kgps3nLYzeweWdrOtl//4RWy2ftyQQyO+ZhJ6uDiJIjrgvYq68V6w9uN5
 jTWuSYiAVKMzUKQrTgbiJ9tFIlSahV+S+QYqZ3mVNDxp2JxWuumVZ3f6D6gUPpabeNTk9v
 d58foIDuuo6SmW2FBQTb31Y6HUMq1sAnfFnrmYoi66IG1UnFsRLoow+cuujKW9svpdNH9h
 cCWQMWN+auDKnqAoaytdDyM/c8IlAH+G8pzZk4fZaZLX71qU2gl5MOct3k2+Jw8vKK6k2C
 XyV/YeDcA3POf4F4f8LCqCDpi6aSb0aXf4iXtn4nvvBZGET5NnZnOUdWPJW5Gw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=k3/RiIox
Subject: Re: [Buildroot] [PATCH 1/1] package/xmrig: bump version to 6.26.0
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

On Wed, Apr 08, 2026 at 07:17:41PM +0200, Bernd Kuhls wrote:
> https://github.com/xmrig/xmrig/blob/v6.26.0/CHANGELOG.md
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to next, thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
