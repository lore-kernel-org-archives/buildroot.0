Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C27FCD2447B
	for <buildroot@archiver.kernel.org>; Fri, 11 Oct 2024 06:30:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6BA3A82034;
	Fri, 11 Oct 2024 06:30:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wYZgzv78HBjp; Fri, 11 Oct 2024 06:30:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 55CB881FBC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 55CB881FBC;
	Fri, 11 Oct 2024 06:30:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BE4851BF385
 for <buildroot@lists.busybox.net>; Fri, 11 Oct 2024 06:30:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AD05141525
 for <buildroot@lists.busybox.net>; Fri, 11 Oct 2024 06:30:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TYyHqv65d0Zw for <buildroot@lists.busybox.net>;
 Fri, 11 Oct 2024 06:30:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 30DD441521
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 30DD441521
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 30DD441521
 for <buildroot@buildroot.org>; Fri, 11 Oct 2024 06:30:37 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DED53240004;
 Fri, 11 Oct 2024 06:30:34 +0000 (UTC)
Date: Fri, 11 Oct 2024 08:30:33 +0200
To: Drew Traft <dtraft@gmail.com>
Message-ID: <20241011083033.43de7ed8@windsurf>
In-Reply-To: <CADdAThchVWBsrNOa08HS6DR3oAUQO_KprRCkVxttrg0rSSCnbA@mail.gmail.com>
References: <CADdAThchVWBsrNOa08HS6DR3oAUQO_KprRCkVxttrg0rSSCnbA@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1728628235;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RUNaiufugktbqR644C1idLhBXq8PvKP+Q7RPDpdToKs=;
 b=Ya4oGtuBRRRQ9IaBATmLlXtU7Kc38MzE1QTQ2ewkw9eSeBREtgb8e29vMsUEqpnNVZziwp
 25GtmyHjgNd3gtnLCF5LiIVlZRfL9sX+LLPWABkbWLYJzYvfaLk26gbH/718prOoRfQ1TH
 5y5TLkviGa2aMqNV8xNcKaH+//cuOq/hWZr9/70MyJ5WtNYTqXOqF/xct+yVQZYL3ltHXF
 35ca02aDlG32Bxe91B8rruX7hbKoYS8GPUFLHwhDpOT6oIISQQmoVkRRynlqfhENv5v+AA
 t/3KPDqH8khnWVy+yvaqyuYZl2ovzzCgI3GMOhEyftM2ZejRvhTDJB73EQHqwQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Ya4oGtuB
Subject: Re: [Buildroot] [PATCH 1/1] package/fbv: update site to
 sources.buildroot.net
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 10 Oct 2024 22:17:51 -0400
Drew Traft <dtraft@gmail.com> wrote:

> This change was necessary as the previous url is no longer active.
> 
> Signed-off-by: Drew Trafton <dtraft@gmail.com>
> ---
>  package/fbv/fbv.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Thanks a lot for your patch! However, this issue has already been
solved in a different way, in commit:

  https://gitlab.com/buildroot.org/buildroot/-/commit/c7109e265cb6c179dd51a02637bb5f97f4767d21

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
