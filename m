Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B1CDE784BE
	for <buildroot@archiver.kernel.org>; Sun, 28 Dec 2025 22:17:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D2B604038A;
	Sun, 28 Dec 2025 22:17:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RMC9hpUxm1zU; Sun, 28 Dec 2025 22:17:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AB1BF40382
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766960230;
	bh=uFQTMzpggbqnbJ/G0QMYObmiufAA220G0gP8DzsKz7Y=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=pcZFpoNDk13EBBuTR+PeDlErjnrr2Rqnh9ZqrkhfcNa976opZ0Erhjcz1IE8NR7ch
	 JIEuQTK/yMkYFHmWeBFbkpwjE5ld9fx2BtaY9TJXhpYe1rGKya1QzyTBtO9GUPh+an
	 RZlWxJKh65ESVCIsA1X2MYFqTJMLzIXd9h9yYKWxCgTafrxoK6oLaK6o4T0s6PplGA
	 9P8Qa1SfZb2XHwdJcOdTqZODiSfQ6q4NLBjjUKFUquJK83LbYecBUrCnuTCuwXtAqh
	 R1Ba12X56mJtRT0F1wI2S8snVSRSyIsqA26yFWId0DdxCjwGHbkMm5dbqr8RzRlEfr
	 sP/5vaKNEVO9g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AB1BF40382;
	Sun, 28 Dec 2025 22:17:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 829A3D8
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 22:17:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 74E4840382
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 22:17:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HpFeJafwQsv6 for <buildroot@buildroot.org>;
 Sun, 28 Dec 2025 22:17:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 879B04037C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 879B04037C
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 879B04037C
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 22:17:06 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 8A1ADC1D70C;
 Sun, 28 Dec 2025 22:16:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id E837D60725;
 Sun, 28 Dec 2025 22:17:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 84CDA11979262; Sun, 28 Dec 2025 23:16:58 +0100 (CET)
Date: Sun, 28 Dec 2025 23:16:57 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, Ludovic Desroches
 <ludovic.desroches@microchip.com>, Angelo Compagnucci
 <angelo.compagnucci@gmail.com>, Mauro Condarelli <mc5686@mclink.it>, James
 Hilliard <james.hilliard1@gmail.com>, Giulio Benetti
 <giulio.benetti@benettiengineering.com>, Fiona Klute <fiona.klute@gmx.de>
Message-ID: <20251228231657.2b00d585@windsurf>
In-Reply-To: <20251221223441.185169-1-bernd@kuhls.net>
References: <20251221223441.185169-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1766960223; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=f6boBmJiSAZX/V15H3plzAuoFxDY1nt4A0VvaNj59e0=;
 b=mAq/2kdeKetpQXc1DNW3jHtVO2cDjGoIvTkDhBy/AjU+FQyAfsrWtO3A3FwsntotX1ywvy
 3nVKI48OzJ4tLUUL/4FCR9E+s9bbhy0XeKjzPBVNRPgx86pZGJwoAqSQGLzI0nPjqCTQ5s
 8Ait/HbkHEBrGnssU4h9pJiemGpXV6hZSk46R1SWFKE9d+L2xbqZL4SPyV6lsejR2VqDd+
 EWAixRRRHh1IUNokFKHvg0uw0xp6koTM2ecYN9nr4FqgasSVbBQqJT9vM/yV9cXc9gpO2O
 lpLvinAeWQNPh8JpQG5pzS46omawOCeu0T8r5vy9ctZHwNttKfRjSuTK/XPC8A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=mAq/2kde
Subject: Re: [Buildroot] [PATCH v2 01/23] package/python-characteristic: add
 md5 hash, update SITE
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

On Sun, 21 Dec 2025 23:34:19 +0100
Bernd Kuhls <bernd@kuhls.net> wrote:

> Updated package as computed by scanpypi.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/python-characteristic/python-characteristic.hash | 4 ++--
>  package/python-characteristic/python-characteristic.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

Thanks, series applied!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
