Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1260ECA0FF0
	for <buildroot@archiver.kernel.org>; Fri, 29 Aug 2025 21:59:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BDF2A83103;
	Fri, 29 Aug 2025 21:59:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mVTYDa9LhfBn; Fri, 29 Aug 2025 21:59:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CBFCF82437
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CBFCF82437;
	Fri, 29 Aug 2025 21:59:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 03432D2
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 21:59:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E85D541CAE
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 21:59:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IjThLx5rehPv for <buildroot@buildroot.org>;
 Fri, 29 Aug 2025 21:59:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2CC6A41A4F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2CC6A41A4F
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2CC6A41A4F
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 21:59:47 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id D65154E40B04;
 Fri, 29 Aug 2025 21:59:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id B13E0605F1;
 Fri, 29 Aug 2025 21:59:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id B414A1C228AF3; 
 Fri, 29 Aug 2025 23:59:44 +0200 (CEST)
Date: Fri, 29 Aug 2025 23:59:43 +0200
To: Thomas Perale via buildroot <buildroot@buildroot.org>
Cc: Thomas Perale <thomas.perale@mind.be>
Message-ID: <20250829235943.11bb6d76@windsurf>
In-Reply-To: <20250829235511.1fd98d89@windsurf>
References: <20250709211636.846101-1-thomas.petazzoni@bootlin.com>
 <20250710081059.482390-1-thomas.perale@mind.be>
 <20250829235511.1fd98d89@windsurf>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1756504785; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=lJ9xA/aVWrptH4alrjhx9dF3J2b0TRHuSrwL6cmmg7w=;
 b=Qk5mVXZilI1lNP1lNZYtQVGPwjBw1zP50lnKXEbaQSw/5skHmV/mUJjHWw8Kr8bJVzw6+S
 /hCcfLG8fT3XcwKtzNggaUaiv1p18O2rogKc5hGTJDRXSWpXp6Nr0wxGG1NbAzV3RNvQrg
 rsZdo5+rUM2z1hP280lkJR7mkBxiWLc/1qsCIMO7o8K/z0I3QtaNqkfm3hpOMRXLHC5xTx
 uQTN33nit63ocDv+lWtp0RdCoP6Cr1P+nN0NSG0VhcKP4Yy5LkW5poZ0koeMbTqSDmeOhu
 8Uk+UmjlHs2ouPiOJp64/XeDzTbsjEEFlLCsordKw9CslG/UYKLATB+gSQwegg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=Qk5mVXZi
Subject: Re: [Buildroot] [PATCH] package/bctoolbox: disable mbedtls support
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

On Fri, 29 Aug 2025 23:55:11 +0200
Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> Nobody stepped up to fix this issue, so I suggest that we apply my
> patch disabling MbedTLS support in bctoolbox for the time being. If
> someone, one day, needs MbedTLS support in bctoolbox, that someone can
> always fix it up.

One gotcha though is that crypto support in bctoolbox is needed for
belle-sip, which in turn is needed for linphone.

But oh well, if nobody maintains this stuff, we could also just drop
it. None of bctoolbox, linphone or belle-sip have a maintainer
according to our DEVELOPERS file.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
