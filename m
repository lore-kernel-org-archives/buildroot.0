Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F446C4828D
	for <buildroot@archiver.kernel.org>; Wed,  7 Feb 2024 15:19:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E53FD80BB4;
	Wed,  7 Feb 2024 15:19:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id k8_66mgDg6N8; Wed,  7 Feb 2024 15:19:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0442D80BC8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0442D80BC8;
	Wed,  7 Feb 2024 15:19:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1CADC1BF471
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 15:19:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BE73C80B75
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 15:19:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uFNAhFxlQFsq for <buildroot@lists.busybox.net>;
 Wed,  7 Feb 2024 15:19:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A3C7180B4A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A3C7180B4A
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A3C7180B4A
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 15:19:22 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D90F32000D;
 Wed,  7 Feb 2024 15:19:20 +0000 (UTC)
Date: Wed, 7 Feb 2024 16:19:20 +0100
To: Romain Naour <romain.naour@smile.fr>
Message-ID: <20240207161920.61fb7da9@windsurf>
In-Reply-To: <20240206124947.1617078-2-romain.naour@smile.fr>
References: <20240206124947.1617078-1-romain.naour@smile.fr>
 <20240206124947.1617078-2-romain.naour@smile.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1707319161;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=n9xouP//F+YXtnBrkdei2dn46XYRYAqjG8tAkFnsXko=;
 b=lcdTO37SUjcr2m6dqZi8gYkULGluvn/t8h4ypM0NO0cNBG8J5gWVUkJkVWXAj2nDulO6i7
 NZLLX0Pvmsbi7ZHeNE9POsdVwQrukh1OqH8qYN57cuMOOtDh10my2zzVLtsE1w3Fxe5HWM
 2/nphxhWimG4Ox40wDAkSg+iYOwFpEcWoI/pvVklzDufuuK1Yg3xjSV5/12Vi3yUpdoKom
 duDttmdJa1Cqjm0E0nymeG7wqMFZb2+d7yuNkGDxNlACN89Wr8xyU72a9XHHcRcFJKXkri
 gV4R+4DvNGlQX64yCmmLdjV+KbAuWs16Yppu9XrG9XhCFxh2fyd8RyS4JFDuUQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=lcdTO37S
Subject: Re: [Buildroot] [PATCH 1/2] package/mesa3d: fix drisw build without
 dri3
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

On Tue,  6 Feb 2024 13:49:46 +0100
Romain Naour <romain.naour@smile.fr> wrote:

> mesa3d 23.3 added dri3_priv.h header and dri3_check_multibuffer() function in
> drisw (part of swrast gallium driver) that can be build without dri3.
> 
>   i686-buildroot-linux-gnu/bin/ld: src/glx/libglx.a.p/drisw_glx.c.o: in function `driswCreateScreenDriver':
>   drisw_glx.c:(.text.driswCreateScreenDriver+0x3a0): undefined reference to `dri3_check_multibuffer'
>   collect2: error: ld returned 1 exit status
> 
> Add HAVE_DRI3 guard around dri3_priv.h header and the zink code using
> dri3_check_multibuffer().
> 
> While testing again the TestGlxinfo runtime test, a new unexpected error line
> appeared in the glxinfo log:
> 
>   MESA-LOADER: failed to open zink: /usr/lib/dri/zink_dri.so
> 
> mesa3d try to load zink gallium driver even if it was not enabled at
> build time, indeed there is no such option in Buildroot.
> 
> Apply patches sent upstream:
> https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/27478
> 
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/6093854455
> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>
> ---
>  .../0006-drisw-fix-build-without-dri3.patch   | 58 +++++++++++++++++++
>  ...on-t-try-zink-if-not-enabled-in-mesa.patch | 42 ++++++++++++++
>  2 files changed, 100 insertions(+)
>  create mode 100644 package/mesa3d/0006-drisw-fix-build-without-dri3.patch
>  create mode 100644 package/mesa3d/0007-glxext-don-t-try-zink-if-not-enabled-in-mesa.patch

Both applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
