Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8044E73151
	for <buildroot@archiver.kernel.org>; Mon,  2 Feb 2026 10:17:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AF78840A47;
	Mon,  2 Feb 2026 10:17:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ELPz_ValLmSC; Mon,  2 Feb 2026 10:17:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1F38940A0F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770027465;
	bh=FhjngxaKNUpRuDTcaQuLpdoDTUVTsdbK/fRcTXbbkak=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=aA3tfm1GfwuB8nEnjb18iAand3Ood9U+aRT5EdRSBh7nCFbTPoVeN1rh0MykFWwFk
	 PuT00VPh1cLvQ8l6ThpzSEl+hqV6EMmA3cDbcWD5qbmx8e3yaL6daYW5Nzg4lA7Kal
	 U3HiswAx4Ewxpk0Pt94v74A2fYlS1WO6aUoYuretLBqL4ZKJCTQdKCgfAS8fSMdEjG
	 X1io4ZAcHLoQkYSejieK2rMTm4sahTNICxyw42pyGrWm3cKQjTVor4MtUzHbqS2J8c
	 hLEwHvtKl56YZXgjo6KfSpIMpDvoT6hrMEeVN2stOWqjRqu+/tmO0wZYJraSdLhKRm
	 U3Kn71Cx8W6BQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1F38940A0F;
	Mon,  2 Feb 2026 10:17:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A58C4149
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 10:17:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8966182FBE
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 10:17:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Low2to8JL9Zp for <buildroot@buildroot.org>;
 Mon,  2 Feb 2026 10:17:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A487082F98
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A487082F98
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A487082F98
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 10:17:42 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id B74BDC237FE;
 Mon,  2 Feb 2026 10:17:44 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 0613B60767;
 Mon,  2 Feb 2026 10:17:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id BB401119A8888; Mon,  2 Feb 2026 11:17:38 +0100 (CET)
Date: Mon, 2 Feb 2026 11:17:38 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org, Leon Anavi <leon.anavi@konsulko.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Fabrice Goucem <fabrice.goucem@oss.nxp.com>, 
 Jagan Teki <jagan@amarulasolutions.com>,
 Lothar Felten <lothar.felten@gmail.com>, 
 Fabio Estevam <festevam@gmail.com>
Message-ID: <aYB5rLtKopBeb8_4@windsurf>
References: <20260114195451.3978704-1-giulio.benetti@benettiengineering.com>
 <20260114195451.3978704-7-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260114195451.3978704-7-giulio.benetti@benettiengineering.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1770027459; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=Kr7d6jzSLwTENpGhDSZzipikvdujYeOgfcpBPmZ2Rec=;
 b=eIU7qA3C/E8uoaFKGComk5lcvxiRRw2Xr47FZ4jSMvL6z/WpbEqLd0URcYo73GqbLqJgUY
 Yde7ArrdXWNQMPWzNYkgi/8lLD+2clg5IvDGmlp/9zChAtLSmn3JwF48gXga7XNnCpFlfw
 JsPXS82FMqkn/bWpTbjiBq32yKPg6eVztMN/TnKRGNYkMv9B4aIlHN+2NiLStAOE/ZEKBp
 z7DqPOyPwp6bwpDyoMcjWA72UXlPYXUGqm0TKD4JSQJecCfpYs9b5sir9qjnMUb0fHqqke
 pjQocGYJipkryTDOr877Qm5tE0iwtVa/py0CR8Sq2qOkNp5ha1jrO9DIcAGyMA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=eIU7qA3C
Subject: Re: [Buildroot] [PATCH 06/17] configs/freescale_imx6ullevk: bump
 Linux and U-Boot to lf-6.12.49-2.2.0
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

On Wed, Jan 14, 2026 at 08:54:39PM +0100, Giulio Benetti wrote:
> The patch:
> * bumps Linux kernel to version lf-6.12.49-2.2.0
> * bumps U-Boot to version lf-6.12.49-2.2.0
> * forces check hashes
> * switches to extlinux

This is not changing force check hashes, nor extlinux, as far as I can
see.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
