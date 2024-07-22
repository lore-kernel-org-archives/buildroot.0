Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B9FBC3DA5D
	for <buildroot@archiver.kernel.org>; Mon, 22 Jul 2024 16:23:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 546294029B;
	Mon, 22 Jul 2024 16:23:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ILbA9aEEsPfw; Mon, 22 Jul 2024 16:23:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 25F904021C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 25F904021C;
	Mon, 22 Jul 2024 16:23:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B418A1BF95C
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 16:23:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9BA314054A
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 16:23:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rH7XJBiEaZ2N for <buildroot@lists.busybox.net>;
 Mon, 22 Jul 2024 16:23:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5120F40320
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5120F40320
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5120F40320
 for <buildroot@buildroot.org>; Mon, 22 Jul 2024 16:23:50 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1E8D9240002;
 Mon, 22 Jul 2024 16:23:47 +0000 (UTC)
Date: Mon, 22 Jul 2024 18:23:47 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240722182347.1bac99cb@windsurf>
In-Reply-To: <20240722131750.519333-1-fontaine.fabrice@gmail.com>
References: <20240722131750.519333-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721665428;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oyfoyQbSC90Fsm52+6lfjUb8N3pzm8suHzpLu/rGWgc=;
 b=hw+112d118KMgZIwMIffU6grFLfBOrNBgO0v2VehLcwPSFtEu3v4GjbnzrwfheyNI7Pjgv
 7djdruIopZYMy1zx3cSB3akPC8yRqQ4ImwSIYopgmmpMPiOv8Ooy+maTYtVofSdf5zniH4
 DRbGshEdQSKg2+yI/ZHlsi9NB6r1fEezjHS+PLo4rF8qZWYbjAz8CZHBStP800AAzVjGZv
 oy/lHiyI2tHb5TdeQxS74woXd8LC+vxPXUxiWTfmSPhaKEpJ1IjOV6Z90OPtyMENvFtqGl
 DyA64+NjBbuXo61ojJFgJcZVJ11ZMPryxk2Z98x63LbDCMVRoflR0OvFXzlk3g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=hw+112d1
Subject: Re: [Buildroot] [PATCH 1/1] package/pkg-meson: support building
 both libraries
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 22 Jul 2024 15:17:50 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> meson supports building both libraries (i.e. static and shared).
> This will avoid the following build failure with flashrom and
> BR2_SHARED_STATIC_LIBS raised since bump to version 1.4.0-rc2 in commit
> 8637884057ddc3c1aeb9f0dd285fc6fcf378c26b:
> 
> ../output-1/build/flashrom-1.4.0-rc2/meson.build:18:2: ERROR: Problem encountered:
>     Cannot build cli_classic with shared libflashrom. Use \'-Dclassic_cli=disabled\' to disable the cli,
>     or use \'--default-library=both\' to also build the classic_cli
> 
> Fixes: 8637884057ddc3c1aeb9f0dd285fc6fcf378c26b
>  - http://autobuild.buildroot.org/results/6d484857ff1674bf81986505827e54f3f1b9aaec
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/pkg-meson.mk | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)

Applied to master, thanks. I'm guessing this could cause a bit of
breakage, but let's see how much :-)

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
