Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93E8EC3DA41
	for <buildroot@archiver.kernel.org>; Thu, 11 Jul 2024 07:59:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 45A9E41705;
	Thu, 11 Jul 2024 07:59:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pavuHK_JrwuE; Thu, 11 Jul 2024 07:59:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 121FC41706
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 121FC41706;
	Thu, 11 Jul 2024 07:59:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 491271BF232
 for <buildroot@lists.busybox.net>; Thu, 11 Jul 2024 07:59:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 34AAA80F76
 for <buildroot@lists.busybox.net>; Thu, 11 Jul 2024 07:59:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b3Jp7KwS4yvo for <buildroot@lists.busybox.net>;
 Thu, 11 Jul 2024 07:59:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E439C80F72
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E439C80F72
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E439C80F72
 for <buildroot@buildroot.org>; Thu, 11 Jul 2024 07:59:18 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 12C0D2000D;
 Thu, 11 Jul 2024 07:59:15 +0000 (UTC)
Date: Thu, 11 Jul 2024 09:59:15 +0200
To: Viacheslav <adeep@lexina.in>
Message-ID: <20240711095915.6e0c9473@windsurf>
In-Reply-To: <fcdc3e33-99c6-488c-9231-4169b9201ce1@lexina.in>
References: <20240619075547.1390096-1-adeep@lexina.in>
 <20240711001637.4fe27e3d@windsurf>
 <fcdc3e33-99c6-488c-9231-4169b9201ce1@lexina.in>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720684756;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CJilVEy8ajuwK18bGIXtbYqVY7eviJO/uR31a+3cyVY=;
 b=Q4ImUs1myfFPxVnEFp+XwRfwJ0wUsmTjphFmmizlwb7oc0teKZMAaNCmnamRySdk7FGNyf
 JOfn/lJ1SKy7TQWQaFWSPDu1zp1cb4wTtn5IYAvkedNo89Q7CtdZCGPVq3EDrNvALDptIv
 aw2uZi+OVD/dL6XyTo4fXUhk2RKMIIdPc42gqUaMX8hpPcRjAGyqzthEXzrhuq/DE30SnE
 zVMhuaQBephOyb/C7p0EPLVkHqz1Uu8RjvdzU27fPURpheyiMyrupGs2WOROv5RUNJsvKS
 Rdk4tggVQeu8+IybqQ5sBBj6h7ByigrNOB9bjkURxJNjgqoo2w2g2O4Vrb4j/g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Q4ImUs1m
Subject: Re: [Buildroot] [PATCH v1] package/rtl8822cs bump driver version to
 latest
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Thu, 11 Jul 2024 08:56:42 +0300
Viacheslav <adeep@lexina.in> wrote:

> > One question: https://github.com/jethome-ru/rtl88x2cs says "** USE
> > RTW88 NOT THIS DRIVER **", so why are we using it? It seems like you
> > are the person maintaining this driver.  
> 
> RTW88 in-kernel driver has some problems at this moment: no working AP 
> mode, wifi connection fails after 2-3 days, speed issues.
> 
> The comment appeared when JetHub devices switched to the rtw88 driver. 
> After we switched back to rtl88x2cs, I decided to keep the comment as 
> motivation for development and to identify issues in rtw88.
> However, in production, we and some other boards use the rtl88x2cs 
> driver and we maintain it as necessary.
> 
> Since this question has been asked more than once, I decided to modify 
> the description a bit. Now that alarming message will no longer be there)

Thanks for the clarification!

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
