Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9F9ACA5FA1
	for <buildroot@archiver.kernel.org>; Mon, 28 Sep 2026 21:25:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A317D6064A;
	Mon, 28 Sep 2026 21:25:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YteDGOHGYCbK; Mon, 28 Sep 2026 21:25:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org B97B460625
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790630727;
	b=icS/1PHlJsOV+2+TxvYN0+M9a3AvP5rw+sAtgU2pARSDWkiIKs4lD0ixz4cAMdYokP73
	 k/W5jgnMb98Pgytp+qH6Fy33J9kuYJzlScy4Chj2jPZTfr0XvjJVhU+Ha8w4r5ensY3NL
	 3WFLixkivzsr/pCcoS6wW90acIwVH1vwOmH4ttgB0SGoGFAaVsaVhtW0G3Mmdiu67EF1V
	 dgkEML5ZUbNGVaSfDvK0gIKUJPyRKgf/e/3Pa6lg7eJD7LvCET/KBhREXYaGl+ts4bKmA
	 0Bvb/l/n4j5c/lq1n4ydvhmNJIKPmVR+gSIfdwCGNvLcJ/77saYfzo15fCprtpsogAg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790630727;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=9aEcoKKN2ZMhoKHsVNdwmKTsrJzsFCheNizXCeh/TLg=;
	b=Jmn46MzVV6iOszeUj0f9OLOBKMpW+XvC4d3cLdQ3Aq3lA2KbFfNL6yYzojxnGLNo2OzC
	 csp8b0udCABh3llO7USIyWBOJySo5O2bbyTrf3TSR0Y1oW3zgOsjMvcLrplODW8GL1Rgy
	 +Rdu9T2om9l5QDCOG66bbBB7gLbcQLITr9EpG4BGtCVpt5J8bzQMc6DUJM+UcCWHtJfZI
	 l6vst9ozOAKxe2jmx5jxYn+qCetObhnyPGsPQzHR8YcvXSczZw3HIU2lyieiiIi+ZgYz+
	 w78Pch9maCLbK1TBuE28o0ZfsJzRCnvBQimv7q0JyO2VfJt8AOehiETuo8WAJhYS5bA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790630727;
	bh=9aEcoKKN2ZMhoKHsVNdwmKTsrJzsFCheNizXCeh/TLg=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=KjzHUvwOAIE/LE70i9T+cNXcKqfNsRo4nujL0Uxy0vUaP70/caR4dE0KZeh8Ju+do
	 AJkzdGBIpv1a7BkdUT6W5qyQO4+P/SRBz6yedvWZhYLmZk7RnAhjz+0pD8F7UY2M36
	 B8N+TSYfl946F4u5EG+HAonEjTr+QwezAtpo7bSa14eC3T5FmzeoxtSALgCt3+07FO
	 Y7/eWjvNAI3ptkBKSZsApsIjhrBBXjAb1kWcw9Go8tu6AH1QJZwILLcSc9vWqslG3m
	 C2ETJsu50CXixGqvE0E1rgtLcaeQV+WOpe10QdeEjotR0qfZY5cGaKntB+iV9ECOsP
	 90eRW2aAjNskQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B97B460625;
	Mon, 28 Sep 2026 21:25:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 49A0472
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 21:25:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2F5484018B
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 21:25:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Mw1pENvT_1lI for <buildroot@buildroot.org>;
 Mon, 28 Sep 2026 21:25:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 4B5CB4008A
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790630726;
 b=YoIIB4HTntlc1V+RYjWa0Dmn+A+g6FcYNk1ouID0+P2g+WsESUkfAQAA96CscOXUkTW4
 CnEYC8NQujkdFe6YNTDRiPgafeX7OdwkiYzifLtij6DYKLZxBRlhzjH1foqK+/ZSgXC2s
 Ejn9nOgL/STtlGRgUyivvVdBX3SobtilIxvdU9vVVOEuJQpUjXQOGnMurRBcpj1AK7Nn+
 0c+jMBraTDMqiniDDEB+EhWwUTiMidRVhx1Bk/E9i0HXVyG8/Y88XvWjOt17ejCVfuK2Y
 pcjgYXjCO7dv2lFsYyPVmUy8O+aBBVHI4VeUQf0H7eF8hW36THJcebQIkmlLb41A/kg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790630726;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=T6bEAZvFpdmX1DB6w8r1NkCXf0TD5zTaomXM54sX31w=;
 b=JMhLwJLWmLF+2cDFjq70gAJd3AhPz2ptAAlg5JNzoqgnUDgiTHl8u6yDAbv2M0m5LwhQ
 IuXOD9AFXSCb/Gug3NB6dORIDKD3CNC7nSwYj199Dt/H4JbMRPQsiHnPdbdePwGl5cnpX
 23aFJq6RWzSwirKh+t0TrCU+zM2gkKu+UUCSh5J+qAW0t0e6f2MWzOSIQvL434pDaNzzZ
 k/Rw9emqfwHURCapdI+NRF1a00H787rHtaZeuoyKl4CSO+qMOOpBFDh+3Ff7QsdX39mzT
 uYCinkYO4WO+QlFZkGfvSyOTHx83TFNY04ir7a8WAx5PcU7+S2xVJ1RxH+uSwHLNsxQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=TLNx3OxF; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4B5CB4008A
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 21:25:25 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id B1FC94E410A4;
 Mon, 28 Sep 2026 21:25:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 7D2AF601BD;
 Mon, 28 Sep 2026 21:25:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A08F810329728; 
 Mon, 28 Sep 2026 23:25:18 +0200 (CEST)
Date: Mon, 28 Sep 2026 23:25:18 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org
Message-ID: <arra1W7uAMA7ZlSM@windsurf>
References: <20260928161824.3463035-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260928161824.3463035-1-dario.binacchi@amarulasolutions.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1] package/ufs-utils: bump to version
 8.14.12
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

On Mon, Sep 28, 2026 at 06:18:24PM +0200, Dario Binacchi wrote:
> Release notes:
> https://github.com/SanDisk-Open-Source/ufs-utils/releases/tag/v8.14.12
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

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
