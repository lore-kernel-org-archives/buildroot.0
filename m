Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73FF5EEEC1C
	for <buildroot@archiver.kernel.org>; Thu,  1 Jan 2026 22:32:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 43E9060790;
	Thu,  1 Jan 2026 22:32:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KVNHMr6IGQ9m; Thu,  1 Jan 2026 22:32:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7038060762
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767306745;
	bh=64+/kbAYiMi0jqms/b5ED7Bjo62mQNbNh06HfSWpyig=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=J7CtNIUUF6ut7rGlWxs9H60pZM3hapBurEijGcfk2BJMh2H65hcxEEaJL1UUmMYOi
	 9JnpKWlznCs1QNrLgpL+oARFhfGFpS61nFT1miAfOy9xp14VV05osUDXklJfuyejxd
	 f0Ur7TNWrIeAuu6K3P5sxlWCIkpT12WQv07b+iDYGVSTRYK5pG3nXqy3TAsrufs7aX
	 epO0aF5lQWHnfI5jJpHky/cHNVszOGnBxvotk+mtN0AgMVkUbfseZ8jD7yv/Dx5d+j
	 FnoucLbW+kHTFovynHKuCvzeC5oFK3V0fqUZ14YYMPNn6HmvX1teS+P4Z49/rl2biO
	 c6xibAPYqOJdg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7038060762;
	Thu,  1 Jan 2026 22:32:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id C6C07206
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 22:32:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B8C1580DB2
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 22:32:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kmNH2I6hsfoy for <buildroot@buildroot.org>;
 Thu,  1 Jan 2026 22:32:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D954B80CF8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D954B80CF8
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D954B80CF8
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 22:32:22 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 0EC814E41EE5;
 Thu,  1 Jan 2026 22:32:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id C392C60749;
 Thu,  1 Jan 2026 22:32:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 5E3CB113B0717; Thu,  1 Jan 2026 23:32:19 +0100 (CET)
Date: Thu, 1 Jan 2026 23:32:18 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Angelo Compagnucci <angelo.compagnucci@gmail.com>
Message-ID: <20260101233218.0c991340@windsurf>
In-Reply-To: <20260101180045.247057-1-bernd@kuhls.net>
References: <20260101180045.247057-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767306740; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=vnuUWHA1PKiQ+7cvg3iBXFFYKZ92rBTICqhk3OrA5pk=;
 b=QA0G+dvQ1otaP4uT0+iiMcau85mjrtU5d+4BIhYT/Bo5n4CiGIIkql7YdDyHzWcvwKSaid
 WCTBjjDdVYGg2++wQjJmXhBgwfFKx/9KqYH74oDBeksZal5850ces9OGaGdyZDq2UfYN78
 VGLcERIm3+X+qD23rEchVOO4vOsdro9jEZZOS/xXAWkaMcBHhPPyWwMmyZQfUxZIPy1Vsx
 6QP9CVNr4BB6mPNOSX7v9iXPKUjvOh3bLJM2+BmpdTx2AbF1t5OWC1IxcXzAHNIK/QXfwk
 Iw/TBu1rcJKtzhh/ZLIu/DfrJXWxQJzneTbe5ySfCR2W6iMq/wpA4k5nRULrow==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=QA0G+dvQ
Subject: Re: [Buildroot] [PATCH 1/3] package/libdill: autoreconf needs
 host-pkgconf
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

On Thu,  1 Jan 2026 19:00:43 +0100
Bernd Kuhls <bernd@kuhls.net> wrote:

> Fixes error during autoreconf when openssl is not selected:
> 
> configure.ac:119: error: possibly undefined macro: AC_CHECK_LIB
>       If this token and others are legitimate, please use m4_pattern_allow.
>       See the Autoconf documentation.
> configure.ac:127: error: possibly undefined macro: AC_MSG_ERROR
> 
> As it turns out adding host-pkgconf as mandatory dependency fixes the
> problem.

Ah indeed, host-pkgconf! Thanks for coming up so quickly with an
improved patch.

However, since when this problem is happening? Again, need to
understand if this needs to be backported to LTS or not.

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
