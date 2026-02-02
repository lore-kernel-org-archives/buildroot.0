Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAA37E73153
	for <buildroot@archiver.kernel.org>; Mon,  2 Feb 2026 10:25:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8756840A64;
	Mon,  2 Feb 2026 10:25:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6-nAemOvpMts; Mon,  2 Feb 2026 10:25:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B8A1640A16
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770027953;
	bh=2m+y1ggOnejzEt51mlcOdep00upUbZuIVZXwdojcDFQ=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=T4Z4gomgnuP1vTzVsXdqJJOQNgbIGfu/LsLNeTvMHmI4NMrXgzlAAPq/uvY4TpZRy
	 uYrOKqJdQfqS+uA9bTm45euHjBqTNAV7SkUAunzrX8iVMKIokmSd/WAgX/+cdZwcib
	 LElNpj6WmtEnlT0MwYQtGNGVLl7C9j6Whavi/jDRiNNSE5GjdElH8fOaTMZ9T4++XD
	 ycidTyZeotVb+Kqwkay0FhFzKmCKyJu4fXE/Sw1xXx3QEnvm0AYoRcOkVWYiocgv16
	 kUiVZUibTcXGUFkU1Fhp0F7AieuvF00hk2Y4dLdeNx0vJmusJIaDd57xRZpIo/uFBP
	 EcLhZenGzkueA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B8A1640A16;
	Mon,  2 Feb 2026 10:25:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id BBD561E0
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 10:25:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AA1F840266
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 10:25:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UyKS8BfAPboB for <buildroot@buildroot.org>;
 Mon,  2 Feb 2026 10:25:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9242D401FE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9242D401FE
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9242D401FE
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 10:25:51 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id E8C694E423C2;
 Mon,  2 Feb 2026 10:25:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id BDA6D60767;
 Mon,  2 Feb 2026 10:25:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 52CC8119A8888; Mon,  2 Feb 2026 11:25:48 +0100 (CET)
Date: Mon, 2 Feb 2026 11:25:47 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org, Leon Anavi <leon.anavi@konsulko.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Fabrice Goucem <fabrice.goucem@oss.nxp.com>, 
 Jagan Teki <jagan@amarulasolutions.com>,
 Lothar Felten <lothar.felten@gmail.com>, 
 Fabio Estevam <festevam@gmail.com>
Message-ID: <aYB7mKdhzy3ZO1ke@windsurf>
References: <20260114195554.3979278-1-giulio.benetti@benettiengineering.com>
 <20260114195554.3979278-3-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260114195554.3979278-3-giulio.benetti@benettiengineering.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1770027949; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=5UnHPrfdd6L1R2kCkoFZedxQP/MQwLV8LvK5YRS1rUw=;
 b=yu7ed7WtRiaGJWaEAwYthQJq2GwmOAsY9bfiU3s2pFzZ/Bq7+Kh8M4XI1vEWpExlHdN7I5
 S4PFzacD8p8HPw/OoMHDA/FII7R4eIZRTZ/Mdnpo2OUSck4RPVyYrha5xbh+5NdWHOji+g
 rAs7UHQpYHXjCasFDXMhIAr3FBgOroQ4qL42PBvK1CeJngMduyO+P4T/NARAnZ1E4+iyA7
 ylaA5kUUDBqxHnb1LCj7EB7ZjHr3BJA6YLr6rm3ZXR/lcZZr9zoSSYNt45pjbsYulzb8/v
 Nxvk2Nsr2q2fBSAAqcW1sdsYL0QWcrsSkq9i4PhaRSp+3QYvd3NDCBycerHe7g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=yu7ed7Wt
Subject: Re: [Buildroot] [PATCH 15/17] configs/olimex_a20_olinuxino_micro:
 bump Linux to 6.18.5 and U-Boot to 2026.01
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

On Wed, Jan 14, 2026 at 08:55:51PM +0100, Giulio Benetti wrote:
> The patch:
> * bumps Linux kernel to version 6.18.5
> * bumps U-Boot to version 2026.01
> * forces check hashes
> * switches to extlinux
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Causes:

WARNING: configs/olimex_a20_olinuxino_micro_defconfig:0: lib_defconfig.ForceCheckHash was expected to fail, did you fix the file and forget to update .checkpackageignore?
WARNING: .checkpackageignore:35: ignored file board/olimex/a13_olinuxino/post-build.sh is missing
WARNING: .checkpackageignore:36: ignored file board/olimex/a20_olinuxino/post-build.sh is missing

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
