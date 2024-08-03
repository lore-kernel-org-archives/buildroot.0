Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 423AAC52D6F
	for <buildroot@archiver.kernel.org>; Sat,  3 Aug 2024 20:31:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1291180C5C;
	Sat,  3 Aug 2024 20:31:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FuvNcV-9eNtf; Sat,  3 Aug 2024 20:31:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3969180D10
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3969180D10;
	Sat,  3 Aug 2024 20:31:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 13ABA1BF947
 for <buildroot@lists.busybox.net>; Sat,  3 Aug 2024 20:31:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0CEEC80C5C
 for <buildroot@lists.busybox.net>; Sat,  3 Aug 2024 20:31:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dBPu8nIBjzIm for <buildroot@lists.busybox.net>;
 Sat,  3 Aug 2024 20:31:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org F2CCD80D10
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F2CCD80D10
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F2CCD80D10
 for <buildroot@buildroot.org>; Sat,  3 Aug 2024 20:31:04 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7543D240007;
 Sat,  3 Aug 2024 20:31:01 +0000 (UTC)
Date: Sat, 3 Aug 2024 22:31:00 +0200
To: Fabio Estevam <festevam@gmail.com>
Message-ID: <20240803223100.0e443f93@windsurf>
In-Reply-To: <CAOMZO5DBp21mF9+X1iYq-PJf7RJvJ=wFGKLsr2vT3vzNPCfZ7w@mail.gmail.com>
References: <20240803111855.1726141-1-ju.o@free.fr>
 <CAOMZO5DBp21mF9+X1iYq-PJf7RJvJ=wFGKLsr2vT3vzNPCfZ7w@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1722717061;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IVduzkI+t+1ipWRGEwr8oxGwAAc2hQnaw2lW8UTMokU=;
 b=jZUEqcq19FWsyHFmweRDs4gUV4Kf/03EFrERzaCppbZ6XeuZp1dfcwGIOjCwq+wsrj7f8+
 Pd3vyLWXHs89k4yNzl95OeHHiJrmT8zl5JSF0ddHvfheqKCmALl1dm5Lh1SUYWThvMuZUa
 rnKql+W0hkPIlBT9eDxvHw1KAP/ykDWCq/pUvyr7SHqZ3EnzICPzI6SydLRcrhkvmx9itw
 K+xx5skRPd37BqP/FETQ67MuAywS9D8USDbgwEEMPws/5wkvuLe0lSstfn3IWyXnP5r5ZE
 Ewot3QEsGFYKulmt9nSuMoAaNj5oDbXkuEUpwXIc2vJp5vglALY+NORJgEOpLQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=jZUEqcq1
Subject: Re: [Buildroot] [PATCH 1/1] configs/freescale_imx6ullevk: bump BSP
 components to lf-6.6.23-2.0.0
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
Cc: Julien Olivain <ju.o@free.fr>, Fabrice Goucem <fabrice.goucem@oss.nxp.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 3 Aug 2024 13:38:32 -0300
Fabio Estevam <festevam@gmail.com> wrote:

> > Bump ATF, U-Boot and Linux kernel to the NXP BSP lf-6.6.23-2.0.0
> > versions.  
> 
> Nit: the imx6ul SoC does not use ATF.

Indeed, thanks for noticing. I fixed that up when applying the patch.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
