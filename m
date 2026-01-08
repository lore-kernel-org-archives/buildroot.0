Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 788EAD185CC
	for <buildroot@archiver.kernel.org>; Thu,  8 Jan 2026 11:05:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BE7E260DD8;
	Thu,  8 Jan 2026 11:05:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JSZBk40LweoU; Thu,  8 Jan 2026 11:05:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7EF3160A38
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767870336;
	bh=EOChIcIXEOeMdBDrDyAMTtoiURCyk7t6VXOwKmxprkw=;
	h=Date:To:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=Z28DaOGP3hONnE1H1PV4g9JuBw7kLftqBeoloyMzjdiUy4ZyGk8uveGbmtPyzKJbV
	 Iejo4hpTYHJOD9v1+VF3ZpUhogdXDs2ivR6Pmp9wjw5MivTBvlyToQFb3duXnJgQEi
	 rQWMkIORxc6DpkHmwlRhSgn/cK0slDc3DWOlhzUDeM4+q82zmPDzWt5qt8IPqa2Cky
	 oe7NnZ/fVT2SSVQUcLAGmBjJhBgb1FARBs9L/Ok1dTKexz8XGydN+eQMOzTFQYbT/u
	 Tr3qzGJXnnd1sSRTXvz/YgBRDknPXTAUZ1T7yYvOfQg+2zDephuHGoQyBnAHfquSS8
	 HvfTneRYkLFog==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7EF3160A38;
	Thu,  8 Jan 2026 11:05:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 202842C0
 for <buildroot@buildroot.org>; Thu,  8 Jan 2026 11:05:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1DCF98220B
 for <buildroot@buildroot.org>; Thu,  8 Jan 2026 11:05:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 53ggdWgnEP7M for <buildroot@buildroot.org>;
 Thu,  8 Jan 2026 11:05:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0B2CF8217B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0B2CF8217B
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0B2CF8217B
 for <buildroot@busybox.net>; Thu,  8 Jan 2026 11:05:33 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 649E04E41FF5;
 Thu,  8 Jan 2026 11:05:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 2F157606B6;
 Thu,  8 Jan 2026 11:05:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 46230103C85EB; Thu,  8 Jan 2026 12:05:31 +0100 (CET)
Date: Thu, 8 Jan 2026 12:05:30 +0100
To: Francois Perrad via buildroot <buildroot@buildroot.org>
Message-ID: <20260108120530.39641578@windsurf>
In-Reply-To: <20260106151125.335294-1-francois.perrad@gadz.org>
References: <20260106151125.335294-1-francois.perrad@gadz.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767870331; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=BdOdmTP/j2SXjkhCQoXxlbeuZ2XlyH7iElDufVrEdCg=;
 b=sEUQMRmw1E2LGdcfbpCqy0KCHN+Apv1hjWrNqUWrH8n4Sbr9YnbNOhM6IkcMeV/3/W1Z54
 HFB8YKgKowp0lzle8oeAjJQUZ1LQgVFsVwRDo7PqnDFeMtLL1seTXHafPWvYlhOMpO8kDR
 O/+Gbm/q6Qy3LyV1aWIVlyaXPqPFiL1vMvwdQ7flwyGNo94bArPcrKdVi6RT4otFSIUsHf
 cm3g9DXVHil3+40JNGS3ivvTX/juePBd3kEWDTL+Kx3EIZOeRQyq5pX9DYmtJg3uwCeGqv
 vNbQ0sgJUvzwKfvaLvhR694tRybK77rX/72MbTGwpwOG1ETreMD9sN7OX6/mYQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=sEUQMRmw
Subject: Re: [Buildroot] [PATCH] DEVELOPERS: Drop support for some packages
 from Francois Perrad
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue,  6 Jan 2026 16:11:25 +0100
Francois Perrad via buildroot <buildroot@buildroot.org> wrote:

> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  DEVELOPERS | 13 -------------
>  1 file changed, 13 deletions(-)

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
