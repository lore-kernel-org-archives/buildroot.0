Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91DE2C4828D
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 15:22:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 41556415A3;
	Tue,  6 Feb 2024 15:22:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 41556415A3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hHjWllZKJrcg; Tue,  6 Feb 2024 15:22:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 379FC41681;
	Tue,  6 Feb 2024 15:22:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 379FC41681
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6F7F61BF215
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 15:21:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5D5C382A17
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 15:21:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 68FSfwOwcmVm for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 15:21:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::221;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 52E44828EF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 52E44828EF
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 52E44828EF
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 15:21:21 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 73C4224000C;
 Tue,  6 Feb 2024 15:21:18 +0000 (UTC)
Date: Tue, 6 Feb 2024 16:21:17 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20240206162117.2755729b@windsurf>
In-Reply-To: <20240110051321.1132678-1-james.hilliard1@gmail.com>
References: <20240110051321.1132678-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1707232878;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H071L4bblnrcjSSihGmFliZlHSadPoSv3iXECjUQdC0=;
 b=N8hV1QeO1VZYEJbFU42q+8vx0N9nxbrqWaeqv+8nlYQag83iNjdiq6H4+tDuj7atR+E2wZ
 9PbsyBj7LkS+nuDYHyeZ21NQ6Rz0JoBMgTOUBgLsLc/oMV9byid6J8jRlBn41run/+qWMq
 fFipd0miN1/MjlFATf4OQBt4q+eoxegE2AxY6FRDCjKWLSFU1h0DnTa1gFFmsJL+Rbg7kx
 zJV+hSYXz/G/DXJ3v8lobu3RWWujCHqJrVo73XCAmNkvVO3N+h1Olmkk2yL681zQW33LW8
 EwxyDL4b3GdwVRhHUpuxE4VcvRbPdXxNviqMLmwLGMgwRNtgA6ZzB/epe4nkjw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=N8hV1QeO
Subject: Re: [Buildroot] [PATCH 1/1] package/python-pyicu: bump to version
 2.12
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
Cc: Bernd Kuhls <bernd@kuhls.net>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue,  9 Jan 2024 22:13:21 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-pyicu/python-pyicu.hash | 4 ++--
>  package/python-pyicu/python-pyicu.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)

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
