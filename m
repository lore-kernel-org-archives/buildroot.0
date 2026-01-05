Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DBA9C79FA4
	for <buildroot@archiver.kernel.org>; Mon,  5 Jan 2026 16:06:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1706E40346;
	Mon,  5 Jan 2026 16:06:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sHYkJFnxqM3B; Mon,  5 Jan 2026 16:05:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 84346402AC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767629159;
	bh=xrx3Z7ZP08+wgzNrp4CiYmFvOs39cQq7ZsTqucOpt9Q=;
	h=Date:To:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=aLN+9NSDhPtLVacSenj8C18qw5Pdteh+HDw/O/gaEHe7mxdPOwEKWuQgUh7hcFp2R
	 8u5+m8XLQL+1AGIqt6bNeu7f07T32DJGldmEtsjACFB/2imeKHRule1lbBh/MaSHYn
	 +myIjsYekFYGBYeRe4Dt3SMRjssYgTF60unvFTvn0WFEFZNeRPjxLHdfUGW9cMseo9
	 rBHXTIpgecdf5mfdjbRgcdqOYAInR964xAjVmoLMrKVWn2Xi+fIUDQJJJgEb2TqjXR
	 M2dcnBL/zzaFpaW1HLLCcU0IKsfh1hVCP4IsUqotDsSzTSNXQcxNu4iKpbnqd/rB4/
	 xDrVYZXNnvYEA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 84346402AC;
	Mon,  5 Jan 2026 16:05:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8BE89249
 for <buildroot@buildroot.org>; Mon,  5 Jan 2026 16:05:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7CE8B40297
 for <buildroot@buildroot.org>; Mon,  5 Jan 2026 16:05:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Cop9VLOxwY4W for <buildroot@buildroot.org>;
 Mon,  5 Jan 2026 16:05:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B00CF40293
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B00CF40293
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B00CF40293
 for <buildroot@buildroot.org>; Mon,  5 Jan 2026 16:05:55 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id A3472C1E489;
 Mon,  5 Jan 2026 16:05:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 9319F60726;
 Mon,  5 Jan 2026 16:05:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id D7C64103C8567; Mon,  5 Jan 2026 17:05:48 +0100 (CET)
Date: Mon, 5 Jan 2026 17:05:47 +0100
To: Fiona Klute <fiona.klute@gmx.de>
Message-ID: <20260105170547.6f767364@windsurf>
In-Reply-To: <9bff7357-ef32-4d03-873e-7d052655158b@gmx.de>
References: <20260104143240.4126891-1-fiona.klute@gmx.de>
 <20260104143240.4126891-2-fiona.klute@gmx.de>
 <20260104174637.3421eaea@windsurf>
 <9bff7357-ef32-4d03-873e-7d052655158b@gmx.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767629152; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=7ntxmtYKmcUxiEtZYc4Hxw2jXxCdnLWMMEH93Gh4ugQ=;
 b=pjKuXkh0XpUdiCcPFs7ply/zx3CZe49UlJJc0L/8/8wjVnbM1xbBKWRA3RNznEowPoJKcI
 KjwhK03+2OpdaNQD4iSvU2tPbB81PUZMaiMv1bJi48Auf0UnKS0M2RnFqACw6p4XZzBnJC
 W77QkquYdNX70ftgHlpAHvOIjlXykAWTznrsK2tmeM99jjOd2tuxjghD+LSD2g1Chz7UTT
 1ZAT9LCBf+rJDup5KOCSnVq32FZgbAjIdHwUtcFAgtnGmGfcR+OyoeHm6jSEB3k+AHP0mR
 hy4+L4pnlOxosufjHroBkUSfP2/RVQEAXBooqHdwSies3FJQRiuzhv+EW4rAlg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=pjKuXkh0
Subject: Re: [Buildroot] [PATCH 2/2] package/python-memray: require
 toolchain with C++ support
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Julien Olivain <ju.o@free.fr>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Fiona,

On Mon, 5 Jan 2026 15:42:33 +0100
Fiona Klute <fiona.klute@gmx.de> wrote:

> I've just sent v2 of the series that should address both issues.

It does, thanks!

You can also just use the Fixes tag:

Fixes: 26bc4b51a808d73c09598035aa94f9c37b273218 ("package/python-rich: new package")

No need to resend just for that, that's merely a suggestion for future
commits.

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
