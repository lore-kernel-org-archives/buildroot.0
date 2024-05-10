Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1950AC25B10
	for <buildroot@archiver.kernel.org>; Fri, 10 May 2024 12:02:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C632E42A7E;
	Fri, 10 May 2024 12:02:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bYSwcePpkBKK; Fri, 10 May 2024 12:02:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 88E6D42AA3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 88E6D42AA3;
	Fri, 10 May 2024 12:02:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3BF111BF995
 for <buildroot@lists.busybox.net>; Fri, 10 May 2024 12:02:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2889B84599
 for <buildroot@lists.busybox.net>; Fri, 10 May 2024 12:02:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mMK4V8a9qhSj for <buildroot@lists.busybox.net>;
 Fri, 10 May 2024 12:02:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 66ED9845C8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 66ED9845C8
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 66ED9845C8
 for <buildroot@buildroot.org>; Fri, 10 May 2024 12:02:08 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A5771FF802;
 Fri, 10 May 2024 12:02:06 +0000 (UTC)
Date: Fri, 10 May 2024 14:02:05 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20240510140205.2df335fb@windsurf>
In-Reply-To: <20240324174523.1770994-1-bernd@kuhls.net>
References: <20240324174523.1770994-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715342526;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FzkRnPcw04eGuwgu6GPazbWAEbBrT6OYIUnbxHGaNcs=;
 b=dCFgUx4tRziq+bV8AfjcqFrslO+P7tWiAnlOu/rzjaWTsnPz8sT2076S0I4iNeRIGdOfko
 omnT0vLryk2/6udFPqIpVVOCmR+Dl5uWI8Hfl8wD0TjtNphNDJ7xxthdHPivAtRtHREK1M
 7Hw3zDqyIWdyeLRwfB5Mm7uqHMQomUWEBO8GCRpt7V01BaAluWs/W0ztSEj9J2ADZE06FZ
 0iUMx0CmBPYA6juESz786gSibPu/NR6VzlJdVMbgKQ2YPlbYX23CtbLWqqnuND3zoEBOeh
 FLv7hdcWzJNdsiH7q9lNDE93znUyFQwR3TZtnQ/3qHxduCiF/LR6epQRcFxQGA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=dCFgUx4t
Subject: Re: [Buildroot] [PATCH 1/1] package/libdrm: fix install of test
 programs
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 24 Mar 2024 18:45:23 +0100
Bernd Kuhls <bernd@kuhls.net> wrote:

> Buildroot commit f95069814bd68cfc10ccf2dbc41efa6f1e127495 disabled the
> build of test programs unconditionally without considering the option
> BR2_PACKAGE_LIBDRM_INSTALL_TESTS.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/libdrm/libdrm.mk | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
