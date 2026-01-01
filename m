Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2752FEEB57C
	for <buildroot@archiver.kernel.org>; Thu,  1 Jan 2026 16:12:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E64E7815C1;
	Thu,  1 Jan 2026 16:12:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wT_77-0txkve; Thu,  1 Jan 2026 16:12:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E5A8F80BA2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767283945;
	bh=KRS1gTRu/fgApxkYF/DDafNXzzzjz0CuriEHPdQyIZs=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=INAJj+INFqjMbiL1qhzLOXq7YXQPTfuyyLXt85y5YL9LhifM+nDyUXcGWrXsJQZEb
	 83lS0lvQ7kl33ZFI5pw7gpYELU/vQGRoVfl5ihNAnApM94ELyKwfSfYBy3gDf4ugTC
	 +IQJMwT9jYZkj/6GuoncUeHWGKA8IvH/zytjdZurp8R3qCTSWbT7g0zCzZo9K6Yiq5
	 ND085PCVR+/A8gV7F1flFbmFSFPwtgX/1aYcx12m75B705kuYWGAfHyCxmXoBTqzVt
	 G7aw4CLOXE/pbmSY4A6WpjgMHeFwRNZx/gAsOf+pBqbdc/0BHjrZztXcOf0CKtLoV+
	 ZUF8IEdm26zNg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E5A8F80BA2;
	Thu,  1 Jan 2026 16:12:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id AB84919D
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 16:12:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9D9D1400F9
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 16:12:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lG02_L42HjYr for <buildroot@buildroot.org>;
 Thu,  1 Jan 2026 16:12:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A9B5B40075
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A9B5B40075
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A9B5B40075
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 16:12:21 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 67CC2C1C39B;
 Thu,  1 Jan 2026 16:11:53 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 230F460749;
 Thu,  1 Jan 2026 16:12:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 1A7B2113B029E; Thu,  1 Jan 2026 17:12:17 +0100 (CET)
Date: Thu, 1 Jan 2026 17:12:16 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org, Romain Naour <romain.naour@gmail.com>
Message-ID: <20260101171216.4c560d17@windsurf>
In-Reply-To: <20251003225823.3871690-2-giulio.benetti@benettiengineering.com>
References: <20251003225823.3871690-1-giulio.benetti@benettiengineering.com>
 <20251003225823.3871690-2-giulio.benetti@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767283938; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=xbHycTYFtYp7y8bqjRITl04XcUrLJRRZtIIICwB6Ceg=;
 b=Wp2hjOG3ADXdKg8PSBDSi5g7MTYggMnpTigKqOQxXY4JugssmLxXBz00VgGgW7IhrF94j/
 VbSku71EzvOpxYmSwS1UCU9DcuS2UpRM4nr/QRTPRHffcByAHmhDL0TGVjuOdhfy0bzoFs
 I7ClapKdSYRRUK9fWpOF6g0DzrGhacQCL9/+bA63kQ6s/ifHbFdfV4WI/4GR6lN2aWE13n
 zqYLK+HB1LRRCw8hpLJJNOL1nSu/Er87pI6kvZoXwjgveDFlqVT+kfnXtyaXDcldd6sXhc
 fHn0N+mButh/K824arPx/kRHXepSJS8R99JrVqpc8S6YIKHMu02CW8OJ1qCuXQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=Wp2hjOG3
Subject: Re: [Buildroot] [PATCH 1/1] package/efl: bump to version 1.28.1
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

Hello Giulio,

Thanks for this work!

On Sat,  4 Oct 2025 00:58:23 +0200
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> Some important addition and several bug fixes for gcc-15. Some of those
> fixes are committed but not part of version 1.28.1 so they are added as
> local patches while dropping old patches except the tslib one.
> 
> See Release Notes of all versions:
> https://www.enlightenment.org/news/2025-03-17-efl-1.28.1
> https://www.enlightenment.org/news/2025-01-11-efl-1.28.0
> https://www.enlightenment.org/news/2023-12-23-efl-1.27.0
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to master, thanks!

You had forgotten two things:

- make check-package, which pointed issues in .checkpackageignore
- make legal-info, which pointed issues with license files

If you are brave and want to tackle upstreaming the patch 0001, it
would definitely be nice :-)

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
