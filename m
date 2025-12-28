Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9887E784BE
	for <buildroot@archiver.kernel.org>; Sun, 28 Dec 2025 21:58:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8D08140669;
	Sun, 28 Dec 2025 21:58:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q8X4YVr8hY68; Sun, 28 Dec 2025 21:58:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C2E6640540
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766959090;
	bh=fakeKkEGBWMUPoAd2Fpv+D3p3u2MXKzpg5RN6ys3S3o=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=cFu3I8NMuBigK6199Y5p7rEoQkIIvYVPwTqPA1/BTZtEfLD0WmziLcUbLFwD0fngQ
	 IePm24OvmFljQFi8iEUai+ZHylkAOW2FrnpTtbOiMDRUvL8zZFxZbjJ71YTkGcSOMn
	 dF/pzb7QtZz3u/aMpkGZtAWYQopGbrAsjgQim+oiPYjemOqNIKub5ct8jimVRv/gJt
	 S/LEmpY8WHQARXnJgHpILBkg6xpYceSYlpQtKMDhzmKEI4ycTg9XIV4OeiaN+W/Cmh
	 uavFFrkvdpBAp3yehqmTvn/we1ma7heSD829gnmiguAg2l5lXOBPRq56bYFff7/ols
	 UYMPiBTkluGSA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C2E6640540;
	Sun, 28 Dec 2025 21:58:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9F3CED8
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 21:58:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 90C5140055
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 21:58:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 21HjvvFPWt1e for <buildroot@buildroot.org>;
 Sun, 28 Dec 2025 21:58:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8542F40024
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8542F40024
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8542F40024
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 21:58:07 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id AE87AC1D70C
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 21:57:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 22E2D60725;
 Sun, 28 Dec 2025 21:58:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id BA9D611979327; Sun, 28 Dec 2025 22:58:02 +0100 (CET)
Date: Sun, 28 Dec 2025 22:58:01 +0100
To: Julien Olivain via buildroot <buildroot@buildroot.org>
Cc: Julien Olivain <ju.o@free.fr>, Sergio Prado <sergio.prado@e-labworks.com>
Message-ID: <20251228225801.2a9182f6@windsurf>
In-Reply-To: <20251221115708.256386-1-ju.o@free.fr>
References: <20251221115708.256386-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1766959083; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=Fo/OtFf7gfwAWleCnPkXeJ32xTTpdpNX8zhPna86viA=;
 b=Y+xxDZ7aWO6r33fWUu3z5ANikBOrYNiFQETEmGu6912P23L6/56issTEkEf/gJ/EjLpMvo
 KYNqLxAW/AxwxBQGOUhqD3SbYFIEeZRnFIAapTYceGstPllE8JkhEpZf/rFa57nziLYDOB
 RliH4WZAmYnAYEw2XyFbUleUfOl78MJkxmGAVl2k0CFnB3kN37D4BYgWfophkNXDTT9yGP
 kgcrlYYS9r8rP4XVf9sHjvcW/EYiVnDKbnQb5mneyfkjkB0Awe6T2wa3gjbmC+0TOl7iby
 QWXyIZDscMIxGFFWqSR1xkFJh3xOEXjkjNIioJauOFErPaAJa5Ckjjxwj7CHqg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=Y+xxDZ7a
Subject: Re: [Buildroot] [PATCH 1/3] package/tio: Config.in: add missing
 selection of libglib2
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

Hello,

On Sun, 21 Dec 2025 12:57:06 +0100
Julien Olivain via buildroot <buildroot@buildroot.org> wrote:

> Buildroot commit [1] (package/tio: bump to 3.5) added the libglib2 in
> the .mk file without selecting it in Config.in.
> 
> This commit fixes that.
> 
> [1] https://gitlab.com/buildroot.org/buildroot/-/commit/3d85e9df431af790930e03d860bfa098108888a0
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

Thanks a lot, series applied!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
