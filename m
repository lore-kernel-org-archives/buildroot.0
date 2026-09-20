Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CB1AC982DA
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 13:42:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E22C840D19;
	Sun, 20 Sep 2026 13:42:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 08ejNYhSDvkr; Sun, 20 Sep 2026 13:42:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org AE12E40BC5
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789911747;
	b=SZaVpNnsPkqbWorsXRmQuv+as0t0eTj05+cA7G2KAkDmFpt380LRw49AECpRAmbcrWbr
	 rSWaS0JGaDqK6dHfGUVUOdQvqqOFKbqpC3u0yg6iNrSXj/hgMTzuQQTcPe3r0a3VZa+TK
	 ezqAYxxfvW+rKlNgBZP8GQrF7NeV59A9onLsWBmL5UUbqEYlFgr/k2YtSs/KPRXf+QNck
	 BtGP2W35ElZNW//GXajhMUnlPaoRw0fOz4KqqhzAxbh05ElPd0EEQLTu16gET5HMJpfax
	 +uVVQorKVCPu0Glo1WG4bxxWnNq5Qhw8Cmcr1O56nK3q0jFetLuqujvACr5hyXvYdIQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789911747;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=2YgbsGQ6RLFPXAgVzDHvcLMY60lMFNOeBAtrBevosRY=;
	b=tXr4q6wai+ASEoDVG1FEteECTpusc1ehQE1fRIvYL3nt1e45B2UtkQz5WBU8nLu3TLR1
	 p5HlUZDjxZjNJaf+sG2tDA6pP4G3jWtZYhkbjO3cZ1Mat63bPCXs+nBk0oBw8QaudtEkc
	 SfamDHoBA6WrKmtZQgtHvnaNYFkU6cF87bTVV2KfhHPMHr4I1FO+Gw9w2XAcaYhDcQbq9
	 rshTZjgL3gXMaCU5IGXTovivtfx50g8P3AgIWh/AmfQbwYhQgN//QI/bmgGesqU0nCQHi
	 Djn0vwdB0u0lStrtvnr1FpTLJbLl8AKxRNxBXQUDsVif2b/SqBxxQK0pf+ZcKHGTj9Q==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789911747;
	bh=2YgbsGQ6RLFPXAgVzDHvcLMY60lMFNOeBAtrBevosRY=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Hjpu0zPyWWbN2aPUvzptbnhBTxAZ5K5kJcobccMVtrVmhk1ft7JIDSXjGlR2J/Obm
	 tzirLTbdNScEQcAHPjgaFPb+kddscX4ZiO3qtowz/tbfMRy7MXHqiUg+tyzjISK1Kf
	 SeA6ipIeWNQekSC7AUwImT2OF1G4W+/cuIjFvUKcEV1Q0KpK3DJRtwrYEBTys56Orm
	 CjNTSwpKGIcxVCxhUcGjQ7liYiTJtViugUcK5bRllf++W37lOiFpvXMIJLPlJSd6eg
	 IgX0w0WyPreVYXEHIhx1Jf0Hvy0FSGV9sxTZF4qqL6jNeS+RHJcKVXrRzm8FqOq0M6
	 HndqBUbM+EnAQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AE12E40BC5;
	Sun, 20 Sep 2026 13:42:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id E616F224
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 13:42:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E3ABC809EB
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 13:42:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IfwVZ5dTV96d for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 13:42:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org A3D33809C4
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789911744;
 b=e3TbhgDAUbfMnttHl4zwPk5qEUZgc26UcbGTBlCnPXp1+0Kdji4g10eUeGWV/MqqIgPk
 dxQ3HPQYRExPNSTK7Adox8oJMZLtIim1xYaQ137/dujmkQ5woDn7VWZmYq9nv2g4pY7nd
 6S67yMDuHHM/Fzh8N+V3Laz+YlEfS0ozMR8wgxU7MMxQLLc8QyphUlFMN25xN8X4U/KkQ
 xgfPLcienXTIovyCdbLzNkWyFvoXaKkEixz/lo1V7b9oBtrW/rCMFx9J4yB4Eo+SD0hdP
 46W7Dn4H5I/mfbnPWm9fU1eC9Gdv29CIyiDcLVKrtSZICapV6EfbaZJIejYKI9ef0pQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789911744;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=Kf4/7Svu3fPULLmn1EmbigwznRzGr7/iMr1cRrAtrt8=;
 b=sqiTcdeq5Z6ywOkKIvHvn1a6SAlf+EjJHs3myeCtwg2bbLCaGtaXR19PMO0d2TQ2N0il
 bISTzvdqOfo8eskiOfCDU1NznpHH4S2GgXRoyGYlPNbbpQlMSS1vAlHXUpIgES2+TyrLQ
 6cM2SIEB9ZMpiV6dIYDWxC371XTeoq5Mi4TuhxAqYAaHBLmQC3HncbNliFkAB1cu/R9Ht
 O8FqSrmcHGNvD6VCcBl310JiQovSlIyDbsf3PA005o3JlvJk4ebFWucc02ZDxinEo8CNb
 6L6K4mh23W3iXQOCllcbv3VsZ3BG6oxxVo6W0pPwVeU54oD0Hy7z1MGGeWEen7Narbw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=131dyD72; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A3D33809C4
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 13:42:23 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 237ED1A08D2;
 Sun, 20 Sep 2026 13:42:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id A1FC26033F;
 Sun, 20 Sep 2026 13:42:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 50F91103286A4; 
 Sun, 20 Sep 2026 15:42:19 +0200 (CEST)
Date: Sun, 20 Sep 2026 15:42:18 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Eric Le Bihan <eric.le.bihan.dev@free.fr>
Message-ID: <aq_itoHSkagoWI5S@windsurf>
References: <20260916085648.1131241-1-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260916085648.1131241-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1] package/jemalloc: Fix build with gcc
 16.x
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

On Wed, Sep 16, 2026 at 10:56:48AM +0200, Bernd Kuhls wrote:
> Fixes:
> https://autobuild.buildroot.net/results/6fb/6fbebb76cb0e6cafabad0890b8df226e9358a6c3/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks!

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
