Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B06C7C3DA64
	for <buildroot@archiver.kernel.org>; Thu, 25 Jul 2024 16:39:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 77D9E409CB;
	Thu, 25 Jul 2024 16:39:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fa4wmEMKYWFV; Thu, 25 Jul 2024 16:39:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6DC2A40968
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6DC2A40968;
	Thu, 25 Jul 2024 16:39:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E7BAE1BF330
 for <buildroot@lists.busybox.net>; Thu, 25 Jul 2024 16:39:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D728340EB6
 for <buildroot@lists.busybox.net>; Thu, 25 Jul 2024 16:39:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9FRQl2C-PopS for <buildroot@lists.busybox.net>;
 Thu, 25 Jul 2024 16:39:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A583B40EB7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A583B40EB7
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A583B40EB7
 for <buildroot@buildroot.org>; Thu, 25 Jul 2024 16:39:33 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5DC8F40003;
 Thu, 25 Jul 2024 16:39:31 +0000 (UTC)
Date: Thu, 25 Jul 2024 18:39:30 +0200
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20240725183930.5384a853@windsurf>
In-Reply-To: <20240725153029.613254-3-giulio.benetti@benettiengineering.com>
References: <20240725153029.613254-1-giulio.benetti@benettiengineering.com>
 <20240725153029.613254-3-giulio.benetti@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721925571;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ASOXDz6gM6BCFaQVF/wV8WFgd2aGP/vFHyP4jQpVIq8=;
 b=n0ybXt5WRU2LBallpUUBSrlsSlOGpwIksvYa+hbnK5QTeQ2ieB7ajkW14zZzGQSHgVh/yr
 uSWyPWwSmct32R0sDQuQNQvT4EGF+qjMs1ezYLL/UAYWeScO6ECFjJFHxW8Q0+XJLBy77a
 08aIresZV5y3MDCcIeAAwz0jvZRn/29Jm6AcpCB8IOLgPH+5qGY6uVJ0l/ZHyZCp+Ek2Ea
 R2ZZubfeCcYe4vM6VRVBzSIxc3RH9tZbvqw2fhymzMGRuRgEQ6rpAJ7cPRserTFUU+TQPD
 uVmGgEQ7XrHqEF6l32POkYtnvnQ6Z+wbSRlYF4M9y5nVH7KhMZwHctbluXKHBg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=n0ybXt5W
Subject: Re: [Buildroot] [PATCH] package/libnss: bump version to 3.102.1
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 25 Jul 2024 17:30:29 +0200
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  package/libnss/libnss.hash | 4 ++--
>  package/libnss/libnss.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

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
