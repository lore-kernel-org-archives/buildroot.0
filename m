Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CDAAE73156
	for <buildroot@archiver.kernel.org>; Mon,  2 Feb 2026 10:27:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E1964408BD;
	Mon,  2 Feb 2026 10:27:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9WDKkKiYGOE7; Mon,  2 Feb 2026 10:27:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 188A240872
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770028030;
	bh=ddDjfy7nP6bNkGlh4+xv3egVAMuEiGArsg7s/tNI2HY=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=jUrLsnK+g6S7wIK9ltZpzyVn5fO++Bmi+JgggRtnHY6Y1R5NqQdEEmrqYnvpjcFAS
	 3/oqv0FZc9ZjguYwkgKd8RaiwwSajsrPOUQ+YtI6Y10modvoRqPHEYTIVoA12R/qjq
	 6ZThVO6qdWOjHwEZ+9U/G4l9IcgeYmQoS+zbWLaKWgHRBhYF7taCzXGwPUuh7orWY5
	 ZCMCaQGMSHkBWWhQWZJrS1Y30STBcHZTYgkvLBQgFHr9F8Rn6DAG/Fih8rFFkx+fBy
	 BFY73cIdrRqqePFEykXZ/7fuxNpDlk4w/xkGNNS+KV/ICnmx3LWkmR6W+NpJ1RYIyt
	 C/Ge0Zf6lbxUA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 188A240872;
	Mon,  2 Feb 2026 10:27:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D0E56149
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 10:27:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B54D840265
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 10:27:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kMixuuckqZ1x for <buildroot@buildroot.org>;
 Mon,  2 Feb 2026 10:27:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C0F3E401FE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C0F3E401FE
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C0F3E401FE
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 10:27:07 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id D87071A2BC0;
 Mon,  2 Feb 2026 10:27:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id AD04C60767;
 Mon,  2 Feb 2026 10:27:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id E3955119A88EE; Mon,  2 Feb 2026 11:27:03 +0100 (CET)
Date: Mon, 2 Feb 2026 11:27:03 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org, Leon Anavi <leon.anavi@konsulko.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Fabrice Goucem <fabrice.goucem@oss.nxp.com>, 
 Jagan Teki <jagan@amarulasolutions.com>,
 Lothar Felten <lothar.felten@gmail.com>, 
 Fabio Estevam <festevam@gmail.com>
Message-ID: <aYB74a6lpvnadBDM@windsurf>
References: <20260114195554.3979278-1-giulio.benetti@benettiengineering.com>
 <20260114195554.3979278-5-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260114195554.3979278-5-giulio.benetti@benettiengineering.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1770028025; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=hKDR2h8UPUmvwyOfOUYrlymxp4aR5jjNSEI+iAcypMU=;
 b=tEBUv2V74f4KztoUX3CtLljmLfFhTAPML7efnSeLOnoWT0+CvGPAXcU0kelevKsS0qPgvN
 zN0DuxIPRMWA6HKDv7pjufjqMolk4kYRlMh+81rAOQ2iKHMGNXz09vYXVXcGPkn+848mL+
 pAUG9x3JNCcoQKa4s+r6HmcLY0FenjS9oMH2I6hmPdzQIvyoNu+vtLgAXmHl7hNeaf3JnO
 LIxR9d+36NMX1rcrRpTDw9wuUZUeiZeiBvkiQ1H7GCEpUEiub5YCqhbFxzN7OPiI0QH1zu
 DsG//l0FxQgkixu7IiLcJEZ032j8T2by/VMovKymHSBgiOVpo/NM8IcFA7Obxg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=tEBUv2V7
Subject: Re: [Buildroot] [PATCH 17/17] configs/olimex_a64_olinuxino: bump
 Linux to 6.18.5 and U-Boot to 2026.01
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

On Wed, Jan 14, 2026 at 08:55:53PM +0100, Giulio Benetti wrote:
> The patch:
> * bumps Linux kernel to version 6.18.5
> * bumps U-Boot to version 2026.01
> * bumps ATF to version 2.14.0
> * forces check hashes
> * switches to extlinux

Causes:

WARNING: configs/olimex_a64_olinuxino_defconfig:0: lib_defconfig.ForceCheckHash was expected to fail, did you fix the file and forget to update .checkpackageignore?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
