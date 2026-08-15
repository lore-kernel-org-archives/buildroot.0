Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F18DC5AD5A
	for <buildroot@archiver.kernel.org>; Sat, 15 Aug 2026 19:37:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D6F7E40809;
	Sat, 15 Aug 2026 19:37:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id frn29CSYRw_a; Sat, 15 Aug 2026 19:37:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1BC2C406B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786822641;
	bh=g6uWe5MiPxhSSKJkD1hWSXLj1LVxlyv7YS4M2i50LD4=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=oOVtvJ1HtNw07xRgX/fZN56ZQW1FWRF24nYxhkxuqyujkK+q0LErHTavGfyJZ0rui
	 myONNutyH7pJyyScBeIYQ7b8ufYI7aal2adqjYE8w0rhUTQMO5yEwbWhB1iVWwVFms
	 elBQqr3dR1D30PzavmALswXXqkzBBjnGMZ3HrdKA36IYgdtKulrSwZK0P6Yem/Xu82
	 9z6QCZrq12fk9AWndVw/f74tQ+2yoX1GiabzyS2+a0WXJ3WTx392zH4Hng4TvK349m
	 oj8tK5Y4IlXQPItJYcMqREF6m3LCUDbsOQescsic9FZFWZ7XgQXoPO/R9okA4ZhbVa
	 abAkpVQ7hPO5g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1BC2C406B0;
	Sat, 15 Aug 2026 19:37:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id BA0EC109
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 19:37:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A8720406B0
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 19:37:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lZs0_8gSDOvq for <buildroot@buildroot.org>;
 Sat, 15 Aug 2026 19:37:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7F915406A8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7F915406A8
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7F915406A8
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 19:37:17 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 61C094E41251;
 Sat, 15 Aug 2026 19:37:15 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 1EB5E604AA;
 Sat, 15 Aug 2026 19:37:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 8A2F211C4F661; 
 Sat, 15 Aug 2026 21:37:08 +0200 (CEST)
Date: Sat, 15 Aug 2026 21:37:07 +0200
To: Andreas Ziegler <br025@umbiko.net>
Cc: buildroot@buildroot.org, Marcus Hoffmann <buildroot@bubu1.eu>
Message-ID: <aoC_d9SXLJGYRqR4@windsurf>
References: <20260709110822.305873-1-br025@umbiko.net>
 <20260709110822.305873-3-br025@umbiko.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260709110822.305873-3-br025@umbiko.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v2 02/11] package/mpd: remove duplicated
 dependencies from sub-options
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

Hello Andreas,

Thanks for your patch!

On Thu, Jul 09, 2026 at 01:08:06PM +0200, Andreas Ziegler wrote:
> After various updates since version 0.20, most dependencies placing
> restrictions on sub-components are now superseded by restrictions placed on
> MPD itself. Example: io_uring needs kernel headers > 5.1; MPD needs kernel
> headers > 5.6.
> 
> Remove dependencies from sub-options if they are already imposed on MPD. 
> 
> Signed-off-by: Andreas Ziegler <br025@umbiko.net>

Actually the general policy in Buildroot is somewhat the opposite of
what you're proposing here, even though I admit our general policy may
not be applied anywhere.

The reasoning for this policy is that it is either to review/verify
when an option "select" another one, that all "depends on" have
properly been replicated. Yes, this means potentially some duplication
of "depends on" between the main package option and the sub-options,
but it also allows to ensure that if we remove/change one of those
"depends on" from the main package option, we don't forget to have it
on the sub-option.

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
