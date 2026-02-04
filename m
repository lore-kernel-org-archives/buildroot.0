Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFB88E95360
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 09:44:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 77A9060A96;
	Wed,  4 Feb 2026 09:44:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P9A0I7VHaQbe; Wed,  4 Feb 2026 09:44:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 771EB60A97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770198292;
	bh=kdxjxWMq3ghofMDLW5RD+0G8vR8Gpe1JrQLYxPyr0iM=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=KRN+RsGh8Wx2DXk+MlRUg9drjKXPJI3A/AxNpWQM9OAej1xq/8IgLbA1D2fZIKGHM
	 9Rj0/Q9tKsXw1oOHNM8EvrgRreoCXIhgHZcp627IHQVCIe0yc8AErvNr9XNwMyRp4J
	 TOxE6FDuUaCZHHrfPfXjjfNU46+a+8TOmeWvykbFq+x9lTifgUtqRLmIJ3Q/CZCdd9
	 LHQlWrzdKQxhFlLsT/CsRXu/kkPZISjigFMg0pZx1xPTzKL0Sb/o00eZVvQBXv4wIH
	 UMi4oVZu35HJKFptH/0Vm1eREr7codG+xeFJBGi8f+mID2/4kootyR+2sGJ+PG785/
	 BME7daU/d5fDA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 771EB60A97;
	Wed,  4 Feb 2026 09:44:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 08B8EF4
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 09:44:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0FD724016B
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 09:44:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bU7dzZTcWj9E for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 09:44:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1F2FE405DF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1F2FE405DF
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1F2FE405DF
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 09:44:48 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 53346C24396
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 09:44:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id B8F4E60745;
 Wed,  4 Feb 2026 09:44:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 007AE119A865B; Wed,  4 Feb 2026 10:44:44 +0100 (CET)
Date: Wed, 4 Feb 2026 10:44:43 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
Message-ID: <aYMU7NzwgpBgoxP4@windsurf>
References: <20260117102622.51274-1-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260117102622.51274-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1770198285; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=losY46CvbM7+3jCnxNWQTKxkNn3HjrKx2J2dE/K9dTg=;
 b=vBG1tN9pCWmpVKQwmFsQqgiXtgA+Ji9vMEUSURsPpSAlDm745YJKZ7M9WQIcbU2LZkFiNY
 +PmAIwQOgYnnkdrRmDwT5XiUowLw1B0dA3UxlFgAmVS35D+9XLsGdlzEI5WxHVpvX1/22S
 KNefC8cNkUeKF/45OUj3HTMn99wSItyrnDiD0QtINY7G9qAlrSH0bg81biQk44BnU68dID
 nFBJnxhkDGedOLz7s6hfBeKPGdWniGcmu12YSsyImnZu0S2bJQo7I77TQNu6RhUrSOgP82
 VA9H72Qy+hmtzSn4Ut6pQtyIzDk8eiz85Uh8pN98uPg/XXjb9yW/oOebKlvRQA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=vBG1tN9p
Subject: Re: [Buildroot] [PATCH 1/1] package/openobex: fix build with cmake 4
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

On Sat, Jan 17, 2026 at 11:26:22AM +0100, Bernd Kuhls wrote:
> Fixes:
> https://autobuild.buildroot.net/results/258/2589f75f7415cd1a2fd7cf83c6166c900b03cce0/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied, thanks!

> ---
> Please note that the patch contains crlf line endings.

I missed that note initially, so I had to do a fixup patch to get
things correct. Sorry about that :-/

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
